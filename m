Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB17548F58B
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jan 2022 08:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C77510EEE1;
	Sat, 15 Jan 2022 07:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC8B10EEE1;
 Sat, 15 Jan 2022 07:02:38 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so24425661pja.1; 
 Fri, 14 Jan 2022 23:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mqpF8BmL+D8ySHQ8HdO4dmpXZkNxvy3zHZ5nkJG5RfQ=;
 b=TbK944vTXTdEwPsFKOYqfD7tBmfL8PCwX99bNKK0lotwCj63N6DUo05XDfvk0jCO/A
 jZpTjtByDW46zWrFU56lG3JCBoW2DDEuCSk/o1LVAdpVq8DdSFS1qs6BY72ceUdwCiD7
 ZpNi9B+fhPmPJHiU6N6lFOF0k6O1qjzrwGdmsltsLjg2JN2zx7syv+4qETDiBaJxPLDZ
 8+H9ZT3OS5bsrEBhs76QAzTQByK8pehiMcPwnQBfDmuIN789TXfeQMbkxAUPhXwKsupH
 01/d21tFaJfXdzEm/dI3ct9LXFI31FZqqgcJt9TX4sFqV4AOa1MjLGaY6t/LVFhCjOvk
 VICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mqpF8BmL+D8ySHQ8HdO4dmpXZkNxvy3zHZ5nkJG5RfQ=;
 b=yl/qvj0evBIlEsiagXPDQLG5VZdE+e0F1Mccmvu1E7UwMfx3b1Pxb2QCR58opYyd/b
 /xNELZkwtDcRbIggSFkRIRlMdJaeJV3LLOV138iw3bI7CwZcaGGGGBpmt/lKJGxXl7l2
 Z+U9QTwywpeZSVZySL5grnlN/usef5CAG7ErFkv2H1uJw+hmqiVWWj3VGUCuR3MFz3Uv
 2saNBubM/upZyORKifzjmoK0dOUNV2z6PQ2JoJJRqGim937AZQDTX0wZlNZ4GqIzEK4Y
 cP+2aaFcw60m2pex9jIs+gkGdgmHKGo9x5SGUD5MKiPosb9jPJ9OhtWn1mnzeC2esp/u
 dB+Q==
X-Gm-Message-State: AOAM5307pLBxaYX39mlAmnSXfnAcpptr2Z+oFnw4ddi/PCiNyrp2fUvW
 YcnLK9euET1LynwdZ8Gh7jg=
X-Google-Smtp-Source: ABdhPJxfclDoOikdDw14Ze4UiSx3vPLmUkDWFC0ENU8j0guatbP4J6JTvqDvrRvoO3lkLvaNKYmxtg==
X-Received: by 2002:a17:902:e544:b0:14a:555c:add3 with SMTP id
 n4-20020a170902e54400b0014a555cadd3mr12591881plf.102.1642230158467; 
 Fri, 14 Jan 2022 23:02:38 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id e5sm6694600pjr.53.2022.01.14.23.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 23:02:37 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: remove duplicate include
Date: Sat, 15 Jan 2022 07:02:02 +0000
Message-Id: <20220115070202.850676-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Philip.Yang@amd.com, Oak.Zeng@amd.com, tzimmermann@suse.de,
 kevin1.wang@amd.com, airlied@linux.ie, Felix.Kuehling@amd.com,
 Xinhui.Pan@amd.com, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 jonathan.kim@amd.com, nirmoy.das@amd.com, dri-devel@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

'drm/drm_drv.h' included in 'amdgpu_ttm.c' is duplicated. It is also
 included on 53 line.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 953d68b26f0b..ebd40d1a8aff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -43,7 +43,6 @@
 #include <linux/sizes.h>
 #include <linux/module.h>

-#include <drm/drm_drv.h>
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
--
2.25.1


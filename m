Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF1649F43E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 08:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37AC10EBA7;
	Fri, 28 Jan 2022 07:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F7010EBA7;
 Fri, 28 Jan 2022 07:19:54 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id i4so4562428qtr.0;
 Thu, 27 Jan 2022 23:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0l1WhmeXUHVNto/szOni73pQDPwQLfU9rXUEAIxIulo=;
 b=UqE/xve7ob4iUosGLkLnnGanDqYXo2MvlRmysmzpH3702bfDBNuh8UXnKVBDmpU1+o
 ZQLVbgh2TSWrF2lKiG+zjBbxNlE+JIPkKoUn2SnaV9iOUPkn8daiYAcK2evhUG6zIlqo
 5Y4Er/PkrbSTgeFljL+puqSgKg9b9qOT7XOQp+TXPfeDTIGtrCEEdB1oAthBGVKu2KAv
 I2Mj4nWHTncPq8RSKuWLyT7wD3bFqWY8LfbaI5wLs/XDrwZ+vvnUptyxEcuOJPuQUlD3
 5Yivzlw3qqadkeuvx/rzrg6TwbMpLp1H/NLNo6U0T4iTG8eDq4WDfUhjYu4lLzSuIt8K
 cCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0l1WhmeXUHVNto/szOni73pQDPwQLfU9rXUEAIxIulo=;
 b=eMlrNj/0tUgQQE+x/xpsOYxqfWYV6MqFpHlUV80gWUXRHdTGqXGJDDAkJ5ANbqHvI3
 IB8rWQEQtOTTekcm1VDmm7bBTJCBvToIprfWYZ9XZ4qMTc2XnJpC/apdEfqa4mwLh22r
 S8ki4fVeLXibg8q0HuNvkEdcrB9c+AYWMU56y4A12FF5+K+a7BAkYO8as7GX13wLqSb7
 5jlzfYEeh9zw59Hag3kePBzmVnNxOPx9u5J01wfkYRbnqDIfFtk8wzoTMb1pE5sAeuWh
 uxMFGSd7mqnBu8N0KWcES7yKKGfobc9kslGglnJCdmmtGInadEExMeClmica2NB/JoiJ
 tiKw==
X-Gm-Message-State: AOAM533eFCRJk+Cp5zJACUQRwSbBDlnzWCtzXG83XeZ41PWuY7Nzo2Hv
 dxpW4nG2ZavOZyqgRskwo0I=
X-Google-Smtp-Source: ABdhPJyK6kIpqKiestuok+P9CdtwOtVWZWiqmr32VVy1ITQPs/f3gQ0QrTdwO4N2V+2Dh4gXrO9BoA==
X-Received: by 2002:ac8:7d13:: with SMTP id g19mr5199123qtb.590.1643354394076; 
 Thu, 27 Jan 2022 23:19:54 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id o21sm2661818qtv.68.2022.01.27.23.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 23:19:53 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: evan.quan@amd.com
Subject: [PATCH] drm/amd/pm: remove duplicate include in 'arcturus_ppt.c'
Date: Fri, 28 Jan 2022 07:19:36 +0000
Message-Id: <20220128071936.1210682-1-deng.changcheng@zte.com.cn>
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
Cc: lijo.lazar@amd.com, guchun.chen@amd.com, airlied@linux.ie,
 Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org, darren.powell@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, david.nieto@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

'amdgpu_dpm.h' included in 'arcturus_ppt.c' is duplicated.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
index ee296441c5bc..709c32063ef7 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
@@ -46,7 +46,6 @@
 #include <linux/pci.h>
 #include "amdgpu_ras.h"
 #include "smu_cmn.h"
-#include "amdgpu_dpm.h"

 /*
  * DO NOT use these for err/warn/info/debug messages.
--
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB8F49F3FB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 08:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E162B10FA85;
	Fri, 28 Jan 2022 07:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0246310FA85;
 Fri, 28 Jan 2022 07:05:34 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id o12so4809418qke.5;
 Thu, 27 Jan 2022 23:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHLbWiRVBsn87OEDSHKBtxozoDmuxOvqHTO93YKujuA=;
 b=p9e+0lOdrmQSmOrNtBwzqY6EvkM1VH+bwVG+H6TUuKh+3mXIrOjbJd7ov/IJdrSqj1
 +3O/AcA6nqBvee18S1J4NwyhPhALJCGw179DiC+tWJ4TRn6nOIOiNL7t2qe4K2HYpfK3
 FPt7gWutc/KcadXm9IFeYn1nUQovcPnvE+N9vGdZZD/KRj1RUYL9EpCjM7c/4HIT/k0Z
 UBFvQM47+XB23emUyIdnerqwwXo/VNHUJNTlj4Jcd7FH39WGVR4Kd9VBByDD+ekxlr9l
 ygPqD8buMH2c/W9XMSFWDJHUBoMxdj9bOdpsx9riTJSImvnP9AS46EO+yXPOmNE2hwDB
 vh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHLbWiRVBsn87OEDSHKBtxozoDmuxOvqHTO93YKujuA=;
 b=MA4ok/hEboo1qA/qEahmFy1Vq55a6FS9o/ZjjTvjzNl//AIQivuJvF3znBdPdQlNiK
 OiVrfhxOUa8Goua5mf0znMgSlDE/hKEddyaL5IDat2ta0BjDeehC6keckLA8G6FQcEDT
 qtfAg+X04mFWNQq2WH/xuPY5PfX26nGF6UoX80AYgQX2W4W38sHpMX2et3DVX2NfQ7dJ
 iV/78h+CAW3Fr9BQIMx4liJj1zzzO/X8L4VazmOQzTnaAbMwd81OniiwaTzbmotSORZo
 ZmQQZ5D+jwIsI432wzucTRNqagAqC2gMkTbPnkFACQkoHvq/B6PmhU4ZGq7HEGJiy8II
 gY5g==
X-Gm-Message-State: AOAM531ACmi0+anRsXmOEl8BxZmILPopeCX+qOsiFkaE6EwJsure0VT2
 mI9XueDs2/FSsvaH5y55Z6A=
X-Google-Smtp-Source: ABdhPJzKObe7p854Wgn8CoPIHd6YoM8+sHDl/QXDiiCv7vlv+XyNBuBuMfU9W8OXx/c2yrBx8rts9g==
X-Received: by 2002:a05:620a:3cf:: with SMTP id
 r15mr4978842qkm.158.1643353533836; 
 Thu, 27 Jan 2022 23:05:33 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id s11sm2577422qtw.2.2022.01.27.23.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 23:05:33 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: remove duplicate include in 'amdgpu_device.c'
Date: Fri, 28 Jan 2022 07:05:19 +0000
Message-Id: <20220128070519.1210105-1-deng.changcheng@zte.com.cn>
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
Cc: Jack.Zhang1@amd.com, lijo.lazar@amd.com, airlied@linux.ie,
 Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, shaoyun.liu@amd.com,
 dri-devel@lists.freedesktop.org, evan.quan@amd.com, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

'linux/pci.h' included in 'amdgpu_device.c' is duplicated.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index dd5979098e63..289c5c626324 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -56,7 +56,6 @@
 #include "soc15.h"
 #include "nv.h"
 #include "bif/bif_4_1_d.h"
-#include <linux/pci.h>
 #include <linux/firmware.h>
 #include "amdgpu_vf_error.h"

--
2.25.1


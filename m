Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340871665BD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EBD6EE24;
	Thu, 20 Feb 2020 18:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B5D6EE24;
 Thu, 20 Feb 2020 18:02:30 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id dw13so1194933pjb.4;
 Thu, 20 Feb 2020 10:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ftBWuGNfX8JZVFhSKwA+KUVSKGZwfK/v4xpQCMt5JjU=;
 b=Z7GTb5OmY58dJNwVcxhr2Zj89JXbSLjrDt4/98xY5f4eLOjssVN04Amn+cXaYaGh5l
 DqGzKkLXy6FQdjPU5cvEewJ6TExOsg4coQmE8aLyUVNiZJeKgREQ+EioOVrzQafZWyNX
 wNvlAJ5Fb9NdNKVQ2I3U1JQne5b6IWABjyuRdWxbKtJQ4G74F9KFxf5vOCsvr/b0qplb
 +hwhkPo4ggypZi/5u5PXoEK2bsl6sK5/+2swDHR2TOMLOfl4pp+W/C1jTXyYfH5WCyBb
 NIlAzn4HpQm5ASJ6q5OHtRY32pO3LRQSAlUXhWyTEECClcAPOwqaIqQ4Ktfhudf/VTO2
 S/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ftBWuGNfX8JZVFhSKwA+KUVSKGZwfK/v4xpQCMt5JjU=;
 b=OfOcf1OPdISS4wPTm2Wx3Xujb7gNhC1m+sAtBnKY494NRLvUKrRbj+HFs+w7dodF3Y
 EkpXgdkqaRSUqJ7ZZU+lCPjtZ0vDwStXYalJsrSCRFvgMwXGOoUA3X5IUnwSxtZZxMHL
 SAGAzoJnAsmCMxR+ycDbLfTDUW6uiaUYU5PZlzk+x3uV3e5XiOfYxFjD7smt1yeJ0RWZ
 0wfSYWMgfkgv+7/7BERHKLvj2tg5zBD8wrZLvtfQ6iGARdXrdH402W6g73sDhpeCgodC
 DtvMin7/aQjAf0UP/qDOqoa4//3sPTpk1zsQZZ1gxRj8TzXsO4jlV7a7zZuNQ6eIYBiT
 UiAw==
X-Gm-Message-State: APjAAAVI/af2zRpJ0AC8vWW0pd/KXrvdxUTer/nC46Y22fFxX2AtBWfV
 R0Pm7TYc1une08NBUT35cbOfd0o7
X-Google-Smtp-Source: APXvYqyP5wnC/UIA6uYZG1iIuCpdhd4BbS2S2UPeJf7Xo5CCRsLnOqSay/+AmWkBoDqxi6cI3omECg==
X-Received: by 2002:a17:90a:8001:: with SMTP id
 b1mr4948972pjn.39.1582221749423; 
 Thu, 20 Feb 2020 10:02:29 -0800 (PST)
Received: from localhost ([100.118.89.211])
 by smtp.gmail.com with ESMTPSA id l69sm2019pgd.1.2020.02.20.10.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 10:02:28 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: Fix CP_MEMPOOL state name
Date: Thu, 20 Feb 2020 10:00:09 -0800
Message-Id: <20200220180013.1120750-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 68cccfa2870a..bbbec8d26870 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -370,7 +370,7 @@ static const struct a6xx_indexed_registers {
 };
 
 static const struct a6xx_indexed_registers a6xx_cp_mempool_indexed = {
-	"CP_MEMPOOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
+	"CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
 		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2060,
 };
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

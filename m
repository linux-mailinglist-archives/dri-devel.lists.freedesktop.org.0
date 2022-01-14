Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF44C48E752
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 10:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9914710E1A4;
	Fri, 14 Jan 2022 09:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C24D10E1A4;
 Fri, 14 Jan 2022 09:20:43 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id w204so2247054pfc.7;
 Fri, 14 Jan 2022 01:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YZQzRd0VbsHaxIU7D4AnLPiXbe02LXZ3YxcKNl1VWjs=;
 b=M/Chg9dJUvN6qpMe7QDxhG5BJNbfonhu5GT5edcZRA303Hpvm+UqtZWaJF18LFT2WQ
 0E5ENZCjmCHR+b4P1e8/tD3VE+nETZUec2YXpgzwl6K5sSNxpZQaytp62yIUpMrFz6Ec
 qQz+X0JCLUn2mFKvy6vmkym2uIrHwv1ggDIdjajNSHpcIgG/3qtTTwkbXnYX1CQgaYW9
 qVRWkYvwtBLvahcAXfAAAPEPjXZWsqtC39Yc32Aye/E1vvg83XJ3QR6HCnKo9IGsClPA
 +1q0LsbCyhTLIfNYVB+ph3UDoqjXXx+SdWj2/OJzHLFmCqOXWHerlC5pdFshhgtwi+Gr
 D5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YZQzRd0VbsHaxIU7D4AnLPiXbe02LXZ3YxcKNl1VWjs=;
 b=d/UIhu5jAVIlS4A/eWeXDwmx3IG/mwUUt0sxZ4jIXzkFfIpG2APotfNdnwA6AvnVj2
 8KGj7Y9dffl8Ag41CK+CPGriRmt9lnL9+7owZ5F+E+xA9TDxrnBRxGs7C08GaII8GtCX
 oojKL2D/ldL2YlI5dkeNQyueJ/J4KZrOjmCTCMaeFYScxiYreB1PlTnOPhekj0P2Wo/3
 iHATr7XqF3D+ndwnnC+oe1c9FUQJKW2/9d73anqJLpCH6c+Zq2H75DqGI7mK9qCYPsXw
 NPG05VZM2yy9y3v9uoj7OrLOVITGZAwdoS3LW2cpbXchkULsPPN5uC628cxaeeW/x5aO
 oJjA==
X-Gm-Message-State: AOAM530ohfjFDJQQqnn/aMuIidQwwuvE7rUowXpXkzSC28LLLQtcC74L
 cFbWJ3zJ2aU895E3FY6IRU0=
X-Google-Smtp-Source: ABdhPJzJfL6+i3WmhTTXxXpgK015TbekEJWKbcNe5Th80LrYI8zFseczAP6kZ/styUT1miChQVgqlw==
X-Received: by 2002:a05:6a00:a20:b0:4bb:95f6:93b3 with SMTP id
 p32-20020a056a000a2000b004bb95f693b3mr8040040pfh.77.1642152043047; 
 Fri, 14 Jan 2022 01:20:43 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id y69sm5110374pfg.171.2022.01.14.01.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 01:20:42 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: evan.quan@amd.com
Subject: [PATCH] drm/amd/pm: Replace one-element array with flexible-array
 member
Date: Fri, 14 Jan 2022 09:20:36 +0000
Message-Id: <20220114092036.766001-1-deng.changcheng@zte.com.cn>
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
Cc: lijo.lazar@amd.com, airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>,
 Xinhui.Pan@amd.com, deng.changcheng@zte.com.cn, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

There is a regular need in the kernel to provide a way to declare having
a dynamically sized set of trailing elements in a structure. Kernel code
should always use "flexible array members" for these cases. The older
style of one-element or zero-length arrays should no longer be used.
Reference:
https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/gpu/drm/amd/pm/powerplay/inc/smu_ucode_xfer_cz.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu_ucode_xfer_cz.h b/drivers/gpu/drm/amd/pm/powerplay/inc/smu_ucode_xfer_cz.h
index eb0f79f9c876..701aae598b58 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu_ucode_xfer_cz.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu_ucode_xfer_cz.h
@@ -121,7 +121,7 @@ typedef struct SMU_Task SMU_Task;
 
 struct TOC {
     uint8_t JobList[NUM_JOBLIST_ENTRIES];
-    SMU_Task tasks[1];
+    SMU_Task tasks[];
 };
 
 // META DATA COMMAND Definitions
-- 
2.25.1


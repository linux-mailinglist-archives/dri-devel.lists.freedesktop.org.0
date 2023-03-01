Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FF86A6A06
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 10:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F6010E219;
	Wed,  1 Mar 2023 09:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE86110E0AE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 09:47:38 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l25so12572732wrb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Mar 2023 01:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677664057;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K1pni8PEkrIGMBG+jXk+bVH6dacln+AXocrU2+hsam8=;
 b=LaJ7npUADITLVfxDj5CjFSESLEac57tU7PrtsB3MDvLyeucQh/8rn4py00CGBOX7Xq
 SI4zCnIpSoOo1D2X0Pmq0nxxf/IEJkIhbB1yULFW78IVzDypBR1iLHPsPNRwtgaMltIH
 3ccxW2i98kJRQMqHIXdGpU4pOUiISZ0W/Oy/DeGLOl5VMFJ4iGgqBsMrmwX588z1c2Ur
 mWH1HBZlav6W+/pIcqZAks0Swjw4azkcFQiAE5lSeAioYadhNEwd6y4HNAVkqqpb0Piy
 2OkSoBbeBtGtU5B0/3tLJPITkeivD7lDgbVpDBbcLwTpgtMfi6Y4rQxq2bXAVEihhpMQ
 AuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677664057;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K1pni8PEkrIGMBG+jXk+bVH6dacln+AXocrU2+hsam8=;
 b=SUtPNqRgiR0vciQvXCl8auLMOQ/OA0Y3phBQUKiSoRS7ByOwtOP0dMYBjwyNeiLrKS
 9QcRiSrG1oi90gJowhCTQbbcSrepbVmu2c34sgzFiBKMwTEsjVlY+0WbogkPkwtJYpbM
 89+7Lh2XSRdsBXegLHbPgqw+Q7eW5ZZSQuxVF+1qyMAN0pFTjivWUozrQD5MYtC4aOYo
 +mwkPIT+6fUa8WoGq94uE2Ub+LvCyHQdzjLTi15YOUTacvV79f0STqIZ34lwFbOcljrA
 iZv3M/LTz/yz2VtSinrkiz9HSyK4i5sMmB/QX0fkCwPtvluA94ECsry1cmxhNoz5e7fB
 ZKFw==
X-Gm-Message-State: AO0yUKXYtCi4QGIZcpyvmv77gq9VTrSGx3YhMZhr9FGGzxaYJSt1gqhj
 1HBKqSpz/VTHFIUH+ghzemRq6Q==
X-Google-Smtp-Source: AK7set+L+5GW0GgI9KztlmCUknRctTJccLaZrCPTKnfWNMHzWH7YoENj8bpyyBGhW0pO//0mMQZeBw==
X-Received: by 2002:a5d:6a85:0:b0:2c9:6b87:962d with SMTP id
 s5-20020a5d6a85000000b002c96b87962dmr4265353wru.15.1677664057170; 
 Wed, 01 Mar 2023 01:47:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 a10-20020adfe5ca000000b002c3dc4131f5sm11880701wrn.18.2023.03.01.01.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:47:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 01 Mar 2023 10:47:35 +0100
Subject: [PATCH v2] MAINTAINERS: Add myself as maintainer for DRM Panels
 drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230216-topic-drm-panel-upstream-maintainance-v2-1-ffd262b72f16@linaro.org>
X-B4-Tracking: v=1; b=H4sIADYf/2MC/5WOQQ6CMBREr2K69htaFdGV9zAsSvuBJqVtfgvRE
 O7ulxu4mMWbSWZmFRnJYRaPwyoIF5ddDAzqeBBm1GFAcJZZqEqdKyVrKDE5A5YmSDqghznlQqg
 nmLQLhaWDQajt1WhUjZXNRXBXpzNCR5yN3BZm79lMhL177+Ovlnl0uUT67F8W+XP/nV0kSNAoT
 X9XdaPk7ek5oXiKNIh227YvdFLT0fAAAAA=
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as co-maintainer for DRM Panel Drivers in order to help
reviewing and getting new panels drivers merged, and Remove Thierry
as he suggested since he wasn't active for a while.

Thanks Thierry for all your work!

Acked-by: Jagan Teki <jagan@amarulasolutions.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Added Acked-by from Sam, Thierry and Jagan
- Removed Thierry from maintainers list as he suggested, updated commit accordingly
- Link to v1: https://lore.kernel.org/r/20230216-topic-drm-panel-upstream-maintainance-v1-1-ae1cf9268217@linaro.org
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index be167c695c64..f8e1b80bf41f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7042,7 +7042,7 @@ F:	Documentation/devicetree/bindings/display/xlnx/
 F:	drivers/gpu/drm/xlnx/
 
 DRM PANEL DRIVERS
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Neil Armstrong <neil.armstrong@linaro.org>
 R:	Sam Ravnborg <sam@ravnborg.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained

---
base-commit: 9d9019bcea1aac7eed64a1a4966282b6b7b141c8
change-id: 20230216-topic-drm-panel-upstream-maintainance-6d5cae28d184

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


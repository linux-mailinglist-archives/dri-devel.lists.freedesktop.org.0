Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CADF86746E4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 00:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D9610E288;
	Thu, 19 Jan 2023 23:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D41510E286
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 23:04:22 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 g2-20020a9d6b02000000b006864bf5e658so2131398otp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 15:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I+a8us++zKCqwb90bOoz2QhCcN83KUtlRyH4tzf0Qzw=;
 b=R2lMKvx3yjc4Zbg85MDM/X6VRNai+OLurLQ9Y6g7WcdJz/HfcnHqzDwF60WHY5IyMM
 v6G1VwGQpJmSFbWmjpxj2PpD1uLbc4zbIUYHEgccxoilRVCXAy1PVT14v8EQwlUcfSyL
 PfmQS6t3k3npwYzAE17fc8QUi/Do6VxrganZcOLBqRqgFvWSxS5AB9lbWiG9Z9Hho3dq
 OQXDpPtI/VulWARdYf5PVbrQIyY6vGX7kn91hX8+q5d0PwRVnFYSpSb18buGikt/QLGs
 Nm5ubugYs+STsydVCj7+WtGTIaYNXo6MjspmTK2On9V7cblH+CbyLA4E7FF/jVh/eSBh
 UxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I+a8us++zKCqwb90bOoz2QhCcN83KUtlRyH4tzf0Qzw=;
 b=b07P+bLi4bTbfmuZ5xyEZ42JWqHLg/pviSzziGLkqG9PQmSculH49xvhRu4PYrd8/W
 ohTMnZ9eN4p5qX9s6pqMBGb9zGgLkWLbyHR6u7Cv/sCmIED2TM1mgmunKBM+Yumk7BjB
 JxdeyHADMg6Cdj+zTYspcNmerdbbX+wIQ8Yo8hSjkyFlU9Hu7QCHRxq+6hMFOvISiFV2
 ZjT3X/tRhXWNC5N8GmvJ9dZfelqDnxG3H65QjBHeVzoMOcgzY8MOvFghuBXblO3JyxcP
 URH1z0iMNtsz+nMwPh1UI/NdOiWVawgQ3LYQYHRM15nqMzAXgBYzGViMNNWixbPlP5/d
 caFw==
X-Gm-Message-State: AFqh2koFQVNcLO95GDy4Mp5JPlazP4mx0ecSEXSrG5NZNs2Jm0FJwTW0
 p2Sfpz6CNUWbe1UBSlYUjMcKyH4gpzI=
X-Google-Smtp-Source: AMrXdXvHQoRRaaAHU+VU9MnkgBvzK/W5AF92UBQ3EHQMfNj0yCZ0ivLeFnU0lsC24ASGwgFTLu/lFw==
X-Received: by 2002:a9d:805:0:b0:670:6247:fde1 with SMTP id
 5-20020a9d0805000000b006706247fde1mr6045593oty.24.1674169461645; 
 Thu, 19 Jan 2023 15:04:21 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 bv10-20020a0568300d8a00b00684e09b43bdsm9254034otb.13.2023.01.19.15.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 15:04:21 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: panel: Add compatible for Anbernic RG353V-V2
 panel
Date: Thu, 19 Jan 2023 17:04:14 -0600
Message-Id: <20230119230415.1283379-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119230415.1283379-1-macroalpha82@gmail.com>
References: <20230119230415.1283379-1-macroalpha82@gmail.com>
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
Cc: megous@megous.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org, kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Anbernic RG353V-V2 panel is a 5 inch 640x480 MIPI-DSI LCD panel.
It's based on the ST7703 LCD controller just like rocktech,jh057n00900.
It's used in a 2nd revision of the Anbernic RG353V handheld gaming
device. Like the first revision of the RG353V the control chip is known
but the panel itself is unknown, so name it for the device.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
index 09b5eb7542f8..150e81090af2 100644
--- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
@@ -20,6 +20,8 @@ allOf:
 properties:
   compatible:
     enum:
+      # Anberic RG353V-V2 5.0" 640x480 TFT LCD panel
+      - anbernic,rg353v-panel-v2
       # Rocktech JH057N00900 5.5" 720x1440 TFT LCD panel
       - rocktech,jh057n00900
       # Xingbangda XBD599 5.99" 720x1440 TFT LCD panel
-- 
2.34.1


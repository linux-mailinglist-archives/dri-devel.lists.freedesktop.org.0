Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA4E4003E2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 19:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1BC6E8B5;
	Fri,  3 Sep 2021 17:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F16D6E8B5;
 Fri,  3 Sep 2021 17:09:13 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id i24so1895895pfo.12;
 Fri, 03 Sep 2021 10:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I/HakU/xQi0Td8dZebodYGzBlv2Woc251Vz2DFo4gw0=;
 b=R0szjMUgdcaZC1u5B5l1wheNMw75oYaa8aQM3RQvVxuWKCeji/V89NkHW4Hf9sE81K
 Y4xCOx0cxYaR1Q6zsZ0tz473ii8act3nCj88Fl5uIELWYNQc+rWU4yRJYGvMGaElEAve
 7d2aPrcxshfCydxwTKgtIRGGyWGWshD7gsUUKRc3Cu2i/0e+l+JLMAz5YQSUUSnk6K12
 FU9XDegTQ5OXy5KopfK/AiuDuuPB7v1STfwMEeF3+wWrwRsuiFJpt+imT3H71UV94xPu
 nXL+17GEYjQB1VU4EYyLg+ITFGXQxMavHxhiv7EYKSbptLKFeCJEu2mj4h5sBcJmPKbG
 gusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I/HakU/xQi0Td8dZebodYGzBlv2Woc251Vz2DFo4gw0=;
 b=gUj9n0TpVl7eN3OAWTeiEynKEPeIDX1vYAHNFyEocZavrCHKrpXCHl1uWZatKsHP21
 OlqgDYabd5MARtZL3U+7ATENIqB+ADhoabLIL4FPD7yQnaYVaeFqWUOIF3D84Ah/JKc9
 er/yswmzksE/AUkTwECjwNaj7bkKgrlmc5QReSitsOq3GbGQ6StwQmUZ2MOrzjGPJDsa
 fraXgWDfSF2xAwye8e0XxPBfbjNFHym8IyUvTh45XogBpngOkt47+JUy8mwZ6gescYDE
 CNiPmchfDASHETRaonhzrXMbkbhEjKQADzR1sKMbCtcgBe7D7sqzXuSewCIZAqoU7Dkz
 j45A==
X-Gm-Message-State: AOAM53311SguT8VAmcdzX/EnQ7GmC+P7jaWFd4eoaiXLxQMe5KUvhRaM
 hpw5r3bHwqjHcAtpBnsRzMg=
X-Google-Smtp-Source: ABdhPJwIPT/yqSso0VyHNAgKuWvtrktY8i6wrUfZxtuUdW1xOtXlZ5N3g4qva1pp4kWi7FVHiB0LNQ==
X-Received: by 2002:a62:65c7:0:b029:3c3:4eff:1b26 with SMTP id
 z190-20020a6265c70000b02903c34eff1b26mr4166742pfb.48.1630688953260; 
 Fri, 03 Sep 2021 10:09:13 -0700 (PDT)
Received: from skynet-linux.local ([122.171.5.147])
 by smtp.googlemail.com with ESMTPSA id 130sm5905361pfy.175.2021.09.03.10.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:09:12 -0700 (PDT)
From: Sireesh Kodali <sireeshkodali1@gmail.com>
To: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Sireesh Kodali <sireeshkodali1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] dt-bindings: msm: dsi: Add MSM8953 dsi phy
Date: Fri,  3 Sep 2021 22:38:42 +0530
Message-Id: <20210903170844.35694-2-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903170844.35694-1-sireeshkodali1@gmail.com>
References: <20210903170844.35694-1-sireeshkodali1@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SoCs based on the MSM8953 platform use the 14nm DSI PHY driver

Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index 72a00cce0147..d2cb19cf71d6 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -17,6 +17,8 @@ properties:
     oneOf:
       - const: qcom,dsi-phy-14nm
       - const: qcom,dsi-phy-14nm-660
+      - const: qcom,dsi-phy-14nm-8953
+
 
   reg:
     items:
-- 
2.33.0


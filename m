Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B03C369857
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 19:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AB06EC2B;
	Fri, 23 Apr 2021 17:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9021B6EC29
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 17:28:23 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id e13so40511704qkl.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0dIM7Z+izOVG/oERmdhb/AMzsUaJVmcES7PVqS331VM=;
 b=apOR0knurXWFkWtUKkhaYdc0wvkv0INvP0vg2nRSRsUKi9dcrFP87lQjZqxyvrgqNI
 YwqkMrKG1/kahvSQV4MMcfd/RECKjK+QlxSPWgTMk55Hc+6o5P1BF5b0HaK6TzkTc2kX
 w0dft9Ljn6gOwIvMF4JyesNuF6FePqO6bpuqI382E4xW3hiZEQ/IQ01OpcER25BuJ86o
 jyr4QBKPZQRpBymWZFZtaCp6kDKtfJnv9jy9s+VHKC5P3jVp/hbeSt7J0NaEbmZHc6GP
 eaCteezieRkwN4rKLTAwMmyYm8+dahqgFTdoP+F3il1VAvmrCWiYh1NAET0y/ltSheTO
 RIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0dIM7Z+izOVG/oERmdhb/AMzsUaJVmcES7PVqS331VM=;
 b=tm06b63CxVOtqHulIDcWQmTC8b7hYYqbhsu8nNbBCy3ji7EoRhQYVYoyGb489G67ZX
 s5XuOp+ZHdq93Mq8svqk1hv8Fw1DTaQcuE60u/fcf8I5usvBO/WmbPpfKtbIeAZAsv3g
 FqFzpRDKW7VqNDk3iqb5Ch5PlY1XEyMMConDlk4K3MnaX/vMHTw1p38TzB+OzW4GuYiu
 0uF6jkwzjAP6V4xtuwljHt1Bf67e4lzKGDXSdv6KTW3Wm9rSa38NI8PFiFiCJLKNvUH/
 tufhL3VD/g9B9X5KkuBfZ6ph38HrQB5TZqvaKxHI9Jng71tv4O1ZLuf16RFWDsMKnweN
 CfOw==
X-Gm-Message-State: AOAM532R+OzMqlfInLMNkKAiNLtC/1MYg8k9mgmcH+j0IMR58VDvbf4O
 iEc77Z7jIDDOsnWUMdkaZBbufQ==
X-Google-Smtp-Source: ABdhPJxArxkdk3Sbb5pycb0lGdXVtFll8pGKYnMJCsR7OqSOwl+mhD2ZRyqP2CBOfxpc8LqVI+uXpg==
X-Received: by 2002:a37:a34b:: with SMTP id m72mr4953889qke.92.1619198902742; 
 Fri, 23 Apr 2021 10:28:22 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id y23sm4782627qkb.47.2021.04.23.10.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 10:28:22 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/2] dt-bindings: display: msm/dsi: add qcom,
 dsi-phy-cphy-mode option
Date: Fri, 23 Apr 2021 13:24:40 -0400
Message-Id: <20210423172450.4885-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210423172450.4885-1-jonathan@marek.ca>
References: <20210423172450.4885-1-jonathan@marek.ca>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document qcom,dsi-phy-cphy-mode option, which can be used to control
whether DSI will operate in D-PHY (default) or C-PHY mode.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 Documentation/devicetree/bindings/display/msm/dsi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index b9a64d3ff184..7ffc86a9816b 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -124,6 +124,7 @@ Required properties:
 Optional properties:
 - qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the LDO mode PHY
   regulator is wanted.
+- qcom,dsi-phy-cphy-mode: Boolean value indicating if CPHY mode is wanted.
 - qcom,mdss-mdp-transfer-time-us:	Specifies the dsi transfer time for command mode
 					panels in microseconds. Driver uses this number to adjust
 					the clock rate according to the expected transfer time.
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A10321C059
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 01:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB65B6ED98;
	Fri, 10 Jul 2020 23:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BFD6ED95
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 23:02:56 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id f16so3233612pjt.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 16:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=co3iFm8egyAhpjouB4wYZ2DsUz/fkVXl0yTaXVEDDSU=;
 b=l5ce6hjS0xdsv66VLkfTFe9rwljnNeJ2hAUFnEXltlcciTj3GGqnNyK32o3TZO5+uL
 hQu+6PL0ibJ1s2JdZyy9/nrbrSEwM2PdoIk8FFiIaYNRhJ1pg9Q1h6xsMGYxCxgIiy7t
 r7I75GuEvSq8lGjPgTHXgmf/mqfSk79NkurBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=co3iFm8egyAhpjouB4wYZ2DsUz/fkVXl0yTaXVEDDSU=;
 b=fhx5LlvVvuh2I7uX46kJkvieRl6Ecznbb8YSafG/2T6U2JfceeCLCXyigcu+7ZpzWH
 r/0bp2opfVqe54JFePPonXT6unNeXnEoHj85nm+lzDrtozE9YJs8eHf/RfqYssEW+rsn
 0J5JiWy26yu0tJeDewZ3ikb4Ew5OenZIPIsI6nBwsN/8rG0HSNwVz7djQtt2xMhZMcnP
 MFXz9rOJqyrvWYXWtnAMFl88tuxgImArPYZ1yauJAfC6AkZJ8RjYpL4PzZDYb2WVnHDH
 UM31gpTNDq10VN4CoO7U/ssyGf/ICsbgrGs5ASvKczJIV5hulcpjc/UFKGM0KaQpbHI+
 9UWg==
X-Gm-Message-State: AOAM531a8WPQ3+ljLqm44vQANsaXFNYxOqaIcJPHsEbdy0qttQ2YzimH
 aTrkcwwAg3/MuJ1F45mDdGezXw==
X-Google-Smtp-Source: ABdhPJwAAHPNollF2qNbk1bn/dIvuDP118bo1zP5qg598VD2MSzTkTnoyhetCyghTdH9xKFShiITnw==
X-Received: by 2002:a17:90a:7b84:: with SMTP id
 z4mr7749468pjc.106.1594422175761; 
 Fri, 10 Jul 2020 16:02:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:02:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 9/9] ARM: dts: qcom: msm8974: Add "simple-bus" to our mdss node
Date: Fri, 10 Jul 2020 16:02:24 -0700
Message-Id: <20200710160131.9.I667d728b2a99b1ed50df01a3e14483fa69babf0e@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As described in the bindings patch, this means that our child nodes
are devices in their own right.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
If this patch lands before the patch ("drm/msm: Avoid manually
populating our children if "simple-bus" is there") it doesn't seem to
be the end of the world.  The first time through
add_display_components() it'll notice that the children are already
populated and it will be a no-op.  When it gets a defer it will then
depouplate them (even though it didn't populate them) and future calls
will just populate them again.

NOTE: I have no way to test this patch, but I'm assuming it works OK?

 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 51f5f904f9eb..9f84c9fd716c 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1402,7 +1402,7 @@ cnoc: interconnect@fc480000 {
 		mdss: mdss@fd900000 {
 			status = "disabled";
 
-			compatible = "qcom,mdss";
+			compatible = "qcom,mdss", "simple-bus";
 			reg = <0xfd900000 0x100>,
 			      <0xfd924000 0x1000>;
 			reg-names = "mdss_phys",
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

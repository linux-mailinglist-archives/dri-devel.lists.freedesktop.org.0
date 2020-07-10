Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0311521C05A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 01:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2086ED9A;
	Fri, 10 Jul 2020 23:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1BE6ED8D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 23:02:52 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id gc15so4998716pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 16:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rE/FJ5cYzpFqRF8eT/aCqXqC9qh4D6JVTbyHc29pzro=;
 b=W05HtcQbPIXl89xuFzm4GPwHFSTzuwS6hsd6ixbS+qwJmURhFW+04wI+YdXhaXJdwf
 gZyBNbX0eJuS6UKNz9BnvMBF+eGM4d0cV+AzqPhAvOQ+M/XgJa0mXxXlTlscAKe2+ZEL
 ji+EXJAV1US4mTdKcZIuo2k2hlDCXBrobBLQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rE/FJ5cYzpFqRF8eT/aCqXqC9qh4D6JVTbyHc29pzro=;
 b=ZqYbIxMrj1ufSlQ7uJRPS1kVmXJUv326BHjMwF2195GaFUxKArzut/G4/b3DBZPTik
 90G2DrI1KNR1o+A2Wr2t1UhnB4ohXXXR5rFrXe7+Qlx68l3EcMSaGVdikoH32KHzlRlU
 uoEil9Y8Mwd7dD7/vFPHKCfB3XFVIIbZynRYiXkv4zmrrpCYCfa2VWwke9ZspFwbrSjl
 tqH6aS2DEiuRjmEOPHf7BEgarR/N2xvSEjR9pxUyZxHeBVQzkCheRvdE5ojgtM/J+03i
 xRpEg3IS5KjBIfKavIrNHDoar230SxR6wrdF5gau4sBlLgyX2whUC8Y4z8fAdXAhEQzE
 b0lg==
X-Gm-Message-State: AOAM532aiO0ozBUXhzl6Bg2o+V5922+YVGopvCsxyL33ZHDzF4CQeV+W
 4wdOhkRiE/nHL4KLtTQZPEc5Mw==
X-Google-Smtp-Source: ABdhPJwjcX9D4B+Y8sp8rehAg+DrC8K54299WPrDi2IEEU/9tpv0fAIuMD/Nv1C71frqmllXTO8cGA==
X-Received: by 2002:a17:902:6906:: with SMTP id
 j6mr18275162plk.125.1594422172084; 
 Fri, 10 Jul 2020 16:02:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:02:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 6/9] arm64: dts: qcom: sdm845: Add "simple-bus" to our mdss
 node
Date: Fri, 10 Jul 2020 16:02:21 -0700
Message-Id: <20200710160131.6.Ie343c226b3566575fcaa9e4a8732674a1ae1b513@changeid>
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

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b0d8308a3e95..e52a5e95168a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3582,7 +3582,7 @@ clock_camcc: clock-controller@ad00000 {
 		};
 
 		mdss: mdss@ae00000 {
-			compatible = "qcom,sdm845-mdss";
+			compatible = "qcom,sdm845-mdss", "simple-bus";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
 
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

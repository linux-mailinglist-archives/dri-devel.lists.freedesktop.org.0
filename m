Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3D833E004
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 22:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE956E44B;
	Tue, 16 Mar 2021 21:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16626E44B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 21:09:10 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id n10so23460089pgl.10
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 14:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KfsiDRXDWi256dPx6kPXl9YsOHcZPMkcG1NzqoByDb0=;
 b=XphS2ihI9WIrvODsx4Ck8JNqUzPXAwKiSAqFnJ8gA4zdBn+yes68s/2FZmd4WV7kcD
 Bu4lRsIullOAq+yZVyDb1A3qVnJXumgwncIrMO4910mbilxgoOp1FRFlA50KtCbPICUj
 han3RBEsGYPFS7NISEoOcFF6hxH6SrIuyFO7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KfsiDRXDWi256dPx6kPXl9YsOHcZPMkcG1NzqoByDb0=;
 b=GHJl6+2jq0wzcZxJ9N5VCqTLxz3+TikDqhT3RVxUPspzvAols/SE3GcYlRjQ+nV+8O
 SMv3grfbNli4WxtCUASf9ehsLrcljnSY2QVQtbZjb/+vtrP8sHleJFfqVm8Vmdvchc/V
 17ulYiW0Fpd+utogFAudOuKy7K4K+Kldi2SLkAtcCGUQYGccwjnMO6zXjweoh7v4oH1E
 dz7RElTMrBaqYDT4D3ZzgQzRIM2RY8e+CM4oVFKkxhNsYW3ydxiEI3u7IFmMGQFwlbSW
 7lZpUWptMThSYK9CQemc3XZ8WULgZRzQydFzCFKdvvnZOcFVBk/5KPsrgk1E99RE0it/
 PcZg==
X-Gm-Message-State: AOAM532JG8Mmfa9zln20kVEly7azpvRSftyK0FIpkr+07m4vkuOHNhfj
 Qi8oAYDvSLrm1XsVXV5k9REnFw==
X-Google-Smtp-Source: ABdhPJwTR+A25BWQSeSDuRmW9FcIOJrDBaqzzxhAWfpKM6Tv5nAJPFN5eRVDgN+dgwx7ZHqMd6JZ5g==
X-Received: by 2002:a62:6c6:0:b029:200:49d8:77ae with SMTP id
 189-20020a6206c60000b029020049d877aemr1339575pfg.61.1615928950254; 
 Tue, 16 Mar 2021 14:09:10 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:84d6:7fd1:d469:351f])
 by smtp.gmail.com with ESMTPSA id 192sm17358072pfa.122.2021.03.16.14.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 14:09:09 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [RFC PATCH 3/3] arm64: dts: qcom: Don't specify exactly what panel is
 on pompom
Date: Tue, 16 Mar 2021 14:08:21 -0700
Message-Id: <20210316140707.RFC.3.Id2f7444caac48649e091b00b8a64f30ced65ee5c@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, drinkcat@chromium.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Andy Gross <agross@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As talked about in the previous patch ("dt-bindings: display: simple:
Add the panel on sc7180-trogdor-pompom") any number of panels might be
attached.

Let's stop specifying a single panel and just specify that we have a
"pompom panel".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Before landing this we need the patch ("drm/panel: panel-simple: Add
the panel on sc7180-trogdor-pompom") from earlier in this series. Less
obviously, though, we also need the patch ("drm/bridge: ti-sn65dsi86:
Properly get the EDID, but only if refclk") [1].

[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid

 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index d253a08f6fc8..f98c18f6ff94 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -108,7 +108,7 @@ ap_ts: touchscreen@10 {
 };
 
 &panel {
-	compatible = "kingdisplay,kd116n21-30nv-a010";
+	compatible = "google,pompom-panel";
 };
 
 &pen_insert {
-- 
2.31.0.rc2.261.g7f71774620-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

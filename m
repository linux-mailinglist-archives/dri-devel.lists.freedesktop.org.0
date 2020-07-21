Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266E7227A72
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4357D89E39;
	Tue, 21 Jul 2020 08:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E6F6E3DB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 04:27:08 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id d4so11350489pgk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 21:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jIb2rFOZN8gwoOlXTkxPZa6eyeZDpgkSyS7W8wCzIJg=;
 b=WvDaw8DXxILkRr/NoclGFf0Rt0bm/iie3CNU3ZYfRBxlZ3lZovpsXOcdh3xgFByHih
 aU4ABPVp2FzRKAoUX9PQtPZU5+8n8XyIuUFBWdNFPjrloSZ1wwtOW85Gx+3KkNcwxMY4
 AVxsqdoadhQc1+eyMrH2gYFo6d/D2sDR6TXHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jIb2rFOZN8gwoOlXTkxPZa6eyeZDpgkSyS7W8wCzIJg=;
 b=aU9m9sQzSmHa5xtl3Ff0r115nzyxHAOwm3SOHQH7Kw3/fQTGcq/cR2EXdS4coIRJlC
 ojEYcb4VPNPYy3ue8hRVlwQ2ooDL08TQB2NPmoOHa1MkuVqkdsLGpn859J60HqiCv5l3
 oWMZbXHckWwutFPJYSdx/7I3IA7MUmfbOF98R95d759ZfEbHYa7lpIDOVsyEJksi5+E5
 bICeRvM4kqYFIttAdNlxF3WB7qOmhef7pfnsxL/4nVjote48cULWW3xA68l1vDM9POfh
 wdS0km7Z2MmnS8YPf4sjJSJuuTrk9AifkHpjikNcijhp+VxtcCHo8KoxgqZ7z0Cc406e
 KMmA==
X-Gm-Message-State: AOAM530H6gdKheUOX2qjS2dKE9JBL6lLluYxBl0oWXIo8FLwF7KBO8Fm
 /ue9JRayboYnKrp6W/o5bqIg9w==
X-Google-Smtp-Source: ABdhPJz9Vh2IOS/1uRlQ2nI9iXmkt0IM/J22K0/Kq13gyoo2noXO6h6x9nUFPTbwdyISrFtDedLw5w==
X-Received: by 2002:a63:395:: with SMTP id 143mr21310754pgd.57.1595305627807; 
 Mon, 20 Jul 2020 21:27:07 -0700 (PDT)
Received: from alex-desktop.lan (c-73-63-253-164.hsd1.ca.comcast.net.
 [73.63.253.164])
 by smtp.gmail.com with ESMTPSA id o8sm1207075pjf.37.2020.07.20.21.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 21:27:06 -0700 (PDT)
From: Alexandru Stan <amstan@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/3] PWM backlight interpolation adjustments
Date: Mon, 20 Jul 2020 21:25:19 -0700
Message-Id: <20200721042522.2403410-1-amstan@chromium.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Alexandru Stan <amstan@chromium.org>, linux-pwm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Matthias Kaehlcke <mka@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I was trying to adjust the brightness for a new chromebook:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2291209
Like a lot of panels, the low end needs to be cropped,
and now that we have the interpolation stuff I wanted to make use of it
and bake in even the curve.

I found the behavior a little unintuitive and non-linear. See patch 1
for a suggested fix for this.

Unfortunatelly a few veyron dts files were relying on this
(perhaps weird) behavior. Those devices also want a minimum brightness.
The issue is that they also want the 0% point for turning off the
display.
https://github.com/torvalds/linux/commit/6233269bce47bd450196a671ab28eb1ec5eb88d9#diff-e401ae20091bbfb311a062c464f4f47fL23

So the idea here is to change those dts files to only say <3 255> (patch
3), and add in a virtual 0% point at the bottom of the scale (patch 2).

We have to do this conditionally because it seems some devices like to
have the scale inverted:
  % git grep "brightness-levels\s*=\s*<\s*[1-9]"|cat
  arch/arm/boot/dts/tegra124-apalis-eval.dts:             brightness-levels = <255 231 223 207 191 159 127 0>;


Alexandru Stan (3):
  backlight: pwm_bl: Fix interpolation
  backlight: pwm_bl: Artificially add 0% during interpolation
  ARM: dts: rockchip: Remove 0 point in backlight

 arch/arm/boot/dts/rk3288-veyron-jaq.dts    |  2 +-
 arch/arm/boot/dts/rk3288-veyron-minnie.dts |  2 +-
 arch/arm/boot/dts/rk3288-veyron-tiger.dts  |  2 +-
 drivers/video/backlight/pwm_bl.c           | 78 +++++++++++-----------
 4 files changed, 42 insertions(+), 42 deletions(-)

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

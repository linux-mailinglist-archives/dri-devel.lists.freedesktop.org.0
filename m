Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062112A1F70
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 17:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3379B6EAD4;
	Sun,  1 Nov 2020 16:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2152 seconds by postgrey-1.36 at gabe;
 Sun, 01 Nov 2020 16:09:47 UTC
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4049389FC8
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 16:09:47 +0000 (UTC)
Received: from p57b773f8.dip0.t-ipconnect.de ([87.183.115.248]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1kZFMY-0003rS-Uf; Sun, 01 Nov 2020 16:33:47 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Alexandru Stan <amstan@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3 0/3] PWM backlight interpolation adjustments
Date: Sun,  1 Nov 2020 16:33:41 +0100
Message-Id: <160424139256.1224767.4744407641354846090.b4-ty@sntech.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022050445.930403-1-amstan@chromium.org>
References: <20201022050445.930403-1-amstan@chromium.org>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Matthias Kaehlcke <mka@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Oct 2020 22:04:42 -0700, Alexandru Stan wrote:
> I was trying to adjust the brightness-levels for the trogdor boards:
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2291209
> Like on a lot of panels, trogdor's low end needs to be cropped,
> and now that we have the interpolation stuff I wanted to make use of it
> and bake in even the curve that's customary to have on chromebooks.
> 
> I found the current behavior of the pwm_bl driver a little unintuitive
> and non-linear. See patch 1 for a suggested fix for this.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: rockchip: Remove 0 point from brightness-levels on rk3288-veyron
      commit: 225c59b9235a421cdb219be5fbc13126a49714a6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

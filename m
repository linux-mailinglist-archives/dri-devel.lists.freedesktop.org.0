Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980BF80F48F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 18:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A679A10E67C;
	Tue, 12 Dec 2023 17:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E948F10E671
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 17:27:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD6X1-0001uM-3O; Tue, 12 Dec 2023 18:26:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD6Ww-00FOPD-7r; Tue, 12 Dec 2023 18:26:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD6Wv-001nbR-TA; Tue, 12 Dec 2023 18:26:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>
Subject: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Date: Tue, 12 Dec 2023 18:26:37 +0100
Message-ID: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=fuoORCWhYYOP5RXKuGpiS7lr3Z2yTHsOYZlk6CpCKEA=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhtSK6WeM9Jn7Sit136VzF7/4ma2nGmm+cYH0TcGD7l/qr
 yVKuzt0MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjAR9kYOhtn5K8o/uh43Cy40
 8V1Z6qUks+9F+Hz+mPwpC8x2/X3J+dPhJue5kGwr0UQRoQir41eF5Cbfly35tGQV0xdVe61lmYf
 6XCb6C8mqch9lc3PV01l46mG7/OMdX49+Kvm5uNTA6t3Ds9cnWj/a7eNx9WW4ioOO8pXgbRkJ+R
 5N0UsOt7geZzFR/ODedeTL+/PyEcIv06YKmi+K2anHpJjy1vyL47PCSWLsM+I7p1aG/D1/nXlex
 t+VibUmv/X6lnxq7OGKm9Z6s/3Qv+6Dd+yPSipG7rLPVq4xS13pJC17v5Ezzp/f7srJGKUwncIl
 fyLuqUhe4O2/kbC0OFf5kX7ugovH10Ud+5H3oq872CsBAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Johan Hovold <johan+linaro@kernel.org>, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

clk_rate_exclusive_get() returns zero unconditionally. Most users "know"
that and don't check the return value. This series fixes the four users
that do error checking on the returned value and then makes function
return void.

Given that the changes to the drivers are simple and so merge conflicts
(if any) should be easy to handle, I suggest to merge this complete
series via the clk tree.

Best regards
Uwe

Uwe Kleine-König (5):
  PM / devfreq: sun8i-a33-mbus: Simplify usage of
    clk_rate_exclusive_get()
  drm/meson: Simplify usage of clk_rate_exclusive_get()
  memory: tegra210-emc: Simplify usage of clk_rate_exclusive_get()
  memory: tegra30-emc: Simplify usage of clk_rate_exclusive_get()
  clk: Make clk_rate_exclusive_get() return void

 drivers/clk/clk.c                         |  6 ++----
 drivers/devfreq/sun8i-a33-mbus.c          | 14 ++------------
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c |  8 +-------
 drivers/memory/tegra/tegra210-emc-core.c  |  6 +-----
 drivers/memory/tegra/tegra30-emc.c        |  6 +-----
 include/linux/clk.h                       |  8 +++-----
 6 files changed, 10 insertions(+), 38 deletions(-)


base-commit: bbd220ce4e29ed55ab079007cff0b550895258eb
-- 
2.42.0


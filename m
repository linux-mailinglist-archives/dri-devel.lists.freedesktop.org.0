Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE9DAEF1D5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3747210E536;
	Tue,  1 Jul 2025 08:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F6F10E536
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 08:51:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1uWWhi-0006IB-Mc; Tue, 01 Jul 2025 10:51:02 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1uWWhg-006F2S-27;
 Tue, 01 Jul 2025 10:51:00 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1uWWhb-0004aR-1k;
 Tue, 01 Jul 2025 10:50:55 +0200
Message-ID: <aafdb0e9dee2041ae64b2fe8677b4b3d45401bc8.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/4] drm/bridge: samsung-dsim: Stop controlling vsync
 display FIFO flush in panels
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>,  Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>, Artur Weber
 <aweber.kernel@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de
Date: Tue, 01 Jul 2025 10:50:55 +0200
In-Reply-To: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
References: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2025-06-27 at 13:45 +0200, Philipp Zabel wrote:
> This series enables the vsync flush feature in the samsung-dsim driver
> unconditionally and removes the MIPI_DSI_MODE_VSYNC_FLUSH flag.

Applied to drm-misc-next.

[1/4] drm/bridge: samsung-dsim: Always flush display FIFO on vsync pulse
      commit: a36c533ad3e1b8c0326d665d2d02d2ef7aea8f92
[2/4] drm/panel: samsung-s6d7aa0: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
      commit: f488640e51312fbca02f9229d238a2aed7a8aac9
[3/4] drm/panel: samsung-s6e8aa0: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
      commit: 5c449ddbaba1c807c4674f92e5ebf6a887edb58c
[4/4] drm/mipi-dsi: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
      commit: 12853b279100adc7074b51db23bf62a41cb84cb8

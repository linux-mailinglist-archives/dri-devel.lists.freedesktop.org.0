Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2EF6509B3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 11:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFF810E198;
	Mon, 19 Dec 2022 09:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D22110E198
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 09:59:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p7CvZ-0007l9-7h; Mon, 19 Dec 2022 10:59:21 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p7CvY-000ImW-C3; Mon, 19 Dec 2022 10:59:20 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p7CvX-000AIS-6M; Mon, 19 Dec 2022 10:59:19 +0100
Message-ID: <f08b9417bc823f9a5ade9325285a3a3ed138c441.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/2] drm/imx/lcdc: Implement DRM driver for imx21
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 19 Dec 2022 10:59:19 +0100
In-Reply-To: <20221216175006.456831-3-u.kleine-koenig@pengutronix.de>
References: <20221216175006.456831-1-u.kleine-koenig@pengutronix.de>
 <20221216175006.456831-3-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2022-12-16 at 18:50 +0100, Uwe Kleine-K=C3=B6nig wrote:
[...]
> +static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
> +			       struct drm_plane_state *plane_state,
> +			       struct drm_crtc_state *crtc_state)
> +{
> +	const struct drm_display_mode *mode =3D &crtc_state->mode;
> +	const struct drm_display_mode *old_mode =3D &pipe->crtc.state->mode;
> +
> +	if (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES ||
> +	    mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES ||
> +	    mode->hdisplay & 0x10) { /* must be multiple of 16 */
> +		drm_err(pipe->crtc.dev, "unsupported display mode (%u x %u)\n",
> +			  mode->hdisplay, mode->vdisplay);
			^^
Nitpick: now superfluous whitespace.

regards
Philipp

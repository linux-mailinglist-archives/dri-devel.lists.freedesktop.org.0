Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5388BA3AB
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 20:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905906E03A;
	Sun, 22 Sep 2019 18:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF736E03A
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2019 18:44:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,537,1559512800"; d="scan'208";a="320239964"
Received: from ip-215.net-89-2-7.rev.numericable.fr (HELO hadrien)
 ([89.2.7.215])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Sep 2019 20:43:48 +0200
Date: Sun, 22 Sep 2019 20:43:48 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: =?ISO-8859-15?Q?Guido_G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v6 2/2] drm/bridge: Add NWL MIPI DSI host controller
 support (fwd)
Message-ID: <alpine.DEB.2.21.1909222042340.2575@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-348580464-1569177829=:2575"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 =?ISO-8859-15?Q?Guido_G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org,
 kbuild-all@01.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-348580464-1569177829=:2575
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

Hello,

Color_format is unsigned, so it won't be less than 0 on line 272.

julia

---------- Forwarded message ----------
Date: Mon, 23 Sep 2019 02:29:34 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v6 2/2] drm/bridge: Add NWL MIPI DSI host controller support

CC: kbuild-all@01.org
In-Reply-To: <c0ac0b203fb65ae7efd1b9b54664b491ca2fb157.1569170717.git.agx@sigxcpu.org>
References: <c0ac0b203fb65ae7efd1b9b54664b491ca2fb157.1569170717.git.agx@sigxcpu.org>
TO: "Guido Günther" <agx@sigxcpu.org>
CC:

Hi "Guido,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to v5.3 next-20190920]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Guido-G-nther/drm-bridge-Add-NWL-MIPI-DSI-host-controller-support/20190923-005010
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

>> drivers/gpu/drm/bridge/nwl-dsi.c:272:5-17: WARNING: Unsigned expression compared with zero: color_format < 0

# https://github.com/0day-ci/linux/commit/060069512cb50e3218b55005b6cc92b82e0a7856
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 060069512cb50e3218b55005b6cc92b82e0a7856
vim +272 drivers/gpu/drm/bridge/nwl-dsi.c

060069512cb50e Guido Günther 2019-09-22  245
060069512cb50e Guido Günther 2019-09-22  246  static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
060069512cb50e Guido Günther 2019-09-22  247  {
060069512cb50e Guido Günther 2019-09-22  248  	u32 color_format, mode;
060069512cb50e Guido Günther 2019-09-22  249  	bool burst_mode;
060069512cb50e Guido Günther 2019-09-22  250  	int hfront_porch, hback_porch, vfront_porch, vback_porch;
060069512cb50e Guido Günther 2019-09-22  251  	int hsync_len, vsync_len;
060069512cb50e Guido Günther 2019-09-22  252
060069512cb50e Guido Günther 2019-09-22  253  	hfront_porch = dsi->mode.hsync_start - dsi->mode.hdisplay;
060069512cb50e Guido Günther 2019-09-22  254  	hsync_len = dsi->mode.hsync_end - dsi->mode.hsync_start;
060069512cb50e Guido Günther 2019-09-22  255  	hback_porch = dsi->mode.htotal - dsi->mode.hsync_end;
060069512cb50e Guido Günther 2019-09-22  256
060069512cb50e Guido Günther 2019-09-22  257  	vfront_porch = dsi->mode.vsync_start - dsi->mode.vdisplay;
060069512cb50e Guido Günther 2019-09-22  258  	vsync_len = dsi->mode.vsync_end - dsi->mode.vsync_start;
060069512cb50e Guido Günther 2019-09-22  259  	vback_porch = dsi->mode.vtotal - dsi->mode.vsync_end;
060069512cb50e Guido Günther 2019-09-22  260
060069512cb50e Guido Günther 2019-09-22  261  	DRM_DEV_DEBUG_DRIVER(dsi->dev, "hfront_porch = %d\n", hfront_porch);
060069512cb50e Guido Günther 2019-09-22  262  	DRM_DEV_DEBUG_DRIVER(dsi->dev, "hback_porch = %d\n", hback_porch);
060069512cb50e Guido Günther 2019-09-22  263  	DRM_DEV_DEBUG_DRIVER(dsi->dev, "hsync_len = %d\n", hsync_len);
060069512cb50e Guido Günther 2019-09-22  264  	DRM_DEV_DEBUG_DRIVER(dsi->dev, "hdisplay = %d\n", dsi->mode.hdisplay);
060069512cb50e Guido Günther 2019-09-22  265  	DRM_DEV_DEBUG_DRIVER(dsi->dev, "vfront_porch = %d\n", vfront_porch);
060069512cb50e Guido Günther 2019-09-22  266  	DRM_DEV_DEBUG_DRIVER(dsi->dev, "vback_porch = %d\n", vback_porch);
060069512cb50e Guido Günther 2019-09-22  267  	DRM_DEV_DEBUG_DRIVER(dsi->dev, "vsync_len = %d\n", vsync_len);
060069512cb50e Guido Günther 2019-09-22  268  	DRM_DEV_DEBUG_DRIVER(dsi->dev, "vactive = %d\n", dsi->mode.vdisplay);
060069512cb50e Guido Günther 2019-09-22  269  	DRM_DEV_DEBUG_DRIVER(dsi->dev, "clock = %d kHz\n", dsi->mode.clock);
060069512cb50e Guido Günther 2019-09-22  270
060069512cb50e Guido Günther 2019-09-22  271  	color_format = nwl_dsi_get_dpi_pixel_format(dsi->format);
060069512cb50e Guido Günther 2019-09-22 @272  	if (color_format < 0) {
060069512cb50e Guido Günther 2019-09-22  273  		DRM_DEV_ERROR(dsi->dev, "Invalid color format 0x%x\n",
060069512cb50e Guido Günther 2019-09-22  274  			      dsi->format);
060069512cb50e Guido Günther 2019-09-22  275  		return color_format;
060069512cb50e Guido Günther 2019-09-22  276  	}
060069512cb50e Guido Günther 2019-09-22  277  	DRM_DEV_DEBUG_DRIVER(dsi->dev, "pixel fmt = %d\n", dsi->format);
060069512cb50e Guido Günther 2019-09-22  278
060069512cb50e Guido Günther 2019-09-22  279  	nwl_dsi_write(dsi, NWL_DSI_INTERFACE_COLOR_CODING, NWL_DSI_DPI_24_BIT);
060069512cb50e Guido Günther 2019-09-22  280  	nwl_dsi_write(dsi, NWL_DSI_PIXEL_FORMAT, color_format);
060069512cb50e Guido Günther 2019-09-22  281  	/*
060069512cb50e Guido Günther 2019-09-22  282  	 * Adjusting input polarity based on the video mode results in
060069512cb50e Guido Günther 2019-09-22  283  	 * a black screen so always pick active low:
060069512cb50e Guido Günther 2019-09-22  284  	 */
060069512cb50e Guido Günther 2019-09-22  285  	nwl_dsi_write(dsi, NWL_DSI_VSYNC_POLARITY,
060069512cb50e Guido Günther 2019-09-22  286  		      NWL_DSI_VSYNC_POLARITY_ACTIVE_LOW);
060069512cb50e Guido Günther 2019-09-22  287  	nwl_dsi_write(dsi, NWL_DSI_HSYNC_POLARITY,
060069512cb50e Guido Günther 2019-09-22  288  		      NWL_DSI_HSYNC_POLARITY_ACTIVE_LOW);
060069512cb50e Guido Günther 2019-09-22  289
060069512cb50e Guido Günther 2019-09-22  290  	burst_mode = (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_BURST) &&
060069512cb50e Guido Günther 2019-09-22  291  		     !(dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE);
060069512cb50e Guido Günther 2019-09-22  292
060069512cb50e Guido Günther 2019-09-22  293  	if (burst_mode) {
060069512cb50e Guido Günther 2019-09-22  294  		nwl_dsi_write(dsi, NWL_DSI_VIDEO_MODE, NWL_DSI_VM_BURST_MODE);
060069512cb50e Guido Günther 2019-09-22  295  		nwl_dsi_write(dsi, NWL_DSI_PIXEL_FIFO_SEND_LEVEL, 256);
060069512cb50e Guido Günther 2019-09-22  296  	} else {
060069512cb50e Guido Günther 2019-09-22  297  		mode = ((dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) ?
060069512cb50e Guido Günther 2019-09-22  298  				NWL_DSI_VM_BURST_MODE_WITH_SYNC_PULSES :
060069512cb50e Guido Günther 2019-09-22  299  				NWL_DSI_VM_NON_BURST_MODE_WITH_SYNC_EVENTS);
060069512cb50e Guido Günther 2019-09-22  300  		nwl_dsi_write(dsi, NWL_DSI_VIDEO_MODE, mode);
060069512cb50e Guido Günther 2019-09-22  301  		nwl_dsi_write(dsi, NWL_DSI_PIXEL_FIFO_SEND_LEVEL,
060069512cb50e Guido Günther 2019-09-22  302  			      dsi->mode.hdisplay);
060069512cb50e Guido Günther 2019-09-22  303  	}
060069512cb50e Guido Günther 2019-09-22  304
060069512cb50e Guido Günther 2019-09-22  305  	nwl_dsi_write(dsi, NWL_DSI_HFP, hfront_porch);
060069512cb50e Guido Günther 2019-09-22  306  	nwl_dsi_write(dsi, NWL_DSI_HBP, hback_porch);
060069512cb50e Guido Günther 2019-09-22  307  	nwl_dsi_write(dsi, NWL_DSI_HSA, hsync_len);
060069512cb50e Guido Günther 2019-09-22  308
060069512cb50e Guido Günther 2019-09-22  309  	nwl_dsi_write(dsi, NWL_DSI_ENABLE_MULT_PKTS, 0x0);
060069512cb50e Guido Günther 2019-09-22  310  	nwl_dsi_write(dsi, NWL_DSI_BLLP_MODE, 0x1);
060069512cb50e Guido Günther 2019-09-22  311  	nwl_dsi_write(dsi, NWL_DSI_USE_NULL_PKT_BLLP, 0x0);
060069512cb50e Guido Günther 2019-09-22  312  	nwl_dsi_write(dsi, NWL_DSI_VC, 0x0);
060069512cb50e Guido Günther 2019-09-22  313
060069512cb50e Guido Günther 2019-09-22  314  	nwl_dsi_write(dsi, NWL_DSI_PIXEL_PAYLOAD_SIZE, dsi->mode.hdisplay);
060069512cb50e Guido Günther 2019-09-22  315  	nwl_dsi_write(dsi, NWL_DSI_VACTIVE, dsi->mode.vdisplay - 1);
060069512cb50e Guido Günther 2019-09-22  316  	nwl_dsi_write(dsi, NWL_DSI_VBP, vback_porch);
060069512cb50e Guido Günther 2019-09-22  317  	nwl_dsi_write(dsi, NWL_DSI_VFP, vfront_porch);
060069512cb50e Guido Günther 2019-09-22  318
060069512cb50e Guido Günther 2019-09-22  319  	return 0;
060069512cb50e Guido Günther 2019-09-22  320  }
060069512cb50e Guido Günther 2019-09-22  321

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
--8323329-348580464-1569177829=:2575
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--8323329-348580464-1569177829=:2575--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D04A83CF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 13:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA3510F48A;
	Thu,  3 Feb 2022 12:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54ADD10F485
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 12:26:10 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B2B715C023E;
 Thu,  3 Feb 2022 07:26:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 03 Feb 2022 07:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=DZeDvNWlZV2YrLsVETuZtOyRKo0dru7vSEJOon
 T/Kqg=; b=rcw0rvfgAruFthiIcBXXKctm8Grakh2leyfWfigvhZkhbsE6vKEUGw
 0EydfcG5B9Senf795hMH8/+tvZ3n8YjNQM1O5WSRyXJhi215uOkRN4ymlR0r0xCt
 BRuUi9uGYjmzO5wCv6YOcRLPXnXHrSkYn+ynoohr+Eg0C515O6MrGdL0K3Ylwwg4
 QUKsvA521oWG/rLyg2iPzryKuWCNQrjlOnfbY+1gEQ57nz7igRaS94lVzQjROr6i
 d6z1XgoMfpr5SJ9HhlLXfi8Qw9VzVIMzyw5503ltg7k3leQ5oio89WQHyd9ZjRhq
 OGfKmAfbbcx7bhvTaCBjcFVflMyjKCRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DZeDvNWlZV2YrLsVE
 TuZtOyRKo0dru7vSEJOonT/Kqg=; b=kI9j82a5vqQRTA01zkShXWhlFQ3g23Y7c
 7Tc1Opc8mYri2CmS32ZhaaOVZ0n577EoWbQQMmnSIgRDg2Gjwa1eCHWhKIXEXti8
 CRge0ScZm10eRKXMI6g+4X/WDPDaEsGYYlOVwTHEHhbRAtr6pCqMCFls+8FCVnEW
 QwyQiDKPPbeGVCTtQlvErIpuVSw0208CisVaLi44ZOpbfuB2lCnaGVm7j9eWWccT
 HgJb8iLgAqbzhXIqYOQZfeD71V5iSrVbTH7EOduYFddAosMZxHgAB5uWwoEErwcV
 qiBQ5WLZjmYGco+pFc2p7ZSvzWQ1hXp8mSBA0SDk5OBlO45Ea0b4g==
X-ME-Sender: <xms:4Mn7YWvVuHCJH4myRAAglOXOPkiPb2MLcO_wjhTyFvOPmyTudRWWxw>
 <xme:4Mn7YbccC9-f2VjxvIOuQOd7RMK5PqTH0tMstXfkgiHLO1j7CbGMHZddo6bn2NvRN
 sooyeEOL4bEC7jZqRc>
X-ME-Received: <xmr:4Mn7YRz8mxVDAipDUh2a-Rb-OqtCm9_wMfS7GOPWARzB4gzcyJvDoElTp6QuxZzTiY85QkpkbxicCigp8wzxvpNAZcqbFCySXkpwuzU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4Mn7YRPsnk6qLgyJiufl-tyXGiBYlJKTVdFlHLsKg2EKowQjzZR3PQ>
 <xmx:4Mn7YW9ai5mVLfCSZIWiHwk74u3L1ZEOzJGcvcWOFKu-nmowR9iG8g>
 <xmx:4Mn7YZXXz7Ssqzh-gF16WNsPiqqKT9S8d8kW0Z409zrbTfKg7lZqvg>
 <xmx:4cn7YWxrgpAJ-i3EpO5Wf2uncFGOu6SYjc_lXiSt9cnb74B_cesMbg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 07:26:08 -0500 (EST)
Date: Thu, 3 Feb 2022 13:26:06 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 4/4] drm/bridge: tc358767: Add DSI-to-DPI mode support
Message-ID: <20220203122606.7xdwekequjplkkqa@houat>
References: <20211127032405.283435-1-marex@denx.de>
 <20211127032405.283435-4-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pfpc7ztby4izzy5w"
Content-Disposition: inline
In-Reply-To: <20211127032405.283435-4-marex@denx.de>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pfpc7ztby4izzy5w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 27, 2021 at 04:24:05AM +0100, Marek Vasut wrote:
> The TC358767/TC358867/TC9595 are all capable of operating in multiple
> modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Add support for the
> DSI-to-DPI mode.
>=20
> This requires skipping most of the (e)DP initialization code, which is
> currently a large part of this driver, hence it is better to have far
> simpler separate tc_dpi_bridge_funcs and their implementation.
>=20
> The configuration of DPI output is also much simpler. The configuration
> of the DSI input is rather similar to the other TC bridge chips.
>=20
> The Pixel PLL in DPI output mode does not have the 65..150 MHz limitation
> imposed on the (e)DP output mode, so this limitation is skipped to permit
> operating panels with far slower pixel clock, even below 9 MHz. This mode
> of operation of the PLL is valid and tested.
>=20
> The detection of bridge mode is now added into tc_probe_bridge_mode(),
> where in case a DPI panel is found on port@1 endpoint@1, the mode is
> assumed to be DSI-to-DPI. If (e)DP is detected on port@2, the mode is
> assumed to be DPI-to-(e)DP.
>=20
> The DSI-to-(e)DP mode is not supported due to lack of proper hardware,
> but this would be some sort of mix between the two aforementioned modes.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 443 ++++++++++++++++++++++++------
>  1 file changed, 356 insertions(+), 87 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 0e16ae2461fd..c653a0bd0f35 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1,6 +1,12 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * tc358767 eDP bridge driver
> + * TC358767/TC358867/TC9595 DSI/DPI-to-DPI/(e)DP bridge driver
> + *
> + * The TC358767/TC358867/TC9595 can operate in multiple modes.
> + * The following modes are supported:
> + *   DPI->(e)DP -- supported
> + *   DSI->DPI .... supported
> + *   DSI->(e)DP .. NOT supported
>   *
>   * Copyright (C) 2016 CogentEmbedded Inc
>   * Author: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> @@ -29,6 +35,7 @@
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
> @@ -36,7 +43,35 @@
> =20
>  /* Registers */
> =20
> -/* Display Parallel Interface */
> +/* PPI layer registers */
> +#define PPI_STARTPPI		0x0104 /* START control bit */
> +#define PPI_LPTXTIMECNT		0x0114 /* LPTX timing signal */
> +#define LPX_PERIOD			3
> +#define PPI_LANEENABLE		0x0134
> +#define PPI_TX_RX_TA		0x013c
> +#define TTA_GET				0x40000
> +#define TTA_SURE			6
> +#define PPI_D0S_ATMR		0x0144
> +#define PPI_D1S_ATMR		0x0148
> +#define PPI_D0S_CLRSIPOCOUNT	0x0164 /* Assertion timer for Lane 0 */
> +#define PPI_D1S_CLRSIPOCOUNT	0x0168 /* Assertion timer for Lane 1 */
> +#define PPI_D2S_CLRSIPOCOUNT	0x016c /* Assertion timer for Lane 2 */
> +#define PPI_D3S_CLRSIPOCOUNT	0x0170 /* Assertion timer for Lane 3 */
> +#define PPI_START_FUNCTION		BIT(0)
> +
> +/* DSI layer registers */
> +#define DSI_STARTDSI		0x0204 /* START control bit of DSI-TX */
> +#define DSI_LANEENABLE		0x0210 /* Enables each lane */
> +#define DSI_RX_START			BIT(0)
> +
> +/* Lane enable PPI and DSI register bits */
> +#define LANEENABLE_CLEN		BIT(0)
> +#define LANEENABLE_L0EN		BIT(1)
> +#define LANEENABLE_L1EN		BIT(2)
> +#define LANEENABLE_L2EN		BIT(1)
> +#define LANEENABLE_L3EN		BIT(2)
> +
> +/* Display Parallel Input Interface */
>  #define DPIPXLFMT		0x0440
>  #define VS_POL_ACTIVE_LOW		(1 << 10)
>  #define HS_POL_ACTIVE_LOW		(1 << 9)
> @@ -48,6 +83,14 @@
>  #define DPI_BPP_RGB666			(1 << 0)
>  #define DPI_BPP_RGB565			(2 << 0)
> =20
> +/* Display Parallel Output Interface */
> +#define POCTRL			0x0448
> +#define POCTRL_S2P			BIT(7)
> +#define POCTRL_PCLK_POL			BIT(3)
> +#define POCTRL_VS_POL			BIT(2)
> +#define POCTRL_HS_POL			BIT(1)
> +#define POCTRL_DE_POL			BIT(0)
> +
>  /* Video Path */
>  #define VPCTRL0			0x0450
>  #define VSDELAY			GENMASK(31, 20)
> @@ -247,6 +290,9 @@ struct tc_data {
>  	struct drm_bridge	*panel_bridge;
>  	struct drm_connector	connector;
> =20
> +	struct mipi_dsi_device	*dsi;
> +	u8			dsi_lanes;
> +
>  	/* link settings */
>  	struct tc_edp_link	link;
> =20
> @@ -502,8 +548,10 @@ static int tc_pxl_pll_en(struct tc_data *tc, u32 ref=
clk, u32 pixelclock)
>  				/*
>  				 * refclk * mul / (ext_pre_div * pre_div)
>  				 * should be in the 150 to 650 MHz range
> +				 * for (e)DP
>  				 */
> -				if ((clk > 650000000) || (clk < 150000000))
> +				if ((tc->bridge.type !=3D DRM_MODE_CONNECTOR_DPI) &&
> +				    ((clk > 650000000) || (clk < 150000000)))
>  					continue;
> =20
>  				clk =3D clk / ext_div[i_post];
> @@ -741,7 +789,7 @@ static int tc_set_video_mode(struct tc_data *tc,
>  	int upper_margin =3D mode->vtotal - mode->vsync_end;
>  	int lower_margin =3D mode->vsync_start - mode->vdisplay;
>  	int vsync_len =3D mode->vsync_end - mode->vsync_start;
> -	u32 dp0_syncval;
> +	u32 dp0_syncval, value;
>  	u32 bits_per_pixel =3D 24;
>  	u32 in_bw, out_bw;
> =20
> @@ -815,56 +863,70 @@ static int tc_set_video_mode(struct tc_data *tc,
>  	if (ret)
>  		return ret;
> =20
> -	/* DP Main Stream Attributes */
> -	vid_sync_dly =3D hsync_len + left_margin + mode->hdisplay;
> -	ret =3D regmap_write(tc->regmap, DP0_VIDSYNCDELAY,
> -		 FIELD_PREP(THRESH_DLY, max_tu_symbol) |
> -		 FIELD_PREP(VID_SYNC_DLY, vid_sync_dly));
> +	if (tc->bridge.type =3D=3D DRM_MODE_CONNECTOR_DPI) {
> +		value =3D POCTRL_S2P;
> =20
> -	ret =3D regmap_write(tc->regmap, DP0_TOTALVAL,
> -			   FIELD_PREP(H_TOTAL, mode->htotal) |
> -			   FIELD_PREP(V_TOTAL, mode->vtotal));
> -	if (ret)
> -		return ret;
> +		if (tc->mode.flags & DRM_MODE_FLAG_NHSYNC)
> +			value |=3D POCTRL_HS_POL;
> =20
> -	ret =3D regmap_write(tc->regmap, DP0_STARTVAL,
> -			   FIELD_PREP(H_START, left_margin + hsync_len) |
> -			   FIELD_PREP(V_START, upper_margin + vsync_len));
> -	if (ret)
> -		return ret;
> +		if (tc->mode.flags & DRM_MODE_FLAG_NVSYNC)
> +			value |=3D POCTRL_VS_POL;
> =20
> -	ret =3D regmap_write(tc->regmap, DP0_ACTIVEVAL,
> -			   FIELD_PREP(V_ACT, mode->vdisplay) |
> -			   FIELD_PREP(H_ACT, mode->hdisplay));
> -	if (ret)
> -		return ret;
> +		ret =3D regmap_write(tc->regmap, POCTRL, value);
> +		if (ret)
> +			return ret;
> +	} else {
> +		/* DP Main Stream Attributes */
> +		vid_sync_dly =3D hsync_len + left_margin + mode->hdisplay;
> +		ret =3D regmap_write(tc->regmap, DP0_VIDSYNCDELAY,
> +			 FIELD_PREP(THRESH_DLY, max_tu_symbol) |
> +			 FIELD_PREP(VID_SYNC_DLY, vid_sync_dly));
> +
> +		ret =3D regmap_write(tc->regmap, DP0_TOTALVAL,
> +				   FIELD_PREP(H_TOTAL, mode->htotal) |
> +				   FIELD_PREP(V_TOTAL, mode->vtotal));
> +		if (ret)
> +			return ret;
> =20
> -	dp0_syncval =3D FIELD_PREP(VS_WIDTH, vsync_len) |
> -		      FIELD_PREP(HS_WIDTH, hsync_len);
> +		ret =3D regmap_write(tc->regmap, DP0_STARTVAL,
> +				   FIELD_PREP(H_START, left_margin + hsync_len) |
> +				   FIELD_PREP(V_START, upper_margin + vsync_len));
> +		if (ret)
> +			return ret;
> =20
> -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> -		dp0_syncval |=3D SYNCVAL_VS_POL_ACTIVE_LOW;
> +		ret =3D regmap_write(tc->regmap, DP0_ACTIVEVAL,
> +				   FIELD_PREP(V_ACT, mode->vdisplay) |
> +				   FIELD_PREP(H_ACT, mode->hdisplay));
> +		if (ret)
> +			return ret;
> =20
> -	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> -		dp0_syncval |=3D SYNCVAL_HS_POL_ACTIVE_LOW;
> +		dp0_syncval =3D FIELD_PREP(VS_WIDTH, vsync_len) |
> +			      FIELD_PREP(HS_WIDTH, hsync_len);
> =20
> -	ret =3D regmap_write(tc->regmap, DP0_SYNCVAL, dp0_syncval);
> -	if (ret)
> -		return ret;
> +		if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +			dp0_syncval |=3D SYNCVAL_VS_POL_ACTIVE_LOW;
> =20
> -	ret =3D regmap_write(tc->regmap, DPIPXLFMT,
> -			   VS_POL_ACTIVE_LOW | HS_POL_ACTIVE_LOW |
> -			   DE_POL_ACTIVE_HIGH | SUB_CFG_TYPE_CONFIG1 |
> -			   DPI_BPP_RGB888);
> -	if (ret)
> -		return ret;
> +		if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +			dp0_syncval |=3D SYNCVAL_HS_POL_ACTIVE_LOW;
> =20
> -	ret =3D regmap_write(tc->regmap, DP0_MISC,
> -			   FIELD_PREP(MAX_TU_SYMBOL, max_tu_symbol) |
> -			   FIELD_PREP(TU_SIZE, TU_SIZE_RECOMMENDED) |
> -			   BPC_8);
> -	if (ret)
> -		return ret;
> +		ret =3D regmap_write(tc->regmap, DP0_SYNCVAL, dp0_syncval);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D regmap_write(tc->regmap, DPIPXLFMT,
> +				   VS_POL_ACTIVE_LOW | HS_POL_ACTIVE_LOW |
> +				   DE_POL_ACTIVE_HIGH | SUB_CFG_TYPE_CONFIG1 |
> +				   DPI_BPP_RGB888);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D regmap_write(tc->regmap, DP0_MISC,
> +				   FIELD_PREP(MAX_TU_SYMBOL, max_tu_symbol) |
> +				   FIELD_PREP(TU_SIZE, TU_SIZE_RECOMMENDED) |
> +				   BPC_8);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	return 0;
>  }
> @@ -1164,7 +1226,76 @@ static int tc_main_link_disable(struct tc_data *tc)
>  	return regmap_write(tc->regmap, DP0CTL, 0);
>  }
> =20
> -static int tc_stream_enable(struct tc_data *tc)
> +static int tc_dpi_stream_enable(struct tc_data *tc)
> +{
> +	int ret;
> +	u32 value;
> +
> +	dev_dbg(tc->dev, "enable video stream\n");
> +
> +	/* Setup PLL */
> +	ret =3D tc_set_syspllparam(tc);
> +	if (ret)
> +		return ret;
> +
> +	/* Pixel PLL must always be enabled for DPI mode */
> +	ret =3D tc_pxl_pll_en(tc, clk_get_rate(tc->refclk),
> +			    1000 * tc->mode.clock);
> +	if (ret)
> +		return ret;
> +
> +	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 3);
> +	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 3);
> +	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 3);
> +	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 3);
> +	regmap_write(tc->regmap, PPI_D0S_ATMR, 0);
> +	regmap_write(tc->regmap, PPI_D1S_ATMR, 0);
> +	regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
> +	regmap_write(tc->regmap, PPI_LPTXTIMECNT, LPX_PERIOD);
> +
> +	value =3D ((LANEENABLE_L0EN << tc->dsi_lanes) - LANEENABLE_L0EN) |
> +		LANEENABLE_CLEN;
> +	regmap_write(tc->regmap, PPI_LANEENABLE, value);
> +	regmap_write(tc->regmap, DSI_LANEENABLE, value);
> +
> +	ret =3D tc_set_video_mode(tc, &tc->mode);
> +	if (ret)
> +		return ret;
> +
> +	/* Set input interface */
> +	value =3D DP0_AUDSRC_NO_INPUT;
> +	if (tc_test_pattern)
> +		value |=3D DP0_VIDSRC_COLOR_BAR;
> +	else
> +		value |=3D DP0_VIDSRC_DSI_RX;
> +	ret =3D regmap_write(tc->regmap, SYSCTRL, value);
> +	if (ret)
> +		return ret;
> +
> +	msleep(100);
> +
> +	regmap_write(tc->regmap, PPI_STARTPPI, PPI_START_FUNCTION);
> +	regmap_write(tc->regmap, DSI_STARTDSI, DSI_RX_START);
> +
> +	return 0;
> +}
> +
> +static int tc_dpi_stream_disable(struct tc_data *tc)
> +{
> +	int ret;
> +
> +	dev_dbg(tc->dev, "disable video stream\n");
> +
> +	ret =3D regmap_update_bits(tc->regmap, DP0CTL, VID_EN, 0);
> +	if (ret)
> +		return ret;
> +
> +	tc_pxl_pll_dis(tc);
> +
> +	return 0;
> +}
> +
> +static int tc_edp_stream_enable(struct tc_data *tc)
>  {
>  	int ret;
>  	u32 value;
> @@ -1219,7 +1350,7 @@ static int tc_stream_enable(struct tc_data *tc)
>  	return 0;
>  }
> =20
> -static int tc_stream_disable(struct tc_data *tc)
> +static int tc_edp_stream_disable(struct tc_data *tc)
>  {
>  	int ret;
> =20
> @@ -1291,7 +1422,36 @@ static int tc_hardware_init(struct tc_data *tc)
>  	return 0;
>  }
> =20
> -static void tc_bridge_enable(struct drm_bridge *bridge)
> +static void tc_dpi_bridge_enable(struct drm_bridge *bridge)
> +{
> +	struct tc_data *tc =3D bridge_to_tc(bridge);
> +	int ret;
> +
> +	ret =3D tc_hardware_init(tc);
> +	if (ret < 0) {
> +		dev_err(tc->dev, "failed to initialize bridge: %d\n", ret);
> +		return;
> +	}
> +
> +	ret =3D tc_dpi_stream_enable(tc);
> +	if (ret < 0) {
> +		dev_err(tc->dev, "main link stream start error: %d\n", ret);
> +		tc_main_link_disable(tc);
> +		return;
> +	}
> +}
> +
> +static void tc_dpi_bridge_disable(struct drm_bridge *bridge)
> +{
> +	struct tc_data *tc =3D bridge_to_tc(bridge);
> +	int ret;
> +
> +	ret =3D tc_dpi_stream_disable(tc);
> +	if (ret < 0)
> +		dev_err(tc->dev, "main link stream stop error: %d\n", ret);
> +}
> +
> +static void tc_edp_bridge_enable(struct drm_bridge *bridge)
>  {
>  	struct tc_data *tc =3D bridge_to_tc(bridge);
>  	int ret;
> @@ -1314,7 +1474,7 @@ static void tc_bridge_enable(struct drm_bridge *bri=
dge)
>  		return;
>  	}
> =20
> -	ret =3D tc_stream_enable(tc);
> +	ret =3D tc_edp_stream_enable(tc);
>  	if (ret < 0) {
>  		dev_err(tc->dev, "main link stream start error: %d\n", ret);
>  		tc_main_link_disable(tc);
> @@ -1322,12 +1482,12 @@ static void tc_bridge_enable(struct drm_bridge *b=
ridge)
>  	}
>  }
> =20
> -static void tc_bridge_disable(struct drm_bridge *bridge)
> +static void tc_edp_bridge_disable(struct drm_bridge *bridge)
>  {
>  	struct tc_data *tc =3D bridge_to_tc(bridge);
>  	int ret;
> =20
> -	ret =3D tc_stream_disable(tc);
> +	ret =3D tc_edp_stream_disable(tc);
>  	if (ret < 0)
>  		dev_err(tc->dev, "main link stream stop error: %d\n", ret);
> =20
> @@ -1348,9 +1508,20 @@ static bool tc_bridge_mode_fixup(struct drm_bridge=
 *bridge,
>  	return true;
>  }
> =20
> -static enum drm_mode_status tc_mode_valid(struct drm_bridge *bridge,
> -					  const struct drm_display_info *info,
> -					  const struct drm_display_mode *mode)
> +static enum drm_mode_status tc_dpi_mode_valid(struct drm_bridge *bridge,
> +					      const struct drm_display_info *info,
> +					      const struct drm_display_mode *mode)
> +{
> +	/* DPI interface clock limitation: upto 100 MHz */
> +	if (mode->clock > 100000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}

This needs to happen in atomic_check as well, mode_valid only prevents
the mode from being advertised to the userspace, but it doesn't prevent
the user from trying an insane mode.

Maxime

--pfpc7ztby4izzy5w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfvJ3gAKCRDj7w1vZxhR
xYBIAP9RTEleOA59iU9Zj/56YoxgTYuEd6GzOYUr4Mr0VsYeQgEAg60bkMxWSIjA
4Sk/OAct6+Gwa4G51TFSUjLcyzAZ2AM=
=uXuw
-----END PGP SIGNATURE-----

--pfpc7ztby4izzy5w--

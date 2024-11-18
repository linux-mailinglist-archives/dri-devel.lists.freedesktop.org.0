Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1155D9D14AF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 16:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5608810E51A;
	Mon, 18 Nov 2024 15:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MSjNA0Cm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2A610E51A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 15:46:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6D671A40DC4;
 Mon, 18 Nov 2024 15:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DF6C4CECC;
 Mon, 18 Nov 2024 15:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731944815;
 bh=WNrW3/tULqjb523vUE87ymlM/sk1V7Tb/5c1zihqYyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MSjNA0CmOxIZoRtLJcZ5I7vUdO3vz2wIU4ysjd2XFfrR2YjNGsDwNpnbbj518aWgH
 gSL1rEJJOOj+AlnzV2DNLcykNbAochaKGB6OGrpUC5T7aXuynP7si7x4OIbj92Luvk
 Xc5eeu1YSZaMbnB4iuSPCHtXkOa/8sdokBKnGtuZLcI0avEzfuZGIxkrCZSTUEzhNU
 kLe5/lRuuQbNEHLj+mjjZy+Ja2jAkCRwPRC37ikTtz8uuBfX0bDvzsANSVTjg/r/tU
 eNTmLkpLX3CnZad2EebkuKSgYkAObZWRFKgyHuvejhLNhpa030KjM/Ph3nI1ApJxqp
 a6WCLedyKIPkw==
Date: Mon, 18 Nov 2024 16:46:53 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
 Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, 
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
Message-ID: <20241118-sceptical-mastodon-of-pizza-df93de@houat>
References: <20241008223846.337162-1-marex@denx.de>
 <dbede671-c97b-4ad7-8a54-f1b381fea082@nxp.com>
 <00ffd38c-b01a-40cd-9130-19c35a387ca0@denx.de>
 <819380c3-d13f-4989-b305-388fc60d30e4@nxp.com>
 <d99e0021-3253-4312-9b50-6031ae0f8d8e@denx.de>
 <d1307426-9a86-4356-93b8-9a10c8369ad8@nxp.com>
 <20241022-quirky-ubiquitous-hamster-11dca5@houat>
 <47d92ae0-c71a-4c18-9ad7-432c0f70a31f@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="daaqffk3kobrz3nx"
Content-Disposition: inline
In-Reply-To: <47d92ae0-c71a-4c18-9ad7-432c0f70a31f@nxp.com>
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


--daaqffk3kobrz3nx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
MIME-Version: 1.0

On Thu, Oct 31, 2024 at 10:35:27AM +0800, Liu Ying wrote:
> Hi Maxime,
>=20
> On 10/22/2024, Maxime Ripard wrote:
> > On Tue, Oct 22, 2024 at 02:13:57PM +0800, Liu Ying wrote:
> >> On 10/13/2024, Marek Vasut wrote:
> >>> On 10/11/24 8:18 AM, Liu Ying wrote:
> >>>> On 10/11/2024, Marek Vasut wrote:
> >>>>> On 10/10/24 7:22 AM, Liu Ying wrote:
> >>>>>> On 10/09/2024, Marek Vasut wrote:
> >>>>>>> The media_ldb_root_clk supply LDB serializer. These clock are usu=
ally
> >>>>>>> shared with the LCDIFv3 pixel clock and supplied by the Video PLL=
 on
> >>>>>>> i.MX8MP, but the LDB clock run at either x7 or x14 rate of the LC=
DIFv3
> >>>>>>> pixel clock. Allow the LDB to reconfigure Video PLL as needed, as=
 that
> >>>>>>> results in accurate serializer clock.
> >>>>>>>
> >>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>>>>> ---
> >>>>>>> Cc: Abel Vesa <abelvesa@kernel.org>
> >>>>>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> >>>>>>> Cc: David Airlie <airlied@gmail.com>
> >>>>>>> Cc: Fabio Estevam <festevam@gmail.com>
> >>>>>>> Cc: Isaac Scott <isaac.scott@ideasonboard.com>
> >>>>>>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> >>>>>>> Cc: Jonas Karlman <jonas@kwiboo.se>
> >>>>>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> >>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>>>>> Cc: Maxime Ripard <mripard@kernel.org>
> >>>>>>> Cc: Michael Turquette <mturquette@baylibre.com>
> >>>>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>>>> Cc: Peng Fan <peng.fan@nxp.com>
> >>>>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> >>>>>>> Cc: Robert Foss <rfoss@kernel.org>
> >>>>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> >>>>>>> Cc: Shawn Guo <shawnguo@kernel.org>
> >>>>>>> Cc: Simona Vetter <simona@ffwll.ch>
> >>>>>>> Cc: Stephen Boyd <sboyd@kernel.org>
> >>>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>>> Cc: dri-devel@lists.freedesktop.org
> >>>>>>> Cc: imx@lists.linux.dev
> >>>>>>> Cc: kernel@dh-electronics.com
> >>>>>>> Cc: linux-arm-kernel@lists.infradead.org
> >>>>>>> Cc: linux-clk@vger.kernel.org
> >>>>>>> ---
> >>>>>>> =A0=A0 drivers/clk/imx/clk-imx8mp.c | 2 +-
> >>>>>>> =A0=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-i=
mx8mp.c
> >>>>>>> index 516dbd170c8a3..2e61d340b8ab7 100644
> >>>>>>> --- a/drivers/clk/imx/clk-imx8mp.c
> >>>>>>> +++ b/drivers/clk/imx/clk-imx8mp.c
> >>>>>>> @@ -611,7 +611,7 @@ static int imx8mp_clocks_probe(struct platfor=
m_device *pdev)
> >>>>>>> =A0=A0=A0=A0=A0=A0 hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] =3D imx8m_=
clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, cc=
m_base + 0xbd80);
> >>>>>>> =A0=A0=A0=A0=A0=A0 hws[IMX8MP_CLK_MEDIA_DISP1_PIX] =3D imx8m_clk_=
hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_b=
ase + 0xbe00, CLK_SET_RATE_PARENT);
> >>>>>>> =A0=A0=A0=A0=A0=A0 hws[IMX8MP_CLK_MEDIA_CAM2_PIX] =3D imx8m_clk_h=
w_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80=
);
> >>>>>>> -=A0=A0=A0 hws[IMX8MP_CLK_MEDIA_LDB] =3D imx8m_clk_hw_composite("=
media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
> >>>>>>> +=A0=A0=A0 hws[IMX8MP_CLK_MEDIA_LDB] =3D imx8m_clk_hw_composite_b=
us_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RAT=
E_PARENT);
> >>>>>>
> >>>>>> This patch would cause the below in-flight LDB bridge driver
> >>>>>> patch[1] fail to do display mode validation upon display modes
> >>>>>> read from LVDS to HDMI converter IT6263's DDC I2C bus.
> >>>>>
> >>>>> Why ?
> >>>>
> >>>> Mode validation is affected only for dual LVDS link mode.
> >>>> For single LVDS link mode, this patch does open more display
> >>>> modes read from the DDC I2C bus.=A0 The reason behind is that
> >>>> LVDS serial clock rate/pixel clock rate =3D 3.5 for dual LVDS
> >>>> link mode, while it's 7 for single LVDS link mode.
> >>>>
> >>>> In my system, "video_pll1" clock rate is assigned to 1.0395GHz
> >>>> in imx8mp.dtsi.=A0 For 1920x1080-60.00Hz with 148.5MHz pixel
> >>>> clock rate, "media_ldb" clock rate is 519.75MHz and
> >>>> "media_disp2_pix" clock rate is 148.5MHz, which is fine for
> >>>> dual LVDS link mode(x3.5).=A0 For newly opened up 1920x1080-59.94Hz
> >>>> with 148.352MHz pixel clock rate, "video_pll1" clock rate will
> >>>> be changed to 519.232MHz, "media_ldb" clock rate is 519.232MHz
> >>>> and "media_disp2_pix" clock rate is wrongly set to 519.232MHz
> >>>> too because "media_disp2_pix" clock cannot handle the 3.5
> >>>> division ratio from "video_pll1_out" clock running at
> >>>> 519.232MHz.=A0 See the below clk_summary.
> >>>
> >>> Shouldn't this patch help exactly with that ?
> >>
> >> No, it doesn't help but only makes clk_round_rate() called in
> >> LDB driver's .mode_valid() against 148.352MHz return 148.352MHz
> >> which allows the unexpected 1920x1080-59.94Hz display mode.
> >>
> >>>
> >>> It should allow you to set video_pll1_out to whatever is necessary by=
 LDB first, fixate that frequency, and the LCDIFv3 would then be forced to =
use /7 divider from faster Video PLL1 , right ?
> >>
> >> Yes, it allows that for single-link LVDS use cases.
> >> And, __no__, for dual-link LVDS use cases because the
> >> video_pll1_out clock rate needs to be 2x the LVDS serial clock
> >> rate.=20
> >>
> >>>
> >>>> =A0=A0=A0=A0 video_pll1_ref_sel=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 1=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0 24=
000000=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0 50000=A0=A0=A0=
=A0=A0 Y=A0=A0=A0=A0=A0 deviceless=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 no_connection_id
> >>>> =A0=A0=A0=A0=A0=A0=A0 video_pll1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=
=A0=A0=A0=A0 519232000=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0 500=
00=A0=A0=A0=A0=A0 Y=A0=A0=A0=A0=A0=A0=A0=A0 deviceless=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 no_connection_id
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 video_pll1_bypass=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 1=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=
 519232000=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0 50000=A0=A0=A0=
=A0=A0 Y=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 deviceless=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 no_connection_id
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 video_pll1_out=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 2=A0=A0=A0=A0=A0=A0 2=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=
=A0=A0 519232000=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0 50000=A0=
=A0=A0=A0=A0 Y=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 deviceless=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 no_connection_id
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 media_ldb=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=
=A0=A0=A0=A0=A0 519232000=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0 =
50000=A0=A0=A0=A0=A0 Y=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d=
eviceless=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 no=
_connection_id
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 media_ldb_=
root_clk 1=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0 =
519232000=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0 50000=A0=A0=A0=
=A0=A0 Y=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 32ec00=
00.blk-ctrl:bridge@5c=A0=A0=A0=A0 ldb
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 deviceless=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 no_connection_id
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 media_disp1_pix=A0=
=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=
=A0 129808000=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0 50000=A0=A0=
=A0=A0=A0 N=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 deviceless=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 no_connecti=
on_id
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 media_disp=
1_pix_root_clk 0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=
=A0=A0 129808000=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0 50000=A0=
=A0=A0=A0=A0 N=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
32e80000.display-controller=A0=A0=A0=A0 pix
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 32ec0000.blk-ctrl=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 disp1
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 deviceless=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 no_connection_id
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 media_disp2_pix=A0=
=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=
=A0 519232000=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0 50000=A0=A0=
=A0=A0=A0 Y=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 deviceless=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 no_connecti=
on_id
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 media_disp=
2_pix_root_clk 1=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=
=A0=A0 519232000=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0 50000=A0=
=A0=A0=A0=A0 Y=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
32e90000.display-controller=A0=A0=A0=A0 pix
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 32ec0000.blk-ctrl=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 disp2
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 deviceless=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 no_connection_id
> >>>>
> >>>> Single LVDS link mode is not affected because "media_disp2_pix"
> >>>> clock can handle the 7 division ratio.
> >>>>
> >>>> To support the dual LVDS link mode, "video_pll1" clock rate needs
> >>>> to be x2 "media_ldb" clock rate so that "media_disp2_pix" clock
> >>>> can use 7 division ratio to achieve the /3.5 clock rate comparing
> >>>> to "media_ldb" clock rate.=A0 However, "video_pll1" is not seen by
> >>>> LDB driver thus not directly controlled by it.=A0 This is another
> >>>> reason why assigning a reasonable "video_pll1" clock rate in DT
> >>>> makes sense.
> >>>
> >>> I agree that _right_now_, the DT clock assignment is the only option.
> >>> I would like to see that DT part disappear and instead would prefer i=
f the LDB/LCDIF could figure out the clock tree configuration themselves.
> >>
> >> I think we'll live with the assigned clock rate in DT, because the
> >> i.MX8MP LDB and Samsung MIPI DSI display pipelines need to share a
> >> video PLL, like I mentioned in comments for patch 2.
> >=20
> > Guys. There's 4 different discussions that look to be on the same topic,
> > and doing workarounds in the DT, DRM driver and clock driver for
> > something that looks like a broken clock.
>=20
> This is a bit complicated, because it is related to i.MX8MP MIPI DSI/
> LVDS/HDMI, i.MX93 MIPI DSI/LVDS/parallel display pipelines.  Even
> i.MX6SX LVDS display pipeline is a bit related, since i.MX8MP/i.MX93/
> i.MX6SX LDBs share the same fsl-ldb.c driver.
>=20
> >=20
> > Could we have *somewhere* a proper description of what the problem is
> > exactly, so we can review it? Because at the moment, it's certainly not
> > helping.
>=20
> Can you please suggest a place where this could happen?

Here, by mail will be good. Worst case scenario using a ascii art.

Maxime

--daaqffk3kobrz3nx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZzthbAAKCRAnX84Zoj2+
drubAYDnfOPHEbUtSBuKsSW0gwIdqyDhobohzo9e8ywlQGt8/ZdxHagqLzmAANjC
lfvXD8YBfiUmQk9afkVIWM8Lk15XjzxrIrfcAhwZuqOrsIwH11sfRr3+lczF7pKs
0ats6CZJoQ==
=5w/N
-----END PGP SIGNATURE-----

--daaqffk3kobrz3nx--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE9EA003BE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 06:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A50510E430;
	Fri,  3 Jan 2025 05:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OdaSSUWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A8210E430
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 05:45:54 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-aaeecbb7309so1276976466b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 21:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735883093; x=1736487893; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KOcDqtGRXf/UHLTIfgwSITvMK0QtY2PkEv0bG0mXGH8=;
 b=OdaSSUWB9TV3BA/2uJpKHcOOCf1vSeLFUSxA1NBaJISPu5A9NvvsgHvev9x0rQOepJ
 i8ou31i/LyaEFB5/Zo9aRZhX1OEh5UK67cWnt611W4SyV10BErHeYE9kNiQgGs8HklyM
 Uhv0el7j4EkW8D2zDC2cg9yDUeYH0tYshUjqe3iPXRaL9TleYouLfktXHeVje78OxCpL
 CHzdqlV6oaHc7lVQ6WpWt00jwr9DWGdp3wzpLemYq95b8oZx91sfR+eVTsu0SDquDY1g
 AxUE98a2cV2iP7i79oyTGxpXnjcgk5qhqazvGKxQcXykCG89ElubSg3VNqPGUSuNOMex
 e6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735883093; x=1736487893;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KOcDqtGRXf/UHLTIfgwSITvMK0QtY2PkEv0bG0mXGH8=;
 b=GXhc6qb3T0VxJXsVJ2fLABqi6PCeuBfCPaJvdSXI9JnkDdBnzJlcHjvDqYWRmd77sV
 0nN8XvRCe8f+wlZOGotcYU51jg0uTXq82UdAC3cwbDzJo+JOwk95oalW/CPy5UZSfxt4
 ZC2ySG3/iL6w0BKb6g4Ei3bFN7/mYvWcA/MTYKBQ2t6wPvB23/gYNPVDdf+gwJWhNwxz
 g1+IGPU2Bh6NpPdV9C6c7hyLf59AwA+FDMahBkq+ZEk8XthJ5FeFvtQLingeO1/TpzDX
 +/v26lf7QPggXYehQQjIZhxFMyBiadBvg59FDVRhKxZi4IJ2Eer7kYKT65KDK+r87pIJ
 9qrA==
X-Gm-Message-State: AOJu0YylaC3SiCGxlcuhRvK64W/Hcft8Ra8jO/7aV030LoDvRrFpxAD6
 V4W8+pppfNLMOyYDLZSp+kz8auT4C0fAt/ai1wnZee0DbiuNt6t+ehVo0mO0qy1xPTdtTsGCIHb
 v
X-Gm-Gg: ASbGncvkD6/2IbswlhVA0UtMme6BYGPcXGPoehBeOmelEluJvxBpL1afOYGOqTccqZu
 fhrGC1S3I11FbHAfhLX7frbhOC9tc3r3/lFFXUUTCLsTGVziWDVFwDRXDsa/tK4iHkcGy4Iivu4
 Qqa3oN8/Zi/A1zSY6l6npWBXtB25VP7y47fnX7ynIQK8DXMW7sTEAhjWc9E4jNtxK51Gx+kCioM
 j1s1X6ElfGrRnVsDdp7T7Pc0yjqTNeONfFryOcBXcDBtv0y7WpHsPQyVJISTX1R9i7RvY2VY2jI
 og+MvVX8pGzUtgy1+JEDg9ZW6uMiVTe+YuJq
X-Google-Smtp-Source: AGHT+IGHQO4fKXV4A6UUeSv9pwYWeECIbpOiy9USqHzKJoO5upSfChVq4x5/CdajiSuV1O+v4t+BjQ==
X-Received: by 2002:a05:6512:334e:b0:542:218a:343 with SMTP id
 2adb3069b0e04-542295989femr10755627e87.52.1735882631424; 
 Thu, 02 Jan 2025 21:37:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238215c1sm3942084e87.206.2025.01.02.21.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 21:37:10 -0800 (PST)
Date: Fri, 3 Jan 2025 07:37:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <elhtblbv265iorfwagrdenkujrbufakqakgajkdmldcen3xrar@plu5h3jrfqmh>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-2-marex@denx.de>
 <sjyw3afx5qyrupf5tixgtubevmklgmstjvj3hjt5xukzmgluuv@47j6afzl5dp6>
 <549d96ee-a675-47fd-9af0-0dc05744591c@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <549d96ee-a675-47fd-9af0-0dc05744591c@denx.de>
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

On Fri, Jan 03, 2025 at 12:22:34AM +0100, Marek Vasut wrote:
> On 1/2/25 5:55 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 31, 2024 at 08:28:49PM +0100, Marek Vasut wrote:
> > > The dw-hdmi output_port is set to 1 in order to look for a connector
> > > next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> > > The output_port set to 1 makes the DW HDMI driver core look up the
> > > next bridge in DT, where the next bridge is often the hdmi-connector .
> > > 
> > > Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> > > 
> > > Note that looking at the upstream arch/arm64/boot/dts/freescale/imx8mp*dts ,
> > > the oldest commit which adds HDMI support is commit:
> > > 
> > > 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")
> > > 
> > > That already contains the HDMI connector node. Most follow up additions
> > > of HDMI support to another devices has been a variation of the same commit,
> > > including connector node, which is the proper way of eanbling HDMI on the
> > > i.MX8MP.
> > > 
> > > The rest should be covered by output_port_optional which should make systems
> > > with DTs without HDMI connector node work, but such DTs should be updated and
> > > the HDMI connector node should be added.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > Cc: Liu Ying <victor.liu@nxp.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Robert Foss <rfoss@kernel.org>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: Stefan Agner <stefan@agner.ch>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: imx@lists.linux.dev
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > ---
> > > V2: No change
> > > V3: - Update commit message
> > >      - Move select DRM_DISPLAY_CONNECTOR to DRM_IMX8MP_DW_HDMI_BRIDGE
> > >      - Enable output_port_optional
> > > ---
> > >   drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
> > >   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 2 ++
> > >   2 files changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> > > index 9a480c6abb856..db5c8a76193ac 100644
> > > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > > @@ -17,6 +17,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
> > >   	tristate "Freescale i.MX8MP HDMI-TX bridge support"
> > >   	depends on OF
> > >   	depends on COMMON_CLK
> > > +	select DRM_DISPLAY_CONNECTOR
> > 
> > I was going to write that it is not to be selected by anybody, but then
> > I stumbled upon meson driver, which also selects the symbol.
> > 
> > I still think that it is not to be selected by your driver as there is
> > no direct dependency (and there can be other bridges inbetween or the
> > bridge chain can end up with some other bridge). Such decisions belong
> > to defconfig or distribution's kernel config file.
> Wouldn't that only lead to unnecessary surprises on user side ?

This is of no concerns to Kconfig. You can't select all drivers that can
possibly be used with your platform / driver. `git grep
DRM_DISPLAY_CONNECTOR`.

-- 
With best wishes
Dmitry

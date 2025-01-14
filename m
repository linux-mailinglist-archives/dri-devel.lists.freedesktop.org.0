Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04446A10DCA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 18:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB0710E3FD;
	Tue, 14 Jan 2025 17:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="L+Mn8MLe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE20610E408
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vK4b5hmfFQg90bKf5c35DlRbGDFITMqw3G3MDy4quhw=; b=L+Mn8MLeKAqlc3Yy3KOe4L8g73
 WZimn4WgzcyM0muig8nFU9U7oZoRkZXYu9gfUshX0xsVcSpeM4ltf2FunIveIcvBkcL4sE330nOwn
 hvOAQ/fa++zhoCC/Ba8nng+m8vgBLpcuD0b0h4jKnwM5+Xw7bOcS3Fenvvak5uFcZWKHHEnYicAPJ
 dxqxsWtuX9MGUxNhvXFC75M5LBKbQgyJnOhE9CTzWI29oezpyCTks6eVjB7SeyeMG9nOId+vK7d3f
 hodL28z6NCAwZsOcVs1TT+N+1yXW9B5ibz6l6Gx5a5Gcdn0Q39dgbEL8wy2ysiy1L/GxhvyXvGjT+
 X7liPiYA==;
Received: from i53875b2c.versanet.de ([83.135.91.44] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tXkkJ-0005Ki-N1; Tue, 14 Jan 2025 18:30:31 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chris Hofstaedtler <zeha@debian.org>, andy.yan@rock-chips.com,
 Guochun Huang <hero.huang@rock-chips.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>,
 Daniel Semkowicz <dse@thaumatec.com>, Dmitry Yashin <dmt.yashin@gmail.com>
Subject: Re: [PATCH v4 1/3] drm/bridge/synopsys: Add MIPI DSI2 host controller
 bridge
Date: Tue, 14 Jan 2025 18:30:30 +0100
Message-ID: <3556284.QJadu78ljV@diego>
In-Reply-To: <Z3IDh0TOAKqaovz2@per.namespace.at>
References: <20241209231021.2180582-1-heiko@sntech.de>
 <20241209231021.2180582-2-heiko@sntech.de>
 <Z3IDh0TOAKqaovz2@per.namespace.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Chris,

Am Montag, 30. Dezember 2024, 03:20:55 CET schrieb Chris Hofstaedtler:
> On Tue, Dec 10, 2024 at 12:10:19AM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > 
> > Add a Synopsys Designware MIPI DSI host DRM bridge driver for their
> > DSI2 host controller, based on the Rockchip version from the driver
> > rockchip/dw-mipi-dsi2.c in their vendor-kernel with phy & bridge APIs.
> > 
> > While the driver is heavily modelled after the previous IP, the register
> > set of this DSI2 controller is completely different and there are also
> > additional properties like the variable-width phy interface.
> > 
> > Tested-by: Daniel Semkowicz <dse@thaumatec.com>
> > Tested-by: Dmitry Yashin <dmt.yashin@gmail.com>
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> [..]
> > +static void dw_mipi_dsi2_set_vid_mode(struct dw_mipi_dsi2 *dsi2)
> > +{
> > +	u32 val = 0, mode;
> > +	int ret;
> > +
> > +	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
> > +		val |= BLK_HFP_HS_EN;
> > +
> > +	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
> > +		val |= BLK_HBP_HS_EN;
> > +
> > +	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
> > +		val |= BLK_HSA_HS_EN;
> 
> For all three of these: is setting an ENable bit the right thing to
> turn features *off*?

first of all, thanks a lot for noticing this discrepancy :-) .

Looking at the documentation, all 3 of those hw-bits are described as
  "Enables filling the H.. period with blanking packets. ..."

where the MIPI_DSI_VIDEO_MODE_NO_* flags are described as
  "disable hfront-porch/... area"


So yes, I _think_ "disable front-porch" would _should_ result in
"don't fill the period with blanking packets", but am not fully sure.

I've run the two boards I have with inverting the checks as sounds
sensible right now, aka doing:
	if (!(dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
etc and both displays I have ran just fine.

As the driver was originally part of a vendor-kernel based on 5.10, which
I think was before the _NO addition from [0] it could be caused by a
misread of the flags that were named differently back then.


So yes, switching things around does sound like the right thing to do.


Heiko

[0] https://lore.kernel.org/all/20210629074703.v2.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid/




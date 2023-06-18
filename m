Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BBF734734
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 19:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F0910E04F;
	Sun, 18 Jun 2023 17:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C4A10E04F
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 17:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=vG7sqVWtMF5VuXJqEO+23Khmg6kDKBBpVF/2bD8xXYI=;
 b=BvIbBOVm2GyNkHeIoITTHmii1o0VDJJchx9+/wmJGMuwSo/aaTwoeGCx31BVoe2PpoYalgMInmsMT
 9skWHS5xA/IpC4oqoCuoUn5ZQF1cNerBWAjeNPAGIim/AmcS0KBYLGjSVBCLGdRlcPfXDQphcP+UMK
 QmVJWFoYWQzJBMoakyK4b4uLW3hRbB2XNdgJV1XBNj6U9gZxzIUSrCztuJpvVfGcnQeidBuy7oryh2
 9ZqFGsuoaJDGyWCU/cHn6oMsEWh5uGK4SuqQESM7lYsoJLLXqTcJ+vFNEvqtjFfd/rylsGbEjXxscS
 pHA3HPBaePnwfICzoYqclq4DkdmHx3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=vG7sqVWtMF5VuXJqEO+23Khmg6kDKBBpVF/2bD8xXYI=;
 b=6dU47njDUKpt0LUz5p1kycpETnpqrJz5uCy66LvPBlYGJlqr52zoHIWQkkXSSU/sDTSHs4AEatljr
 nL3Nr9+Bw==
X-HalOne-ID: 9902f0ff-0dfd-11ee-84b3-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 9902f0ff-0dfd-11ee-84b3-6f01c1d0a443;
 Sun, 18 Jun 2023 17:28:55 +0000 (UTC)
Date: Sun, 18 Jun 2023 19:28:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for Mitsubishi
 AA084XE01
Message-ID: <20230618172854.GA1952539@ravnborg.org>
References: <20230616164524.2806421-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616164524.2806421-1-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Thomas Weber <thomas.weber@corscience.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Miquel,

On Fri, Jun 16, 2023 at 06:45:24PM +0200, Miquel Raynal wrote:
> From: Thomas Weber <thomas.weber@corscience.de>
> 
> Add support for the Mitsubishi AA084XE01 panel which is an 8.4 inch XGA
> TFT-LCD module for industrial use.
> 
> Link: https://www.mouser.fr/datasheet/2/274/aa084xe01_e-364171.pdf
> Signed-off-by: Thomas Weber <thomas.weber@corscience.de>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 8a3b685c2fcc..f79c9f9124a0 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2670,6 +2670,30 @@ static const struct panel_desc mitsubishi_aa070mc01 = {
>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>  };
>  
> +static const struct drm_display_mode mitsubishi_aa084xe01_mode = {
> +	.clock = 80000,
> +	.hdisplay = 1024,
> +	.hsync_start = 1024 + 24,
> +	.hsync_end = 1024 + 24 + 63,
> +	.htotal = 1024 + 24 + 63 + 1,
> +	.vdisplay = 768,
> +	.vsync_start = 768 + 3,
> +	.vsync_end = 768 + 3 + 6,
> +	.vtotal = 768 + 3 + 6 + 1,
> +	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> +};
> +
> +static const struct panel_desc mitsubishi_aa084xe01 = {
> +	.modes = &mitsubishi_aa084xe01_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 1024,
> +		.height = 768,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB565_1X16,
> +};
The .connector_type must be set.
Also consider if .bus_flags needs to be specified.

	Sam

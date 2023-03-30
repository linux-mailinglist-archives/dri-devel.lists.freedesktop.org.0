Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D06CFED4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 10:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7D510ED3A;
	Thu, 30 Mar 2023 08:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996D710ED3A;
 Thu, 30 Mar 2023 08:44:10 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 352FC32005C1;
 Thu, 30 Mar 2023 04:44:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 30 Mar 2023 04:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680165846; x=1680252246; bh=4XNUjLlOKaJSjFfFdN+7SXwSxUZo6ku1tlT
 TLuNKmwU=; b=R9Ha0BW4icsJYig73ZgjSlV5zMrkqhE/O6liqwzxZ3ld8vmjXy3
 +mi3xd0LKpBJeETsFmmDjMNV3Q9vwSIRCMe2CW6Gt6Mn+RD9ttVW30veGm6UY3wP
 uUB1sNK/0e7NSLsldshPOLZWYx5Aj5Gk2Ys/xrlbO4u+PHAFMDAE+9P15/PnPClS
 XV3+TFs5xPOXCo2dQ+ErJ8/ju+WSKj/j3o19bYFXuInkfg5iUB+bt4ExpnSPnNRw
 yNj4pN784Lf6imHExCZozCKPSg4Q1E4AtNjZG66wYD8c/afReRCIup5YYXjYDQVA
 l51YhHhOWzqj6fYMqt7KCTQYWRwns9X4scg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680165846; x=1680252246; bh=4XNUjLlOKaJSjFfFdN+7SXwSxUZo6ku1tlT
 TLuNKmwU=; b=pGJ2Wkc1vhyVIqYsYkTyVHN1IIdjELHFbg+QtnK+FDl7HX6+Xs7
 +lYf3m3rGJxgAdNFmnbk7sKv3zSko+JBjagXZ6OJG+5ntfIGiNys0yv7YuPbPQ2i
 TIC0D4opV70TBxxPX+1QAA866/8emjfVuJ87zJuVUXj2D41nh5Pd15lw6GpJXkiR
 1zEbaS/Z5XqiyYHp4+9md9Uyccr/QFYpotXELJCT/kIQggGlmbeLXbf52G58E0Z8
 1x7YTtcwcYvomvGIRN/deaUmjfmIhh/n/cgN/k1BG+PpZz2+bCTs3sR39OmJD+Eb
 ZAPOkvAz4GYvTQBh2euZpO1mvyiyGpbebkA==
X-ME-Sender: <xms:1kslZJefsWI7nvhlyNdmS0sijFi12KrXLZoiHzeIbWGL41PtW0l9og>
 <xme:1kslZHO5LPQ8Vjr5hoZ_HWr0c04ze2E8ZVQrwgerAyIhbbtbtNydQ0xaD5wkcsGP1
 BsvM5vnftAKJ8brgd8>
X-ME-Received: <xmr:1kslZCigDM3wC4zPwO9cO9SknzeeweURz3jK4_j2lolny4JKUhZStq4vj30>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehkedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
 feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1kslZC-NB0DHVQXzJ1YStrVWNVRdkUhnyi8t2un8TXJrJ8W6TJkGgw>
 <xmx:1kslZFsbpzFx61dJ7df0pCJXUGKxflvkDrwzNYyweDR8kYWAspxnJQ>
 <xmx:1kslZBEEhelljLB8gsFEd5eTxHhUwO9hCMFwSc-oeJNsE0Pkwmdi2w>
 <xmx:1kslZGk6R_-hSFAdU5gzXIt-XaAJFHGy5zdWEt4YJ0GPPMHSEto1-w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Mar 2023 04:44:05 -0400 (EDT)
Date: Thu, 30 Mar 2023 10:44:04 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/scdc-helper: Pimp SCDC debugs
Message-ID: <20230330084404.5uku6p42rorcuhv2@penduick>
References: <20230329171402.2772-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230329171402.2772-1-ville.syrjala@linux.intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Emma Anholt <emma@anholt.net>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 29, 2023 at 08:14:02PM +0300, Ville Syrjala wrote:
> diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/=
display/drm_scdc_helper.c
> index c3ad4ab2b456..2b124152384c 100644
> --- a/drivers/gpu/drm/display/drm_scdc_helper.c
> +++ b/drivers/gpu/drm/display/drm_scdc_helper.c
> @@ -26,6 +26,8 @@
>  #include <linux/delay.h>
> =20
>  #include <drm/display/drm_scdc_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_device.h>
>  #include <drm/drm_print.h>
> =20
>  /**
> @@ -140,6 +142,7 @@ EXPORT_SYMBOL(drm_scdc_write);
> =20
>  /**
>   * drm_scdc_get_scrambling_status - what is status of scrambling?
> + * @connector: connector
>   * @adapter: I2C adapter for DDC channel
>   *
>   * Reads the scrambler status over SCDC, and checks the
> @@ -148,14 +151,17 @@ EXPORT_SYMBOL(drm_scdc_write);
>   * Returns:
>   * True if the scrambling is enabled, false otherwise.
>   */
> -bool drm_scdc_get_scrambling_status(struct i2c_adapter *adapter)
> +bool drm_scdc_get_scrambling_status(struct drm_connector *connector,
> +				    struct i2c_adapter *adapter)

Is there any driver where adapter isn't equal to connector->ddc?

If not, there's no reason to pass both

Maxime

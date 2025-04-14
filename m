Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7A5A88557
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 16:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960B310E519;
	Mon, 14 Apr 2025 14:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fo2J8iIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7AC10E519
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 14:41:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 07F66A49F2D;
 Mon, 14 Apr 2025 14:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4EEC4CEE2;
 Mon, 14 Apr 2025 14:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744641688;
 bh=cWqnGKre/AJ+uBJDkw2xfSaRhLZK6lmGSm5x9aeHPGg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fo2J8iIhDDDjtlNmmfpOmEqeq5AOfb9f1YVPvFeU/qRn33XnWUVF4J80EMbMwLxcK
 99YdPtbWncuGBxy9ZEDesg6vf31ZeDt+g/Sc8XZOgBLBZDF+AM4mSYgmhdQKm2ZJd2
 XwFD/XqTNWdFG/COCZ15eRnWQoX+uyPD1AGBzHhXUhrq7I9iSGgXVqsHt8+YBtrerF
 e8MhB4IAcim92G8FggtQKdzNJbbP+Bqd7qz575vkIfMAsG2flaEFHESqwaB4Bps8uH
 GMHWnTUubhHpq1Z3k+zDcZwo2exqididE9rQ+C8c5ASaxyW8Bj0PtDsk/xunZFi3Wv
 SmQD6KVwCbIlw==
Date: Mon, 14 Apr 2025 16:41:25 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 08/11] drm/vc4: hdmi: switch to generic CEC helpers
Message-ID: <20250414-thundering-marmoset-of-promotion-c8e0dc@houat>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-8-04809b10d206@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kisrvyl6ygk7uwlb"
Content-Disposition: inline
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-8-04809b10d206@oss.qualcomm.com>
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


--kisrvyl6ygk7uwlb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 08/11] drm/vc4: hdmi: switch to generic CEC helpers
MIME-Version: 1.0

On Mon, Apr 07, 2025 at 06:11:05PM +0300, Dmitry Baryshkov wrote:
> +static const struct drm_connector_hdmi_cec_adapter_ops vc4_hdmi_cec_adap_ops = {
> +	.base.unregister = drm_connector_hdmi_cec_unregister,
> +	.init = vc4_hdmi_cec_init,
> +	.enable = vc4_hdmi_cec_adap_enable,
> +	.log_addr = vc4_hdmi_cec_adap_log_addr,
> +	.transmit = vc4_hdmi_cec_adap_transmit,
> +};

Did you compile it? it looks like drm_connector_hdmi_cec_adapter_ops has been renamed, and it
doesn't have a base.unregister field anymore?

Maxime

--kisrvyl6ygk7uwlb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/0elAAKCRDj7w1vZxhR
xRstAQDseeLF3+wOjRX4FDWG1gzsPN4u0U3uth+lr62PR0BwxAD8D+xv+rQhSZRL
r0aNflxzktpW7TPg2LqP74PvX2cw0g0=
=+zwv
-----END PGP SIGNATURE-----

--kisrvyl6ygk7uwlb--

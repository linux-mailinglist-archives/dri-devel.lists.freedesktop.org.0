Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B358E971DB6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 17:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB5610E589;
	Mon,  9 Sep 2024 15:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZVWS7fJj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C8C10E589
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 15:13:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 925805C0208;
 Mon,  9 Sep 2024 15:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4081CC4CEC5;
 Mon,  9 Sep 2024 15:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725894811;
 bh=yV2uXKxMqi7mz1WN5z5wldbH9IOzkDhnMu2iCjQncXE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZVWS7fJjWHCb2XkF55GdXZwdBa+k3fkK+cw4UAr3EqvXyTfI5HLn3r58KlFT/WDsV
 PbYkTrZ4q73wlMOAtln4UfzZhSNyw09TeVtwWa9cZstso/O6rFXy/25dKOep/Z+Lqg
 2/ryq9Rmmkg/IT5inkt7UJmyMX4C4VjXEEqEufpvMSldUx7grYFUZC95ESgJAwIzqp
 Lfbvi7+DUpG3/H1Hdd1NyUrzTIdwyD9Taohfem49TD5DdHFTf1Sos/GP3wif/E8ULa
 6UG4dRuiD7mru0RBVt1NTuKA9fFOwcen268rsBW+UcX49ttd79K4myATTYwdclAO0M
 hTWfZ2LATQ6Ow==
Date: Mon, 9 Sep 2024 17:13:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>, 
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH v6 1/3] drm/bridge: synopsys: Add DW HDMI QP TX
 Controller support library
Message-ID: <20240909-horned-congenial-curassow-ebc5fa@houat>
References: <20240906-b4-rk3588-bridge-upstream-v6-0-a3128fb103eb@collabora.com>
 <20240906-b4-rk3588-bridge-upstream-v6-1-a3128fb103eb@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="a6pjesfz3btllyif"
Content-Disposition: inline
In-Reply-To: <20240906-b4-rk3588-bridge-upstream-v6-1-a3128fb103eb@collabora.com>
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


--a6pjesfz3btllyif
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Sep 06, 2024 at 04:17:40AM GMT, Cristian Ciocaltea wrote:
> +static enum drm_connector_status
> +dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge)
> +{
> +	struct dw_hdmi_qp *hdmi = bridge->driver_private;
> +	enum drm_connector_status status;
> +
> +	status = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> +
> +	dev_dbg(hdmi->dev, "%s conn=%d scramb=%d\n", __func__,
> +		status == connector_status_connected, hdmi->scramb_enabled);
> +
> +	if (hdmi->scramb_enabled) {
> +		cancel_delayed_work_sync(&hdmi->scramb_work);
> +
> +		if (status == connector_status_connected)
> +			dw_hdmi_qp_check_and_set_scramb(hdmi);
> +	}
> +
> +	return status;
> +}

Unfortunately, that won't work. The HDMI Spec has (HDMI 2.0, Section
6.1.3.1 - Scrambling Control):

The minimum time period between the write to the Scrambling_Enable bit,
and the transmission of a scrambled video signal is not specified;
however the Source shall not begin transmission of a scrambled video
signal before writing a 1 to the Scrambling_Enable bit. The maximum time
period between the write to the Scrambling_Enable bit and the
transmission of a scrambled video signal shall be 100 ms.

So you need to disable the output and enable it again.

vc4 does just that, you can have a look here:
https://elixir.bootlin.com/linux/v6.10.9/source/drivers/gpu/drm/vc4/vc4_hdmi.c#L410

Maxime

--a6pjesfz3btllyif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZt8QmAAKCRAnX84Zoj2+
djUdAYDRdEgSW7Wj/UA+T/XsaiAocjWHwnktCrXecrwrTQQLmwTpGoDKU6nmsxBR
eU74UeEBfiF7DgCZ3hfYdjQvzGKKyzvQQQitqxvSxT4+rBQyGtUKC89mLd+1wOlo
uzb+gTqbBA==
=hgwR
-----END PGP SIGNATURE-----

--a6pjesfz3btllyif--

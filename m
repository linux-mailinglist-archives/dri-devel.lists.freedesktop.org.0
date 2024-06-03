Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BBF8D7E3B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 11:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC94410E26E;
	Mon,  3 Jun 2024 09:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JaT8tNYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCB210E14D;
 Mon,  3 Jun 2024 09:14:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 90AB9CE0B33;
 Mon,  3 Jun 2024 09:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5334BC2BD10;
 Mon,  3 Jun 2024 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717406072;
 bh=kRaKkGVAxc9uve0nW7HSdUn07QqNL4yoUYMpcu8Ag0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JaT8tNYq6tChS62uoH5HkxxvhHNt0fq4UqSqXZ2BQ2WvvFHv8FDhVBKzak7GMUXZW
 l5oYvRL15/zrdG+1W+v7aU/YY2gfPZu4GTJ272+854ztdXAADOBnuikBvgtfVl8A95
 1Mc4udT/IXB2iDuvG/DTa7kP8dqHN/ZOTEmE7oWiSi/xCcjSTUG9D6pKh2L3AxkqnL
 B65EAooMZ3t5HXfuCRFz7U329MIdWeTDw/PYVmXdmBKuK6ocIESTkaQ2WXRToAh+g7
 7X9cBgt0BDBPmBr1WbeLrVwhX2mMXFO1O5Dc2b8f/aTY6wT3WTXT/DdJxXtPT6yKVQ
 /3jcIQvCRvedw==
Date: Mon, 3 Jun 2024 11:14:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/9] drm/bridge-connector: implement glue code for
 HDMI connector
Message-ID: <20240603-proud-caiman-of-fertility-ceb36a@houat>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
 <20240531-bridge-hdmi-connector-v4-3-5110f7943622@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="gko36zr2ozjx53lj"
Content-Disposition: inline
In-Reply-To: <20240531-bridge-hdmi-connector-v4-3-5110f7943622@linaro.org>
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


--gko36zr2ozjx53lj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, May 31, 2024 at 11:07:26PM GMT, Dmitry Baryshkov wrote:
> +static int drm_bridge_connector_clear_infoframe(struct drm_connector *connector,
> +						enum hdmi_infoframe_type type)
> +{
> +	struct drm_bridge_connector *bridge_connector =
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge = bridge_connector->bridge_hdmi;
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	if (bridge->funcs->hdmi_clear_infoframe)
> +		return bridge->funcs->hdmi_clear_infoframe(bridge, type);
> +	else
> +		return 0;
> +}
> +
> +static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
> +						enum hdmi_infoframe_type type,
> +						const u8 *buffer, size_t len)
> +{
> +	struct drm_bridge_connector *bridge_connector =
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge = bridge_connector->bridge_hdmi;
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
> +}


Sorry, I didn't notice it before, but I think it would be good to try to
make clear_infoframe mandatory just like write_infoframe. It wasn't
possible for the main helpers because we didn't have enough info for
some drivers, but I think we should try to make it mandatory, and be
prepared to relax it if needs be.

With that fixed:
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--gko36zr2ozjx53lj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZl2JdQAKCRAnX84Zoj2+
dnx8AX9XGJKgzSr6M5O5oiSn0kjo+G4+uANEp9GROPwPZJXKhHgP5Cc1hApfYjTc
T5Sf7Z8BfR0cMmOS87bWO4k0zBEaJatMc7o2FVqt26H48mFflPAiip89PYJdUOZw
f+QP0ptGZA==
=D3hE
-----END PGP SIGNATURE-----

--gko36zr2ozjx53lj--

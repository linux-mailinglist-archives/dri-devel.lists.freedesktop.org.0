Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1812A83E9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 17:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444B26EDCE;
	Thu,  5 Nov 2020 16:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B826EDCE;
 Thu,  5 Nov 2020 16:48:45 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id o18so2261278edq.4;
 Thu, 05 Nov 2020 08:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yX39kTh1HHCiE7a4ozj9S+V+l033SuDnzUBvvzJ5DSA=;
 b=qh8F9+Bv/qy6tDCwwb+PEaXxyVWA7Xq2gVdU1smCegVmFklmD+gxgnUaRGmQ0LODVr
 qkTIu7Wtw41lEWjrAiDZJwMwW3H9dXGEvkrVKsnpztVYnkSDHtmSN7nCOa5Xw7DuDU76
 kYrut4EaLB+TcqA3ukK1Ait/cG9RFUoNe6j6/G2K8guZNGpQj8n5HmE101VfTFgB8Ul+
 VOlhsdytM53K874JOG4FmneJAL+sErho7nMYAd9Bv8sODNEjbZaTGXHFAzyJM9+Pp7nV
 ASFaFZjPP3wvQ7VXrcinAw3Cjt3oqvQrhBpl0hphQVGfL0c29ZboNG8h+EuZHVy5fPqp
 1AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yX39kTh1HHCiE7a4ozj9S+V+l033SuDnzUBvvzJ5DSA=;
 b=oWZpE0t7Py7tksm/7XX/g/7x/Yw4QT2N2ZJJBpWH4NWldFD1X6Y4zv4ScOO3RSPrGU
 B1wTaP7qmZRIL7bV0QTnLfWGDk8kXmFSQkzeZ3JB5yI3CPxmVVS6l+UEJG+291vV75Pf
 MhH6XQ4tk9h/RB6tuixgK7v/sRKmQ6sCttB+d/yO0FmVBgedUBw0iJkqSLEAiRCnrnVa
 q6RgRpvszA6pzqkjbbhvATXEJzRChbZIGCOvaLtfB06dySNk+WDIBJMYHc/Kpggu9y4T
 7JfDnkVd+8YEWQ4owc9XBBltNbJZwGo+xhU8AMCTlhVoyvG4rd2R878/9iX6IZ5BpXta
 xNuQ==
X-Gm-Message-State: AOAM5311x01oLagblWeKYpwUVsVq+bmgJAprPsZzhMml/jwy3nmLjyaE
 TgqeuaJOrf+Zphu4VQke0GY=
X-Google-Smtp-Source: ABdhPJyiERgZeAUS31dkT4tl4RNTxwY6ZlLP3JkbXUfS5vHH5jSTMFA1rjwEXqQlBo5vKebs0Q+I/g==
X-Received: by 2002:a50:e041:: with SMTP id g1mr3548640edl.385.1604594923722; 
 Thu, 05 Nov 2020 08:48:43 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id s20sm1222145edw.26.2020.11.05.08.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 08:48:42 -0800 (PST)
Date: Thu, 5 Nov 2020 17:48:41 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/19] [Set 1] Rid W=1 warnings from GPU
Message-ID: <20201105164841.GH485884@ulmo>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Huang Rui <ray.huang@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Gareth Hughes <gareth@valinux.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Francis <David.Francis@amd.com>, Jingoo Han <jg1.han@samsung.com>,
 amd-gfx@lists.freedesktop.org, Rob Clark <rob.clark@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-media@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 linaro-mm-sig@lists.linaro.org, linux-tegra@vger.kernel.org,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jason Yan <yanaijie@huawei.com>, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0294197576=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0294197576==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fd5uyaI9j6xoeUBo"
Content-Disposition: inline


--fd5uyaI9j6xoeUBo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 02:44:58PM +0000, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=3D1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
>=20
> There are 5000 warnings to work through.
>=20
> It will take a couple more sets.
>=20
> Lee Jones (19):
>   gpu: host1x: bus: Add missing description for 'driver'
>   gpu: ipu-v3: ipu-di: Strip out 2 unused 'di_sync_config' entries
>   gpu: drm: imx: ipuv3-plane: Mark 'crtc_state' as __always_unused
>   gpu: drm: omapdrm: omap_irq: Fix a couple of doc-rot issues
>   gpu: drm: selftests: test-drm_mm: Mark 'hole_end' as always_unused
>   gpu: drm: scheduler: sched_main: Provide missing description for
>     'sched' paramter
>   gpu: drm: scheduler: sched_entity: Demote non-conformant kernel-doc
>     headers
>   gpu: drm: omapdrm: dss: dsi: Rework and remove a few unused variables
>   gpu: drm: selftests: test-drm_framebuffer: Remove set but unused
>     variable 'fb'
>   gpu: drm: ttm: ttm_bo: Fix one function header - demote lots of
>     kernel-doc abuses
>   gpu: drm: panel: panel-simple: Fix 'struct panel_desc's header
>   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
>     'analogix_dp_write_byte_to_dpcd'
>   gpu: drm: ttm: ttm_tt: Demote kernel-doc header format abuses
>   gpu: drm: selftests: test-drm_dp_mst_helper: Place 'struct
>     drm_dp_sideband_msg_req_body' onto the heap
>   gpu: drm: radeon: radeon_drv: Remove unused variable 'ret'
>   gpu: drm: panel: panel-ilitek-ili9322: Demote non-conformant
>     kernel-doc header
>   gpu: drm: radeon: radeon_device: Fix a bunch of kernel-doc
>     misdemeanours
>   gpu: drm: amd: amdgpu: amdgpu: Mark global variables as __maybe_unused
>   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
>     'analogix_dp_start_aux_transaction'

As commented on the other patches, the subject prefixes on most of these
look wrong, but it's generally a nice cleanup.

Thanks!
Thierry

--fd5uyaI9j6xoeUBo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+kLOkACgkQ3SOs138+
s6HE2A/+PdAvZ2+F78DJkdsaNjJu085jUQleXGtXuqh1lQ+yUWWTHYiXOdmLAaru
GaEmINYkOF2LvdLY5vIwyX+TY2lp9PYd0oo4UHBKei3IrhrHzGM+f1mHxvDfp2fF
ENihVfG/CNzk1RUnCensuwsBl/NHC/yepie9ykDBthaD5cfAaMpcFxw+KIHErtBh
I0T8UHO2bbqaU8Oz3r0My3Owk4H/1sNgZ7GBvqKQeWveHpz2FenHke0ZI6tXre2J
zj1vtgcRPNl6cE3aBxlSd8uIhdjAjGK/iShwI1N868ESy4w4ahGOMdX4i+BRlRL4
bObmEnqqPIl7n7NxvBvCBZFJQ19RMtkhcAtBT/IbYSiEN4AOS/TFq9iGxXefgNbU
I3BfMXl4aFQMhIDYHxG97bSr4Njec7KZf1cfTPRaCpcluulvb2geKvwDdDrhtKZW
LQQjv0hq4l9EDHGMOq5QdyIL9ay13S+ctmBzUN/b5N4YdSyDw9Ixt141zH9Eygdm
L+BzflS3sGx9roS0adeanIYgqMLV558yzqnC+pg9yaaR/AtaredjWs9+hnpT3XVC
JltHngRXupmBTRe4i0+YGYrlHFFWTtR+TuWOH4tSHUl5oL5/DL9yjtGLvlB6lNbC
ohT4UGDQZ8lITaiToRQyBOAh54Zc485krb7QAPVT0HOfLPenxF8=
=euSt
-----END PGP SIGNATURE-----

--fd5uyaI9j6xoeUBo--

--===============0294197576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0294197576==--

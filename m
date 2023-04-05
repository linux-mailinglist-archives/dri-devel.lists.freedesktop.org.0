Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD496D8023
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590C810E9B9;
	Wed,  5 Apr 2023 14:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982C210E9B4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 14:55:43 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id eg48so141673651edb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680706542;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qsEaksJfPuFz4eqXhdz+v77SEJtqJ1795woWbIKd71Q=;
 b=Fm6yXPx1s6Wcm/skcCWkPG4PnFSMnwOrmj+gZ/0hN5SRFwzZ9Be4Q3EiKl5+GDGNht
 JLOkpNGBu+2WXa9fdZ7Iqc9H2ZL7/i6HJ0ImUy68U2HwUDftDgc66R9W2tMQxcATWx5k
 A7659W1DPu2piBI3+ni7Ia2amA38rVbJLoT/wPmzyZm+W+WPS7wpCIEQN/wlIxzNfB4w
 wS+v04WUDvY1DeMSTwsupoAy6VLdG0UP8I+pVs+QPIU6c/gZwHGtl/HTxyRW/alOcnhV
 2QlecdBVJ95KdEER6k7hKdsh2CNHl9W+ylOMv3TcAYjQ0kJnALdWOCEK20MWJ1IpFIm3
 BHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680706542;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qsEaksJfPuFz4eqXhdz+v77SEJtqJ1795woWbIKd71Q=;
 b=VQEhPg26GHB7+rKYggumwL+CwAmTzg7PYz2klcQczaInd6a7pbhiG6MgYGz2e3FXyy
 fSZPCadgET5383204OI5CCwlpxm8B6+SjRgtQUo4YIcKvZZkcHiD3iP83p6ousxlL3fF
 w0GZx86gAL0TIK05aCuQsl2+AfpEzDGZx7pxAxWz+4nBGYTJ8GQ85GhxpQVerX4TGyEX
 K1Xokdc/XymzSI4fQWARqJiUrp3lnwvNnbxJeGDxcQW6urfWbW07Xg/5aaqJMK/QLaFZ
 7koRcfkyvBiT26L8mSvYkThLUy7GfY6dr5ailk0Qh2uh0UcxchN5kf0STrbCmQ1EuEPJ
 4eCA==
X-Gm-Message-State: AAQBX9cT95A9rtQ11baPK3DjFexH1s7sN3HvkxCdv/SbMcNWUxhDOMxY
 LkhI39cNM215GKn/9Q5tRRfSqS2DIVI=
X-Google-Smtp-Source: AKy350Ya4NChDgKethbM9YKl7JLHLqlfKZ7GD1t2Z/76Weytl2Duwq0HriKKVXgBqlFfF4Q6rPjFVw==
X-Received: by 2002:a17:906:815a:b0:93b:49e8:d7b9 with SMTP id
 z26-20020a170906815a00b0093b49e8d7b9mr3247374ejw.40.1680706541863; 
 Wed, 05 Apr 2023 07:55:41 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906c00700b0093f83562f09sm7467471ejz.87.2023.04.05.07.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 07:55:41 -0700 (PDT)
Date: Wed, 5 Apr 2023 16:55:39 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/7] drm/tegra: Convert fbdev to DRM client
Message-ID: <ZC2L69yI6l_2zPuG@orome>
References: <20230330083607.12834-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7n1w5lpDfBFhpOkX"
Content-Disposition: inline
In-Reply-To: <20230330083607.12834-1-tzimmermann@suse.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7n1w5lpDfBFhpOkX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 10:36:00AM +0200, Thomas Zimmermann wrote:
> Convert tegra's fbdev code to struct drm_client. Replaces the current
> ad-hoc integration. The conversion includes a number of cleanups. As
> with most other drivers' fbdev emulation, fbdev in tegra is now just
> another DRM client that runs after the DRM device has been registered.
>=20
> Once all drivers' fbdev emulation has been converted to struct drm_client,
> we can attempt to add additional in-kernel clients. A DRM-based dmesg
> log or a bootsplash are commonly mentioned. DRM can then switch easily
> among the existing clients if/when required.
>=20
> I did the conversion from similar experience with other drivers. But I
> don't have the hardware to test this. Any testing is welcome.
>=20
> Thomas Zimmermann (7):
>   drm/tegra: Include <linux/of.h>
>   drm/tegra: Include <linux/i2c.h>
>   drm/tegra: Removed fb from struct tegra_fbdev
>   drm/tegra: Remove struct tegra_fbdev
>   drm/tegra: Hide fbdev support behind config option
>   drm/tegra: Initialize fbdev DRM client
>   drm/tegra: Implement fbdev emulation as in-kernel client
>=20
>  drivers/gpu/drm/tegra/Makefile |   2 +
>  drivers/gpu/drm/tegra/drm.c    |  23 +---
>  drivers/gpu/drm/tegra/drm.h    |  27 ++--
>  drivers/gpu/drm/tegra/fb.c     | 242 +--------------------------------
>  drivers/gpu/drm/tegra/fbdev.c  | 240 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tegra/output.c |   3 +
>  drivers/gpu/drm/tegra/rgb.c    |   1 +
>  7 files changed, 265 insertions(+), 273 deletions(-)
>  create mode 100644 drivers/gpu/drm/tegra/fbdev.c

Seems to be working just fine. Applied, thanks.

Thierry

--7n1w5lpDfBFhpOkX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQti+kACgkQ3SOs138+
s6EHhA/+Ir+fNTilGPGXehrpXTaEvKAFOOQekBzKaejjKX5nwqdSWx+80S19pI2r
CjOafdtdxZO4diEOXQXWy0Np1GU9VB3/vOguBdHszruweZoIROe2L0tAz+w64kVZ
MFqYdeGoPhUK6GN16Qx6nq/CwqQiUvx9ZpwVuBD50vVQyKWEVK70LD6RzX8OOOQA
Tl/A+gX3LhG0Vh2FdpKsHEbeVe+jHYDBIdjY8JEdmz5Quhhp6LwlpQ1CrrycB7wD
CDxcCMOTrj0pKo56Doh4mBkmlosmkvK2DWaXw5kQOEwSjFKYAg0ZlBgir/eAdwwj
+B1/hyk+PpBb8fELfQpawuNkmiNLVyMNWp8TQ4qP/OzmJtBP562gvgHw5zzmEi+o
ZjrOrv9tLJFJLb3Qffm2Y5MdBapQB/eiXTuP1FKPZxpuUCAbUFQPmoEA6b0rFJW1
rmGVTKN/qc22SZOu44x7K9v+tv5fRuYlFNAIAdJOD7z98nkc4ndwBT2S78448EDm
8rOQt5+eajA6G9Wp78H6Zf5yK/Co0O197Un3wn/qD0IqFy1MVzwmh9OWOtwjmuIl
23QLr74ma02js7/lC41WjnaeQwgltIjNHdmP/+PEzXbotD6D0Ge7pkXDIt0Ovm6D
ukCLSWzpBUEHzooy8smvJsnD7fvCYOXbjI5U/sCcGZzlox+A9X4=
=kibO
-----END PGP SIGNATURE-----

--7n1w5lpDfBFhpOkX--

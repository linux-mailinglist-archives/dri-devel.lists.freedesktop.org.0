Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0CE9AEDF9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 19:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF4010E974;
	Thu, 24 Oct 2024 17:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S20cC/jG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0A510E974
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 17:27:12 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4315df7b43fso12650135e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 10:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729790830; x=1730395630; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6RF+0h3uJVvZLYuGZLW/jZ/HEsnjwutDdO799XJGlDs=;
 b=S20cC/jGl3rWzKUS8Epj0VaLczyDNNTzXCp3Tj3RAA8qg/joDNMuhrnghmPPektnDj
 7JY9DIXvgvJyM5Q6/9oLBtfjC4ViXkZlS43DD0HzqvVRX+17iS89m9KRpNOEpDW2VuJY
 hUcllHwFek5JlfMH6Ot7ggc84gQOP4IDXnhTSmOQjuQEHCkzcr99n1uYmpu+jveYBv90
 mLj3z0zzCvQ2Rbm4FxrRHNo9n38+LVrHjngXIcWdiGSmV8sE9GnfDz4DJSVNTtQnofXR
 aaPLMEoONys5yEStZe7bICG2AqnIg+xvI0HsvrJwKIpp1/APVm+McxNoKG+nz4J2oLsG
 7lrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729790830; x=1730395630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6RF+0h3uJVvZLYuGZLW/jZ/HEsnjwutDdO799XJGlDs=;
 b=o2+0cul6GvkuIq5vd5WaXWgM90KPRNqjalnQQj6pctqGgQ2YVBP5JD3W4rOmlYZiL2
 qPLrKJhTXBg9dXvis/DnA4jxRA3C7371CQDtYkOjwaHrKEKe/bYdJzIHvst3DejP3xIG
 d5cNb57sQQE6FtgLvnKauITlA/6k/Jnx5uZePTrdd2ov/n01lUQOLzP97KdOvXjGAK+T
 pFPqKy4rUaPcysBVte48MtR73+VXYLtFM8MLfL8ti6THakgQMJVGiJHfafZ6DQDTgPCU
 YGyNNoo8FVHWi+X0xdN0oHBMowe2iYIQIrIhQiKS+VrG7z093GApHH+fVpsv1CFfoxrd
 CWlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoVpKDtwkCMaYkK6JarQ9jgUXRFzfuI75xfIoou4mo8hRgaJmQyFRqUdETGnkWCnrANGrQbTUpJiU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywf0lToV9inzWmlG1AHt0kFyp4GJCvb0siIyxGIlAoCkxhZ9m9s
 N3+1To0oYOaUZfZwEld9yGOkhsncWET0EXA+nqACVETMYWbIxr47
X-Google-Smtp-Source: AGHT+IHQ7I/9aI1UHxXx6X/2TOQl2Yy1ybsuEFl90rIKNP8aItf1olbwHtlsGOqqhIDJTGHDheR+WQ==
X-Received: by 2002:a05:600c:1552:b0:42c:b750:1a1e with SMTP id
 5b1f17b1804b1-4318beb62e6mr24564425e9.0.1729790830026; 
 Thu, 24 Oct 2024 10:27:10 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43186bfcfd0sm52020785e9.26.2024.10.24.10.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 10:27:09 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:27:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 JC Kuo <jckuo@nvidia.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-tegra@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] drm: display: Set fwnode for aux bus devices
Message-ID: <sn3q2kloect5pdsyks2xwiiu7avhaovl62rn3wzhs4qpznwegq@zaq3o3fuc7i2>
References: <20241024061347.1771063-1-saravanak@google.com>
 <20241024061347.1771063-2-saravanak@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hfzjdm3gfakfovch"
Content-Disposition: inline
In-Reply-To: <20241024061347.1771063-2-saravanak@google.com>
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


--hfzjdm3gfakfovch
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] drm: display: Set fwnode for aux bus devices
MIME-Version: 1.0

On Wed, Oct 23, 2024 at 11:13:42PM -0700, Saravana Kannan wrote:
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
>=20
> mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) wit=
h backlight-lcd0
>=20
> Reported-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
> Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@=
notapiano/
> Tested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--hfzjdm3gfakfovch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcag2sACgkQ3SOs138+
s6Hj0hAAhMZxiCkgmHPpzOfFMLqQaRfXX70z+C/EbrTzA3OUMgMVTiRAMXm9USIS
SgjCLtThw+TN8T0NPDlAi/x53qr2/K1+ifxrgdjVcukCIcvH5xda17KWjl5lMbUy
OVUJP98lx/BCDvcsTH4HjWdNk52GLn99I31Ipkc8KXdndg/huxA9uYb5bdb5oSdB
S3l/6TUoLTnyb6e2PAg8G2UNwF0z8fOgPrm6bn1fPAHezUuZXYu7h+2tYidyzY0M
eh7RyFTL7Y+aX4jPJlHIKe/88qmAC2f8dKvpKuUe/FFbsjBkTIrSZK69Ynz5pXmF
K1sErSfkghxrbLGxjJMfQ1rU7Gy8vNwiP14Nbik2EFT+KAT6y1LCFCqpsv1fF3KB
tkzQYps46T3VBCljzQeZfV7/4ARml5DGv+Kv/CpiZV1lt2PKQTU+DHPoV8x4bzyG
GsW8JVuWqFjeSkPyf4APslY535lufQclLzS7yI6qalJ+30XDOixO4nJ3VUXawkHX
gJfEljNUTO5xEggz8QZ1wRSUVWV0Ik6PyYh/HneSiGCKn5D11kYTIv9ZX2d2bNBV
yb2OI9VOjn8/T7tfB6T36coLT1xNATeLQPX56+IQC0yw5NMfu7T55/S3amfn34rv
Wk3ki1ZLcI0tvP88rKMqTjGQSmuMDTJgPG2V41FZbUhDhfLy2Ls=
=i3zE
-----END PGP SIGNATURE-----

--hfzjdm3gfakfovch--

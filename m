Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 955C19AEDFA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 19:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF3810E978;
	Thu, 24 Oct 2024 17:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bQGLS9Uh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756F910E978
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 17:27:28 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4316e9f4a40so12468785e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 10:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729790846; x=1730395646; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UaHpkghq9cuCMb2HJRZAym0CXgOFGdaTduY6J1n9ZMw=;
 b=bQGLS9UhT6C2qpwM+lXQcz0zAIwR9sw/1w3aSKe5NIgW0jJZpRWg4kH22gGTVNoqM/
 2A9ulDD+h51wcINcgjzWVkOOkKIgtk2FPIMlwkIG3z4lRLz2AGi7j8YuMUfRNpwSZ4k0
 j8n+O3qKTgLa0EgIiSnY8bjn0kyFKAb09mzaABOkMF+VnXrp7Gmk0Psejf2rH8oC4OEp
 8QM8GRE6/XhcAlv5t1qrI/V4YBrnIcbtX/REpzD3xbW+1UQUqa48M0BXZkDSivmwtUo9
 OZ/yDnvMt9sVxIDJgPx4vtlTqnz4DSq0YgA6oG7e7GjdtjIGwHJg90KyIYVDkAkQRKwG
 t+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729790846; x=1730395646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UaHpkghq9cuCMb2HJRZAym0CXgOFGdaTduY6J1n9ZMw=;
 b=Izb8VLNELoyHvcwBcOKXrfc3lbLNWKdUErcT3vnxBFPQOkIEY4L+X45dPzG1zaDfed
 9ILN2fTJAROW33RrDy8lXcs2/aV2mIoQKZwMWGobHgEWd8RcWvXrnzDQk5xxRgi+fU4r
 W42apVGHhonmwezQLTm/DDiEPECG3nxu59+w37qRZSOrEjelKXOENkydI4SGIE+2HmmQ
 qsgaoDhpyi+o5UPXp2jSgDjqWi5+L2UTiPlR+KM71W5R/fsTWMWzkSLAY3TWcR2l4tp9
 REaNZpXnBmdXpJjXxAxdKtmkes8PqytgMFp3KZx7k1Um+7YpzMoYQ51+vfgWM6sUE83E
 0LSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVclIelyglZ3qHc6D8p64mg8PgmsTuufBqvnHhvNQ8Ze4AlOUzX88FP6xrg0nUHe+yTHNJ66PQV3JI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYutGEqvfOeLbn5iJRm2R4rLU6gZSWZ8gWO0UN55S3CKlG9IhJ
 AYied36qbRjR6v28/kBTmGA3j8GP8NChdtBKVj1TZLSqyIrJy/Hn
X-Google-Smtp-Source: AGHT+IH9aeFR7EI/JBQU2YhJkoiZcmX9vYZf/rP1GuS53R5NLbNpUfaTaV9YEHJNgi6VOgAWwW1HsQ==
X-Received: by 2002:a05:6000:1faa:b0:37d:53dd:4dec with SMTP id
 ffacd0b85a97d-3803ac9725fmr2225519f8f.15.1729790844879; 
 Thu, 24 Oct 2024 10:27:24 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b9413fsm11839544f8f.74.2024.10.24.10.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 10:27:24 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:27:22 +0200
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
Subject: Re: [PATCH 2/3] phy: tegra: xusb: Set fwnode for xusb port devices
Message-ID: <h7lfhtsb4qmrtmcgkeykfwdqzwmby6jfspd6hguxyx3huilu3o@sfl5dqcsc45d>
References: <20241024061347.1771063-1-saravanak@google.com>
 <20241024061347.1771063-3-saravanak@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="twcjumikk4cgqnzo"
Content-Disposition: inline
In-Reply-To: <20241024061347.1771063-3-saravanak@google.com>
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


--twcjumikk4cgqnzo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] phy: tegra: xusb: Set fwnode for xusb port devices
MIME-Version: 1.0

On Wed, Oct 23, 2024 at 11:13:43PM -0700, Saravana Kannan wrote:
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
>=20
> tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) wi=
th 1-0008
>=20
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvid=
ia.com/
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Suggested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/phy/tegra/xusb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--twcjumikk4cgqnzo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcag3oACgkQ3SOs138+
s6E0jA/9Hrx9YAv2LNCLCxeOKL/DQUk66osQ3tcAQYkyXH1Lf8zsvymHrcUdbWBM
95AoBk6VHHrDM/3mW1riHBZy7wiSLA7ZH+nXiFscRZcisWchkrcSFd1Oy1LgRj2Y
N268oEbko8jjmyKx0yTojbbilbsZtXZkKsaVhxkBgAchQ8lYuAQg4nPRABMJB6F3
eZKMHGXBm6YQFOvV+Ahasj88hN+0WceHJNvzIQPXyWY2U6ixPpsup5J/uikzHqpI
rmlb5zqPUHtHtG/U/ku39cIgiiOBE73/OW1r0qM5ez+UiTYWukXAQyBSCjtoWBrm
JguDu8m/fS1Iqn+NmxlOBto5gRRABLwBb3PHWfW7XEuVk8ZdGpycBxQ0+ZOglfSC
PUn/XxgW99w/KbP6401Bomy+Qj9MXJap2cytyVNrMGda1xlwnAPFVPDZ6qNCxZRc
Bw1dD6hZeWOsKlFZcY9mBhn4D7nAalV/t+zKe9YdEe7zdkTv6CL4o79JjjIACdsh
GJjfZOlG7FsLE2D5KscHSf7vxRKG2xOcpQyc892MLa2tm4MngYKUGsIEPZJOsnHF
vkw+QmOdblNPJSILIH9uyAwwb3YDkivpKILxPTgMB2eywmWnxQaMh96hc97eipNh
H0hKPDvcuendN6+xsu5VM4VQSp5VdAbX+YumtsJ06Dhdqt4kdoY=
=GeOf
-----END PGP SIGNATURE-----

--twcjumikk4cgqnzo--

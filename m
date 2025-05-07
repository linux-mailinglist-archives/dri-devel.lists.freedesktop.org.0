Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3AEAAE48C
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 17:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C8A10E836;
	Wed,  7 May 2025 15:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KQ1ktLVD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DE510E834
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 15:23:56 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ad1d1f57a01so529233266b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 08:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746631434; x=1747236234; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Bu+V95WZmuevBWrYtl8nXKNY0WPBNalcqPNhN8Y1Gbc=;
 b=KQ1ktLVDfz9n6QtJ3Lt63wwn8t54jdDkx1p5villZViRJQ8EwJsz2iAsfNHmdzgkdC
 iapWGwabdRNa73PckxzSnKo3ZJXznLmRAgRJGt7+9RPKzKbpppCYL3J3ysBPoWJ+TXSx
 /tPXm2t5QR+JUkNHPtg4hTtFxFVFITjgMrbiDPBKEnNaR4VTuSbpP31Q1TXfCDU4Q3sm
 8NwnMTGbocs5q8rxbTSSWylsNU5kL12RHgCeJADUUZjToRl9+9bLXc9qUUvmOvGW8xkH
 4Zqyr4LuFVnpbdiSYHKM4oUCU1H5dw/Sh97aJHu8TMLlzfg21CeH/QB2gSYxPylsh1oo
 H4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746631434; x=1747236234;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bu+V95WZmuevBWrYtl8nXKNY0WPBNalcqPNhN8Y1Gbc=;
 b=gSZq6NgLWcUJgt4+WX4fgd97K6yiRAciL2Eql5cfaXCtA4fF5bqSWV2iDgOosrWaYw
 ceLnb7drT1UmvkPd37++g9B46g1ieaRDNdmYbVHNIYU/GXLedV6so0p1hXL4IyhAUwUe
 kuEk6N5yAAlWT9uiFhUhvsYjZlDSC8GmfiPVk4C3NYVey5yK/arHuSpR4lgbexdq9wX0
 sTWGUpm9dWdhtJ5S7n4ygrds1vXhrb7Cj9e00hBVLW4MkDAt52kywr6XXDrBtig0vhTv
 3sGMsaE3eNh0YozB3sW2lil0YQ4x9PSpQIUBycalV/xs+iPgufzIzeHQdihsFpPcTmaM
 OiZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcH4Nr/kkochowKjf5Jz4FfLMVSEYtczl8T1M2TCmWKC2l8nbqgfStn3N60KX2vdWVE/DdtBk1LaA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH/80T1cFiKTMpUYmxufBjcase8ZwBHmA3NYJ9abgZkfWZeR0v
 ONUN1w53c1MA/tomBGdBAPFm1eldTH6k8sF7KnooFgfXc/XCFpwk
X-Gm-Gg: ASbGnctVAYlDmyZj0LUSmnDwjXzWMJVJR/H8NCKTJsaczckxMqDJS1MSLgQMYTrERLS
 761NFWnoiifXsdZd/op7PCCo9ZM8dRbj0SGw8nZfdoa0OvdCkLgtAue7tFvlI7vpa5QXw8A8Nfs
 bbARPWW3HLOfIhnH08wIAvUr5dIXXuchhLpF6Veey5cV6FjcKbVfl84N36mfb26BtvjvfGGH3+a
 /YEi6XtjNhGXqbJtXu1OpHaeA0Z/hLXsGt+4ZyQNwtnQpxm+UumrzuumdGgX4Qn31XkJA/mxuuX
 quzmSiRP5GV4UimBEioWDIdWGo5xgEmDvhe/WkPiQyYX/06laMpYC9Ijz2E4BsflE2hyP8u+cgz
 UsPgiL8AJpjVnFDzxJxY68TC0NHI=
X-Google-Smtp-Source: AGHT+IGjfHXnrpEUYevTUWlZNdlZY2K76cUxolllBKTvZC9lPWbiy+bz6X7MHwmtyPjAegiT6kqLtg==
X-Received: by 2002:a5d:5887:0:b0:3a0:9fe1:c298 with SMTP id
 ffacd0b85a97d-3a0b4a161b7mr3182648f8f.18.1746630987926; 
 Wed, 07 May 2025 08:16:27 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b0f125sm17160004f8f.72.2025.05.07.08.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 08:16:26 -0700 (PDT)
Date: Wed, 7 May 2025 17:16:24 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/tegra: Assign plane type before registration
Message-ID: <6nnklsiik7cwgmul2ygy7zayenybarmikfgl2hogryo7r2vtd3@vgksl6swjrxm>
References: <20250421-tegra-drm-primary-v2-1-7f740c4c2121@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yzkzi6i556e7c47u"
Content-Disposition: inline
In-Reply-To: <20250421-tegra-drm-primary-v2-1-7f740c4c2121@gmail.com>
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


--yzkzi6i556e7c47u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/tegra: Assign plane type before registration
MIME-Version: 1.0

On Mon, Apr 21, 2025 at 11:13:05AM -0500, Aaron Kling via B4 Relay wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Changes to a plane's type after it has been registered aren't propagated
> to userspace automatically. This could possibly be achieved by updating
> the property, but since we can already determine which type this should
> be before the registration, passing in the right type from the start is
> a much better solution.
>=20
> Suggested-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Cc: stable@vger.kernel.org
> Fixes: 473079549f27 ("drm/tegra: dc: Add Tegra186 support")
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v2:
> - Fixed signoff in commit message
> - Added fixes to commit message
> - Link to v1: https://lore.kernel.org/r/20250419-tegra-drm-primary-v1-1-b=
91054fb413f@gmail.com
> ---
>  drivers/gpu/drm/tegra/dc.c  | 12 ++++++++----
>  drivers/gpu/drm/tegra/hub.c |  4 ++--
>  drivers/gpu/drm/tegra/hub.h |  3 ++-
>  3 files changed, 12 insertions(+), 7 deletions(-)

Applied to drm-misc-next, thanks.

Thierry

--yzkzi6i556e7c47u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbeUgACgkQ3SOs138+
s6E8shAAimUEuugWp3icnj7eXRj2vOg3BUz/p6I7LDUlHLc1/oumW7zSeXpRUMpb
o9tfQ7CDoApO3BOBxWjJh1g5Me8nKoQwWxANkJ0O/QGqYcKOdNaeeeHLjN3veQEe
E/LfkIpFTEuSIV56GypmQUjp10+lgU/BcgKu3uw8lEoHJdR8RYZqdtjpRRT3ey8D
pNMFQJ6CgruF5VqVSS1Z1xcE7hBTuLnqJmZ1w1v+r2klt3uiivpxE8zbOOiHjyoR
XERgg+wWM5MLVjRvPdkdNOXlOMO85quLmr8WeV0SE6plBOSQAETgqATj4BchuBkc
cvN1pYwtghCKLD/Z9xikAxxfh+p+W87+bZY4TUdr7QzQ62S7SyHKwye0ORtUdZnC
XP0+fHXVb2qOmSpGVtlP53MWGbLCVsy1vjb1sg1N/J5CIHprgTeGRWJVCqgUPjZS
jQLrKV3Y54MDV4XAA5HpzmbaFhABZ1H/PdAy08mwPsc/shHbD+p/6m26NR0elNRS
CaDicCDmX6oIE3sEYRBjKNcAkW9DqDrJWIaNH+qDpywO/JVa4Khb2W0CNyw4UY74
qY+YttsGD2/M6Ym3/yZRQ5zzgVn81nkD38RHIFQUvhgt0Moarp9zDMeBKBlHzjeG
L8A+IW7WldrGcxMDWkmXArTyZeSbkpnDGisHNvr/CbZ7PH9AsTg=
=NqSH
-----END PGP SIGNATURE-----

--yzkzi6i556e7c47u--

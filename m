Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B62E75C459
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 12:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656E910E64A;
	Fri, 21 Jul 2023 10:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B720A10E64A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 10:16:14 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-521dbe5e09bso2135464a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 03:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689934573; x=1690539373;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I9pbsGWRmQhFYBMY/NJD5z7H5GccL1796KX7w2BJdUk=;
 b=sW2HstlhQOPYQt5Hw7uJQSwQ4UtzmoY5z/4vM740TYB2/SGN+uqlSU1h7MfaX3jLfv
 SG+u5TQV7A9JnRvoVQOr+pZfo3iCcT1HsL6GkWGRC7kgshtYDmdklYdhXY9Nc5pOp2No
 PWXnUqFloCggSTG7CPewpL0+QIyDkMS3I/2RpPOIDIwFkuc9a7CVKa28PfzMaRRDcpsm
 2yG6RgXxjeXPuJv3GMHLnZFoZ9dZxqO4Fdw0zZ8prMnZf16D+Vkdq35PMibd6b5wUIOx
 fkp5t1fbyyOrl1Fj0fQoIiIRv+J1M5Q25cSh9vdXtx6AhVNCV5AuSJavU+/OxGtukbte
 6gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689934573; x=1690539373;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I9pbsGWRmQhFYBMY/NJD5z7H5GccL1796KX7w2BJdUk=;
 b=UV0jntD6ODFJzlWyPNy67LeRIKP5K81fL1MlsEgSS1psZAXXzFxuXuGqUztzPfGQW3
 l6ToJv41NbKq9nQSZZChOm1I63x5hxpaky2KXN72YeAfGZ2Mbxif0sTJriURanVDupbc
 h52j1dYGQTMtu2av69lIKEhwLppp19h2744Ifnw/KncSOBGBkgXpMeZiWW+3dPc5DBCQ
 H992eoUgZCQZ28sl+6Roq5DnjFuKrHacwTk80humtqa8hkC4zm9SzpjR5w0sXMkc///9
 IeHuiF5W4GVA7va79ZexvlELSSPha6CU4B6HkmYXF8XbZxxs3ZBrfGvBMJzcMkrlDHPL
 OcJg==
X-Gm-Message-State: ABy/qLasPloycJfQXXS8ABz9SpRBUhIgYbxN7HvJkFEK+umqlmax5NCF
 n0gQ++lPb3nqeDGIs3A6bxg=
X-Google-Smtp-Source: APBJJlEG42wOwEYSG/XTXRiaQNAwS0FxDO+0N4WtgeWi+e7+3SPSBAvmdZViEOuur5CuBKK7xXxnHg==
X-Received: by 2002:a05:6402:713:b0:51f:f168:a83 with SMTP id
 w19-20020a056402071300b0051ff1680a83mr1269892edx.33.1689934573033; 
 Fri, 21 Jul 2023 03:16:13 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a50ee94000000b00521ce1f04b8sm1894946edr.12.2023.07.21.03.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 03:16:12 -0700 (PDT)
Date: Fri, 21 Jul 2023 12:16:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpu/host1x: Explicitly include correct DT includes
Message-ID: <ZLpa6yezfXUx_x8w@orome>
References: <20230714174549.4056675-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QM4hLCGNIRW16k8r"
Content-Disposition: inline
In-Reply-To: <20230714174549.4056675-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--QM4hLCGNIRW16k8r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 11:45:49AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/gpu/host1x/context.c | 2 +-
>  drivers/gpu/host1x/dev.c     | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to drm-misc, thanks.

Thierry

--QM4hLCGNIRW16k8r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS6WuoACgkQ3SOs138+
s6ECow/+NNmR0ClidT/qBm/ZSwIdWoje3YSoYYTlv9kySXuMHCdqe7IubPeLAv1N
KIjZwqkCNJDM3z5+ycXxV3jBONIsHn3bnZkQYs58vr3hoJpFFg4yGCfGq4V9wwyh
2caMfzXdzlBum4P88aHQk35fIgOAMk4u1SmGWNH1y/uHFY+PMekH0kTYqdupRGpP
NYzOL1QbZHZtnViy8tOt10olTI8ke0+jzGBVgB1gFrlXmgruU+94ljNey1KZZBJp
uzotsjI0E8tcU+/sVk2ODAmNuNfqSbmQRpLht9nlGBPnyOs2UN+Df9SLDu4GyFKC
3AtyyckgYmpKo/tROB67+QC6oh+MD6vyE595LVjX0geYMgxEi4oSX4h8DWm8R1z1
IEGJ/8zPZk1gkadYhc3BnBStrGj8BIIaKfmGN3e/wwClPUsLjHWAK7PwCEm+uGwG
wA0j5A/0oH0i4Yd+Pbghw7grY+lgzZi8LT/NYOFQaN4HTz8vsr7uWBNdsMWocZZC
VF36CYD9BAWjY607pO8FAM3jfLZy+Iw2aCduIBQZ3hsi1zORLZ/HXExOApQuk7Av
pE+yFTgHs4/xTFinowmz4OsIuk6i82pbgSomJulOR5TsS0UT5h2LOBwtoKREmLah
Q01LASs1XGN6e/sc16O61cq8eGPSRgb0ULiuAZB1IfJ3rA+bOqU=
=F+K4
-----END PGP SIGNATURE-----

--QM4hLCGNIRW16k8r--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBFA4773BD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 14:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3BA10FFF4;
	Thu, 16 Dec 2021 13:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E8510FFF4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 13:56:24 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id z206so4745451wmc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 05:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iMV003eLLznTLp6M2oBwJEaOYxC5vjXtghvIfAS3DNQ=;
 b=Sli9mUlXv3PM4/ikHFbKNIKTK8n/El4roMYCXwcZR6TA0taVYgveeSZ/E6mkGY2d9B
 2Q/GRx2Ra05xaCgyJCRROknh81z/QVO3snt9kGuajSRoO2CxsMxrToBDZqMGXi6pbJQ8
 i+OEZLBiCU5exBlYlKGHb+pr6wLCg81UuJC1yr/KJi0nFIwEig18l11joASXkKfddigC
 4JEYJ0YNTzFltL51s5+gVem2Q5s9DkBaFbSfzPvK5ZUujMWSl04a3ePok7sXaIDhSm28
 f5n2iHSdkLgoHYv/Z2AoMehKLk0cUCKE0rngVNJSV7bDjEJHre1wdjbcmDCWhD+MEr2g
 tAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iMV003eLLznTLp6M2oBwJEaOYxC5vjXtghvIfAS3DNQ=;
 b=p1g6ef9Y8mW210dDnd19EsoGZzTMsOiYEqxoAq/ilUyBgPiNPV8JrfSK20WZfWWiuM
 OD2vIMInhtH4d4m8pSUItHbc0/cm9n2IMgJaFh3xNkN1ym6Te6Zcv748a/M+Y14wB3+d
 7iNtW2NSUPBmWEbua310GVXS4SOlVECFsg9PgM37AIxAC5FtMMlyu8vH0oNa0K7jg9G9
 9Uji4TtzyNcAA8q8AX101V45vdz0uS5Z30TePIVTSO25BbE0PaF7gjTLMuW4weDa7EwO
 OD7sYeju+CS+DgiCjf65NJ3HZl9dtdNXwi9PGuJO3YGszgHL3/UvFNA93UQ7UPEbLo6a
 DeSA==
X-Gm-Message-State: AOAM5338/5Zr0K26MTpshutkmuaS++Sg7VHzYc5uVezFHXZKICmyz8Ju
 4QdBWbKLfPCSTtXemLbq5ig=
X-Google-Smtp-Source: ABdhPJwyzOoZu9zxfL+1OjtEMOMUMtdhsprxGBD+PcGf+w/+6ISQTTgbCC2+hySDGxg9pU8JhSYXEQ==
X-Received: by 2002:a1c:cc0f:: with SMTP id h15mr5102355wmb.38.1639662983607; 
 Thu, 16 Dec 2021 05:56:23 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id p12sm5945219wrr.10.2021.12.16.05.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:56:22 -0800 (PST)
Date: Thu, 16 Dec 2021 14:56:19 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 01/22] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
Message-ID: <YbtFg7t4cM9dV5Gw@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DYeD+wTM6cNwfNkf"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-2-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--DYeD+wTM6cNwfNkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:04PM +0300, Dmitry Osipenko wrote:
> Add device-tree binding for Tegra20 S/PDIF controller.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/sound/nvidia,tegra20-spdif.yaml  | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra2=
0-spdif.yaml

Acked-by: Thierry Reding <treding@nvidia.com>

--DYeD+wTM6cNwfNkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7RYMACgkQ3SOs138+
s6G3YBAAgNf/4lgE/tO88tQPV1jLl4JoqxFX/HSw2KtQ6EGrW6HXSk8heutahviv
QMpfJVkw2+bSfPz+MdO2jBSg3XQWNOVYMrdN0Z5VcuAgbankuYJPCCkwoJ8U1SIO
O3NuhaPHvLSsKTHb74u9xcZ7LBxcpWtPHJ7JiF7W+wicXg65vYmcamQJoQCO0CLS
yrS7z8183zb2RDMPVu7cPQ9xZA/ofS2A8SiuZCFdpEE/ONX8l301v6EH9p8KsoNV
cRKjLEPyaaSMMS70NiCD1pw5Gk3NtDnwUePvpDzotGqAr8HU8aLCf5F6PY+tEEZv
qF5u18vQGEc6S77qvYmpIGVcvzHFdmzZ3y05EpP+bSCBasGCqKkRJJQvUMc0AE4m
HKRTWOL0fln9k7D7GAfHKdGoGx40vsQwaaq0OyRWhAXYBr/SfRMUWcd/gEaUajd5
x/GJ7IuzjYmHTcYaVCo6NZsrQiWTRfescCB7PmEqQlJXaAO12Qx++2fmh2Aqsgk4
M65Ez3z/7TVwwvYP5IQCGw6LHFebrxMLMNZlEIf042houTzAEUCozC8hXlqRRSH8
/xAnSkcAqUd/SOye4O2yhSaLYBWlTrfe0gqvbVsCLvjXKNAoNwWBAuwRQ7UPNsi4
iPi8TgisuC6KHPPUuNoyDA+aQ+lh9RJF6/q99KaBDq8FaEh0wVY=
=zYcg
-----END PGP SIGNATURE-----

--DYeD+wTM6cNwfNkf--

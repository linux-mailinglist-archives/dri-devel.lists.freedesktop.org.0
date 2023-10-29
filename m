Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C367DACC0
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 15:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AC310E010;
	Sun, 29 Oct 2023 14:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C37710E010
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 14:11:16 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1c9b95943beso32415995ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 07:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698588676; x=1699193476; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+k/F3pywcFNb9QPmBba7PeS4yjsOLc+34a2n9PbqANc=;
 b=OHvKrAIXEbcImDgkbGARhdjK+ngfqfO+toqjHCEShUwGNoyXwE76R3oedCmyFoaRYY
 ODFor0q0p1A/KRxEexznWs9l3wlYY+cLqwe9Bn4g3Vtep4YUjAt8JEJUOLtMSuGuK06L
 jxv9PP0UmFEGB9nheMzAxRnKNDTUJh3uvnyfzdJT8N6xNP/cmIxqDGYa/Tt23ggtQkxx
 Opn8JMVgm6n8vI7iwl1GyWoviylm/tk1kGi802ehX3wzshV6jqGjDHuZCnMef4At7XdN
 DPzL2ZLXPb1oF0H4V9xycrDYtkMXzl4E4hfbGHHJZ+++a26phK4MRnYkJJMLItivCK+t
 Bk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698588676; x=1699193476;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+k/F3pywcFNb9QPmBba7PeS4yjsOLc+34a2n9PbqANc=;
 b=qW3uSxhF1CGXCymDMcBpyJI6YQgMb24GKnkzMV/AJpQ999rroYc1UBl9w9IukNT90F
 4Vt0vdL6/8DLFjgsFyJkxpIGT2tmu9YVfQLe/ubW+3fhFHJ39bP4cpu66w16TWJRyHfZ
 n0pwLWhSn992evHYamlSfZkUvEjHlAb5bRsOJ8nQFcT+9wmcgX5KiBjBITyyYBNm/L2n
 HSQHcFQLPu/fX5e0HnHAFP5eOEiL7Mpz8ZgK4x5PnD60GboulK0K40aQ2+QvM1+NKQ8Y
 ZqOSRRkrfHKSscBlvucZYKoV89/teKqXI7RHu6G5Susy/SadNEzI6Fnyzkcb3ccKhnaZ
 rgRQ==
X-Gm-Message-State: AOJu0YyTy5V3tQarjIKBthZZ4pGOkQ+JyJiDV6CrzrDR/g+C7ddkNSrK
 Wjan3CkMHFCyO0SgNnOJEsk=
X-Google-Smtp-Source: AGHT+IH1AgjGDZDT4RHmsde26FFxupiT7h34t3COj9dMXHpKj9wEbiSmTqymPLKQOAUsECrwwivUPA==
X-Received: by 2002:a17:902:d2cf:b0:1cc:45f1:adf5 with SMTP id
 n15-20020a170902d2cf00b001cc45f1adf5mr1305980plc.40.1698588675884; 
 Sun, 29 Oct 2023 07:11:15 -0700 (PDT)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 jf2-20020a170903268200b001cc32261bdfsm2609034plb.38.2023.10.29.07.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 07:11:14 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 4EA20819823E; Sun, 29 Oct 2023 21:11:08 +0700 (WIB)
Date: Sun, 29 Oct 2023 21:11:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Dorine Tipo <dorine.a.tipo@gmail.com>,
 Linux Outreachy <outreachy@lists.linux.dev>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix line Length
Message-ID: <ZT5n-5hSfD0MqsnT@debian.me>
References: <20231029135104.5136-1-dorine.a.tipo@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+IGZbxdgpE8N3o2c"
Content-Disposition: inline
In-Reply-To: <20231029135104.5136-1-dorine.a.tipo@gmail.com>
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
Cc: Daniel Stone <daniels@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Helen Koike <helen.koike@collabora.com>, Nick Terrell <terrelln@fb.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--+IGZbxdgpE8N3o2c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 29, 2023 at 01:51:04PM +0000, Dorine Tipo wrote:
>=20
> Fix the line lengths of lines 8 and 49
>=20

Is it checkpatch fix?

> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
>  drivers/gpu/drm/ci/igt_runner.sh | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_ru=
nner.sh
> index 2bb759165063..d7b779bb7f64 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -5,7 +5,8 @@ set -ex
> =20
>  export IGT_FORCE_DRIVER=3D${DRIVER_NAME}
>  export PATH=3D$PATH:/igt/bin/
> -export LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:/igt/lib/aarch64-linux-gnu/:/i=
gt/lib/x86_64-linux-gnu:/igt/lib:/igt/lib64
> +export LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:/igt/lib/aarch64-linux-gnu/:/i=
gt/lib/x86_64-linux-gnu
> +export LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:/igt/lib:/igt/lib64

I'd like the former (single-line) assignment version.

> -curl -L --retry 4 -f --retry-all-errors --retry-delay 60 -s ${FDO_HTTP_C=
ACHE_URI:-}$PIPELINE_ARTIFACTS_BASE/$ARCH/igt.tar.gz | tar --zstd -v -x -C /
> +curl -L --retry 4 -f --retry-all-errors --retry-delay 60 -s \
> +	${FDO_HTTP_CACHE_URI:-}$PIPELINE_ARTIFACTS_BASE/$ARCH/igt.tar.gz | tar =
--zstd -v -x -C /

This one LGTM.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--+IGZbxdgpE8N3o2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZT5n9gAKCRD2uYlJVVFO
o7KuAQCNWqOLgT6d0cU/7eaEiZMLafusZHMKJi1OvsPCdiDXOQEApgOKm+qME/IC
zdQejLNFHVo5rqO05qFFPEe71U05wQ4=
=buIf
-----END PGP SIGNATURE-----

--+IGZbxdgpE8N3o2c--

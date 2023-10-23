Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 575B27D2E81
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 11:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A310510E1A8;
	Mon, 23 Oct 2023 09:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFF510E1A8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 09:35:38 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1ca82f015e4so17646865ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 02:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698053738; x=1698658538; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yABT5FFnh4X/Y/LyB66g3fqLvBOZpaIzrRY5ABFGnkQ=;
 b=KF3i+PlNhruNXfOECLCzH8ekNx9mGnImNbDnofv9EV1TVxZsRhCeHGkPf3uIOR9T1G
 5tA1F8kKr8yKkAV9DfayBvt6OKjgQ2g95EbtUx0lZ4Aww+bGDk0/NQhipeziOhqbTYwz
 3V9p+soNbb7DrNTdyJDHxWd6trNvDMW1W84uNVynPDJdkDHf1aN0vhg1FW0qCE585zxK
 c6/vvp4wU2+xQJUuuejbNWEHwrCuZ4PsMPhWzqAywOlA+uGTdrD6/RX7EXr0Z61rpodV
 72Bd2VKp6dx8+ZF4rF7wev9k9S5Z9NhbU0T/5IT/O9o6W/MbPt8XZ3PnxUOwvwpPd/Yv
 zj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698053738; x=1698658538;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yABT5FFnh4X/Y/LyB66g3fqLvBOZpaIzrRY5ABFGnkQ=;
 b=uDEBscax8GZ7latY4hvccTP90vvw2B2kAPvcgWCE2Gkv8GeXH2tPEGmv75UOtjdVsF
 nhVc7lzGfZAfo62CqpaDh5Wvg+xBRJ+BqGr8r2ktsyW9O9yo+ONLgHYiK7vkSqE2jKfh
 4iiXr88DmGiW31OwPFxxhK+DHIg9bceNYCKUzB5G7gYgE/mK+XGN55IPi/POP6ivbx6/
 mU3C1lWmNTAtgePA9Ey3BewPGP3e8tlDKMloSmPvFszMA+sWkwfWBWsRjtqlMA3S/Oie
 t4WVP8eeCbSlbMYW1/gsxDCXJugUVcW77qtVBgsLW+jtRKJkEfHf58wkXYLB+g6Hz38S
 OwAQ==
X-Gm-Message-State: AOJu0YznKwszH/qjTzopBv7EQ99spKb9D8YvWJgsbog/0kLA2MkJgDl4
 W+DHu5uF3eTZ1frLV8LUqXY=
X-Google-Smtp-Source: AGHT+IFvSiOA6htTOo8olw+VPfJ4yMRiqsMDCFp7e9OCUIXpHMLjxUv5QtpdSinJRP1SkxsAjJkSFQ==
X-Received: by 2002:a17:903:110d:b0:1c9:ea6e:5a63 with SMTP id
 n13-20020a170903110d00b001c9ea6e5a63mr7679602plh.32.1698053737624; 
 Mon, 23 Oct 2023 02:35:37 -0700 (PDT)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 jc1-20020a17090325c100b001c5fe217fb9sm5568258plb.267.2023.10.23.02.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:35:37 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 2F7CF812660D; Mon, 23 Oct 2023 16:35:34 +0700 (WIB)
Date: Mon, 23 Oct 2023 16:35:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/vc4: fix typo
Message-ID: <ZTY-ZqWxW5V-T680@debian.me>
References: <20231023085929.1445594-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HhZAxpuppBM8l8d1"
Content-Disposition: inline
In-Reply-To: <20231023085929.1445594-1-dario.binacchi@amarulasolutions.com>
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
Cc: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 Eric Anholt <eric@anholt.net>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--HhZAxpuppBM8l8d1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 10:59:20AM +0200, Dario Binacchi wrote:
> Replace 'pack' with 'back'.
>=20
> Fixes: c8b75bca92cb ("drm/vc4: Add KMS support for Raspberry Pi.")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>=20
>  drivers/gpu/drm/vc4/vc4_regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_reg=
s.h
> index f3763bd600f6..8ac9515554f8 100644
> --- a/drivers/gpu/drm/vc4/vc4_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_regs.h
> @@ -588,7 +588,7 @@ enum {
>  # define VC4_HDMI_HORZA_HAP_MASK		VC4_MASK(12, 0)
>  # define VC4_HDMI_HORZA_HAP_SHIFT		0
> =20
> -/* Horizontal pack porch (htotal - hsync_end). */
> +/* Horizontal back porch (htotal - hsync_end). */
>  # define VC4_HDMI_HORZB_HBP_MASK		VC4_MASK(29, 20)
>  # define VC4_HDMI_HORZB_HBP_SHIFT		20
>  /* Horizontal sync pulse (hsync_end - hsync_start). */

The patch LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--HhZAxpuppBM8l8d1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZTY+YgAKCRD2uYlJVVFO
o4uJAPsF/0tqkXJtyKWS9NFtEic6P8EFkZFBwN7whe0nGCG1TgD9ESkhI7yTyWaC
8KW7Y7+ovXXLIouw0NbhOqNjfpsr0w4=
=5e8G
-----END PGP SIGNATURE-----

--HhZAxpuppBM8l8d1--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2257A2577DD
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 13:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3C089FEA;
	Mon, 31 Aug 2020 11:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B18589FEA;
 Mon, 31 Aug 2020 11:02:11 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id a26so7943175ejc.2;
 Mon, 31 Aug 2020 04:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=y2QxnqD/1GqUYAZY6NBKUAuDj/nq3iGjxOKV37yba/w=;
 b=KcY1b2hAsR6BY9OMaCp/0Sm28/cROsMbs1Cgr3ZdYTkegiIzkP1pGDhic1pPB8FRvC
 pBRwYuya3qddJQ/NLNdhe+C0kcj/vLoW2bATm2j9d5+y1tJvzAv8EQLKto6+kTt/O+xE
 cjMeZbDJGktxm5YgrYCw8BWmuNM4w05XLpmYoX3pNIfFNF/Pv7Gi8F5p+jJVsnlZDGju
 tJLDIFBN5E/dT4ls5RRfcWLxqXNVnz6i2LiUfdeOF0vvYwPiAUnP17ILIqNZ50PCsASR
 6y1g9SLmTx1z5dIIJ6c9CLpn3X+WidNJbo4YssIV/QPcEp+FlT/geWsYD9a27Qr3iiU3
 /caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y2QxnqD/1GqUYAZY6NBKUAuDj/nq3iGjxOKV37yba/w=;
 b=Xb7BozHzFLrV+q8lNtsDI+44gVGqgqJnzcgQwu5i6pSGGf//JXol+mAyIHgJnY8aew
 TCMTPuvwWGUZmVAXsOQinXNhzTS90Qu/qnXyz1rxuXCe6Xy3reOFonpLFAKAxWCCWDNx
 K9SamWJfFQeONY9dO2A9w3SKt16cQiLeNExDBG4x2N8YJVptradkLk7okzSAKwJbkFlp
 uANUPjZoQhZC01qu1Qt6X3HDExtU1IlowbLZsE7PHkcLVWbaPIeNNm7nZqyuwAvdqC6d
 aM1d5XgpeURDuNgm0qg0O4X9ZA80U7FZIlRRYuGYshU2fv7vdogI46fBrbl1D5NVylsE
 zxLg==
X-Gm-Message-State: AOAM532EobI8enuTy/vVM72sNP/BaD64NP0MiYSLLlUkOHkeEfBsMxee
 dhTglxcg7B7Kj90O99vVmHs=
X-Google-Smtp-Source: ABdhPJxRwTwdJG8coU1+OFQeCDGe/IHZIporIBSIsMhzEvsSXTEcZbztHAA8FX0DsHxcCx4MpcjJmQ==
X-Received: by 2002:a17:906:1154:: with SMTP id
 i20mr565986eja.243.1598871729707; 
 Mon, 31 Aug 2020 04:02:09 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id j1sm5708906edf.44.2020.08.31.04.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 04:02:08 -0700 (PDT)
Date: Mon, 31 Aug 2020 13:02:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 04/17] pwm: lpss: Add range limit check for the
 base_unit register value
Message-ID: <20200831110207.GB1688464@ulmo>
References: <20200830125753.230420-1-hdegoede@redhat.com>
 <20200830125753.230420-5-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200830125753.230420-5-hdegoede@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============1536148311=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1536148311==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2020 at 02:57:40PM +0200, Hans de Goede wrote:
> When the user requests a high enough period ns value, then the
> calculations in pwm_lpss_prepare() might result in a base_unit value of 0.
>=20
> But according to the data-sheet the way the PWM controller works is that
> each input clock-cycle the base_unit gets added to a N bit counter and
> that counter overflowing determines the PWM output frequency. Adding 0
> to the counter is a no-op. The data-sheet even explicitly states that
> writing 0 to the base_unit bits will result in the PWM outputting a
> continuous 0 signal.
>=20
> When the user requestes a low enough period ns value, then the
> calculations in pwm_lpss_prepare() might result in a base_unit value
> which is bigger then base_unit_range - 1. Currently the codes for this
> deals with this by applying a mask:
>=20
> 	base_unit &=3D (base_unit_range - 1);
>=20
> But this means that we let the value overflow the range, we throw away the
> higher bits and store whatever value is left in the lower bits into the
> register leading to a random output frequency, rather then clamping the
> output frequency to the highest frequency which the hardware can do.
>=20
> This commit fixes both issues by clamping the base_unit value to be
> between 1 and (base_unit_range - 1).
>=20
> Fixes: 684309e5043e ("pwm: lpss: Avoid potential overflow of base_unit")
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v5:
> - Use clamp_val(... instead of clam_t(unsigned long long, ...
>=20
> Changes in v3:
> - Change upper limit of clamp to (base_unit_range - 1)
> - Add Fixes tag
> ---
>  drivers/pwm/pwm-lpss.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9M2K8ACgkQ3SOs138+
s6FvmhAAidTtMFsrm8acDCUZfp1D48n+LAL/edmqIHFYYgVuC+TyEnpQvACrUc8u
SMgxqEtVGql7SItwicnNAKo8d1HliKdeQPLxlLVjpWBaNGJisn1c0Pau+X3oB4rq
7Qnmkfo6qDKJRm0T13JyNB+3GtQkbC2je7/cFu3UN+aaHEVL/MUGJb+NJdrdcWaA
oSomXdi2RJylkudfQuD4QleIst9pI2N5q1FUz0R15fOx2fagjOQpD6bKXvpCkIeY
QTUafA1Y7ymd7cpfKV4y38jglJ1KfFvkuxqHhLWJiMmt67v/sOdsuSzzI2PGNkge
TDLr9/5nfnNBVRZ3W4BUsC0+hsVaENyRdIPUzu/gtpJ1N6eEkLi3YpM7EyeDlA2Z
yZAj39b0ea5jPd6eQuPuVyDkiZnUypAjmytIwG88ABmuuLlvTnlNKcJ41cM1ZwZr
VMjy/gosQPaJpnE51W+g1rsjVzFhVy1yxXoWKwVfV+nX+jai3uzZD9dFH+ydYZe4
PUgsW2/J5p0szzo08PJmXZalfN+e0fhrV1OZMwVZFLLK2Ao6W36rVJzeBZoa+zWL
Rsuf0YfhFzLDcDH4fCiU3jU4TrDfCycx59B+sggHC0LwpKDP8n3BxRMVuAat+v9p
BNGzjn/3fs3vtixtQTa7AG0yFuEEPKmrJgVoF9KsquZrNxBg9Qs=
=zX3v
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--

--===============1536148311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1536148311==--

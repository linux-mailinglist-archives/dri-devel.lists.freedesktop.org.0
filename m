Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5BB36F80C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 11:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136626E105;
	Fri, 30 Apr 2021 09:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224026E0EC;
 Fri, 30 Apr 2021 09:44:05 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id o16so80022372ljp.3;
 Fri, 30 Apr 2021 02:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Fs02BtOhyd5FC7gJVvuNNnKp3USLnWgaJaXUagMKFBA=;
 b=dK8zYu4P/DGIh50k5SZYSjv+Xqltz7NenlES4ey5LWVVtIsQU6LbbQOPlkSayienEe
 XJ4/uLpsfg78jfkDJADARkTy3NOE+7Z10ynUOABeH+y3us5ZmyGTdg1c/bYv+xKlmedO
 q5/c8DRDN5RrnwCVXISqoR62bmxb85YWtNO+jUmsmycoj7Tyd78Nj+veIMgxcDnmuv+d
 NAbew1YO7cdMnvRdcTNC4mvWZ+JbfW9is1fdO2sZv3osGS8OLqPlY39BF/FU17sIgJLX
 XJcVJoD36qi0BB9vO9FyoKe9tw2jq5gZDQWkjsXWYysxlI81q6f4INGWoowaBhzLVbAa
 DjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Fs02BtOhyd5FC7gJVvuNNnKp3USLnWgaJaXUagMKFBA=;
 b=NDd7guKGPIxAuAQOXF9CRDTCEAEoLfWbdJuvR4HGqpYHEwfD8AfbbB7qK/k/f12d0M
 0MkgtJNbwVgZThNfRdm2URQsW+KiCWxWQSgjl/vecVWEmQ+XvK8lLbjpaNc/t31/b7aJ
 qQgt7gDlKWRdWXnbRethQxEH2rneAOM3wWw01MFQmYOTTcauYmUdfwVde0AgmGEPyKH/
 RWvKE2zv6fgb0FAScsf25o3sTFioeHeCRPXRHaI5pvOf4Pf3HkkW1MiwOL2aaPftxkcS
 697TBhwVeiJvjVGiNTImc0iV/oRgjEqrcb3ltmGvy4YOGXKms2fotQtc/EOu1Fjj5WBj
 P8Hw==
X-Gm-Message-State: AOAM5306sJWAyPZCPkccyQiNAmw3h+Aj9X5L/CX/U2IeFtWlfvkeA64+
 3dQ29fLw6f6th4RDfoftPkk=
X-Google-Smtp-Source: ABdhPJzwx4zzWO2ON86GfiGdWFlSwks7GUnSyoTWT76KXl+8v665hOTFhdptLorEWAxDGUqF+HrZlg==
X-Received: by 2002:a2e:99ce:: with SMTP id l14mr3245758ljj.114.1619775843536; 
 Fri, 30 Apr 2021 02:44:03 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h12sm181977ljh.21.2021.04.30.02.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 02:44:03 -0700 (PDT)
Date: Fri, 30 Apr 2021 12:43:58 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Shashank Sharma <shashank.sharma@amd.com>
Subject: Re: [RFC PATCH 0/3] A drm_plane API to support HDR planes
Message-ID: <20210430124358.1f5ac6ec@eldfell>
In-Reply-To: <ba369002-69e9-15d5-323c-1923ecdeda63@amd.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210427175005.5b92badc@eldfell>
 <ba369002-69e9-15d5-323c-1923ecdeda63@amd.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Bhawanpreet.Lakha@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 sebastian@sebastianwick.net, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Content-Type: multipart/mixed; boundary="===============1967785141=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1967785141==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jF0/5g5+Pu5KXVUetVMNU5x"; protocol="application/pgp-signature"

--Sig_/jF0/5g5+Pu5KXVUetVMNU5x
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Apr 2021 13:24:27 +0530
Shashank Sharma <shashank.sharma@amd.com> wrote:

> Assuming these details, A compositor will look for DRM color properties l=
ike these:
>=20
> 1. Degamma plane property : To make buffers linear for Gamut mapping
>=20
> 2. Gamut mapping plane property:=C2=A0 To gamut map SRGB buffer to BT2020=
 colorspace
>=20
> 3. Color space conversion plane property: To convert from YCBCR->RGB
>=20
> 4. Tone mapping plane property: To tone map SDR buffer S2H and HDR buffer=
 H2H
>=20
> 5. Gamma plane/CRTC property: to re-apply the output ST2084 curve
>=20
>=20

...

> =C2=A0*
> =C2=A0*
> =C2=A0*
> =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=90=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> =C2=A0* HDR 600 Nits=E2=94=82=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=82HDR 600 Nit=
s =E2=94=82=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=82HDR600=C2=A0=C2=A0=C2=A0=C2=A0 =
=E2=94=82=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=82HDR500 =E2=94=82=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=E2=94=82 HDR500
> =C2=A0*=C2=A0=C2=A0 =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=96=BA =E2=94=82=C2=A0 Degamma=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BA=
=E2=94=82=C2=A0 Color space=C2=A0=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=96=BA=E2=94=82=C2=A0 Tone mapping=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BA=E2=94=82=C2=A0 Gamma=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=82
> =C2=A0* BT2020=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=82=C2=A0 OETF ST2084=
=C2=A0=C2=A0=C2=A0 =E2=94=82 BT2020=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=82=
=C2=A0 conversion=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=82BT2020=C2=A0=C2=A0=C2=A0=
=C2=A0 =E2=94=82=C2=A0=C2=A0 H2H=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =E2=94=82BT2020 =E2=94=82=C2=A0 ST2084=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=82 BT2020
> =C2=A0* YCBCR420=C2=A0=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=
=94=82 YCBCR420=C2=A0=C2=A0=C2=A0 =E2=94=82 YCBCR->RGB=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =E2=94=82RGB88=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 600->500=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=82RGB888 =E2=94=82=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =E2=94=82 RGB888
> =C2=A0* Non Linear=C2=A0 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98 Linear=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=98Linear=C2=A0=C2=A0=C2=A0=C2=A0 =E2=94=
=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=98Linear =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=98 ST2084
> =C2=A0*/

Hi Shashank,

I think you might have degamma and color model conversion reversed, or
is that a new thing in the HDR specs?

Usually the YCbCr/RGB conversion matrix applies to non-linear values
AFAIU.

There is also confusion with OETF vs. EOTF. I got that initially wrong
too. OETF is not just a name for inverse-EOTF but it is used in a
different context. Though here it seems to be just a typo.

OETF is inherent to a camera when it converts light into
electrical signals. EOTF is inherent to a monitor when it converts
electrical signals to light. Depending on what the electrical signals
have been defined to be in each step of a broadcasting chain, you might
need OETF or EOTF or their inverse or a different OETF or EOTF or their
inverse.

As we are talking about displays and likely assuming display-referred
content (not scene-referred content), we probably have no use for OETF,
but we could have several different EOTFs.


Thanks,
pq

--Sig_/jF0/5g5+Pu5KXVUetVMNU5x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCL0V4ACgkQI1/ltBGq
qqfEsA/4p4kXQf6b4g3jDgoJdIGiubNpMyuFWQPCStvjnPHv8g3KIk6uTTh725LA
fE20hqzLxMn/pw+UbFkz+ELK9kcUG9lI0ih4DRCIgdiHWyznJPzl+p0lxJKCLVrC
ZscDhcm8v0hjmzzD5R24DqKj2IdEwyqH7mM0hpzxyd0oSaR4ToFcvFhNZmT14qqY
bql+U1UtndPio2KkI96/owTLMNHHSBIidV4kTrQY69qJeKBGcftfg790Y1YKjjXm
ZKd+pamZmN1ovZru2aoDnCQ9jO65SUd32aD7F241sXU5UKH6UUIXLI9yfiJUcO45
QU3zsRnYBo3rHBtYc2xC7h/36pooPlYlz9ECEyBRjb6mKmwOv/xIAyiG43Kx4SjY
UmASFIybtV65KZhVub8yQ5XPDR+RCulU30poR6Jb8ivtKChjCAyrzDbiYoD6h+Hb
WNbcMlH9xCBizo2uP+7PFxLD0ZD13rJkvowZKVAGjnnvIghuIAhaGIt3/d7FLUWO
5KRtvaAaZx0AagRqUAXel25C+5mFimo1caPJ1rEk7Hpp6+yQoB/gfWAtJddV2GT5
+4bDmCNRFWID/viBAONgFI+IaBZIsSnVSK6C8aUql1qIy8wAP6wHeuFIhd8hbDBh
DSj6oy5m2+sTbumokHrUE6n2AbukKj0sT0g7JL3OANjWB/uFKA==
=25O5
-----END PGP SIGNATURE-----

--Sig_/jF0/5g5+Pu5KXVUetVMNU5x--

--===============1967785141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1967785141==--

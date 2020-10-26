Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527D7298E4A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 14:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4676E141;
	Mon, 26 Oct 2020 13:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37726E141
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 13:42:57 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id z2so12148133lfr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 06:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=qgYsqaivfetMk7mvJHK3FQ2a1CMb2JLPvPHJjDRvsYs=;
 b=fnQBuMDlszJP7R8ECIaEOj4mVCC8tewpe2/nodqKi0M5wsp4AV0bW2e9EanoybTDGx
 olTPG7x9ErD88p11BkUKLr1NJpg/xTY/RwMZNpzMNLvyxWIl1PpLW+j5mJ9qeo+6ibnF
 n3K8RxqqlOalqhyLTwwaBJnPK84PJTZdFExbLA6ztrzdJ5T7ptkFQ7CD7NMYPKqC7/Aj
 iEx/HxszKiIajjyDbsVWr15V9qO6f10ejgSmMGEjODKjNLOHlvzCq7Q3Nm09HF+ad70y
 AMzZT1vToMPHISO9zBaWdiJJStTiTThpBjQhut76RzP4C7CSf8BFLeDg5Xhef9uVCJtd
 HmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=qgYsqaivfetMk7mvJHK3FQ2a1CMb2JLPvPHJjDRvsYs=;
 b=NuzIIrmwuJaMkx5pO1VxCxnOJMAWIS5tzshil+G/BAXLcdFe2HqvPb8dUUrlVvgSuF
 oXz26vZZPSkSvpAXeCMPxpzntI3z3n0caoqPLB6GpzDh6gIxsgNb6IAYhyjU67yZqwjd
 JQZ6OB5SfBgB5ZbORmqtnE616zm+6kMbVnGWkXnKXTBR+H6y9VqU6k7ME5S6tW9NwK8r
 JZy3OG8WyiRANeR8tTtfg3q69cHz0APjVQUUp6z77s4lQwW/c2n30Wy3kupUAjrH5WSK
 LVdBK3UQjN1hLdIq3Lxrx41EB8Q62Rjk4IqxgBUudMTrtcrG65qzJJJA9NQ69vCG/q9+
 3FKw==
X-Gm-Message-State: AOAM530QBxCa6apzSqoF7r1WOvvhSfz1TvGBo/mOgzEDaOLKEhUXrS/Z
 euTfnCxpX4j1YSurundiXgw=
X-Google-Smtp-Source: ABdhPJwOS6KJTs7WMgzoN/tniVJKKVLEY1kOXe9iJLFGTON0fVECMMdW32YH+P+HnyIpW76dnoitKA==
X-Received: by 2002:a19:e015:: with SMTP id x21mr5717851lfg.586.1603719776091; 
 Mon, 26 Oct 2020 06:42:56 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r3sm1039779lfm.287.2020.10.26.06.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 06:42:55 -0700 (PDT)
Date: Mon, 26 Oct 2020 15:42:52 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: document that user-space should avoid parsing
 EDIDs
Message-ID: <20201026154252.62817c86@eldfell>
In-Reply-To: <V_APW3gKRhljvcmT28tGV3JkP7qW9Z7h45I-s2wiJvYhaaveCpYpg3tztZPsZVV2KV1NC7rUx08IUUgCJXzdRrWCsEGB0czq4ZozpdyVFLs=@emersion.fr>
References: <V_APW3gKRhljvcmT28tGV3JkP7qW9Z7h45I-s2wiJvYhaaveCpYpg3tztZPsZVV2KV1NC7rUx08IUUgCJXzdRrWCsEGB0czq4ZozpdyVFLs=@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1578656313=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1578656313==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BXzoeGih0r/RiwRrxpw66VI"; protocol="application/pgp-signature"

--Sig_/BXzoeGih0r/RiwRrxpw66VI
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Oct 2020 10:34:44 +0000
Simon Ser <contact@emersion.fr> wrote:

> User-space should avoid parsing EDIDs for metadata already exposed via
> other KMS interfaces and properties. For instance, user-space should not
> try to extract a list of modes from the EDID: the kernel might mutate
> the mode list (because of link capabilities or quirks for instance).
>=20
> Other metadata not exposed by KMS can be parsed by user-space. This
> includes for instance monitor identification (make/model/serial) and
> supported color-spaces.
>=20
> v2: add short explanation why user-space shouldn't do this (Brian)
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Suggested-by: Daniel Vetter <daniel.vetter@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 717c4e7271b0..1913d8b4e16a 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -960,6 +960,11 @@ static const struct drm_prop_enum_list dp_colorspace=
s[] =3D {
>   * 	drm_connector_update_edid_property(), usually after having parsed
>   * 	the EDID using drm_add_edid_modes(). Userspace cannot change this
>   * 	property.
> + *
> + * 	User-space should not parse the EDID to obtain information exposed v=
ia
> + * 	other KMS properties (because the kernel might apply limits, quirks =
or
> + * 	fixups to the EDID). For instance, user-space should not try to parse
> + * 	mode lists from the EDID.
>   * DPMS:
>   * 	Legacy property for setting the power state of the connector. For at=
omic
>   * 	drivers this is only provided for backwards compatibility with exist=
ing

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/BXzoeGih0r/RiwRrxpw66VI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+W0lwACgkQI1/ltBGq
qqfNwhAAkxEL9xWydAkthiEpO0xnsPQgtOWimZ69H67nQXEW/INS0dkPYbXLXEoc
2jL0RQaxtWI4PiibJx0cB34oBO2LUUX4R02/XJqc22bknd6AlO1lLpPko6vsYqEY
u5KOOHqbROQAo1qnyVxu0SD4CDMy8ZkWxHTaM2ICU+bTkdZuuEsuS1Ppn0shQ6KG
xdEvK58JyJYkvylyHiyHJ2ts4U+8Ptk92w51TKM6zQIrdbtoBUTETqcj89aJR/QR
/6tnK/WakUtaby5kgRmTJ6dN96SmpRYfSCJMdGtW705T+7Ukmt65AOcEBXzWUhBM
HrtB4amCAydyYy0I7OMFs/zL1F5hrl0yj1F+ceaZ0g7nbSICYHt59titAZbJUdmH
2k2Ft1SHWoEFzuhGU2/5NJRNXe4hwkaOd4dkCyg8akTdwWuJQWUK0v5cSuS34Fzn
OEebrvRjRFCnPSdD4379dr+iB4faNnlek3ysmeGBq7OxPqrY2AsoqZLhHVijTtuc
WxPFm2yEJ2W9S8sRWdKR8IlOTtygf6+lS1m30TEDO4SIT2lkIHt5KLyPPydDEDTo
bokaV7B49pdvmDgo/G4nNN8M3FKuEowSvDAYByUuQ67P+H7bWlL4oRIbeegMPXNo
BFnEj3/vrHQWIerRN4UAvQ5bDuqJERt615tPOJaqNq4GAXEaJGY=
=Bb7I
-----END PGP SIGNATURE-----

--Sig_/BXzoeGih0r/RiwRrxpw66VI--

--===============1578656313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1578656313==--

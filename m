Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E50B83911
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 10:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D8610E66C;
	Thu, 18 Sep 2025 08:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QStIFduX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A673010E66C;
 Thu, 18 Sep 2025 08:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758184858;
 bh=wkdHSWOqeYK7n4RsHjVudEoksMfRdS1NB7ACekPCh0A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QStIFduXexoAAzOLAvOJaQI9nVerHdHQ1zMlvFMQxvef1K06itgtq8C/+vG403PME
 COHLexsulXNL/hGoIoBPReg76vPBLjGzBQB5UtVV70Ts7BrI92mVDOxfS1C0vAMCNO
 KvSvPD29IK0Wttmxy1KTU9Q41SwWC1WJkOYVEwhETgTQ9VNEutDziL0c4qT3+TX0y8
 0BW9BBas5MAWezpj7G7m6/hXB8PgP8gIj+a9KJYEOhSsvn8kYnhRxz7Daf7zvLtz6f
 aVT4Oc1kbHHKfuwxBePjjXmHrbeL/UAeLJDdz2EgrF84+HbhrEWzsXkhlTHWymyfnt
 od36Lcc6SjIoQ==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0595E17E12C4;
 Thu, 18 Sep 2025 10:40:56 +0200 (CEST)
Date: Thu, 18 Sep 2025 11:40:36 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Alex Hung <alex.hung@amd.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>, Sebastian Wick
 <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, nfraprado@collabora.com, Daniel Stone
 <daniels@collabora.com>
Subject: Re: [PATCH V11 06/47] drm/colorop: Add 1D Curve subtype
Message-ID: <20250918114036.454735e9@eldfell>
In-Reply-To: <610215a0-50ad-45b8-b60a-a52441619c73@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-7-alex.hung@amd.com>
 <DC6I12RMKGXL.1L8KAEE0UBNNW@redhat.com>
 <CAFZQkGyXbD_x0V6KBdR4vaunF+bG+HKOYAA7y6aVWfeTQ3cLzA@mail.gmail.com>
 <4eef4157-cad5-4399-9bc9-c5c2f005d472@amd.com>
 <20250826120306.618c275f@eldfell>
 <610215a0-50ad-45b8-b60a-a52441619c73@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uzPsFupCAS4ezSX2oPq_XI0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/uzPsFupCAS4ezSX2oPq_XI0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Sep 2025 17:01:07 -0600
Alex Hung <alex.hung@amd.com> wrote:

> On 8/26/25 03:03, Pekka Paalanen wrote:
> > On Thu, 21 Aug 2025 11:54:32 -0600
> > Alex Hung <alex.hung@amd.com> wrote:
> >  =20
> >> On 8/21/25 06:23, Xaver Hugl wrote: =20
> >>>> We user space folks have been convinced at this point that the sRGB =
EOTF
> >>>> is actually gamma 2.2, and not the piece-wise function. Now, if the
> >>>> hardware is actually the piece-wise, then that's what should be expo=
sed,
> >>>> but I'm a bit unsure if we should do that under the name sRGB EOTF. =
=20
> >>> Maybe simply rename the enum string to "sRGB piece-wise EOTF"? In
> >>> hindsight, the naming of "srgb" in the Wayland protocol caused a lot
> >>> of confusion, it's better to be explicit about it where possible. =20
> >>
> >> I will leave this to Harry to comment. He is taking a few days off so I
> >> will check with him later.
> >> =20
> >=20
> > "sRGB inverse OETF"?
> >=20
> > Strictly speaking "sRGB piece-wise EOTF" is not a thing AFAIU.
> >=20
> >=20
> > Thanks,
> > pq =20
>=20
> If an extension in future after this proposal is merged, can it be GAMMA=
=20
> 2.2 to be [DRM_COLOROP_1D_CURVE_GAMMA22] =3D "GAMMA 2.2" so it won't=20
> conflict with current name?
>=20
> Meanwhile, do we agree to change "sRGB EOTF" as "sRGB Inverse OETF" as=20
> the following? or do we still want to add "piece-wise"?

Hi Alex,

since my previous comment, things have muddied further again. FWIW, we
intend to remove the use of the name "srgb" transfer function
completely from the Wayland protocol as confusing:

https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/4=
42

I would recommend the KMS UAPI to similarly avoid the term. I would
recommend "gamma 2.2" or even "power 2.2" and "compound power 2.4" or
such. These names would hopefully not trigger intuition and make people
look at the definition harder. Or any other name you can come up with.

I agree that "piece-wise sRGB EOTF" would be intuitively clear, but it
may provoke people debating what does IEC 61966-2-1 actually define.
We've had these kind of discussions for Wayland already, and it was
suggested that it is better to define the actual mathematical function
in our specification that to leave it for interpretation from standards.

For KMS, this should be even easier than for Wayland, because the
hardware implements a specific mathematical function regardless of
where it might have originated or what it is being used for.


Thanks,
pq

> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 1551b86471ce..90a216c0b6ac 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -71,7 +71,7 @@ static const struct drm_prop_enum_list=20
> drm_colorop_type_enum_list[] =3D {
>   };
>=20
>   static const char * const colorop_curve_1d_type_names[] =3D {
> -	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] =3D "sRGB EOTF",
> +	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] =3D "sRGB Inverse OETF",
>   	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] =3D "sRGB Inverse EOTF",
>   	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] =3D "PQ 125 EOTF",
>   	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] =3D "PQ 125 Inverse EOTF",
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index e4250b7d8de8..ce85c52c60c8 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -43,7 +43,7 @@ enum drm_colorop_curve_1d_type {
>   	/**
>   	 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
>   	 *
> -	 * enum string "sRGB EOTF"
> +	 * enum string "sRGB Inverse OETF"
>   	 *
>   	 * sRGB piece-wise electro-optical transfer function. Transfer
>   	 * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
>=20


--Sig_/uzPsFupCAS4ezSX2oPq_XI0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmjLxYQACgkQI1/ltBGq
qqcLFxAArP7VFGLRZdI3HZym72NgRjpk0bQ8JA5uTFhkLAXuNL/YPBOyYwdTkbj3
EiAxC19Bwqlzkri0uA02SkGEqp3f/BvwsAeDzcV30tBm4G0BcsugdblQuJddH7lb
yaIptChV50+RGpH1rp/4tOa5b9k1cr7NFq3fEjWpieeMskJE306d95GOTBUqP3qm
OLNGZ77Je1ZIaJq5d4jCeu8IZwLixA08rb6CeF3//NXhhuY8VvwTh5eDDfL1Rquc
GFTBGfqon8zbMyHxL4qP0qBE5HPuYgW2539aQEf/KzcZFo1Ip2AW/aJY/xA0FdeI
dnCqookjhsiYSumZsqvtORqEt8f5bFwzvL3lnOKc6ydk+AGVj2CPR0IPSugAsypB
eDDAZh7edaGp9TsgqkKe5uQAqFh4KbN5LsfnaMDgKcrd4VfOvtCOx1GGcDs+01Rn
RDtt4HIvZKHBqJ8PlYinZPxEr7jXi0+RO76TdY72iOBviPSpBa+5wge0Fy4F9L7D
f+HG50zO7CYYStaFwKA5ADtHiM3jExfqTosijvHb6NzvesVijlBuqYhlIKaj5UNr
cAnI/KbjpRnPx9Xo0j9jmb89uWawy8zb6HgQci5xpV5anjLH1adClwNWL0XmZONv
vUb4lgHQNT1oFBk5e2qQzaOOS6jqx4PsFav2sC1XwqQ0RDMX+Wg=
=U5MB
-----END PGP SIGNATURE-----

--Sig_/uzPsFupCAS4ezSX2oPq_XI0--

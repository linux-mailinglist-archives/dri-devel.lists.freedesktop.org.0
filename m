Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6F2405A67
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 17:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E926E8A4;
	Thu,  9 Sep 2021 15:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770C56E8A4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 15:50:15 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d6so3228781wrc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 08:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UgP20PrIjaTH77RP4kewdyN9wQEEh5IFwR5t0ONAROk=;
 b=E9R0uHinsMH85srsjgg10G3dtMfBjLUdMFl4gYyTHK8HaCrwER0ZnIqdl8swtNJ9lY
 gL0DeGfhwsLewqa5GeFoIhbBLaeMnDVVBhvpmzJejZvt78a/oi3p1ayvkSEybf3OUInv
 U8rGEKJjdyWJbXKUijcJuS60AMqm4ehx7d+JjRMTI5nKqr8mZ/vrSLUgedBfWIS9gnb2
 6AUp0YqxW6zjN2ns1lt6sc67jwaCVRiQ5u513J+Quoa+OD0z1xW8gMsdfvkVFZswiw9g
 EPXORwNq1OdbtiVu1+ZnhK6brRXGpamKGo6Cz+yiZgz6DPlPiaeel6A0pR3LXnFubgbH
 Z9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UgP20PrIjaTH77RP4kewdyN9wQEEh5IFwR5t0ONAROk=;
 b=vBgzk5+dyenvHuX8fZr8+0PLYqD7ZhCjKZ9ORt+GpTe9V79V3u9GAdr377Fw0EF1Ho
 Z7jnm7Maj5kCmndftfi+9QpyMAhlQw5ciGBg/4COqPpbw/cHMqhQBu1BoM0LwTNd19im
 esEP0Xqx8WDA0ldTb2rQUf17cwpO5EFmf5gHVGOZZ+Hll/Ow5Nq5AA+qPqk0b7Vwrdql
 eeIUY0kttOeyIGeln3lgrPHfxU9PYM1phJw7+pm21v5YjFHjmlvWJJtGF9vAveo/Wco7
 75Gqh1A0PTNDFb2tggnpR5tOk0BGdDYrVsEdtFKyH5BIFAeXLcBGNX31XF6WEzWq6WNn
 mEzA==
X-Gm-Message-State: AOAM5307YT6qkVhAccJ3cJjyIojAANLZfuQfIe+an+hIeJW9lF9KjMrY
 VZ4PcZhtg6w26dJlgf+7Cj2ZA7bNkgg=
X-Google-Smtp-Source: ABdhPJwo2IIYAn1bAwLxHc47/PlXZfXpv/knmpVL0UN+YIsuyIbIGw1CIyQe8pUnhnQA+s1xcJfD8w==
X-Received: by 2002:adf:8170:: with SMTP id 103mr4532254wrm.167.1631202613917; 
 Thu, 09 Sep 2021 08:50:13 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id a133sm2155797wme.5.2021.09.09.08.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 08:50:12 -0700 (PDT)
Date: Thu, 9 Sep 2021 17:50:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for the Chuwi
 HiBook
Message-ID: <YTotMyMq/dfv9Jaa@orome.fritz.box>
References: <20210905130501.32980-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mD/m3EjSRGe1wsnH"
Content-Disposition: inline
In-Reply-To: <20210905130501.32980-1-hdegoede@redhat.com>
User-Agent: Mutt/2.1.2 (9a92dba0) (2021-08-24)
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


--mD/m3EjSRGe1wsnH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 05, 2021 at 03:05:01PM +0200, Hans de Goede wrote:
> The Chuwi HiBook uses a panel which has been mounted
> 90 degrees rotated. Add a quirk for this.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

I'm not very familiar with these quirks, but this looks correct and
inline with other entries in this table.

> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu=
/drm/drm_panel_orientation_quirks.c
> index 4e965b0f5502..7e0f581a360e 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -140,6 +140,14 @@ static const struct dmi_system_id orientation_data[]=
 =3D {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T103HAF"),
>  		},
>  		.driver_data =3D (void *)&lcd800x1280_rightside_up,
> +	}, {	/* Chuwi HiBook (CWI514) */
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
> +			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
> +			/* Above matches are too generic, add bios-date match */
> +			DMI_MATCH(DMI_BIOS_DATE, "05/07/2016"),
> +		},
> +		.driver_data =3D (void *)&lcd1200x1920_rightside_up,
>  	}, {	/* Chuwi Hi10 Pro (CWI529) */
>  		.matches =3D {
>  		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Hampoo"),

One thing I noticed is that there doesn't seem to be an entry for Chuwi
Hi10 anywhere in linux-next. Perhaps that's from a different patch in
your local tree, or it's based on some other tree that already has that.
In any case, I trust that this can be resolved when applying, so this
seems okay:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--mD/m3EjSRGe1wsnH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmE6LTEACgkQ3SOs138+
s6HK9Q//VAJlaTv7H/ox7oqp7l9TlhyF4RNqryJV+MY/7zBseMw1MZJBgltx2yLN
UNItIJ0zYaZ2f2AljoXLjfG3VoMAy/KB2HqJWOKBfPU8M9JdJaQ7/sGiqWMfqmsO
Z22vLYYon5gcNVCPKqlTTyh9obYv9+SVL9QUEol/p5uOcT3lFVH3ZX/d2uYq9gIf
XJ0m2pp1FuUFxXDmY4YHQbuJ94J/dLRvDlZ68ZhhUzqYzqcIUttwYzVJ6pVksntF
WH/l7CeoGIE06X8x0+I9mv/JsbT26GeU5l7zv+/aI51VXizObDwhw9cvsmZQn008
a2poNMCC+Le8UY5CQDjqQ4nUkVb7KmKePrViHxvjHby/Ge5P3ANF2dFa0szuzQtk
9O7Uq4thHeQ4yxTiVHk5GEzSLeV23FqJRk860oRwZCaxzeQ/+nJvPcsZmAVyGMme
1ZnoMR+GzRXNRHJTh5ikUvXaatrvgECQsytuxBeinigSYH0q1lWOwvlQ16gGpeA1
lcVZ0QcTzqLFIbsWBIaKcuhfgYCrnXW1iAgOg4YEfL6NbxsLFTy4GHbjkJiIqOzn
B4HOINbi1kVWMzI78DypZ7m9sZkzht+2pDB+XOzRFI6yVAPggB1vuJWy1Fb5doNh
Jrelkdd82ze2HEwSGyevPgRleBBEvOZDvKl+V383BqCKr8f2mv0=
=gDpf
-----END PGP SIGNATURE-----

--mD/m3EjSRGe1wsnH--

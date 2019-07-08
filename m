Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8C761CBD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 12:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB308996F;
	Mon,  8 Jul 2019 10:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAF28996F;
 Mon,  8 Jul 2019 10:09:20 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id r9so15271047ljg.5;
 Mon, 08 Jul 2019 03:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=0Hz4J+5xPL86b+p39O4qHct+jMFuQncbT1Jk8roAbts=;
 b=Xnuulj+EaQHaO/vX4r8LkSTKbRnuZTse1gScK83XzmHG/ULtKOg5IZL4iWGD9u6C17
 emoloWYrUY/vZZAW2hzaprHlccGzUUxrGhj9EQaX2gB38hg+ECX8O/1+pJmvYBAgP8Qh
 TUswi/9UVEqnbfY1ffto8lMiD5F2IZvfmNenhS2Rknr1QTOX8jGnvB4WWix3CoB/zDq3
 8EbG803QZDxxeII3x13dDABsTAleDcMD+ihR1uTuf0oKn9kggnJ2UgT+lSlrrb8RgT8/
 kLHRMbXdUASp+nGDucRIF84p1I3qkVNdUUBaWXJmYc+sCZ5kF5RHG6Es2voQVi6I4EWT
 HOaA==
X-Gm-Message-State: APjAAAVlAXGzKS3t8wa6ndKJTF09fXFSev/0hvW8RoN95wazrSA3WlRR
 UvU1LHUkd3ERTmR63HwUQz4=
X-Google-Smtp-Source: APXvYqxSCM/a+jF3uaiOyArPXU7IkdCc3F/hA3wBjtnRBmr5GURZOx9n+5cqdteqKZNH6oOMJayDiA==
X-Received: by 2002:a2e:3604:: with SMTP id d4mr9920340lja.85.1562580558875;
 Mon, 08 Jul 2019 03:09:18 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b9sm3566612ljj.92.2019.07.08.03.09.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 03:09:18 -0700 (PDT)
Date: Mon, 8 Jul 2019 13:09:14 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v8 4/6] drm/hdcp: update content protection property
 with uevent
Message-ID: <20190708130914.28ef159f@eldfell.localdomain>
In-Reply-To: <20190705004642.15822-5-ramalingam.c@intel.com>
References: <20190705004642.15822-1-ramalingam.c@intel.com>
 <20190705004642.15822-5-ramalingam.c@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=0Hz4J+5xPL86b+p39O4qHct+jMFuQncbT1Jk8roAbts=;
 b=LYL7o+aF0oeslPlJ/4525DT0SqkOh1eQlim9ZpuZ2STsZzVj/+EIYqeN1/oknmI7MY
 r8SwZ9ZpOy1OnwwtRT5nlluhelANmkHpN09n9cHjvJIV0XSZ2YLC/RysogFmM6BCJxVV
 bcTULQEFp1zLIAjBcGOLiMMXnxRcRG820MMnuSYX4W/S021P91Ze0genRtyO7JNr2Ggf
 xJRsquBaz1kabFSKoEswavnGNk2yda6DBUP/sdKj6JhNWLJxe0c+4IBBGO1cxJHJqBWi
 Li9uqBNUrPV//MpPm3Omet+JQ/7lhlr47cduCn4qLPp662btCANP9tynmu1hAoT5y11g
 5HBA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0378666109=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0378666109==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ALIdu2ChnhFJ5yU419jmS8C"; protocol="application/pgp-signature"

--Sig_/ALIdu2ChnhFJ5yU419jmS8C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri,  5 Jul 2019 06:16:40 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> drm function is defined and exported to update a connector's
> content protection property state and to generate a uevent along
> with it.
>=20
> Need ACK for the uevent from userspace consumer.
>=20
> v2:
>   Update only when state is different from old one.
> v3:
>   KDoc is added [Daniel]
> v4:
>   KDoc is extended bit more [pekka]
>=20
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_hdcp.c | 34 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_hdcp.h     |  2 ++
>  2 files changed, 36 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> index ce235fd1c844..77433ee3d652 100644
> --- a/drivers/gpu/drm/drm_hdcp.c
> +++ b/drivers/gpu/drm/drm_hdcp.c
> @@ -374,6 +374,10 @@ DRM_ENUM_NAME_FN(drm_get_hdcp_content_type_name,
>   *
>   * The content protection will be set to &drm_connector_state.content_pr=
otection
>   *
> + * When kernel triggered content protection state change like DESIRED->E=
NABLED
> + * and ENABLED->DESIRED, will use drm_hdcp_update_content_protection() t=
o update
> + * the content protection state of a connector.
> + *
>   * Returns:
>   * Zero on success, negative errno on failure.
>   */
> @@ -414,3 +418,33 @@ int drm_connector_attach_content_protection_property(
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_connector_attach_content_protection_property);
> +
> +/**
> + * drm_hdcp_update_content_protection - Updates the content protection s=
tate
> + * of a connector
> + *
> + * @connector: drm_connector on which content protection state needs an =
update
> + * @val: New state of the content protection property
> + *
> + * This function can be used by display drivers, to update the kernel tr=
iggered
> + * content protection state changes of a drm_connector such as DESIRED->=
ENABLED
> + * and ENABLED->DESIRED. No uevent for DESIRED->UNDESIRED or ENABLED->UN=
DESIRED,
> + * as userspace is triggering such state change and kernel performs it w=
ithout
> + * fail.This function update the new state of the property into the conn=
ector's
> + * state and generate an uevent to notify the userspace.
> + */

Hi,

this patch is not yet adding the documentation I asked for.

The uevent behaviour needs to be also documented with the Content
Protection property description. No userspace developer will know to
come to dig up these kernel-internal functions.

> +void drm_hdcp_update_content_protection(struct drm_connector *connector,
> +					u64 val)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_connector_state *state =3D connector->state;
> +
> +	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));

Still missing WARN_ON(val =3D=3D UNDESIRED) to prevent other drivers from
making that mistake in the future.


Thanks,
pq

> +	if (state->content_protection =3D=3D val)
> +		return;
> +
> +	state->content_protection =3D val;
> +	drm_sysfs_connector_status_event(connector,
> +				 dev->mode_config.content_protection_property);
> +}
> +EXPORT_SYMBOL(drm_hdcp_update_content_protection);
> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> index 2970abdfaf12..dd864ac9ce85 100644
> --- a/include/drm/drm_hdcp.h
> +++ b/include/drm/drm_hdcp.h
> @@ -292,4 +292,6 @@ bool drm_hdcp_check_ksvs_revoked(struct drm_device *d=
ev,
>  				 u8 *ksvs, u32 ksv_count);
>  int drm_connector_attach_content_protection_property(
>  		struct drm_connector *connector, bool hdcp_content_type);
> +void drm_hdcp_update_content_protection(struct drm_connector *connector,
> +					u64 val);
>  #endif


--Sig_/ALIdu2ChnhFJ5yU419jmS8C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0jFkoACgkQI1/ltBGq
qqe5dg/+OI/iOl3sF2ONKTqsHpCoNnodxcgU1ENHLnQhYrRW1ITwpG+M0mSOaYrm
MkiGW73QW5NhLVJofApw7CrmqutLhpm0QDdcsF3KpOwFsyd53Lzm6Fdv2bzmnGuo
ac3d95RlSSoXPPOjJzuiFvX6k5ZiL6RkkOgg91Ou66W0AMG72/ZKya1lGywcP0rn
HxYyOdQiz3jB355pJtnqFkqISvSk01f15VK4RiswzBjKPoo0XLOOsSw8aYWVMimC
JUCvPUsBIMorVkV4VI++EAU/L5Dtl1eVvW2Ih4eNtmzUSRAlBgJiWhEqeY2V3X6m
PLLPZx32fakKc9iXmu/xONcw41XXOCGRbv1h8ZDYQQa2INa2VJBP3At5S7QMOS+C
JerXYdtm+dT7wZi2El4OCEvG/Sfci0USpwM3MdAVldIZ9HP1zPtDADv3vK2fAgCE
wYKNWjA7gV58xk4+dO9EiXs/A31jlM9slRUjiYLQJl+E7VR2P4bTD/sc2NlVG0vQ
UTHHyj7WtfvxCo+8Lbw0vH5YfiUF3+6mBFOnoUX36rJv/aGeTGHTtBakhmrbm3Jp
9PocxcG5lrLBbmh5diO7imccVxALcFw0+hPjTGViD8ZlYjDCV0W5b/I39lyGWG48
2373/k5K2m390GQZsDsTEBKkcgfz9m19eimbuqp+GJbUvRp+D7w=
=LbgV
-----END PGP SIGNATURE-----

--Sig_/ALIdu2ChnhFJ5yU419jmS8C--

--===============0378666109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0378666109==--

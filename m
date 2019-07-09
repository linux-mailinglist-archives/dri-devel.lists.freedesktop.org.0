Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADF86380D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 16:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841CC892FD;
	Tue,  9 Jul 2019 14:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A09892FD;
 Tue,  9 Jul 2019 14:39:49 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id z15so13577122lfh.13;
 Tue, 09 Jul 2019 07:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=PmDPb/26yoWnyx9SMSJPuy67hU1ke+5RG0dpggYfBwI=;
 b=R4/Qp2vIku3W1A0SszdCZuOg5tF+zRWjbFUKVnYm0F6XRBoW/B0+/K5UbW4NmCXCqn
 v5YJ1p0wi8CgmsdSiLaS8vKefmCjlKgnl2TqEnQ4gIg7vB9ilguBJ69LNimuMVI1A5HQ
 fzS6AHfgDhhueVEgbiXDR+XlgKTP4GoPmevZrAHJqYOgcSe5y2B3QGNefuzohIrTj6ui
 9KZ01SAyB3twz0i0x1g4TH6Y74+CSQ9vYWQAr8X2y9X7nRxkUf8EWZBV2jaW8VQlCm2u
 Uw8ngfRcXOoWfTyuWcnS5NTXs5LjpA1izR2z01K0zpjnezpnRjIyCQUasUdQiPFC+HGX
 ieqw==
X-Gm-Message-State: APjAAAX9ccQzgYGYWPtfyqBjJHoOQ2QNSczsUHNaZGNsRSyWxQdZ5T2w
 uZvJrHETMqW+h9oQko1lqgtzLljO
X-Google-Smtp-Source: APXvYqzfXtHiA6FRNvv7Q4Sg8yzokrOoek/XoUVk2ha/fDHSWfYV5Wl7vumv3JyJg4Aq4+yFrfnJ9w==
X-Received: by 2002:a19:9111:: with SMTP id t17mr11824074lfd.113.1562683188255; 
 Tue, 09 Jul 2019 07:39:48 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k82sm4379783lje.30.2019.07.09.07.39.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 07:39:47 -0700 (PDT)
Date: Tue, 9 Jul 2019 17:39:43 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v9 4/6] drm/hdcp: update content protection property
 with uevent
Message-ID: <20190709173943.2981a5de@eldfell.localdomain>
In-Reply-To: <20190708112116.1780-5-ramalingam.c@intel.com>
References: <20190708112116.1780-1-ramalingam.c@intel.com>
 <20190708112116.1780-5-ramalingam.c@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=PmDPb/26yoWnyx9SMSJPuy67hU1ke+5RG0dpggYfBwI=;
 b=QY/mn3E2PpuMquAPNJtM98Fq/y9MERk3tRPTEtm4HNSFDKVFQbulzW6mqXyBsPoZsk
 p3Qks/hZkfTzf5to+09PZ1B/n6t0rxei5hVYh2G95la4CW/ERLf8kw5HBKwhq1tVtXFd
 idM/3atcl3dN7TLBf9gdy/2jHdZrkb38I7/G3o4rbijeASuo/Qkx0EuC6USKKtWDou59
 E89P3SloqSlJa4U7P1Wzf/7z15U3yJ8tAvv6hmYs6Cbu36/wFTWFDgUMcL4AAAzGyajQ
 Hfo/knPwXbaHHDauIOVv8QO5+f8onL4exY0qdpv/WXq5TyoOd+aPh4T47MA3kY3h00K9
 T9+Q==
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
Content-Type: multipart/mixed; boundary="===============1448215977=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1448215977==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Qx.9wJCymW_r55VRIZzzP=Z"; protocol="application/pgp-signature"

--Sig_/Qx.9wJCymW_r55VRIZzzP=Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  8 Jul 2019 16:51:14 +0530
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
> v5:
>   Uevent usage is documented at kdoc of "Content Protection" also
>   [pekka]
>=20
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_connector.c | 17 +++++++++++++----
>  drivers/gpu/drm/drm_hdcp.c      | 34 +++++++++++++++++++++++++++++++++
>  include/drm/drm_hdcp.h          |  2 ++
>  3 files changed, 49 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 732f6645643d..6de906ef10b3 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -947,10 +947,19 @@ static const struct drm_prop_enum_list hdmi_colorsp=
aces[] =3D {
>   *	- If the state is DESIRED, kernel should attempt to re-authenticate t=
he
>   *	  link whenever possible. This includes across disable/enable, dpms,
>   *	  hotplug, downstream device changes, link status failures, etc..
> - *	- Userspace is responsible for polling the property to determine when
> - *	  the value transitions from ENABLED to DESIRED. This signifies the l=
ink
> - *	  is no longer protected and userspace should take appropriate action
> - *	  (whatever that might be).
> + *	- Kernel sends uevent with the connector id and property id through
> + *	  @drm_hdcp_update_content_protection, upon below kernel triggered
> + *	  scenarios:
> + *		DESIRED -> ENABLED	(authentication success)
> + *		ENABLED -> DESIRED	(termination of authentication)
> + *	- Please note no uevents for userspace triggered property state chang=
es,
> + *	  which can't fail such as
> + *		DESIRED/ENABLED -> UNDESIRED
> + *		UNDESIRED -> DESIRED
> + *	- Userspace is responsible for polling the property or listen to ueve=
nts
> + *	  to determine when the value transitions from ENABLED to DESIRED.
> + *	  This signifies the link is no longer protected and userspace should
> + *	  take appropriate action (whatever that might be).

Yes!

This doc is exactly what I hoped to see. Good job.

This is also exactly how
https://gitlab.freedesktop.org/wayland/weston/merge_requests/48 deals
with this in userspace. That MR still has some open issues, but I think
nothing related to the uevent.


Thanks,
pq

>   *
>   * HDCP Content Type:
>   *	This Enum property is used by the userspace to declare the content ty=
pe
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
> +void drm_hdcp_update_content_protection(struct drm_connector *connector,
> +					u64 val)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_connector_state *state =3D connector->state;
> +
> +	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
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


--Sig_/Qx.9wJCymW_r55VRIZzzP=Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0kpy8ACgkQI1/ltBGq
qqdYkQ//YeP+JwQPZeFD17cZ26ZfGzgiSy9WhBbYbXqMf5X/lQrf1wgKAEABhXZA
tQ04U+GJfV7WAiiadhQaIckr/LbKb1V9Vqu/4NLqKnzrN2zUWgKM6GuB77EdNC4D
1EcP3Wt6I+qwq3n1MEPf4FJjVvef5TowT4xuUd01WWt0raJKSyzW7wwGKQsqDiWC
vbJZZS4zJhxR4qKZhqBh3ofYgEbvRPYQWb28mc/d/zqKb+i1isZw3FlXae5kXnKH
/6lKXKLFnSb/+lGqZJo7gComNdWa9KB3y543pvRGowP2x/e7XVuWVWr9dtHqGkgL
8O1M5NOFFqVTsf1ohcYCszOEkj8KF7lHq4xqgs8aBvvD2LTCHEIm06FYCaNdIYrW
Szby6MV0TmYUYajPBaBs+TYgPIs0CZQmkKK41pnYGn3XocEKF1mVE9F5bM0v5ym9
ywjSHoHX2smb6teg7BEFkZ10GWunQ6SyJGKlzcAiJ8rl7W10AVglnQavMLtpW2iB
0wrOHK8z+4aUUYRADMOs5IEvCUMVZFlB8dlpnoovsJj5YoNKr0tEEjmREt/s4KHQ
gx7OGlqY8ho6nmGpEnlEV5Jrosn03kXRgZrUQW6R6eqncSwUMvWDl2TWUfa7D2+C
o7jOnxzltBqb+QKpVN8/l+ePGmY0/PbesnsMOggaylBqOnby4Lk=
=tNuG
-----END PGP SIGNATURE-----

--Sig_/Qx.9wJCymW_r55VRIZzzP=Z--

--===============1448215977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1448215977==--

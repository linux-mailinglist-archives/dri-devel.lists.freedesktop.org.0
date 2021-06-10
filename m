Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377B53A26D4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 10:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECFB6EC6D;
	Thu, 10 Jun 2021 08:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6496EC6D;
 Thu, 10 Jun 2021 08:23:20 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id r5so1869463lfr.5;
 Thu, 10 Jun 2021 01:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=tvqfHyNBngUi+gzgwhD+HPPQiG20JFWoWT08MBcVNqE=;
 b=IaZ2g8xpczLrvPriAU7Rv/lVIUDmjxDlCQNVG43JyPn0o5gtNoerdMVNsGD9aoeBJJ
 Hfb22SFnu5N84Rn48GRq6+Dz0rnPIQgHfrHGSjgkG0aJqDyL6Y+8ZON2Vx7fapzq1Jlm
 ScaDq3crWn6GXbJ3MGADkjKzOdQIietHCzDOJg30JsktTcbtBiDfrrQ6/LIZLmk/Olbr
 fzgraDccieLAnboJ2joPn5U4H3+V+/pabM0W+rsvIqzemR2ybzmfbi0/bD2IJ3jm1wxF
 MMIXfKOMAjqZLA6O1fFUkSFHxSff1oiPBFi4NFOeOAM/2i7crVoVGkPYcu6iptvFCEf1
 /ZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=tvqfHyNBngUi+gzgwhD+HPPQiG20JFWoWT08MBcVNqE=;
 b=W9CT6om+8t7C7F/qrnkfACABIMXREWYN71R+Q4ftgajkRoYEkNTDZQSNImHyMhi/GA
 5bWzdjgyp2+mESx7zimTuxfsUQmtevWUKCHRb+tOpQMkEZfpPh/T1MI5gic8e0kNSeC+
 Gipeg1dqRQxqdrN/gEmmo+n+kBawa6aluZwT5NVDAKSAnxLtkP9cjVN3M9YVrsRAZQps
 cPSXV/BDt2JAGWoCKnP9LCvv57Q/Kg9NCHdVNqg2zKf1wIshtQuOUPoqNqUFxyvvNpEx
 ZQtNbwn7DCdxC/Tp0RIReTXikMXxwyYOhDHAj82EKhges+XTnFWfBjKcRWRbfzGNAHmo
 q7+Q==
X-Gm-Message-State: AOAM531Bu/IQAXBbcAdKXHM0GebFYoeg61bVFEO969wo0Rvf+g/s6cWa
 ykhdJ04UZ07fMef+7cBhd/M=
X-Google-Smtp-Source: ABdhPJxcH2TMgG3WCcZ+Oxs38G1glk+4HDDDXtGsrbFmPPkwzsh/aUX0rTrr927lSA+BorFMcHh7Sw==
X-Received: by 2002:a05:6512:3d1d:: with SMTP id
 d29mr1171053lfv.623.1623313398701; 
 Thu, 10 Jun 2021 01:23:18 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v3sm228947lfa.77.2021.06.10.01.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 01:23:18 -0700 (PDT)
Date: Thu, 10 Jun 2021 11:23:15 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 1/7] drm/sysfs: introduce
 drm_sysfs_connector_hotplug_event
Message-ID: <20210610112315.3370f1a4@eldfell>
In-Reply-To: <I7ivMNimkOH0GJ5SVonqiNBfYEunXBeQpK7ehs64Bk@cp4-web-028.plabs.ch>
References: <I7ivMNimkOH0GJ5SVonqiNBfYEunXBeQpK7ehs64Bk@cp4-web-028.plabs.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zHgt6RgBo2EGXgKXtQy1VAZ"; protocol="application/pgp-signature"
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
Cc: alexander.deucher@amd.com, michel@daenzer.net,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/zHgt6RgBo2EGXgKXtQy1VAZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 09 Jun 2021 21:23:27 +0000
Simon Ser <contact@emersion.fr> wrote:

> This function sends a hotplug uevent with a CONNECTOR property.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> ---
>  drivers/gpu/drm/drm_sysfs.c | 25 +++++++++++++++++++++++++
>  include/drm/drm_sysfs.h     |  1 +
>  2 files changed, 26 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 968a9560b4aa..8423e44c3035 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -343,6 +343,31 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_sysfs_hotplug_event);
> =20
> +/**
> + * drm_sysfs_connector_hotplug_event - generate a DRM uevent for any con=
nector
> + * change
> + * @connector: connector which has changed
> + *
> + * Send a uevent for the DRM connector specified by @connector. This wil=
l send
> + * a uevent with the properties HOTPLUG=3D1 and CONNECTOR.
> + */
> +void drm_sysfs_connector_hotplug_event(struct drm_connector *connector)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	char hotplug_str[] =3D "HOTPLUG=3D1", conn_id[21];
> +	char *envp[] =3D { hotplug_str, conn_id, NULL };
> +
> +	snprintf(conn_id, sizeof(conn_id),
> +		 "CONNECTOR=3D%u", connector->base.id);
> +
> +	drm_dbg_kms(connector->dev,
> +		    "[CONNECTOR:%d:%s] generating connector hotplug event\n",
> +		    connector->base.id, connector->name);
> +
> +	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}
> +EXPORT_SYMBOL(drm_sysfs_connector_hotplug_event);

Hi,

I believe this change would be safe for Weston while Weston would not
take advantage of the optimisation without patching it. The idea seems
fine to me, and patching Weston to take advantage of this would be fine
too.

I can't say anything about the kernel internal details on how to
implement this, and I don't recall if the per-connector epoch counter
was supposed to the exposed to userspace, offering a different way to
do the same.


Thanks,
pq

> +
>  /**
>   * drm_sysfs_connector_status_event - generate a DRM uevent for connector
>   * property status change
> diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
> index d454ef617b2c..6273cac44e47 100644
> --- a/include/drm/drm_sysfs.h
> +++ b/include/drm/drm_sysfs.h
> @@ -11,6 +11,7 @@ int drm_class_device_register(struct device *dev);
>  void drm_class_device_unregister(struct device *dev);
> =20
>  void drm_sysfs_hotplug_event(struct drm_device *dev);
> +void drm_sysfs_connector_hotplug_event(struct drm_connector *connector);
>  void drm_sysfs_connector_status_event(struct drm_connector *connector,
>  				      struct drm_property *property);
>  #endif


--Sig_/zHgt6RgBo2EGXgKXtQy1VAZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDBy/MACgkQI1/ltBGq
qqcnVg//b8urqcs7lXMMe2ZfhWKSTm8/at96q0h9H+5MBE6ilWXfDLY101tG8YsN
mm0HvJJZBTAJmNnq5y2+7YPUXdF30mvSQTGIR0Zyi/DvRTBLRyMWZZ4+VMBQ8X1h
HF2Jb0Vhur8lXClv2OpREnZZ2Aa/64u70/2UfWbPqqNaJQ5W9Ovy4IuGkMJwRrod
1gSdHmC4ifwgXCbmNDUZ+ptu24Qg3B8ts38DiXz13c1pSpUiu8oyDbSwikySa1q4
FaJJd/dRftIQV59uI37jnYv8hpTahvbp5lx+6+fV9K7d8YvoR6ADvHg8a5BnIk/L
X+Becgicalj97JV+hbDyvzoGudJnhRn+qpanaMdfoa2JAQlpFcUSDJuAkD0vGDPq
pJKsVJipdIOu5qHGYqhNomYQY3/1KCyfc8/0acsjKDybIyvaDC2YYw3ia+e2wmVe
MjO7ZEd2107P3a4NBVjlK/43s5FvphpPROIBy0/Dbtb1lv7eMa8ojleunrp2ILCS
EcYbMkyTlrex2ORhr0+MK/3NU3FYZZXRSXcGwG3HsXR9cKAeHZRPvBYkY73pLuCI
08LOoyjJ7dUCeDrwqS/zN8FGOmNHwac0AYGXitnInzKIEaoNNDNR5bKlP9HPWCBs
jiVsYd4HfH1fGETXigFUAV/nxfDpPv7KCWJpiI2D4Fx8wW9OJhw=
=aB2J
-----END PGP SIGNATURE-----

--Sig_/zHgt6RgBo2EGXgKXtQy1VAZ--

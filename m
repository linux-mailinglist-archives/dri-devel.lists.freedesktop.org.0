Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B2663A4F9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 10:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671E710E2BE;
	Mon, 28 Nov 2022 09:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9532710E2BE;
 Mon, 28 Nov 2022 09:28:00 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id p8so16373092lfu.11;
 Mon, 28 Nov 2022 01:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=N+sBWVG81GD3481BhUaem1GToFImFejdTt3G+jJFbTA=;
 b=hjUgUErDZ+19NMPpHO7f+9ODRzxn+XK2Ycdjza/1dE3OxfZYjyNx40iDMwU+Eisfm1
 yNq8UDD8yh3er3beQUzsJovBe3rFyiYnNJUHz5PWRr7qFrIpPnbx9DVWgkb0jgu/uocT
 NuJYpGCuBCbwGrvXDcC0MIz4NyvR6U6b0mHFLLQf9g8HTgsL1ErpKZs4I2t166HCJfIA
 RSGo3DtnQz3CjwksURfJi5eYIh4Vy7yLh0opskGu8uMpQe8wBE8HX8TDSWYtC5RiL93m
 s4k55xnmzP0oguaVDnWPRIJUYThTEcSZUebrdpyunRGuqyvaGLVxW4srIZlPw3dmt9eC
 JfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N+sBWVG81GD3481BhUaem1GToFImFejdTt3G+jJFbTA=;
 b=oA7jwKOEr721XZShNYUKXOqiUQ3MdqFsdGmOOpMpJwx1VOjmAIMYOKFZw8dYG+Edo1
 Z4Ao9SQn+y34fQMbxuU+2GQpL1plSCvu2r3FSaNTNNGkuyeJp+HQfkx6ogw1mTBoLwx1
 /rFaIzIJumxlTBvUd/mulz6+Mej+Y+P9iCcGOSmRBMKFlWFQ0sXhU92mlRZkRefm38+m
 vmA0p70W8oQO/RHIxcg7Lt7Yz1+2C6uHzPUwOzxl+oDLKWqGaHEU/PTF3PaR7m6QoCuP
 i14BnTa49Yr2YIfjszSYTi/aumZ/hwt/UXFPRlR18Q2btDncsn2X7/5ePIday5/Glsdg
 5G9g==
X-Gm-Message-State: ANoB5pmHPlmZDgVhCdeti21/licFxY9+gUw9GWaiJhWintELUmfaRRPq
 RYSjmeD0SZoMRr0Rf1dfRDA=
X-Google-Smtp-Source: AA0mqf7a8VeQAiQIJsxYtepIL7oukeN1hN3rKYbKuileisL49UhMYwm5SWvB1I9zrrIJoJItVsLAXQ==
X-Received: by 2002:a19:dc02:0:b0:4a8:b9c6:8741 with SMTP id
 t2-20020a19dc02000000b004a8b9c68741mr12423161lfg.178.1669627678695; 
 Mon, 28 Nov 2022 01:27:58 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 r5-20020ac25c05000000b004b4f3c0d9f8sm1657493lfp.283.2022.11.28.01.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 01:27:58 -0800 (PST)
Date: Mon, 28 Nov 2022 11:27:55 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v3 1/2] drm: Add GPU reset sysfs event
Message-ID: <20221128112755.52df3f6b@eldfell>
In-Reply-To: <20221125175203.52481-2-andrealmeid@igalia.com>
References: <20221125175203.52481-1-andrealmeid@igalia.com>
 <20221125175203.52481-2-andrealmeid@igalia.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aUlzZ38K0WssssJjVJMpEdE";
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, amaranath.somalapuram@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Shashank Sharma <shashank.sharma@amd.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 contactshashanksharma@gmail.com, christian.koenig@amd.com,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/aUlzZ38K0WssssJjVJMpEdE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Nov 2022 14:52:02 -0300
Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:

> From: Shashank Sharma <shashank.sharma@amd.com>
>=20
> Add a sysfs event to notify userspace about GPU resets providing:
> - PID that triggered the GPU reset, if any. Resets can happen from
>   kernel threads as well, in that case no PID is provided
> - Information about the reset (e.g. was VRAM lost?)
>=20
> Co-developed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
> ---
>=20
> V3:
>    - Reduce information to just PID and flags
>    - Use pid pointer instead of just pid number
>    - BUG() if no reset info is provided
>=20
> V2:
>    - Addressed review comments from Christian and Amar
>    - move the reset information structure to DRM layer
>    - drop _ctx from struct name
>    - make pid 32 bit(than 64)
>    - set flag when VRAM invalid (than valid)
>    - add process name as well (Amar)
> ---
>  drivers/gpu/drm/drm_sysfs.c | 26 ++++++++++++++++++++++++++
>  include/drm/drm_sysfs.h     | 13 +++++++++++++
>  2 files changed, 39 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 430e00b16eec..85777abf4194 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -409,6 +409,32 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_sysfs_hotplug_event);
> =20
> +/**
> + * drm_sysfs_reset_event - generate a DRM uevent to indicate GPU reset
> + * @dev: DRM device
> + * @reset_info: The contextual information about the reset (like PID, fl=
ags)
> + *
> + * Send a uevent for the DRM device specified by @dev. This informs
> + * user that a GPU reset has occurred, so that an interested client
> + * can take any recovery or profiling measure.
> + */
> +void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_even=
t_info *reset_info)
> +{
> +	unsigned char pid_str[13];

Hi,

"PID=3D4111222333\0"

I count 15 bytes instead of 13?

> +	unsigned char flags_str[18];
> +	unsigned char reset_str[] =3D "RESET=3D1";
> +	char *envp[] =3D { reset_str, pid_str, flags_str, NULL };

It seems you always send PID attribute, even if it's nonsense (I guess
zero). Should sending nonsense be avoided?

> +
> +	DRM_DEBUG("generating reset event\n");
> +
> +	BUG_ON(!reset_info);
> +
> +	snprintf(pid_str, sizeof(pid_str), "PID=3D%u", pid_vnr(reset_info->pid)=
);

Passing PID by number is racy, but I suppose it has two rationales:
- there is no way to pass a pidfd?
- it's safe enough because the kernel avoids aggressive PID re-use?

Maybe this would be good to note in the commit message to justify the
design.

What about pid namespaces, are they handled by pid_vnr() auto-magically
somehow? Does it mean that the daemon handling these events *must not*
be running under a (non-root?) pid namespace to work at all?

E.g. if you have a container that is given a dedicated GPU device, I
guess it might be reasonable to want to run the daemon inside that
container as well. I have no idea how pid namespaces work, but I recall
hearing they are a thing.

> +	snprintf(flags_str, sizeof(flags_str), "FLAGS=3D0x%llx", reset_info->fl=
ags);
> +	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}
> +EXPORT_SYMBOL(drm_sysfs_reset_event);
> +
>  /**
>   * drm_sysfs_connector_hotplug_event - generate a DRM uevent for any con=
nector
>   * change
> diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
> index 6273cac44e47..dbb0ac6230b8 100644
> --- a/include/drm/drm_sysfs.h
> +++ b/include/drm/drm_sysfs.h
> @@ -2,15 +2,28 @@
>  #ifndef _DRM_SYSFS_H_
>  #define _DRM_SYSFS_H_
> =20
> +#define DRM_RESET_EVENT_VRAM_LOST (1 << 0)

Since flags are UAPI, they should be documented somewhere in UAPI docs.

Shouldn't this whole event be documented somewhere in UAPI docs to say
what it means and what attributes it may have and what they mean?


Thanks,
pq

> +
>  struct drm_device;
>  struct device;
>  struct drm_connector;
>  struct drm_property;
> =20
> +/**
> + * struct drm_reset_event_info - Information about a GPU reset event
> + * @pid: Process that triggered the reset, if any
> + * @flags: Extra information around the reset event (e.g. is VRAM lost?)
> + */
> +struct drm_reset_event_info {
> +	struct pid *pid;
> +	uint64_t flags;
> +};
> +
>  int drm_class_device_register(struct device *dev);
>  void drm_class_device_unregister(struct device *dev);
> =20
>  void drm_sysfs_hotplug_event(struct drm_device *dev);
> +void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_even=
t_info *reset_info);
>  void drm_sysfs_connector_hotplug_event(struct drm_connector *connector);
>  void drm_sysfs_connector_status_event(struct drm_connector *connector,
>  				      struct drm_property *property);


--Sig_/aUlzZ38K0WssssJjVJMpEdE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmOEfxsACgkQI1/ltBGq
qqffnhAAn/qNAIPJJSqP+3/6qTZQhkiLuZ+MvbCFtrLOTr1DAd6yeNcWF8biypY2
J5CI42EyZfMiuwiVgsyEESGrf6/gGhF7G47NzsA1oal4iDkj9WZ8Wizzyw8M84gS
1DqX0ACVl7dDu741GZo1H3fDrnAEqdrvmJ5vzHeVb3EQovg8ZdSVJutuaqXqqP2L
6haRA6KGyTNV+pr5sEDiXPm6oj7sQgvaB4mJ4odnczUmIS9IJdaI+nZ1PFkIaD0E
BepXG805OeZCylLW56ikirup6GnKjhAkNShgySlK9cfOmDlerv5n5wKjgjTixJC9
tXbLUlXkbMDPuRFnaaWa0r7fYKbWBooBRtuaFimry0mStYbpqhYkdvWPa21ZzNsD
nFo7eAWv6fkue9m5bdWVMeVh1B0Fy6Jyi9ZiO/kIZ6Fisd9Mx2eqIWq2+X2EIEIx
C4GJ4v19EDNZ15FYisPUkUyTfnwOaY0ifK04PRJItYILm75VxV/64oclekA+APQ0
sIBbwU9XUg2WobEi6pe7l4V9EfhW1+MzuvuB9z0mZ8krBoMVCnpDWv2Jcr4kq8U5
l1Onx8sN/hFlB3JR4DoWjd2kHuUfqU2yAvdxAaA76DlK6blfEfjYgjD7rENJHdPl
wPpV57+ercFPrdfKKmW1AZr6z5Wpvizn02tX0emPuK/wYF3zuFg=
=lH7L
-----END PGP SIGNATURE-----

--Sig_/aUlzZ38K0WssssJjVJMpEdE--

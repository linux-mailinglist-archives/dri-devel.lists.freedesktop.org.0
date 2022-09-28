Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBD35ED9CC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 12:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9118E10E3CF;
	Wed, 28 Sep 2022 10:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086B710E3CF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 10:06:40 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h3so13821189lja.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 03:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=rG1KWr50uNAgXUbaS/H+AExSvfIeof+x42T6S7xy2nY=;
 b=emB5nd6ldiB/qhYHRwsF006XXp8ykybm2yEW5B52AmmBw1F1Sh5mLloUJkKfvGgEpc
 khmcL/zmF93dgeKgraVNqsLFwTqqyeeVmFnsyKcIk7nlTd+DK8RKaYQ8KGmMc8tiCOF7
 WNW5A6GtmjXnzmV9cqEwLk2VzCj4uzMG1eQy6CmTT1ClbNtrpHVmwolwMxQ2r8Jg0GdI
 1JEoQv584sMaJtaEVtt0pRfY3mnuZ74/fWP3LeohzLA7ld9nmj1fL6/rzOGB+nxSxo/5
 PP+CK/yTnw3kp62mmDkr5AANO3LJ7gv8EBeKgV0UosOY3YmeMKH08bsvPesM6ItKQDb4
 l+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=rG1KWr50uNAgXUbaS/H+AExSvfIeof+x42T6S7xy2nY=;
 b=RHkg8JxrYPc9/MLwnSULWPwPec6Q6+PcabwHrpkdM06XxJ2tO/iGDkmO1uCT7AkLlg
 fTmSpYRA+bfBt4WnN+g3WGH2/RQKPD/W8TpkRntjpqig/o5npIqV4oYkOXSb0/Q7JJzD
 VvhN/gQ3nMF1j5oItXB1a6tfz+LSk3TRiEMGLYb9MTmDZiciM07hcdzc/VnEd1/c30lE
 9tOXz++qi/1Zj17OodZiehTa9Bu/bE6XRXd7QR7PNrcTWrSM4si41E1yefgzJbfb74Cw
 6ZpMeCg1ijIA8Y+pVjTZJ419wRvxiutoHYUtAuvXvx68nO4zAj4UFAQqChcw/6tLN8PH
 UChw==
X-Gm-Message-State: ACrzQf3tA58zhVP8Zfherdkpux8dXALUPsQqe2R7MIk2y60R7wbsUcVN
 sbhtbWDtGeJJU5mtMwdMw1Y=
X-Google-Smtp-Source: AMsMyM5FUikWmuxLtgDezYzNsIES4LduKikax/tbZjxDLuOYMHAV87CBZ9bXk+1j7sep+OMwBk4zWA==
X-Received: by 2002:a2e:b0f1:0:b0:26c:5502:9568 with SMTP id
 h17-20020a2eb0f1000000b0026c55029568mr12027990ljl.510.1664359598107; 
 Wed, 28 Sep 2022 03:06:38 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 x4-20020ac25dc4000000b004979e231fafsm430332lfq.38.2022.09.28.03.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 03:06:37 -0700 (PDT)
Date: Wed, 28 Sep 2022 13:06:23 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] drm: document uAPI page-flip flags
Message-ID: <20220928130623.60b56910@eldfell>
In-Reply-To: <20220928094149.118943-1-contact@emersion.fr>
References: <20220928094149.118943-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Wdrl98Ar9hg_xA6MJ7qSQFy";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Wdrl98Ar9hg_xA6MJ7qSQFy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Sep 2022 09:41:57 +0000
Simon Ser <contact@emersion.fr> wrote:

> Document flags accepted by the page-flip and atomic IOCTLs.
>=20
> v2 (Pekka):
> - Mention DRM_EVENT_FLIP_COMPLETE in DRM_MODE_PAGE_FLIP_EVENT docs.
> - Expand DRM_MODE_ATOMIC_NONBLOCK and DRM_MODE_ATOMIC_ALLOW_MODESET
>   description.
> v3:
> - Fix struct field ref syntax (Daniel)
> - Clarify when artifacts are no longer displayed (Daniel)
> - Add note about sinks deciding to show artifacts on their own (Pekka, Da=
niel)
>=20

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Only nitpicks below, you can ignore them.

> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> ---
>  include/uapi/drm/drm_mode.h | 63 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index fa953309d9ce..9b10327b9d21 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -935,12 +935,31 @@ struct hdr_output_metadata {
>  	};
>  };
> =20
> +/**
> + * DRM_MODE_PAGE_FLIP_EVENT
> + *
> + * Request that the kernel sends back a vblank event (see
> + * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when =
the
> + * page-flip is done.
> + */
>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
> +/**
> + * DRM_MODE_PAGE_FLIP_ASYNC
> + *
> + * Request that the page-flip is performed as soon as possible, ie. with=
 no
> + * delay due to waiting for vblank. This may cause tearing to be visible=
 on
> + * the screen.
> + */
>  #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
>  #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
>  #define DRM_MODE_PAGE_FLIP_TARGET_RELATIVE 0x8
>  #define DRM_MODE_PAGE_FLIP_TARGET (DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE | \
>  				   DRM_MODE_PAGE_FLIP_TARGET_RELATIVE)
> +/**
> + * DRM_MODE_PAGE_FLIP_FLAGS
> + *
> + * Bitmask of flags suitable for &drm_mode_crtc_page_flip_target.flags.

Should this mention also drm_mode_crtc_page_flip.flags?

UAPI header defines both structs.

> + */
>  #define DRM_MODE_PAGE_FLIP_FLAGS (DRM_MODE_PAGE_FLIP_EVENT | \
>  				  DRM_MODE_PAGE_FLIP_ASYNC | \
>  				  DRM_MODE_PAGE_FLIP_TARGET)
> @@ -1034,11 +1053,53 @@ struct drm_mode_destroy_dumb {
>  	__u32 handle;
>  };
> =20
> -/* page-flip flags are valid, plus: */
> +/**
> + * DRM_MODE_ATOMIC_TEST_ONLY
> + *
> + * Do not apply the atomic commit, instead check whether the hardware su=
pports
> + * this configuration.
> + *
> + * See &drm_mode_config_funcs.atomic_check for more details on test-only
> + * commits.
> + */
>  #define DRM_MODE_ATOMIC_TEST_ONLY 0x0100
> +/**
> + * DRM_MODE_ATOMIC_NONBLOCK
> + *
> + * Do not block while applying the atomic commit. The &DRM_IOCTL_MODE_AT=
OMIC
> + * IOCTL returns immediately instead of waiting for the changes to be ap=
plied
> + * in hardware. Note, the driver will still check that the update can be
> + * applied before retuning.
> + */
>  #define DRM_MODE_ATOMIC_NONBLOCK  0x0200
> +/**
> + * DRM_MODE_ATOMIC_ALLOW_MODESET
> + *
> + * Allow the update to result in temporary or transient visible artifact=
s while
> + * the update is being applied. Applying the update may also take signif=
icantly
> + * more time than a page flip. All visual artifacts will disappear by th=
e time
> + * the update is completed, as signalled throught the vblank event's tim=
estamp

typo: throught

> + * (see struct drm_event_vblank).
> + *
> + * This flag must be set when the KMS update might cause visible artifac=
ts.
> + * Without this flag such KMS update will return a EINVAL error. What ki=
nd of
> + * update may cause visible artifacts depends on the driver and the hard=
ware.
> + * User-space that needs to know beforehand if an update might cause vis=
ible
> + * artifacts can use &DRM_MODE_ATOMIC_TEST_ONLY without
> + * &DRM_MODE_ATOMIC_ALLOW_MODESET to see if it fails.
> + *
> + * To the best of the driver's knowledge, visual artifacts are guarantee=
d to
> + * not appear when this flag is not set. Some sinks might display visual
> + * artifacts outside of the driver's control.

Ok, so we kept the "visual artifacts" semantics and allow monitors to
do otherwise.

I'm still not sure what this means for things like infoframe data where
changing a certain field (e.g. HDR_OUTPUT_METADATA structure's EOTF
field) has a high risk of causing a visual glitch. I cannot imagine why
a monitor manufacturer would not be able to avoid the glitch if they
wanted to. The glitch might or might not happen, and we cannot know in
advance or afterwards whether it did happen, but it is probable that
many monitors will glitch.

I think "To the best of driver's knowledge" means that if someone
reports a monitor to glitch, the driver/kernel would need to add that
field to the "needs modeset" set. But doing so can regress other
monitors that didn't glitch, so it needs to be a monitor quirk.

This is not something for this patch, but would it be possible to agree
on the kernel development policy here? Should glitches be reported and
added to monitor quirks list? Or should drivers be defensive from the
start and require modeset if the field is known to cause glitches on
some monitors?

> + */
>  #define DRM_MODE_ATOMIC_ALLOW_MODESET 0x0400
> =20
> +/**
> + * DRM_MODE_ATOMIC_FLAGS
> + *
> + * Bitfield of flags accepted by the &DRM_IOCTL_MODE_ATOMIC IOCTL in
> + * &drm_mode_atomic.flags.
> + */
>  #define DRM_MODE_ATOMIC_FLAGS (\
>  		DRM_MODE_PAGE_FLIP_EVENT |\
>  		DRM_MODE_PAGE_FLIP_ASYNC |\


Thanks,
pq

--Sig_/Wdrl98Ar9hg_xA6MJ7qSQFy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmM0HJ8ACgkQI1/ltBGq
qqfgBg/6AlMVuVR0h3wbEbN/NtHU6NzbrbjNoT2m4jYFU2PvK7gBgk49Q6Tm7OyK
fGhdP43KUJOg7fAaYRIifcvqJ0u1qS/ZjbbYgMRCNXBSXSgVqGb19IFkShxsbWsb
7K/2WCnkIcV7dVY+OUNgTot6eg+V7hAoeQ2FoSEcDfxvLk0K0Gw/UYg3pJlWkUkQ
ldmZP9XpMXiIOp39wZSH2Zdf701Q+JrpfKithtR2hYByg0mkhBm13utM+lDD/511
k9x1fJmBd086AJX85xG2po71R6720csD7ebo4XKTShfMv7jq8jJBspqgDyR0BLq3
gb/LCY8Y7UsLHDgkDg6Vy77Nv7b6hmg0DUofMApoW2h5Dnr4eXFgA7mTTFLJ8ywn
fZRikMv3nPZIe2qaoqQQhEbvBHMqIR9EDM8ASpxGpc/tlI9C5vnllt/q6s0cuuVQ
PcA0a+igoJ2jf6j7FXRso7Ffsdjl29Spqv0ctiX6Jlyp2jLsn7KuFGyHDcg+MDtR
S5vM5qpesFnne437creEQauE+1dJCa3zEOwFOPbR+RLOa54seTIW9GUx3s+fslRC
U+0D7D2n3m/nrh5AoBa+hYXOBX1/9JBVDcbSLR1YyiCqQzM3UOmcHmXMAxMeKVg/
G/YEFUKG4W0X5z2moHK8Z+UnZJ/m4YNOfri2LSUeoMFABi9Qo8M=
=vgjp
-----END PGP SIGNATURE-----

--Sig_/Wdrl98Ar9hg_xA6MJ7qSQFy--

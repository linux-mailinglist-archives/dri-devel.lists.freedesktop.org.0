Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6B1745781
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 10:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0009E10E1D1;
	Mon,  3 Jul 2023 08:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B6B10E1D0;
 Mon,  3 Jul 2023 08:38:43 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f86e6e4038so5203507e87.0; 
 Mon, 03 Jul 2023 01:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688373520; x=1690965520;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=YZnnAEvZ9B9g4i8VAMZ/DauApccIpE58ul48uEXHG8U=;
 b=qR3dsSEmmqLOE5u+Ty/gBUk4+yDDWy1cyBw9FjACF/uOuOKtb//ImA0TYyuT9EDnKg
 RPVsazePL7zWYbqrmON9/MIaiUCoRN2U1RUxAlNShMiEi8ttzVoLC9onKcHjZf59rafB
 pEpzAtsaR9yVFh6rEkDfPY6OFulaNmM/d5HBT0JiXUx0ZMBTKDb6NvPASGsx6ssti045
 uA8AnNsf8ZVVaac5UnrDsis4adaLxXtsMczcoXIcAphKiq82vY2+Fh/4NNhpRADjj9o4
 NxzdN/7lG4kFDl3xdYI5OqkliSyNGub4rkJe3IIdFZf3hWelWJCfOEjWunHPSEDQ79Cl
 vZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688373520; x=1690965520;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YZnnAEvZ9B9g4i8VAMZ/DauApccIpE58ul48uEXHG8U=;
 b=J63khJEAoJd4mrr33RoiniSHlAbJjOz07AV9Y6vwXaja1gAxl9DUCl0bTpW/2iSYe0
 0CmzQvc2GjpCGKQDmakZZfY8E32CxcCkSfsnvaqHeugzYfHgEREszC/4wtqWULj28O65
 a+fntOevdqWesw7x7hTzBx18VbBZMsqjcgzvnr/Y5xFvbRqekz4QhlzR2WvkLvrXrr6F
 RUm65qkQX06z3DBNWAQSbIVuq9H1GGSHdjq7pmqgW6aBSrXHm5XU2GQnei/dgKHVhZ06
 TQ64trA7f0YSMmrnfCkQY773W0BMNraSdRYAoIwEZso2YbbNA1FQawZ10VGKDFuLOxZ9
 y/nA==
X-Gm-Message-State: AC+VfDz0QgxLFvcGhlAYF4C8HKiwa1TCRabqLO2RP4dcj0v3hI2W22o3
 pukO+mHi6E1cdhayCM28Oc0=
X-Google-Smtp-Source: ACHHUZ7xaz4IX8Po7Yofy+S268iDYgHHjOWb4q5Up/iGnzvKjYBKNE0N+bG67OTxS+ISwHjP6tLP/g==
X-Received: by 2002:a05:6512:3a85:b0:4f8:5d2d:4941 with SMTP id
 q5-20020a0565123a8500b004f85d2d4941mr5096621lfu.34.1688373519599; 
 Mon, 03 Jul 2023 01:38:39 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 w23-20020ac254b7000000b004fb7359ab83sm3930480lfk.80.2023.07.03.01.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 01:38:39 -0700 (PDT)
Date: Mon, 3 Jul 2023 11:38:36 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v4 6/6] drm/doc: Define KMS atomic state set
Message-ID: <20230703113836.60869599@eldfell>
In-Reply-To: <20230701020917.143394-7-andrealmeid@igalia.com>
References: <20230701020917.143394-1-andrealmeid@igalia.com>
 <20230701020917.143394-7-andrealmeid@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Oa+nzq.=YmEjNu82nsTyqLN";
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
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Italo Nicola <italonicola@collabora.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, hwentlan@amd.com,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Oa+nzq.=YmEjNu82nsTyqLN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Jun 2023 23:09:17 -0300
Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:

> Specify how the atomic state is maintained between userspace and
> kernel, plus the special case for async flips.
>=20
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
> v4: new patch
> ---
>  Documentation/gpu/drm-uapi.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 65fb3036a580..5464376051cc 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -486,3 +486,22 @@ and the CRTC index is its position in this array.
> =20
>  .. kernel-doc:: include/uapi/drm/drm_mode.h
>     :internal:
> +
> +KMS atomic state
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +If a userspace using the DRM atomic API would like to change the modeset=
, it

s/modeset/video mode/

> +needs to do in an atomic way, changing all desired properties in a single
> +commit.

This applies any and all state changes, not only video modes. Plane
configuration is a good example, where video mode does not change.

> Following commits may contain the same properties again, as if they were
> +new. The kernel can then judge if those properties requires modesetting =
and real
> +changes, or it's just the same state as before. In summary, userspace co=
mmits do
> +not need to set the minimal state as possible and can commit redundant
> +information, and the kernel will ignore it.

Maybe the whole paragraph should be more like... ahem, looks I got a
bit carried away in writing this. Please, take what's useful, I'm not
sure if any of this has been actually documented before:


An atomic commit can change multiple KMS properties in an atomic
fashion, without ever applying intermediate or partial state changes.
Either the whole commit succeeds or fails, and it will never be applied
partially. This is the fundamental improvement of the atomic API over
the older non-atomic API which is referred to as the "legacy API".
Applying intermediate state could unexpectedly fail, cause visible
glitches, or delay reaching the final state.

An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY,
which means the complete state change is validated but not applied.
Userspace should use this flag to validate any state change before
asking to apply it. If validation fails for any reason, userspace
should attempt to fall back to another, perhaps simpler, final state.
This allows userspace to probe for various configurations without
causing visible glitches on screen and without the need to undo a
probing change.

The changes recorded in an atomic commit apply on top the current KMS
state in the kernel. Hence, the complete new KMS state is the complete
old KMS state with the committed property settings done on top. The
kernel will automatically avoid no-operation changes, so it is safe and
even expected for userspace to send redundant property settings.
No-operation changes do not count towards actually needed changes, e.g.
setting MODE_ID to a different blob with identical contents as the
current KMS state shall not be a modeset on its own.

A "modeset" is a change in KMS state that might enable, disable, or
temporarily disrupt the emitted video signal, possibly causing visible
glitches on screen. A modeset may also take considerably more time to
complete than other kinds of changes, and the video sink might also
need time to adapt to the new signal properties. Therefore a modeset
must be explicitly allowed with the flag DRM_MODE_ATOMIC_ALLOW_MODESET.
This in combination with DRM_MODE_ATOMIC_TEST_ONLY allows userspace to
determine if a state change is likely to cause visible disruption on
screen and avoid such changes when end users do not expect them.

> +
> +An observation must be made for atomic operations with DRM_MODE_PAGE_FLI=
P_ASYNC.
> +In such scenarios properties values can be sent, but the if they change
> +something, the kernel will reject the flip. This is done because property
> +changes can lead to modesetting, that would defeat the goal of flipping =
as fast
> +as possible. The only exceptions are the framebuffer ID to be flipped to=
 and
> +mode IDs changes, which could be referring to an identical mode, thus not
> +requiring modeset.

That's a bit... roundabout way to describe it. Doesn't async flip want
to prevent all kinds of other-than-FB changes, not only the modesetting
ones? Modesets are already gated by ALLOW_MODESET anyway. How about
something like:

An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYNC is allowed to
effectively change only the FB_ID property on any planes. No-operation
changes are ignored as always. Changing any other property will cause
the commit to be rejected.


If you want to take these and need my Sob, that would be
Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/Oa+nzq.=YmEjNu82nsTyqLN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSiiQwACgkQI1/ltBGq
qqeAdBAAlomzBE3+6szSp9P9LvxA4DqFQfbjFpeQZ8zxHjo/4iofPX1/J0CarwnF
GGGyViZVuTH2zV0EKqYTsn9QeJzcE1EEacyGq9My3HQBtOKYdKFhj3agzko4mGa6
SZ1YggY8KSJbYqJCEkG8InHLLE6bJYFywtzAK9Qx5+Bs5pD9QAIIcYAJHiE8DZkA
bvvhWBfgohfg0tiM0JNlTsRcd7Gu/FEL3ZHeChctGmC/CLrMTIdKgr/aMF4yJ3ot
+XJv5PKd8eblC0vjsmar91pDDRf3WfF+P0lWTkDWSETL2XSBVJZZcf108/iPHqbo
PesDCo1a4UmzfNBhgmnSMq3tluBXvt1s2TYxAdWVDOArgD40ftyHDoO08CWs/7nz
ulm+h5lkIKAzLYCxTm4OVeOleZb2WmyUeN2ptz5EYRX0r7CdR0CF9Ca64Ay9xVqF
qspj5fn/53ORD75NxSImgc+7sbnQjGFOMnKMBfU+2VthzjV1zn5FKvm4yW8dsJr7
MoZYdg4L3U13SQqZY8AaP2+SYhdOiqnTraHzAFahjT7ZBHXdyaYz8/8YdWnNadZx
7XEnvBtwOOy884X/szdFMIMdLi5O8or7vw/0/dx82aU5uUK3BPY+UOLgbuAUgnAd
1xevVT/beB48mMJ1JC4z/SX8XGK2cnHCtjaRu1822W8y0OVbtQ4=
=0f+d
-----END PGP SIGNATURE-----

--Sig_/Oa+nzq.=YmEjNu82nsTyqLN--

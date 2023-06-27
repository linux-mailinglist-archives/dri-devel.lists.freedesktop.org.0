Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7A273F5B4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 09:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B0210E2A0;
	Tue, 27 Jun 2023 07:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801BA10E29E;
 Tue, 27 Jun 2023 07:30:12 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso5636707e87.2; 
 Tue, 27 Jun 2023 00:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687851010; x=1690443010;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=2tGkXgqPnO73+Ge79y8eYh7hyEhs9j1/fEjMENH9dVw=;
 b=l/9PvrGnvCGdt67tEHQovr48fd+oAw102q/o6VU/akdHFNQJ0SGHwZNdJGwxIK3ih0
 D+AuXiZgTdtP8Tfy0Sb6Z+1y9LwUD5V+Gh+w+7SmyubuhNCY9QoVliGmAtGjBu1wT/Ry
 fYw6LxXLMEklFWdQuAcNYHJthLP66xf8Z0m5AoNRqY4JymlxDE5Ztw77JhWUlA6L21Gs
 n7gRzP0RH6b0x6QN1nFxoJjBhFPKTRNuDrtCZTCIm1gtPl02cgkErxECvySBtJSVITup
 W36H4GTB4nqqGMeRl+UGvIXzxYb5JJ4pPs9fEoZQj406Qn+BsCCzoV2pY50eAtxdH46e
 1X4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687851010; x=1690443010;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2tGkXgqPnO73+Ge79y8eYh7hyEhs9j1/fEjMENH9dVw=;
 b=exs3nlcQIPjOLHiHfF7vI1vYnyJH+FYwKjz3+9eWP1cIJEtFJtN/lTwOSrI3T/Oe74
 QTveULupIFqAboW1tDT9FNxWNRvKXN2HZAZul7NVoPl1XbZSM7dNYYSQFFJ/q7YdTG1d
 UudBSDG3xVKlM82BL6qGWr9KILb8hBsaYhwvmznQjXyQL6ZfYfriSz7CFLkwn6JCwVzP
 wAaa0xkmciTJ1S9WWFU4gt540Xg4Ajriji9nEH65xWKr4SEYhz8An2OCFxIAjoaJthgv
 rxXqaWwWPH75LkNDaht2AYrqxr1rW83wTYNJfkbGnfop05N0pQ29p5PcBOUN+gdmT26j
 +9ug==
X-Gm-Message-State: AC+VfDxWCVBwUWirUheA/fJKbHTFsggsdN+ESAngxTQP9rkY/nWXPZ9J
 QsqJrksFLE+c/2DaLdDF7i0=
X-Google-Smtp-Source: ACHHUZ71r5/kDhdT11gZFM7z5vHTCReKWrlCcy770IWoTfq3m+v0hoMkISN2LAe0BwO1tDdKUt6riQ==
X-Received: by 2002:a05:6512:2824:b0:4fb:7888:7e6d with SMTP id
 cf36-20020a056512282400b004fb78887e6dmr3264331lfb.46.1687851009721; 
 Tue, 27 Jun 2023 00:30:09 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 b25-20020ac25e99000000b004fb85ffc82csm107306lfq.10.2023.06.27.00.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 00:30:09 -0700 (PDT)
Date: Tue, 27 Jun 2023 10:29:55 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v4 1/1] drm/doc: Document DRM device reset expectations
Message-ID: <20230627102955.6a2c5796@eldfell>
In-Reply-To: <20230626183347.55118-2-andrealmeid@igalia.com>
References: <20230626183347.55118-1-andrealmeid@igalia.com>
 <20230626183347.55118-2-andrealmeid@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/orsJdneEox0Kbc+g6Dj4_fM";
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
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/orsJdneEox0Kbc+g6Dj4_fM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Jun 2023 15:33:47 -0300
Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:

> Create a section that specifies how to deal with DRM device resets for
> kernel and userspace drivers.
>=20
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 68 ++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)

Hi,

grammar nitpicks notwithstanding, I'm happy with the contents now, so

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 65fb3036a580..25a11b9b98fa 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -285,6 +285,74 @@ for GPU1 and GPU2 from different vendors, and a thir=
d handler for
>  mmapped regular files. Threads cause additional pain with signal
>  handling as well.
> =20
> +Device reset
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The GPU stack is really complex and is prone to errors, from hardware bu=
gs,
> +faulty applications and everything in between the many layers. Some erro=
rs
> +require resetting the device in order to make the device usable again. T=
his
> +section describes what is the expectations for DRM and usermode drivers =
when a
> +device resets and how to propagate the reset status.
> +
> +Kernel Mode Driver
> +------------------
> +
> +The KMD is responsible for checking if the device needs a reset, and to =
perform
> +it as needed. Usually a hang is detected when a job gets stuck executing=
. KMD
> +should keep track of resets, because userspace can query any time about =
the
> +reset stats for an specific context. This is needed to propagate to the =
rest of
> +the stack that a reset has happened. Currently, this is implemented by e=
ach
> +driver separately, with no common DRM interface.
> +
> +User Mode Driver
> +----------------
> +
> +The UMD should check before submitting new commands to the KMD if the de=
vice has
> +been reset, and this can be checked more often if it requires to. After
> +detecting a reset, UMD will then proceed to report it to the application=
 using
> +the appropriated API error code, as explained in the below section about
> +robustness.
> +
> +Robustness
> +----------
> +
> +The only way to try to keep an application working after a reset is if it
> +complies with the robustness aspects of the graphical API that it is usi=
ng.
> +
> +Graphical APIs provide ways to application to deal with device resets. H=
owever,
> +there is no guarantee that the app will be correctly using such features=
, and
> +UMD can implement policies to close the app if it is a repeating offende=
r,
> +likely in a broken loop. This is done to ensure that it does not keeps b=
locking
> +the user interface from being correctly displayed. This should be done e=
ven if
> +the app is correct but happens to trigger some bug in the hardware/drive=
r.
> +
> +OpenGL
> +~~~~~~
> +
> +Apps using OpenGL should use the available robust interfaces, like the
> +extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL ES)=
. This
> +interface tells if a reset has happened, and if so, all the context stat=
e is
> +considered lost and the app proceeds by creating new ones. If is possibl=
e to
> +determine that robustness is not in use, UMD will terminate the app when=
 a reset
> +is detected, giving that the contexts are lost and the app won't be able=
 to
> +figure this out and recreate the contexts.
> +
> +Vulkan
> +~~~~~~
> +
> +Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for submissi=
ons.
> +This error code means, among other things, that a device reset has happe=
ned and
> +it needs to recreate the contexts to keep going.
> +
> +Reporting resets causes
> +-----------------------
> +
> +Apart from propagating the reset through the stack so apps can recover, =
it's
> +really useful for driver developers to learn more about what caused the =
reset in
> +first place. DRM devices should make use of devcoredump to store relevant
> +information about the reset, so this information can be added to user bug
> +reports.
> +
>  .. _drm_driver_ioctl:
> =20
>  IOCTL Support on Device Nodes


--Sig_/orsJdneEox0Kbc+g6Dj4_fM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSaj/MACgkQI1/ltBGq
qqfDXRAAm2d0qCfUurM9gqoskeR0oqeuQx2qnSmrJ0JdOxYVwnhUgFa5jqiWP0Jt
15vwqIgqKkJTBaREdBZ0T3WeRZnm8DFWcol+qAwU1WV4rXzdjfAIwv0L4UjPDbBD
VDA2uAfrMYvoKApiuLCpleMbFnKD79nkWe/FDkrZksGTFmK/u2SDFFMJXAhEoy7s
3PwNvUbHijAeTgSwu68qJ4zMM1uLZI4ff6eWuS6GQKiLk8zCnZN+/6NmKk/pgVlo
Mr+1Br1/ZaHV78LQNZWyuq+njnyC7I2pyx3Qy/1X0Tka8PapG5V2QVZLMnnc4WI3
nSwCOYDMpQ8yGNRoSRZaNd9B88xTweKIpXrvIrJw3sBmfKRNTJcoTuBeiB32x1BO
Wm2f0v24lnc9tb3EYrhruAbmrofCHGUUD6Fd6cgbf938D4DaNrR6uhTJdEj8JDif
CcbnPgzR2pOg3gNOJ3va9QsSdInFwv2wYr4ftVh76O6hzCvuyMdsskxUwophl8x0
Vn0OQDrKfBoRacuHwOLgRlgI4SA/6TZ7SDyfHI+Uljg3tP49VPUji6oFyxljLccp
Qeq2vLtLbBDeY+68lUOXOMieC+D/FZlODi05gjfKLuhdNg4l4+VnDvSQN7Btb7DQ
WSS+I5IHK7yFXV1Y/N4DqWqGjSA9mEEc3CLDC50N4JF62/ri1FI=
=76Wv
-----END PGP SIGNATURE-----

--Sig_/orsJdneEox0Kbc+g6Dj4_fM--

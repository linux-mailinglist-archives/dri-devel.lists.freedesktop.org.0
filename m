Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98DF786DDC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 13:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A415D10E529;
	Thu, 24 Aug 2023 11:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D97410E527;
 Thu, 24 Aug 2023 11:30:45 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-50078eba7afso7523339e87.0; 
 Thu, 24 Aug 2023 04:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692876643; x=1693481443;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ASyf3JC5XyPQVGDixUt3RWgAOAA8jJHFRroqWQwv3RY=;
 b=qpWZxM2Qjloj1a+cMHGM3pQr4DDwiArvbnTdwZyhVNpDspv2WeRdlce6m4AaLzGtvY
 6CaLulniYcF0RtAdGImuUE7nj71aI1BQqSevZFdcR1X8sdoMwiLAoJF8JJJMjpCjPr/H
 Q0g1F9+VJ9woK7K1P6luuzJmMO5e5CrMNkOgcf6mJdIDyi1VTVkzz72wP4e/3ezipNdR
 qo2d1LWOEOB48ZKO8TIZ5xdNGuEKYqEIsCox+oyOh2YuI4J/4n3BIQUPpX7v30NV5kxJ
 rmE97TYM7CNRd8bdwHdqgCk6pGpVsUw4XCM6jAQSH33vPy3kAUQMr/3dEkgoRRyPskFh
 i0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692876643; x=1693481443;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ASyf3JC5XyPQVGDixUt3RWgAOAA8jJHFRroqWQwv3RY=;
 b=Px855LuMu9/Z4BqefRNme4dEUWStuz3Ac/A8zoY2ailfc7gK2VBz/Z80DfbThk0Uqo
 8wBjv9ZDdOw7sfXH5nruoqRg++M0msVtuO+6wfbdm6D+qUnBaoZ1yjObu/oUFxR9j6Za
 IsPWgHp9AGQqcT0FnvXyrbWRn8FIcR52NUzN7lAv3R5zm9DrZ8vD9zuCRR28H2rZ+u8S
 Y1jstRF61LOotUM+K0Rdg+c079G67Ok7qrOvac7jXoj1/UsrMApKMDiySMyzTaXT62Jq
 Qr7tdqeESNRdbG0W7hm2sA2anAliuYsVgIOp8woaALic+IhqnW1lS5b2+6lVeRC+HG8c
 /Jvg==
X-Gm-Message-State: AOJu0YwXlGEqBrTPjdTMlIVdycmeJd+AFwwU7LXnv8NfwTzf/jpXpIK3
 AJwsyIexAXVOZ5COFlliWQc=
X-Google-Smtp-Source: AGHT+IH4D6GfK5xg3N8hhq7h5mDdx+ATwxZUuYfEAtXL/l0B4+m8CCj/sEqnZt/7cbA9Fbt6O63yXw==
X-Received: by 2002:a05:6512:b94:b0:4ff:8c0f:a745 with SMTP id
 b20-20020a0565120b9400b004ff8c0fa745mr12988582lfv.54.1692876642771; 
 Thu, 24 Aug 2023 04:30:42 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 v17-20020ac25611000000b004fe4ab686b4sm3110828lfd.167.2023.08.24.04.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 04:30:42 -0700 (PDT)
Date: Thu, 24 Aug 2023 14:30:32 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v7] drm/doc: Document DRM device reset expectations
Message-ID: <20230824143032.65d7e74a@eldfell>
In-Reply-To: <20230818200642.276735-1-andrealmeid@igalia.com>
References: <20230818200642.276735-1-andrealmeid@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I4PIBoGe6NF2KXplXhCJGSP";
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
 Randy Dunlap <rdunlap@infradead.org>,
 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/I4PIBoGe6NF2KXplXhCJGSP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Aug 2023 17:06:42 -0300
Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:

> Create a section that specifies how to deal with DRM device resets for
> kernel and userspace drivers.
>=20
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
>=20
> ---
>=20
> v7 changes:
>  - s/application/graphical API contex/ in the robustness part (Michel)
>  - Grammar fixes (Randy)
>=20
> v6: https://lore.kernel.org/lkml/20230815185710.159779-1-andrealmeid@igal=
ia.com/
>=20
> v6 changes:
>  - Due to substantial changes in the content, dropped Pekka's Acked-by
>  - Grammar fixes (Randy)
>  - Add paragraph about disabling device resets
>  - Add note about integrating reset tracking in drm/sched
>  - Add note that KMD should return failure for contexts affected by
>    resets and UMD should check for this
>  - Add note about lack of consensus around what to do about non-robust
>    apps
>=20
> v5: https://lore.kernel.org/dri-devel/20230627132323.115440-1-andrealmeid=
@igalia.com/
> ---
>  Documentation/gpu/drm-uapi.rst | 77 ++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

It's a good introduction, even if answers to the most interesting
questions were not found yet.

Does it still answer the questions you had originally that you set out
to document?


Thanks,
pq

> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 65fb3036a580..3694bdb977f5 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -285,6 +285,83 @@ for GPU1 and GPU2 from different vendors, and a thir=
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
> +section describes the expectations for DRM and usermode drivers when a
> +device resets and how to propagate the reset status.
> +
> +Device resets can not be disabled without tainting the kernel, which can=
 lead to
> +hanging the entire kernel through shrinkers/mmu_notifiers. Userspace rol=
e in
> +device resets is to propagate the message to the application and apply a=
ny
> +special policy for blocking guilty applications, if any. Corollary is th=
at
> +debugging a hung GPU context require hardware support to be able to pree=
mpt such
> +a GPU context while it's stopped.
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
> +reset status for a specific context. This is needed to propagate to the =
rest of
> +the stack that a reset has happened. Currently, this is implemented by e=
ach
> +driver separately, with no common DRM interface. Ideally this should be =
properly
> +integrated at DRM scheduler to provide a common ground for all drivers. =
After a
> +reset, KMD should reject new command submissions for affected contexts.
> +
> +User Mode Driver
> +----------------
> +
> +After command submission, UMD should check if the submission was accepte=
d or
> +rejected. After a reset, KMD should reject submissions, and UMD can issu=
e an
> +ioctl to the KMD to check the reset status, and this can be checked more=
 often
> +if the UMD requires it. After detecting a reset, UMD will then proceed t=
o report
> +it to the application using the appropriate API error code, as explained=
 in the
> +section below about robustness.
> +
> +Robustness
> +----------
> +
> +The only way to try to keep a graphical API context working after a rese=
t is if
> +it complies with the robustness aspects of the graphical API that it is =
using.
> +
> +Graphical APIs provide ways to applications to deal with device resets. =
However,
> +there is no guarantee that the app will use such features correctly, and=
 a
> +userspace that doesn't support robust interfaces (like a non-robust
> +OpenGL context or API without any robustness support like libva) leave t=
he
> +robustness handling entirely to the userspace driver. There is no strong
> +community consensus on what the userspace driver should do in that case,
> +since all reasonable approaches have some clear downsides.
> +
> +OpenGL
> +~~~~~~
> +
> +Apps using OpenGL should use the available robust interfaces, like the
> +extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL ES)=
. This
> +interface tells if a reset has happened, and if so, all the context stat=
e is
> +considered lost and the app proceeds by creating new ones. There's no co=
nsensus
> +on what to do to if robustness is not in use.
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
> +Reporting causes of resets
> +--------------------------
> +
> +Apart from propagating the reset through the stack so apps can recover, =
it's
> +really useful for driver developers to learn more about what caused the =
reset in
> +the first place. DRM devices should make use of devcoredump to store rel=
evant
> +information about the reset, so this information can be added to user bug
> +reports.
> +
>  .. _drm_driver_ioctl:
> =20
>  IOCTL Support on Device Nodes


--Sig_/I4PIBoGe6NF2KXplXhCJGSP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTnP1gACgkQI1/ltBGq
qqd+qQ/9Ef0rbYI8EH7+wyhquOWEi9zaZmc/CzTCRL+XDkjUjSiw3mxvV3VIoyny
Uv17w/6y0yX9+Yd0XwgYgeIYRtNTYVGJzPyFKBeOeGLutCj1w5OZcOMrui47O91z
BEksXg2ihmB7LWIaX2nR8XLICKXOIn7rPgh4RuB8rltmX23grJm+tLVvd6VFVwNd
VddO79s7k/ouwgK6gqMJG5ERPc5FTM8mFvwSXnc0UrivcuBNSUdOW2Jk2bRDc8hg
n7WDQSK7jZHVf8swQoKj7YlDY4No7YqPORCNxgsUCWtmHFhINk/mvX5Ws0KSCDa4
rGUqJQSfzYpy4H3QRtbwBiCTwD8NeVZmaj8JLgbEPMWzYUy9zmsPcHJogbt0V+dc
UcWrlkqpbNUGVT3PSd2K9640GNu4noo3SlrIO34AYwN1byStUOTYQSiGI0LSYgBt
aatt00CkGFR2AAp2+nH2Wk8JB1/BiNuPmO9KnyVhx3/6kv5ZqEYz+8Yzr+uo6M+H
yF5FNEnuUh8RN2srWLfbBF4D7MrsRnbXD2BFkqLImTPrfbrMii5kjIulOnpfgMXP
bpMO4hyl7jRoQoLC+Ef0To6Nf4V5SyNniczBuU2rfrN+VJroyXbPZFMWTR6zOnx7
OOgkO3ggWbpbGiile5nb2fy5G1nRoXrG/0o29Vz/Lcnf4OUCh/o=
=jaoU
-----END PGP SIGNATURE-----

--Sig_/I4PIBoGe6NF2KXplXhCJGSP--

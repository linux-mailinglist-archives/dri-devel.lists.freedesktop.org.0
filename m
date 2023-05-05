Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 536BC6F7F4C
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 10:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B23F10E5AB;
	Fri,  5 May 2023 08:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFDB10E5AB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 08:43:27 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ED6816605706;
 Fri,  5 May 2023 09:43:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1683276204;
 bh=YrR4qFr2DYQZl4kYnjBKGXFqEdSI3KRxs2vPERN79gs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eoHdNLRZ9QfKetqNDqvEq0LltDLR3kv5tkOUbHirzufDlFed5o5JWeoFq1TbdjhE3
 gpT5sz7+ZmaSyYPG71W1eaI7mUiyJc3QbntezNQq9nvYK1zkQElIrd7CL71fji7yt0
 DQJZG105ycZZEvm95840jTF2sVtn7HobaZXmwCrGkiZohS5spnRlh5Jsij2x93G8J7
 HDgouFnTScU1o3NdpOtNmxtFEqVPZys7afdYFnIWx9in0MbPZ36kSSpaTDM781K0mY
 2pqNCriXj6oLF3KmuTPyjb1f7icxFLdXkFn5QXPhuvyI1jBI9ygVgH53BjIlmzgovY
 cPJ8wUIVEf+UA==
Date: Fri, 5 May 2023 11:43:20 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH] Documentation/gpu: Requirements for driver-specific KMS
 uAPIs
Message-ID: <20230505114320.1eb77237.pekka.paalanen@collabora.com>
In-Reply-To: <20230504212557.61049-1-harry.wentland@amd.com>
References: <20230504212557.61049-1-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 dri-devel@lists.freedesktop.org, Xaver Hugl <xaver.hugl@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 May 2023 17:25:57 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> We have steered away for a long time now from driver-specific KMS APIs
> for good reasons but never codified our stance. With the proposal of
> new, driver-specific color management uAPIs [1] it is important to
> outline the requirements for the rare times when driver-specific KMS
> uAPIs are desired in order to move complex topics along.
>=20
> [1] https://patchwork.freedesktop.org/series/116862/
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> Cc: Alex Goins <agoins@nvidia.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Aleix Pol <aleixpol@kde.org>
> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> Cc: Victoria Brekenfeld <victoria@system76.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> To: dri-devel@lists.freedesktop.org
> ---
>  Documentation/gpu/drm-uapi.rst | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index ce47b4292481..eaefc3ed980c 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -118,6 +118,38 @@ is already rather painful for the DRM subsystem, wit=
h multiple different uAPIs
>  for the same thing co-existing. If we add a few more complete mistakes i=
nto the
>  mix every year it would be entirely unmanageable.
> =20
> +.. _driver_specific:
> +
> +Driver-Specific DRM/KMS uAPI
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +Driver-specific interfaces are strongly discouraged for DRM/KMS interfac=
es.
> +Kernel-modesetting (KMS) functionality does in principle apply to all dr=
ivers.
> +Driver-specific uAPIs tends to lead to unique implementations in userspa=
ce and
> +are often hard to maintain, especially when different drivers implement =
similar
> +but subtly different uAPIs.
> +
> +At times arriving at a consensus uAPI can be a difficult and lengthy pro=
cess and
> +might benefit from experimentation. This experimentation might warrant
> +introducing driver specific APIs in order to move the eosystem forward. =
If a
> +driver decides to go down this path we ask for the following:

Hi,

should it be "require" instead of "ask"?

> +
> +- An agreement within the community that introducing driver-specific uAP=
Is is
> +  warranted in this case;
> +
> +- The new uAPI is behind a CONFIG option that is clearly marked EXPERIME=
NTAL and
> +  is disabled by default;
> +
> +- The new uAPI is enabled when a module parameter for the driver is set,=
 and
> +  defaults to 'off' otherwise;
> +
> +- The new uAPI follows all open-source userspace requirements outlined a=
bove;
> +
> +- The focus is maintained on development of a vendor-neutral uAPI and pr=
ogress
> +  toward such an uAPI needs to be apparent on public forums. If no such =
progress
> +  is visible within a reasonable timeframe (1-2 years) anybody is within=
 their
> +  right to send, review, and merge patches that remove the driver-specif=
ic uAPI.
> +
>  .. _drm_render_node:
> =20
>  Render nodes

Seems fine to me. I have another addition to suggest:

When such UAPI is introduced, require that it comes with an expiration
date. This date should be unmissable, not just documented. The kernel
module parameter name to enable the UAPI could contain the expiry date,
for example.

After all, the most important thing to get through to users is that
this *will* go away and not just theoretically.

If that date needs to be moved forward, it should be possible to do so
with a simple patch gathering enough acks. The main thing is to set the
date from the start, so there can be no confusion about when its going
to the chopping block.

I do not suggest that the kernel would automatically runtime disable
the UAPI after that date.

Does any of the big idea fly with upper maintainers and Linus?


Thanks,
pq

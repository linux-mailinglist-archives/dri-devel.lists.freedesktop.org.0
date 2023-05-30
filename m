Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA967715697
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D811F10E351;
	Tue, 30 May 2023 07:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4C810E351;
 Tue, 30 May 2023 07:22:45 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2af2c35fb85so41813921fa.3; 
 Tue, 30 May 2023 00:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685431363; x=1688023363;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=godemfyF69UVDL/szblPSm2+LaDgq+lIR0e2xtsOrIs=;
 b=SQi5aCvogeT6vaJmjexm9h18SAt4DQCs/UkF87t7OjppfF8w1MKXG+x4l42l4qzZeP
 hHZrqdxdIUgExiX02AH65PyVmLq+LmYwBtVYbm5TIDGAO+gAgw2AQqX4w5Fm8I7741l+
 NoOFxoqlA2ijnSkdnThM99E2V2s30PylA4rU+gLzrrHKiUsCWsc7GAeTfJgXUDznbX33
 IcyicGb13xKf72BVT6KnrdOOTRye47VeX805+Lkrr6AYmDrOCpWyqYokTER2K5FR7aGT
 e0ZJbQKNB5nngrmPessNPVkwzPfzyy8T+bWOHb4Q33NGVU42v8WjWkglRIJ2LX08FUjZ
 Eobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685431363; x=1688023363;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=godemfyF69UVDL/szblPSm2+LaDgq+lIR0e2xtsOrIs=;
 b=G41OIRFH1CztX+levzAIfuzkaFHR6lIQvfRNF/3keSjQmwxjJQVN0nJc4WV48wRBxj
 gpqOkCy+Qp6yQ7hYTNWJWZDsQqjSeg4vtmQ51gU9+vcfZquReY1OVgw/ShP73nCsu18v
 haosIKf5zSudbIoqW7PRsPwt2EBth2zG1HUYN6PqKg9uX+ODDKIe0nI7sgxfN9TKdIAg
 FAaDivJAIUdI0sSA5697hGenW5MuKiZERmB633PJjWcJB21/laPJ8KM+30pQz2FikZmr
 dsa1aRAO4zMEoKxVfvS69t2LW9Xiz4n2MvMkfQl2FW+70GmOhVOFcN9xA0H7O508KDf9
 369g==
X-Gm-Message-State: AC+VfDx18JbSL4eQb42EY0N/zokF8zpo7oG9932neVN/qwf3VP299SM2
 CTt43WcGEfjDWXl3MnClrFc=
X-Google-Smtp-Source: ACHHUZ6KZJwt9+UF3AtZIrxg/KE2wbAmeAvu5tY+YlByAAzs9l45B72fjZJlY7P+A/UozbXrv7cIeg==
X-Received: by 2002:a2e:9d43:0:b0:2af:187b:3c88 with SMTP id
 y3-20020a2e9d43000000b002af187b3c88mr355818ljj.43.1685431362600; 
 Tue, 30 May 2023 00:22:42 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 t16-20020a2e9d10000000b002adbf24212esm2727569lji.49.2023.05.30.00.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 00:22:42 -0700 (PDT)
Date: Tue, 30 May 2023 10:22:32 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 00/36] drm/amd/display: add AMD driver-specific
 properties for color mgmt
Message-ID: <20230530102232.63bf7259@eldfell>
In-Reply-To: <7e385b28-f418-52b2-71ea-52347ec6a819@linaro.org>
References: <20230523221520.3115570-1-mwen@igalia.com>
 <7e385b28-f418-52b2-71ea-52347ec6a819@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iP+02GjmHzqt2bdxK_W_Dpr";
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
Cc: liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, tzimmermann@suse.de, sunpeng.li@amd.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 sungjoon.kim@amd.com, Xinhui.Pan@amd.com, Xaver Hugl <xaver.hugl@gmail.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, kernel-dev@igalia.com,
 Alex Deucher <alexander.deucher@amd.com>,
 freedreno <freedreno@lists.freedesktop.org>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/iP+02GjmHzqt2bdxK_W_Dpr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 30 May 2023 01:55:21 +0300
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On 24/05/2023 01:14, Melissa Wen wrote:
> > This series is a refined version of our RFC [1] for AMD driver-specific
> > color management properties. It is a collection of contributions from
> > Joshua, Harry and I to enhance AMD KMS color pipeline for Steam
> > Deck/SteamOS by exposing the large set of color caps available in AMD
> > display HW.
> >=20
> > Considering RFC feedback, this patchset differs from the previous one by
> > removing the KConfig option and just guarding driver-specific properties
> > with `AMD_PRIVATE_COLOR` - but we also removed the guards from internal
> > elements and operations. We stopped to advertise CRTC shaper and 3D LUTs
> > properties since they aren't in use in the Steam Deck color pipeline[2].
> > On the other hand, we keep mapping CRTC shaper and 3D LUTs (DM) to DC
> > MPC setup. We also improved curve calculations to take into account HW
> > color caps.
> >=20
> > In short, for pre-blending, we added the following properties:
> > - plane degamma LUT and predefined transfer function;
> > - plane HDR multiplier
> > - plane shaper LUT/transfer function;
> > - plane 3D LUT; and finally,
> > - plane blend LUT/transfer function, just before blending. =20
>=20
> This set of properties sounds interesting and not fully AMD-specific.=20
> Could you please consider moving them to the more generic location?

No, please see the following thread for plans for more generic UAPI:

https://lists.freedesktop.org/archives/dri-devel/2023-May/403173.html

AMD just needs something right now, so they try their own stuff first
without exposing it to userspace.


Thanks,
pq

> For the reference, MSM (Qualcomm) display hardware supports=20
> degamma/gamma LUTs for planes too. One of the suggested usecases for=20
> these degamma/gamma units is to support colorspace transfer functions.
>=20
> Thus, at least some of these properties can be implemented in drm/msm=20
> driver too.
>=20
> > After blending, we already have DRM CRTC degamma/gamma LUTs and CTM,
> > therefore, we extend post-blending color pipeline with CRTC gamma
> > transfer function.
> >=20
> > The first three patches are on DRM KMS side. We expose DRM property
> > helper for blob lookup and replacement so that we can use it for
> > managing driver-specific properties. We add a tracked for plane color
> > mgmt changes and increase the maximum number of properties to
> > accommodate this expansion.
> >=20
> > The userspace case here is Gamescope which is the compositor for
> > SteamOS. It's already using all of this functionality to implement its
> > color management pipeline right now [3].
> >=20
> > Current IGT tests kms_color and amdgpu/amd_color on DCN301 and DCN21 HW
> > preserve the same results with and without the guard.
> >=20
> > Finally, I may have missed something, please let me know if that's the
> > case.
> >=20
> > Best Regards,
> >=20
> > Melissa Wen
> >=20
> > [1] https://lore.kernel.org/dri-devel/20230423141051.702990-1-mwen@igal=
ia.com
> > [2] https://github.com/ValveSoftware/gamescope/blob/master/src/docs/Ste=
am%20Deck%20Display%20Pipeline.png
> > [3] https://github.com/ValveSoftware/gamescope
> >=20
> >=20
> > Harry Wentland (2):
> >    drm/amd/display: fix segment distribution for linear LUTs
> >    drm/amd/display: fix the delta clamping for shaper LUT
> >=20
> > Joshua Ashton (13):
> >    drm/amd/display: add plane degamma TF driver-specific property
> >    drm/amd/display: add plane HDR multiplier driver-specific property
> >    drm/amd/display: add plane blend LUT and TF driver-specific properti=
es
> >    drm/amd/display: copy 3D LUT settings from crtc state to stream_upda=
te
> >    drm/amd/display: dynamically acquire 3DLUT resources for color chang=
es
> >    drm/amd/display: add CRTC regamma TF support
> >    drm/amd/display: set sdr_ref_white_level to 80 for out_transfer_func
> >    drm/amd/display: add support for plane degamma TF and LUT properties
> >    drm/amd/display: add dc_fixpt_from_s3132 helper
> >    drm/adm/display: add HDR multiplier support
> >    drm/amd/display: handle empty LUTs in __set_input_tf
> >    drm/amd/display: add DRM plane blend LUT and TF support
> >    drm/amd/display: allow newer DC hardware to use degamma ROM for PQ/H=
LG
> >=20
> > Melissa Wen (21):
> >    drm/drm_mode_object: increase max objects to accommodate new color
> >      props
> >    drm/drm_property: make replace_property_blob_from_id a DRM helper
> >    drm/drm_plane: track color mgmt changes per plane
> >    drm/amd/display: add CRTC driver-specific property for gamma TF
> >    drm/amd/display: add plane driver-specific properties for degamma LUT
> >    drm/amd/display: add plane 3D LUT driver-specific properties
> >    drm/amd/display: add plane shaper LUT driver-specific properties
> >    drm/amd/display: add plane shaper TF driver-private property
> >    drm/amd/display: add comments to describe DM crtc color mgmt behavior
> >    drm/amd/display: encapsulate atomic regamma operation
> >    drm/amd/display: update lut3d and shaper lut to stream
> >    drm/amd/display: allow BYPASS 3D LUT but keep shaper LUT settings
> >    drm/amd/display: handle MPC 3D LUT resources for a given context
> >    drm/amd/display: add CRTC 3D LUT support
> >    drm/amd/display: add CRTC shaper LUT support
> >    drm/amd/display: add CRTC shaper TF support
> >    drm/amd/display: mark plane as needing reset if plane color mgmt
> >      changes
> >    drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
> >    drm/amd/display: reject atomic commit if setting both plane and CRTC
> >      degamma
> >    drm/amd/display: program DPP shaper and 3D LUT if updated
> >    drm/amd/display: add plane shaper/3D LUT and shaper TF support
> >=20
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 125 ++++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  69 ++
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  28 +-
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 110 +++-
> >   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 612 ++++++++++++++++--
> >   .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  72 ++-
> >   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 213 +++++-
> >   drivers/gpu/drm/amd/display/dc/core/dc.c      |  49 +-
> >   drivers/gpu/drm/amd/display/dc/dc.h           |   8 +
> >   .../amd/display/dc/dcn10/dcn10_cm_common.c    | 107 ++-
> >   .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |   5 +-
> >   .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |   9 +-
> >   .../amd/display/dc/dcn301/dcn301_resource.c   |  26 +-
> >   .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
> >   drivers/gpu/drm/arm/malidp_crtc.c             |   2 +-
> >   drivers/gpu/drm/drm_atomic.c                  |   1 +
> >   drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
> >   drivers/gpu/drm/drm_atomic_uapi.c             |  43 +-
> >   drivers/gpu/drm/drm_property.c                |  49 ++
> >   include/drm/drm_mode_object.h                 |   2 +-
> >   include/drm/drm_plane.h                       |   7 +
> >   include/drm/drm_property.h                    |   6 +
> >   22 files changed, 1416 insertions(+), 140 deletions(-)
> >  =20
>=20


--Sig_/iP+02GjmHzqt2bdxK_W_Dpr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmR1pDgACgkQI1/ltBGq
qqffVBAAnWFd7q3um8t/G7QIO9cCSWXsHUTuWTJET7tZEgJY69xWP8rI2x1Jhjbx
OwdEhiBqKc8CVhAHz3/FG/1k2ffaQaiGmNIfxRc0ZYTb2PJRc62hN95ocCEvqK0L
WZrmWhMMEeD9jcliWb0h43zA7Pf92wWU1gjhcyjUSmyPoUt+dqkjF1hSGLvea+2C
49uXQqO5TNmyEOE5ByBYuWBgIxQY5qITMwV2D+R4wVZ6wUkICNrjl+M7AvKXe/rU
rnVE/Lx5HJEj0jde+WpRF0xdyrqZcC636MVOkT/nK5lNaQNr0tm2tGWfar6pjkM2
07Sxw5iKYVFyOXC9Hn77ZbPOrw6W4RS4OnvnVD6yfm2bBrY/nPkt8LWQqs8T6PVA
6YPzMKelRnxOyFa3Fy2mGLWXNJUd76YnUpePY6nCCnfin7UcdFYvR2EITPcIyqAQ
j1gZb5dr4s4KOB03RYzzzFNjx/VjVc6Ni6Kdziiuf+SrEygbGPQxunLEkk1Z/MNh
qfHllQtfFIZXghS2dA8JuLbDKpMrPri4dK1psNmulAj7dAWBc0GA818M6anQ5ZPa
qg7rREoOe6L2qCnJuQIlduy0CKntw6OBZhXAHzecOAbs9BfEUAFlzv6EO5IhfTU6
L41Qnz0WDq+TPDOW4A5wSp5TG0i9bN26M0zWkCZGnDoQxXz4MTc=
=ViTp
-----END PGP SIGNATURE-----

--Sig_/iP+02GjmHzqt2bdxK_W_Dpr--

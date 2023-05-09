Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B76FCF9B
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 22:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC9D10E3CE;
	Tue,  9 May 2023 20:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9700E10E3CE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 20:35:45 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50c8d87c775so8263024a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 May 2023 13:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=froggi.es; s=google; t=1683664543; x=1686256543;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CFfrBbjzveV/cBxnUtQTwzuCz8zfeuU2uWdukPGw3Is=;
 b=jIYBQGMgFny7p3ungWiWv+xPBl57NAvyzUPp2H7NLs3TDYl70SKBjkhEQkk3xkopyO
 pF8iWh+eZZguENizEUUVKYiXNGbo/HxypkfEISe95lPPYabeCa6bA4ZOuxEJ93r4ss1e
 +umekLDgYFRTIMO6lfg149vTknUGZL1fWxwFlRcblqoIjIQkGQFp3YDOpMtgnPVf54C0
 1U60pTHiaRVTsEwN6YGrPXVyYGw8PxstCB0u587wmZDq9ji3cf1gASCOhy/qwZfFrUQF
 JsVDhlOBgP0sVMELfXebXlsNOSAo4vL2bX3fvEc9avEZONzUUQ7qhT4lip4ABeMwnOqS
 NI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683664543; x=1686256543;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CFfrBbjzveV/cBxnUtQTwzuCz8zfeuU2uWdukPGw3Is=;
 b=OHgWm5yANN2ZAt9Ugeg38pELk/PkZUsrqkIJZpVcOSrN3oJ7rBxt4rFF5jInsUjr1F
 W+bevRHndWa9TXhyl+BoCAz+QzdZbGlCQgEbvEdb66gEXwYrGpwyBBTgSn7f6uDtaTG9
 NGp5EMy6otIf1mA945nuF79mI7mTABsLeIXi4D2QttSitb/pQbv1PwkQkJugx9ztTl8p
 buoS2bGLp4aZXdwpqguONBdNIFquOmylIsm9MJDtF7WoakrGVHokv+f8BrsjeFeBcnCO
 gt9CR46wMoegcNDGZfnX0PyBn3moMt5th8SKHF6AxceBaRTKCPECT3mDeTEpl0EYPVCT
 ZQWg==
X-Gm-Message-State: AC+VfDx2MkFtUgNGgOu9aM5UuRlP+5d6FCu/6UWhP6Vszt+4M6VCDP0i
 G84dhU29NsiWdZV8hEKiH0F/nCaW5FnMyJ8giVgEOw==
X-Google-Smtp-Source: ACHHUZ5ssNFjjC91vl7fil11M8Y5BDUhoaCdAiVNKZQpngVt33eZ6X9YZi3Ipa+RwcM2OJVdNZVBJ42tP1DYUz6gVB0=
X-Received: by 2002:a05:6402:1a48:b0:50b:c3bf:c9ef with SMTP id
 bf8-20020a0564021a4800b0050bc3bfc9efmr13304021edb.40.1683664543662; Tue, 09
 May 2023 13:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230423141051.702990-1-mwen@igalia.com>
 <20230423141051.702990-13-mwen@igalia.com>
 <5bbd49b6-ad09-607f-521d-96f9d8eb3b20@amd.com>
 <20230509163701.57lf22phumicqv37@mail.igalia.com>
 <CAEZNXZAfq_6EZHBhBXjMPwOuU10rwKe3SPJpz1hetux=HRF4CQ@mail.gmail.com>
 <fc308aca-4ecf-7db9-3491-9ede18ee5562@amd.com>
In-Reply-To: <fc308aca-4ecf-7db9-3491-9ede18ee5562@amd.com>
From: Joshua Ashton <joshua@froggi.es>
Date: Tue, 9 May 2023 20:35:32 +0000
Message-ID: <CAEZNXZAFjn2zOEr33qZvEC5h-P4OowJ7sB8MVhBHAzntXBDgjw@mail.gmail.com>
Subject: Re: [RFC PATCH 12/40] drm/amd/display: add plane HDR multiplier
 driver-private property
To: Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FWIW, we technically do use it right now, but it is always set to 1 in S.31.32.

Before we used shaper + 3D LUT we did use it for scaling SDR content,
but given we always have a shaper + 3D LUT it made sense for us to
roll that into there.

On Tue, 9 May 2023 at 20:00, Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 5/9/23 12:54, Joshua Ashton wrote:
> > We currently do not have a use for this as we settled on per-plane 3D
> > LUT + Shaper, but we might end up wanting to use in our scRGB stack
> > someday so I would like to keep it.
> >
>
> uAPI should always have a userspace that uses it. But if we go
> and put it behind an #ifdef anyways I don't mind taking this
> if we foresee use for it in the near future. A gamescope experiment
> showing how this can be used to scale sRGB planes would be great.
> I assume that's sort of how you intend to use it.
>
> Harry
>
> > On Tue, 9 May 2023 at 16:37, Melissa Wen <mwen@igalia.com> wrote:
> >>
> >> On 05/08, Harry Wentland wrote:
> >>>
> >>>
> >>> On 4/23/23 10:10, Melissa Wen wrote:
> >>>> From: Joshua Ashton <joshua@froggi.es>
> >>>>
> >>>> Multiplier to 'gain' the plane. When PQ is decoded using the fixed func
> >>>> transfer function to the internal FP16 fb, 1.0 -> 80 nits (on AMD at
> >>>> least) When sRGB is decoded, 1.0 -> 1.0.  Therefore, 1.0 multiplier = 80
> >>>> nits for SDR content. So if you want, 203 nits for SDR content, pass in
> >>>> (203.0 / 80.0).
> >>>>
> >>>
> >>> Is gamescope intending to use this?
> >>
> >> I don't think so. Again, I'll double check and drop it accordingly.
> >>
> >> Melissa
> >>
> >>>
> >>> Harry
> >>>
> >>>> Co-developed-by: Melissa Wen <mwen@igalia.com>
> >>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
> >>>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> >>>> ---
> >>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 +++++
> >>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  4 +++
> >>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 12 +++++++++
> >>>>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 25 ++++++++++++++-----
> >>>>  4 files changed, 41 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> >>>> index 24595906dab1..dd658f162f6f 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> >>>> @@ -1326,6 +1326,12 @@ amdgpu_display_create_color_properties(struct amdgpu_device *adev)
> >>>>             return -ENOMEM;
> >>>>     adev->mode_info.plane_degamma_tf_property = prop;
> >>>>
> >>>> +   prop = drm_property_create_range(adev_to_drm(adev),
> >>>> +                                    0, "AMD_PLANE_HDR_MULT", 0, UINT_MAX);
> >>>> +   if (!prop)
> >>>> +           return -ENOMEM;
> >>>> +   adev->mode_info.plane_hdr_mult_property = prop;
> >>>> +
> >>>>     return 0;
> >>>>  }
> >>>>  #endif
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> >>>> index ab9ce6f26c90..65a9d62ffbe4 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> >>>> @@ -387,6 +387,10 @@ struct amdgpu_mode_info {
> >>>>      * linearize content with or without LUT.
> >>>>      */
> >>>>     struct drm_property *plane_degamma_tf_property;
> >>>> +   /**
> >>>> +    * @plane_hdr_mult_property:
> >>>> +    */
> >>>> +   struct drm_property *plane_hdr_mult_property;
> >>>>  #endif
> >>>>  };
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> >>>> index 005632c1c9ec..bb7307b9cfd5 100644
> >>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> >>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> >>>> @@ -51,6 +51,7 @@
> >>>>
> >>>>  #define AMDGPU_DMUB_NOTIFICATION_MAX 5
> >>>>
> >>>> +#define AMDGPU_HDR_MULT_DEFAULT (0x100000000LL)
> >>>>  /*
> >>>>  #include "include/amdgpu_dal_power_if.h"
> >>>>  #include "amdgpu_dm_irq.h"
> >>>> @@ -736,6 +737,17 @@ struct dm_plane_state {
> >>>>      * linearize.
> >>>>      */
> >>>>     enum drm_transfer_function degamma_tf;
> >>>> +   /**
> >>>> +    * @hdr_mult:
> >>>> +    *
> >>>> +    * Multiplier to 'gain' the plane.  When PQ is decoded using the fixed
> >>>> +    * func transfer function to the internal FP16 fb, 1.0 -> 80 nits (on
> >>>> +    * AMD at least). When sRGB is decoded, 1.0 -> 1.0, obviously.
> >>>> +    * Therefore, 1.0 multiplier = 80 nits for SDR content.  So if you
> >>>> +    * want, 203 nits for SDR content, pass in (203.0 / 80.0).  Format is
> >>>> +    * S31.32 sign-magnitude.
> >>>> +    */
> >>>> +   __u64 hdr_mult;
> >>>>  #endif
> >>>>  };
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> >>>> index 5b458cc0781c..57169dae8b3d 100644
> >>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> >>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> >>>> @@ -1321,8 +1321,10 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
> >>>>             __drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
> >>>>
> >>>>  #ifdef CONFIG_STEAM_DECK
> >>>> -   if (amdgpu_state)
> >>>> +   if (amdgpu_state) {
> >>>>             amdgpu_state->degamma_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
> >>>> +           amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
> >>>> +   }
> >>>>  #endif
> >>>>  }
> >>>>
> >>>> @@ -1424,11 +1426,11 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
> >>>>  #ifdef CONFIG_STEAM_DECK
> >>>>  int
> >>>>  amdgpu_dm_replace_property_blob_from_id(struct drm_device *dev,
> >>>> -                                          struct drm_property_blob **blob,
> >>>> -                                          uint64_t blob_id,
> >>>> -                                          ssize_t expected_size,
> >>>> -                                          ssize_t expected_elem_size,
> >>>> -                                          bool *replaced)
> >>>> +                                   struct drm_property_blob **blob,
> >>>> +                                   uint64_t blob_id,
> >>>> +                                   ssize_t expected_size,
> >>>> +                                   ssize_t expected_elem_size,
> >>>> +                                   bool *replaced)
> >>>>  {
> >>>>     struct drm_property_blob *new_blob = NULL;
> >>>>
> >>>> @@ -1482,6 +1484,10 @@ dm_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
> >>>>                                        dm->adev->mode_info.plane_degamma_tf_property,
> >>>>                                        DRM_TRANSFER_FUNCTION_DEFAULT);
> >>>>     }
> >>>> +   /* HDR MULT is always available */
> >>>> +   drm_object_attach_property(&plane->base,
> >>>> +                              dm->adev->mode_info.plane_hdr_mult_property,
> >>>> +                              AMDGPU_HDR_MULT_DEFAULT);
> >>>>  }
> >>>>
> >>>>  static int
> >>>> @@ -1507,6 +1513,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
> >>>>                     dm_plane_state->degamma_tf = val;
> >>>>                     dm_plane_state->base.color_mgmt_changed = 1;
> >>>>             }
> >>>> +   } else if (property == adev->mode_info.plane_hdr_mult_property) {
> >>>> +           if (dm_plane_state->hdr_mult != val) {
> >>>> +                   dm_plane_state->hdr_mult = val;
> >>>> +                   dm_plane_state->base.color_mgmt_changed = 1;
> >>>> +           }
> >>>>     } else {
> >>>>             drm_dbg_atomic(plane->dev,
> >>>>                            "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> >>>> @@ -1533,6 +1544,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
> >>>>                     dm_plane_state->degamma_lut->base.id : 0;
> >>>>     } else if (property == adev->mode_info.plane_degamma_tf_property) {
> >>>>             *val = dm_plane_state->degamma_tf;
> >>>> +   } else if (property == adev->mode_info.plane_hdr_mult_property) {
> >>>> +           *val = dm_plane_state->hdr_mult;
> >>>>     } else {
> >>>>             return -EINVAL;
> >>>>     }
> >>>
> >>>
>

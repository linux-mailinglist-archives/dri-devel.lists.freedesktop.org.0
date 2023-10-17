Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE627CBC30
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 09:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD28D10E278;
	Tue, 17 Oct 2023 07:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E87B10E278
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 07:25:27 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5a82c2eb50cso45668277b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 00:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697527526; x=1698132326; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MlhxWtNcEtPdlgFrUV2Qe5Hlpzoe4VwBmwyo3n0xQ7Y=;
 b=weHx4W7STAFwN21ZPNcXtIfeCrt3zKIBZw3/j3tj6rjHO7UJSbqXn/iMlseloxkxEO
 oSxwKW6Q1Fac8i6AhCG58dltn8hf/uaqRghZeqYKQCJM2JnY+ENb5a6xXtHi+0npaLJ7
 E4QTb7qP/zpaQ/bhORH9T4ND0EFtRkjSG8vEPL+Qv2zZ5q6a+BdVUUOn/XxhWI4BexZX
 cLj+SaNuAGIziqGcAb0mWeMToJOJvp3nYn6rcjkSLSKk6vFWGWe0NLUgZICD3f11knvR
 HgNutw8neaQuYw8FGDKX2sUgClemBjjNNtflqkl9nyxOJig73iFNayv4qbc06fQajqaH
 ADCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697527526; x=1698132326;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MlhxWtNcEtPdlgFrUV2Qe5Hlpzoe4VwBmwyo3n0xQ7Y=;
 b=VJ5xbkDQnSALMXy/vROeih2QmJvW0mkMrx0H5j2HD76Kw8WjphPN4Dm5MQBsPqe9P6
 fvJ0ybqkNwRy84jZuShymd2mqSHCXUllLH5ZB4DDJOFLmCnPnw7o3RqVE/rYyhldvJzz
 o6FHDZeUuF8n8SqoGHkw+4ZYkaUkNtO9oc/+E/a/BtxmKsyPXl/2ys4nthomWx3AjD6N
 yzNP/OErDbszR+AD/rOZfoHUOW0MP0/BaTEIyFLQh2Td9p2TkEt4SFvHes2AwvI499OH
 K8hOoOq+EvCAfsurftddgpm0Sf2Qx0ShAJSU5iJgbjpkRZ5N0Ef2s9vdUx+P5Mx2yuLf
 p2pA==
X-Gm-Message-State: AOJu0YzG6/sWgzh9qEzXngShRm7B3YRSm2y1RARf6e992sZA8pg4u6Td
 r5P0Jvkpgug/Gw3YAdpC1GK+1WzANYyXx4XSl2wvtg==
X-Google-Smtp-Source: AGHT+IENnjJOV5JRk8GZZ8lld1NThYpPL3nSEbH7tZD0rqOcShuOqE0pwsLzTmY5xzyWjOahVXDxQJiH030g1Mf79EA=
X-Received: by 2002:a81:490b:0:b0:5a8:3f2:b538 with SMTP id
 w11-20020a81490b000000b005a803f2b538mr1472895ywa.37.1697527526514; Tue, 17
 Oct 2023 00:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-7-a820efcce852@quicinc.com>
 <20230829112230.7106a8bf@eldfell>
 <752176d8-23f4-4689-8bf4-db27f153fd39@quicinc.com>
 <6851b864-447f-453f-8b34-1fbb6e97eefe@linaro.org>
 <26585954-7c86-45fd-9190-f1109cbe9901@quicinc.com>
In-Reply-To: <26585954-7c86-45fd-9190-f1109cbe9901@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Oct 2023 10:25:14 +0300
Message-ID: <CAA8EJpoo4PSAzpjLcfdA0brNFZbTuCnv_HdztQ9Pnc_EnXgEmg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH RFC v6 07/10] drm/atomic: Loosen FB atomic
 checks
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, sebastian.wick@redhat.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jessica,

On Tue, 17 Oct 2023 at 03:41, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> On 9/24/2023 3:23 AM, Dmitry Baryshkov wrote:
> > On 22/09/2023 20:49, Jessica Zhang wrote:
> >>
> >>
> >> On 8/29/2023 1:22 AM, Pekka Paalanen wrote:
> >>> On Mon, 28 Aug 2023 17:05:13 -0700
> >>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >>>
> >>>> Loosen the requirements for atomic and legacy commit so that, in cases
> >>>> where pixel_source != FB, the commit can still go through.
> >>>>
> >>>> This includes adding framebuffer NULL checks in other areas to
> >>>> account for
> >>>> FB being NULL when non-FB pixel sources are enabled.
> >>>>
> >>>> To disable a plane, the pixel_source must be NONE or the FB must be
> >>>> NULL
> >>>> if pixel_source == FB.
> >>>>
> >>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>> ---
> >>>>   drivers/gpu/drm/drm_atomic.c        | 20 +++++++++++---------
> >>>>   drivers/gpu/drm/drm_atomic_helper.c | 36
> >>>> ++++++++++++++++++++----------------
> >>>>   include/drm/drm_atomic_helper.h     |  4 ++--
> >>>>   include/drm/drm_plane.h             | 29
> >>>> +++++++++++++++++++++++++++++
> >>>>   4 files changed, 62 insertions(+), 27 deletions(-)
> >>>
> >>> ...
> >>>
> >>>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> >>>> index a58f84b6bd5e..4c5b7bcdb25c 100644
> >>>> --- a/include/drm/drm_plane.h
> >>>> +++ b/include/drm/drm_plane.h
> >>>> @@ -992,6 +992,35 @@ static inline struct drm_plane
> >>>> *drm_plane_find(struct drm_device *dev,
> >>>>   #define drm_for_each_plane(plane, dev) \
> >>>>       list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
> >>>> +/**
> >>>> + * drm_plane_solid_fill_enabled - Check if solid fill is enabled on
> >>>> plane
> >>>> + * @state: plane state
> >>>> + *
> >>>> + * Returns:
> >>>> + * Whether the plane has been assigned a solid_fill_blob
> >>>> + */
> >>>> +static inline bool drm_plane_solid_fill_enabled(struct
> >>>> drm_plane_state *state)
> >>>> +{
> >>>> +    if (!state)
> >>>> +        return false;
> >>>> +    return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_SOLID_FILL
> >>>> && state->solid_fill_blob;
> >>>> +}
> >>>> +
> >>>> +static inline bool drm_plane_has_visible_data(const struct
> >>>> drm_plane_state *state)
> >>>> +{
> >>>> +    switch (state->pixel_source) {
> >>>> +    case DRM_PLANE_PIXEL_SOURCE_NONE:
> >>>> +        return false;
> >>>> +    case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
> >>>> +        return state->solid_fill_blob != NULL;
> >>>
> >>> This reminds me, new UAPI docs did not say what the requirements are for
> >>> choosing solid fill pixel source. Is the atomic commit rejected if
> >>> pixel source is solid fill, but solid_fill property has no blob?
> >>
> >> Hi Pekka,
> >>
> >> Yes, if pixel_source is solid_fill and the solid_fill property blob
> >> isn't set, the atomic commit should throw an error.
> >>
> >> Will document this in the UAPI.
> >
> > I don't see a corresponding error check in atomic_check() functions.
> > Could you please check that there is one, as you are updating the uAPI.
>
> Hi Dmitry,
>
> Sorry for the late response.

No worries.

>
> drm_plane_has_visible_data() is being called from
> drm_atomic_plane_check() which is called from drm_atomic_commit() (via
> drm_atomic_check_only()).
>
> It's also called within the atomic_check() callstack in
> drm_atomic_helper_check_plane_state(), though that check will set
> plane.visible to false and return 0.
>
> Would it be better to have a more explicit `if (source == solid_fill &&
> !plane->solid_fill_blob) then return -EINVAL` check in atomic_check()?

No. Your current code is good already. It was me who missed the
visible data check.
If you are going to send the next version for some reason, it might be
good to add a small comment to drm_atomic_helper_check_plane_state().
Something like 'check that the selected pixel source (fb, solid fill,
etc.) is valid'.

>
> Thanks,
>
> Jessica Zhang
>
> >
> >>
> >> Thanks,
> >>
> >> Jessica Zhang
> >>
> >>>
> >>> This should be doc'd.
> >>>
> >>>
> >>> Thanks,
> >>> pq
> >>>
> >>>> +    case DRM_PLANE_PIXEL_SOURCE_FB:
> >>>> +    default:
> >>>> +        WARN_ON(state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB);
> >>>> +    }
> >>>> +
> >>>> +    return state->fb != NULL;
> >>>> +}
> >>>> +
> >>>>   bool drm_any_plane_has_format(struct drm_device *dev,
> >>>>                     u32 format, u64 modifier);
> >>>>
> >>>
> >
> > --
> > With best wishes
> > Dmitry
> >



-- 
With best wishes
Dmitry

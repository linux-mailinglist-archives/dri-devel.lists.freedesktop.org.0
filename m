Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EE374FB95
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 01:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D3310E458;
	Tue, 11 Jul 2023 23:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859F910E458
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 23:00:29 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-bff89873d34so5591925276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 16:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689116428; x=1691708428;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e5XEYJZfreSVrmH7xp0JErGanEh/xUg4xq9RGNi1b+M=;
 b=BqjfeKp+9hnyXrPoqAlr0i04alViXoEElEsQIaxIkFhN0pbWnnjbqhzuzbwT2600wK
 cQG9XoDqGu+UI29JHYg5OdfDxANc4DvDUWVD2WvGx3R1W1X3QmpihlqZswBKpXP3i0xw
 JYuAQUyzNRVARfCQnro25Bn1/lFVXeWIP3oEfZ+SVEKpWMcbLQlhYe+dhGO0iAU/DPuu
 W1IcEMIZoz6/OlQje4xxLk/h7P+LDwyk0UEdDyUAWuyZch9gY6cY0NmjNfMSrNplgmx5
 dxD1fNA9lVCbyVCcFYB/VQTSrSF281wDCHbqeo00TYiSfhDtqCZsAHENTlvhzauI5/Oh
 Ma/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689116428; x=1691708428;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e5XEYJZfreSVrmH7xp0JErGanEh/xUg4xq9RGNi1b+M=;
 b=X1PrXjTWAmtKPSVLqc3SlfePaBD6i53Sbxqm4LR2/gMygEQUNHTG3QyZVycczI0xl6
 ra54PkUK1OKQnhQka9AKlQ0uI+nigaEc48uPqpBYnbB77w9QCbq2BX4Bup6YUT/A+VZR
 NMj+Mde7dtylJKBLoTdJftaErWdN+AUG3YpBk98/to96wC1bbDQCFarHsY7EK7jrBUTA
 g2/arDsG4i8zFONao2XvhQAhxac2abzh4AaDLrrZEuAQ7BKGmwD5bNckg/5NZ/zBaJsB
 nXJWYMqmWeWG9NH2u39vM+EDsQ3VGlziWP3gYBIUJeG6eOdNftrlwyJIorHWwYWaAGfR
 Rtgw==
X-Gm-Message-State: ABy/qLZ9rl0odK10FPYtP/a0LynT/FeVjg1jC7JjVBhYnBoCdQgUQG4D
 VDJwYh7TjX0s9sN6oX1cp4YJJnzEThnWIviHYJKyGQ==
X-Google-Smtp-Source: APBJJlHj7BK8FAG5sK7D6DJ4ViTEhyfUUT2qJeUHoEJijRlMTyRumuXXODCkNbAruXE43azlEdXBIW4OnmDyrr27GqY=
X-Received: by 2002:a81:7445:0:b0:573:9747:9a0d with SMTP id
 p66-20020a817445000000b0057397479a0dmr14970804ywc.41.1689116427237; Tue, 11
 Jul 2023 16:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
 <6e3eec49-f798-ff91-8b4d-417d31089296@linaro.org>
 <20230630112708.4d3a08a7@eldfell>
 <eb78b4d6-6da2-1cb5-5fab-01d7bf233111@quicinc.com>
 <e17db728-d91b-a2b3-08a9-1dd1fde9c727@linaro.org>
 <53ca10d5-c1e0-285a-30b9-4e9a2a1b70c9@quicinc.com>
 <916d6b67-0f37-3814-4a15-d4a6fd6891ab@linaro.org>
 <79eb29b5-f018-d92c-b514-5ae0c954ff46@quicinc.com>
In-Reply-To: <79eb29b5-f018-d92c-b514-5ae0c954ff46@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jul 2023 02:00:15 +0300
Message-ID: <CAA8EJppEvcbi1LKX4V8_rW1k3RRS0_ozfu8KwuRdSpm8UXjkgw@mail.gmail.com>
Subject: Re: [PATCH RFC v4 2/7] drm: Introduce pixel_source DRM plane property
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, laurent.pinchart@ideasonboard.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2023 at 01:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/11/2023 3:19 PM, Dmitry Baryshkov wrote:
> > On 12/07/2023 01:07, Jessica Zhang wrote:
> >>
> >>
> >> On 7/10/2023 1:11 PM, Dmitry Baryshkov wrote:
> >>> On 10/07/2023 22:51, Jessica Zhang wrote:
> >>>>
> >>>>
> >>>> On 6/30/2023 1:27 AM, Pekka Paalanen wrote:
> >>>>> On Fri, 30 Jun 2023 03:42:28 +0300
> >>>>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >>>>>
> >>>>>> On 30/06/2023 03:25, Jessica Zhang wrote:
> >>>>>>> Add support for pixel_source property to drm_plane and related
> >>>>>>> documentation.
> >>>>>>>
> >>>>>>> This enum property will allow user to specify a pixel source for the
> >>>>>>> plane. Possible pixel sources will be defined in the
> >>>>>>> drm_plane_pixel_source enum.
> >>>>>>>
> >>>>>>> The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_FB and
> >>>>>>> DRM_PLANE_PIXEL_SOURCE_COLOR. The default value is *_SOURCE_FB.
> >>>>>>
> >>>>>> I think, this should come before the solid fill property addition.
> >>>>>> First
> >>>>>> you tell that there is a possibility to define other pixel
> >>>>>> sources, then
> >>>>>> additional sources are defined.
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> that would be logical indeed.
> >>>>
> >>>> Hi Dmitry and Pekka,
> >>>>
> >>>> Sorry for the delay in response, was out of office last week.
> >>>>
> >>>> Acked.
> >>>>
> >>>>>
> >>>>>>>
> >>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>>>> ---
> >>>>>>>    drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
> >>>>>>>    drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
> >>>>>>>    drivers/gpu/drm/drm_blend.c               | 81
> >>>>>>> +++++++++++++++++++++++++++++++
> >>>>>>>    include/drm/drm_blend.h                  |  2 +
> >>>>>>>    include/drm/drm_plane.h                  | 21 ++++++++
> >>>>>>>    5 files changed, 109 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c
> >>>>>>> b/drivers/gpu/drm/drm_atomic_state_helper.c
> >>>>>>> index fe14be2bd2b2..86fb876efbe6 100644
> >>>>>>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> >>>>>>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> >>>>>>> @@ -252,6 +252,7 @@ void
> >>>>>>> __drm_atomic_helper_plane_state_reset(struct drm_plane_state
> >>>>>>> *plane_state,
> >>>>>>>        plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
> >>>>>>>        plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
> >>>>>>> +    plane_state->pixel_source = DRM_PLANE_PIXEL_SOURCE_FB;
> >>>>>>>        if (plane_state->solid_fill_blob) {
> >>>>>>>            drm_property_blob_put(plane_state->solid_fill_blob);
> >>>>>>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> >>>>>>> b/drivers/gpu/drm/drm_atomic_uapi.c
> >>>>>>> index a28b4ee79444..6e59c21af66b 100644
> >>>>>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> >>>>>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> >>>>>>> @@ -596,6 +596,8 @@ static int
> >>>>>>> drm_atomic_plane_set_property(struct drm_plane *plane,
> >>>>>>>            drm_property_blob_put(solid_fill);
> >>>>>>>            return ret;
> >>>>>>> +    } else if (property == plane->pixel_source_property) {
> >>>>>>> +        state->pixel_source = val;
> >>>>>>>        } else if (property == plane->alpha_property) {
> >>>>>>>            state->alpha = val;
> >>>>>>>        } else if (property == plane->blend_mode_property) {
> >>>>>>
> >>>>>> I think, it was pointed out in the discussion that
> >>>>>> drm_mode_setplane()
> >>>>>> (a pre-atomic IOCTL to turn the plane on and off) should also reset
> >>>>>> pixel_source to FB.
> >>>>
> >>>> I don't remember drm_mode_setplane() being mentioned in the
> >>>> pixel_source discussion... can you share where it was mentioned?
> >>>
> >>> https://lore.kernel.org/dri-devel/20230627105849.004050b3@eldfell/
> >>>
> >>> Let me quote it here:
> >>> "Legacy non-atomic UAPI wrappers can do whatever they want, and program
> >>> any (new) properties they want in order to implement the legacy
> >>> expectations, so that does not seem to be a problem."
> >>>
> >>>
> >>>>
> >>>> I'd prefer to avoid having driver change the pixel_source directly
> >>>> as it could cause some unexpected side effects. In general, I would
> >>>> like userspace to assign the value of pixel_source without driver
> >>>> doing anything "under the hood".
> >>>
> >>> s/driver/drm core/
> >>>
> >>> We have to remain compatible with old userspace, especially with the
> >>> non-atomic one. If the userspace calls
> >>> ioctl(DRM_IOCTL_MODE_SETPLANE), we have to display the specified FB,
> >>> no matter what was the value of PIXEL_SOURCE before this ioctl.
> >>
> >>
> >> Got it, thanks the clarification -- I see your point.
> >>
> >> I'm already setting plane_state->pixel_source to FB in
> >> __drm_atomic_helper_plane_reset() and it seems to me that all drivers
> >> are calling that within their respective plane_funcs->reset().
> >>
> >> Since (as far as I know) reset() is being called for both the atomic
> >> and non-atomic paths, shouldn't that be enough to default pixel_source
> >> to FB for old userspace?
> >
> > No, this will not clean up the state between userspace apps. Currently
> > the rule is simple: call DRM_IOCTL_MODE_SETPLANE, get the image from FB
> > displayed. We should keep it so.
> >
>
> Ok, so you are considering a use-case where we bootup with a userspace
> (which is aware of pixel_source), that one uses the pixel_source to
> switch the property to solid_color and then we kill this userspace and
> bootup one which is unaware of this property and uses
> DRM_IOCTL_MODE_SETPLANE, then we should default back to FB.

Not necessarily _that_ complex, but yes, that was the idea. We are not
limited to a single composer.

>
> >>>>
> >>>>>>
> >>>>>>> @@ -671,6 +673,8 @@ drm_atomic_plane_get_property(struct
> >>>>>>> drm_plane *plane,
> >>>>>>>        } else if (property == plane->solid_fill_property) {
> >>>>>>>            *val =state->solid_fill_blob ?
> >>>>>>>                state->solid_fill_blob->base.id : 0;
> >>>>>>> +    } else if (property == plane->pixel_source_property) {
> >>>>>>> +        *val = state->pixel_source;
> >>>>>>>        } else if (property == plane->alpha_property) {
> >>>>>>>            *val =state->alpha;
> >>>>>>>        } else if (property == plane->blend_mode_property) {
> >>>>>>> diff --git a/drivers/gpu/drm/drm_blend.c
> >>>>>>> b/drivers/gpu/drm/drm_blend.c
> >>>>>>> index 38c3c5d6453a..8c100a957ee2 100644
> >>>>>>> --- a/drivers/gpu/drm/drm_blend.c
> >>>>>>> +++ b/drivers/gpu/drm/drm_blend.c
> >>>>>>> @@ -189,6 +189,18 @@
> >>>>>>>     *    solid_fill is set up with
> >>>>>>> drm_plane_create_solid_fill_property(). It
> >>>>>>>     *    contains pixel data that drivers can use to fill a plane.
> >>>>>>>     *
> >>>>>>> + * pixel_source:
> >>>>>>> + *    pixel_source is set up with
> >>>>>>> drm_plane_create_pixel_source_property().
> >>>>>>> + *    It is used to toggle the source of pixel data for the plane.
> >>>>>
> >>>>> Other sources than the selected one are ignored?
> >>>>
> >>>> Yep, the plane will only display the data from the set pixel_source.
> >>>>
> >>>> So if pixel_source == FB and solid_fill_blob is non-NULL,
> >>>> solid_fill_blob will be ignored and the plane will display the FB
> >>>> that is set.
> >>>
> >>> correct.
> >>>
> >>>>
> >>>> Will add a note about this in the comment docs.
> >>>>
> >>>>>
> >>>>>>> + *
> >>>>>>> + *    Possible values:
> >>>>>
> >>>>> Wouldn't hurt to explicitly mention here that this is an enum.
> >>>>
> >>>> Acked.
> >>>>
> >>>>>
> >>>>>>> + *
> >>>>>>> + *    "FB":
> >>>>>>> + *        Framebuffer source
> >>>>>>> + *
> >>>>>>> + *    "COLOR":
> >>>>>>> + *        solid_fill source
> >>>>>
> >>>>> I think these two should be more explicit. Framebuffer source is the
> >>>>> usual source from the property "FB_ID". Solid fill source comes from
> >>>>> the property "solid_fill".
> >>>>
> >>>> Acked.
> >>>>
> >>>>>
> >>>>> Why "COLOR" and not, say, "SOLID_FILL"?
> >>>>
> >>>> Ah, that would make more sense :)
> >>>>
> >>>> I'll change this to "SOLID_FILL".
> >>>>
> >>>>>
> >>>>>>> + *
> >>>>>>>     * Note that all the property extensions described here apply
> >>>>>>> either to the
> >>>>>>>     * plane or the CRTC (e.g. for the background color, which
> >>>>>>> currently is not
> >>>>>>>     * exposed and assumed to be black).
> >>>>>>> @@ -648,3 +660,72 @@ int
> >>>>>>> drm_plane_create_solid_fill_property(struct drm_plane *plane)
> >>>>>>>        return 0;
> >>>>>>>    }
> >>>>>>>    EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
> >>>>>>> +
> >>>>>>> +/**
> >>>>>>> + * drm_plane_create_pixel_source_property - create a new pixel
> >>>>>>> source property
> >>>>>>> + * @plane: drm plane
> >>>>>>> + * @supported_sources: bitmask of supported pixel_sources for
> >>>>>>> the driver (NOT
> >>>>>>> + *                     including DRM_PLANE_PIXEL_SOURCE_FB, as
> >>>>>>> it will be supported
> >>>>>>> + *                     by default).
> >>>>>>
> >>>>>> I'd say this is too strong. I'd suggest either renaming this to
> >>>>>> extra_sources (mentioning that FB is enabled for all the planes) or
> >>>>>> allowing any source bitmask (mentioning that FB should be enabled
> >>>>>> by the
> >>>>>> caller, unless there is a good reason not to do so).
> >>>>>
> >>>>> Right. I don't see any problem with having planes of type OVERLAY that
> >>>>> support only solid_fill and no FB. Planes of type PRIMARY and CURSOR I
> >>>>> would expect to always support at least FB.
> >>>>>
> >>>>> Atomic userspace is prepared to have an OVERLAY plane fail for any
> >>>>> arbitrary reason. Legacy userspace probably should not ever see a
> >>>>> plane
> >>>>> that does not support FB.
> >>>>
> >>>> Got it... If we allow the possibility of FB sources not being
> >>>> supported, then should the default pixel_source per plane be decided
> >>>> by the driver too?
> >>>>
> >>>> I'd forced FB support so that I could set pixel_source to FB in
> >>>> __drm_atomic_helper_plane_state_reset(). If we allow more
> >>>> flexibility in the default pixel_source value, I guess we can also
> >>>> store a default_pixel_source value in the plane_state.
> >>>
> >>> I'd say, the FB is a sane default. It the driver has other needs, it
> >>> can override the value in drm_plane_funcs::reset().
> >>>
> >>>>
> >>>
> >>> [skipped the rest]
> >>>
> >>> --
> >>> With best wishes
> >>> Dmitry
> >>>
> >



-- 
With best wishes
Dmitry

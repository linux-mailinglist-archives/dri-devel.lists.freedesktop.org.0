Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0AA78BBE5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 02:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0433C10E086;
	Tue, 29 Aug 2023 00:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0416510E39A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 00:06:30 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-d35a9d7a5bdso3422838276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 17:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693267589; x=1693872389;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NyT3vK31IPrSFR9t47ow0q9aTbU6VUd3gAc2WbXeYIQ=;
 b=K49qP+RM+YGZHGLGfDOZcQrv7y2Rk03KlmSBNaPaApU27Z4ONen0XHzXfbnQAdgL7O
 41VoyK9oeL86CRyFBvsxyp0i6pkNSAqdKLXD+1r5pCFLiCcoZLQ80MCtrxAh8Pkuy6fC
 0/9d9lYaD33NSvbcYCBzEL4pkoAwpuVM7zAhrRHiWzy0kV7r3UEfMCD8wXrhmjlMbTRq
 kMzy972lhQo53GP+k8zs+uXsFSECdnSI2f5EiOUQixq/4L/ORVEXAyzJ0ud9ylCaTboq
 dBVop0sMf9pQETQKP+BH07zEmH7l4p38O6DVEK0YycVazFAegp9EoaY7vYtbDYnHyBPr
 7HpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693267589; x=1693872389;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NyT3vK31IPrSFR9t47ow0q9aTbU6VUd3gAc2WbXeYIQ=;
 b=emhoDV17VLWgz+UEEf64yQ/U7lE1Q9wlF9jV+qaCFEdkAVewkHss/9CIfanF1To2XN
 xBid4DSikO6W19BldJPStMn/LNTyY9Q6ovH0tBWbmyy8g/exwjLLODNNu+ymE31xTyYO
 STmz1qAFfU8HUaw4OsThA0EVt2Y/AmifvnAHXs81khdwTYMUkLlk+4BF+FyN5JhE9zh9
 Bf3Yps0a1eJNgzgwn/0lU8WAkyCo9DK14sk45TrQqTBYIxoEsgvz+ULruxkWiwgpxvBS
 Dn4tmrJKcTzNAb4bzWK7a7hUc2U+nGEUl7roymccKJmk+Q5MVKycz8gCX0qo5L3wVhZy
 bVZw==
X-Gm-Message-State: AOJu0YykPi8Rzro4z/HFakHk6IGG1X1R42y+ylGhOBbQDU9kbaIg2EyK
 kQRXQNuVXcc3nnyCalDSRukCPs7B2esAOKRaFJE7Xw==
X-Google-Smtp-Source: AGHT+IEcaEy+asw8tMhYSo1Hv+7c+zGN66bTgKLzbphf2kb1mwQwkyFdO4JLRv0N94tRpZZoBCAjfW5Te4vzdnTQVtw=
X-Received: by 2002:a25:23cc:0:b0:d7b:2299:555a with SMTP id
 j195-20020a2523cc000000b00d7b2299555amr3714684ybj.17.1693267589082; Mon, 28
 Aug 2023 17:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-2-053dbefa909c@quicinc.com>
 <CAA8EJpq=pbDoYc9wqKKrX+RahXp8zWTPFqVqA=S-0TkWXXJUjQ@mail.gmail.com>
 <26b4bb91-8786-c7cf-a821-eb2b881a42ab@quicinc.com>
 <656526F6-C123-4A5A-9E62-6ED092474113@linaro.org>
 <1dfcd37e-11a6-fa77-6440-f0e6bd06998d@quicinc.com>
 <ae98c379-2ddb-6b4e-0de3-2b1c68a99ee7@quicinc.com>
In-Reply-To: <ae98c379-2ddb-6b4e-0de3-2b1c68a99ee7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Aug 2023 03:06:17 +0300
Message-ID: <CAA8EJpq8nPDHPsi+qEUTePCVFYR5xbn1_4Odoqmf5-rJioYmQA@mail.gmail.com>
Subject: Re: [PATCH RFC v5 02/10] drm: Introduce solid fill DRM plane property
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, ppaalanen@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023 at 02:45, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 8/8/2023 3:57 PM, Jessica Zhang wrote:
> >
> >
> > On 8/7/2023 6:07 PM, Dmitry Baryshkov wrote:
> >>
> >>
> >> On 8 August 2023 00:41:07 GMT+03:00, Jessica Zhang
> >> <quic_jesszhan@quicinc.com> wrote:
> >>>
> >>>
> >>> On 8/4/2023 6:27 AM, Dmitry Baryshkov wrote:
> >>>> On Fri, 28 Jul 2023 at 20:03, Jessica Zhang
> >>>> <quic_jesszhan@quicinc.com> wrote:
> >>>>>
> >>>>> Document and add support for solid_fill property to drm_plane. In
> >>>>> addition, add support for setting and getting the values for
> >>>>> solid_fill.
> >>>>>
> >>>>> To enable solid fill planes, userspace must assign a property blob to
> >>>>> the "solid_fill" plane property containing the following information:
> >>>>>
> >>>>> struct drm_mode_solid_fill {
> >>>>>           u32 version;
> >>>>>           u32 r, g, b;
> >>>>> };
> >>>>>
> >>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>> ---
> >>>>>    drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
> >>>>>    drivers/gpu/drm/drm_atomic_uapi.c         | 55
> >>>>> +++++++++++++++++++++++++++++++
> >>>>>    drivers/gpu/drm/drm_blend.c               | 30 +++++++++++++++++
> >>>>>    include/drm/drm_blend.h                   |  1 +
> >>>>>    include/drm/drm_plane.h                   | 35 ++++++++++++++++++++
> >>>>>    include/uapi/drm/drm_mode.h               | 24 ++++++++++++++
> >>>>>    6 files changed, 154 insertions(+)
> >>>>>
> >>>>
> >>>> [skipped most of the patch]
> >>>>
> >>>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> >>>>> index 43691058d28f..53c8efa5ad7f 100644
> >>>>> --- a/include/uapi/drm/drm_mode.h
> >>>>> +++ b/include/uapi/drm/drm_mode.h
> >>>>> @@ -259,6 +259,30 @@ struct drm_mode_modeinfo {
> >>>>>           char name[DRM_DISPLAY_MODE_LEN];
> >>>>>    };
> >>>>>
> >>>>> +/**
> >>>>> + * struct drm_mode_solid_fill - User info for solid fill planes
> >>>>> + *
> >>>>> + * This is the userspace API solid fill information structure.
> >>>>> + *
> >>>>> + * Userspace can enable solid fill planes by assigning the plane
> >>>>> "solid_fill"
> >>>>> + * property to a blob containing a single drm_mode_solid_fill
> >>>>> struct populated with an RGB323232
> >>>>> + * color and setting the pixel source to "SOLID_FILL".
> >>>>> + *
> >>>>> + * For information on the plane property, see
> >>>>> drm_plane_create_solid_fill_property()
> >>>>> + *
> >>>>> + * @version: Version of the blob. Currently, there is only support
> >>>>> for version == 1
> >>>>> + * @r: Red color value of single pixel
> >>>>> + * @g: Green color value of single pixel
> >>>>> + * @b: Blue color value of single pixel
> >>>>> + */
> >>>>> +struct drm_mode_solid_fill {
> >>>>> +       __u32 version;
> >>>>> +       __u32 r;
> >>>>> +       __u32 g;
> >>>>> +       __u32 b;
> >>>>
> >>>> Another thought about the drm_mode_solid_fill uABI. I still think we
> >>>> should add alpha here. The reason is the following:
> >>>>
> >>>> It is true that we have  drm_plane_state::alpha and the plane's
> >>>> "alpha" property. However it is documented as "the plane-wide opacity
> >>>> [...] It can be combined with pixel alpha. The pixel values in the
> >>>> framebuffers are expected to not be pre-multiplied by the global alpha
> >>>> associated to the plane.".
> >>>>
> >>>> I can imagine a use case, when a user might want to enable plane-wide
> >>>> opacity, set "pixel blend mode" to "Coverage" and then switch between
> >>>> partially opaque framebuffer and partially opaque solid-fill without
> >>>> touching the plane's alpha value.
> >>>
> >>> Hi Dmitry,
> >>>
> >>> I don't really agree that adding a solid fill alpha would be a good
> >>> idea. Since the intent behind solid fill is to have a single color
> >>> for the entire plane, I think it makes more sense to have solid fill
> >>> rely on the global plane alpha.
> >>>
> >>> As stated in earlier discussions, I think having both a
> >>> solid_fill.alpha and a plane_state.alpha would be redundant and serve
> >>> to confuse the user as to which one to set.
> >>
> >> That depends on the blending mode: in Coverage mode one has
> >> independent plane and contents alpha values. And I consider alpha
> >> value to be a part of the colour in the rgba/bgra modes.
> >
> > Acked -- taking Sebastian's concern into consideration, I think I'll
> > have "PIXEL_SOURCE_SOLID_FILL_RGB" and add a separate
> > "PIXEL_SOURCE_SOLID_FILL_RGBA".
>
> Hi Dmitry,
>
> Since it looks like there's still some ongoing discussion with Pekka
> about whether to support an RGBA solid fill source, I'll just leave a
> note to add an RGBA source in the future.

Sure! Let's get the basic framework landed. After that we can extend
it with RGBA, if that seems sensible.

>
> Thanks,
>
> Jessica Zhang
>
> >
> > Thanks,
> >
> > Jessica Zhang
> >
> >>
> >>
> >>>
> >>> Thanks,
> >>>
> >>> Jessica Zhang
> >>>
> >>>>
> >>>> --
> >>>> With best wishes
> >>>> Dmitry
> >>
> >> --
> >> With best wishes
> >> Dmitry



-- 
With best wishes
Dmitry

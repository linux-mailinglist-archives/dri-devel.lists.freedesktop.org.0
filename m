Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FEF660680
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 19:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F31D10E8B9;
	Fri,  6 Jan 2023 18:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D0C10E8B8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 18:41:33 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso4159102wms.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 10:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c07bHaLSKmBiOqJY8rgwXLQ5WTN3Pxi4bzCJ/GSn/gM=;
 b=QLPcCaDJq5/uEvmqB7qDUmoRPmaWLCOHw0HWAxKcqFfQdDIAWb/8ZjmEj/AfsJaAmV
 WsI9cb64kgzlxx7zrNFZ6Tos6h998azqjfLDjLegWXcq/bnASQ4tJqrKpBgWSIW4JLnh
 BiovGNQBb89ZokWPrC7+AMdKB//UrselhKH3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c07bHaLSKmBiOqJY8rgwXLQ5WTN3Pxi4bzCJ/GSn/gM=;
 b=bFkerhMTNF8OYo23NQ7Z8wejT+zFjezw0Olu2YMpOA148+EWJdmR3/c22F6EgcvvCa
 uMuNuLx5Gezdc2QPANZUu2inFdJ2qme6x3FH87veXVmIXs9obJng2/yNxvHOoDSOAElT
 YBOCFoOTYD9PSDQnNnlKRjgUaY8HmcuM4EKzn4LtYQtjO4e0QOLbRTKgSKa/UNnOG3tA
 NTe3MJFfcI3+XDz9+2PHsDQZmY0O2knnQW0N6QYMQ/boPVNxtKONJlHNB4CaCPGSooxP
 FdYBGojAlydDmy4owUttJUfisvXG2inUc7u4D9bijfhFNAI8JURbUNCogFOsfG4/R29w
 Mmmg==
X-Gm-Message-State: AFqh2kr683Bw/75aWn7mVdJyt34CkDHHFIe6gX2pQG66DSeYDXDZdwrZ
 XG/YO1BQX6j4Q+ECfTdSUhPtmA==
X-Google-Smtp-Source: AMrXdXtER5plfyMNb7JNmJyudQYH8E45d2Fn30YgM+7oylC5086tPOdmOMDT1j3tU5wMs+o2prheLQ==
X-Received: by 2002:a05:600c:a0f:b0:3cf:7704:50ce with SMTP id
 z15-20020a05600c0a0f00b003cf770450cemr41156452wmp.38.1673030491541; 
 Fri, 06 Jan 2023 10:41:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az28-20020a05600c601c00b003cf57329221sm7100927wmb.14.2023.01.06.10.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 10:41:30 -0800 (PST)
Date: Fri, 6 Jan 2023 19:41:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Message-ID: <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: sebastian.wick@redhat.com, ppaalanen@gmail.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 Jessica Zhang <quic_jesszhan@quicinc.com>, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 05:43:23AM +0200, Dmitry Baryshkov wrote:
> On Fri, 6 Jan 2023 at 02:38, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >
> >
> >
> > On 1/5/2023 3:33 AM, Daniel Vetter wrote:
> > > On Wed, Jan 04, 2023 at 03:40:33PM -0800, Jessica Zhang wrote:
> > >> Introduce and add support for a solid_fill property. When the solid_fill
> > >> property is set, and the framebuffer is set to NULL, memory fetch will be
> > >> disabled.
> > >>
> > >> In addition, loosen the NULL FB checks within the atomic commit callstack
> > >> to allow a NULL FB when the solid_fill property is set and add FB checks
> > >> in methods where the FB was previously assumed to be non-NULL.
> > >>
> > >> Finally, have the DPU driver use drm_plane_state.solid_fill and instead of
> > >> dpu_plane_state.color_fill, and add extra checks in the DPU atomic commit
> > >> callstack to account for a NULL FB in cases where solid_fill is set.
> > >>
> > >> Some drivers support hardware that have optimizations for solid fill
> > >> planes. This series aims to expose these capabilities to userspace as
> > >> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> > >> hardware composer HAL) that can be set by apps like the Android Gears
> > >> app.
> > >>
> > >> Userspace can set the solid_fill property to a blob containing the
> > >> appropriate version number and solid fill color (in RGB323232 format) and
> > >> setting the framebuffer to NULL.
> > >>
> > >> Note: Currently, there's only one version of the solid_fill blob property.
> > >> However if other drivers want to support a similar feature, but require
> > >> more than just the solid fill color, they can extend this feature by
> > >> creating additional versions of the drm_solid_fill struct.
> > >>
> > >> Changes in V2:
> > >> - Dropped SOLID_FILL_FORMAT property (Simon)
> > >> - Switched to implementing solid_fill property as a blob (Simon, Dmitry)
> > >> - Changed to checks for if solid_fill_blob is set (Dmitry)
> > >> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
> > >>    (Dmitry)
> > >> - Removed DPU_PLANE_COLOR_FILL_FLAG
> > >> - Fixed whitespace and indentation issues (Dmitry)
> > >
> > > Now that this is a blob, I do wonder again whether it's not cleaner to set
> > > the blob as the FB pointer. Or create some kind other kind of special data
> > > source objects (because solid fill is by far not the only such thing).
> > >
> > > We'd still end up in special cases like when userspace that doesn't
> > > understand solid fill tries to read out such a framebuffer, but these
> > > cases already exist anyway for lack of priviledges.
> > >
> > > So I still think that feels like the more consistent way to integrate this
> > > feature. Which doesn't mean it has to happen like that, but the
> > > patches/cover letter should at least explain why we don't do it like this.
> >
> > Hi Daniel,
> >
> > IIRC we were facing some issues with this check [1] when trying to set
> > FB to a PROP_BLOB instead. Which is why we went with making it a
> > separate property instead. Will mention this in the cover letter.
> 
> What kind of issues? Could you please describe them?

We switched from bitmask to enum style for prop types, which means it's
not possible to express with the current uapi a property which accepts
both an object or a blob.

Which yeah sucks a bit ...

But!

blob properties are kms objects (like framebuffers), so it should be
possible to stuff a blob into an object property as-is. Of course you need
to update the validation code to make sure we accept either an fb or a
blob for the internal representation. But that kind of split internally is
required no matter what I think.
-Daniel

> 
> >
> > [1]
> > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_property.c#L71
> >
> > Thanks,
> >
> > Jessica Zhang
> >
> > > -Daniel
> > >
> > >>
> > >> Changes in V3:
> > >> - Fixed some logic errors in atomic checks (Dmitry)
> > >> - Introduced drm_plane_has_visible_data() and drm_atomic_check_fb() helper
> > >>    methods (Dmitry)
> > >>
> > >> Jessica Zhang (3):
> > >>    drm: Introduce solid fill property for drm plane
> > >>    drm: Adjust atomic checks for solid fill color
> > >>    drm/msm/dpu: Use color_fill property for DPU planes
> > >>
> > >>   drivers/gpu/drm/drm_atomic.c              | 136 +++++++++++++---------
> > >>   drivers/gpu/drm/drm_atomic_helper.c       |  34 +++---
> > >>   drivers/gpu/drm/drm_atomic_state_helper.c |   9 ++
> > >>   drivers/gpu/drm/drm_atomic_uapi.c         |  59 ++++++++++
> > >>   drivers/gpu/drm/drm_blend.c               |  17 +++
> > >>   drivers/gpu/drm/drm_plane.c               |   8 +-
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   9 +-
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c |  65 +++++++----
> > >>   include/drm/drm_atomic_helper.h           |   5 +-
> > >>   include/drm/drm_blend.h                   |   1 +
> > >>   include/drm/drm_plane.h                   |  62 ++++++++++
> > >>   11 files changed, 302 insertions(+), 103 deletions(-)
> > >>
> > >> --
> > >> 2.38.1
> > >>
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

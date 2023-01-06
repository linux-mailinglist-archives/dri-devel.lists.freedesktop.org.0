Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16E06608ED
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 22:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6120610E143;
	Fri,  6 Jan 2023 21:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4068410E16F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 21:49:47 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id j206so3280841ybj.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 13:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=daORM5azLSvNqEbm20aAyWdSOeJFRbH238ckKtg/tu0=;
 b=kbjLsiELG9KMAFBdCircvd1SwQx+ZLcbxd7GMJkn7ow3OkRoohiVtiWzt5xWPc8305
 hm3+Af2MOsrJC5YI8I2VbyRZjB6U/iavEUc38y0StRkKvvI4HgDsvfo5rkM3yn5Cw1Y1
 tenf6pITishRwZDyiQ5lEvtlUGgkkCHoXRYABNUNOBbWkwLLqJc+jkkGQ93WnZrF2Odb
 GbESVWI4lXdDqJ3YfI44HiXxSgtE1WVn67+Xl02CUuIixmhvYFI9Dmx2WIvq+I0dCSeR
 2wFieLsjf0QI9l6oq4cZy1xeGVmgxt8QnjDACV2l67Uqahgu3R9ymTgDH9SacWs0mmLx
 tJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=daORM5azLSvNqEbm20aAyWdSOeJFRbH238ckKtg/tu0=;
 b=7jpATnUXyKpR0c1KFr+o0WANVAGUghvLluwthDQxwDuD96bXKNjApTo+NunJPtuj3I
 s3K/QYBo6HENGyaBhp55dSi0QLpDYtymUmWnYiP0Ko849LFv/1oopNCPpaqNig+LZjZ2
 D4z1NA6yv14xnpYrVkGwTgm3b/Uf2ZqaTCoivg1O4BeC2Y0EJMaPzj7WWC7DKxIOSeIy
 x4dKmFvgw36QlHxhsNWdqlrYILeUDs5Xc/Tzwvi9hS0Wg/6txU00iuCtSYEM/5ja4Lwh
 zzt9glcj1EN2cQuJiPbBn+S76QteHCk38iOxuec9lo8DdRuCLtVMk/f0+BAIM/pO2NUC
 uVoA==
X-Gm-Message-State: AFqh2koDJb6RBVIg3cnwR+SP/2bdZ2BSDtRxA7FLpdxv+O3/X6it9Yxk
 Vb+5PqJ+uqUh4o4tTA3lMzq5Ohj1UKBy5wI/7XtZ4w==
X-Google-Smtp-Source: AMrXdXtTexTtbAdJnEAEoI95xNx4TvEDUwzxuwS70gRNai2lJrRrVcq78GJmRo8MkM/VWZXSoGPXx0JzLcctElTuWzs=
X-Received: by 2002:a25:b794:0:b0:723:5b57:cde9 with SMTP id
 n20-20020a25b794000000b007235b57cde9mr6884900ybh.194.1673041786342; Fri, 06
 Jan 2023 13:49:46 -0800 (PST)
MIME-Version: 1.0
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
 <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
In-Reply-To: <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 6 Jan 2023 23:49:34 +0200
Message-ID: <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: sebastian.wick@redhat.com, ppaalanen@gmail.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 Jessica Zhang <quic_jesszhan@quicinc.com>, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 6 Jan 2023 at 20:41, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Jan 06, 2023 at 05:43:23AM +0200, Dmitry Baryshkov wrote:
> > On Fri, 6 Jan 2023 at 02:38, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> > >
> > >
> > >
> > > On 1/5/2023 3:33 AM, Daniel Vetter wrote:
> > > > On Wed, Jan 04, 2023 at 03:40:33PM -0800, Jessica Zhang wrote:
> > > >> Introduce and add support for a solid_fill property. When the solid_fill
> > > >> property is set, and the framebuffer is set to NULL, memory fetch will be
> > > >> disabled.
> > > >>
> > > >> In addition, loosen the NULL FB checks within the atomic commit callstack
> > > >> to allow a NULL FB when the solid_fill property is set and add FB checks
> > > >> in methods where the FB was previously assumed to be non-NULL.
> > > >>
> > > >> Finally, have the DPU driver use drm_plane_state.solid_fill and instead of
> > > >> dpu_plane_state.color_fill, and add extra checks in the DPU atomic commit
> > > >> callstack to account for a NULL FB in cases where solid_fill is set.
> > > >>
> > > >> Some drivers support hardware that have optimizations for solid fill
> > > >> planes. This series aims to expose these capabilities to userspace as
> > > >> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> > > >> hardware composer HAL) that can be set by apps like the Android Gears
> > > >> app.
> > > >>
> > > >> Userspace can set the solid_fill property to a blob containing the
> > > >> appropriate version number and solid fill color (in RGB323232 format) and
> > > >> setting the framebuffer to NULL.
> > > >>
> > > >> Note: Currently, there's only one version of the solid_fill blob property.
> > > >> However if other drivers want to support a similar feature, but require
> > > >> more than just the solid fill color, they can extend this feature by
> > > >> creating additional versions of the drm_solid_fill struct.
> > > >>
> > > >> Changes in V2:
> > > >> - Dropped SOLID_FILL_FORMAT property (Simon)
> > > >> - Switched to implementing solid_fill property as a blob (Simon, Dmitry)
> > > >> - Changed to checks for if solid_fill_blob is set (Dmitry)
> > > >> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
> > > >>    (Dmitry)
> > > >> - Removed DPU_PLANE_COLOR_FILL_FLAG
> > > >> - Fixed whitespace and indentation issues (Dmitry)
> > > >
> > > > Now that this is a blob, I do wonder again whether it's not cleaner to set
> > > > the blob as the FB pointer. Or create some kind other kind of special data
> > > > source objects (because solid fill is by far not the only such thing).
> > > >
> > > > We'd still end up in special cases like when userspace that doesn't
> > > > understand solid fill tries to read out such a framebuffer, but these
> > > > cases already exist anyway for lack of priviledges.
> > > >
> > > > So I still think that feels like the more consistent way to integrate this
> > > > feature. Which doesn't mean it has to happen like that, but the
> > > > patches/cover letter should at least explain why we don't do it like this.
> > >
> > > Hi Daniel,
> > >
> > > IIRC we were facing some issues with this check [1] when trying to set
> > > FB to a PROP_BLOB instead. Which is why we went with making it a
> > > separate property instead. Will mention this in the cover letter.
> >
> > What kind of issues? Could you please describe them?
>
> We switched from bitmask to enum style for prop types, which means it's
> not possible to express with the current uapi a property which accepts
> both an object or a blob.
>
> Which yeah sucks a bit ...
>
> But!
>
> blob properties are kms objects (like framebuffers), so it should be
> possible to stuff a blob into an object property as-is. Of course you need
> to update the validation code to make sure we accept either an fb or a
> blob for the internal representation. But that kind of split internally is
> required no matter what I think.

I checked your idea and notes from Jessica. So while we can pass blobs
to property objects, the prop_fb_id is created as an object property
with the type DRM_MODE_OBJECT_FB. Passing DRM_MODE_OBJECT_BLOB would
fail a check in drm_property_change_valid_get() ->
__drm_mode_object_find(). And I don't think that we should break the
existing validation code for this special case.

If you insist on using FB_ID for passing solid_fill information, I'd
ask you to reconsider using a 1x1 framebuffer. It would be fully
compatible with the existing userspace, which can then treat it
seamlessly.

> -Daniel
>
> >
> > >
> > > [1]
> > > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_property.c#L71

-- 
With best wishes
Dmitry

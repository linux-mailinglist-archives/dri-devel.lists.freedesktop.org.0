Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7B15A24F8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04D910E7EE;
	Fri, 26 Aug 2022 09:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C180010E7F7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 09:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661507405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=14ndUHmKS/ITdtW9SZU4mJINgke6dKCtkDYNMdNOSHg=;
 b=Tuhy96VlqLDI7kiSspTzhYC887CsgJuI4ACdRr+l901oF2+W+7J+L16+l2uVMcUkKDOWHS
 oWbyHGcgBgxcYs+KSuXnIqCtfpKc+T95A3NbwOHZ+ptB2Vl1VuGYYkjs+AKosRWXD6SuVS
 EPYi0u1nLgSIUo3jKlGv4RH2euVmNYU=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-qT8ej5NMOgKwqzoCML69zw-1; Fri, 26 Aug 2022 05:50:04 -0400
X-MC-Unique: qT8ej5NMOgKwqzoCML69zw-1
Received: by mail-oo1-f71.google.com with SMTP id
 y13-20020a4a650d000000b0044886d0101cso630878ooc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 02:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=14ndUHmKS/ITdtW9SZU4mJINgke6dKCtkDYNMdNOSHg=;
 b=0AdmRSEQMSNNMpGl2Rwo4/j3ZiA0VKhgcp6GG3w2RI8O9FHNyVpRZ8rVjaxEV/K2F6
 /pjZid9r4z02ebopIFPJMRQtaWGHuIfLUwD2qt2cStF2RoroXqI4/gQx8jltuCACo1zk
 W2Nk1a8x1o5QdCysP2FYr7KX2kpFvy4bHfS2vOjTgy1/rwba7p8I7VQhKhMl7qv7FJdI
 nWxLLskhfMFqWbQCP21yAzY8yOF3ePrX4K0WSP06Z19EE5tw4hCFryRfYxXM8ciNzXA+
 cZoMY6N0/22qcfFJrYc80zpWXg5hf5ofyQi6DIIrMNhlOU5+3rjcSCD95pRRLZz9IC5Y
 m6vg==
X-Gm-Message-State: ACgBeo0pVdvCC4yp37kWmTvGxYXZWQ11+iwB8Yb2A4wQy2SK4qIR2m71
 EphJhuM9LsqLgTMnMzxlX+HUB3UWdyGu0jLb9/BQsmVQONq8ds7eY/tJkw7WfPAdCoPek0B1Sbn
 LznXh/iMGb50egjjyKsrELd5umeAnH1KYoqkrhwXdqoVX
X-Received: by 2002:a05:6808:45:b0:343:50ef:1d73 with SMTP id
 v5-20020a056808004500b0034350ef1d73mr1169573oic.161.1661507403224; 
 Fri, 26 Aug 2022 02:50:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4KBPxCCV307HwvWDw7WMs40fd3WXgzbHMvpvwnw36X/Rai+nMD50BJiR9dFPbynYc09rAtzV3EfiOWgGb0aLk=
X-Received: by 2002:a05:6808:45:b0:343:50ef:1d73 with SMTP id
 v5-20020a056808004500b0034350ef1d73mr1169567oic.161.1661507402972; Fri, 26
 Aug 2022 02:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220824174459.441976-1-contact@emersion.fr>
 <20220826115355.668e13ca@eldfell>
In-Reply-To: <20220826115355.668e13ca@eldfell>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 26 Aug 2022 11:49:52 +0200
Message-ID: <CA+hFU4zUi42eKGbJfeB3caKXnZ_xQ5dQ_bu83EFVLM-S9SqkwQ@mail.gmail.com>
Subject: Re: drm: document uAPI page-flip flags
To: Pekka Paalanen <ppaalanen@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 26, 2022 at 10:58 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Wed, 24 Aug 2022 17:45:06 +0000
> Simon Ser <contact@emersion.fr> wrote:
>
> > Document flags accepted by the page-flip and atomic IOCTLs.
> >
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >  include/uapi/drm/drm_mode.h | 44 ++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 43 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index fa953309d9ce..e1b04ffd54c3 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -935,12 +935,30 @@ struct hdr_output_metadata {
> >       };
> >  };
> >
> > +/**
> > + * DRM_MODE_PAGE_FLIP_EVENT
> > + *
> > + * Request that the kernel sends back a vblank event (see
> > + * struct drm_event_vblank) when the page-flip is done.
>
> ...with type = DRM_EVENT_FLIP_COMPLETE?
>
> This was a bit new to me, because libdrm abstracts vblank and pageflip
> events into different APIs.
>
> > + */
> >  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
> > +/**
> > + * DRM_MODE_PAGE_FLIP_ASYNC
> > + *
> > + * Request that the page-flip is performed as soon as possible, ie. with no
> > + * delay due to waiting for vblank. This may cause tearing to be visible on
> > + * the screen.
>
> Btw. does the kernel fail the flip if the driver does not support async?
> Or does it silently fall back to sync flip?
> Asking for both legacy and atomic APIs.
>
> > + */
> >  #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
> >  #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
> >  #define DRM_MODE_PAGE_FLIP_TARGET_RELATIVE 0x8
> >  #define DRM_MODE_PAGE_FLIP_TARGET (DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE | \
> >                                  DRM_MODE_PAGE_FLIP_TARGET_RELATIVE)
> > +/**
> > + * DRM_MODE_PAGE_FLIP_FLAGS
> > + *
> > + * Bitmask of flags suitable for &drm_mode_crtc_page_flip_target.flags.
> > + */
> >  #define DRM_MODE_PAGE_FLIP_FLAGS (DRM_MODE_PAGE_FLIP_EVENT | \
> >                                 DRM_MODE_PAGE_FLIP_ASYNC | \
> >                                 DRM_MODE_PAGE_FLIP_TARGET)
> > @@ -1034,11 +1052,35 @@ struct drm_mode_destroy_dumb {
> >       __u32 handle;
> >  };
> >
> > -/* page-flip flags are valid, plus: */
> > +/**
> > + * DRM_MODE_ATOMIC_TEST_ONLY
> > + *
> > + * Do not apply the atomic commit, instead check whether the hardware supports
> > + * this configuration.
> > + *
> > + * See drm_mode_config_funcs.atomic_check for more details on test-only
> > + * commits.
> > + */
> >  #define DRM_MODE_ATOMIC_TEST_ONLY 0x0100
> > +/**
> > + * DRM_MODE_ATOMIC_NONBLOCK
> > + *
> > + * Do not block while applying the atomic commit.
>
> Maybe add something like:
>
>         The atomic commit ioctl returns immediately instead of waiting
>         for the changes to be applied in hardware.
>
> > + */
> >  #define DRM_MODE_ATOMIC_NONBLOCK  0x0200
> > +/**
> > + * DRM_MODE_ATOMIC_ALLOW_MODESET
> > + *
> > + * Allow the update to result in visible artifacts such as a black screen.
>
> Maybe add:
>
>         ...temporary or transient visible artifacts while the update is
>         being applied. Applying the update may also take significantly
>         more time than a page flip. The visual artifacts will not
>         appear after the update is completed.
>
>         This flag must be set when the KMS update might cause visible
>         artifacts. Without this flag such KMS update will return EINVAL
>         error. What kind of updates may cause visible artifacts depends
>         on the driver and the hardware. Userspace that needs to know
>         beforehand if an update might cause visible artifacts can use
>         DRM_MODE_ATOMIC_TEST_ONLY without DRM_MODE_ATOMIC_ALLOW_MODESET
>         to see if it fails.
>
>         Visual artifacts are guaranteed to not appear when this flag is
>         not set.

That doesn't seem to be true, though. For example setting
HDR_OUTPUT_METADATA for example does result in visual artifacts on my
display no matter if the flag is specified or not because the
artifacts are not the result of a mode set but of the display reacting
to some AVI InfoFrame.

>
> That "artifacts will not appear after the update is completed" is a bit
> awkward, because when this commit completes and triggers the completion
> event (if requested), the visual artifacts might still be on screen, but
> as soon as the scanout cycle that just started finishes, all artifacts
> are gone for good. Isn't that how it works?
>
> Or does the kernel wait with the completion event until a good picture
> has been fully scanned out at least once? I'd expect not.
>
> > + */
> >  #define DRM_MODE_ATOMIC_ALLOW_MODESET 0x0400
> >
> > +/**
> > + * DRM_MODE_ATOMIC_FLAGS
> > + *
> > + * Bitfield of flags accepted by the &DRM_IOCTL_MODE_ATOMIC IOCTL in
> > + * &drm_mode_atomic.flags.
> > + */
> >  #define DRM_MODE_ATOMIC_FLAGS (\
> >               DRM_MODE_PAGE_FLIP_EVENT |\
> >               DRM_MODE_PAGE_FLIP_ASYNC |\
>
>
> Thanks,
> pq


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D31D5EFCEB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B1E10EBDC;
	Thu, 29 Sep 2022 18:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED2310EBDC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664475654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kDoEgsT9wXe+t/kg0KkgIaBt49dEgVlHfb30tNfOKos=;
 b=bJzozZjhZ8fwGjx3hg08hTVCa+0Q1pg+uH+0PrMzRvZ7Il9C/1Dix64PBOFbyBAJ5Leagy
 7tOEMzcyu3+Kp61mgIxE+0FfXsT9n1U0UrMtajvYN7wQ0UO04DngqvPGUw0Xn5oS6G3TUN
 37CgRjIEHJDiPfG1lTnJ3Wa+05HmWGo=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-260-0oYiKUV2NeKUfqaEBQnKPg-1; Thu, 29 Sep 2022 14:20:53 -0400
X-MC-Unique: 0oYiKUV2NeKUfqaEBQnKPg-1
Received: by mail-lj1-f200.google.com with SMTP id
 by40-20020a05651c1a2800b0026c4246ce71so675902ljb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 11:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kDoEgsT9wXe+t/kg0KkgIaBt49dEgVlHfb30tNfOKos=;
 b=UVM9uIjHcOlP1POBse0r0JUXWjBfd21G6kzCfUwRPM1fUKjvJYxoFx38tSjmF3EbQP
 /thaXIQi2RDazH4oCkC0tQMjCrxYAwucp+y+2rCQ1Zw0Nh2wm/AFiyKllfGF+agHT/b4
 34Gzj2faBOPzOzVOkk40Go07lJ+Z+MKCIDM0vG1g7oV0SxhWEs0Cv3+GGVk9MKqj4OIP
 ul4riN/zGqTsc362Wjkt8dbr5BCgzBr0DHn0auP+Y0f9cy67QSuZg4Hy91+HvLEIeS6x
 V5t5REGamj9kzltUXoPBSEOIoCotaGOOEUy34OjP7TlDk/kzW2dCFpmk8v4iCUlbvbRW
 2+HQ==
X-Gm-Message-State: ACrzQf3vxzEiANLNtgBnU00dUaCEmK0/WtPWRgbH7ZQF8NcZHZQwWBMq
 WK/Pxc44+0HNB2FkUJqAOl03tM9+MrY6pKl5bXLUPQFZTB6j559RgLNO2QYQI2TM3q2qOAAzenJ
 JKBWIkraEXg/tPYf1J78iinp1OfJda8vF47fixkQlrn0N
X-Received: by 2002:a2e:984d:0:b0:26b:fb6a:2e3d with SMTP id
 e13-20020a2e984d000000b0026bfb6a2e3dmr1696852ljj.71.1664475651274; 
 Thu, 29 Sep 2022 11:20:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5+K+RPYd5vTsKmUqPwlqi1SyKDh5I9/Q6g5e+gOf61Et76lyiQP02m9Nei+Oe4/15eZhwbG44n4EVuR3Tecgg=
X-Received: by 2002:a2e:984d:0:b0:26b:fb6a:2e3d with SMTP id
 e13-20020a2e984d000000b0026bfb6a2e3dmr1696847ljj.71.1664475651070; Thu, 29
 Sep 2022 11:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220928094149.118943-1-contact@emersion.fr>
 <20220928130623.60b56910@eldfell>
 <aP95gLg6WmDLYM18uEppie64PTBeG8L7xEHbDjTgYgil7h_aABI04mgTXkqwRjN3BUfax3IYjB507EsGnKWrtM_uy_oti7Ks_Bfh9VKMtQs=@emersion.fr>
In-Reply-To: <aP95gLg6WmDLYM18uEppie64PTBeG8L7xEHbDjTgYgil7h_aABI04mgTXkqwRjN3BUfax3IYjB507EsGnKWrtM_uy_oti7Ks_Bfh9VKMtQs=@emersion.fr>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 29 Sep 2022 20:20:39 +0200
Message-ID: <CA+hFU4wc6TCV5-yNpCDECkvhCnNoHvZjJUVG2NjpFWEOnTRJWg@mail.gmail.com>
Subject: Re: [PATCH v3] drm: document uAPI page-flip flags
To: Simon Ser <contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 29, 2022 at 8:11 PM Simon Ser <contact@emersion.fr> wrote:
>
> On Wednesday, September 28th, 2022 at 12:06, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> > > +/**
> > > + * DRM_MODE_PAGE_FLIP_FLAGS
> > > + *
> > > + * Bitmask of flags suitable for &drm_mode_crtc_page_flip_target.flags.
> >
> > Should this mention also drm_mode_crtc_page_flip.flags?
> >
> > UAPI header defines both structs.
>
> drm_mode_crtc_page_flip is "v1", drm_mode_crtc_page_flip_target is "v2". The
> latter just replaces a reserved field with a new one. So I figured "v1" is
> mostly kept around for backwards compat and everybody should use "v2" for
> simplicity's sake.
>
> > > +/**
> > > + * DRM_MODE_ATOMIC_ALLOW_MODESET
> > > + *
> > > + * Allow the update to result in temporary or transient visible artifacts while
> > > + * the update is being applied. Applying the update may also take significantly
> > > + * more time than a page flip. All visual artifacts will disappear by the time
> > > + * the update is completed, as signalled throught the vblank event's timestamp
> >
> > typo: throught
>
> Indeed!
>
> > > + * (see struct drm_event_vblank).
> > > + *
> > > + * This flag must be set when the KMS update might cause visible artifacts.
> > > + * Without this flag such KMS update will return a EINVAL error. What kind of
> > > + * update may cause visible artifacts depends on the driver and the hardware.
> > > + * User-space that needs to know beforehand if an update might cause visible
> > > + * artifacts can use &DRM_MODE_ATOMIC_TEST_ONLY without
> > > + * &DRM_MODE_ATOMIC_ALLOW_MODESET to see if it fails.
> > > + *
> > > + * To the best of the driver's knowledge, visual artifacts are guaranteed to
> > > + * not appear when this flag is not set. Some sinks might display visual
> > > + * artifacts outside of the driver's control.
> >
> > Ok, so we kept the "visual artifacts" semantics and allow monitors to
> > do otherwise.
> >
> > I'm still not sure what this means for things like infoframe data where
> > changing a certain field (e.g. HDR_OUTPUT_METADATA structure's EOTF
> > field) has a high risk of causing a visual glitch. I cannot imagine why
> > a monitor manufacturer would not be able to avoid the glitch if they
> > wanted to. The glitch might or might not happen, and we cannot know in
> > advance or afterwards whether it did happen, but it is probable that
> > many monitors will glitch.
> >
> > I think "To the best of driver's knowledge" means that if someone
> > reports a monitor to glitch, the driver/kernel would need to add that
> > field to the "needs modeset" set. But doing so can regress other
> > monitors that didn't glitch, so it needs to be a monitor quirk.
> >
> > This is not something for this patch, but would it be possible to agree
> > on the kernel development policy here? Should glitches be reported and
> > added to monitor quirks list? Or should drivers be defensive from the
> > start and require modeset if the field is known to cause glitches on
> > some monitors?
>
> Good question. I am not sure there is even a desire to have a quirks table for
> this among driver developers.
>
> This reminds me of some VRR displays showing visual artifacts when user-space
> changes its page-flip rate. If we took this definition by the letter, the
> kernel should require ALLOW_MODESET at each page-flip... (The better solution
> would be to just to have a slew rate implemented in the kernel. I think it's
> implemented to some extent in amdgpu/i915 but still some monitors are having
> issues.)
>

Honestly the right thing to do here is give up on the "no visual
artifacts" phrashing. This is really about not having to interrupt the
stream which definitely results in visual artifacts but avoiding that
doesn't guarantee no artifacts.


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E4A144E2C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 10:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA44D8991E;
	Wed, 22 Jan 2020 09:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B328991E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 09:04:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a5so5973269wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 01:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9Q4FRwNx/JocClhIGe+6QCujENLgrh2wJ167L2g4zy4=;
 b=E4bSluBytPkj1awsfPRfyZGDEFNKVRugR9HvtPsLSYBvD44X8diTCIwhSONzDAYHlc
 e2wSSPwkjRZ+49IQC0jAXJc5Zrsa+Fi9pxlxTz/D5Wml1LTB6x07/zc7w8JYyGmpeRlm
 fMsIAXWgZaqQAqaaLxsaFikltGZOYF7XtDxJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9Q4FRwNx/JocClhIGe+6QCujENLgrh2wJ167L2g4zy4=;
 b=l4zWV3CuzTwDCvquI+ZoYAsD2BCdLKUSP2iG5j0qc3biv55/cMjjPeqnRikT/rfd6W
 BIDnggvrpTdBH9sV0P1UYIBRrXB9pzzTsJHiQkXgly+gPiGGpXSG5m1GfYvJqmCKjMTs
 hhKJxtBsDr5F4qSIPPMQwRW8gk+8QrAHMtcI6baqxB/3HNeK3mEMEww4mBehQ/3KY+Wo
 WmDAo/NzzUMjalXeHggOXmUzakeX/EsSRl+8/f4F6gbhsM4++WbT9USTkmKE0Y8AYUS8
 RFKfy+k7Ydm5WuMjkwBOZRf4KzZQgi9dqp7ililna2YbyVCB/ArCihSI0JuNAjA3IZK1
 s8OA==
X-Gm-Message-State: APjAAAUiaJOhzzBs3IhwWaEvzxZgH7g6VYWnkvNW1DwjyFl/LTN49LjA
 OoQghP8qytjq/nEh4znjWaLqZqDDkTAPqQ==
X-Google-Smtp-Source: APXvYqwlZ0Ge/3v4JUlon/sQ5WuD7yXn78aaTYfeCb+xAnnJAjk7qLTcItQG3KnEBIHESlQjZ6v6ow==
X-Received: by 2002:a1c:9c4c:: with SMTP id f73mr1749016wme.125.1579683848353; 
 Wed, 22 Jan 2020 01:04:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z124sm3354211wmc.20.2020.01.22.01.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 01:04:07 -0800 (PST)
Date: Wed, 22 Jan 2020 10:04:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 1/4] drm: Add drm_crtc_has_vblank()
Message-ID: <20200122090405.GR43062@phenom.ffwll.local>
References: <20200120122051.25178-1-tzimmermann@suse.de>
 <20200120122051.25178-2-tzimmermann@suse.de>
 <20200122083139.GP43062@phenom.ffwll.local>
 <3ad03b06-f9be-37c7-9cc7-044468cdf300@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ad03b06-f9be-37c7-9cc7-044468cdf300@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: laurent.pinchart@ideasonboard.com, david@lechnology.com,
 oleksandr_andrushchenko@epam.com, airlied@linux.ie, sean@poorly.run,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 hdegoede@redhat.com, kraxel@redhat.com, xen-devel@lists.xenproject.org,
 sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 22, 2020 at 09:53:42AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 22.01.20 um 09:31 schrieb Daniel Vetter:
> > On Mon, Jan 20, 2020 at 01:20:48PM +0100, Thomas Zimmermann wrote:
> >> The new interface drm_crtc_has_vblank() return true if vblanking has
> >> been initialized for a certain CRTC, or false otherwise. This function
> >> will be useful for initializing CRTC state.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/drm_vblank.c | 21 +++++++++++++++++++++
> >>  include/drm/drm_vblank.h     |  1 +
> >>  2 files changed, 22 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank=
.c
> >> index 1659b13b178c..c20102899411 100644
> >> --- a/drivers/gpu/drm/drm_vblank.c
> >> +++ b/drivers/gpu/drm/drm_vblank.c
> >> @@ -501,6 +501,27 @@ int drm_vblank_init(struct drm_device *dev, unsig=
ned int num_crtcs)
> >>  }
> >>  EXPORT_SYMBOL(drm_vblank_init);
> >>  =

> >> +/**
> >> + * drm_crtc_has_vblank - test if vblanking has been initialized for
> >> + *                       a CRTC
> >> + * @crtc: the CRTC
> >> + *
> >> + * Drivers may call this function to test if vblank support is
> >> + * initialized for a CRTC. For most hardware this means that vblanking
> >> + * can also be enabled on the CRTC.
> >> + *
> >> + * Returns:
> >> + * True if vblanking has been initialized for the given CRTC, false
> >> + * otherwise.
> >> + */
> >> +bool drm_crtc_has_vblank(const struct drm_crtc *crtc)
> > =

> > So making this specific to a CRTC sounds like a good idea. But it's not
> > the reality, drm_vblank.c assumes that either everything or nothing
> > supports vblanks.
> > =

> > The reason for dev->num_crtcs is historical baggage, it predates kms by=
 a
> > few years. For kms drivers the only two valid values are either 0 or
> > dev->mode_config.num_crtcs. Yes that's an entire different can of worms
> > that's been irking me since forever (ideally drm_vblank_init would some=
how
> > loose the num_crtcs argument for kms drivers, but some drivers call this
> > before they've done all the drm_crtc_init calls so it's complicated).
> =

> Maybe as a first step, drm_vblank_init() could use
> dev->mode_config.num_crtcs if the supplied number of CRTCs is zero.
> =

> > =

> > Hence drm_dev_has_vblank as I suggested. That would also allow you to
> > replace a bunch of if (dev->num_crtcs) checks in drm_vblank.c, which
> > should help quite a bit in code readability.
> =

> OK, but I still don't understand why this interface is better overall.
> We don't loose anything by passing in the crtc instead of the device
> structure. And if there's ever a per-crtc vblank initialization, we'd
> have the interface in place already. The tests with "if
> (dev->num_crtcs)" could probably be removed in most places in any case.

You can't use it in drm_vblank.c code, because we only have the
drm_device, not the drm_crtc (in most places at least). Your other patch
series to deprecate the drm_device callbacks for vblanks is a huge step
into the direction to fix that, but still more work needed: We'd
essentially need to copypaste drm_vblank.c into drm_crtc_vblank.c for kms
drivers, and in that copy switch from (dev, pipe) to crtc everywhere. Plus
then move the drm_vblank structure into struct drm_crtc.

Wrt removing the check: In a pile of cases it changes the return value,
which matters both for vblank usage in helper code and the ioctl itself.
From a quick look most of the checks that don't matter are already wrapped
in a WARN.

> We should also consider forking the vblank code for non-KMS drivers.
> While working in this, I found the support for legacy drivers is getting
> in the way at times. With such a fork, legacy drivers could continue
> using struct drm_vblank_crtc, while modern drivers could maybe store
> vblank state directly in struct drm_crtc.

Hm if you want to do all that then the drm_crtc_has_vblank makes sense.
But only after we've done the full split. So maybe make the public
function drm_crtc_has_vblank, which calls the internal-only
drm_has_vblank, and use that internally in drm_vblank.c?

btw I still think a sub-struct for vblank stuff in drm_crtc makes sense,
and drm_vblank_crtc seems to mostly fit the bill.

That way we're at least not adding the the conversion pain of switching
the vblank code over to drm_crtc fully.

Thoughts?
-Daniel

> Anyway, all this is for another patch. Unless you change your mind, I'll
> replace drm_crtc_has_vblank() with drm_dev_has_vblank() for the
> patchset's next iteration.
> =

> Best regards
> Thomas
> =

> > =

> > Cheers, Daniel
> > =

> >> +{
> >> +	struct drm_device *dev =3D crtc->dev;
> >> +
> >> +	return crtc->index < dev->num_crtcs;
> >> +}
> >> +EXPORT_SYMBOL(drm_crtc_has_vblank);
> >> +
> >>  /**
> >>   * drm_crtc_vblank_waitqueue - get vblank waitqueue for the CRTC
> >>   * @crtc: which CRTC's vblank waitqueue to retrieve
> >> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> >> index c16c44052b3d..531a6bc12b7e 100644
> >> --- a/include/drm/drm_vblank.h
> >> +++ b/include/drm/drm_vblank.h
> >> @@ -206,6 +206,7 @@ struct drm_vblank_crtc {
> >>  };
> >>  =

> >>  int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs);
> >> +bool drm_crtc_has_vblank(const struct drm_crtc *crtc);
> >>  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
> >>  u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
> >>  				   ktime_t *vblanktime);
> >> -- =

> >> 2.24.1
> >>
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

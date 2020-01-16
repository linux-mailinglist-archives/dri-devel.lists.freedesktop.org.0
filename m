Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA76140053
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 01:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD4A6E49C;
	Fri, 17 Jan 2020 00:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3936E49C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 00:00:01 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id m13so2434871pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 16:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Gho4j8nrfzG7IIa/FHOMHSYrFD9fBFO6dW7IZ3T+oY4=;
 b=jbhk43HgBzxIo1ehyWHQ3muHVCKVicJMw4lGK9hDDoNneH25t7nrMv/E81aXUS90/s
 3tvwCtF0XAuQrXjsOwIjUXKjNYyVv6RXJn8sJTbf2LmSn7P6svL8hVeQ5WF1FFtipGyl
 /2ioKaex4roC/Vnvketgbv7xEvV/AMxjAEG4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gho4j8nrfzG7IIa/FHOMHSYrFD9fBFO6dW7IZ3T+oY4=;
 b=JbkN3aPDHlPDzJKyrcZRrxk5D9tzO5lU/6AQe0cxKo40tKDVZwIRjeZOntucNXw1lg
 0+IUskTN09wd79o7Sk2F3+xOuELWsZrmiZucHaRx6bjYqK217E2J0xYno5OjsPKR3FdE
 AmWmVWfp1C3+1RSI/WK51WEzmGZQsQ27xPrsKzjd9P/TDgFV+M3ElHF3btu8jdGoi2pE
 pcHmQ3EFklDGZ4sdO6PAib5kpUzR/Lrb6H1pN2i8V7P37mDqk24MWRcNMKAhxQYtA9da
 BI6Z3BNgozf9GqYC+8uHUZlKIPk6Ae+Z/yOnedDxLSwwPMAouInhmElNkdRRnJkJhTLb
 btXQ==
X-Gm-Message-State: APjAAAWBeyRqwjFoYt7P4ZwpjAAANKl3OF81xQO5YkbwFR38Kym10yIw
 q56L7/6JyNgHYqPzInLP7C/2vw==
X-Google-Smtp-Source: APXvYqxP2Z2WaBH4UioHB+9TA8u7yA9J5IQZGxDpGRFn2bAKhkdPT8u9RWRLkISvPb3UIhMzZ3zSGA==
X-Received: by 2002:a17:902:8bc3:: with SMTP id
 r3mr28824480plo.220.1579219200714; 
 Thu, 16 Jan 2020 16:00:00 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([138.44.248.126])
 by smtp.gmail.com with ESMTPSA id d26sm25172656pgv.66.2020.01.16.15.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 16:00:00 -0800 (PST)
Date: Fri, 17 Jan 2020 00:59:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 4/4] drm/simple-kms: Let DRM core send VBLANK events
 by default
Message-ID: <20200116235951.GD8400@dvetter-linux.ger.corp.intel.com>
References: <20200115125226.13843-1-tzimmermann@suse.de>
 <20200115125226.13843-5-tzimmermann@suse.de>
 <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
 <33fdd33f-ce8d-70d3-544e-fac727d2686b@suse.de>
 <CACvgo52gwC6U5HjnsQSUUDgE7Gp_EDb-QqCY8VDFjAX7cE0Lxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo52gwC6U5HjnsQSUUDgE7Gp_EDb-QqCY8VDFjAX7cE0Lxg@mail.gmail.com>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, oleksandr_andrushchenko@epam.com,
 Dave Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 xen-devel@lists.xenproject.org, Emil Velikov <emil.velikov@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, david@lechnology.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 16, 2020 at 05:22:34PM +0000, Emil Velikov wrote:
> Hi all,
> 
> On Thu, 16 Jan 2020 at 07:37, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> 
> > > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > index 7cf3cf936547..23d2f51fc1d4 100644
> > > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > @@ -149,6 +149,11 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
> > >       /* Self refresh should be canceled when a new update is available */
> > >       state->active = drm_atomic_crtc_effectively_active(state);
> > >       state->self_refresh_active = false;
> > > +
> > > +     if (drm_dev_has_vblank(crtc->dev))
> > > +             state->no_vblank = true;
> > > +     else
> > > +             state->no_vblank = false;
> > >  }
> > >  EXPORT_SYMBOL(__drm_atomic_helper_crtc_duplicate_state);
> >
> > I think the if/else branches are in the wrong order.

Yeah fumbled that.

> > But generally speaking, is it really that easy? The xen driver already
> > has to work around simple-kms's auto-enabling of no_vblank (see patch
> > 4). Maybe this settings interferes with other drivers as well. At least
> > the calls for sending fake vblanks should be removed from all affected
> > drivers.

Hm xen is really special, in that it has a flip complete event, but not a
vblank. I think forcing drivers to overwrite stuff in that case makes
sense.

> I'm not sure if setting no_vblank based on dev->num_crtcs is the correct thing.
> From the original commit and associated description for no_vblank:
> 
> In some cases CRTCs are active but are not able to generating events, at
> least not at every frame at it's expected to.
> This is typically the case when the CRTC is feeding a writeback connector...

Yeah, but Thomas' series here wants to extend that. And I think if we roll
this out the common case will be "no hw vblank", and the writeback special
case is going to be the exception to the exception. Yup, patch 1 that
updates the docs doesn't reflect that, which is why I'm bringing up more
suggestions here around code & semantics of all these pieces to make them
do the most reasonable thing for most of the drivers.

> Reflects the ability of a CRTC to send VBLANK events....
> 
> 
> The proposed handling of no_vblank feels a little dirty, although
> nothing better comes to mind.
> Nevertheless code seems perfectly reasonable, so if it were me I'd merge it.

The idea with setting it very early is that drivers can overwrite it very
easily. Feels slightly dirty, so I guess we could also set it somewhere in
the atomic_helper_check function (similar to how we set the various
crtc->*_changed flags, but we're not entirely consistent on these either).

For the overall thing what feels irky to me is making this no_vblank
default logic (however we end up computing it in the end, whether like
this or what I suggested) specific to simple pipe helpers feels kinda
wrong. Simple pipe tends to have a higher ratio of drivers for hw without
vblank support, but by far not the only ones. Having that special case
feels confusing to me (and likely will trip up some people, vblank and
event handling is already a huge source of confusion in drm).

One idea behind drm_dev_has_vblank() is also that we could formalize a bit
all that, at least for the usual case - xen and maybe others being some
exceptions as usual (hence definitely not something the core code should
handle).

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

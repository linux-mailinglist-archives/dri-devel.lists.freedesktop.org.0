Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE2437ACDC
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 19:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFCE6E7DA;
	Tue, 11 May 2021 17:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E19A6E7DA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 17:16:17 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e7so2380262wrc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AmLyBAMDRBCsOH75F4t0O+Ip6nFyT0ALhZj16/9/cbg=;
 b=lBMFHEpyDx5Es9IsAK8IqK+k6lqgUlFGUikZqCu77qdqcGSi9glrZrMHv+O7PxlQY2
 iWWt3EZv9O7yXHCMFqINeBvh50iQuVeSnckBoP4B9g+VWlN8TcRz1SMYwVYpKLyb538U
 c4Itipnh5LLnjNnGTH6qra463NToWcKARKCBWIm9pDAjGa3hAjNxuzpqU4Zz7ij+Ss8U
 lpIuZb+MYzvCRv/CBUakohbfhg4z2nL1tU2u6F5yINU3imyNJxfTadaHb+SRbRzuaL8E
 A8ruXmYCvaGg8mpZR9XxXnjiJ4TXnW3Dm3ROlWYCZsqqNS38WBve9K3yypNPDBCd545D
 Z9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AmLyBAMDRBCsOH75F4t0O+Ip6nFyT0ALhZj16/9/cbg=;
 b=gobCFTOzxCVqhN7xRjBDP3hkgGI8Egu5UcEa33SAWTC+AYLWU08i/Haj7oFXMh8aHF
 R5VtrTDUUjoxpucqgLny/xuLKx6B5kLQvv+38NfcEu4nmJ1Eibe1prFgSPmUJ0alPCx6
 bItYMcHWtzkkUGEDpvDKZhCkNsp4irI4+TvmuQHcYH3K1fJiHVIZF+SG5Cr9hS98iE2b
 dvAGrbtA+DobK8XDviNoL/RPtyELzFh45cX9EreStRWEOVFwxKd/3eRq8gvQPKxW8Z9d
 3i/eii9+62YdftH6rBxRmekHlv2TO1z2GBqCMFFoIgxFbN0Te9UQq0dURSW5ItYlRaNu
 b4WQ==
X-Gm-Message-State: AOAM533X3b9YAYyDQ+tp1GE52zKAnO59A3aSOeidASo57qDAbaCbo/Ab
 4yTtSZF1l0xqMVp/IOO0BVnegT8ybNwBCIdvg4I=
X-Google-Smtp-Source: ABdhPJwzCP/V+Iaw2I4Tj6HXqpsZj7+3kBlL+nm/7n/j8IOBE8jhGMXhiji23uWg4qV9zVD5VG1Mz9MkkAJEo80EAWA=
X-Received: by 2002:a5d:5351:: with SMTP id t17mr39641067wrv.83.1620753375601; 
 Tue, 11 May 2021 10:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210508195641.397198-1-robdclark@gmail.com>
 <20210508195641.397198-2-robdclark@gmail.com>
 <YJlb3GO41hiu4pWw@phenom.ffwll.local>
 <CAF6AEGsGb1jZgRRUqDvf+j+E6pNEtSck=r3xh4VL7FmZMPszBQ@mail.gmail.com>
 <CAKMK7uGPGbOPRtJaiG5oNCDhYQ27+V3bO5Wcgv7C9fqdyp8LeA@mail.gmail.com>
 <CAF6AEGto1PQcEbYeWfXqMatK0z3dW-mpLNVh=VJb=9gwrPfCWg@mail.gmail.com>
 <YJq0YVi4O4zGkb3j@phenom.ffwll.local>
In-Reply-To: <YJq0YVi4O4zGkb3j@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 May 2021 10:19:57 -0700
Message-ID: <CAF6AEGsMk-wO=3iYbW9rS0FJ7760P++vpPgVMFHR9+Q8sWsXQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Fix dirtyfb stalls
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 9:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, May 10, 2021 at 12:06:05PM -0700, Rob Clark wrote:
> > On Mon, May 10, 2021 at 10:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, May 10, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > On Mon, May 10, 2021 at 9:14 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > On Sat, May 08, 2021 at 12:56:38PM -0700, Rob Clark wrote:
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > drm_atomic_helper_dirtyfb() will end up stalling for vblank on "video
> > > > > > mode" type displays, which is pointless and unnecessary.  Add an
> > > > > > optional helper vfunc to determine if a plane is attached to a CRTC
> > > > > > that actually needs dirtyfb, and skip over them.
> > > > > >
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > So this is a bit annoying because the idea of all these "remap legacy uapi
> > > > > to atomic constructs" helpers is that they shouldn't need/use anything
> > > > > beyond what userspace also has available. So adding hacks for them feels
> > > > > really bad.
> > > >
> > > > I suppose the root problem is that userspace doesn't know if dirtyfb
> > > > (or similar) is actually required or is a no-op.
> > > >
> > > > But it is perhaps less of a problem because this essentially boils
> > > > down to "x11 vs wayland", and it seems like wayland compositors for
> > > > non-vsync'd rendering just pageflips and throws away extra frames from
> > > > the app?
> > >
> > > Yeah it's about not adequately batching up rendering and syncing with
> > > hw. bare metal x11 is just especially stupid about it :-)
> > >
> > > > > Also I feel like it's not entirely the right thing to do here either.
> > > > > We've had this problem already on the fbcon emulation side (which also
> > > > > shouldn't be able to peek behind the atomic kms uapi curtain), and the fix
> > > > > there was to have a worker which batches up all the updates and avoids any
> > > > > stalls in bad places.
> > > >
> > > > I'm not too worried about fbcon not being able to render faster than
> > > > vblank.  OTOH it is a pretty big problem for x11
> > >
> > > That's why we'd let the worker get ahead at most one dirtyfb. We do
> > > the same with fbcon, which trivially can get ahead of vblank otherwise
> > > (if sometimes flushes each character, so you have to pile them up into
> > > a single update if that's still pending).
> > >
> > > > > Since this is for frontbuffer rendering userspace only we can probably get
> > > > > away with assuming there's only a single fb, so the implementation becomes
> > > > > pretty simple:
> > > > >
> > > > > - 1 worker, and we keep track of a single pending fb
> > > > > - if there's already a dirty fb pending on a different fb, we stall for
> > > > >   the worker to start processing that one already (i.e. the fb we track is
> > > > >   reset to NULL)
> > > > > - if it's pending on the same fb we just toss away all the updates and go
> > > > >   with a full update, since merging the clip rects is too much work :-) I
> > > > >   think there's helpers so you could be slightly more clever and just have
> > > > >   an overall bounding box
> > > >
> > > > This doesn't really fix the problem, you still end up delaying sending
> > > > the next back-buffer to mesa
> > >
> > > With this the dirtyfb would never block. Also glorious frontbuffer
> > > tracking corruption is possible, but that's not the kernel's problem.
> > > So how would anything get held up in userspace.
> >
> > the part about stalling if a dirtyfb is pending was what I was worried
> > about.. but I suppose you meant the worker stalling, rather than
> > userspace stalling (where I had interpreted it the other way around).
> > As soon as userspace needs to stall, you're losing again.
>
> Nah, I did mean userspace stalling, so we can't pile up unlimited amounts
> of dirtyfb request in the kernel.
>
> But also I never expect userspace that uses dirtyfb to actually hit this
> stall point (otherwise we'd need to look at this again). It would really
> be only there as defense against abuse.

I don't believe modesetting ddx throttles dirtyfb, it (indirectly)
calls this from it's BlockHandler.. so if you do end up blocking after
the N'th dirtyfb, you are still going to end up stalling for vblank,
you are just deferring that for a frame or two..

The thing is, for a push style panel, you don't necessarily have to
wait for "vblank" (because "vblank" isn't necessarily a real thing),
so in that scenario dirtyfb could in theory be fast.  What you want to
do is fundamentally different for push vs pull style displays.

> > > > But we could re-work drm_framebuffer_funcs::dirty to operate on a
> > > > per-crtc basis and hoist the loop and check if dirtyfb is needed out
> > > > of drm_atomic_helper_dirtyfb()
> > >
> > > That's still using information that userspace doesn't have, which is a
> > > bit irky. We might as well go with your thing here then.
> >
> > arguably, this is something we should expose to userspace.. for DSI
> > command-mode panels, you probably want to make a different decision
> > with regard to how many buffers in your flip-chain..
> >
> > Possibly we should add/remove the fb_damage_clips property depending
> > on the display type (ie. video/pull vs cmd/push mode)?
>
> I'm not sure whether atomic actually needs this exposed:
> - clients will do full flips for every frame anyway, I've not heard of
>   anyone seriously doing frontbuffer rendering.

Frontbuffer rendering is actually a thing, for ex. to reduce latency
for stylus (android and CrOS do this.. fortunately AFAICT CrOS never
uses the dirtyfb ioctl.. but as soon as someone has the nice idea to
add that we'd be running into the same problem)

Possibly one idea is to treat dirty-clip updates similarly to cursor
updates, and let the driver accumulate the updates and then wait until
vblank to apply them

BR,
-R

> - transporting the cliprects around and then tossing them if the driver
>   doesn't need them in their flip is probably not a measurable win
>
> But yeah if I'm wrong and we have a need here and it's useful, then
> exposing this to userspace should be done. Meanwhile I think a "offload to
> worker like fbcon" trick for this legacy interface is probabyl the best
> option. Plus it will fix things not just for the case where you don't need
> dirty uploading, it will also fix things for the case where you _do_ need
> dirty uploading (since right now we stall in a few bad places for that I
> think).
> -Daniel
>
> >
> > BR,
> > -R
> >
> > > -Daniel
> > >
> > > > BR,
> > > > -R
> > > >
> > > > >
> > > > > Could probably steal most of the implementation.
> > > > >
> > > > > This approach here feels a tad too much in the hacky area ...
> > > > >
> > > > > Thoughts?
> > > > > -Daniel
> > > > >
> > > > > > ---
> > > > > >  drivers/gpu/drm/drm_damage_helper.c      |  8 ++++++++
> > > > > >  include/drm/drm_modeset_helper_vtables.h | 14 ++++++++++++++
> > > > > >  2 files changed, 22 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
> > > > > > index 3a4126dc2520..a0bed1a2c2dc 100644
> > > > > > --- a/drivers/gpu/drm/drm_damage_helper.c
> > > > > > +++ b/drivers/gpu/drm/drm_damage_helper.c
> > > > > > @@ -211,6 +211,7 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
> > > > > >  retry:
> > > > > >       drm_for_each_plane(plane, fb->dev) {
> > > > > >               struct drm_plane_state *plane_state;
> > > > > > +             struct drm_crtc *crtc;
> > > > > >
> > > > > >               ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
> > > > > >               if (ret)
> > > > > > @@ -221,6 +222,13 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
> > > > > >                       continue;
> > > > > >               }
> > > > > >
> > > > > > +             crtc = plane->state->crtc;
> > > > > > +             if (crtc->helper_private->needs_dirtyfb &&
> > > > > > +                             !crtc->helper_private->needs_dirtyfb(crtc)) {
> > > > > > +                     drm_modeset_unlock(&plane->mutex);
> > > > > > +                     continue;
> > > > > > +             }
> > > > > > +
> > > > > >               plane_state = drm_atomic_get_plane_state(state, plane);
> > > > > >               if (IS_ERR(plane_state)) {
> > > > > >                       ret = PTR_ERR(plane_state);
> > > > > > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > > > > > index eb706342861d..afa8ec5754e7 100644
> > > > > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > > > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > > > > @@ -487,6 +487,20 @@ struct drm_crtc_helper_funcs {
> > > > > >                                    bool in_vblank_irq, int *vpos, int *hpos,
> > > > > >                                    ktime_t *stime, ktime_t *etime,
> > > > > >                                    const struct drm_display_mode *mode);
> > > > > > +
> > > > > > +     /**
> > > > > > +      * @needs_dirtyfb
> > > > > > +      *
> > > > > > +      * Optional callback used by damage helpers to determine if fb_damage_clips
> > > > > > +      * update is needed.
> > > > > > +      *
> > > > > > +      * Returns:
> > > > > > +      *
> > > > > > +      * True if fb_damage_clips update is needed to handle DIRTYFB, False
> > > > > > +      * otherwise.  If this callback is not implemented, then True is
> > > > > > +      * assumed.
> > > > > > +      */
> > > > > > +     bool (*needs_dirtyfb)(struct drm_crtc *crtc);
> > > > > >  };
> > > > > >
> > > > > >  /**
> > > > > > --
> > > > > > 2.30.2
> > > > > >
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

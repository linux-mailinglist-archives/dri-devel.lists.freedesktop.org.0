Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C123D37C0DA
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB84D6EC2C;
	Wed, 12 May 2021 14:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5676EC2B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 14:53:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso813236wmh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 07:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fd/lp47bMDksEuCZvWNiiTTpOFVNkBriPN79wBwwZlk=;
 b=WPEFTeGb0JMfmKzK5eEiCGQAdd42KCSJ//onCHJLhX6KStKsTis44g4I5QVg+IUwiC
 qzKt2QoVeXoYJWPE17RbfYyCLzwETRPr48WToGxv+OfazCAdoC+94RpiecZcfe6DsK9h
 aH10s+MWdH0NGRo2sTQ8VS8zntmZxASFJgfdtV2wRa/sZ3zIX6zYLdumlgE6auCYqVdW
 cfagrj/KXPYQqUaDNqpIjhK7TnsmZsoA+eS1cb7/6cIHYpL/hOc8zirqgH87btnxOBvG
 QXUiaNjQ96w3OWHSJOkyEECxY/t0Q6fRItzfRhdU9mMe/nVS4ad/4tZmjjMX7fqKhy3H
 3Gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fd/lp47bMDksEuCZvWNiiTTpOFVNkBriPN79wBwwZlk=;
 b=UW6EkuHdCa7c54Qv2HLHGfLfaEcLEKAlCfCEwPdv+RjCQBQ37aaumI+Rgt/GCKKS/U
 ZM4KgRyIT41/kHWwuF0NOoLjw1N/GepWMbB/IxXc8XWyj60PwsG375edF9lVg+ix+IZG
 W7r7v4ycL+Sx8OYbzqzBXpwkfUCwuAcVhH35NLwghsYXfhyDFCFqibSBORFoNPenxwhG
 FAS99C/lsuSss+Ug1CerV3VQDW09nUA82KEoFwXof2a2E8GH5WafYjrnlg2BLKoJ8jec
 3VvlsxdOi8U3wzTl8xs2L7LYrPIpyy/knE1acZSpDQ2SzpaJIEJzkdwNiqPEzSNInNLf
 VT2A==
X-Gm-Message-State: AOAM533fhyO9AsBrjbTsG7R3O5L8Z9nGU4xyeqizybHrJVSx3DIf2ZZp
 P7rE8hBLocsGCt32FdBOOmeiE0Olya+o5WcCAbU=
X-Google-Smtp-Source: ABdhPJz2FBpCZCQePjbngIM4j/DQbkpJd3753XlajVSNgQ6bONe6Pn557OEJfoZFG5F2vWkSc/Bg2AlfH1Yd1Q8OZnE=
X-Received: by 2002:a1c:4954:: with SMTP id w81mr12296554wma.49.1620831225047; 
 Wed, 12 May 2021 07:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210508195641.397198-1-robdclark@gmail.com>
 <20210508195641.397198-2-robdclark@gmail.com>
 <YJlb3GO41hiu4pWw@phenom.ffwll.local>
 <CAF6AEGsGb1jZgRRUqDvf+j+E6pNEtSck=r3xh4VL7FmZMPszBQ@mail.gmail.com>
 <CAKMK7uGPGbOPRtJaiG5oNCDhYQ27+V3bO5Wcgv7C9fqdyp8LeA@mail.gmail.com>
 <CAF6AEGto1PQcEbYeWfXqMatK0z3dW-mpLNVh=VJb=9gwrPfCWg@mail.gmail.com>
 <YJq0YVi4O4zGkb3j@phenom.ffwll.local> <20210512112330.0130a62a@eldfell>
In-Reply-To: <20210512112330.0130a62a@eldfell>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 May 2021 07:57:26 -0700
Message-ID: <CAF6AEGu4B2wXhbjUxT36tKUhz7R_Mg=TzD7yOA-90L7VBCHpMQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Fix dirtyfb stalls
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 12, 2021 at 1:23 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 11 May 2021 18:44:17 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Mon, May 10, 2021 at 12:06:05PM -0700, Rob Clark wrote:
> > > On Mon, May 10, 2021 at 10:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Mon, May 10, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> wrote:
> > > > >
> > > > > On Mon, May 10, 2021 at 9:14 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > >
> > > > > > On Sat, May 08, 2021 at 12:56:38PM -0700, Rob Clark wrote:
> > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > >
> > > > > > > drm_atomic_helper_dirtyfb() will end up stalling for vblank on "video
> > > > > > > mode" type displays, which is pointless and unnecessary.  Add an
> > > > > > > optional helper vfunc to determine if a plane is attached to a CRTC
> > > > > > > that actually needs dirtyfb, and skip over them.
> > > > > > >
> > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > So this is a bit annoying because the idea of all these "remap legacy uapi
> > > > > > to atomic constructs" helpers is that they shouldn't need/use anything
> > > > > > beyond what userspace also has available. So adding hacks for them feels
> > > > > > really bad.
> > > > >
> > > > > I suppose the root problem is that userspace doesn't know if dirtyfb
> > > > > (or similar) is actually required or is a no-op.
> > > > >
> > > > > But it is perhaps less of a problem because this essentially boils
> > > > > down to "x11 vs wayland", and it seems like wayland compositors for
> > > > > non-vsync'd rendering just pageflips and throws away extra frames from
> > > > > the app?
> > > >
> > > > Yeah it's about not adequately batching up rendering and syncing with
> > > > hw. bare metal x11 is just especially stupid about it :-)
> > > >
> > > > > > Also I feel like it's not entirely the right thing to do here either.
> > > > > > We've had this problem already on the fbcon emulation side (which also
> > > > > > shouldn't be able to peek behind the atomic kms uapi curtain), and the fix
> > > > > > there was to have a worker which batches up all the updates and avoids any
> > > > > > stalls in bad places.
> > > > >
> > > > > I'm not too worried about fbcon not being able to render faster than
> > > > > vblank.  OTOH it is a pretty big problem for x11
> > > >
> > > > That's why we'd let the worker get ahead at most one dirtyfb. We do
> > > > the same with fbcon, which trivially can get ahead of vblank otherwise
> > > > (if sometimes flushes each character, so you have to pile them up into
> > > > a single update if that's still pending).
> > > >
> > > > > > Since this is for frontbuffer rendering userspace only we can probably get
> > > > > > away with assuming there's only a single fb, so the implementation becomes
> > > > > > pretty simple:
> > > > > >
> > > > > > - 1 worker, and we keep track of a single pending fb
> > > > > > - if there's already a dirty fb pending on a different fb, we stall for
> > > > > >   the worker to start processing that one already (i.e. the fb we track is
> > > > > >   reset to NULL)
> > > > > > - if it's pending on the same fb we just toss away all the updates and go
> > > > > >   with a full update, since merging the clip rects is too much work :-) I
> > > > > >   think there's helpers so you could be slightly more clever and just have
> > > > > >   an overall bounding box
> > > > >
> > > > > This doesn't really fix the problem, you still end up delaying sending
> > > > > the next back-buffer to mesa
> > > >
> > > > With this the dirtyfb would never block. Also glorious frontbuffer
> > > > tracking corruption is possible, but that's not the kernel's problem.
> > > > So how would anything get held up in userspace.
> > >
> > > the part about stalling if a dirtyfb is pending was what I was worried
> > > about.. but I suppose you meant the worker stalling, rather than
> > > userspace stalling (where I had interpreted it the other way around).
> > > As soon as userspace needs to stall, you're losing again.
> >
> > Nah, I did mean userspace stalling, so we can't pile up unlimited amounts
> > of dirtyfb request in the kernel.
> >
> > But also I never expect userspace that uses dirtyfb to actually hit this
> > stall point (otherwise we'd need to look at this again). It would really
> > be only there as defense against abuse.
> >
> > > > > But we could re-work drm_framebuffer_funcs::dirty to operate on a
> > > > > per-crtc basis and hoist the loop and check if dirtyfb is needed out
> > > > > of drm_atomic_helper_dirtyfb()
> > > >
> > > > That's still using information that userspace doesn't have, which is a
> > > > bit irky. We might as well go with your thing here then.
> > >
> > > arguably, this is something we should expose to userspace.. for DSI
> > > command-mode panels, you probably want to make a different decision
> > > with regard to how many buffers in your flip-chain..
> > >
> > > Possibly we should add/remove the fb_damage_clips property depending
> > > on the display type (ie. video/pull vs cmd/push mode)?
> >
> > I'm not sure whether atomic actually needs this exposed:
> > - clients will do full flips for every frame anyway, I've not heard of
> >   anyone seriously doing frontbuffer rendering.
>
> That may or may not be changing, depending on whether the DRM drivers
> will actually support tearing flips. There has been a huge amount of
> debate for needing tearing for Wayland [1], and while I haven't really
> joined that discussion, using front-buffer rendering (blits) to work
> around the driver inability to flip-tear might be something some people
> will want.

jfwiw, there is a lot of hw that just can't do tearing pageflips.. I
think this probably includes most arm hw.  What is done instead is to
skip the pageflip and render directly to the front-buffer.

EGL_KHR_mutable_render_buffer is a thing you might be interested in..
it is wired up for android on i965 and there is a WIP MR[1] for
mesa/st (gallium):

Possibly it could be useful to add support for platform_wayland?

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10685

BR,
-R

> Personally, what I do agree with is that "tear if late from intended
> vblank" is a feature that will be needed when VRR cannot be used.
> However, I would also argue that multiple tearing updates per refresh
> cycle is not a good idea, and I know people disagree with this because
> practically all relevant games are using a naive main loop that makes
> multi-tearing necessary for good input response.
>
> I'm not quite sure where this leaves the KMS UAPI usage patterns. Maybe
> this matters, maybe not?
>
> Does it make a difference between using legacy DirtyFB vs. atomic
> FB_DAMAGE_CLIPS property?
>
> Also mind that Wayland compositors would be dynamically switching
> between "normal flips" and "tearing updates" depending on the
> scenegraph. This switch should not be considered a "mode set".
>
> [1] https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/65
>
>
> Thanks,
> pq

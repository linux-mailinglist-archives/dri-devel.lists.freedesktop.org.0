Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18A21228CA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E956E978;
	Tue, 17 Dec 2019 10:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E906E862;
 Mon, 16 Dec 2019 18:57:37 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id f10so6275720ils.8;
 Mon, 16 Dec 2019 10:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fRErO3p6DkzrKjGHgI+x7pKPjZQkWFKWkX/ri5ylyrc=;
 b=QNe7q2ni/0HbANj4xw7ZJWlzvRh6yVfNlgdg8Zk0iAZRDSdUId4MRtHuF2rxWM8Thv
 ImFjjwLDpyVRFLfOjpBx42Wfp5TMXew8VfcBzM+AGa2DLiHD9cCyl8BGARXaG4d9w9VE
 Kfmohs4N2J003JXOBbydKQ8RoeZa5xuR93hSAlU1uctdCxBbTyYrP/X7kQoDAX9Ui+bQ
 PdNaSZA8AcThzurom2HFulFWHXxlq8TD4D48FE9Hc5+niaa4OArUz7tz+han43KzVyU5
 qos5U6MeFiKgoPty2zBZRiLFO3f7WoJfxHzq803eT9vPgteiYOyXBUN/Hr7jcpJ0nU/7
 WdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fRErO3p6DkzrKjGHgI+x7pKPjZQkWFKWkX/ri5ylyrc=;
 b=iVQowLNWRF8wLs4STFVpxvd8NlJt5GcSV3+mFnqaG0YWGnDUfQBQ0mAf2c0auFk2ca
 2wLaokIEuEAfftNL09TkkTtP/CDig1NJWQAj0tVWHMCocYf7jhLCO2ple9at+19SjaPP
 yI8nMUAd9xa44K1P3fLc6QcxMvCWscA40zrR/9K5OiE4chn9ZYY6UY1IZo2YvrPkNz/m
 p75QBiKNL7kz8SkaLM8kbw/M4Yh+KnhH7rMUcX97EGXQHCT76O3Yk19BbHHWjOJmioAg
 //9gg4fQvPwlEoUjGXfQucneU1ZNzR/zTEGvXD76/u+zgN4LaehJYiyQhtd5hhCPyEQf
 Q6qA==
X-Gm-Message-State: APjAAAU2Ie05fVvQCEK76eOSW+Raci2jk9fN7yl+zkanOkQYpUyZ/tyt
 2Ch61u4MEQhf9zrXWf9824seJtCDgzQJlYQKIQE=
X-Google-Smtp-Source: APXvYqxaoCR3QZIQJUHBFbypBRT5pC0Du6V+0URCSBapyjSPUoxEmqYoKvzzx3VBu7ZRAjqM9PGmSPu9pHd1XKFy37s=
X-Received: by 2002:a92:465c:: with SMTP id t89mr14007894ila.263.1576522656793; 
 Mon, 16 Dec 2019 10:57:36 -0800 (PST)
MIME-Version: 1.0
References: <20191112104854.20850-1-masneyb@onstation.org>
 <CAOCk7NosRhRp3vZxg2Nx8106PQ0ryo5b68cUv605XUzCm6gYPA@mail.gmail.com>
 <20191113112334.GA18702@onstation.org> <20191203014006.GA7756@onstation.org>
 <CAOCk7NpHE7kPX5tc=qUJo9qM-7Qzg2E+zmmmhBdnnVwJ+i5XLg@mail.gmail.com>
 <20191213024007.GA23636@onstation.org>
In-Reply-To: <20191213024007.GA23636@onstation.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 16 Dec 2019 11:57:25 -0700
Message-ID: <CAOCk7Np7VkuzFTN_CEqwPFwgu9thcPBMpuQpa3=KMdyahfE8uw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: enable autocommit
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 12, 2019 at 7:40 PM Brian Masney <masneyb@onstation.org> wrote:
>
> Hi Jeffrey,
>
> On Tue, Dec 03, 2019 at 07:18:31AM -0700, Jeffrey Hugo wrote:
> > On Mon, Dec 2, 2019 at 6:40 PM Brian Masney <masneyb@onstation.org> wrote:
> > > On Wed, Nov 13, 2019 at 06:23:34AM -0500, Brian Masney wrote:
> > > > On Tue, Nov 12, 2019 at 08:38:27AM -0700, Jeffrey Hugo wrote:
> > > > > On Tue, Nov 12, 2019 at 3:49 AM Brian Masney <masneyb@onstation.org> wrote:
> > > > > >
> > > > > > Since the introduction of commit 2d99ced787e3 ("drm/msm: async commit
> > > > > > support"), command-mode panels began throwing the following errors:
> > > > > >
> > > > > >     msm fd900000.mdss: pp done time out, lm=0
> > > > > >
> > > > > > Let's fix this by enabling the autorefresh feature that's available in
> > > > > > the MDP starting at version 1.0. This will cause the MDP to
> > > > > > automatically send a frame to the panel every time the panel invokes
> > > > > > the TE signal, which will trigger the PP_DONE IRQ. This requires not
> > > > > > sending a START signal for command-mode panels.
> > > > > >
> > > > > > This fixes the error and gives us a counter for command-mode panels that
> > > > > > we can use to implement async commit support for the MDP5 in a follow up
> > > > > > patch.
> > > > > >
> > > > > > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > > > > > Suggested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 15 ++++++++++++++-
> > > > > >  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c  |  9 +--------
> > > > > >  2 files changed, 15 insertions(+), 9 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > > > > > index 05cc04f729d6..539348cb6331 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > > > > > @@ -456,6 +456,7 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
> > > > > >  {
> > > > > >         struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
> > > > > >         struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
> > > > > > +       struct mdp5_pipeline *pipeline = &mdp5_cstate->pipeline;
> > > > > >         struct mdp5_kms *mdp5_kms = get_kms(crtc);
> > > > > >         struct device *dev = &mdp5_kms->pdev->dev;
> > > > > >
> > > > > > @@ -493,9 +494,21 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
> > > > > >
> > > > > >         mdp_irq_register(&mdp5_kms->base, &mdp5_crtc->err);
> > > > > >
> > > > > > -       if (mdp5_cstate->cmd_mode)
> > > > > > +       if (mdp5_cstate->cmd_mode) {
> > > > > >                 mdp_irq_register(&mdp5_kms->base, &mdp5_crtc->pp_done);
> > > > > >
> > > > > > +               /*
> > > > > > +                * Enable autorefresh so we get regular ping/pong IRQs.
> > > > > > +                * - Bit 31 is the enable bit
> > > > > > +                * - Bits 0-15 represent the frame count, specifically how many
> > > > > > +                *   TE events before the MDP sends a frame.
> > > > > > +                */
> > > > > > +               mdp5_write(mdp5_kms,
> > > > > > +                          REG_MDP5_PP_AUTOREFRESH_CONFIG(pipeline->mixer->pp),
> > > > > > +                          BIT(31) | BIT(0));
> > > > > > +               crtc_flush_all(crtc);
> > > > > > +       }
> > > > > > +
> > > > > >         mdp5_crtc->enabled = true;
> > > > > >  }
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> > > > > > index 030279d7b64b..aee295abada3 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> > > > > > @@ -187,14 +187,7 @@ static bool start_signal_needed(struct mdp5_ctl *ctl,
> > > > > >         if (!ctl->encoder_enabled)
> > > > > >                 return false;
> > > > > >
> > > > > > -       switch (intf->type) {
> > > > > > -       case INTF_WB:
> > > > > > -               return true;
> > > > > > -       case INTF_DSI:
> > > > > > -               return intf->mode == MDP5_INTF_DSI_MODE_COMMAND;
> > > > > > -       default:
> > > > > > -               return false;
> > > > > > -       }
> > > > > > +       return intf->type == INTF_WB;
> > > > > >  }
> > > > >
> > > > > I don't think this fully works.
> > > > >
> > > > > The whole "flush" thing exists because the configuration is double
> > > > > buffered.  You write to the flush register to tell the hardware to
> > > > > pickup the new configuration, but it doesn't do that automatically.
> > > > > It only picks up the new config on the next "vsync".  When you have a
> > > > > video mode panel, you have the timing engine running, which drives
> > > > > that.  With a command mode panel, you have either the start signal, or
> > > > > the auto refresh to do the same, but you have a bit of a chicken and
> > > > > egg situation where if you are programming the hardware from scratch,
> > > > > autorefresh isn't already enabled to then pickup the config to enable
> > > > > autorefresh. In this case, you'll need a single start to kick
> > > > > everything off.  However, if say the bootloader already configured
> > > > > things and has autorefresh running, then you need to not do that start
> > > > > because you'll overload the DSI like you saw.
> > > >
> > > > As part of my testing for this work, I added a log statement to
> > > > mdp5_crtc_pp_done_irq() and it shows that a PP_IRQ comes in consistently
> > > > every ~0.0166 seconds, which is about 60 HZ. Without this change, plus
> > > > the 3 commits I mentioned in an earlier email related to the async
> > > > commit support, the PP IRQs come in at a variety of times: between every
> > > > ~0.0140 and ~0.2224 seconds. That's why I assumed that this was working.
> > > >
> > > > If I call send_start_signal() inside mdp5_crtc_atomic_enable(), then the
> > > > display does not work properly.
> > >
> > > I'd like to get the 'pp done time out' errors that are now occurring
> > > upstream for command-mode panels fixed. As I mentioned above, this patch
> > > fixes the problem on the Nexus 5 and the pp done interrupts are
> > > delivered at approximately 60 HZ. I don't have any other command-mode
> > > panels to test.
> > >
> > > I'm not sure how to proceed here since sending the start command breaks
> > > the display. I'm likely putting that command in the wrong spot.
> >
> > Sorry, I didn't realize you were waiting on me,
> >
> > I'm traveling currently, so this is more off the top of my head than
> > looking at the code/docs.  What I'm thinking is that we want to get
> > autorefresh enabled, which would be simple except that the bootloader
> > may have already enabled it for us.  Perhaps we have a state flag that
> > indicates if autorefresh is enabled, and if so, it skips the start
> > command (where the start command is normally in the code).  When we
> > boot up, we check the hardware and set the flag if its already enabled
> > (note I just realized the flag is per ping pong, so we need multiple
> > flags I guess).  If the flag is not enabled when we go to use the
> > start command, we issue the start, then set the flag.  The only catch
> > is I don't know recall the exact sequence of when we configure the
> > ping pong in the entire initialization sequence.  We may configure a
> > bunch of stuff, but not the ping pong, flush the config (which issues
> > a start) and then get stuck because we didn't set the autorefresh.
>
> I finally had a chance look into this tonight. This makes sense to me:
> the double buffering of the configuration, the start signal, and a
> separate flag for each of the 4 ping pongs on the MDP5.
>
> The part that I'm still unsure about is querying the initial state from
> the boot loader to see if autorefresh is already enabled and whether or
> not a single START command is needed. Here's a slightly modified snippet
> from mdp5_crtc_atomic_enable() in my patch above:
>
>   if (mdp5_cstate->cmd_mode) {
>      /* mdp5_read() returns 0 */
>      val = mdp5_read(mdp5_kms,
>                      REG_MDP5_PP_AUTOREFRESH_CONFIG(pipeline->mixer->pp));
>
>      mdp5_write(mdp5_kms,
>                 REG_MDP5_PP_AUTOREFRESH_CONFIG(pipeline->mixer->pp),
>                 BIT(31) | BIT(0));
>
>      crtc_flush_all(crtc);
>
>      /* mdp5_read() now returns 0x80000001 */
>      val = mdp5_read(mdp5_kms,
>                      REG_MDP5_PP_AUTOREFRESH_CONFIG(pipeline->mixer->pp));
>   }
>
> So I assume that the boot loader is not enabling autorefresh on this
> board since the value from the first read is zero? Or more likely, that
> since this is double buffered that the first mdp5_read() is reading from
> the configuration buffer that's not active yet and it defaults to 0? Is
> there a way to query the other configuration buffer that's currently
> active?

Sorry, catching up now that I'm back from travel

Its not possible to read the "shadow" registers that have the active
config.  However, if we can trust that the bootloader is doing the
right thing, then the configuration register you can read should match
the shadow registers.  The only way the bootloader could screw up is
if it didn't flush the config, but then we wouldn't have boot splash
which would be very easy to catch.

In short, if your first read is 0, then bootloader didn't enable autorefresh.

>
> Why do I see the ping pong IRQs delivered consistently around 60 HZ once
> I enable autorefresh with the patch that started this thread?

Hmm.  Good question.  I would expect everything to be fine once
autorefresh is enabled, but your initial patch leaves questions about
how that config is taking effect in the first place.

>
> Sorry if I'm being dense here.
>
> Brian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

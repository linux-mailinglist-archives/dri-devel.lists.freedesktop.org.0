Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 214F717AC3A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 18:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4676EBF3;
	Thu,  5 Mar 2020 17:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5B46E370
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 17:19:41 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id q13so5702992ile.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 09:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=shAbu5QE8WE9+aifQ/UEs/et96XFax8M/mtOLki6ERg=;
 b=Wfz2EBXvEvjK+f32NXe3QRNjXuq/QLzjh+TLyW2Xn7PK/SKmcjNU3+oCW8eQObg5uL
 Nno8tHJrE+5cU2AEezDd6mJaByVaVdxTd/dlUhnwyWeiAoJGHxIlZfd24iBjO5P/9P2i
 Pr0+k+B37TArcV3YGi2M0V5YfJAFHJEfNW6aR6lUWHJzHj5UPrrkEot4l2IfI4r+Feb5
 ew0BKvW8eVNLKD8zn7W/NYSZZIhbSvGGnnkv8jblS+9rXLeuXlnjL5C3U/0U7lYIT4yQ
 Vy3lRJd67Y1iA457EftlKybQqTC0MpEn0L0kkDEDjXgqjaP4ujvMwQvxhNBtNUk1YyQY
 0Mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=shAbu5QE8WE9+aifQ/UEs/et96XFax8M/mtOLki6ERg=;
 b=kYSitl+dBsx6lYXnYjleYB6BjoGOxNY4O4rPoASc3yC0uNCGeyEqzulWj3GHxZ4wtj
 F37JgU5xkb865NH9j4kG2Ls9kZ6xmuLsI0XS+dgSw+0TqPYaFJKC3LCrUZTTK4uRBN9j
 lBQdk3agYU+a6/M4daCSulflOGjWStWzMLOZ4UtlpFUYqbhLSEtIkB3dRJkmUXn6R0Kp
 cMAZx01hq6qMYssXZO61uIrUCOT0ulP4xdkC8H4Q7fLS6vNK9I7MEw+NyyqW9YjUzEjJ
 xSXIcwFXJG/0u5dBh6S6ej5K6wg3QrKfqLe+u9uytT4syV5eLkvnLMJF9EI+qym6vnwh
 IO7g==
X-Gm-Message-State: ANhLgQ0cAvyXNNlA4biwR1DPM5Qryh7DIAnTkA81ry35nZRRUGwxQwTI
 nadY4gKnJk0wPWZYASdoDiFqN+jKN06FIPzipTgylw==
X-Google-Smtp-Source: ADFU+vuZ+bPfsfFYn62Tm9PJZjbiLALRum7sSgMBjPsODb1dfqeW0AeXgbTHo6IvU+Cl1O9N4em2bPDl636W2BjEr8Q=
X-Received: by 2002:a05:6e02:cc1:: with SMTP id
 c1mr9212495ilj.165.1583428780690; 
 Thu, 05 Mar 2020 09:19:40 -0800 (PST)
MIME-Version: 1.0
References: <20200213211523.156998-1-sean@poorly.run>
 <20200213211523.156998-4-sean@poorly.run>
 <DM6PR12MB41370FD384070CC319FAFE65FC150@DM6PR12MB4137.namprd12.prod.outlook.com>
 <CAMavQKL25TUtnZUKh0aFBqAg+CCo9keEw-Zg0atdjZUFKKtM9A@mail.gmail.com>
 <DM6PR12MB41370AABE5D8D994E75D5F7AFC160@DM6PR12MB4137.namprd12.prod.outlook.com>
 <20200218155206.GD253734@art_vandelay> <20200218171522.GF253734@art_vandelay>
 <DM6PR12MB413789981059B29ABA3039BAFC100@DM6PR12MB4137.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB413789981059B29ABA3039BAFC100@DM6PR12MB4137.namprd12.prod.outlook.com>
From: Sean Paul <sean@poorly.run>
Date: Thu, 5 Mar 2020 12:19:04 -0500
Message-ID: <CAMavQKJ_4jV=Lf=TgB3nQrON_cQvQ85-Ti06PRZ_fwWagJaFMw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
To: "Lin, Wayne" <Wayne.Lin@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 6:00 AM Lin, Wayne <Wayne.Lin@amd.com> wrote:
>
> [AMD Public Use]
>
>
>
> > -----Original Message-----
> > From: Sean Paul <sean@poorly.run>
> > Sent: Wednesday, February 19, 2020 1:15 AM
> > To: Lin, Wayne <Wayne.Lin@amd.com>
> > Cc: Sean Paul <sean@poorly.run>; dri-devel@lists.freedesktop.org;
> > lyude@redhat.com; Sean Paul <seanpaul@chromium.org>; Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> > David Airlie <airlied@linux.ie>
> > Subject: Re: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
> >
> > On Tue, Feb 18, 2020 at 10:52:06AM -0500, Sean Paul wrote:
> > > On Mon, Feb 17, 2020 at 07:08:37AM +0000, Lin, Wayne wrote:
> > > > [AMD Public Use]
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Sean Paul <sean@poorly.run>
> > > > > Sent: Saturday, February 15, 2020 12:09 AM
> > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > Cc: dri-devel@lists.freedesktop.org; lyude@redhat.com; Sean Paul
> > > > > <seanpaul@chromium.org>; Maarten Lankhorst
> > > > > <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > > > > <mripard@kernel.org>; David Airlie <airlied@linux.ie>
> > > > > Subject: Re: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
> > > > >
> > > > > On Fri, Feb 14, 2020 at 12:58 AM Lin, Wayne <Wayne.Lin@amd.com>
> > wrote:
> > > > > >
> > > > > > [AMD Public Use]
> > > > > >
> > > > > > Hi Paul,
> > > > > >
> > > > > > Thanks for the mail!
> > > > > >
> > > > > > I tried to solve this problem by having restriction on sending
> > > > > > one msg at a
> > > > > time due to hub/dock compatibility problems.
> > > > > > From my experience, some branch devices don't handle well on
> > > > > > interleaved replies (Dock from HP I think)
> > > > >
> > > > > Hi Wayne,
> > > > > Hmm, that's interesting, do you have a part number of the failing
> > > > > dock so I can test it?
> > > > >
> > > > Hi Paul,
> > > >
> > > > Sorry but it's been quite a while. I can't exactly tell the part number.
> > > > If I remember correctly, when the specific branch device receives
> > > > interleaved replies, it just doesn't reply to any requests.
> > > >
> > > > > > As the result of that, correct me if I'm wrong, I remember most
> > > > > > gpu vendors
> > > > > just send one down request at a time now in windows environment.
> > > > > > I would suggest the original solution :)
> > > > >
> > > > > I can't really say what happens on the Windows side of the world,
> > > > > but I suppose that makes sense if this is a widespread issue with
> > > > > docks. I do worry about the performance hit.
> > > > >
> > > > > If indeed this is a problem, could we ratelimit per branch device
> > > > > instead of globally? Even that would be better than serializing everything.
> > > > >
> > > > Since the problem was because some branch devices can't
> > > > simultaneously handle two replies, I'm afraid that we might still encounter
> > the same problem?
> > > >
> > >
> > > Hi Wayne,
> > > Thanks for clarifying. I'm a bit hesitant to scrap this idea without
> > > solid evidence that this is a common problem. Do you have any hubs
> > > around AMD that you could try my patchset with?
> Hi Paul,
> Sure! I will see what I have at hand and try your patch set. It might take
> me some time but I will update this as soon as possible. :)
>

Hi Wayne,
I'm seeing spurious timeouts even with your serialization patch on
mainline. Have you had a chance to test this set? At least on my
machines it seems to be working better.

Sean

> Thanks!
> >
> > Oh, if you can test the set, you'll also need this patch as well :-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -3814,7 +3814,9 @@ static bool drm_dp_get_one_sb_msg(struct
> > drm_dp_mst_topology_mgr *mgr, bool up,
> >         int basereg = up ? DP_SIDEBAND_MSG_UP_REQ_BASE :
> >                            DP_SIDEBAND_MSG_DOWN_REP_BASE;
> >
> > -       *mstb = NULL;
> > +       if (mstb)
> > +               *mstb = NULL;
> > +
> >         *seqno = -1;
> >
> >         len = min(mgr->max_dpcd_transaction_bytes, 16);
> >
> >
> > > Perhaps we could get some hard data? I'm happy to test things on my
> > > end, but I probably shouldn't just start buying a bunch of random HP
> > > docks in hopes one of them exhibits the issue :)
> > >
> > > To add anecdote to anecdote, everything on my desk seems to work with
> > > interleaved replies.
> > >
> > > Since HDCP spec requires the host to verify each channel's encryption
> > > every <2s, we're going to be increasing the amount of sideband traffic
> > > a fair amount, so I would like to ensure we're doing everything
> > > possible to maximize our sideband bandwidth.
> > >
> > > Sean
> > >
> > > > Thanks!
> > > > > Sean
> > > > >
> > > > > >
> > > > > > Thanks!
> > > > > > > -----Original Message-----
> > > > > > > From: Sean Paul <sean@poorly.run>
> > > > > > > Sent: Friday, February 14, 2020 5:15 AM
> > > > > > > To: dri-devel@lists.freedesktop.org
> > > > > > > Cc: lyude@redhat.com; Lin, Wayne <Wayne.Lin@amd.com>; Sean
> > > > > > > Paul <seanpaul@chromium.org>; Maarten Lankhorst
> > > > > > > <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > > > > > > <mripard@kernel.org>; David Airlie <airlied@linux.ie>
> > > > > > > Subject: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
> > > > > > >
> > > > > > > From: Sean Paul <seanpaul@chromium.org>
> > > > > > >
> > > > > > > Now that we can support multiple simultaneous replies, remove
> > > > > > > the restrictions placed on sending new tx msgs.
> > > > > > >
> > > > > > > This patch essentially just reverts commit
> > > > > > >   5a64967a2f3b ("drm/dp_mst: Have DP_Tx send one msg at a
> > > > > > > time")
> > > > > now
> > > > > > > that the problem is solved in a different way.
> > > > > > >
> > > > > > > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > > > > > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/drm_dp_mst_topology.c | 14 ++------------
> > > > > > >  include/drm/drm_dp_mst_helper.h       |  6 ------
> > > > > > >  2 files changed, 2 insertions(+), 18 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > index 7e6a82efdfc02..cbf0bb0ddeb84 100644
> > > > > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > @@ -1203,8 +1203,6 @@ static int
> > > > > > > drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
> > > > > > >                   txmsg->state ==
> > DRM_DP_SIDEBAND_TX_SENT) {
> > > > > > >                       mstb->tx_slots[txmsg->seqno] = NULL;
> > > > > > >               }
> > > > > > > -             mgr->is_waiting_for_dwn_reply = false;
> > > > > > > -
> > > > > > >       }
> > > > > > >  out:
> > > > > > >       if (unlikely(ret == -EIO) &&
> > > > > > > drm_debug_enabled(DRM_UT_DP)) { @@
> > > > > > > -1214,7 +1212,6 @@ static int drm_dp_mst_wait_tx_reply(struct
> > > > > > > drm_dp_mst_branch *mstb,
> > > > > > >       }
> > > > > > >       mutex_unlock(&mgr->qlock);
> > > > > > >
> > > > > > > -     drm_dp_mst_kick_tx(mgr);
> > > > > > >       return ret;
> > > > > > >  }
> > > > > > >
> > > > > > > @@ -2797,11 +2794,9 @@ static void
> > > > > > > process_single_down_tx_qlock(struct
> > > > > > > drm_dp_mst_topology_mgr *mgr)
> > > > > > >       ret = process_single_tx_qlock(mgr, txmsg, false);
> > > > > > >       if (ret == 1) {
> > > > > > >               /* txmsg is sent it should be in the slots now */
> > > > > > > -             mgr->is_waiting_for_dwn_reply = true;
> > > > > > >               list_del(&txmsg->next);
> > > > > > >       } else if (ret) {
> > > > > > >               DRM_DEBUG_KMS("failed to send msg in q %d\n",
> > ret);
> > > > > > > -             mgr->is_waiting_for_dwn_reply = false;
> > > > > > >               list_del(&txmsg->next);
> > > > > > >               if (txmsg->seqno != -1)
> > > > > > >                       txmsg->dst->tx_slots[txmsg->seqno] =
> > > > > > > NULL;
> > > > > @@
> > > > > > > -2841,8
> > > > > > > +2836,7 @@ static void drm_dp_queue_down_tx(struct
> > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > >               drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> > > > > > >       }
> > > > > > >
> > > > > > > -     if (list_is_singular(&mgr->tx_msg_downq) &&
> > > > > > > -         !mgr->is_waiting_for_dwn_reply)
> > > > > > > +     if (list_is_singular(&mgr->tx_msg_downq))
> > > > > > >               process_single_down_tx_qlock(mgr);
> > > > > > >       mutex_unlock(&mgr->qlock);  } @@ -3822,7 +3816,6 @@
> > > > > > > static int drm_dp_mst_handle_down_rep(struct
> > > > > > > drm_dp_mst_topology_mgr *mgr)
> > > > > > >       mutex_lock(&mgr->qlock);
> > > > > > >       txmsg->state = DRM_DP_SIDEBAND_TX_RX;
> > > > > > >       mstb->tx_slots[seqno] = NULL;
> > > > > > > -     mgr->is_waiting_for_dwn_reply = false;
> > > > > > >       mutex_unlock(&mgr->qlock);
> > > > > > >
> > > > > > >       wake_up_all(&mgr->tx_waitq); @@ -3830,9 +3823,6 @@
> > > > > > > static int drm_dp_mst_handle_down_rep(struct
> > > > > > > drm_dp_mst_topology_mgr *mgr)
> > > > > > >       return 0;
> > > > > > >
> > > > > > >  out_clear_reply:
> > > > > > > -     mutex_lock(&mgr->qlock);
> > > > > > > -     mgr->is_waiting_for_dwn_reply = false;
> > > > > > > -     mutex_unlock(&mgr->qlock);
> > > > > > >       if (msg)
> > > > > > >               memset(msg, 0, sizeof(struct
> > > > > drm_dp_sideband_msg_rx));
> > > > > > >  out:
> > > > > > > @@ -4670,7 +4660,7 @@ static void drm_dp_tx_work(struct
> > > > > > > work_struct
> > > > > > > *work)
> > > > > > >       struct drm_dp_mst_topology_mgr *mgr =
> > container_of(work,
> > > > > > > struct drm_dp_mst_topology_mgr, tx_work);
> > > > > > >
> > > > > > >       mutex_lock(&mgr->qlock);
> > > > > > > -     if (!list_empty(&mgr->tx_msg_downq)
> > > > > > > && !mgr->is_waiting_for_dwn_reply)
> > > > > > > +     if (!list_empty(&mgr->tx_msg_downq))
> > > > > > >               process_single_down_tx_qlock(mgr);
> > > > > > >       mutex_unlock(&mgr->qlock);  } diff --git
> > > > > > > a/include/drm/drm_dp_mst_helper.h
> > > > > > > b/include/drm/drm_dp_mst_helper.h index
> > > > > 7d0341f94ce1b..fcc30e64c8e7e
> > > > > > > 100644
> > > > > > > --- a/include/drm/drm_dp_mst_helper.h
> > > > > > > +++ b/include/drm/drm_dp_mst_helper.h
> > > > > > > @@ -619,12 +619,6 @@ struct drm_dp_mst_topology_mgr {
> > > > > > >        * &drm_dp_sideband_msg_tx.state once they are queued
> > > > > > >        */
> > > > > > >       struct mutex qlock;
> > > > > > > -
> > > > > > > -     /**
> > > > > > > -      * @is_waiting_for_dwn_reply: indicate whether is waiting
> > for
> > > > > down
> > > > > > > reply
> > > > > > > -      */
> > > > > > > -     bool is_waiting_for_dwn_reply;
> > > > > > > -
> > > > > > >       /**
> > > > > > >        * @tx_msg_downq: List of pending down replies.
> > > > > > >        */
> > > > > > > --
> > > > > > > Sean Paul, Software Engineer, Google / Chromium OS
> > > > > > --
> > > > > > Wayne Lin
> > > > --
> > > > Best regards,
> > > > Wayne Lin
> > >
> > > --
> > > Sean Paul, Software Engineer, Google / Chromium OS
> >
> > --
> > Sean Paul, Software Engineer, Google / Chromium OS
> --
> Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

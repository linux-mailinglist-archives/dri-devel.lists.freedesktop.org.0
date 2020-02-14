Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8A15DF83
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E1B6FA72;
	Fri, 14 Feb 2020 16:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C0C6FA72
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:09:13 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id t26so11064810ioi.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 08:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qUaGKcCfTyKjahxssqX+yFcb5F7eW69HYUcwSngxOM8=;
 b=MghAiWXNqtNVzf4k4eeemNWcyJrozIFPReSFDxBNDTIHF8DDhjKqOGDxM2qGPKer8z
 tPTAXqFnFKdTXm7q52OH/jS0gcm9OFUnkfODNTBT3scqNwOeJkrxozlEao9QFlL4Pe8/
 8W0cb2RFAlb0bBr+xpqtK9xeHnsly+2SOGhP6sqho85SFKIFFdqn8iMTQHhyivP3HA98
 ib+uC4KFCDTPz3Ly5i9n752lg/a93jo4GAXhpKLwojSiC6z3q3+AFH/xESTIecxM1IeX
 dPrVrP5VjeWLWUbfEGqPbTMVA4fo5KL71bFa2v5YJLemBL6IAVtzoXllSthXCKeh53HG
 egKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qUaGKcCfTyKjahxssqX+yFcb5F7eW69HYUcwSngxOM8=;
 b=lmNLui7B1NYG7PRPHMIOIicDm1khUUPshJf0zpvufH8sY1Ompv8KrAnD+2S3Olz+/4
 gPSdMEdUtOEO9IH/1rqh5L8YVBJjl/5VjhT6izJsJ/oClToogl9e/l7uSOCHj7yIuVfY
 s8WPSe90S2V7nT9wqJjCMBk9hpV7xwzXqG3gvql63InNyiZpeh1GIkT/YJ7bDgq0NrsR
 +xsq5AGsypGWcLWV3rpAmRxW9lF7HBt/ZcBPxrt5MoL+zwzZDDcMUhYzo7ru57sFilJU
 sbqDjh8gfJ29YhnkqaWMZd59InxUPo0VvxxJz4NTpWro/ZHcW9hzpbZh4EjzYic8ZFwG
 +AKQ==
X-Gm-Message-State: APjAAAWdBjiZaM+xcPjooBYc+JWMga4YJDcrtxtqzo8YHrSNMjzYRRQz
 eFaFRSGRPMd+BSW9H7elaUODpFzDjXjxja4VeczMHw==
X-Google-Smtp-Source: APXvYqzfHXUtC4cARE5EhzkvJTPT2jpazzkfTANpTxl01FvAyNDvhOda3o0mymuBzpevMgHCMvNY7lcgRIZhSBqk7OI=
X-Received: by 2002:a6b:f206:: with SMTP id q6mr2941235ioh.264.1581696552675; 
 Fri, 14 Feb 2020 08:09:12 -0800 (PST)
MIME-Version: 1.0
References: <20200213211523.156998-1-sean@poorly.run>
 <20200213211523.156998-4-sean@poorly.run>
 <DM6PR12MB41370FD384070CC319FAFE65FC150@DM6PR12MB4137.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB41370FD384070CC319FAFE65FC150@DM6PR12MB4137.namprd12.prod.outlook.com>
From: Sean Paul <sean@poorly.run>
Date: Fri, 14 Feb 2020 11:08:37 -0500
Message-ID: <CAMavQKL25TUtnZUKh0aFBqAg+CCo9keEw-Zg0atdjZUFKKtM9A@mail.gmail.com>
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

On Fri, Feb 14, 2020 at 12:58 AM Lin, Wayne <Wayne.Lin@amd.com> wrote:
>
> [AMD Public Use]
>
> Hi Paul,
>
> Thanks for the mail!
>
> I tried to solve this problem by having restriction on sending one msg at a time due to hub/dock compatibility problems.
> From my experience, some branch devices don't handle well on interleaved replies (Dock from HP I think)

Hi Wayne,
Hmm, that's interesting, do you have a part number of the failing dock
so I can test it?

> As the result of that, correct me if I'm wrong, I remember most gpu vendors just send one down request at a time now in windows environment.
> I would suggest the original solution :)

I can't really say what happens on the Windows side of the world, but
I suppose that makes sense if this is a widespread issue with docks. I
do worry about the performance hit.

If indeed this is a problem, could we ratelimit per branch device
instead of globally? Even that would be better than serializing
everything.

Sean

>
> Thanks!
> > -----Original Message-----
> > From: Sean Paul <sean@poorly.run>
> > Sent: Friday, February 14, 2020 5:15 AM
> > To: dri-devel@lists.freedesktop.org
> > Cc: lyude@redhat.com; Lin, Wayne <Wayne.Lin@amd.com>; Sean Paul
> > <seanpaul@chromium.org>; Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> > David Airlie <airlied@linux.ie>
> > Subject: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
> >
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > Now that we can support multiple simultaneous replies, remove the
> > restrictions placed on sending new tx msgs.
> >
> > This patch essentially just reverts commit
> >   5a64967a2f3b ("drm/dp_mst: Have DP_Tx send one msg at a time") now
> > that the problem is solved in a different way.
> >
> > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 14 ++------------
> >  include/drm/drm_dp_mst_helper.h       |  6 ------
> >  2 files changed, 2 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 7e6a82efdfc02..cbf0bb0ddeb84 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -1203,8 +1203,6 @@ static int drm_dp_mst_wait_tx_reply(struct
> > drm_dp_mst_branch *mstb,
> >                   txmsg->state == DRM_DP_SIDEBAND_TX_SENT) {
> >                       mstb->tx_slots[txmsg->seqno] = NULL;
> >               }
> > -             mgr->is_waiting_for_dwn_reply = false;
> > -
> >       }
> >  out:
> >       if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) { @@
> > -1214,7 +1212,6 @@ static int drm_dp_mst_wait_tx_reply(struct
> > drm_dp_mst_branch *mstb,
> >       }
> >       mutex_unlock(&mgr->qlock);
> >
> > -     drm_dp_mst_kick_tx(mgr);
> >       return ret;
> >  }
> >
> > @@ -2797,11 +2794,9 @@ static void process_single_down_tx_qlock(struct
> > drm_dp_mst_topology_mgr *mgr)
> >       ret = process_single_tx_qlock(mgr, txmsg, false);
> >       if (ret == 1) {
> >               /* txmsg is sent it should be in the slots now */
> > -             mgr->is_waiting_for_dwn_reply = true;
> >               list_del(&txmsg->next);
> >       } else if (ret) {
> >               DRM_DEBUG_KMS("failed to send msg in q %d\n", ret);
> > -             mgr->is_waiting_for_dwn_reply = false;
> >               list_del(&txmsg->next);
> >               if (txmsg->seqno != -1)
> >                       txmsg->dst->tx_slots[txmsg->seqno] = NULL; @@ -2841,8
> > +2836,7 @@ static void drm_dp_queue_down_tx(struct
> > drm_dp_mst_topology_mgr *mgr,
> >               drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> >       }
> >
> > -     if (list_is_singular(&mgr->tx_msg_downq) &&
> > -         !mgr->is_waiting_for_dwn_reply)
> > +     if (list_is_singular(&mgr->tx_msg_downq))
> >               process_single_down_tx_qlock(mgr);
> >       mutex_unlock(&mgr->qlock);
> >  }
> > @@ -3822,7 +3816,6 @@ static int drm_dp_mst_handle_down_rep(struct
> > drm_dp_mst_topology_mgr *mgr)
> >       mutex_lock(&mgr->qlock);
> >       txmsg->state = DRM_DP_SIDEBAND_TX_RX;
> >       mstb->tx_slots[seqno] = NULL;
> > -     mgr->is_waiting_for_dwn_reply = false;
> >       mutex_unlock(&mgr->qlock);
> >
> >       wake_up_all(&mgr->tx_waitq);
> > @@ -3830,9 +3823,6 @@ static int drm_dp_mst_handle_down_rep(struct
> > drm_dp_mst_topology_mgr *mgr)
> >       return 0;
> >
> >  out_clear_reply:
> > -     mutex_lock(&mgr->qlock);
> > -     mgr->is_waiting_for_dwn_reply = false;
> > -     mutex_unlock(&mgr->qlock);
> >       if (msg)
> >               memset(msg, 0, sizeof(struct drm_dp_sideband_msg_rx));
> >  out:
> > @@ -4670,7 +4660,7 @@ static void drm_dp_tx_work(struct work_struct
> > *work)
> >       struct drm_dp_mst_topology_mgr *mgr = container_of(work, struct
> > drm_dp_mst_topology_mgr, tx_work);
> >
> >       mutex_lock(&mgr->qlock);
> > -     if (!list_empty(&mgr->tx_msg_downq)
> > && !mgr->is_waiting_for_dwn_reply)
> > +     if (!list_empty(&mgr->tx_msg_downq))
> >               process_single_down_tx_qlock(mgr);
> >       mutex_unlock(&mgr->qlock);
> >  }
> > diff --git a/include/drm/drm_dp_mst_helper.h
> > b/include/drm/drm_dp_mst_helper.h index 7d0341f94ce1b..fcc30e64c8e7e
> > 100644
> > --- a/include/drm/drm_dp_mst_helper.h
> > +++ b/include/drm/drm_dp_mst_helper.h
> > @@ -619,12 +619,6 @@ struct drm_dp_mst_topology_mgr {
> >        * &drm_dp_sideband_msg_tx.state once they are queued
> >        */
> >       struct mutex qlock;
> > -
> > -     /**
> > -      * @is_waiting_for_dwn_reply: indicate whether is waiting for down
> > reply
> > -      */
> > -     bool is_waiting_for_dwn_reply;
> > -
> >       /**
> >        * @tx_msg_downq: List of pending down replies.
> >        */
> > --
> > Sean Paul, Software Engineer, Google / Chromium OS
> --
> Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

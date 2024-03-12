Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9648C878FBE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 09:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BF2112292;
	Tue, 12 Mar 2024 08:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ArsYcGPK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC73112268;
 Tue, 12 Mar 2024 08:31:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E468861036;
 Tue, 12 Mar 2024 08:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969D2C433C7;
 Tue, 12 Mar 2024 08:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710232282;
 bh=ncyot6GZVlpy2LYZy0ZH/PUatwzNeQz1tW9YE81ui3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ArsYcGPK1Nefx4rCHDQ5BLI3uYbqXqHkK96AybpsjZT7FAKKxhDT5Z4mUffTfMlWl
 Fxzphszn3bX/RXuJCge442ZflprWulEV1qLtYVbEPRhYefNHp+XNT9xHWWlwEFJaFG
 iJXdp7rBBmI5NFQDh8t925ZE4jpQ79M1rSeuCpL2ErLl7iQb1xHiGyf/Vxmtx7Y6AZ
 hMqm/DWW+CUhqMrW//3EX1oEBBWHIcBqedYtrWwH8OpP+zp4wIJfwlWS8FLUkMC3Ax
 IUZt3iMScNzb2t4hH/ddHY2xZUEXdVlh+vBEtayNtjGV5k5c7kGRDKDWK1VKHAdB6e
 BnZn2hH4i+OoA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rjxXk-000000007Ib-21Kk;
 Tue, 12 Mar 2024 09:31:28 +0100
Date: Tue, 12 Mar 2024 09:31:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: drm/msm: DisplayPort hard-reset on hotplug regression in 6.8-rc1
Message-ID: <ZfAS4MOXn_3Nk2OR@hovoldconsulting.com>
References: <Zd3kvD02Qvsh2Sid@hovoldconsulting.com>
 <ZesH21DcfOldRD9g@hovoldconsulting.com>
 <56de6cfb-fe0f-de30-d4d0-03c0fbb0afbb@quicinc.com>
 <ZeyOmJLlBbwnmaJN@hovoldconsulting.com>
 <Ze8Ke_M2xHyPYCu-@hovoldconsulting.com>
 <b1ae6e39-10c3-0ee1-11f4-3436c3e4ec1a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1ae6e39-10c3-0ee1-11f4-3436c3e4ec1a@quicinc.com>
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

On Mon, Mar 11, 2024 at 09:51:29AM -0700, Abhinav Kumar wrote:
> On 3/11/2024 6:43 AM, Johan Hovold wrote:
> > On Sat, Mar 09, 2024 at 05:30:17PM +0100, Johan Hovold wrote:
> >> On Fri, Mar 08, 2024 at 09:50:17AM -0800, Abhinav Kumar wrote:

> >>> I have posted my analysis with the patch here as a RFC y'day:
> >>>
> >>> https://patchwork.freedesktop.org/patch/581758/

> > I was able to reproduce the reset with some of my debug printks in place
> > after reapplying the reverted hpd notify change so I have an explanation
> > for (one of) the ways we can up in this state now.
> > 
> > This does not match description of the problem in the fix linked to
> > above and I don't think that patch solves the underlying issue even if
> > it may make the race window somewhat smaller. More details below.

> Its the same condition you described below that enable does not go 
> through and we bail out as we are in ST_DISCONNECTED.

It's closely related but clearly not the same as user space is not
involved in the reset I see.
 
> > Turns out there are paths like that and we hit those more often before
> > reverting e467e0bde881 ("drm/msm/dp: use drm_bridge_hpd_notify().
> > 
> > Specifically, when a previous connect attempt did not enable the bridge
> > fully so that it is still in the ST_MAINLINK_READY when we receive a
> > disconnect event, dp_hpd_unplug_handle() will turn of the link clock.
> > 
> > [  204.527625] msm-dp-display ae98000.displayport-controller: dp_bridge_hpd_notify - link_ready = 1, status = 2
> > [  204.531553] msm-dp-display ae98000.displayport-controller: dp_hpd_unplug_handle
> > [  204.533261] msm-dp-display ae98000.displayport-controller: dp_ctrl_off_link
> > 
> > A racing connect event, such as the one I described earlier, can then
> > try to enable the bridge again but dp_bridge_atomic_enable() just bails
> > out early (and leaks a rpm reference) because we're now in
> > ST_DISCONNECTED:
> > 
> > [  204.535773] msm-dp-display ae98000.displayport-controller: dp_bridge_hpd_notify - link_ready = 1, status = 1
> > [  204.536187] [CONNECTOR:35:DP-2] status updated from disconnected to connected
> > [  204.536905] msm-dp-display ae98000.displayport-controller: dp_display_notify_disconnect - would clear link ready (1), state = 0
> > [  204.537821] msm-dp-display ae98000.displayport-controller: dp_bridge_atomic_check - link_ready = 1
> > [  204.538063] msm-dp-display ae98000.displayport-controller: dp_display_send_hpd_notification - hpd = 0, link_ready = 1
> > [  204.542778] msm-dp-display ae98000.displayport-controller: dp_bridge_atomic_enable
> > [  204.586547] msm-dp-display ae98000.displayport-controller: dp_bridge_atomic_enable - state = 0 (rpm leak?)
> > 
> > Clearing link_ready already in dp_display_notify_disconnect() would make
> > the race window slightly smaller, but it would essentially just paper
> > over the bug as the events are still not serialised. Notably, there is
> > no user space interaction involved here and it's the spurious connect
> > event that triggers the bridge enable.

> Yes, it only narrows down the race condition window. The issue can still 
> happen if the commit / modeset was issued before we marked link_ready as 
> false.
> 
> And yes, I was only targetting a short term fix till we rework the HPD. 
> That will happen only incrementally as its a delicate piece of code.

Ok, thanks for confirming. Please also make that clear in the commit
message of any patch.

I am however not sure that your patch (RFC) is needed at this point as
the HPD revert fixes the 6.8-rc1 regression, and moving the clearing of
link_ready can actually make things worse as it makes any spurious
hotplug event always be processed (not just if they happen after
dp_display_send_hpd_notification()).

I'll reply to you patch as well.
 
> > So, while it may still be theoretically possible to hit the resets after
> > the revert, the HPD notify revert effectively "fixed" the regression in
> > 6.8-rc1 by removing the preconditions that now made us hit it (i.e. the
> > half-initialised bridge).

> Not entirely. In the bug which was reported before the patch 
> e467e0bde881 ("drm/msm/dp: use drm_bridge_hpd_notify() got landed, its a 
> classic example of how this issue can happen with userspace involvement 
> and not just fbdev client which was your case.

Sure, but you already added some kind of band-aid for that issue, right?

	https://lore.kernel.org/all/1664408211-25314-1-git-send-email-quic_khsieh@quicinc.com/

How likely is it that you'd still hit that? Have you had an reports of
anyone actually hitting that issue since the above workaround was
merged?

Note that I, and other users of the X13s, only started hitting the
resets with 6.8-rc1, which broke hotplug notification and resulted in
the half-initialised bridges.

I'm not saying it's impossible to hit the unclocked access still, just
that that does not seem to be relevant for the regression.
 
> > It seems the hotplug state machine needs to be reworked completely, but
> > at least we're roughly back where we were with 6.7 (including that the
> > bus clocks will never be turned of because of the rpm leaks on
> > disconnect).

> Yes, we already landed that revert but I am also planning to land the 
> patch I had posted till we rework HPD.

Ok, but please consider the implications that would have for any
spurious connect events first.

Johan

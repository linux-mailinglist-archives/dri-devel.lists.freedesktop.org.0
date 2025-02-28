Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308DCA49DF8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 16:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A06A10ECDB;
	Fri, 28 Feb 2025 15:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Rq4UGavv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9135E10ECE2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 15:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=I0xJ39hUZ6TGWLlkG1MakJCHxny3Dc6eRv0GRs5Wrko=; b=Rq4UGavvAKlw+Zg9
 6fWEfvg+jHej+O9ehAgHbPN21bVMnqiq63hddWimR/6oar2YBnOSezOO4tloaJlzShIoop/tlAC35
 wvgQcVQ47uprJG1HRU2qEyTo3Wr2eeLBGYENaFzmwlBrerU3ngH+Xl6vqOXPG5rurjyWJegdB0+SD
 VJHXTwQsg68k5x3kEKoKvdtMlac6PIFbLW4iMVo0LimFI5I7wiL8p+D73eD/c5gqgvdGatEWEVoCX
 SprRIgqjr2KRUqncN/FC5NJ6VJ5mFHVa799ULaqpLJ3t2EJpCfHrkEgggkg2OmvLTf0E8ZpNOiKHi
 ksWOPdTyW7LSLfd1YA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1to2aw-001g8w-09;
 Fri, 28 Feb 2025 15:48:10 +0000
Date: Fri, 28 Feb 2025 15:48:09 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: airlied@gmail.com, simona@ffwll.ch, tzimmermann@suse.de
Cc: Mikko Perttunen <cyndis@kapsi.fi>, thierry.reding@gmail.com,
 mperttunen@nvidia.com, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Remove unused host1x_debug_dump_syncpts
Message-ID: <Z8HauW1ewQoz0iLh@gallifrey>
References: <20241215214750.448209-1-linux@treblig.org>
 <0036ecec-8476-4617-ac40-8ff90fb33c07@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <0036ecec-8476-4617-ac40-8ff90fb33c07@kapsi.fi>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 15:47:30 up 296 days,  3:01,  1 user,  load average: 0.01, 0.01, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

Hi,

* Mikko Perttunen (cyndis@kapsi.fi) wrote:
> On 12/16/24 6:47 AM, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > host1x_debug_dump_syncpts() has been unused since
> > commit f0fb260a0cdb ("gpu: host1x: Implement syncpoint wait using DMA
> > fences")
> > 
> > Remove it.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >   drivers/gpu/host1x/debug.c | 9 ---------
> >   drivers/gpu/host1x/debug.h | 1 -
> >   2 files changed, 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
> > index a18cc8d8caf5..6433c00d5d7e 100644
> > --- a/drivers/gpu/host1x/debug.c
> > +++ b/drivers/gpu/host1x/debug.c
> > @@ -216,12 +216,3 @@ void host1x_debug_dump(struct host1x *host1x)
> >   	show_all(host1x, &o, true);
> >   }
> > -
> > -void host1x_debug_dump_syncpts(struct host1x *host1x)
> > -{
> > -	struct output o = {
> > -		.fn = write_to_printk
> > -	};
> > -
> > -	show_syncpts(host1x, &o, false);
> > -}
> > diff --git a/drivers/gpu/host1x/debug.h b/drivers/gpu/host1x/debug.h
> > index 62bd8a091fa7..c43c61d876a9 100644
> > --- a/drivers/gpu/host1x/debug.h
> > +++ b/drivers/gpu/host1x/debug.h
> > @@ -41,6 +41,5 @@ extern unsigned int host1x_debug_trace_cmdbuf;
> >   void host1x_debug_init(struct host1x *host1x);
> >   void host1x_debug_deinit(struct host1x *host1x);
> >   void host1x_debug_dump(struct host1x *host1x);
> > -void host1x_debug_dump_syncpts(struct host1x *host1x);
> >   #endif
> 
> Acked-by: Mikko Perttunen <mperttunen@nvidia.com>

Can this find it's way into drm please.

Thanks,

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

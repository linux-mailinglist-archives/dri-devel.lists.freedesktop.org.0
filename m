Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63611162A44
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 17:21:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543686E329;
	Tue, 18 Feb 2020 16:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189A56E329
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 16:21:21 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id w17so10748236ybm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 08:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PqogzMr6KTSGA7gpYs982o6KwIt+CgZVU7qotVIMrIg=;
 b=gJhwEgvfDz76cfsH9ntzn75+leoX8IgZF4HQUn7mo714sEL9f3F11uhy9wPuZdEyS/
 fsPjQlWDp2g8SqSLOJxWKdLmPdyepUNtqYbWdWtv8bdhfG42QHaAfy4A5jGivg/WKIaO
 tPHVKkeipiuqfE/i8X4YVBtLvK68uVF0JGI4bKBBKVWhrw/wiYEbJyBdSaWhq+4Uf+5j
 sG41m4oSDduab2cc5IG1X2ZkP6vfyflLVj4CWb1Q5QKb8mYmRtHg4x14QPfxuR4RZna5
 GQXBQ+oouckXNiKXpJoad45Qp0VazJAXcHxbUqbM89QTbkyYZwHbyWOd6/R9vVfVj/xn
 DZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PqogzMr6KTSGA7gpYs982o6KwIt+CgZVU7qotVIMrIg=;
 b=kpfgQmZLh8N9DnBRq2BAhqxSVH6H/MbUrkGdRy69pwuqe1QKNyTuWozXtdJOZHZPjV
 rSXSxc3/SPNmmILqnKVEj5r1Mu7i7h3cFdAtqOneQw7lqAlPjMLq/IbMg7aX00WIdj8X
 ic/UK3517L7YMls1mRfjuRzWF8IafB0Y1pWHsemYAMgnjgY5EAlDqIvVO1pqgXV7hb7P
 1EI/Rp3Po+gzueC4tFgYQxbRfcMFroW44k+hZ9RExBLLStGFz4w+ADLg3lN7mOePsNR4
 Gbjf36cBj++u9pDubSDQz3sjG2hUSoemJ+P0ipVMmBNE3FCxeey+MA1kOHaAOehGSjPQ
 Xzvg==
X-Gm-Message-State: APjAAAXppqcdrZeNWUG9hIAGZIoplRoq3KSFgP945ZHopqxtYbrZYl6+
 sgaHLgYCxe46zs0XxI4sG3wyHA==
X-Google-Smtp-Source: APXvYqxhXeQRF2SDYd9EmrBJGKcIB7GQhaXxxIPfvVZrPOSAMbv3v+lEpU8x+z5KEIrNOCbTp/YUFw==
X-Received: by 2002:a25:d193:: with SMTP id i141mr20959586ybg.86.1582042880240; 
 Tue, 18 Feb 2020 08:21:20 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id h184sm1879306ywa.70.2020.02.18.08.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 08:21:19 -0800 (PST)
Date: Tue, 18 Feb 2020 11:20:49 -0500
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 0/3] drm/mst: Add support for simultaneous down replies
Message-ID: <20200218162049.GE253734@art_vandelay>
References: <20200213211523.156998-1-sean@poorly.run>
 <b8dbe33bc62d9cd678b5af8cde2570f6c5754aeb.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8dbe33bc62d9cd678b5af8cde2570f6c5754aeb.camel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Wayne.Lin@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 06:33:17PM -0500, Lyude Paul wrote:
> On Thu, 2020-02-13 at 16:15 -0500, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > Hey all,
> > Earlier this week on my 5.5 kernel (I can't seem to get a 5.6 kernel to
> > behave on any of my devices), I ran into the multi-reply problem that
> > Wayne fixed in January. Without realizing there was already a fix
> > upstream, I went about solving it in different way. It wasn't until
> > rebasing the patches on 5.6 for the list that I realized there was
> > already a solution.
> > 
> > At any rate, I think this way of handling things might be a bit more
> > performant. I'm not super happy with the cleanliness of the code, I
> > think this series should make things easier to read, but I don't think I
> > achieved that. So suggestions are welcome on how to break this apart.
> 
> Honestly it looks a bit cleaner to me. Sideband message parsing in MST is
> pretty complex, so I'd think the code's probably always going to be messy to
> some extent.
> 
> My only suggestion with cleaning things up - maybe we should stop calling it
> building a sideband reply, and call it re-assembling one? Seems a little less
> confusing, since we're really just taking the rx chunks and reassembling them
> into a full sideband message. I know at least I constantly find myself
> forgetting those functions are for rx and not tx.

Good point, something like drm_dp_sideband_append_payload() might be more
descriptive and less confusing. I'm happy to change this if we decide to go
through with this set.

> 
> So, I will give my r-b for the whole series, but...
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> ...I think we should definitely look more into what Wayne's talking about
> before pushing this, and see if it's widespread enough of an issue to be a
> concern. It does kind of suck how slow MST probing can be, so I'd wonder if we
> could try your idea of rate limiting. My one concern there is I'm not actually
> sure if there's anything in the DP MST protocol that indicates how many
> messages a hub can handle at the same time - it's always supposed to just be
> two iirc.

I don't see an upper bound on pending downstream replies either. AFAICT from
reading the spec, each endpoint must support 2 concurrent message requests. A
forwarding device is responsible for reading the replies when it detects
DOWN_REP_MSG_RDY. So each forwarding device has the ability (and should) rate-
limit their own forwards.

I guess some forwarding devices might only read one reply when they get the IRQ
and not circle back for the rest? We could probably come up with a heuristic
for handling this, but it'd be a bit nasty and is probably not worth it (I'd
guess the vast majority of MST usecases are depth==1).

Sean



> 
> > Thanks,
> > 
> > Sean
> > 
> > Sean Paul (3):
> >   drm/mst: Separate sideband packet header parsing from message building
> >   drm/mst: Support simultaneous down replies
> >   drm/dp_mst: Remove single tx msg restriction.
> > 
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 196 ++++++++++++++------------
> >  include/drm/drm_dp_mst_helper.h       |  65 ++++-----
> >  2 files changed, 137 insertions(+), 124 deletions(-)
> > 
> -- 
> Cheers,
> 	Lyude Paul (she/her)
> 	Associate Software Engineer at Red Hat
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

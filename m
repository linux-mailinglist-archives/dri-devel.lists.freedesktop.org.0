Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B40681A6DA1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 22:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605BF89CB8;
	Mon, 13 Apr 2020 20:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE1489C55;
 Mon, 13 Apr 2020 20:54:39 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id c63so11045315qke.2;
 Mon, 13 Apr 2020 13:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CmUANt0t5HRisX+1yPc7U3xIxP+RuSCBBQhcshkOJkc=;
 b=LgJ7itCwDGKAQT06oAw2BcDstgGiPHC+qPyVPTx9ybSe4VOwbRJeEOlzNb6BvxDnOS
 2XgnpPZo/PeMNgs33VZjEjjFJrCjGMLq/LDmBeEoVsKRa/gYhqhVzdX6VpfV5c1WsdDb
 Aj/WTeawW/z2ZzlbQH+vu4WT9XoEiCbO8uKImj8xGcjacv4TtRF4ScJAKY19KIYAgdVo
 PzASu8J/wr4PPFlUFA8LHZ5GbuMxFN4sTCClw8xS9AlN9OrB6/B2YVsSXV7ZmardGUYh
 klTTzpuooyIxMkIHHmp5P1OpDDxjTJ/JG4/ujOLdOK9dYQLDp7enbLCZJhkbgUDfWnOG
 ENYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=CmUANt0t5HRisX+1yPc7U3xIxP+RuSCBBQhcshkOJkc=;
 b=J/pbAzBOSmalU7/32AYxtS0mlQva5y8GqDU0aYojAzaIaOKQYwy8nc/5rATouswA5R
 jKolLenqCYUglPxaGHnqBbyuRsomESI1EolEyc+w1FLmR/iwC9WE8JljrNyGJtZa2/8W
 Mu0PPWVJYDM1scTbI6i6YjgaDRzwnt6fhlQ2argMEMKaP2nB26b4dJY7suYCgrlcVkOp
 dXeHJG+LOA1soU7PBO0inGWFI+r1QsjaVohUZs8Xa43yuiPaLya1yanQKuy/AVNOpAmv
 EWLk43zpMhaYa00dRfTBho0Dm1eOXBbab025hY0Fx/Ui47EQR8TqNyALbOSnnBQcom10
 H/lw==
X-Gm-Message-State: AGi0PuY6l74+NO7fMIGSwlVPWvYt8HSRVzvH9v7m1M0GEaHRkkyu1VOx
 nNfK3+sD2JRTpFYt2ld136AYTzOk3Nw=
X-Google-Smtp-Source: APiQypIzzvZjRh+3uEsHBjkSiUmc3sI7rqlM0eWsVdJZctdk3taqOja42xDBh77J66TwtQR7pssH5Q==
X-Received: by 2002:a37:9145:: with SMTP id t66mr17886337qkd.314.1586811278746; 
 Mon, 13 Apr 2020 13:54:38 -0700 (PDT)
Received: from localhost ([199.96.181.106])
 by smtp.gmail.com with ESMTPSA id d23sm8987665qtj.9.2020.04.13.13.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 13:54:37 -0700 (PDT)
Date: Mon, 13 Apr 2020 16:54:36 -0400
From: Tejun Heo <tj@kernel.org>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [PATCH v2 00/11] new cgroup controller for gpu/drm subsystem
Message-ID: <20200413205436.GM60335@mtj.duckdns.org>
References: <20200226190152.16131-1-Kenny.Ho@amd.com>
 <CAOWid-eyMGZfOyfEQikwCmPnKxx6MnTm17pBvPeNpgKWi0xN-w@mail.gmail.com>
 <20200324184633.GH162390@mtj.duckdns.org>
 <CAOWid-cS-5YkFBLACotkZZCH0RSjHH94_r3VFH8vEPOubzSpPA@mail.gmail.com>
 <20200413191136.GI60335@mtj.duckdns.org>
 <CAOWid-dM=38faGOF9=-Pq=sxssaL+gm2umctyGVQWVx2etShyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-dM=38faGOF9=-Pq=sxssaL+gm2umctyGVQWVx2etShyQ@mail.gmail.com>
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, dri-devel <dri-devel@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Mon, Apr 13, 2020 at 04:17:14PM -0400, Kenny Ho wrote:
> Perhaps we can even narrow things down to just
> gpu.weight/gpu.compute.weight as a start?  In this aspect, is the key

That sounds great to me.

> objection to the current implementation of gpu.compute.weight the
> work-conserving bit?  This work-conserving requirement is probably
> what I have missed for the last two years (and hence going in circle.)
> 
> If this is the case, can you clarify/confirm the followings?
> 
> 1) Is resource scheduling goal of cgroup purely for the purpose of
> throughput?  (at the expense of other scheduling goals such as
> latency.)

It's not; however, work-conserving mechanisms are the easiest to use (cuz you
don't lose anything) while usually challenging to implement. It tends to
clarify how control mechanisms should be structured - even what resources are.

> 2) If 1) is true, under what circumstances will the "Allocations"
> resource distribution model (as defined in the cgroup-v2) be
> acceptable?

Allocations definitely are acceptable and it's not a pre-requisite to have
work-conserving control first either. Here, given the lack of consensus in
terms of what even constitute resource units, I don't think it'd be a good
idea to commit to the proposed interface and believe it'd be beneficial to
work on interface-wise simpler work conserving controls.

> 3) If 1) is true, are things like cpuset from cgroup v1 no longer
> acceptable going forward?

Again, they're acceptable.

> To be clear, while some have framed this (time sharing vs spatial
> sharing) as a partisan issue, it is in fact a technical one.  I have
> implemented the gpu cgroup support this way because we have a class of
> users that value low latency/low jitter/predictability/synchronicity.
> For example, they would like 4 tasks to share a GPU and they would
> like the tasks to start and finish at the same time.
> 
> What is the rationale behind picking the Weight model over Allocations
> as the first acceptable implementation?  Can't we have both
> work-conserving and non-work-conserving ways of distributing GPU
> resources?  If we can, why not allow non-work-conserving
> implementation first, especially when we have users asking for such
> functionality?

I hope the rationales are clear now. What I'm objecting is inclusion of
premature interface, which is a lot easier and more tempting to do for
hardware-specific limits and the proposals up until now have been showing
ample signs of that. I don't think my position has changed much since the
beginning - do the difficult-to-implement but easy-to-use weights first and
then you and everyone would have a better idea of what hard-limit or
allocation interfaces and mechanisms should look like, or even whether they're
needed.

Thanks.

-- 
tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

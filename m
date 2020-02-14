Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4628915F6AD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 20:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EE96E85F;
	Fri, 14 Feb 2020 19:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB326E85C;
 Fri, 14 Feb 2020 19:17:56 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id l21so7681003qtr.8;
 Fri, 14 Feb 2020 11:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2bDv0jVyoaqUAZCYtXw4PRnG3vvu6ogXS+PiWyXVnGQ=;
 b=ogbXgW9ewuGmJIGKdp7mK1xwjaEV448C9wRMZUb/UpM2qUxfj6kQmQ8YI/6OYFAoQ1
 luR+o1V+KBIaQyMsIVJNs0bEdQ9gHJQmqWJLN2W6XvGxC3T1Z35sfCCMib3C/wFp3sdc
 9Zxk6HrtSWgYljyCwbvwgny/YallHX+aY27ZMvcxno9Ox80WA0Un+eIfVBjDFqHiWKli
 2Jnls9HUxdWYnq57CdVGXws1lZjKaPqhnYv/yqvp3BD/NRNVpfaItfjgME/elE4BRKHx
 WHJWRHi9qIM7yRhB+1p808k+sKqB/KTo7wZR+FVlSs2JDxfOvrErluaL32I9aia9AN3j
 GxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=2bDv0jVyoaqUAZCYtXw4PRnG3vvu6ogXS+PiWyXVnGQ=;
 b=DUCNBsraHHx2dYTTJZd70e/z6vVy8KQDl4p1zeMaeyXRzAfMotIwbqJGvfxckM1fFa
 bhRHzX6hrGZg+MDImjj8vSCkyQJfUpa8Ad3GUtuUqhvZCKjTFs1SlL8qqMJVJXcCFMVy
 Mi7i7zsLbI4YIYcZUs3R169t3bxf1/NHGQxaYxmdtDazmQFn3slVqej+yq7f/Y3XQKL1
 VlNHs99lTC46DO/N9Eae496xyoYwDDCFZBo4tgxXmx4dALPLIIQtBLpY3BIlQUGeV9iH
 cBVYlqbHnn+rgCowrxwwyNIBPhystXATN+hxTemfn4cW+kKkTTq4Rk57HjthneMeW/yX
 BHSA==
X-Gm-Message-State: APjAAAVvDfbp2/3mQZHtZNRLUfJSlPQIOVMIEVExHc7EslUOK0m44KrB
 Col0a33vCrq7io5sTWHPqRs=
X-Google-Smtp-Source: APXvYqytUjdeIbKwbQxd6Th0soZnJasR/yjL1sgiAE3JeOhzZ+blcMoyfUQzZmkjOfux0H13K1BulQ==
X-Received: by 2002:ac8:4446:: with SMTP id m6mr3902660qtn.159.1581707875654; 
 Fri, 14 Feb 2020 11:17:55 -0800 (PST)
Received: from localhost ([2620:10d:c091:480::e8a3])
 by smtp.gmail.com with ESMTPSA id g11sm2293790qtc.48.2020.02.14.11.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 11:17:54 -0800 (PST)
Date: Fri, 14 Feb 2020 14:17:54 -0500
From: Tejun Heo <tj@kernel.org>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [PATCH 09/11] drm, cgroup: Introduce lgpu as DRM cgroup resource
Message-ID: <20200214191754.GA218629@mtj.thefacebook.com>
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
 <20200214155650.21203-10-Kenny.Ho@amd.com>
 <CAOFGe96N5gG+08rQCRC+diHKDAfxPFYEnVxDS8_udvjcBYgsPg@mail.gmail.com>
 <CAOWid-f62Uv=GZXX2V2BsQGM5A1JJG_qmyrOwd=KwZBx_sr-bg@mail.gmail.com>
 <20200214183401.GY2363188@phenom.ffwll.local>
 <CAOWid-caJHeXUnQv3MOi=9U+vdBLfewN+CrA-7jRrz0VXqatbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-caJHeXUnQv3MOi=9U+vdBLfewN+CrA-7jRrz0VXqatbQ@mail.gmail.com>
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
Cc: juan.zuniga-anaya@amd.com, Kenny Ho <Kenny.Ho@amd.com>, "Kuehling,
 Felix" <felix.kuehling@amd.com>, jsparks@cray.com, nirmoy.das@amd.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 lkaplan@cray.com, "Greathouse, Joseph" <joseph.greathouse@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Johannes Weiner <hannes@cmpxchg.org>,
 Alex Deucher <alexander.deucher@amd.com>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 damon.mcdougall@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, Kenny, Daniel.

(cc'ing Johannes)

On Fri, Feb 14, 2020 at 01:51:32PM -0500, Kenny Ho wrote:
> On Fri, Feb 14, 2020 at 1:34 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > I think guidance from Tejun in previos discussions was pretty clear that
> > he expects cgroups to be both a) standardized and c) sufficient clear
> > meaning that end-users have a clear understanding of what happens when
> > they change the resource allocation.
> >
> > I'm not sure lgpu here, at least as specified, passes either.
> 
> I disagree (at least on the characterization of the feedback
> provided.)  I believe this series satisfied the sprite of Tejun's
> guidance so far (the weight knob for lgpu, for example, was
> specifically implemented base on his input.)  But, I will let Tejun
> speak for himself after he considered the implementation in detail.

I have to agree with Daniel here. My apologies if I weren't clear
enough. Here's one interface I can think of:

 * compute weight: The same format as io.weight. Proportional control
   of gpu compute.

 * memory low: Please see how the system memory.low behaves. For gpus,
   it'll need per-device entries.

Note that for both, there one number to configure and conceptually
it's pretty clear to everybody what that number means, which is not to
say that it's clear to implement but it's much better to deal with
that on this side of the interface than the other.

cc'ing Johannes. Do you have anything on mind regarding how gpu memory
configuration should look like? e.g. should it go w/ weights rather
than absoulte units (I don't think so given that it'll most likely
need limits at some point too but still and there are benefits from
staying consistent with system memory).

Also, a rather trivial high level question. Is drm a good controller
name given that other controller names are like cpu, memory, io?

Thanks.

-- 
tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

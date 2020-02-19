Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 057E116598C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55A26ECFD;
	Thu, 20 Feb 2020 08:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5496EC52
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 16:18:52 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id z19so629196qkj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 08:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+JOOes2bh7NJXaLfWt9yc56BAE/Qm6gC729z4V5sKcU=;
 b=csRUDa/Ejq54urNswgoayxzet4LyIl0uoUy9NWvqQh+hfnLTXNlSTOMcMJiCWoPSYg
 EfliX+qvoUcQj0nyo6amZ10XzQkfjchxfnZcbLGK+Iwx/T9wVpKnMpoI81pR8ynOBSZL
 J5aHkxWXICss9qgHrl6PpXVQ+5cBKPb2LvX5CsmVZ4UwoPYL8Ohzami2hMafXKe2Jy8C
 xY26YWPJdc+vTH+1vepS4pHBhjbUkRqX+8AQSdmKbKSF0SaIw0P3s4S+gP+gbYuNY7QF
 uspWmMqlyepOETiyY2mNrFUq/kcxW9TSFxsq+kIRo63OtVQqORZlzIiHgX5070CbGgmI
 OJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+JOOes2bh7NJXaLfWt9yc56BAE/Qm6gC729z4V5sKcU=;
 b=TgblrvqmbbcEmvjqYVaRbgsZNYK8HJjpivYpcqwvsViq6I9BGQGAL90NT67CPPGf/P
 eGie3e8QSGl77ZcZmUsImur49Pv6s8xoPR78WWpfhImxUd6djNouWxcou435NOqKL1Ir
 f2SP4vqx7vIkm+30sQnG2e2VjpfTPoh6c/IFX9EaDcU8y60lX9SZzD/lHcQJRvNLKNC7
 NBR1sRfh7olTNW2lt6wJfmn4Ib/ddbRbTcJ8NAPlYI0FvaOp6sdNUPGJZke/Ym+VbmeD
 65arH2DSb4eui1ZhGFOOM9DILKRKAnW9eCWgE5/ODVxs3H0fgcXvLtmNNervgr8UYk2R
 JtRw==
X-Gm-Message-State: APjAAAVj0hJZZj2QSuGiH0JvIKHPC5X3d++7tBeksYcukqjn0+g6Y6gZ
 DGBeQ9fVAdd51Hc4NoOUwQCzZA==
X-Google-Smtp-Source: APXvYqwnAlc/cYrzIT/SHnniuUx3YB9zD3A/ySYPZyZ++OBQ0b3G7F0iAq3TMT0HXsp0HZf3tnuAKQ==
X-Received: by 2002:a05:620a:22e:: with SMTP id
 u14mr7978841qkm.278.1582129131790; 
 Wed, 19 Feb 2020 08:18:51 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::2:3bde])
 by smtp.gmail.com with ESMTPSA id 73sm213359qtg.40.2020.02.19.08.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 08:18:50 -0800 (PST)
Date: Wed, 19 Feb 2020 11:18:50 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 09/11] drm, cgroup: Introduce lgpu as DRM cgroup resource
Message-ID: <20200219161850.GB13406@cmpxchg.org>
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
 <20200214155650.21203-10-Kenny.Ho@amd.com>
 <CAOFGe96N5gG+08rQCRC+diHKDAfxPFYEnVxDS8_udvjcBYgsPg@mail.gmail.com>
 <CAOWid-f62Uv=GZXX2V2BsQGM5A1JJG_qmyrOwd=KwZBx_sr-bg@mail.gmail.com>
 <20200214183401.GY2363188@phenom.ffwll.local>
 <CAOWid-caJHeXUnQv3MOi=9U+vdBLfewN+CrA-7jRrz0VXqatbQ@mail.gmail.com>
 <20200214191754.GA218629@mtj.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214191754.GA218629@mtj.thefacebook.com>
X-Mailman-Approved-At: Thu, 20 Feb 2020 08:45:37 +0000
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
 Kenny Ho <y2kenny@gmail.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Alex Deucher <alexander.deucher@amd.com>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 damon.mcdougall@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 02:17:54PM -0500, Tejun Heo wrote:
> Hello, Kenny, Daniel.
> 
> (cc'ing Johannes)
> 
> On Fri, Feb 14, 2020 at 01:51:32PM -0500, Kenny Ho wrote:
> > On Fri, Feb 14, 2020 at 1:34 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > I think guidance from Tejun in previos discussions was pretty clear that
> > > he expects cgroups to be both a) standardized and c) sufficient clear
> > > meaning that end-users have a clear understanding of what happens when
> > > they change the resource allocation.
> > >
> > > I'm not sure lgpu here, at least as specified, passes either.
> > 
> > I disagree (at least on the characterization of the feedback
> > provided.)  I believe this series satisfied the sprite of Tejun's
> > guidance so far (the weight knob for lgpu, for example, was
> > specifically implemented base on his input.)  But, I will let Tejun
> > speak for himself after he considered the implementation in detail.
> 
> I have to agree with Daniel here. My apologies if I weren't clear
> enough. Here's one interface I can think of:
> 
>  * compute weight: The same format as io.weight. Proportional control
>    of gpu compute.
> 
>  * memory low: Please see how the system memory.low behaves. For gpus,
>    it'll need per-device entries.
> 
> Note that for both, there one number to configure and conceptually
> it's pretty clear to everybody what that number means, which is not to
> say that it's clear to implement but it's much better to deal with
> that on this side of the interface than the other.
> 
> cc'ing Johannes. Do you have anything on mind regarding how gpu memory
> configuration should look like? e.g. should it go w/ weights rather
> than absoulte units (I don't think so given that it'll most likely
> need limits at some point too but still and there are benefits from
> staying consistent with system memory).

Yes, I'd go with absolute units when it comes to memory, because it's
not a renewable resource like CPU and IO, and so we do have cliff
behavior around the edge where you transition from ok to not-enough.

memory.low is a bit in flux right now, so if anything is unclear
around its semantics, please feel free to reach out.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5EF345F3E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 14:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638B46E857;
	Tue, 23 Mar 2021 13:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73776E8F7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 13:15:08 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v11so20714565wro.7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 06:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=8lz3lDk13H1M2ymaJV1txo9yAd3G66LPnXWxpBCwGC8=;
 b=aqwQ8INpvvw/8hSSkL2yFRZQ/5FKsb6N4k2DX49lCIQ7IkwfhQ7opbL1FYgSNm4a8B
 S7YvGusAzEdOzzRp3SmT8OZOlMWx4SL/1wVo3TtykDDS++Hlrjq1Mx0aaJAvVL9RDLM9
 kLL/vnRw36iDcw7oNf1ZsIY0Bso+i0dOBhhtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=8lz3lDk13H1M2ymaJV1txo9yAd3G66LPnXWxpBCwGC8=;
 b=q3t5ouwmmrmZMBHTbSKqA7jMAaUevpyGv5g6eF/or5i3xmAbwFkdtbuo3+pZ6MLhnd
 zPLpcNjL8I5FdrVdkQ0xO544oKEvDSyrDiqt3dE7WGtbvAx54Gf1a+gufCpNDuUhNqOm
 X/bysUPgVA+SCouZcO79NwE7A6103VTDjztmKSpW/BtNq279oRDe9P7epQZOR5bJkR+e
 guu0UAznUMd5ghB+Jb7uc7mEBWlCWYRmSWSlf90xHE0xQCX22l8oNWgIpIBkW/ME9boA
 BH0K9kQt25gsvE7BLsr6K7WqYNsls/UTe2dY1Bv9+hvREFCACCdul/BsjAemnM+mouvi
 Jt5w==
X-Gm-Message-State: AOAM533aV881SlgXDr/k2Bih1GxwQdMhhm4zMzqZkQd33L054BtA+T5r
 98CNx9QU8eyBwVSxCtSsetyuiA==
X-Google-Smtp-Source: ABdhPJywDfPOd6wXKDUxUiwLpU18IcUiEdVHqY4oHohRVLm0NQywzWa+WVQFgaVsa9S9fs5+ie+RYQ==
X-Received: by 2002:adf:ec46:: with SMTP id w6mr3894009wrn.213.1616505307255; 
 Tue, 23 Mar 2021 06:15:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s83sm2704385wms.16.2021.03.23.06.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 06:15:06 -0700 (PDT)
Date: Tue, 23 Mar 2021 14:15:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
Message-ID: <YFnp2e2jGrtM7iGx@phenom.ffwll.local>
Mail-Followup-To: Michal Hocko <mhocko@suse.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Matthew Wilcox <willy@infradead.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
References: <e6e9df3e-cd2b-d80f-205d-6ca1865819b2@gmail.com>
 <YFigZ5+H95c/GI/S@phenom.ffwll.local>
 <20210322140548.GN1719932@casper.infradead.org>
 <YFi+UROYbQERYEEr@dhcp22.suse.cz>
 <CAKMK7uGM6EJvzktrANyeeemRPoW7O0ka-ZyKi==wL1zt3yM=5w@mail.gmail.com>
 <c78457bb-d93a-ff84-1cce-0fb3fa9f0cec@gmail.com>
 <YFma+ZxncvfBd++o@dhcp22.suse.cz>
 <YFnQ1Lk6BTo8L7pr@phenom.ffwll.local>
 <cd17d2ca-140e-1e69-37ac-c2726cc1ef9f@gmail.com>
 <YFnZMzs2wYGWqowi@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFnZMzs2wYGWqowi@dhcp22.suse.cz>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 01:04:03PM +0100, Michal Hocko wrote:
> On Tue 23-03-21 12:48:58, Christian K=F6nig wrote:
> > Am 23.03.21 um 12:28 schrieb Daniel Vetter:
> > > On Tue, Mar 23, 2021 at 08:38:33AM +0100, Michal Hocko wrote:
> > > > I think this is where I don't get yet what Christian tries to do: We
> > > > really shouldn't do different tricks and calling contexts between d=
irect
> > > > reclaim and kswapd reclaim. Otherwise very hard to track down bugs =
are
> > > > pretty much guaranteed. So whether we use explicit gfp flags or the
> > > > context apis, result is exactly the same.
> > =

> > Ok let us recap what TTMs TT shrinker does here:
> > =

> > 1. We got memory which is not swapable because it might be accessed by =
the
> > GPU at any time.
> > 2. Make sure the memory is not accessed by the GPU and driver need to g=
rab a
> > lock before they can make it accessible again.
> > 3. Allocate a shmem file and copy over the not swapable pages.
> =

> This is quite tricky because the shrinker operates in the PF_MEMALLOC
> context so such an allocation would be allowed to completely deplete
> memory unless you explicitly mark that context as __GFP_NOMEMALLOC. Also
> note that if the allocation cannot succeed it will not trigger reclaim
> again because you are already called from the reclaim context.

[Limiting to that discussion]

Yes it's not emulating real (direct) reclaim correctly, but ime the
biggest issue with direct reclaim is when you do mutex_lock instead of
mutex_trylock or in general block on stuff that you cant. And lockdep +
fs_reclaim annotations gets us that, so pretty good to make sure our
shrinker is correct.

Actual tuning of it and making sure it's not doing silly things is ofc a
different thing, and for that we can't test it in isolation. But it's good
to know that before you tune it, you have rather high confidence it's
at least correct. And for that not running with PF_MEMALLOC is actually
good, since it means more allocation failures, so more testing of those
error/backoff paths in the code.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

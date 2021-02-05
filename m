Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA76310D46
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 16:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969A16E1D2;
	Fri,  5 Feb 2021 15:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D49A6E1D2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 15:39:51 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id p15so8127871wrq.8
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 07:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=33iEg0Lzg2Scz+ykUwbjbp3zOqxp5drs4CJ+cvBOqgU=;
 b=hVpQoCeLL3cUg4rnqfXztHEfkItcdom7HyQiIPiofzBFBzwrrzBs+0NZeMWjqfKfF/
 0ZczgPrEqUjX3q4+iMKmi0AAFJAU1H7y+/Uhc5JNeF4Iw2cxVuaoBO/aWwBr2hA8iuzN
 vrU74JhDuZMXJZTtSW+qbqsC0y/4F5ICD3+MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=33iEg0Lzg2Scz+ykUwbjbp3zOqxp5drs4CJ+cvBOqgU=;
 b=USo04dm84ZGFQwPNy+MLp8dVkLu1ZUJLDXxZJs6Ty0HDGv6oBkYicP3D/NbPINTKK6
 Q+l08F3lP4wcs/ZJilxvLxaigdHaUr26LoG56IldWMnVlaLiBp+6o+19ofGGHQc06Hlg
 NeyxD43oWn4Me8mDuZawja1p4fN+Ks3wGxVOo6CtE/08uMgec14l8+SQvf283Zr5qVFE
 tibPZGaLt625MGg24BbRTifoKWtA74ouzXHr9rc7wmU7rrJ4G8+DaVdftE4iewdOU4Xj
 2WGf9OQdlf3WWKV4XZWnmmAEmvPlVc03OfLG4VAQ4iWCM1rdhwit0hyXq0a7z0gQ6TgH
 D+AQ==
X-Gm-Message-State: AOAM530YNPtNcBFyaACX4YKinWdPokG7a9oDnjt/YLaj84T9bYNVgk+8
 4ye6Y8BYwv+aNGS4pP++DTWgMQ==
X-Google-Smtp-Source: ABdhPJySzTyhnQ1ckfeV9CnQVBMBiqqfk1ZpMohKuWGas+Al69+ZycglOALtd8ry33SSwp4Ppt2mFA==
X-Received: by 2002:a05:6000:1543:: with SMTP id
 3mr5759016wry.254.1612539589783; 
 Fri, 05 Feb 2021 07:39:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o83sm3476354wme.37.2021.02.05.07.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:39:48 -0800 (PST)
Date: Fri, 5 Feb 2021 16:39:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
Message-ID: <YB1mw/uYwueFwUdh@phenom.ffwll.local>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
 <5e4ac17d-1654-9abc-9a14-bda223d62866@nvidia.com>
 <CADnq5_M2YuOv16E2DG6sCPtL=z5SDDrN+y7iwD_pHVc7Omyrmw@mail.gmail.com>
 <20210204182923.GL4247@nvidia.com>
 <CADnq5_N9QvgAKQMLeutA7oBo5W5XyttvNOMK_siOc6QL+H07jQ@mail.gmail.com>
 <8e731fce-95c1-4ace-d8bc-dc0df7432d22@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e731fce-95c1-4ace-d8bc-dc0df7432d22@nvidia.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 11:00:32AM -0800, John Hubbard wrote:
> On 2/4/21 10:44 AM, Alex Deucher wrote:
> ...
> > > > The argument is that vram is a scarce resource, but I don't know if
> > > > that is really the case these days.  At this point, we often have as
> > > > much vram as system ram if not more.
> > > 
> > > I thought the main argument was that GPU memory could move at any time
> > > between the GPU and CPU and the DMA buf would always track its current
> > > location?
> > 
> > I think the reason for that is that VRAM is scarce so we have to be
> > able to move it around.  We don't enforce the same limitations for
> > buffers in system memory.  We could just support pinning dma-bufs in
> > vram like we do with system ram.  Maybe with some conditions, e.g.,
> > p2p is possible, and the device has a large BAR so you aren't tying up
> > the BAR window.

Minimally we need cgroups for that vram, so it can be managed. Which is a
bit stuck unfortunately. But if we have cgroups with some pin limit, I
think we can easily lift this.

> Excellent. And yes, we are already building systems in which VRAM is
> definitely not scarce, but on the other hand, those newer systems can
> also handle GPU (and NIC) page faults, so not really an issue. For that,
> we just need to enhance HMM so that it does peer to peer.
> 
> We also have some older hardware with large BAR1 apertures, specifically
> for this sort of thing.
> 
> And again, for slightly older hardware, without pinning to VRAM there is
> no way to use this solution here for peer-to-peer. So I'm glad to see that
> so far you're not ruling out the pinning option.

Since HMM and ZONE_DEVICE came up, I'm kinda tempted to make ZONE_DEVICE
ZONE_MOVEABLE (at least if you don't have a pinned vram contigent in your
cgroups) or something like that, so we could benefit from the work to make
sure pin_user_pages and all these never end up in there?

https://lwn.net/Articles/843326/

Kind inspired by the recent lwn article.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

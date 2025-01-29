Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90455A21E22
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 14:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A0310E0D7;
	Wed, 29 Jan 2025 13:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="XWC0ytNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C7810E06C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 13:47:59 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-467a3f1e667so41886761cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 05:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1738158479; x=1738763279; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TGxs1D5kHZWfV3TMw8ydKze6LYDZn037JbgBy8rBgVo=;
 b=XWC0ytNFtdHYpPu1IhbMjjVcjVyUgdC+oq3yfh6bErdKGIkhBSKV1WZbcFjnYLitBq
 77vYJOuMrPAeHfHUBH/1hwvz/ymG2mAgfy/VnZ+zJomtjXYwmRXiNcHV5eCfZHlfHmuF
 DbPxw7MunzVhnORcMrz9C9ZJG85UwxQ8YSD82wxKJqetlAdunrxfK0qfVCExWdVBh8qG
 plJLTW7bzxji1cvez5oL8T64Ma9sRL9e1bc7+ffw+mUDCwy3gRGPy8ExOTemR+xwB3gC
 6IUhQJxULZPLZ5Pni6PuwkHb9wTgwvAvdPPLoa+Qpz90AheuKrfjNyBBWuAbljqWDs1h
 gEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738158479; x=1738763279;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TGxs1D5kHZWfV3TMw8ydKze6LYDZn037JbgBy8rBgVo=;
 b=XQrcu79VnZdq49sqXsVxkB2H+aRsGpEtBdcGsbT71Zg75cQVtT7ZijzOUY01qzJXmJ
 t9a9c3IrzqY1S/sCCa2v5a9/DYUsUnqIfGtjgFAR2lECS/t6Qp2KhYgorgSketwyygAq
 CJb5twA+J4jlSDvF8BafLxAaCynAOYCAi/8azuk4PHh08rAzhNZGUlIFL1UwGE6NFLqs
 1NziVJN1tvvunXaxmU9L2iC7QleMQsVORjadO5wAmP7lCXRIXwsFnrVGiRKMVg6ytdJj
 tHrH+EUUht04h+t96NkTf28gsaWiWHqsEBI7NU4stWXy0Z+I9U9j/Defg/OO8o41tCwE
 FLLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgLzKvZfFL4A6A6gyORNJ7SvhXP7cWxaNU4LnVQo4fOfl0ycCl9TFGYYR0O1OQroO4YxMHQVnBQq4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj0U4Zhk900Vxzll11OGBZMe8mTLcZVsEMIDhgJ1j/qSakSjRD
 0l3ipM7yt9d5wZWw0fJPMEKGCeMS5fHDJfKnMMR53fgUbsCfprE54PQQGW98qQ8=
X-Gm-Gg: ASbGncuVF4LIJ/+gPsmU0htzXiVhwGASUhGEnypfZ+XLtSfOU6UyEoPA8Kr9WkfnP/E
 ZNqaSMDKIlJMRUWOGdcK+PgpednNcMbVPuK20hZmopuM86ML5I6c+A7x2iaV4baU1CM/XBKW5F0
 wBAjZ2bjHiy4rPhTFPH+sLSh0poZVvvDhS84KhBplzAyihyuQh0CAEl7eSurJ10ATNoGOh2uNqF
 nTU9yqRDvj82l4O4IzaQpDrE34+MPZwO13bVdZjlU3zbp/JdGEvx2ka+YMXk+PQ6ppmKt5E3yEH
 QXhVeG0I2hwdDzk44qYgGJbmtsuNFyLnpVdX8Y4GEzyz2MXD9Ac8l7U7iKSiemO9
X-Google-Smtp-Source: AGHT+IHuYCAk+wYHqjFRDvmI1uuhKYfRXYz+H9jof+ajiAjSs3miFEirWAObJrrIBPKksD6vvP2lVg==
X-Received: by 2002:ac8:5a08:0:b0:46c:782f:5f85 with SMTP id
 d75a77b69052e-46fd0b98596mr53288201cf.52.1738158478735; 
 Wed, 29 Jan 2025 05:47:58 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46e66b67680sm62281881cf.60.2025.01.29.05.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 05:47:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1td8Q9-00000009BlF-1by8;
 Wed, 29 Jan 2025 09:47:57 -0400
Date: Wed, 29 Jan 2025 09:47:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, GalShalom@nvidia.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <20250129134757.GA2120662@ziepe.ca>
References: <20241201103659.420677-1-ymaman@nvidia.com>
 <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
 <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
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

On Wed, Jan 29, 2025 at 02:38:58PM +0100, Simona Vetter wrote:

> > The pgmap->owner doesn't *have* to fixed, certainly during early boot before
> > you hand out any page references it can be changed. I wouldn't be
> > surprised if this is useful to some requirements to build up the
> > private interconnect topology?
> 
> The trouble I'm seeing is device probe and the fundemantal issue that you
> never know when you're done. And so if we entirely rely on pgmap->owner to
> figure out the driver private interconnect topology, that's going to be
> messy. That's why I'm also leaning towards both comparing owners and
> having an additional check whether the interconnect is actually there or
> not yet.

Hoenstely, I'd rather invest more effort into being able to update
owner for those special corner cases than to slow down the fast path
in hmm_range_fault..

The notion is that owner should represent a contiguous region of
connectivity. IMHO you can always create this, but I suppose there
could be corner cases where you need to split/merge owners.

But again, this isn't set in stone, if someone has a better way to
match the private interconnects without going to driver callbacks then
try that too.

I think driver callbacks inside hmm_range_fault should be the last resort..

> You can fake that by doing these checks after hmm_range_fault returned,
> and if you get a bunch of unsuitable pages, toss it back to
> hmm_range_fault asking for an unconditional migration to system memory for
> those. But that's kinda not great and I think goes at least against the
> spirit of how you want to handle pci p2p in step 2 below?

Right, hmm_range_fault should return pages that can be used and you
should not call it twice.

Jason

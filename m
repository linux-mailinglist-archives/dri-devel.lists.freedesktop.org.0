Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AC8A22DA4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADA310E34D;
	Thu, 30 Jan 2025 13:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="iQadx/uK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFE110E33B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:23:19 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6e1a41935c3so10323726d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 05:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1738243399; x=1738848199; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4xPSZzw/OoNchPOgrFnhgjUTxZA4+QRO6/LNv63tO8=;
 b=iQadx/uKf9wswHn5dsfoDpneGipPAMnDKUPsOfCNwwOOA9XZfBPssLMOrWafbTAk7j
 oe+4rlmQL6LUL2i1DsWECQVSPIwzA26Tb5rns48pPE/pYwxMjr4MVq/dr8V4EspdO+yj
 fSMiwuIBqtU2k6JwY+XOUz8Rsh2b9Oa0ilOercw5SRNKPOuknpl3f1QeZDZUsR/ihO5b
 5C6tVs3VEp9m4E5GjlvgrB3eGlm56ZW9RAG2PbdH1nM4Gqpwy+UjqkhKhuAz0UicBWrG
 mW8SgggJ0azXYiS3gYwhYFafKgnvIuVy/JeCKlFY2ME+XeQpblqN31xRHzyF66kFhnkW
 FrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738243399; x=1738848199;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z4xPSZzw/OoNchPOgrFnhgjUTxZA4+QRO6/LNv63tO8=;
 b=QTGp+LFd/3A4RpuxJC5quuiakm5z8MDToGXj2BiaGoylWnXh6RDdxoB4AaiBPk+SKW
 h3MolNx6v3Ghxj8h8v+zOsH7R9zKtBwEsiByHmYS9VZsr9gRDkVrdv6EjfyuNMK7wccr
 /Z3H0T78KW1kX991WRc15oTDXR/E8/2YBlfAuDrm3nvHu4AAL21esaTaLJHi0KEjLsd7
 mUR7U7y8O1TeUTcb2/tw3UiU2ZoanRQnrRN/kirid/MQt4v8tPFWv8xENewlhtGnQdlP
 6JtS2nYjlfR7dBkUVpz+3u3esfczT+HZOyLaizyngN39O9iSdmXDyLiSw7SI9+/iwbSi
 8s9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6b5dW1rez2RSeOfE6jHMc7GJGQzMs1y8Hd/UzNZip4a4eSun4RCueS2zNgI1wF9E+bwF8+Fn4Rig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3le43XKXs5EoBBZXU0l7EJN++xsbFx7fqsd4HeurhuMkS555S
 83f2SbECNb4BBIj09FcwJWFXHUGnmJP9yudIKGAP08m89R5HVF7qr08EX7M+p74=
X-Gm-Gg: ASbGncsd0un+LylR4Z9G1qMq250yOXCrG4Y2HT2u75W5JX8fm8QKs+W/vdvy9YQ5dKg
 Z/KqCoPCYNvaXPKL256MoC8736NH+4HxerSVS9a5eLu0jQ2eXL/aTPeQMSEHQSMtPZvD6jj+TNb
 w7Ybj0FzHpV2JB9rwvX1OsVVhVXf5wfwezaJEiYogQpTCCy4+mz6g2eoorklYw3hewsIV257nc5
 1jE0kVDWYY/41UmVDR5fZcAetRf9eN0o6k9EIYRYeJ3R3MqQpkOwcRRmMmtkQPGY+67rKDK1Xah
 oBQfQ7j2W2zWeWDWrOf1RiWeApqBLw2AWoXmkb2INLBhM7zglDO2uRC5iqlWys4M
X-Google-Smtp-Source: AGHT+IGu3gG6c418DyCLyq64UOVytvPPjptyLj9HsxmCFyjptBXKcCidLbQRWokyMo3VhHjgkQmzrQ==
X-Received: by 2002:ad4:5d63:0:b0:6d8:aa45:a8a2 with SMTP id
 6a1803df08f44-6e243bbbb2bmr94974656d6.11.1738243398854; 
 Thu, 30 Jan 2025 05:23:18 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e2549222cesm6056236d6.83.2025.01.30.05.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 05:23:18 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1tdUVp-00000009YDe-2eaQ;
 Thu, 30 Jan 2025 09:23:17 -0400
Date: Thu, 30 Jan 2025 09:23:17 -0400
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
Message-ID: <20250130132317.GG2120662@ziepe.ca>
References: <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
 <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
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

On Thu, Jan 30, 2025 at 11:50:27AM +0100, Simona Vetter wrote:
> On Wed, Jan 29, 2025 at 09:47:57AM -0400, Jason Gunthorpe wrote:
> > On Wed, Jan 29, 2025 at 02:38:58PM +0100, Simona Vetter wrote:
> > 
> > > > The pgmap->owner doesn't *have* to fixed, certainly during early boot before
> > > > you hand out any page references it can be changed. I wouldn't be
> > > > surprised if this is useful to some requirements to build up the
> > > > private interconnect topology?
> > > 
> > > The trouble I'm seeing is device probe and the fundemantal issue that you
> > > never know when you're done. And so if we entirely rely on pgmap->owner to
> > > figure out the driver private interconnect topology, that's going to be
> > > messy. That's why I'm also leaning towards both comparing owners and
> > > having an additional check whether the interconnect is actually there or
> > > not yet.
> > 
> > Hoenstely, I'd rather invest more effort into being able to update
> > owner for those special corner cases than to slow down the fast path
> > in hmm_range_fault..
> 
> I'm not sure how you want to make the owner mutable.

You'd probably have to use a system where you never free them until
all the page maps are destroyed.

You could also use an integer instead of a pointer to indicate the
cluster of interconnect, I think there are many options..

> And I've looked at the lifetime fun of unregistering a dev_pagemap for
> device hotunplug and pretty firmly concluded it's unfixable and that I
> should run away to do something else :-P

? It is supposed to work, it blocks until all the pages are freed, but
AFAIK ther is no fundamental life time issue. The driver is
responsible to free all its usage.

> An optional callback is a lot less scary to me here (or redoing
> hmm_range_fault or whacking the migration helpers a few times) looks a lot
> less scary than making pgmap->owner mutable in some fashion.

It extra for every single 4k page on every user :\

And what are you going to do better inside this callback?

Jason

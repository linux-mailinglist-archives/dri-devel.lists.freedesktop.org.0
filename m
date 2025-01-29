Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9578A21DF1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 14:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CBD10E04F;
	Wed, 29 Jan 2025 13:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Kd+hbita";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6654A10E04F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 13:39:04 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso48808255e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 05:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738157942; x=1738762742; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ekPyuSS82CPNI1Lh/E6IsIbzoEEGT2LSw6fRdzUam+8=;
 b=Kd+hbitaPFwi3dfoMSBaIgNshfGno/ktIfsEHAbKD1KU+hllXiRucOo2SixWF4lIdl
 uxVACD6pjZEzr8FdF1zOYM3fO8Ed57cC1tNFEqK2roBdqnZzi3AQzOZBfPKv1kB11Yt5
 4fNH0kY3GfOTu9pyoiLQFdOAeOGpn7IDnYZXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738157942; x=1738762742;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ekPyuSS82CPNI1Lh/E6IsIbzoEEGT2LSw6fRdzUam+8=;
 b=q4X1BddwL3HMOMptbcFmwsYUTFXsEJHZL2uhps6NTxu+GQhu9b9HpdW4QSeARLUYKw
 7wyEiVoR86229Ih2QWT6CN6xLyKOa9XYgn+eMSsp1fcsilxYoDat4GsanT+UrCIVvQhz
 SV/u/lUg2ChC3LFpyrBDAlw+wmCxZ2h5qVU1/Jj003k750AbQs6JKuzrAdU3wXMvry3N
 dG3XaHbykdaiZoCGeAg/ARLs6Oe0IKpY4XNZQkaRR/agXw3kgrXBR7wnQGkGRskb/e2v
 V8vPqEs48jDo5LqKi6V85R/TNXVGsgm09lJS0IaRdXnbsdShp5hghjX3F005cY125KuQ
 4FPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+wUmKkvwKRe3ZpdFLzYAHKHuwxEsF0HfTwYlvoLjTH+4yKYAKe5FiWL1LgSrXp54S4z4OCcx1O5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymshVe4op3CJCOAU9bn2KRKYO1ixffAGBYg1EB6ZIa9Vc5HnPp
 5l+wBd875UHI2VPR64ndirAqjeU51uJ7ZiiKY2GBk0BZlKG7XR/14ZD0E5+OY6g=
X-Gm-Gg: ASbGnctByjkJuSD+x5PhnZRrc6Q+uSYy0I6fs3Let4H3XhLSTPoJVZgcl1YuYQ9ib3q
 v/IQ+3xpafJJLvnILegLW31nlvGrsXSa8tQSJ8oQuHm84xIlmpN44VvlaVe6O0a7LaaQK6ej0ov
 5++Ndd1WikIbUDEfIgl9JqFeN1kPKU5ougHEtpO711hCs4gw7gFrJya4jfgE6GnumoOsfXOaSUU
 /dgYx4oPBJJvrWXPDUz8DikwS45YYrFu0SdDPCiAxrzoMNKw1B9AWy50sWR+8vwvlqwkyS5NtTB
 h+LjLpvFWQsUmqavWWnUcKEKI78=
X-Google-Smtp-Source: AGHT+IFp40yYl/FrcEC18d1HA1Wbr1YBHRju+Twtn7vgv1BIenNhcb0w0RrYUn5K84MH3BCfQBYGmw==
X-Received: by 2002:a05:600c:5486:b0:433:c76d:d57e with SMTP id
 5b1f17b1804b1-438dc3a40d3mr30211795e9.5.1738157942387; 
 Wed, 29 Jan 2025 05:39:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc263f0sm23501465e9.9.2025.01.29.05.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 05:39:01 -0800 (PST)
Date: Wed, 29 Jan 2025 14:38:58 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, GalShalom@nvidia.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, GalShalom@nvidia.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, linux-tegra@vger.kernel.org
References: <20241201103659.420677-1-ymaman@nvidia.com>
 <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
 <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128172123.GD1524382@ziepe.ca>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Tue, Jan 28, 2025 at 01:21:23PM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 28, 2025 at 05:32:23PM +0100, Thomas Hellström wrote:
> > > This series supports three case:
> > > 
> > >  1) pgmap->owner == range->dev_private_owner
> > >     This is "driver private fast interconnect" in this case HMM
> > > should
> > >     immediately return the page. The calling driver understands the
> > >     private parts of the pgmap and computes the private interconnect
> > >     address.
> > > 
> > >     This requires organizing your driver so that all private
> > >     interconnect has the same pgmap->owner.
> > 
> > Yes, although that makes this map static, since pgmap->owner has to be
> > set at pgmap creation time. and we were during initial discussions
> > looking at something dynamic here. However I think we can probably do
> > with a per-driver owner for now and get back if that's not sufficient.
> 
> The pgmap->owner doesn't *have* to fixed, certainly during early boot before
> you hand out any page references it can be changed. I wouldn't be
> surprised if this is useful to some requirements to build up the
> private interconnect topology?

The trouble I'm seeing is device probe and the fundemantal issue that you
never know when you're done. And so if we entirely rely on pgmap->owner to
figure out the driver private interconnect topology, that's going to be
messy. That's why I'm also leaning towards both comparing owners and
having an additional check whether the interconnect is actually there or
not yet.

You can fake that by doing these checks after hmm_range_fault returned,
and if you get a bunch of unsuitable pages, toss it back to
hmm_range_fault asking for an unconditional migration to system memory for
those. But that's kinda not great and I think goes at least against the
spirit of how you want to handle pci p2p in step 2 below?

Cheers, Sima

> > >  2) The page is DEVICE_PRIVATE and get_dma_pfn_for_device() exists.
> > >     The exporting driver has the option to return a P2P struct page
> > >     that can be used for PCI P2P without any migration. In a PCI GPU
> > >     context this means the GPU has mapped its local memory to a PCI
> > >     address. The assumption is that P2P always works and so this
> > >     address can be DMA'd from.
> > 
> > So do I understand it correctly, that the driver then needs to set up
> > one device_private struct page and one pcie_p2p struct page for each
> > page of device memory participating in this way?
> 
> Yes, for now. I hope to remove the p2p page eventually.
> 
> > > If you are just talking about your private multi-path, then that is
> > > already handled..
> > 
> > No, the issue I'm having with this is really why would
> > hmm_range_fault() need the new pfn when it could easily be obtained
> > from the device-private pfn by the hmm_range_fault() caller? 
> 
> That isn't the API of HMM, the caller uses hmm to get PFNs it can use.
> 
> Deliberately returning PFNs the caller cannot use is nonsensical to
> it's purpose :)
> 
> > So anyway what we'll do is to try to use an interconnect-common owner
> > for now and revisit the problem if that's not sufficient so we can come
> > up with an acceptable solution.
> 
> That is the intention for sure. The idea was that the drivers under
> the private pages would somehow generate unique owners for shared
> private interconnect segments.
> 
> I wouldn't say this is the end all of the idea, if there are better
> ways to handle accepting private pages they can certainly be
> explored..
> 
> Jason

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

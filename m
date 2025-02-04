Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40313A272B6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 14:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9788D10E645;
	Tue,  4 Feb 2025 13:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="D/DJmxfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E51B10E645
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 13:26:17 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6dcdf23b4edso47527416d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 05:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1738675576; x=1739280376; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AVp4b+FFVRvgHW7eQGwrIGJ0Ud3zrEOqDnH6Jl7Uugg=;
 b=D/DJmxfmOqDE6SolU0VhraPAa8rML326gKhetO7LOgVWW6QJuWN0+RDwQe1NlpXlVp
 gCZO3coL5NFx0np5yhyX+FHyMbVJjvzaxZBYLEGjSECedY/mqWhgCAxTbqgq0tmiy3yt
 CPWpXnT1g1SW7eyl3QgxYDpjV4IiYs8z9QU5X1PVQUVVZKJDQ5X4Dwnfi+Cr3bM6uNq7
 YHOfb6rQSdfAhlhBhQKFT6mNZCnHaJkBFHKMsRX13KVCrsfsmCHDs2s6dvhZtpAP0xMC
 XwapmzoB6jSL3QoK7FmSv4iy0gc0QV5Sn8/NsRS9wYJos06lS7ImVuu2egoQ86e7SPhP
 Ao5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738675576; x=1739280376;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AVp4b+FFVRvgHW7eQGwrIGJ0Ud3zrEOqDnH6Jl7Uugg=;
 b=lUFyZVOUOCoo+1EFEQSQAUYFF/RioDpw7bc4kKhCNCQQrJn0yQYlAFzv23GdQK+Y6Q
 tBGl6+HzfkF4v6CYGGCZm7/CQ7Ohv8LsHpy8dYygdEtFXxAxf8Q8PZ0E1q96Y0cwH4Ph
 12RedMSwtWg3U/rj6dJiCcfkxMu7lF7pE/LDc8ZX1gZ59apqV/BRkZm7gkSO90yrzFIs
 gYU4V5/homL0l9PQ2QrcFFpJdbOph25osHsvScePolXDdQDrTL3pDBERTsyxxBfAlPZ3
 UpE24KGJShDheYiFmw3oY1K43bFhuva2FnAxq2iCR0ooA79XbYooMLtJ2h2hs+i0Vl5J
 sPAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXuPTVMqloFkHDz8S0Wsy+IW9BPFn20lOfglU3WZ5HeJ7TJpaHdRVYqINnT9ozjv8RV14oUlyaE94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnfDQvT6vbZQalrPXyBEhJXnKJnjH83uDKI0B2U6wwcbFUcZDg
 OgcPo/rNuZQLI0PH623OMQrWfg5xuvD7PWtpa6dzUn9vsA2fHolzO5vsTQ0Kz9E=
X-Gm-Gg: ASbGncuLxvdmQ7xjnFT12vU30WvBB2WU7QUXBYTXLHxA6fRL6+8xSrIoJzC0lfbpLuO
 8WqaQ5A7S4sPTMCfE2e5W1pcHnOxFK70M4cWrGRnZCNwQENX/dIiSVPjHY3/H1FVxNXhKm7Kf1y
 gkx7WJcFUhKAnazHpmnUlOfAAoVWviQkh18fqDhSs70Z5AtnV7AZWA7rREC+rp2/KuxGALSGc5B
 vTA7cD/2kdNBGGdbbWYmr09RcEdjxzbEv4aah0qTJHK3B4cRSx2dh81kr0wLyNp/tdCAhZK2WM7
 xDg6YuleEaipi3Tyuof+On8Gl4JGZcSs2fXNj/j+Ms1aA5Zo6PZBYnJlAwNgKwfZ
X-Google-Smtp-Source: AGHT+IHlCOKBY+zoBFq/ioLTJPh7bDGQBSV2BY/QCHd0dQL9OkhFoX4vLeuIVKLlvifCm+9qEIE5+w==
X-Received: by 2002:a05:6214:5d87:b0:6d8:a5da:3aba with SMTP id
 6a1803df08f44-6e243c3b07amr371097016d6.20.1738675576494; 
 Tue, 04 Feb 2025 05:26:16 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e254814d1esm61954386d6.38.2025.02.04.05.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 05:26:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1tfIwR-0000000BRNQ-1pE0;
 Tue, 04 Feb 2025 09:26:15 -0400
Date: Tue, 4 Feb 2025 09:26:15 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 GalShalom@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <20250204132615.GI2296753@ziepe.ca>
References: <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
 <20250130132317.GG2120662@ziepe.ca>
 <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
 <20250130174217.GA2296753@ziepe.ca>
 <Z50BbuUQWIaDPRzK@phenom.ffwll.local>
 <20250203150805.GC2296753@ziepe.ca>
 <7b7a15fb1f59acc60393eb01cefddf4dc1f32c00.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b7a15fb1f59acc60393eb01cefddf4dc1f32c00.camel@linux.intel.com>
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

On Tue, Feb 04, 2025 at 10:32:32AM +0100, Thomas Hellström wrote:
> > I would not be happy to see this. Please improve pagemap directly if
> > you think you need more things.
> 
> These are mainly helpers to migrate and populate a range of cpu memory
> space (struct mm_struct) with GPU device_private memory, migrate to
> system on gpu memory shortage and implement the migrate_to_vram pagemap
> op, tied to gpu device memory allocations, so I don't think there is
> anything we should be exposing at the dev_pagemap level at this point?

Maybe that belongs in mm/hmm then?

> > Neither really match the expected design here. The owner should be
> > entirely based on reachability. Devices that cannot reach each other
> > directly should have different owners.
> 
> Actually what I'm putting together is a small helper to allocate and
> assign an "owner" based on devices that are previously registered to a
> "registry". The caller has to indicate using a callback function for
> each struct device pair whether there is a fast interconnect available,
> and this is expected to be done at pagemap creation time, so I think
> this aligns with the above. Initially a "registry" (which is a list of
> device-owner pairs) will be driver-local, but could easily have a wider
> scope.

Yeah, that seems like a workable idea

> This means we handle access control, unplug checks and similar at
> migration time, typically before hmm_range_fault(), and the role of
> hmm_range_fault() will be to over pfns whose backing memory is directly
> accessible to the device, else migrate to system.

Yes, that sound right

> 1) Existing users would never use the callback. They can still rely on
> the owner check, only if that fails we check for callback existence.
> 2) By simply caching the result from the last checked dev_pagemap, most
> callback calls could typically be eliminated.

But then you are not in the locked region so your cache is racy and
invalid.

> 3) As mentioned before, a callback call would typically always be
> followed by either migration to ram or a page-table update. Compared to
> these, the callback overhead would IMO be unnoticeable.

Why? Surely the normal case should be a callback saying the memory can
be accessed?

> 4) pcie_p2p is already planning a dev_pagemap callback?

Yes, but it is not a racy validation callback, and it already is
creating a complicated lifecycle problem inside the exporting the
driver.

Jason

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC8635DD3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 13:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005FA10E2D6;
	Wed, 23 Nov 2022 12:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6CE10E2D6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 12:53:21 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id w4so11154487qts.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 04:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MWtQ+HQ7UjlTxeOZBwuIDBaW841V6JDDje6JFtn0Gm8=;
 b=kbHo21c+VjBArF8kANL4SpDL1ev6zm/1Ww3D2+PzFYwurEg6+qp0EuSseviqrfx0/f
 GBqzJ0OGcTLoYmbeuC8JAB6o+8R5apVCWygPdTWQ2c7MKRJjPHrgxLCuqTAoFxaipqLQ
 lwA5s+wmzlg+lUYLRa5WyG0bwo4VK6KpsD/ghuPmnzgzflFHqvidZvmCxARhE95E6gCM
 HiLT2lam0W46lxxjmcnKoGA64c1s8wzvk/9iVZg2JJlQNg0SPHCoC0/4GQrQnzmoV/Ye
 LUltVgutM1DaNNaG+TkFxWH4RzuBPtyDYVNo6Hg9hB4qhcbCuod1kx7H6CzyfxfwTqUg
 p8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MWtQ+HQ7UjlTxeOZBwuIDBaW841V6JDDje6JFtn0Gm8=;
 b=7u3KLYmX2nMFBy3fqRc4afmMuQSVSRtvjR3PWhUZCnGXpUxV0lrjRbc+aGKCRRyuF0
 DxxmFETI//+fMg/UTm9sG8WwwMRM0bwk3RsUesmEpKUUa8br/5THF9qBN4Lb3gd3FrQW
 C+9R/7mTDMfwrtAJxqjsDJ6kK9Fk+enAjVykNToU7N46rrYMLotrc5MzzCEZ5L4Sexba
 S2/m/m0Ldg0+RedYCpV+eEphvmXotkXYx4uwuMHRos9pq6wAvyyKqxI27VgnisTa7zoO
 f576zjRO0AKSS1D9/zgPjHQQ0ygcOypuq4e7SPhcx4cM2yYVoBnoovDkIy8Hc0xCaopF
 FlUg==
X-Gm-Message-State: ANoB5plwAG3OF/ZC55HszgvP30v7N7/dLsZQFLJPKpLW2hv3rN0x/Jtt
 7TIH9ZMamoc41QYSj4dZesUqMw==
X-Google-Smtp-Source: AA0mqf5sY0FR2qWwiQ5/kTR4M+a6Z0BMf66P6/CLTclatyf0ZZNmbzpD51oJTq4KjYinih+bEDBsbQ==
X-Received: by 2002:ac8:754b:0:b0:3a5:fbb6:b0fa with SMTP id
 b11-20020ac8754b000000b003a5fbb6b0famr26154000qtr.665.1669208000539; 
 Wed, 23 Nov 2022 04:53:20 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 d5-20020ac85445000000b0039492d503cdsm9751175qtq.51.2022.11.23.04.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 04:53:19 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oxpFe-00AJLy-Np;
 Wed, 23 Nov 2022 08:53:18 -0400
Date: Wed, 23 Nov 2022 08:53:18 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <Y34XvmtHfb4ZwopN@ziepe.ca>
References: <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca>
 <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca>
 <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 John Stultz <john.stultz@linaro.org>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 01:49:41PM +0100, Christian König wrote:
> Am 23.11.22 um 13:46 schrieb Jason Gunthorpe:
> > On Wed, Nov 23, 2022 at 11:06:55AM +0100, Daniel Vetter wrote:
> > 
> > > > Maybe a GFP flag to set the page reference count to zero or something
> > > > like this?
> > > Hm yeah that might work. I'm not sure what it will all break though?
> > > And we'd need to make sure that underflowing the page refcount dies in
> > > a backtrace.
> > Mucking with the refcount like this to protect against crazy out of
> > tree drives seems horrible..
> 
> Well not only out of tree drivers. The intree KVM got that horrible
> wrong as well, those where the latest guys complaining about it.

kvm was taking refs on special PTEs? That seems really unlikely?

> > The WARN_ON(pag_count(p) != 1) seems like a reasonable thing to do
> > though, though you must combine this with the special PTE flag..
> 
> That's not sufficient. The pages are released much later than things
> actually go wrong. In most cases this WARN_ON here won't hit.

How so? As long as the page is mapped into the PTE there is no issue
with corruption. If dmabuf checks the refcount after it does the unmap
mapping range it should catch any bogus pin that might be confused
about address coherency.

Jason

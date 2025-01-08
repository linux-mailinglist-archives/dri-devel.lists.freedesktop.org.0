Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCAAA062A1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5591410EC19;
	Wed,  8 Jan 2025 16:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="UhnvmAuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB9C10EC19
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:49:35 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so612425e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 08:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736354914; x=1736959714; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0UT5umqpvXzX+OHEo2z2rTpWOE07qIe9i0VrPSb4y5A=;
 b=UhnvmAuMRFrCBLEjU0Fp2bNVHOcR2XWNkt9ezzBdsOa7G3uoqK5JBqe9KIkUAgTzk/
 5VSGJGhvduhg8lEsGAQmNvdafCQwLF3SebSOmaSB0kr6mk3chaqrRyRw8HvLfWtX8S1c
 1ayMbNrIBfmCniWUf72ZRiktD7bTIoB3mZ330=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736354914; x=1736959714;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0UT5umqpvXzX+OHEo2z2rTpWOE07qIe9i0VrPSb4y5A=;
 b=vjCVMpmwr+hTExF0JTuFy9PJQTA5jAbl/nRqniy5NbN3yy5bhsE+AF1/jD5UJgU9Pq
 tob2IplBjLbg40o9/0kwcqEliM9UIbqFuZDt2wUtZMhVOwerV1QFJbAFbhPcxlp6f54q
 cBoIorXzCXLoS/S6YHpOOr0y3WC4XglLqKFRTt/LGM+b7KFylK5lRHWLR1ZocEOMoyzg
 7N17fl0TtlgH4el7B4BGlaHJe12xd/8uNiIPar/IjIuUEK1ApB+tZFWzePJQivzqd1mS
 w+EstMd2FHaZ1NKLJH2N9fjdpKwB5wkxmxeLFbYAm+7K0oycTdjM8DNHajzYj5POAmwr
 G36w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0cc0juPhtcQVvXUPH3aR8ll2WJwiDOwuoQ8wB6+qxAvW0KYxmcyyQB2Y4+coX7AVQ1DQ9Bxk3O3M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaPWe/KQj7ZMRpAP/hBTIFHgBU/1WTvtiT08KcnbVHNVukekHc
 UsiMDXUsgXoxqdHiaCx1UDtq7Tr8ynxkLhAtxIPvFZl2jUiLRgrXKrNEyfvBiSk=
X-Gm-Gg: ASbGnctPq32CHMucSxQoXUsvpYule+4kY0xprnjYt4wN6K11Fi5kHDSsEvbmi2z5kKF
 57xtGJelPBLNqZlEXBPWPAcBSuB6OhtgKTl28jQZDsmKNy6wpptOd1FBYBfVV2tUevtMSFjqw//
 vHhzORpiOW3Wgbq89JDZZXgCW7TJYGvjyHSRUlRlfnwlAf2Rf21pYIEmGgzjiiJyboxdjDh1c4c
 x6ugC8Bw7bN157HsoTWRg3PLMhqJh9W8H/y+Yy71cks0fTAIU9x0DeDLEHWZ10cwj9F
X-Google-Smtp-Source: AGHT+IEu1vDzbKs7I7Y2fxV73AUw4WocoWZ3S+yonWf2wLofuc/3i9UvSC6dX6IXU9yETNGe3ZMUpQ==
X-Received: by 2002:a05:600c:444b:b0:434:f586:7520 with SMTP id
 5b1f17b1804b1-436e2679a31mr29981125e9.6.1736354914223; 
 Wed, 08 Jan 2025 08:48:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2ddefcbsm26275945e9.22.2025.01.08.08.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 08:48:33 -0800 (PST)
Date: Wed, 8 Jan 2025 17:48:31 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Wei Lin Guay <wguay@meta.com>, Keith Busch <kbusch@kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Dag Moxnes <dagmoxnes@meta.com>, Nicolaas Viljoen <nviljoen@meta.com>,
 Oded Gabbay <ogabbay@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Message-ID: <Z36sXzCpRhh_WXMY@phenom.ffwll.local>
References: <0f207bf8-572a-4d32-bd24-602a0bf02d90@amd.com>
 <C369F330-5BAD-4AC6-A13C-EEABD29F2F08@meta.com>
 <e8759159-b141-410b-be08-aad54eaed41f@amd.com>
 <IA0PR11MB7185D0E4EE2DA36A87AE6EACF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <0c7ab6c9-9523-41de-91e9-602cbcaa1c68@amd.com>
 <IA0PR11MB71855CFE176047053A4E6D07F8062@IA0PR11MB7185.namprd11.prod.outlook.com>
 <0843cda7-6f33-4484-a38a-1f77cbc9d250@amd.com>
 <20250102133951.GB5556@nvidia.com>
 <Z3vG9JNOaQMfDZAY@phenom.ffwll.local>
 <20250106162757.GH5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250106162757.GH5556@nvidia.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Mon, Jan 06, 2025 at 12:27:57PM -0400, Jason Gunthorpe wrote:
> On Mon, Jan 06, 2025 at 01:05:08PM +0100, Simona Vetter wrote:
> > On Thu, Jan 02, 2025 at 09:39:51AM -0400, Jason Gunthorpe wrote:
> > > On Thu, Dec 19, 2024 at 11:04:54AM +0100, Christian König wrote:
> > > 
> > > > > Based on all the above, I think we can conclude that since dma_buf_put()
> > > > > does not directly (or synchronously) call the f_op->release() handler, a
> > > > > deadlock is unlikely to occur in the scenario you described.
> > > 
> > > Right, there is no deadlock here, and there is nothing inhernetly
> > > wrong with using try_get like this. The locking here is ugly ugly
> > > ugly, I forget why, but this was the best I came up with to untangle
> > > it without deadlocks or races.
> > 
> > Yeah, imo try_get is perfectly fine pattern. With that sorted my only
> > request is to make the try_get specific to the dma_ops, because it only
> > works if both ->release and the calling context of try_get follow the same
> > rules, which by necessity are exporter specific.
> 
> We already know the fd is a dma_ops one because it is on an internal
> list and it could not get there otherwise.
> 
> The pointer cannot become invalid and freed back to the type safe RCU
> while on the list, meaning the try_get is safe as is.
> 
> I think Christian's original advice to just open code it is the best
> option.

Yeah open coding in vfio is imo best, agreed on that.

> > In full generality as a dma_buf.c interface it's just busted and there's
> > no way to make it work, unless we inflict that locking ugliness on
> > absolutely every exporter.
> 
> I'm not sure about that, the struct file code has special logic to
> accommodate the type safe RCU trick. I didn't try to digest it fully,
> but I expect there are ways to use it safely without the locking on
> release.

Hm yes, if you use a write barrier when set your file pointer and clear it
in release, then you can use get_file_rcu with just rcu_read_lock on the
read side. But you have to directly use your own struct file * pointer
since it needs to reload that in a loop, you can't use dma_buf->file.

At that point you're already massively peeking behind the dma_buf
abstraction that just directly using get_file_rcu is imo better.

And for anything else, whether it's rcu or plain locks, it's all subsystem
specific anyway that I think a dma_buf.c wrapper

Not entirely sure, but for the dma_buf_try_get wrapper you have to put a
full lock acquisition or rcu_sychnronize into your ->release callback,
otherwise I don't think it's safe to use.

> > > IIRC it was changed a while back because call chains were getting kind of
> > > crazy long with the file release functions and stack overflow was a
> > > problem in some cases.
> > 
> > Hm I thought it was also a "oh fuck deadlocks" moment, because usually
> > most of the very deep fput calls are for temporary reference and not the
> > final one.
> 
> That sounds motivating too, but I've also seen cases of being careful
> to unlock before fputting things..

Yeah I think knowledge about this issue was very uneven in different
subsystems.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

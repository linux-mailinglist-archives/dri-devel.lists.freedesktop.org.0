Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC17A22DD5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D027A10E96B;
	Thu, 30 Jan 2025 13:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Yu0cvH1e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BD110E96C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:31:53 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so783449f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 05:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738243912; x=1738848712; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HfypuIQboTZvpun4E8zdORtqN9UpDgcxhaup4sp9X8=;
 b=Yu0cvH1eMM2R46+xVd1vFRtydP/K21WQMCvHXgJE3pRuojPuPrtZbtZgr6qDrSj4/T
 vkGy4E8A3RfcvQTSmLl9od3uAn8EQjACDLFR6OG6PgNRgNoNGKWGuTKll9+S6hmIfPMj
 wAmzNcjy13sx+uCBCCyoZKH24Sbo/nR0Z2NU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738243912; x=1738848712;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+HfypuIQboTZvpun4E8zdORtqN9UpDgcxhaup4sp9X8=;
 b=PNgFCcXbp9xf/I+mtAJqOjzawgI402BeYbey7UpQS42TSguFaiK1xEpq2UxOAphka5
 GMkPtz9r6MCnVdb/ZBdJMfdV3pJ875z9oUD+cEgJunEpQeALAv/+3BWGIL0Tumesxcbr
 EgNHiWulA850jHnWmejkU1SoVxMoV1s1Lqh45R45bpWjNQnN0j7Vvcm+e2rxe42urj9N
 NbM1dMmBZAKXdmNZU1gqrk2xVZHVmV66nILShdkvipfCwi/8ERSc/WHXpyBIR3iK0mhP
 8QpldfDyJU+X7Mcd/ZqcX5I4y7ZW621x7toDh/HyEHc+YhxfUqaaTkueSqQ5OHr4T8yx
 kg3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8kXy8/SF7HD92IfoZgy+RPLNTEYbXFzfz1gJRFsYY3+rtDxu0rSgFvqrLTG1bG1pF+McZPmqTW8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoUCz8avC6P+bvwYvQHKXGOCyxcVlM6WcMIfmErRt4Ur8eShtW
 UbevXeDI2Zhj7yQCjCqY19lA+Y/p+JLE3IgOPivtO8mv/vlpOB62DhN5iN6VTLI=
X-Gm-Gg: ASbGncuJXSdAAyClYGxVuNv6A3WHMcgPKPcrW+WXFrMmHqM2fDgIaqKStUOvzhSdcWT
 xCpfMVXn0t/qy0w9CffSn8/fExo+XoCH7QRtyPyehfq9jVVfIASoTed3VcpDR8eHWkg9yAedwh5
 wiVQAjbpXTo0v4O2gUbcmNYNBy8NJKTz6GalM0jnFdwDcDc5xF/eeS6e15HvfpGgoT3+ZitEl6/
 OiMJj2EZAgoapw7L1LQym8cG4lj7bDkICcVAcFjCPfnoTj7JNubeTEiDWmGSvjeRoe7ZZwGbQrz
 VD6ZQhJiNydzXv4Nqc3yPfW1X9o=
X-Google-Smtp-Source: AGHT+IFMswZ2dc1PUK9As+fnPUJ+YPXY0lrKZKSyFsUE3i9ImUyvh7RLGwzxoWBETKt22tExTSNKvA==
X-Received: by 2002:a5d:6c65:0:b0:38a:4b8a:e477 with SMTP id
 ffacd0b85a97d-38c51969b28mr5731448f8f.22.1738243912301; 
 Thu, 30 Jan 2025 05:31:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf831sm2033238f8f.90.2025.01.30.05.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 05:31:51 -0800 (PST)
Date: Thu, 30 Jan 2025 14:31:49 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
Message-ID: <Z5t_RebEx6Mj-KlT@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-5-david@redhat.com>
 <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
 <cfc4f8ac-80c4-472f-85fc-36ffcd212441@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfc4f8ac-80c4-472f-85fc-36ffcd212441@redhat.com>
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

On Thu, Jan 30, 2025 at 10:37:06AM +0100, David Hildenbrand wrote:
> On 30.01.25 01:27, Alistair Popple wrote:
> > On Wed, Jan 29, 2025 at 12:58:02PM +0100, David Hildenbrand wrote:
> > > Let's document how this function is to be used, and why the requirement
> > > for the folio lock might maybe be dropped in the future.
> > 
> > Sorry, only just catching up on your other thread. The folio lock was to ensure
> > the GPU got a chance to make forward progress by mapping the page. Without it
> > the CPU could immediately invalidate the entry before the GPU had a chance to
> > retry the fault.
> > > Obviously performance wise having such thrashing is terrible, so should
> > really be avoided by userspace, but the lock at least allowed such programs
> > to complete.
> 
> Thanks for the clarification. So it's relevant that the MMU notifier in
> remove_device_exclusive_entry() is sent after taking the folio lock.
> 
> However, as soon as we drop the folio lock, remove_device_exclusive_entry()
> will become active, lock the folio and trigger the MMU notifier.
> 
> So the time it is actually mapped into the device is rather

Looks like you cut off a bit here (or mail transport did that somewhere),
but see my other reply I don't think this is a legit use-case. So we don't
have to worry. Well beyond documenting that if userspace concurrently thrashes
the same page with both device atomics and cpu access it will stall real
bad.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

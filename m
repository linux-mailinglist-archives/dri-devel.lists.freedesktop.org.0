Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A66A22D38
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD7F10E349;
	Thu, 30 Jan 2025 13:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="YMQTrhfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8E310E340
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:03:47 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-385eed29d17so382758f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 05:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738242225; x=1738847025; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UgiRf9jbTncFOwmj3rTY5I84Nfx6SDCI8aA3yE1P2kU=;
 b=YMQTrhfMuIouZkAQ1kn8DwNTuu+DeQVuzd4roQ51G2X4qImkqcMaSgrdSoZPY4wbmA
 GHkFaxCn7EJI4xT0a8hFFbEG9WpmLU8Q2sK4GVa09/Y8uRovMLwdmldnswgA4+w1HFYL
 zR1quM9jptSjivmvTKVnof8T5A+2eXsBgBnr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738242225; x=1738847025;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UgiRf9jbTncFOwmj3rTY5I84Nfx6SDCI8aA3yE1P2kU=;
 b=U8RllVdhLVXErtPy5TBcCF6BCUbWMBGbKibp1L6NV0mWSCgZsg5B+EAMZpYFTDYVj6
 WKRRh6ouS9n5Abz8/C+CpEFgmJK5BeW5a21nKJIqNcTTLdf/5P6bsWT82OahZkZZ2Eht
 iafNKrOfJbxjvWqJaMyQRCyzlfoW1USkEi1D+rWAuGEDmsHVMmbo8oU74EEarVRWwJ/O
 u0gOmqR8C64kCHEh+LU1+aMrWB8NCB8/dZDaJqB6tjEtvBzyqoC2fDzG9De3xdErw1CZ
 rLysKs/Nrjncdd55wy7VccIkhRzh9GNwxLFNifPi7JzySnCJbtFv5iOeMAqirdN1nobM
 rFFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzVl3MMmWRqL0+mRvLVodz3DgRHQXlUiA5pqxGWUKOtz1E1+eBtRhGHAuII7AFClBfIAH/yY/dyFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTh9CryZNbN7kTR/lIORrOZkEZQGTJ//IrOkjAWRosByUlEpv2
 sWeQl8kYAyQjIAx/rwL9SXboJYzzx/dORjkViex+qE8qdDJiYsYPP1YpD7oJG2g=
X-Gm-Gg: ASbGncsuITni/RVbe8qHjyQpDD9WXYV6ZKqOfjz1nj1EC6k5tqSqJzt1MnzqnvIp1wN
 2w78stv7EnRRuUUAE09xfzEExY5MIg/hTkS83YJDpqqwXV8d3TwyWXjN7yNBNceyY48LPPKQ5W+
 bUDtLaGO79ISafxuZZ67YN57KyeBTMZih5WOATbqFXnXBcGN3LU7Ihqnyg2IYuP089t+lHvp3Y+
 OLGY396Evmsw/6ahdNpT/UzC/whRTLr1HwGkEA9WfKwRCLbe14DCTJ51myPhWmnYW4eFsUvI9CN
 CHIeA5Vz+seE9qYv7VjcHdl/VMg=
X-Google-Smtp-Source: AGHT+IHJ4PQVE5HpkzCPzrNWq8zl2Gl6Pk4aDkS8eqlkDUfbDlT8A12K1IbiCiXTus+F/gF8+q2ayQ==
X-Received: by 2002:a5d:64ad:0:b0:38b:ecec:8576 with SMTP id
 ffacd0b85a97d-38c5167b5bfmr7295312f8f.0.1738242225257; 
 Thu, 30 Jan 2025 05:03:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc1317fsm59239255e9.8.2025.01.30.05.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 05:03:44 -0800 (PST)
Date: Thu, 30 Jan 2025 14:03:42 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
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
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
Message-ID: <Z5t4rrkRiOsRY2jH@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org,
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
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-6-david@redhat.com>
 <Z5tLmYOQaZrdWQHN@phenom.ffwll.local>
 <2670f65f-e973-483e-aed6-526d00125ad7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2670f65f-e973-483e-aed6-526d00125ad7@redhat.com>
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

On Thu, Jan 30, 2025 at 10:58:51AM +0100, David Hildenbrand wrote:
> On 30.01.25 10:51, Simona Vetter wrote:
> > On Wed, Jan 29, 2025 at 12:54:03PM +0100, David Hildenbrand wrote:
> > > Let's do it just like mprotect write-upgrade or during NUMA-hinting
> > > faults on PROT_NONE PTEs: detect if the PTE can be writable by using
> > > can_change_pte_writable().
> > > 
> > > Set the PTE only dirty if the folio is dirty: we might not
> > > necessarily have a write access, and setting the PTE writable doesn't
> > > require setting the PTE dirty.
> > 
> > Not sure whether there's much difference in practice, since a device
> > exclusive access means a write, so the folio better be dirty (unless we
> > aborted halfway through). But then I couldn't find the code in nouveau to
> > do that, so now I'm confused.
> 
> That confused me as well. Requiring the PTE to be writable does not imply
> that it is dirty.
> 
> So something must either set the PTE or the folio dirty.

Yeah I'm not finding that something.

> ( In practice, most anonymous folios are dirty most of the time ... )

And yup that's why I think it hasn't blown up yet.

> If we assume that "device-exclusive entries" are always dirty, then it
> doesn't make sense to set the folio dirty when creating device-exclusive
> entries. We'd always have to set the PTE dirty when restoring the exclusive
> pte.

I do agree with your change, I think it's correct to put this
responsibility onto drivers. It's just that nouveau seems to not be
entirely correct.

And thinking about this I have vague memories that I've discussed the case
of the missing folio_set_dirty in noveau hmm code before, maybe with
Alistair. But quick search in archives didn't turn up anything.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

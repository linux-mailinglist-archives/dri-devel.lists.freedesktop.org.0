Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F135DA22D3D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC13510E340;
	Thu, 30 Jan 2025 13:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="BNUCQlmV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BF510E955
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:06:18 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso5302455e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 05:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738242377; x=1738847177; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMLrHVPMGtCZMZmW7MbuXycbMRtIlRW9hXfQuZWmFaE=;
 b=BNUCQlmVjA+mvCd1F0J2L4PNIO3Emh08tQMXKGiw+N21SThtUsevLHpFgl7P/UmLhq
 zUMtG4pyXUmewB3dXCd5UN2qJW1s8hJHN1I6fUbB9QAasjgU+brXKBOR+pW7wxzZLlin
 Vx8i7sz7TI9EKormQI6//h28AYe/NmNtoMLAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738242377; x=1738847177;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BMLrHVPMGtCZMZmW7MbuXycbMRtIlRW9hXfQuZWmFaE=;
 b=iajLZsSi2QfGjoEf14QRxXYsyceuDfY8q7RHWSU55sfx5g0xdmyH0S6bnnGZBHEtN9
 o6+ziuQ+kRd04xeskOwQvEcS8sl60cjqP4jM1PHODuGuEf3UvddNHciO7Yd6W7gu/FkO
 f7BbWNuGvVoreQcOs5fRhUGzLCs07r/rEV9XC9zdcrM4hu7QM2Dpc7G0rPbSm+GidwnB
 N6r09pwNwkV7KnpRG5HMpR9g/uX5WCvvqI8r8UvS/prtcVC3bFzINYOw9hiiAQh334ia
 p2CYaTnWvHbuCsdQ2dZ8fJxu44UR2FLkdihlNIHcZXigAcb8PK27NwJXLzE7AEyLEEyb
 iKCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBJXRxOhplbH12cRBvSLzyE6CW24eYuO222UyzQ0q57hc+MhpolaYNz9b5ybZBvwsH2AOQVQSfKyg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJKqXeXxC/K66AevDbEiCvQuoPDaaxqiFxdEVfmMV2zZqCB4g/
 m55RBw3aP8nXhIYEBlRra5JYg3fQPhDDgBN5nEPVxjTFSTMpr54jy2AATEZEZTM=
X-Gm-Gg: ASbGncv15sbra9LEF5DNj0n/Bup/t0moN+M/2hCoXW3B67ymooacImL/uJONO/lUFjq
 NcO6c7vXacJIfPP6ui3m7xXEJHiHjRC7bUYBhLseULYxLnrqClTWM3pMOpk4iz3So4IzUw9XN9J
 TQWbw1KCfdBlg3UsXB2BjPha2amZHotPu073CiXxz/FY/zd3kdUMS52TBLPfXsXUMxJK7WR7wU2
 K2DmLhk0Udf7wOLCPnTLIPYpMZIyK6eTWXDk3mXK51JsBL5g1UGHl7BmoZ0m56sYW8TNa1TDJMw
 SDaT2dXsHqekgN0XMJ2M2CXvjok=
X-Google-Smtp-Source: AGHT+IGdMrUCvgalAZZCC4jhBxGguMB5GBKImgNsdpvgeFH4FSRc46sdOKhU5wXZRU0tkFgExsNzeQ==
X-Received: by 2002:a05:600c:4fd6:b0:434:f1d5:1453 with SMTP id
 5b1f17b1804b1-438dc34cc47mr71572785e9.0.1738242375772; 
 Thu, 30 Jan 2025 05:06:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c125f77sm1959273f8f.56.2025.01.30.05.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 05:06:15 -0800 (PST)
Date: Thu, 30 Jan 2025 14:06:12 +0100
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
Subject: Re: [PATCH v1 08/12] mm/rmap: handle device-exclusive entries
 correctly in try_to_unmap_one()
Message-ID: <Z5t5RKFwl34vpqU4@phenom.ffwll.local>
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
 <20250129115411.2077152-9-david@redhat.com>
 <Z5tQL60SNNGCkfQR@phenom.ffwll.local>
 <59feb709-dadc-4d19-857e-49320cca3d98@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59feb709-dadc-4d19-857e-49320cca3d98@redhat.com>
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

On Thu, Jan 30, 2025 at 12:08:42PM +0100, David Hildenbrand wrote:
> On 30.01.25 11:10, Simona Vetter wrote:
> > On Wed, Jan 29, 2025 at 12:54:06PM +0100, David Hildenbrand wrote:
> > > Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
> > > we can return with a device-exclusive entry from page_vma_mapped_walk().
> > > 
> > > try_to_unmap_one() is not prepared for that, so teach it about these
> > > non-present nonswap PTEs.
> > > 
> > > Before that, could we also have triggered this case with device-private
> > > entries? Unlikely.
> > 
> > Just quick comment on this, I'm still pondering all the other aspects.
> > 
> > device-private memory is entirely owned by the driver, the core mm isn't
> > supposed to touch these beyond migrating it back to system memory in
> > do_swap_page. Plus using rmap when the driver asks for invalidating
> > mappings as needed.
> > 
> > So no lru, thp, migration or anything initiated by core mm should ever
> > happen on these device private pages. If it does, it'd be a bug.
> 
> I was not 100% sure about HWPoison handling, that's why I added that
> comment. In other regards I agree: reclaim etc. does not apply.

So maybe I'm just entirely lost, but unless you have a coherent
interconnect I don't think hwpoisin should get involved with device
private memory? And for a coherent interconnect it's just device memory,
which isn't treated very special.

Also to clarify, I meant this as a general comment for all subsequent
patches that have the same paragraph.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

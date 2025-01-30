Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD655A23189
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 17:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294EA10E9AB;
	Thu, 30 Jan 2025 16:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZgvXskYE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E52010E9AB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 16:10:34 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-436202dd730so7482595e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 08:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738253433; x=1738858233; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+aR4Ll0dxJFmtTXN5GjVVUyw5AIaU7JwbYHSEFoNZYE=;
 b=ZgvXskYE3e42mS7ExUvNo6PbWaRzxYeECAyzlT1cOZmO6Ho80/HVdYWNz0letnlxoB
 0eNMIi40R6sd3vV9TfAW2/VH0pgJq+692DveSLil/bxDh/Kkrlur+UYRbuV4jTdK8I6P
 f0fobokyQliyiXFdkzpk+9+bqcxWmo9Ssiw5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738253433; x=1738858233;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+aR4Ll0dxJFmtTXN5GjVVUyw5AIaU7JwbYHSEFoNZYE=;
 b=TliMUc9IazFX/pHyhk/JiRq4bR1saS460SAGdRnRNSUPphvj625KsxWoYT31mGtm4F
 b03Wfw/eoa5G6s6nxJ8712UATMa5RGCuc5cz7hyOxVorMvwdwsqq0BvcSsJHTjW/EuU4
 DEHva2qG0SmHc5v9FXs2xOUNd5rRctIgQLsQZkXewPSbguus7phc0czADuPI+eXwXVgM
 JAoiFuj/WeR48TE59Y9wjIztRfL2bc7RqU3Ys8msnTydnEunp4QUEF6wKEXY+WQGFULW
 2nmjXvoT11E09Z0vDbd7Am4Ea7Id/+3hOwt6+B7gdQ3IJEGU8nCdrwhNruVCGWRqx4pW
 Ar5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzhZ8WAt63QR7lhCKCYpCfYQKgRSe2DqYejelwF8rSSOQdzXRzWcdJ5wIuJIfojs1MICu4Yv0aXYQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3mjj/hCklhoPHu7jNkmFvncamS5Q2U0uS6fBir0a5OayUwODM
 B43tJBS+NIUMPGZkrPH82+nER1DiIYTKkXPhI/k2CmLg5tf6OElXU5uCzEFactU=
X-Gm-Gg: ASbGncvJzSqMcJWR2sYULRWQ/PdpXCOhPYiPYKjawl4EIoRepdvI/0G7HjdN+1Jr+Kg
 0aOnszT0x6/FVfktJnQoAsx+xgh/YKRQIFrLPkuYPPsrGGr6DAUgnjy8GCfB+eIQmTs/To6uItk
 HqFHA6f9uTjIwrvX8Xa1XSDvq/GlhrzC0VVQ/OEIfeClsCi2nOLSM69kPXTCD2kj5w1rduM9wip
 /TNo/gnq9XqGAr1rooJmzp8CpUTXxCKHq/iZ1MdTasjCxS/UHeyTOoGvFb00LLB013olXJA644/
 7UIvoYVeATe+W+BnT1ul/+dj/y0=
X-Google-Smtp-Source: AGHT+IHVd4DfU6AaL1PQgWpWv09mvfBE8UJUdITJOwxWpPybeOC1smy7UyEu+/Ad7rIxi3xBtlBrvg==
X-Received: by 2002:a05:600c:5486:b0:433:c76d:d57e with SMTP id
 5b1f17b1804b1-438dc3a40d3mr81383795e9.5.1738253432989; 
 Thu, 30 Jan 2025 08:10:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc1315esm62266005e9.6.2025.01.30.08.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 08:10:32 -0800 (PST)
Date: Thu, 30 Jan 2025 17:10:30 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
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
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v1 08/12] mm/rmap: handle device-exclusive entries
 correctly in try_to_unmap_one()
Message-ID: <Z5ukdq6LG2dQKaPU@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
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
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-9-david@redhat.com>
 <Z5tQL60SNNGCkfQR@phenom.ffwll.local>
 <59feb709-dadc-4d19-857e-49320cca3d98@redhat.com>
 <Z5t5RKFwl34vpqU4@phenom.ffwll.local>
 <20250130140832.GM5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130140832.GM5556@nvidia.com>
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

On Thu, Jan 30, 2025 at 10:08:32AM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 30, 2025 at 02:06:12PM +0100, Simona Vetter wrote:
> > On Thu, Jan 30, 2025 at 12:08:42PM +0100, David Hildenbrand wrote:
> > > On 30.01.25 11:10, Simona Vetter wrote:
> > > > On Wed, Jan 29, 2025 at 12:54:06PM +0100, David Hildenbrand wrote:
> > > > > Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
> > > > > we can return with a device-exclusive entry from page_vma_mapped_walk().
> > > > > 
> > > > > try_to_unmap_one() is not prepared for that, so teach it about these
> > > > > non-present nonswap PTEs.
> > > > > 
> > > > > Before that, could we also have triggered this case with device-private
> > > > > entries? Unlikely.
> > > > 
> > > > Just quick comment on this, I'm still pondering all the other aspects.
> > > > 
> > > > device-private memory is entirely owned by the driver, the core mm isn't
> > > > supposed to touch these beyond migrating it back to system memory in
> > > > do_swap_page. Plus using rmap when the driver asks for invalidating
> > > > mappings as needed.
> > > > 
> > > > So no lru, thp, migration or anything initiated by core mm should ever
> > > > happen on these device private pages. If it does, it'd be a bug.
> > > 
> > > I was not 100% sure about HWPoison handling, that's why I added that
> > > comment. In other regards I agree: reclaim etc. does not apply.
> > 
> > So maybe I'm just entirely lost, but unless you have a coherent
> > interconnect I don't think hwpoisin should get involved with device
> > private memory? And for a coherent interconnect it's just device memory,
> > which isn't treated very special.
> 
> I'm not sure it is meaningful, but in principle a driver could keep
> track of the poisoned private memory using that struct page
> bit. Perhaps in that sense it is more of a driver private flag than
> something the core MM would touch.
> 
> If you have a coherent interconnect then you should not be using
> device private.

Yes on both, that's what I meant.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

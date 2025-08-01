Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB840B185F9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 18:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CF510E2B8;
	Fri,  1 Aug 2025 16:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="hFmWDmNP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECF510E144
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 16:46:39 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-707453b0306so10886886d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 09:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1754066799; x=1754671599; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5oUm5wK6G92WfMPCbUZUcR35sqkaEU8gvzPmgYYYTFg=;
 b=hFmWDmNPKFmSposEWjg9jmdzQrS0EM+b/LJrx60/q32w8t/klKwzd5SCdZu1a7VXne
 d8OZfxbB5LTaBMuTkGFOBM3IsLwbDy/47D4koj6m8MC2uhPvPs8R4HbDTzDbyE9RX5wA
 lRBg29pMHga+Xu6tRXx8zZETZic02itoelqxxdZPhGigJp2n5PxQTUYktiq1MMk+19gb
 UfXhebBIS71TdyLFLgi7h/nDSD8+56f1jJ/ZVcj2ZNCyjjRt7Tj7icGWzwarTsvOjKBx
 +vs+S5TimPOSBy+C3tmsFTO6NAT2W0lJz0d5ZE7jWPd9YlFrU8uWGglb7twGxnlfJdTw
 /gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754066799; x=1754671599;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5oUm5wK6G92WfMPCbUZUcR35sqkaEU8gvzPmgYYYTFg=;
 b=obJ7O+iR84+KppNq6qkwzPV6XXCfeOV/pfcJPcdugthuAjfdqW0zPyTaUPZQgy4ANA
 gPRqXAnr1kLtJITTDxnXs9ttyC40cTr6OGAofFTU/t0WoCZvUPLFyiIyARZBokWgswJy
 r8b4JBCBvNnJfS+XowjVzijMIw27iuFVnyG4Bm+KWeKPODHO/r6LCXMaE9o+T+YVvHve
 qXEVWvCoC8R+HHVlZBE+Hspwtp0Rr5slSuuSfRmUzcwTLxG6/x0vQplH93x5umuzJAAs
 wr9/oXpFNAKr2fbtQ6d6q7QJFua4sefadJGN0F8Bx3lwitn9KVzRrPRVSBmpxNUAY+9w
 rqoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZTKF98x5tpAB/pth4TV9YhS63ueV6OhMmgfUMDbwU6uuP8c0hl70Qsvw51uBhq5/lvEwE7VmghMw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yznuu5IJraK37glQbwokNanct5lPVGn4/hRFfuKJzDdNJ+6ivCI
 rw5cLiHVijdq5rQ8J0fP/vrOzmD6SQgRbagJWibockjPWcYJ86+2Q7Pbkt0Fwq+rIpg=
X-Gm-Gg: ASbGncvpY67ororj4oHzjsLlPSw2kcNmBOyJwmWvmkgdOSEOJlOHEXKNguCol80XfOC
 Gb9Qbre3aRZ9t7Pzt7xLOOKJh7Dnyu/mDQLO7Xcq5dbJFS8JTC5A3268UWwaOtDuNylzkZ+djf0
 jTzknQ9QUzD35mj1sdL6s58kz0hFaCczWPTsJLIE4J0nqt/0EAtRcKnB5gtb3wbQSe2V/y9t288
 D40cKMTPnZXvEU3Tqi4oYPXPmwjFj/P16aM08J2nWQIlW7r/yp0PV4kFhiNCLhddMA3IaC/hNyM
 eRj1anMls1RhfnYVhbsKEAqdb9xA8dMJYAwyeqN7JNJNJyTaDyH4p17jAJ7A7rrF+DbeaOT4v3i
 d5bq0iYzzIGU0s84FH97k8y2/MP8v3OfWV6IVGu8nKyZoNyVSei0nNe4v8/e70y5G6Rld4mT+R3
 WhAwA=
X-Google-Smtp-Source: AGHT+IGVVOWQB4/1iDofT+YAUuJwKo0n0CGvBCRj9fO4gfCwpoC+KN12czXAx1xbZXDfGO7Jsn2RQw==
X-Received: by 2002:ad4:5aaf:0:b0:707:43cb:d9ef with SMTP id
 6a1803df08f44-70935fb0820mr5596516d6.21.1754066798378; 
 Fri, 01 Aug 2025 09:46:38 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077c9d6db9sm23142096d6.14.2025.08.01.09.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 09:46:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uhstx-000000013A0-19T8;
 Fri, 01 Aug 2025 13:46:37 -0300
Date: Fri, 1 Aug 2025 13:46:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Cc: Yonatan Maman <ymaman@nvidia.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 4/5] RDMA/mlx5: Enable P2P DMA with fallback mechanism
Message-ID: <20250801164637.GE26511@ziepe.ca>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-5-ymaman@nvidia.com>
 <aH3mTZP7w8KnMLx1@infradead.org> <aIBdKhzft4umCGZO@ziepe.ca>
 <aIHhGi3adOiLykJn@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIHhGi3adOiLykJn@infradead.org>
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

On Thu, Jul 24, 2025 at 12:30:34AM -0700, Christoph Hellwig wrote:
> On Wed, Jul 23, 2025 at 12:55:22AM -0300, Jason Gunthorpe wrote:
> > On Mon, Jul 21, 2025 at 12:03:41AM -0700, Christoph Hellwig wrote:
> > > On Fri, Jul 18, 2025 at 02:51:11PM +0300, Yonatan Maman wrote:
> > > > From: Yonatan Maman <Ymaman@Nvidia.com>
> > > > 
> > > > Add support for P2P for MLX5 NIC devices with automatic fallback to
> > > > standard DMA when P2P mapping fails.
> > > 
> > > That's now how the P2P API works.  You need to check the P2P availability
> > > higher up.
> > 
> > How do you mean?
> > 
> > This looks OKish to me, for ODP and HMM it has to check the P2P
> > availability on a page by page basis because every single page can be
> > a different origin device.
> > 
> > There isn't really a higher up here...
> 
> The DMA API expects the caller to already check for connectability,
> why can't HMM do that like everyone else?

It does, this doesn't change anything about how the DMA API works.

All this series does, and you stated it perfectly, is to allow HMM to
return the single PCI P2P alias of the device private page.

HMM already blindly returns normal P2P pages in a VMA, it should also
blindly return the P2P alias pages too.

Once the P2P is returned the xisting code in hmm_dma_map_pfn() calls
pci_p2pdma_state() to find out if it is compatible or not.

Lifting the pci_p2pdma_state() from hmm_dma_map_pfn() and into
hmm_range_fault() is perhaps possible and may be reasonable, but not
really related to this series.

Jason

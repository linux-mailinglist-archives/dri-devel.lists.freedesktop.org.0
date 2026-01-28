Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLwBHfRkemmB5gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 20:35:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76C8A8324
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 20:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA6910E6E7;
	Wed, 28 Jan 2026 19:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ix43RPUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1607110E137
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 19:35:11 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-8c6a822068eso32331985a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769628911; x=1770233711; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2KAAnJwvwGpmfNKzRTwry18X9/kL9abH5dLZSH1R12Q=;
 b=Ix43RPUOwGR8MYGLloDXubUqM37sijelFfi0jWOIaAhfJIiiAnexJgNo2qsh+WGOpm
 kxqck/LYmiEKAY/GNBVbPCCgdgkIsmvkWljJpKo6pvYB+3fsKeOO7HndpJfhwPTRWpai
 M/e21fNT6FtRTMGNmWnY+1j/o7ehgGgRpaaBOsYEL5kInGW3E3QeOA9wHG9GOVgifxRd
 mh6ZWJIVlbTMjGsRy4cL5DWYIXIpAoWghQtgbW8SZz9qeg7wHCdYxr/VNP+hRPhhTpFH
 xq646Mw+YT/7K8PyqHGTOt+PGzHWz2vUyNALfqSiXFRIE0GIILCYC0rIiPrJnxawQWTF
 YScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769628911; x=1770233711;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2KAAnJwvwGpmfNKzRTwry18X9/kL9abH5dLZSH1R12Q=;
 b=fmp3I4lEkbdLEuVHYN0wvu2glwnOVGRZE/t08yYpgoM29ho6X7Ol5GHJC3rTAkZe4u
 i0qw8HSHJWqstbQjFNXo7yYuiVIhBiaJLSqLCatJpTH+7zpn/e1HPPvMyhtbhVkKbFui
 wJje0bphSLRFI4M9pSAfrrklVvKZwCCp3zT8jlRt8kErnZQoJYfiA8MXg5QHo+pu6ccH
 HnejctRh/zhg6nMzqd9IEIo0uc9j2VyngpbMH3GTKUX8aPIRiVq9sTEymy2ANrJBC2zh
 7mzUc2MsD4cFL3jv0Scbe724+7UDKJ8eIucDKfkafF4QQVUDL09IssPDk1VvYmSncY67
 xzgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu+HzdUxUFGQmscM1HCQRRsxmg0gxXkwhGrFuqno0NRQAFcp6IeERADlntv+JzPlzf5H+Dxit7GVM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjzPWKArl56Eup1hw5TCkkGF+h37Kaqga6IbHZUfPPs0uu+MdX
 cFTqvFLKAoilThUu9czsfWE0DvvpU91yspS3LU/ztXs8yiXHi54GMAdH8AOC2Athwps=
X-Gm-Gg: AZuq6aJ1yDe57MORUItqPEervuiV6gwDCgpxJOcDA97U7JMF1+yGSIl6VtFsSag2YiG
 eL5hPjkK5On2hmMDzCom7uLFO4WSW+J6sMTbtsZKpaTqLlFd+1R58YJ7lvJpZ6OnyP0WBWAfZ5O
 QvTLSM4Ru+lqqFzRQ8NF7es9BFDqNJm5Rns4+0hu+iotjm8obHkLgl4bOqOG6wu0vtkFiSOMkT4
 67t5qDMFqL3lMquvIZ9nYuwF2bNeXEgXcOuiAljKOtM3n9z30Pf1QkFtxrDjdTvCL8x9GYU2jGO
 RLqKeXolCJ7tJeh8QN4W1btADKJ4LbL9kb15Km4PE9nrRfmcRMdT2ZnM95R5lHQc65CV2jwNWEl
 0yjOqsMXnxosnR9gjYbiwxInbj3zSXy6GgRGDtXvsgK7fi7ZtpRSJtI6DrIdi+O/DlQKJvI7cGW
 JGDudaqvidFQRLr1MnHZ2wM6G+mXOXKqE7+V6vU/JS1pxJPSV5nqnNfGKnRibdo5bryTk=
X-Received: by 2002:a05:620a:254c:b0:8c7:6d9:4ff5 with SMTP id
 af79cd13be357-8c70b860ecbmr814561585a.26.1769628910790; 
 Wed, 28 Jan 2026 11:35:10 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c711d48940sm251405885a.44.2026.01.28.11.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 11:35:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vlBJl-00000009avc-2ZEI;
 Wed, 28 Jan 2026 15:35:09 -0400
Date: Wed, 28 Jan 2026 15:35:09 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: Re: [RFC PATCH v3 06/11] drm/pagemap: Add IOVA interface to DRM
 pagemap
Message-ID: <20260128193509.GU1641016@ziepe.ca>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-7-matthew.brost@intel.com>
 <20260128151458.GJ1641016@ziepe.ca>
 <aXpYrfUmEaaOsse8@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXpYrfUmEaaOsse8@lstrano-desk.jf.intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:intel-xe@lists.freedesktop.org,m:leonro@nvidia.com,m:francois.dugast@intel.com,m:thomas.hellstrom@linux.intel.com,m:himal.prasad.ghimiray@intel.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: D76C8A8324
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 10:42:53AM -0800, Matthew Brost wrote:
> Yes, this is exactly what I envision here. First, let me explain the
> possible addressing modes on the UAL fabric:
> 
>  - Physical (akin to IOMMU passthrough)
>  - Virtual (akin to IOMMU enabled)
> 
> Physical mode is straightforward — resolve the PFN to a cross-device
> physical address, then install it into the initiator’s page tables along
> with a bit indicating routing over the network. In this mode, the vfuncs
> here are basically NOPs.

Ugh of course they would invent something so complicated.

I'm not convinced this should be hidden inside DRM. The DMA API is the
place to make things mappable and for an open standard like UALink it
would make sense that the DMA API is the broker to connect things as
it will be more than just one GPU driver talking to itself.

There is a journey to get there, but I don't think it is too
complicated. It also probably ties in fairly nicely with the ideas
coming for multi path PCIe fabrics.

> So, if it isn’t clear — these vfuncs hide whether PCIe P2P is being used
> (IOMMU in passthrough or enabled) or UAL is being used (physical or
> virtual) for DRM common layer. They manage the resources for the
> connection and provide the information needed to program the initiator
> PTEs (address + “use interconnect” vs. “use PCIe P2P bit”).

This looks like it is taking the DMA API and sticking drm_ in front of
it :( I don't think this is a good direction for the kernel, DRM
should not be internally building such key infrastructure.

I'm confident we will see NICs and storage wired up to these fabrics
as well.

Jason

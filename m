Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNC9Ofknemlk3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:15:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0E7A39A3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C4810E6EA;
	Wed, 28 Jan 2026 15:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="gTuWDzTz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3538F10E6E0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 15:15:01 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-8c6a0702b86so687093485a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 07:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769613300; x=1770218100; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O/COmePD/TYm2Jf55QJyZUZAcIYHKYp8bDLJm97WVmU=;
 b=gTuWDzTzDLPhYSkkwLIppoYeuFWRoYZYgvvH+u0zmF3VG+oUCfQ/hpveUFDgt/7rNe
 COPAdxZJnWeex9pjXN4Xn5NoLDtTlytUEu+cwluRfpKEt14WdwyWMKs8mbps3E5rFBhX
 DkxRVPyrr0L6Su9GrvsHZGqqCrWBsnFmRlMAiB6i6pgo8cqNZYtwOpSINitTNZ2qE9QM
 DjrdJD6DgGR0RPuqkpmvvD2Mfhm/sWptV2L7m0czJINtMW7vJ1ZFLCHMTih67NMw89x4
 vDrW5sxTEjF58LOOgdjYj2nh82wMhD2ICYYuhWyp92UUIJRIrTh8a4oUpTXlpG7wZiac
 3nMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769613300; x=1770218100;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/COmePD/TYm2Jf55QJyZUZAcIYHKYp8bDLJm97WVmU=;
 b=dCWgzw/H5zQsImQTwiSIrcixx7v9wZf15j8e+Gs9XffEKYWTc/uJeY6JTaV/9f0Uk8
 fkouZ18SOlq8l6hZtC6Q6KL2IJ6r03bXAgtS5LFihNMmS2CuVkMVH+ie5ExFiIx6pgIf
 GGAsUUjp644QRN8j0DrbVNY8KOBLj15wSS1oP5zjyzjLmgCUuEhqDU1J88cgdFgMOqoP
 X/IPAnJKXAKvJFHotdbby/eXL7SMyi7YLkxovaTpgollFzLhy5in9H0PHMODbRRyErJq
 XwOrU3nqK9RYP3lFoY/dmWmMsBxj3YELtu0NIEFC+nM5TD99zIJoiRwFRZMNruQ4zm8Y
 HbbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo/hHiprh1AzYFgB68Qj1e7XLVuXaJ0HWmxvmTpfWTXMuztYx911n/j2iL/3BhtXSVPwGlPZHtaf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdBV8+KrO7W3mfwg03WspcB8ttVZ+KrWOcBELA4giPrdrkG8LT
 DouX1ilRYJwqV+0qN6zSEi5PQGLqWuXOjq6a8FjdP8U3h/6lgzr0b+jEZsgKgcCrgAE=
X-Gm-Gg: AZuq6aJFclDGhLQQCGjBjVDKhoLE+UxhyPUjUCc/8pIicFejtHfQdAs2ltw2tEvMVzd
 IwtZK/CBhFfRItDa/EhPMwI/TlnsawfZtThj4RJMQTYahWaviswh6WNZnNSUfPnE00U7NwdNPhE
 TIZzo/qXp592K/QhRRBRa5ia6rTcDqnWSRj+2OG+C6L7tZo71d5OqnmEhOp5NDazq/J0NNhzoKV
 ZsV+rw+MHjknqz6ZCZ9mpdUswJcLLP+7rneAIJfCVs8j55DjX2dpodl7CoEGsx6KLUp62O/ZO8w
 VEeSqytcyZlA+kc09jAS/kxG4H2LnHXSta3VnqRdjebHHC17nWmpxRAsLO/YmUrq/U59onG2cmC
 8QPZ+BVXLfXesUq4svlxEP+HUswBw/WR96f6/JczPlv0yvGHp1BDPGtzTsYAPp3oU+S70iQg3IQ
 L1y4KpsnPmwbv8T+A94PZ2wJp/dMLAjmix7wEH5ecGu3lSCnZfnz92cVxkmwgDu9LyYP4=
X-Received: by 2002:a05:620a:698b:b0:856:60d8:3688 with SMTP id
 af79cd13be357-8c70b8f9260mr718644785a.47.1769613300094; 
 Wed, 28 Jan 2026 07:15:00 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c711b95e43sm204173885a.17.2026.01.28.07.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 07:14:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vl7Fy-00000009JHD-0UeO;
 Wed, 28 Jan 2026 11:14:58 -0400
Date: Wed, 28 Jan 2026 11:14:58 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: Re: [RFC PATCH v3 06/11] drm/pagemap: Add IOVA interface to DRM
 pagemap
Message-ID: <20260128151458.GJ1641016@ziepe.ca>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-7-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128004841.2436896-7-matthew.brost@intel.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:intel-xe@lists.freedesktop.org,m:leonro@nvidia.com,m:francois.dugast@intel.com,m:thomas.hellstrom@linux.intel.com,m:himal.prasad.ghimiray@intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0F0E7A39A3
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 04:48:36PM -0800, Matthew Brost wrote:
> Add an IOVA interface to the DRM pagemap layer. This provides a semantic
> wrapper around the dma-map IOVA alloc/link/sync/unlink/free API while
> remaining flexible enough to support future high-speed interconnects
> between devices.

I don't think this is a very clear justification.

"IOVA" and dma_addr_t should be strictly reserved for communication
that flows through the interconnect that Linux struct device is aware
of (ie the PCIe fabric). It should not ever be used for "high speed
interconnects" implying some private and hidden things like
xgmi/nvlink/ualink type stuff.

I can't think of any reason why you'd want to delegate constructing
the IOVA to some other code. I can imagine you'd want to get a pfn
list from someplace else and turn that into a mapping.

My understanding of all the private interconnects is you get an
interconnect address and program it directly into the device HW,
possibly with a "use interconnect" bit, and the device never touches
the PCIe fabric at all.

Jason

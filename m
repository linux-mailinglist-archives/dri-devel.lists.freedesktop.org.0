Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELpiNjH5c2mf0gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 23:41:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA347B34E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 23:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1610C10EBF4;
	Fri, 23 Jan 2026 22:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="cBHaaBvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6380610EBF6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 22:41:48 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-502a789834fso23539341cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 14:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769208107; x=1769812907; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YRac8YnyYZcP40iPTmK71tdKpQGAH4UvdZ83wb0xrLc=;
 b=cBHaaBvkgDS8Jz4Kf8NRvzrBhVaUq0pJU3uZ/HN2PtvIx0ASL/5pobJrNLasJIJGwv
 EkcjWS4E194y0JtLHcOgS3qB++dNHuO/HZc/2ghR78tiH2H5lH/OPmO4JRCt3iqA+6Jx
 FvkwONBHDgvcbqsfyuOvK7mFepRBux4+7Cty4QjbALj4YqX9UyGgI+MbrpTYZEB43/X5
 rbFMIKN0Zf05rW8PAu4yRhH5bxvTAFdPCia4ghVGnDP4oDxuRYvVRrT/Qz8SEFTlZsTr
 YDEY9a+IkXMzF5IxD1FlQa2/21+885WAwz/EK9SmViClgP/14H78BMD/EAh0sCV5zkii
 Hqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769208107; x=1769812907;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YRac8YnyYZcP40iPTmK71tdKpQGAH4UvdZ83wb0xrLc=;
 b=BnMhl+yUql8irrpU8Dg8NwhMcJq6yuGImSyuzi/jnoXZhox2D7RsxedambUtC9VF+5
 Nno8xKNLiNziHRhI5mYLTuq+SFIEN4obDiR5NbdnVI3Ew4twXSMoGCyWQtY43g4RCsJY
 jEdSHemqiWz6YcBQwRggewpqm4BrMeEHaOj7UtjgpWxl4viaqqGZDEsBITifrapunr4C
 N1Tm/hWOy2JnLdXegACCk8B9o+3IzfOPMlstp7QNAdh4tzhP4Dl62hYIaStH23aWH+ec
 xcVKdg5RZXfkk7n4C7Tpv+W526BDuh9xeqVWKJFKqS1D9eT2rHchpVNe9qAX4Tuf873W
 tftA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUamUoMdYufDBB4GiIZDRZr4FdkvKGRu2KkcS5//zYOqQRXH3RgcbaWj5zoIHj55TcuxcgQX5HHchk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPE8/YPr1q0YpfKvU365KYpdIfpvXMHNIns5is4Jj4YEm+J9Oa
 M8ezArExVzKbaq4YU5Fz3uFp08YKkiWiq421tkD3uuIfDkDCIvmeaQp1S5k8jBkuw+k=
X-Gm-Gg: AZuq6aIQLzZG+6G0+ItFlTFKDfiaojTElLeU7l491r7zHo+essiRAtC2EmXYL6ECghj
 QlhiIwkzwLLoZWbbcE2+xAWZG7ac8b4TgQu7Vt6OQ2rt0zaCLPDyO1ZNfjslwWjNAwC+JDzfYKh
 UIZ5zAUb5hx1/LWW52e6e2pVy6+iZ3quPiix0JM+mdeEkZugatYM0k0hl66XxS8FSiQIpBYqq2T
 kLfJBMGA5TZywFFmvs0JK1Qbu/YrkGqmFKUBVHdglQ18DExc2xd0IQ378WPiVe+PZjNbTR1LVyb
 hEMnWWPqCrH6TzDpLkzIEAXPwkHxZ2OrvtVnsGN91NK15oJ3D3rjdtWhl7BUf0RqE/aWe8qKfpF
 UEfKZeE4F+Koi2AUo90hoDKRJVlEzJ6LQ112Up77lwrGNFl9kYTBAdtWNZ4DvU81TRdYsUM+00X
 0SmTL21vklGEwFIc6/KfXAZ72r71Fv63H02BeBPowCTg1Vr2c9xwRoibRkjmpwek0yi2zTUb3Sn
 XiawA==
X-Received: by 2002:ac8:5844:0:b0:4b0:6205:d22b with SMTP id
 d75a77b69052e-502f77d04admr63317271cf.52.1769208107320; 
 Fri, 23 Jan 2026 14:41:47 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50300e3692bsm13935511cf.30.2026.01.23.14.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 14:41:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vjPqc-00000007rue-0MSE;
 Fri, 23 Jan 2026 18:41:46 -0400
Date: Fri, 23 Jan 2026 18:41:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: Re: [RFC PATCH v2 0/3] Use new dma-map IOVA alloc, link, and sync
 API in GPU SVM and DRM pagemap
Message-ID: <20260123224146.GB1641016@ziepe.ca>
References: <20260123215907.1643088-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123215907.1643088-1-matthew.brost@intel.com>
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
	NEURAL_HAM(-0.00)[-0.761];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: 2AA347B34E
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 01:59:04PM -0800, Matthew Brost wrote:
> The dma-map IOVA alloc, link, and sync APIs perform significantly better
> than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
> This difference is especially noticeable when mapping a 2MB region in
> 4KB pages.
> 
> Use dma-map IOVA alloc, link, and sync APIs for GPU SVM and DRM page,
> which mappings between the CPU and GPU.
> 
> Initial results are promising.
> 
> Baseline CPU time during 2M / 64K fault with a migration:
> Average migrate 2M cpu time (us, percentage): 552.36049107142857142857, .71943789893868318799
> Average migrate 64K cpu time (us, percentage): 24.97767857142857142857, .34789908128526791960
> 
> After this series CPU time during 2M / 64K fault with a migration:
> Average migrate 2M cpu time (us, percentage): 224.81808035714285714286, .51412827364772602557
> Average migrate 64K cpu time (us, percentage): 14.65625000000000000000, .25659463050529524405

Thats a 2x improvement in overall full operation? Wow!

Did you look at how non-iommu cases perform too?

I think we can do better still for the non-cached platforms as I have
a way in mind to batch up lines and flush the line instead of flushing
for every 8 byte IOPTE written. Some ARM folks have been talking about
this problem too..

Jason

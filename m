Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBC2AfnHrmlwIwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:15:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630E7239896
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C8A10E182;
	Mon,  9 Mar 2026 13:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="nahyouYW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B577710E182
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 13:15:32 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-8cd858e860aso143406885a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 06:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1773062131; x=1773666931; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JEXl2Wcr1hEZjBx3v2qoobpIKwPw4w6oHEBSBd3/8YI=;
 b=nahyouYW6LGIKmP0FoAX4SNU30qK2HWm55fgeWFL1VKCYdYxgnxG56cYslkuzzAVL9
 WCHRRzwL1SP8DxPN/r/Zru9M3x/OmhWtzD1xEh/zHLUseEUlE36xz3nmoIKZxqPcSUdf
 e6jrQ4KdnaUzgx+27LQOgiw9Qm2JAL/DOOnVjq/EkiohAVU6fRvQKPfScpdfo52E3hUZ
 tK38zzyb5TNQnXkoVtsVL3qLqUzD16n69hFFjf1y8RvDo9sFd9KcY7+vTtSSfn9iyi4p
 DvwzXR9X6LciUADNJxeTdfSFEmmHiDynIAdKaxJKLsd32UoqGK835KLD6WAlWuvNHaFm
 SKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773062131; x=1773666931;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JEXl2Wcr1hEZjBx3v2qoobpIKwPw4w6oHEBSBd3/8YI=;
 b=NjgVibMkIWxgm2NDI/N0f3s23de1hVEzR2gOoPIguqxXNZrzTcJqxZdOoCubVa8+gE
 5AT3DZNTold4O0zPPa+Mat60Nkkf1c3CkpnH8FAfz5b2dpPrrWQz9Zhx1/i+fi3oXraS
 kAO3V/10fhAJw8vu+pR8AG+2s3cK1ERtbLA0ibpgxc/kbFZiPcI3sB8D4EPJCLscDeJ9
 r1c7RMCzlEOs3Zry4ldj1rmCedWxY5+5RD0cdbkp/9lWzURgrhhYqg7flOQDF0yF4+aA
 qLjb3xoAx2F0Y4wwPsqEzsuFcQB61QKOe5j59vOwzwwvpdcBBPkU8dORy5kDrFh9yAQs
 lT7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCqV8z1YXWH3wfPaBdz4lcH83chFK5vasXRd8bWYetQvgC1XYV/jlgW8ddvYbZoRDiZx2dlWZbJk0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOSp30JUtcsY/uogylMsU9GNaBthXbxL+fV6mMz+6OHhW83WkG
 XfJUrxHonfBUxvsJCEEpGuwJUa4rXM9MtgL293Z5DkBSvZYc8OK7awAsb3gIrVgSfs0=
X-Gm-Gg: ATEYQzyZ7evFbpcTyBlCtail9ffld9GljZep+khaAoM/Nop+jjvJx+TVeUOadZqZ6my
 p/7k6Pw1YHStPNQTLzE28wi2y/+DKkJ5pzj7gU590ndo0Fg5cgirMhwK9LwV9Z12gng7xwX1BTw
 AXgxx02pBMBQGm6uWYBP+qKVfVlmnuBPItZV0Ujy2EwqRtPnCCE2PiLNMH2otilXVxbFFzyg9ct
 bX7I1LomIXgF4dAoUaqPgZptfHvJpeIu0Amm+jT/6wtXmUgk81w2PRtBs8wYrgAfB3CaHoE/ISv
 hBgi1tsW6pPEh0C9hyXFf6fgYhaAOBkxYEJK7F460GQFAkpHKREcShidRFFdrbqKo1KFFS4nCeP
 g1Ii84sJYzI/vqjBqHZYiu3BhIn4uFBi713zPRToEr9xs5pnMcCBhBX5rVFXcfwDgaDFUWPPr5f
 xtzGGiRFBcEIbvk+gsjOUJgEQR/1qipP7TFZmUTmxm3e9/BHC0wwJyzqM+C3xYj12+V9XIIjwuv
 6hP5dl5
X-Received: by 2002:a05:620a:4381:b0:8cd:76fa:1be1 with SMTP id
 af79cd13be357-8cd76fa1ff3mr1023224185a.14.1773062131558; 
 Mon, 09 Mar 2026 06:15:31 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cd7e857037sm378431585a.20.2026.03.09.06.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 06:15:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vzaSI-0000000G6JW-1RIq;
 Mon, 09 Mar 2026 10:15:30 -0300
Date: Mon, 9 Mar 2026 10:15:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
 m.szyprowski@samsung.com, robin.murphy@arm.com,
 sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
 aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
 linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <20260309131530.GJ1687929@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308101948.GO12611@unreal>
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
X-Rspamd-Queue-Id: 630E7239896
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:jiri@resnulli.us,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 12:19:48PM +0200, Leon Romanovsky wrote:

> > +/*
> > + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
> > + * (shared) for confidential computing guests. The caller must have
> > + * called set_memory_decrypted(). A struct page is required.
> > + */
> > +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
> 
> While adding the new attribute is fine, I would expect additional checks in
> dma_map_phys() to ensure the attribute cannot be misused. For example,
> WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
> that we are taking the direct path only.

DECRYPYED and MMIO is something that needs to work, VFIO (inside a
TVM) should be using that combination.

Jason

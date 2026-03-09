Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BBtNKMIr2loMAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 18:51:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1386823DF78
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 18:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31C810E57C;
	Mon,  9 Mar 2026 17:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="2wE2mVC4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D3E10E57C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 17:51:26 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48529c325f0so22160835e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773078685; x=1773683485;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ix+vqdOy5SvfTABiwCl1s7T3mrppwl4vO9UcVMmB22w=;
 b=2wE2mVC4yFP32+vuah/io/kBWCUOPuiAFd6VyMG4bWY/fgrBEK/QTPFw8Ge8+/ggYd
 tdZRCMudivCZJHwjrFZ0L1gFkFX2XQXWjd9VHQl7ogYP2Rf0X43f+fSiL/dBr9gPaK6Z
 O6EXXo8nZBNMg6eESgyIHySuJR0EAqqxdcXu+1CGUAmGoLh0xTwSDVh8yfzB8x/o0UhG
 zeX1hHNJmG0eLe+UxQliUsSRv61vS3zUjtQG1yvdHdw/Yl0NtXoNwN3KmlADlFNgGkxp
 lUZelR8Sr6bn3IQehUBcuzu1EJAWZKXEJNZEezDtPUkngfBdqd4f2/sLFOIk5n3bcyzK
 CGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773078685; x=1773683485;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ix+vqdOy5SvfTABiwCl1s7T3mrppwl4vO9UcVMmB22w=;
 b=gfebwEMddUSBWyC5uTIqtfDMu1fRpFg92qs5f1I3xl5n8GsVAHEiidtKGrVYJc0Lq8
 nY831Ud/NiL4tD0nA07a6+z/4Gr4gDwVuGtS7kRXoFrBV/TvZ7T4gOqgdR0yXc0b4kGP
 McNd1fxPqxLGLahluxkekHjOYBTdM3Nyk9vdb0ai9e7JlNJQRdWLLsNvoXiqWr26vjBw
 ThbmNs50zbwaiO4BGNvV8UJgw+UcwJYyJpId/Q2e7uR3p1S2kNicqag3jEvCWTrRcPPl
 vUQdktsl4CB96tS2FXCo95JWadX02qdKdzMcps0MZ//hmXSwjW3D+LDt6fQX2cftvJd2
 0mGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnRDoOAparue6A2AeY0iLsIdYhJuAMQ8b5wWwoP0rtGpSGmz3gx2qtWJ/vcPpvqIHUX0tgGLrCCB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqGyjX1wehEFlrHlVIDq1QLCRzzxIIXy1pYVJv4ZKyGcH2y0Nj
 RvkbKqHNN7IOcSIpfWECmXDWMLFqTqh9Ewe7tEhA4zhYE9ORwultqUEIz5InORQcN0U=
X-Gm-Gg: ATEYQzzJ2/94p2/Bbw6/2TTkEqo/jvGU7ropPkdyv3it3/kXDdJZWEObZg9fLDH0eFs
 MFLeOxYimPi3jOveerTL7fDCOFgvOOX4KpG21z4q2HB/EfY2OO+ZmRCaTTJ4yBt4wVqwSWtNMSv
 uZi5nDzra7JBueG4ZFt/bqAQKd56TRNJq3Px1L89thV8O/HNHligcQGM0lNA0K8Z0VW0JKXzJQt
 zi7XYWjNLFTTEYXo6iFJP2W3ELuPdHa6uTvWIqm5tQLHXuCjs8QuRIA6OV2mu+6YPFncQ7viYVJ
 vxKLyWov8GVne3QBSTRgYYtk46T9hqtI7sNepavvvTi0HBiB0Fd0DzetXjSdMqTnQzM5aQQTAr4
 UmKU86c7FCErvTfLpUpaUs4EtcXorwi5H0GAkNYj9aQzC7GVhNW/I7TEMvfdRnySFhHcLO5ht+b
 fFm7JFVmiRSZE7xH+gNUeBMZQ9EQDAd8k=
X-Received: by 2002:a05:600c:5250:b0:485:2fe9:3375 with SMTP id
 5b1f17b1804b1-4852fe93587mr147475155e9.15.1773078684896; 
 Mon, 09 Mar 2026 10:51:24 -0700 (PDT)
Received: from FV6GYCPJ69 ([208.127.45.21]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dadac2a7sm28642353f8f.15.2026.03.09.10.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 10:51:24 -0700 (PDT)
Date: Mon, 9 Mar 2026 18:51:21 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, 
 sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com, 
 m.szyprowski@samsung.com, robin.murphy@arm.com, sean.anderson@linux.dev,
 ptesarik@suse.com, 
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <phry3e2dtgxzxdqvrnqfuskangp4al64f2auithwme5kwkgepe@7qtftrhgv4l7>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal> <20260309131530.GJ1687929@ziepe.ca>
 <20260309140233.GW12611@unreal> <20260309151857.GO1687929@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309151857.GO1687929@ziepe.ca>
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
X-Rspamd-Queue-Id: 1386823DF78
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:leon@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Mon, Mar 09, 2026 at 04:18:57PM +0100, jgg@ziepe.ca wrote:
>On Mon, Mar 09, 2026 at 04:02:33PM +0200, Leon Romanovsky wrote:
>> On Mon, Mar 09, 2026 at 10:15:30AM -0300, Jason Gunthorpe wrote:
>> > On Sun, Mar 08, 2026 at 12:19:48PM +0200, Leon Romanovsky wrote:
>> > 
>> > > > +/*
>> > > > + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
>> > > > + * (shared) for confidential computing guests. The caller must have
>> > > > + * called set_memory_decrypted(). A struct page is required.
>> > > > + */
>> > > > +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
>> > > 
>> > > While adding the new attribute is fine, I would expect additional checks in
>> > > dma_map_phys() to ensure the attribute cannot be misused. For example,
>> > > WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
>> > > that we are taking the direct path only.
>> > 
>> > DECRYPYED and MMIO is something that needs to work, VFIO (inside a
>> > TVM) should be using that combination.
>> 
>> So this sentence "A struct page is required" from the comment above is
>> not accurate.
>
>It would be clearer to say "Unless DMA_ATTR_MMIO is provided a struct
>page is required"
>
>We need to audit if that works properly, IIRC it does, but I don't
>remember.. Jiri?

How can you do set_memory_decrypted if you don't have page/folio ?


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDZtO6tGi2kJTwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:54:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C6411C241
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D038210E5A3;
	Tue, 10 Feb 2026 14:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="gGlXtEfl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A32C10E5A3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 14:54:30 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-8c532d8be8cso534583485a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 06:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1770735269; x=1771340069; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Agj0c4R15XGINXILYWi8Un1ej02BkfWDujptUtk/bVQ=;
 b=gGlXtEflg0NzCHvsmeZfWFTYrXRpj60wGrBoE9mP2Tc8ZD1IGZTe3UddxespUJv2CK
 IxJvtdzB4M+AQbacL4i07++9k7LuurJDtOnWQoGVMwHGNfi0JMXYiLcyRS470+cB5WiU
 t1n0gkjlcGEwuEGJqvZDaGCtyRIpH3Yf+0xc/BHk6XwawI4wm4r5IsutyXTS9VAyET6b
 gtx0o10hIT7Y0ToTOuZ1k8k5bG+MefWoNxCIRWtOTZjbZK6dF3fWWw7y6Pj+ZfRj5buW
 XKHMefIlFBIg7ZiJKa4tfizducDr249tXM5yrXDf7Flaz1viIPd6HsJUHwqucfkw2zZW
 EjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770735269; x=1771340069;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Agj0c4R15XGINXILYWi8Un1ej02BkfWDujptUtk/bVQ=;
 b=jP0aGKMsTGVGZMFmXYIHW/FO+HJiy8m0UL2E913OEHkAsoxngCKa3drTxNahJH4E3l
 W197xLOCF64SGUf/e48cVVBIY1bco7sdIu3QdA6Wqdg1a/u4xgQZut+mm64MZN+d6cDk
 Ir8En/KR11O3OT7n1DYq+oYHBdy6nbrcJTw3FVYq5hpA31obNcPPw9WcEZbqQgit2X5h
 Tmy0i0pVrrnOeBXf87ZB1bb67ikvTidp3rcvrt8UX1C8v2rQDVHm7rpLANWOlj+emB+I
 uX2+SN4g6nErQ66961Pp88mwTflX/orT0GmDPNCegBzhs8pdHSoyqwcBRar8RW/AGTMc
 zQdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVylCkUF25KKyzHQMrE2WaqtetxyawtmL/0Zr0ku/bvzOuuDPWn2FSECsL1oXaSAdWh2a1EbsF83AY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD1jZyAY2A9brsx49pSJ4Sjw2Gw0zFr39IcuA2eIzbvvLXV6Uq
 5szSEKc2peQx2YK3ZreijbwrL7wj8L7iD0yFFcOvnqduLJv0ugUpcujjjiEGjMVKrqY=
X-Gm-Gg: AZuq6aJn9kWVuZD6gf+lKkJAI31pTyy+lJBVLQjazUgyATGHA6AKRj5qlkVYCEpODIa
 aQ0HVqC5NiqTjEuDcMdQeQa46DBjm6DWm77srMxYCdtPkkuPKwfZQvqGSvJktD13kE89axm2h9h
 qhmw6trtw6IeSVNHfFIat3c2Su9k44q7xjI+fSIwOhIVQSea9DrTwcLpEC/O9t907DCyFTpLPin
 cPVdHgyYhvA4ht+bXuIzHds5aIjH7NCGnXF25QQglb82vWi5h/1/z9gymUaDmguHmDZbLE5o1D3
 /x5BhUeNBB8YI8KW6m0qL0xg6lft9lTTRmni+kFu2hPMmzSMbUlZW8ahCPQjvEp3+bw1F+9EpW8
 7krXvnaPuGy6iXsorZWoXJUJMyMcLdK5oGoRp2mLwz4Io5yKjIxTN+FMY3e0ud/qtgePJLaiNxl
 7+2AmI2p3WE4ym3U2J3SLGozWdZ25oA6AKrJhWr9cTYBlhDnYTeSDKo+M3xhcLezWdRe3MsoMhR
 q25oh4=
X-Received: by 2002:a05:620a:2804:b0:8c5:2f89:6904 with SMTP id
 af79cd13be357-8caefeb4daemr2082380185a.45.1770735269414; 
 Tue, 10 Feb 2026 06:54:29 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9a157ddsm1121052485a.28.2026.02.10.06.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 06:54:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vpp8F-00000003mvN-47aU;
 Tue, 10 Feb 2026 10:54:27 -0400
Date: Tue, 10 Feb 2026 10:54:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 tjmercier@google.com, christian.koenig@amd.com,
 m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
 sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
 aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
 linux-coco@lists.linux.dev
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap flags
Message-ID: <20260210145427.GA750753@ziepe.ca>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
 <20260210002927.GC943673@ziepe.ca>
 <tgvdjszwxggr53digbmddcbxvupzl4xcoprofkgrs2kgf6rknx@44ebljjpghjm>
 <20260210124357.GD943673@ziepe.ca>
 <y7gvezflidmma7odnut2rmlecsbxahrcwpmoevfnhzjveusuwj@6qxqogin45j3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <y7gvezflidmma7odnut2rmlecsbxahrcwpmoevfnhzjveusuwj@6qxqogin45j3>
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
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jiri@resnulli.us,m:jstultz@google.com,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:leon@kernel.org,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 34C6411C241
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 03:49:02PM +0100, Jiri Pirko wrote:
> Tue, Feb 10, 2026 at 01:43:57PM +0100, jgg@ziepe.ca wrote:
> >On Tue, Feb 10, 2026 at 10:14:08AM +0100, Jiri Pirko wrote:
> >
> >> >I'd advocate that the right design is for userspace to positively
> >> >signal via this flag that it wants/accepts shared memory and without
> >> >the flag shared memory should never be returned.
> >> 
> >> We can have the same behaviour with the separate heap, can't we?
> >> Userpace positively signals it wants/accepts the shared memory by
> >> choosing "system_cc_decrypted" heap name.
> >
> >So what do the other heap names do? Always private? Do you ever get
> >heaps that are unknowably private or shared (eg MMIO backed?)
> 
> If I understand the code correctly, you may get something like this:
> $ ls /dev/dma_heap/
> default_cma_region
> protected,secure-video
> protected,secure-video-record
> protected,trusted-ui
> system
> 
> The "protected*" ones are created by tee. I believe they handle
> memory that is inaccesible to CPU.

If that is the only list of options then maybe just the name will work
Ok.

I *think* CMA and system should be reliably CC private.

The protected ones seem to have their own internal definition, and
probably can't exist on CC VM systems..

Meaning we don't have any shared things leaking through which would be
the point.

Jason

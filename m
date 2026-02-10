Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGmEJhUoi2m6QQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 13:44:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BB211AF6C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 13:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E2510E045;
	Tue, 10 Feb 2026 12:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="B6K2erXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DB210E045
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 12:43:59 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8c710439535so56230385a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 04:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1770727438; x=1771332238; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=N5ebXMgdbEnP2n7MqO77VYCN9M2l8thAEykxr97Y/HU=;
 b=B6K2erXct/MJU6/fRx1IHJPoW/oePGGIh93k1/MdmYBjx21NFl+QM87RGy/L7aX0c5
 KLohdPZ6Ls4V0tlNNOIgBZxN2rqKJRWu8a8dYT9rDpi6TS1GN76LeL2derPomlCCZg2m
 1EzJTIsSDXeJzeV4Chvz1KizRCfbpcZ85udShqOx5sqQNt6OkJG91/EbHrFcHqPDMnrQ
 0oJvDpEwk9XXwhe3kOK3C8fM/RbXNniZMhn9oYe1OY+sGo7AKC6KtmAAEBUZTj4JLeV2
 jSMIkcsK/8IYjVKUk5ChWvcIvrBAkgAsXE8orbEOBUDVjhXdmpTcEYGQ4B/ejFWSDNYh
 WiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770727438; x=1771332238;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N5ebXMgdbEnP2n7MqO77VYCN9M2l8thAEykxr97Y/HU=;
 b=TliK1E0tJnAYqRLfwt7ILbVe/X0p2QRJVMpete9ghg9w/enC1NW0LpMCjIyW5ymER7
 TM1sien5WPOmCldYe3Y23akxDkwvQ4+U/bLccOMWGJ2Iz2GWkSV8YbWLY8hOMzudMCpr
 pnJviVWDNDwAlkJmzqRM/6LfqtrBEBLxTnBKW7UILNl3nbbUKJBTszja2p5JQaG2JwGo
 80cUWyNTZ5CjLyzgRXdoYQ0McV0wI8DwHR75mtzxPVM0kvsPAWK3//tCbYAPdjJ767Aq
 0LIdsr13UF9GKzeXklU69ZTSmyQBGMs9sMxrAYhqn76FnvufVsWI0jxhTSdwfRS/HZNd
 H0sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/eW0ghKJ8+m5oep41BzVNt1xzg0BTRaVP+UscCkCOAEXfj0OeoOEnl4GxSVFaWnLAWCk8ymJRjvg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxl26uQKMlCD+R0bBoUKpmh3TNp7IhSL1iphj9hBRCBlvsn8sDL
 9NSS75p3fHTYOP9Kb6pDpp1AbgBiL0ew8Zr5iFQ95troGlZRkEVkaBRavCmGQyKhmEc=
X-Gm-Gg: AZuq6aK5/daKpfXyJ/+B4JVBVJHfwVF3Ld5SrafY41Dhfw4FIHqcFuQxGhYFUy6cMax
 w3dRR3GrQEAD+KkRV2rTVK1JEXxPLzMxv1I/JCaR53bSCV+eqyCI0ISogjTG88NJnWxTEsydcGI
 oYrGGsrH7GCsy6AeIe4R9UR/y9umsJ84Mtcxy5ZqHCi2tDBeqzgpzg8p4igw6eOdshZguEv7dtj
 HVygoa1r/g6xr7j5w6F5b5aRqvsnG1JR/Ss6hTgtXLFqKxgbbbVY4jRL65gTl2HHMhbgj14Ot70
 XdCySWzk6YVtC2Ftp8uEtC2bLIyoyPkZqBpWb3quB1w+cOVMuJLZkKdZGAU1OhfdDh1O11H77ml
 bv1v3913BV9MQCa85KuqeQcf13hy6DcFaQASqojEx97B9a0fdvoyOdkbZjt260BLcHJpxOaLjVW
 BqCxrd7JxH/Xj6tIL+R+OBC2sY+HSKypDb8TVI7MzgeyZNWsfuJWKoVr1wbHLnZpWYQRbEiubHX
 RiBDtc=
X-Received: by 2002:a05:620a:40c7:b0:8ca:55:ac60 with SMTP id
 af79cd13be357-8caf16ec83amr1829777785a.78.1770727438524; 
 Tue, 10 Feb 2026 04:43:58 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9ee8593sm1019180385a.36.2026.02.10.04.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 04:43:57 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vpn5x-0000000315A-13dh;
 Tue, 10 Feb 2026 08:43:57 -0400
Date: Tue, 10 Feb 2026 08:43:57 -0400
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
Message-ID: <20260210124357.GD943673@ziepe.ca>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
 <20260210002927.GC943673@ziepe.ca>
 <tgvdjszwxggr53digbmddcbxvupzl4xcoprofkgrs2kgf6rknx@44ebljjpghjm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tgvdjszwxggr53digbmddcbxvupzl4xcoprofkgrs2kgf6rknx@44ebljjpghjm>
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
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_RECIPIENTS(0.00)[m:jiri@resnulli.us,m:jstultz@google.com,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:leon@kernel.org,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
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
X-Rspamd-Queue-Id: E0BB211AF6C
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:14:08AM +0100, Jiri Pirko wrote:

> >I'd advocate that the right design is for userspace to positively
> >signal via this flag that it wants/accepts shared memory and without
> >the flag shared memory should never be returned.
> 
> We can have the same behaviour with the separate heap, can't we?
> Userpace positively signals it wants/accepts the shared memory by
> choosing "system_cc_decrypted" heap name.

So what do the other heap names do? Always private? Do you ever get
heaps that are unknowably private or shared (eg MMIO backed?)

Jason

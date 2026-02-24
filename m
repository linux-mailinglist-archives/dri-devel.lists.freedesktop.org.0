Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIkeG1X2nWlzSwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 20:04:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87B018BA70
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 20:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C001810E180;
	Tue, 24 Feb 2026 19:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="pG+4z42M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D53610E180
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 19:04:48 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-896f44dc48dso53895106d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 11:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1771959887; x=1772564687; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FrFsN3h74aSMBKIOJ1HcZrCNEQY8luWcshhq585BEE4=;
 b=pG+4z42MZuPjoS2AU7Wk8+RC2wgZvkiyTOUSDCHhBdgOnNYJ6Mn9QPhQmOMuKfvBsP
 tYRcS3sVcokGX/SxLhcwU4wP+fVS2BbWv+XMQSOnvucMvM09fjDorhtu7r8kGwXWIl7n
 4Fl6bfZ/LFFQzj9eDPOHb+a883+O/INBPWBIUhMJLjKXOwbIlcxYua6Y7ka2xVA0YUKZ
 4P3mFEGO78nlrxfo4t1ZdokwaXSwbF4Z6t8PvA9A2TXalCvnWWdrNtR+7IYT/KIW1XyJ
 lRPxD3h+clbYcgkQbtAiT39wbP+GaTpVuVg9f1zM0iPji2Ne3OuC4GAjPQkUjf1fy1e9
 NPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771959887; x=1772564687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FrFsN3h74aSMBKIOJ1HcZrCNEQY8luWcshhq585BEE4=;
 b=LUIN3Q0fV6OJpjAK3O5nafb92SnWvlt2ktjx8Px2bWZU3QBUM/fEDb1i1PDjgKGaA9
 AfsLgnJB3Hyt/hEi/e9bIMFVAUC455c39jEJHFAQl/GYsx+U733ke5KFGfOM0j1bQ8Lg
 r7i268f954ngoeueIoVeiD9JgrC+AfBoSNFfbttF6PVzArEReQF2Zpca5X23v9osj+8d
 kSfhc7vbkwAji5e0rzJLiMUw+Bqu8Zsbu6TYXQq4LqFnBDzrDAScHGzAhwZZJrteAApL
 cI5OIUJYpyAKkZooj85HJlNc9aeyWNxBVK3a/GfWTXqpttUb9LUjHNm8v+Ww0qScuZe+
 u47A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsbU00ifuHFSH4gxGpITGGvbRZZ8yUhuwM+nx76nxlDUlVze0ypFZsEfD0Fw5yrIf9NVklodr9Yak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQTe5zpumczAipJvlnTAyUAFDS6jfYiztZLMXmn9PsML1qZ9cn
 KBuAE070+WyB+8JNAUaOJCSzGUOPsR5YmwvJH4Tf0YsSKdeVRDyDA5mxGGpoD+wUllw=
X-Gm-Gg: ATEYQzzM/HntCNUfAfvffXlgBorhKEP/ct+OqeN1g9Ord4hcoYcziiRCrrigwUH+Bws
 EYAF4cPezNz9phAnGKMoIuJKRzvZ3AVwgZU/VUlDTG4Sh0+tIL+CLk4zLQc9OIlytGXMV25qXqC
 iBxlO36bI8W3iRRnpN3Dj4LWv+EslO4v+uQR1Jj1/0MtBBuY1eSSCht6sRcJ6f60dkprP/KhJPB
 5GSs+qTdn5S9uFngbWHRe351EnxXU/0Ca0qx5fbeK3T6HghHwgywB213ssXEVWW3Z+rJ7ehdFnE
 D7QDMZqq7qeMDBQjIR2FsPDgV6yXDprf1DkTaudSHXIZNNpbAYjSeXaYiyMcn7jTFy65ABWd0rF
 1wmJ13K6eaR1B14T/Ldj7hB6W62aou5hhaeLY/h02Q9Wx5xrbWzDg2j22R/vtfU6awg4dWlJpoV
 U=
X-Received: by 2002:ad4:5cea:0:b0:895:46e:e8a3 with SMTP id
 6a1803df08f44-89979c3c12cmr199567356d6.4.1771959886898; 
 Tue, 24 Feb 2026 11:04:46 -0800 (PST)
Received: from ziepe.ca ([173.231.112.170]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cb8d103084sm1292269385a.33.2026.02.24.11.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 11:04:46 -0800 (PST)
Received: from jgg by jggl with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1vuxi9-0009D4-Vg;
 Tue, 24 Feb 2026 15:04:45 -0400
Date: Tue, 24 Feb 2026 15:04:45 -0400
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
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: system: add system_cc_decrypted
 heap for explicitly decrypted memory
Message-ID: <aZ32TUEy9CB6rs2d@ziepe.ca>
References: <20260223095136.225277-1-jiri@resnulli.us>
 <20260223095136.225277-3-jiri@resnulli.us>
 <CANDhNCp94KG06P_7ivMTNA27qEM9g8ox-h3b_tZ=v6e-25xJ3g@mail.gmail.com>
 <5z6d2etfr24oscoxhk3samf2bbhtcz6hymf65cow76omagsplf@6gdaev2perkk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5z6d2etfr24oscoxhk3samf2bbhtcz6hymf65cow76omagsplf@6gdaev2perkk>
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
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: B87B018BA70
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 09:32:01AM +0100, Jiri Pirko wrote:

> >Should there be some global list of leaked decrypted pages such that
> >the mm subsystem could try again later to recover these?
> 
> swiotlb does the same non-recovery leakage. I belive is it not worth
> implementing this at this time,

Yeah, I agree

Looking at the callers the purpose of the return code is to trigger
the memory leak because there is no way to recover from this. We have
no idea when in future the hypervisor might permit the operation and
we have no way to keep track of the memory until it does.

It is not a great API design at all, it only makes sense from the
hypervisor perspective where it can run out of memory trying to do
these changes..

Jason

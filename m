Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMZHNO57imnJKwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 01:29:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E1F1159D3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 01:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D28A10E49C;
	Tue, 10 Feb 2026 00:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="myV0UOnW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EFB10E49E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 00:29:29 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-50334dd44d2so42493021cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 16:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1770683369; x=1771288169; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=x6h4j6WhKvTbDaZfOUKYNWWIjZl7N5IPl8TkLFVZwN4=;
 b=myV0UOnWSot0XQHBZFErk2Z+f1XeMKj+rk8eYtWA9MDR0Y1q5BAyQ8mT7YxskdNLaB
 M8M4yDcZxJvmKjE+vO2theQir/VvpqVjCbRyaUgxrY2BojwmAK5MVQjeBFgLzeU1sJoc
 tMV/tNi6q3wUqsvXCOyTTSsztOY6yLxdNOK5jPUz91k2+MMyH3e3EC1VJRugIy6+BSLz
 8QtxN2+4EDCxvqC1iKkYxrrPee0UuzadrZAA5+hupYDNfaYmcfQ+mDNkZpr7i6ZSt0Wy
 qgTfS3Obq5K/Bpj9ASmxSzgu3ZGuX6EF+Sj9Iw0JEk3ES/zujeio/ly25LszNL16A4Op
 dCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770683369; x=1771288169;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x6h4j6WhKvTbDaZfOUKYNWWIjZl7N5IPl8TkLFVZwN4=;
 b=XdM9XwKTn0Q3uOXjWrI76OTcXyoqpuVcQ2uQBU+Mc9BJJIarmkx7LtCn/CIL+34+sh
 9tkeimruEVQx6aKCnQOp4mYxxcGmBdOtuZrEigp74oIqvwYmuyqXooYPcGkx/UATBmHA
 +4mRQSSPolFrNGjKm/l7eThakGk2RLFOUvMUgGyWAwZkU7KIBv//duR1Xx8eY6pFDsBw
 MnrRFRDc2rA0g7Y0iKawohaCOxoq9yZFWYy+hp1MCMFpCOI1A2fC7nugxwYg4UkqI/cb
 lDtMJYSCHb8ZVwvuCdjHpPHRjfRNinuQ1L8GlhvNQXnfeoeU8KIMnBxWIjdIJ3mRC3gs
 ZIJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+VkD1qsYnrSCumyUNfqrzh181SqoK8D0xiBM4NfXcG97w8gsHAucH5+6iFHlGU8lt9G1aee0ArSg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHmItnwsepNj8+Cd0mORI4tqaozk0UbuqzcfWKawSk6MXOfWIX
 uqrAREwf+T0lJbbmZLLqhQqe+5LpvTm4L5vKVYNPUH//p5OkIlyHRfwLzB87AKlv9Xw=
X-Gm-Gg: AZuq6aKdPmuL4sKu2zQhSG/HIO6pblSAyymLGFkRbJCq2eS5Nr7tMjLYoyInwv9JYW1
 MnfLh0wtaHoTRuI1hhmdUpGeIynH0yLRkaSM9xTklZWabrW8LlMzhMBlpADNQBTdVmBPoYmksUp
 cpiHSmHKclHqezSfoS3I4xHzWmJxzktnH/QMCqKBBG23M/j+M6NP3w6hVFH0YMpN9kVL0WNbraQ
 Gervykqb7CZAsRtPADcSCkMdBQy00JdLZbjZrRQC5UggarkTe2r+tURYM5oMn/FEeK8BU3QuxWM
 rDyt8Xn9W/ot4JoeyY8ZzX9w0hRXxfJnyUjIF9Ewfqx+1Xm7eb9XBajQuaeARI5SwsoOHb8ZVYq
 ZMFX6uBpevhzcqRtS7ncPYDmxavhd9bn/Zu6KlM1+FimKE1pOxRcynW+4mjFDsZcWXo8WKJJ1f3
 HW5+2ToPS8f4DGAQPigPHHooip7EdFzhT1LXtie+Hti8K3Mu+IOUXZRDBD7uEI2kN+BeOdIujeF
 oJQZE0=
X-Received: by 2002:a05:622a:54:b0:4f3:438c:71 with SMTP id
 d75a77b69052e-50639889de0mr182445181cf.24.1770683368674; 
 Mon, 09 Feb 2026 16:29:28 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9a157ddsm979856985a.28.2026.02.09.16.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 16:29:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vpbd9-0000000GngP-1JAF;
 Mon, 09 Feb 2026 20:29:27 -0400
Date: Mon, 9 Feb 2026 20:29:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Stultz <jstultz@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
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
Message-ID: <20260210002927.GC943673@ziepe.ca>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jstultz@google.com,m:jiri@resnulli.us,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:leon@kernel.org,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[25];
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
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 43E1F1159D3
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 12:08:03PM -0800, John Stultz wrote:
> On Mon, Feb 9, 2026 at 7:38 AM Jiri Pirko <jiri@resnulli.us> wrote:
> >
> > From: Jiri Pirko <jiri@nvidia.com>
> >
> > Currently the flags, which are unused, are validated for all heaps.
> > Since the follow-up patch introduces a flag valid for only one of the
> > heaps, allow to specify the valid flags per-heap.
> 
> I'm not really in this space anymore, so take my feedback with a grain of salt.
> 
> While the heap allocate flags argument is unused, it was intended to
> be used for generic allocation flags that would apply to all or at
> least a wide majority of heaps.
> 
> It was definitely not added to allow for per-heap or heap specific
> flags (as this patch tries to utilize it). That was the mess we had
> with ION driver that we were trying to avoid.

I don't know alot about DMA heaps..

On a CC VM system the shared/private property is universal and applies
to every physical address. Not every address can dynamically change
between shared and private, but every address does have a
shared/private state.

By default userspace process generally run exclusively in private
memory and there are very few ways for userspace to even access shared
memory.

From a heaps perspective the API would be very strange, and perhaps
even security dangerous, if it is returning shared memory to userspace
without userspace knowing this is happening.

I'd advocate that the right design is for userspace to positively
signal via this flag that it wants/accepts shared memory and without
the flag shared memory should never be returned.

Even if the underyling heap only has shared memory in it (eg it is
mmio or something).

Otherwise making it implicit, perhaps based on heap name, sounds very
tricky for userspace to actually use fully securely.

Again, I don't know alot about heaps, but perhaps the missing part
here is that on a CC system all existing heaps, other than the one
using normal system pages, should be disabled for now. They can come
back once they are audited as to their shared/private state and
respect the new flag.

Another view is to ignore this affirmative handshake and just make it
implicit on something like the heap name and hope userspace lucks into
something that works for it, and doesn't accidently place, or become
tricked into placing, sensitive information into shared heap memory.

Again I know nothing about heaps, but this is a fuller picture of the
security sensitivity and what to think about with heaps and CC VM
systems.

> Now, there has been many discussions around "protected buffers" (which
> doesn't seem to map exactly to this confidental computing primitive,
> but sounds like it might be related) 

I'm not sure what protected buffers are, but this CC VM shared/private
(or encrypted/decrypted) is a core kernel property that applies to
every physical address in the CC VM.

I assume protected buffers are something more platform specific and
hidden?

> But, it seems like the use case here is still far too narrow for a top
> level allocation flag.

CC certainly is a narrow use case, but within CC I don't think it is
narrow at all..

Jason

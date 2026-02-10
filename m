Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCYYIuj2imkePAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:14:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B45118B89
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2760410E520;
	Tue, 10 Feb 2026 09:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="p0Avxsf2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB12710E520
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:14:12 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-480142406b3so41497815e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 01:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770714851; x=1771319651;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1n+Dri69ZtsJrD5f7LTNPULLrK+Vi4bS2T/sVYZliNI=;
 b=p0Avxsf2uZuzqxsF5SUV0UZvFJuzABBZRCQHE7Y000H3uugIiRkfAJFaWZHHFDa7Sf
 JOWnWcDZDJd4Gq1obfy3XI3qBJ5Hrci4XI2CE66mU38iNH8EqYvNYYHrRVA0kZv9tgQG
 H4kxDSWhZd8qmiY58S4WSZrioDEiseoseXAMrjAWn5fU5k+JIdxheAW/7LNBA5dIEXbi
 Elr1FbvO3flxcW4+kx+vFbIa8TOldZNpghaUxmL5me3VPLTZpif5wmPSEJZPL8VP4kwd
 TTXLHSK1aGQV3bQU0E0nY7xf9IWngtwG1t4lrujKDd/XOWXKzok77E+UVcdwKWtlaigW
 OJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770714851; x=1771319651;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1n+Dri69ZtsJrD5f7LTNPULLrK+Vi4bS2T/sVYZliNI=;
 b=nhsxcEeSl9smUkbjDnhmBmoFQlyUFsjZvoCC6zd8bnUYIKYV8Zgrs1vO59IX5EvDoS
 Q16Y+aeayC5PQK3TChY0lB+8GJ5dCiEgG0KwETaWsRlglsN/SkP0+Y6pkHqUPTmSJ3Ai
 lkKu3OYlnvRTiN3GOW2rajgZNEl68lpaS4GEX2YTIrltNHCVl9ubpErGcJ50f/Um/IdT
 6cEZuepwLBPwoFhySUHHnACVBiALW2LToXfqUj4PLhxjApEIxmEcwPgUOrLfmFrQN5RO
 8z8fJDh/ZNi6JoAXDbatLKHoRR73T0JU4jMmTLdaflI7Wr3nL7Z2bxZDE/ZpXPUQ1Quh
 1qVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/fhptFqqa/a1vc7S9uP+C7ADrkxwPj7hsNP8qIFaJHBWdsq6q+Ux/52kyT0rF9XkZKOw1RVUAZXo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLgWFeGKV971Msl/464rrEEbPL/PdZxzOQr+SSgmcYSb8JP9S4
 bCkCKTUNM2VAldTqilZDZZ2o12gQ95TvZ+2QcescMxyBvFEkhmWXiBiuashDnmMJxzpLx7sUBvu
 +8yVw
X-Gm-Gg: AZuq6aI3nnwPSusO4hZSE4FT5BlCL6qfBs2a6SXk25CZdS4SbAKc8ND9KeAz9HlpkTm
 7PmGP60a48U5ZckhI+nFlyCnVFEeNlAuGvD8fNZ4yl1A/pcJiIIDs9JkT9A0fXpPkZcQBU/18k8
 QqYXCbx2CuYvNGJapzE+7jiEd6jOGOPVb98X+g9VeEUY1iAckPCmB+bE2f5RRYL04DNcGMD5WBa
 xJuFQGcOgshxocq7YLbATRg9I5UtLgxDWf0CZjorT4+H36/3s47I9gFk1VHqNnXwo4gwMZQS0h7
 A+jPRPBAWkqDfA06Ta474FB/3R53vXr0PQyJzAVt21VMbSRJ6XAIVBTkbNYsn622Qbn2gSFiVY4
 M5t9cNnjCKo3xAG96mIubTHU5KVNilZqN3v9H19ne8NKTbhbZuOwpvzS0Qcukh35e8C5ejCU6nr
 kP9FL/WhBN8Ew02nbh+W0COyuMUJ3irGCBEp0=
X-Received: by 2002:a05:600c:1daa:b0:475:da1a:53f9 with SMTP id
 5b1f17b1804b1-483507f08c6mr21095375e9.14.1770714851014; 
 Tue, 10 Feb 2026 01:14:11 -0800 (PST)
Received: from FV6GYCPJ69 ([140.209.217.211]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7f1e4fsm61726245e9.15.2026.02.10.01.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 01:14:10 -0800 (PST)
Date: Tue, 10 Feb 2026 10:14:08 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, 
 sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
 robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev,
 ptesarik@suse.com, 
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap flags
Message-ID: <tgvdjszwxggr53digbmddcbxvupzl4xcoprofkgrs2kgf6rknx@44ebljjpghjm>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
 <20260210002927.GC943673@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260210002927.GC943673@ziepe.ca>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[resnulli.us];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:jstultz@google.com,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:leon@kernel.org,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,resnulli-us.20230601.gappssmtp.com:dkim,ziepe.ca:email]
X-Rspamd-Queue-Id: C9B45118B89
X-Rspamd-Action: no action

Tue, Feb 10, 2026 at 01:29:27AM +0100, jgg@ziepe.ca wrote:
>On Mon, Feb 09, 2026 at 12:08:03PM -0800, John Stultz wrote:
>> On Mon, Feb 9, 2026 at 7:38 AM Jiri Pirko <jiri@resnulli.us> wrote:
>> >
>> > From: Jiri Pirko <jiri@nvidia.com>
>> >
>> > Currently the flags, which are unused, are validated for all heaps.
>> > Since the follow-up patch introduces a flag valid for only one of the
>> > heaps, allow to specify the valid flags per-heap.
>> 
>> I'm not really in this space anymore, so take my feedback with a grain of salt.
>> 
>> While the heap allocate flags argument is unused, it was intended to
>> be used for generic allocation flags that would apply to all or at
>> least a wide majority of heaps.
>> 
>> It was definitely not added to allow for per-heap or heap specific
>> flags (as this patch tries to utilize it). That was the mess we had
>> with ION driver that we were trying to avoid.
>
>I don't know alot about DMA heaps..
>
>On a CC VM system the shared/private property is universal and applies
>to every physical address. Not every address can dynamically change
>between shared and private, but every address does have a
>shared/private state.
>
>By default userspace process generally run exclusively in private
>memory and there are very few ways for userspace to even access shared
>memory.
>
>From a heaps perspective the API would be very strange, and perhaps
>even security dangerous, if it is returning shared memory to userspace
>without userspace knowing this is happening.
>
>I'd advocate that the right design is for userspace to positively
>signal via this flag that it wants/accepts shared memory and without
>the flag shared memory should never be returned.

We can have the same behaviour with the separate heap, can't we?
Userpace positively signals it wants/accepts the shared memory by
choosing "system_cc_decrypted" heap name.

[...]

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFwcC2lFi2mfRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:49:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B99511C0E5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E1110E5A5;
	Tue, 10 Feb 2026 14:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="jKxfqZ5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ABD10E5A3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 14:49:08 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so10918805e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 06:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770734947; x=1771339747;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=knkS23bKgxD0sGFgNoxwcHFypphehdzY/C+BgKABh1k=;
 b=jKxfqZ5O1R0bK8xLw9NRRF7R13eGFLt67Y97n9VltOFiR7tof/wGoQ7Og2dLWxzVD3
 Ymdwm/7cXvTmdJkG4ZygsOiBM/V0DBrBe3tFltrxcT9MibfyYYUqeXk94vNTTdqGg9Up
 IFbGBLAzEOzgGBg5yN+7Hb6qP/Z3NtJSfTN+Gh/7JhlRqZ+dkfLCy9XxTctnLqgQo5GA
 c0tjTPEz0ARGTp7/6QSwEB5uv7DBlKPIDqx29DLONDaWJHi3s5MumjBavKqpDMYA+N5E
 jH/qr6RPDL4rFfnqOtiNlrK6nun+/LDdfA2DEk9Tmy8jsW+HuaJn8soJt+/g/4eztA/z
 OZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770734947; x=1771339747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=knkS23bKgxD0sGFgNoxwcHFypphehdzY/C+BgKABh1k=;
 b=abGH/chfaWF6iaCo0W0xAOj3OsfCAWQdtca6ITG0HT1zli1WnNimjwf3F57HKxgAzK
 QHjR07LbnUpdX7rFk3aYXWVz5xaoRBJmLnCvYNYTj3Q/x3y3PINhWE0STfZ2ZLhculrQ
 PAshmQxC0jUqInDxbEp2AXgNbeL6o12pYpxEfxadtzSZo98zASiD5PxoLnJ6Fxg2RBFV
 zas1Y1xXo0JpG4eGu/4OLU1j4w8CWUaPp77IUh1hkgEtGp6v83qcki4WW+hoylOWFUTj
 XpHk7Dp1O0wJZ67BOBYFSltKLJFmA3SxNgsQN4EPrAelo4aE0vY/uvQczA44FPuv6CI6
 VA6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoz+PIzwr6FYNZdklMofQ6KQdBUd/k7NJQq6H3bcmsvWlehVEJFSJt4TSN4zh/kqXhbMs8iuXJWtc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu/8tNZ/Q0uu/J7NS6vhZIQhTP9ZT4PBoY/W4Bt6Ujc9Me5C1c
 CL9k7vAj4M0SOaCh1V/js1E9FCnWaYKtNWTtjSSV+GWo87Yjs6JAo/hY5TrZExOTXXs=
X-Gm-Gg: AZuq6aLdhjoJr+qg1KQ8DmEEqnrbd7TpWxpaEC1fhB25Q2eoBnL11s2YdClgL2CLh9K
 Dw8rA8z/oq7w3zlnainSxZggvKV+dk70rFs23urEiqFwl14N/VhbQZ/2TGKHrlgz7C35PWkMpW8
 W2NtZSLu1saxgZ5TUUxbiXKFozd6J3QRiHuMekFhhn7AriZd8scR7tVy+Hs0Yx/7aI2CkaQ9wJo
 Xa7NqnSEO9EZ0bTPhJkqATVHc0vKWJ8fbxrjiun30Z2X04tN+E7PXlU+HCrND02wY8WL427eLpi
 UDm8Rqor1ZH8knEHWJH3yAAsnDzKlCitd+k21FJk3mrVN0AUz0o+u0+xEO7ye5uXw53zmIDIE95
 C0GTS6ZxIXy+A1Dk5Kx7qRDQDfoxqvXwgpYe+drUyRV9l9vSqw2I/PHSbQWrI5t4KIeEC90RDar
 s4zuiK6dIDuvPhu17dwaoYPPvu0IkFCZyo9ps=
X-Received: by 2002:a05:600c:3f0a:b0:47e:e712:aa88 with SMTP id
 5b1f17b1804b1-48320236ad7mr236498725e9.31.1770734946334; 
 Tue, 10 Feb 2026 06:49:06 -0800 (PST)
Received: from FV6GYCPJ69 ([140.209.217.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296bd1c9sm34022302f8f.15.2026.02.10.06.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 06:49:05 -0800 (PST)
Date: Tue, 10 Feb 2026 15:49:02 +0100
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
Message-ID: <y7gvezflidmma7odnut2rmlecsbxahrcwpmoevfnhzjveusuwj@6qxqogin45j3>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
 <20260210002927.GC943673@ziepe.ca>
 <tgvdjszwxggr53digbmddcbxvupzl4xcoprofkgrs2kgf6rknx@44ebljjpghjm>
 <20260210124357.GD943673@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210124357.GD943673@ziepe.ca>
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[resnulli.us];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:jstultz@google.com,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:leon@kernel.org,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,resnulli-us.20230601.gappssmtp.com:dkim,ziepe.ca:email]
X-Rspamd-Queue-Id: 6B99511C0E5
X-Rspamd-Action: no action

Tue, Feb 10, 2026 at 01:43:57PM +0100, jgg@ziepe.ca wrote:
>On Tue, Feb 10, 2026 at 10:14:08AM +0100, Jiri Pirko wrote:
>
>> >I'd advocate that the right design is for userspace to positively
>> >signal via this flag that it wants/accepts shared memory and without
>> >the flag shared memory should never be returned.
>> 
>> We can have the same behaviour with the separate heap, can't we?
>> Userpace positively signals it wants/accepts the shared memory by
>> choosing "system_cc_decrypted" heap name.
>
>So what do the other heap names do? Always private? Do you ever get
>heaps that are unknowably private or shared (eg MMIO backed?)

If I understand the code correctly, you may get something like this:
$ ls /dev/dma_heap/
default_cma_region
protected,secure-video
protected,secure-video-record
protected,trusted-ui
system

The "protected*" ones are created by tee. I believe they handle
memory that is inaccesible to CPU.

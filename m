Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 884B4A6BFA6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 17:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE33210E7FE;
	Fri, 21 Mar 2025 16:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=db48x.net header.i=@db48x.net header.b="ZFRaG9Sg";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="KMTayt39";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D90310E7F9;
 Fri, 21 Mar 2025 16:20:24 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 801751382D75;
 Fri, 21 Mar 2025 12:20:22 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Fri, 21 Mar 2025 12:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=db48x.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1742574022; x=1742660422; bh=SutsPVKzmc
 avcLnfkr+o/VxBSYFIMZmmfkqaiIK+YZM=; b=ZFRaG9SgOE1XM6dmDC0xywVI4L
 4wW8HPDVg1tw3o51YRmSFzkjawI41DJv6jraBwCrd8JbY1QTdJQwXmhiMt/GnW6k
 nGpo9Yw/3cx25wNSkvl1p21h6l29G88B/W5n7M560cTdVTgIQi62hGautMlyDjN3
 mJkAQS/1XVb9JPDN4mhVErU022jNtYx/lf6XhfCtBPEcxINzxdTQqd0qUE6nnTZy
 /68/zN8FMfU3WC3i93x1sfyd+alou2nD3c3fcye8pILatPrCoHQkJIpVCDk48VqT
 /qrTIcGSu26QHr6LcNjuxzyPrcW862ja1q1vueuvCWfyk7aw8Pn13q6Kr0KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1742574022; x=1742660422; bh=SutsPVKzmcavcLnfkr+o/VxBSYFIMZmmfkq
 aiIK+YZM=; b=KMTayt391BaNG29YIsMkIz7yfSf5Z2bIlgvjTgD6I5bk3E2PzMi
 J5rkrK3dWFB2jEQkZ2wf3QbCR0na93M95zO3hmn8x9RJb4VYDbDlq0e52mgKiQzu
 tlnmzG4k6HJzF0LY8CwHhSJPpzBcn5zKirQQEUQ7ZIlbplOol3XGtGRs+1pSU3Cg
 Fk+ngY21TXgbGoZ8uJI7C12+guj3nSZaXH54Rm9bvWKm98Shu6jV/M4yHYsC4k8+
 bX01zuGkhmq0I6oc2IRiXd6ubt9frTS2hVGc8U/FlihXJuvIJh5iRtCYMIWHiJfe
 8o+ZILH1KSOld0N3oFLmZ2qdShTbFnZF6iw==
X-ME-Sender: <xms:xpHdZ_LazOjWay4joYDqYpRSMD2tUpzgUqnCEgQwhtE8Zv8ccAD4nw>
 <xme:xpHdZzLB_CaSct0QfdwKumgarxhCPF0WQXws3rXJw2hsKbq4ev2RJC2rkRvBUZKXJ
 CWTQQaVM_is6VHG7lg>
X-ME-Received: <xmr:xpHdZ3uGqRwcdEgInBKUfeD-Bgo5OCB5-rXhn4hwF4pxrICNZ_O5x1ZU-c6P6Sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheduheehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkfgggtgesthdtredttder
 tdenucfhrhhomhepffgrnhhivghluceurhhoohhkshcuoegusgegkeigsegusgegkeigrd
 hnvghtqeenucggtffrrghtthgvrhhnpedtgfekkeetffeuudfggeeiffefveettdehveeh
 hfffvdehvdegtedvheekgeefueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggsgeekgies
 uggsgeekgidrnhgvthdpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhpohhuth
 dprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhp
 rdhorhhgpdhrtghpthhtohepnhhouhhvvggruheslhhishhtshdrfhhrvggvuggvshhkth
 hophdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhk
 vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhr
 tghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuhdprhgtphhtthhopegrlhhitg
 gvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegrrdhhihhnuggsohhrghes
 khgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhoth
 honhdrmhgv
X-ME-Proxy: <xmx:xpHdZ4YwSGvt-gfxBXMjy8rlj1hqV6q9a5fNi1UWSTp3JQS7LMMmEA>
 <xmx:xpHdZ2bRILUO7I0walgRZIS4BJQoEDCka1J3r0_bq0KLPvpYqBfIbQ>
 <xmx:xpHdZ8BoCZrCNWaZXbzmkFU9m6qFaeOTtmmxk37i4xUmS3sz8kHPCA>
 <xmx:xpHdZ0aru43o2t2rZNqa6Emrp6ncL_6mJ38G0tv8dYMvmJbEveZU1A>
 <xmx:xpHdZ-PsDYejyOyfEGv7sWGtvKWvNWk-UGPKA1ZBT4S7akOf3qMG21Qx>
Feedback-ID: ie0194691:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Mar 2025 12:20:19 -0400 (EDT)
From: Daniel Brooks <db48x@db48x.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>,  "Danilo Krummrich"
 <dakr@kernel.org>,  "David Airlie" <airlied@gmail.com>,  "John Hubbard"
 <jhubbard@nvidia.com>,  "Ben Skeggs" <bskeggs@nvidia.com>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Andreas Hindborg"
 <a.hindborg@kernel.org>,  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Simona Vetter" <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>,  <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>,  <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH RFC v3 6/7] gpu: nova-core: add basic timer device
In-Reply-To: <D8LPCCP6JNYU.28DYTEK5BB74K@nvidia.com> (Alexandre Courbot's
 message of "Fri, 21 Mar 2025 14:41:12 +0900")
References: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
 <20250320-nova_timer-v3-6-79aa2ad25a79@nvidia.com>
 <Z9xb1r1x5tOzAIZT@boqun-archlinux>
 <D8LPCCP6JNYU.28DYTEK5BB74K@nvidia.com>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAABGdBTUEAALGOfPtRkwAAABJQ
 TFRFpKfbdou67PD6JjJgAwUWXGSeIcyLHgAAAkZJREFUOI1VU8Fy6yAMxLi+Q13fCZ3cnQL3dqTc
 7RD+/1feStDXVnXHDuvVSivZTMba2GPdw3gyCGcMAFxTyrTd9dwGoxHiZX9PmRFUHYAQlGGtXY+F
 Uk0SJOxgJiUEnH1qkitT9D+pQub7qGAmUbR6bu3CvI96Yv6QqkBBMrsyfZccr1/RDXGDTLf4P7ZY
 glVxe2V+/ACXWO1gvDO9/gDRpFFVmPluvLcmBjd5H6d8DEte+Pbk4rcY/Fa5tLKLOtCZsuQKYhpa
 LOkYDT7hESya7/WIET3lfQBqX0pwFtbI832Is0ayMUR9B+12xjgPCQ089cfwkCkX6L5TPmRelJTh
 zMS0Sz1PyjLAMCUWjcmgQLWQMds+e3aaauZDf9dU9A2/8kPVF2odCUoMKHkfjJR+mbgC+DRiycw5
 3XSqGe6HmhN/AWjHypkAXOAFW5EiuA1ge2GiZuMb0s1fSEXcATeLUfbyEY2L8yPOmdSsdghQXx3K
 pz2eoeXuYvMCINVFDrCdNfVUp4eJ6cSEbjbgFjBEvonGGTrgv9cHjAc8aVgSAPoxaONbzfwhDIhR
 at7IIS7fAGiDSwIA9alhhTBzfA7YM2FY6eMwayrIGK8FDFmshmUA43WqhFtpvoqG9HHaJ7fqtgTz
 8EWVkgZgtsylFliHDgk0MB7KAEC45C/rgnGvanNLXyzOeTzcT2nw/N44gfrtYXRQLoz9Q3TgmJRx
 2Mx/Q51qzpm+l3m8z2SWBqC5+PZXAtNYlGFf/gKfHfjFkDT4x7od7R+w3Ls+ZdQBuQAAAABJRU5E
 rkJggg==
Date: Fri, 21 Mar 2025 09:20:18 -0700
Message-ID: <87r02qz77h.fsf@db48x.net>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
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

"Alexandre Courbot" <acourbot@nvidia.com> writes:

> Hi Boqun,
>
> On Fri Mar 21, 2025 at 3:17 AM JST, Boqun Feng wrote:
>> Also an Instant type has been proposed and reviewed for a while:
>>
>> 	https://lore.kernel.org/rust-for-linux/20250220070611.214262-5-fujita.tomonori@gmail.com/
>>
>> we should use that type instead of re-inventing the wheel here. Of
>> course, it's currently not quite working because Instant is only for
>> CLOCK_MONOTONIC. But there was a proposal to make `Instant` generic over
>> clock:
>>
>> 	https://lore.kernel.org/rust-for-linux/20230714-rust-time-v2-1-f5aed84218c4@asahilina.net/
>>
>> if you follow that design, you can implement a `Instant<NovaGpu>`, where
>>
>>     ipml Now for NovaGpu {
>>         fn now() -> Instant<Self> {
>> 	    // your Timer::read() implementation.
>> 	}
>>     }
>
> Ah, thanks for pointing this out. I'll keep track of these patches,
> hopefully they get merged soon!

Would that actually work though? Instant is a ktime_t, which is a signed
i64 rather than a u64. When I read your patch I assumed that you had to
add your own Timestamp because the value had to be whatever was read
from the GPU, independent of the clock value kept by the system or other
hardware.

db48x

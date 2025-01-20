Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A07CA17972
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 09:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AE410E1C8;
	Tue, 21 Jan 2025 08:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ryhl.io header.i=@ryhl.io header.b="hKYZrB/I";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="uMElmZFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 583 seconds by postgrey-1.36 at gabe;
 Mon, 20 Jan 2025 22:16:10 UTC
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DA610E116
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 22:16:10 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 79E9A1140291;
 Mon, 20 Jan 2025 17:06:26 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Mon, 20 Jan 2025 17:06:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1737410786;
 x=1737497186; bh=3mS8OHVQFimlyaw7cjQLmrV3PhSqZSgpl8q1lYPOIbs=; b=
 hKYZrB/IemB1CiC1ZigdRa71kJI92OdjzD2dVGwkgIB1AMkKQ77SndWmT+FfgGIo
 tjj4bKJA926wZBF1rTNXXZuqMiwsIi5CW7Uk6QpWaDB5+tV5I5sMDh/qEkjuNhra
 t+5ZkkGQu8474EppfW0y7RV7SZ5tM66PAOQ66DMieO66117yyp7Kxioo+LEwbK2e
 cO3Okq5CE6wfajKed7jI4HDk4Pz/z/aUaeqxVM7WeMBGHUziB9Wnlrr5RkgJcYtA
 wMcgm1uI+4GEui0caWUM39d7WVmFQZcj9uArcJ7Vndg3J5k7IQbDgvLg7uYgzsEH
 r1IoRIaFkpPvbIQvl+EX1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737410786; x=
 1737497186; bh=3mS8OHVQFimlyaw7cjQLmrV3PhSqZSgpl8q1lYPOIbs=; b=u
 MElmZFdFmHB9VmWT//2MRaV+XU5KIzp9e1zRqWcCrnU+BGXzrWiE/BIYfyuq7ppX
 fihlqolzC9xbEUN0Qe4yHx6fX5YEOOoLZjAIxeV7DhqFb7Hx0IQzl8Z1dN8YJGIc
 7iaZlGZagpsFmvblSVjhMErI2trPtharKv+vELj+KfpIZyD1VnYKh1+FjJ2BtX6C
 A9bymyHOETADCb3MRycG3/ds+weWx11Qr0TNlFj28sSLbl+7SH0uVgjc3rEDn3nB
 jjLbWLRpIXMF5Goq7Y3TKxh7WVACaA9+9bQrDAqgc3oG4aQT6k4tYOIpT1AR4dE/
 q5MGnWEFnJ+lGgSsacPOA==
X-ME-Sender: <xms:4ciOZ-lLx0vM9GlRGfaVb3mXElOU213InEvL6tbRv3OzJGqZvdDYbw>
 <xme:4ciOZ13E0KLaXC12M4YMKUiSp6ivEkDPIeWQ1DklApQpVzqMM3d_cZ9BU5a04b6G2
 AqgN9PHGneEtz33Dg>
X-ME-Received: <xmr:4ciOZ8qBa4bmrmLip9FN11LvVIhOgWcgk_jUYvbmHkUfkzy2RjeFluUaGOzp1m2hokJSTyh0GxC5osot3lrI95xZmGICYud0jbzm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiledgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddv
 jeenucfhrhhomheptehlihgtvgcutfihhhhluceorghlihgtvgesrhihhhhlrdhioheqne
 cuggftrfgrthhtvghrnhepkefgieeigeehgfdvffeltdevuefgtdfhfeehgfegtddtjeej
 tefhvdfhtdehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomheprghlihgtvgesrhihhhhlrdhiohdpnhgspghrtghpthhtohepvddtpdhmohgu
 vgepshhmthhpohhuthdprhgtphhtthhopehmihhguhgvlhdrohhjvggurgdrshgrnhguoh
 hnihhssehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhkmhgruhhvvgeslhhinhhk
 mhgruhhvvgdrfhhrpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslh
 hinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgv
 lhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtg
 hpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhn
 rgesfhhffihllhdrtghhpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpd
 hrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:4ciOZykrfenYtXczhGT4tCIeHGuMGSKewij5A6avYpbLzFcQUmY3Aw>
 <xmx:4ciOZ836IXOvmeipWE6AR61_Eu1rCQxRBU7IjOlfa6QdozdBS_oIuA>
 <xmx:4ciOZ5uTrggtO81S7ZEWb6bfQ6RNCH0obuUrEPGg1nLl9DIQmnzI0w>
 <xmx:4ciOZ4Wsc3paxjoYfDhnjEtP7WToFWXUUPXE7eb8ybYiNmFkT2N-iQ>
 <xmx:4siOZ2UsKPiPnuTez4pSTjTWebnpFpmOYfLpYEMPUNyi8LL3v1yWkhqE>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jan 2025 17:06:22 -0500 (EST)
Message-ID: <b2c043e1-b27f-4a3c-ae11-4d354685d079@ryhl.io>
Date: Mon, 20 Jan 2025 23:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: fix compilation issue on ARM
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Jocelyn Falempe <jfalempe@redhat.com>
References: <20250120124531.2581448-1-linkmauve@linkmauve.fr>
 <CANiq72n1YpUowTh3Hdjo5auOmTTUU1-8d2FTL3e=Oyu3Q=-BkQ@mail.gmail.com>
Content-Language: en-US, da
From: Alice Ryhl <alice@ryhl.io>
In-Reply-To: <CANiq72n1YpUowTh3Hdjo5auOmTTUU1-8d2FTL3e=Oyu3Q=-BkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 21 Jan 2025 08:46:07 +0000
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

On 1/20/25 10:52 PM, Miguel Ojeda wrote:
> Hi Emmanuel,
> 
> On Mon, Jan 20, 2025 at 1:45 PM Emmanuel Gil Peyrot
> <linkmauve@linkmauve.fr> wrote:
>>
>> In C, the char type is specified with “The implementation shall define char to
>> have the same range, representation, and behavior as either signed char or
>> unsigned char.”
>>
>> On x86 it defaults to signed char, and on ARM it defaults to unsigned char.
>> This carries over to Rust’s FFI, which aliases its c_char type to i8 on x86,
>> and to u8 on ARM.
> 
> In the kernel `-funsigned-char` is used, see commit 3bc753c06dd0
> ("kbuild: treat char as always unsigned").
> 
> In any case, the change is fine, because we want to use the proper
> type, but this is already in the Rust PR for this cycle, which should
> land in mainline in some days, see commit 27c7518e7f1c ("rust: finish
> using custom FFI integer types") in rust-next.
> 
> However, I am nevertheless confused, because in mainline
> `crate::ffi::c_char` is `core::ffi::c_char` which is `i8` in both
> arm64 and x86_64 and thus there is no build issue there.
Isn't core::ffi::c_char an u8 on arm64?

Alice

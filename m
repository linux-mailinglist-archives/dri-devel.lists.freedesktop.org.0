Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AA4A75490
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 08:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7070E10E19B;
	Sat, 29 Mar 2025 07:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fastmail.com header.i=@fastmail.com header.b="n1YXQgRD";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ls/ZWoJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 599 seconds by postgrey-1.36 at gabe;
 Sat, 29 Mar 2025 07:06:10 UTC
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E45A10E10F;
 Sat, 29 Mar 2025 07:06:10 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 4A5F81140086;
 Sat, 29 Mar 2025 02:56:10 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-11.internal (MEProxy); Sat, 29 Mar 2025 02:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1743231370;
 x=1743317770; bh=vumH7d4rQW5BYe5HanUCiNB23xXJsOYrUl2QaYve7x4=; b=
 n1YXQgRD8q8eKKGqsTazsfG9EkJBa7oFyx1xTUhDrlNhfXNHNqYgn8IBp8lCH+2R
 Gwa8y94kJpHkn/kwa44OjVCxMWujXH/hTo4GOLKFo46KLFdl9pQosOme/q2+/xDZ
 hKjeK3upd/uq+FjFCNm816mOc5I2+NQzdT8YG3ZYg5liMbIkNK8Z/tFE1HD9DC5a
 PJyezvujof7C1lt5K17aPySC4dCex9uw9qRQCPa0feWyvT1Ph/5BqwiZ0zHT0jCq
 4zWQNpRI4ckjLynCguyHa5HfA/W1B6gKbgkP2in/pH0wmveGqKTefAow64OtjJmv
 8ueeBkvcubYoMTlE6YSc8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743231370; x=
 1743317770; bh=vumH7d4rQW5BYe5HanUCiNB23xXJsOYrUl2QaYve7x4=; b=L
 s/ZWoJqV9v9OgjHv6vuZ1xHsVVeJbm3PxyGQpgyHRCuw+ITBir+pRYEhyqz4LCJj
 LKk/hBNvzJIVKXh7M2IcN9WruW+P2ty8QkI7UNzYVDL/c8N33vG9aG5igY4C69y/
 SdRnYKIgHCKm2n4ErtbZ4eVD6UODra0YMY8pEOiNIlT6YgkVRWRl+jcr5F3jj5tj
 aShS2fUqEJ1wCqAIjBwb3lnwO6kw3afkAhApTVH6H3hPnSidqqdBaJmTPFcziLY4
 5Q81i6EUx8+/Xb8vfWyFzFi8kGdPCbhLFyfeBRSdSd1OyGAW7jZ8W5Fovyrom7M7
 Y8tJjrykyb73ArrHGoSPw==
X-ME-Sender: <xms:iZnnZ2ERpUqrEjfAeAD3I8yPeju_weiGq5qO-DmOuRkHFzA1yW3xGw>
 <xme:iZnnZ3WoR4EGMI815cWQTD3WhKBb2ObIArjwSHy5T0skh0Ou-Rd_VGqgm33CfbFL6
 iQh63wI4u6-w-bG9OI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeefhedtucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
 tddtnecuhfhrohhmpeflrghmvghsuceosgholhgurdiiohhnvgdvfeejfeesfhgrshhtmh
 grihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeetvefgveduhefhfedugfdvveeijefg
 veffgfdthedvgeelkeefffffueefgeeivdenucffohhmrghinhepfhhrvggvuggvshhkth
 hophdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpegsohhlugdriihonhgvvdefjeefsehfrghsthhmrghilhdrtghomhdpnhgspghrtg
 hpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvgidrhhhu
 nhhgsegrmhgurdgtohhmpdhrtghpthhtoheprghlvgigrghnuggvrhdruggvuhgthhgvrh
 esrghmugdrtghomhdprhgtphhtthhopegruhhrrggsihhnughordhpihhllhgrihesrghm
 ugdrtghomhdprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtg
 homhdprhgtphhtthhopehhrghrrhihrdifvghnthhlrghnugesrghmugdrtghomhdprhgt
 phhtthhopehsuhhnphgvnhhgrdhlihesrghmugdrtghomhdprhgtphhtthhopehsihhmoh
 hnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtgho
 mhdprhgtphhtthhopehsihhquhgvihhrrgesihhgrghlihgrrdgtohhm
X-ME-Proxy: <xmx:iZnnZwIwGCY3yWgsZjYiMe94nWQozmQhZ9lsnaGa0tSkTJ6hItDQMA>
 <xmx:iZnnZwGpKTZWqO40SWQRC-oiAxMRl21T3esP28brx1oCBW0mcJ8q-g>
 <xmx:iZnnZ8Wfw2Rp94T79iQOJB6yGO74qz44d_iZFjR5mreSqH29lxfhFQ>
 <xmx:iZnnZzOhWEkl7FcX93-mGfBk5LdENSzoswwFIQBZL4c3cCd4Q3xtMw>
 <xmx:ipnnZ9X9Wn12nuXREy-XFUYifF95n5osdDO44a1Bcfh7ZsZTb_hMExcb>
Feedback-ID: ibd7e4881:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id B9B3518A006B; Sat, 29 Mar 2025 02:56:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Td646725364a3d5c9
Date: Fri, 28 Mar 2025 23:54:34 -0700
From: James <bold.zone2373@fastmail.com>
To: "Shuah Khan" <skhan@linuxfoundation.org>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 aurabindo.pillai@amd.com, alex.hung@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <8b73708c-4613-42a0-9d48-5bf6f0e01ced@app.fastmail.com>
In-Reply-To: <476c5bb9-79c5-40b7-bba8-b52fb244e90e@linuxfoundation.org>
References: <20250326070054.68355-1-bold.zone2373@fastmail.com>
 <476c5bb9-79c5-40b7-bba8-b52fb244e90e@linuxfoundation.org>
Subject: Re: [PATCH] drm/amd/display: replace use of msleep(<20) with
 usleep_range for better accuracy
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Fri, Mar 28, 2025, at 3:46 PM, Shuah Khan wrote:
> On 3/26/25 01:00, James Flowers wrote:
>> msleep < 20ms will often sleep for ~20ms (according to Documentation/timers/timers-howto.rst).
>
> Can you elaborate and explain why this change is necessary?

scripts/checkpatch.pl highlighted it as a possible issue since msleep can cause the delay to be unexpectedly closer to 20ms. However, perhaps it would be better to submit a V2 with the change as usleep_range(10000, 20000) to match the actual delay range that msleep(10) has, which would help avoid a regression like this: https://gitlab.freedesktop.org/drm/amd/-/issues/3559#note_2532546. 

Is there any appetite for drm/amd to change instances of msleep(x) (x being < 20) to usleep_range(x*1000, 20000), so that the range of delay is clear to readers unfamiliar with the msleep quirk? Please let me know and I can submit a V2.

There is at least one instance (fixed by commit 57995aa8ffb3e47a74763cf9106d34e9e8be9d8d) in drm/amdgpu where msleep(1) seemed to be causing an unexpectedly long delay, and so was replaced with usleep_range. An issue possibly related to that fix is https://gitlab.freedesktop.org/drm/amd/-/issues/462.

Currently there are 37 msleep(1) calls that I can find in drm/amd. I'm just thinking that optimization opportunities like above could be found more easily if the delay range is made clear?

Best regards,
James Flowers

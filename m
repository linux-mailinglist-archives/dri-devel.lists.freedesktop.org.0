Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE50A77378
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 06:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A7010E24C;
	Tue,  1 Apr 2025 04:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fastmail.com header.i=@fastmail.com header.b="WfNavPDq";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="nnOUilZy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b2-smtp.messagingengine.com
 (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0F610E24C;
 Tue,  1 Apr 2025 04:23:44 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 992D3254015C;
 Tue,  1 Apr 2025 00:23:43 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-11.internal (MEProxy); Tue, 01 Apr 2025 00:23:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1743481423;
 x=1743567823; bh=YizgmpoIN10GZ8vle2iQ2k8Vz0iemk9UbC2nuwW/u9I=; b=
 WfNavPDqn0bJviEE622pGaOQI6dNTBpmBtIQxhjmMW0Df/6RCNJ4nCj/7PL+uAaO
 KTUQTWfB7dmx35pLgbgJUm1yOyvAck+b3plK2+0puCWCwsRUJ/BnmmwCuUCno7nY
 hpVFuHZLLmdNmwXnyvmCWxk/abBEdR5wa1WIMdgXDHjGTouNyu43fFpSAyCajJFP
 y993S/pOxxIHSE3h0kH6O90UX8uLf9ebGrxiPWanHURknFziOeKAFj4xmtB7Y2hb
 ejQHrikn7eRwM34GfMg0T+TlkkGrU3wtAhZlwu8h2x0FlHwhi0HDoSB0s1JeLo70
 NgpHRai8yGEl7FOW0R/T8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743481423; x=
 1743567823; bh=YizgmpoIN10GZ8vle2iQ2k8Vz0iemk9UbC2nuwW/u9I=; b=n
 nOUilZyk4pYfB32uDTOgGNhUSBHBANt1WBYchdwcTDCMOEEayxd2OxvApbOkzUhi
 gfWkOMN3+LaEg7cevsHZ9A9VTOXYjEqubZD8pFPtsU7HA29oqXe+iJIdfk2YGER2
 bk+8rQCqYiNGQseikITLKdc2UWycqMKmfhAvpXt9549VfhrW7XscJrmjxdX0NHSf
 XjkbMVcLba77NybwzZGrWqzjItvXlPjr/HxgnpCvrxwpUrHF3rvrGtQyZ1ZogQIX
 nrsnDMMsrxvCZZYnTq6zcfUi8MQLF8EPsNYxUJ6B/nlVf629BKXfKBjMbgFvF6fJ
 AQUYw5QC3BBc15H8bne5A==
X-ME-Sender: <xms:T2rrZ3odGdvphbdCogPz4gF2Z0stg2DUrqA3SjmcKdgWY9LYudW0Gg>
 <xme:T2rrZxpFmxrxDY2yvT3-6VPmqZA2jYnhExvVIYS6D2TiltaoYhO5qm-NOv8DYzUXL
 pce0-_JB6fG3jXZirA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedukeefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
 tddtnecuhfhrohhmpeflrghmvghsuceosgholhgurdiiohhnvgdvfeejfeesfhgrshhtmh
 grihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhfdtheejiefghefhjedvheduuddv
 gefhveeiheduleevveehkeetiefgieeukeenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegsohhlugdriihonhgvvdefjeefsehfrghsthhmrghi
 lhdrtghomhdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtph
 htthhopegrlhgvgidrhhhunhhgsegrmhgurdgtohhmpdhrtghpthhtoheprghlvgigrghn
 uggvrhdruggvuhgthhgvrhesrghmugdrtghomhdprhgtphhtthhopegruhhrrggsihhnug
 hordhpihhllhgrihesrghmugdrtghomhdprhgtphhtthhopegthhhrihhsthhirghnrdhk
 ohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehhrghrrhihrdifvghnthhlrghnug
 esrghmugdrtghomhdprhgtphhtthhopehsuhhnphgvnhhgrdhlihesrghmugdrtghomhdp
 rhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhlih
 gvugesghhmrghilhdrtghomhdprhgtphhtthhopegtkhhovghnihhgrdhlvghitghhthii
 uhhmvghrkhgvnhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:T2rrZ0MgigtmoRzx2VIl7hUdugqJVHX9raZBE6rQmdKZ5rMyWQQiiA>
 <xmx:T2rrZ65acx-al1PuqrgsVaGyLtH-dbIEGR69uGhkhZCbbfHUGeuxvA>
 <xmx:T2rrZ260QcAanaj3VVe8v1eIMZNJbcUM8C251jR4MF2FuRBm246Prg>
 <xmx:T2rrZyhDYx67lQFwdwtjAZsC_rDjOa1T_qG0Sj4uIHUJ9dWgFmc8vQ>
 <xmx:T2rrZ1QJVb2daiMf2EBMTsI7gvugKznLqJ1JslmbFTcRlg9RqerJI1xR>
Feedback-ID: ibd7e4881:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id ED39F18A006B; Tue,  1 Apr 2025 00:23:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Td646725364a3d5c9
Date: Mon, 31 Mar 2025 21:23:18 -0700
From: James <bold.zone2373@fastmail.com>
To: "Harry Wentland" <harry.wentland@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 aurabindo.pillai@amd.com, alex.hung@amd.com,
 "Shuah Khan" <skhan@linuxfoundation.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <a5b036d6-f5c7-4f99-8eee-948eb7bdb145@app.fastmail.com>
In-Reply-To: <81cac86c-dece-4f0d-abd7-efd888a08db0@amd.com>
References: <20250326070054.68355-1-bold.zone2373@fastmail.com>
 <2a2e9a4c-b888-45e1-a191-847dd8e7cb9d@gmail.com>
 <81cac86c-dece-4f0d-abd7-efd888a08db0@amd.com>
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


On Mon, Mar 31, 2025, at 11:20 AM, Harry Wentland wrote:
> Agreed. Little timing changes often have unintended effects.
> I have no desire to change working code unless it's required
> to fix a real-life issue.
>
> Harry

Thanks for your explanation, and for taking the time to review.

Best regards,
James Flowers

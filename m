Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAh4I2zXiWnZCAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:47:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB35A10EF66
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64CF10E3D4;
	Mon,  9 Feb 2026 12:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="H6HT3TZ2";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ow900fby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C952D10E3D4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 12:47:36 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfhigh.stl.internal (Postfix) with ESMTP id B82237A01A0;
 Mon,  9 Feb 2026 07:47:35 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-09.internal (MEProxy); Mon, 09 Feb 2026 07:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1770641255;
 x=1770727655; bh=RDcaStnUbAimuMXULCprr5C0mVOOx8METC8SN47KIsk=; b=
 H6HT3TZ2Ti6ofe+B7/4bXT+1q4Mq/VmXifUwSYQX/cgTpUByH73S9gzOYEnmWtHU
 UTLfbgN9sob9NhcCmodBd7FyMq91Mg0GkjuHlAtCIVbGolpZG2QP1HEWA13Rw5YC
 ibBIDj0uBImTgDjEKI1ksebc9EXjUM5wFF1bgpeskiH7uVp9w+U0paRcNImRnMgH
 XHIxM/1k7MKr0P0dXEb8WOrgWfyERZXsnH1rYEWTij/mLmj/eJ23EpGtqV/OBe8Q
 T5PaFKHc2h/9Fro2K7HjgCxcjSyj4+maVAaIFNim2UC6qRoOeFsIs3Upz8MpN9cI
 qH0yE379nZ2BS9FRT6Lxig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770641255; x=
 1770727655; bh=RDcaStnUbAimuMXULCprr5C0mVOOx8METC8SN47KIsk=; b=O
 w900fbyt87IxkXJT2AsPxUYnxxlYPMEforHpEx5CPXZ98jdk3dbJpmzDv6tVhw56
 UZPjGdfvZSfpmzleaRs8D+1JzzwvQ0vK0Gf7TwLJ5VYp1DgBUHUeLNey0uwnpDIe
 nzIHpsOSXgPdf+eBmj7thaQuhiWzwfR+GYUoJbmo4O7cSZ52cnIUrob26h1bcR+8
 0QtnH/ygJmWMZbCHRdVpxHhXgtJynKWRJ5QDMUGBRNTn5qfRYmoQO8nQfeAtuXoz
 8EgkGNRLoVVlp6pyHZalo2Z4xkxM7HRowAYiA8lubihBatWrhVvhPXrz1NCcs5ka
 cpWIODdH0yLdHcotx5mEQ==
X-ME-Sender: <xms:Z9eJaXbEXhglXPWGrPO5AOHVFWYm6KwpAlj7UZ2pBpVPyZl5bdA3dQ>
 <xme:Z9eJaRN-MtHwCR2Ilk9-EFB0uZ2JNqz5k1R8aDft7EZrq_vu5snk-11worPP7Ri9X
 Qetii5Vf0B6WKIUik7_XJZWPtnYBfh3lsaLW18OqI96TbatVi8bng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleeikeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfgrnhhn
 vgcuifhruhhnrghufdcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epheejtdeffeethfetgefhffejudegheefueejtedvhfeuheevfeekheetfeduffevnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnh
 hnrghurdhnvghtpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhr
 tghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgrrdgtohhmpd
 hrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheprghlihgt
 vghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlh
 drohhrghdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthht
 ohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprh
 gtphhtthhopehnohhuvhgvrghusehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
 pdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtghomhdprhgtphhtthhope
 hlhihuuggvsehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:Z9eJafRDMNB8Ht9QmdK8mSnBw6HC4Cgwtx7-cL8lQGHzIDxn0XyqNw>
 <xmx:Z9eJaWS9FIWcvPA1rW2tMG-WfiJa9XKugPgXafxEYhCHWJWTrNE4ZA>
 <xmx:Z9eJaT5NK8f9JDN6x8R6xYss1PiDz2wtDKUq78HLPpSgr71qkhHaCQ>
 <xmx:Z9eJaTWllneQ7EVqss2cw2wi2sZat69ZyT0EyD-dwhP3w7hWI43FKg>
 <xmx:Z9eJabKjI2htXehQeK4wYM1p8LyV8JZTvs58GGIyJjzI5cBXYI_E46n8>
Feedback-ID: i47b949f6:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 3925B700065; Mon,  9 Feb 2026 07:47:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AFB7yJ7vYniR
Date: Mon, 09 Feb 2026 13:47:14 +0100
From: "Janne Grunau" <j@jannau.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Lyude Paul" <lyude@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, "Danilo Krummrich" <dakr@kernel.org>,
 nouveau@lists.freedesktop.org,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>
Message-Id: <d2b1efd0-dfc4-4ea0-9bbd-74f57cfaabd6@app.fastmail.com>
In-Reply-To: <aYnVvFwBk1SfiJGQ@google.com>
References: <20260206223431.693765-1-lyude@redhat.com>
 <20260206223431.693765-2-lyude@redhat.com> <aYnVvFwBk1SfiJGQ@google.com>
Subject: Re: [PATCH v7 1/7] rust: drm: gem: Add raw_dma_resv() function
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.80 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[jannau.net:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:lyude@redhat.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:dakr@kernel.org,m:nouveau@lists.freedesktop.org,m:daniel.almeida@collabora.com,m:gary@garyguo.net,m:lossin@kernel.org,m:acourbot@nvidia.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[jannau.net];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[j@jannau.net,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j@jannau.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[jannau.net:+,messagingengine.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,jannau.net:dkim,messagingengine.com:dkim,jananu.net:email]
X-Rspamd-Queue-Id: DB35A10EF66
X-Rspamd-Action: no action

On Mon, Feb 9, 2026, at 13:40, Alice Ryhl wrote:
> On Fri, Feb 06, 2026 at 05:34:25PM -0500, Lyude Paul wrote:
>> Reviewed-by: Janne Grunau <j@jananu.net>
>
> I think this email is misspelled?

It is, likely my fault. I noticed a few of those particular misspellings in the last few weeks.

Janne

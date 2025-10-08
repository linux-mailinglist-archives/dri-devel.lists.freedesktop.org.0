Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3F1BC477E
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 12:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F4A10E7D2;
	Wed,  8 Oct 2025 10:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.b="T9ihapaF";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="jm0Y3uQH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 539 seconds by postgrey-1.36 at gabe;
 Wed, 08 Oct 2025 10:56:10 UTC
Received: from flow-a2-smtp.messagingengine.com
 (flow-a2-smtp.messagingengine.com [103.168.172.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B288410E7D0;
 Wed,  8 Oct 2025 10:56:10 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailflow.phl.internal (Postfix) with ESMTP id 4804613801F3;
 Wed,  8 Oct 2025 06:47:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Wed, 08 Oct 2025 06:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1759920430; x=1759927630; bh=KodlDpmgfd
 X2u40mEiJbkv3Ym8M9RKnA7qbONd4olzE=; b=T9ihapaFrBFuoNcy7SFER+1K0q
 LHqIui2qpBKHuyGRIYPlI3RsM1km+jzO2Kh5zgUvou7k6JrZZCVtW5ou0gVOQC+P
 kjS170htgm4KMAXqvUDXr2d6RoYFsK9SDwqA7yGQLJQr85TSjiCZeDhorteKMXhW
 SWl2+BWBwIDJ+/rdm6Wx3eOFv9dCEcSJr0qoqGBA1YCmAm7j79nDCok1/MF6dHoS
 LKdUUrnUZ2Vz78KMlIVV8tOxJfwddwxj0dzjKZj8iiEy2NrfEeG7rkYtXpIXcDqV
 GtRwwQJn+eSJ1K54Njxe1hcbGE8x0kvMQN3mJU8vVLZ+AS5EoBIKQZoaYbhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1759920430; x=1759927630; bh=KodlDpmgfdX2u40mEiJbkv3Ym8M9RKnA7qb
 ONd4olzE=; b=jm0Y3uQHebcIFICXNQ2+s/gyPQ1Fal0dXHaTv2jNga2iKWbAZtX
 AlF5nPjbt9nfqOCfxKyNxr3Z79bWoAY6+YjjK7vwEb7ebHo4LtA2cquP4omW8CnA
 rbnZwAkWVMVaYOqma3U0Rrcq+LDvYgXekiQ9QEKHUIe9GXFXMxmpwns+ky8v0zsi
 y+0lAL4/BSyhz6AmXZzMYlQksJHe+c8LyT0X+dc6mwrJRuG68GSdOw8PpAnsmYjM
 ZYYY61z3UHe53BP1kyJyUhP4RD6D/jL8BLPdw2HrjmTy6nJD73uto2gwQ9o3gtyN
 +v6fkTYxeY0icBH3ZDIMSufb3fRKpJxyxCw==
X-ME-Sender: <xms:LUHmaO5X62s-G3c_2_hisaMjNwilA8ldv9WWRcBGUO2aNLXCWghUNQ>
 <xme:LUHmaFfZIcuqwZgX2OuSxV0Xgn0FotxNOW990p3mZL4y7niKK4aJvK64DMy_y3x9X
 R5nz8-MuOcH5SrOy_29HIRHQLWhxpw_clZXi-eNbPBy9oCKUQ>
X-ME-Received: <xmr:LUHmaGesQ4KpOhlAVa2CA5SPoiiVmgDv3aepNuMMizBAwTD8MWoADYQf-6M6qyrkNDi9M-tkU6PbPLRxGH0sz4U2p-PWeIzRw63mbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutdefuddtucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepgfejjefhje
 ffieevjeeuveegledtheefjeevffevhffftefgtdfhjeefleejheetnecuffhomhgrihhn
 pehruhhsthdqlhgrnhhgrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthho
 peehkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlh
 drohhrghdprhgtphhtthhopehjohgvlhgrghhnvghlfhesnhhvihguihgrrdgtohhmpdhr
 tghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtghomhdprhgtphhtthhopeihuh
 hrhidrnhhorhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghr
 nhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorh
 dqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurhhiqdgu
 vghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprg
 hpohhpphhlvgesnhhvihguihgrrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhn
 vghlrdhorhhg
X-ME-Proxy: <xmx:LUHmaGDOywgI6IcKUOsyKHV9KDLCIXAw0wBxxvVhxeSzeBLofaFWuw>
 <xmx:LUHmaMkxxlwWQ2LDk_2QfAmCsFnq7sfC_1GakeNzJg4RkfFYAfQwAA>
 <xmx:LUHmaC_PBvKESOKj888waQ-abh5Fk2MgCU3swJME0mxJXBDfBekiBw>
 <xmx:LUHmaM9H9q_26icMYoRuM24GbDROwzUCdA4_OLb8kRP8MvpOmDIcMw>
 <xmx:LkHmaK_X7I47nfM_zLbe0I6OCLk4Aznxs-PFqy01kte5KzhJ89kvuE7M>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Oct 2025 06:47:08 -0400 (EDT)
Date: Wed, 8 Oct 2025 12:47:06 +0200
From: Greg KH <greg@kroah.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>,	Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,	Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Message-ID: <2025100808-unpadded-unsubtle-1053@gregkh>
References: <695CCDCE-A205-4557-AA15-6F102B8CCF0C@nvidia.com>
 <DDCV84IJHUML.126CB1CT0XMX5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDCV84IJHUML.126CB1CT0XMX5@kernel.org>
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

On Wed, Oct 08, 2025 at 12:23:40PM +0200, Danilo Krummrich wrote:
> On Wed Oct 8, 2025 at 1:37 AM CEST, Joel Fernandes wrote:
> > The Nvidia GPU architecture is little-endian (including MMU structures in VRAM).
> 
> Yes, I'm aware (and I'd assume that there is no reason to ever change that).
> 
> Just for the complete picture, there's also some endianness switch in the
> NV_PMC_BOOT_1 register I think?
> 
> > All the CPU architectures our drivers support are expected to be little-endian.
> 
> Technically, all Rust supported architectures are indeed little-endian.

s390x is supported by rust as a tier2 output:
	https://doc.rust-lang.org/beta/rustc/platform-support/s390x-unknown-linux-gnu.html

so there really shouldn't be any reason why that platform couldn't add
rust support today, right?

thanks,

greg k-h

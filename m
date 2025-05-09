Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A19AB09CF
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E1A10E9A7;
	Fri,  9 May 2025 05:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="ROH5GC1S";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ncJHKtnG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A032C10E20A;
 Fri,  9 May 2025 05:42:26 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 093701380289;
 Fri,  9 May 2025 01:42:26 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
 by phl-compute-05.internal (MEProxy); Fri, 09 May 2025 01:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1746769346;
 x=1746855746; bh=MB3lLFNoiR8mwVWRkKRUkc84kUA8vTg/iA4jkAjD9d8=; b=
 ROH5GC1SWw0akHZWm3Pzq3H4enCsOR/pXkftFTBNDIVeGZmh97EAGMraNsRH7QYq
 SP5mRtPHyX7pa1bnmkQ9JJ+iftuJJjXhOSNs3DiLlMLo25Qc/olnsDVdUaKlFk+I
 bSovqxTVC4kSawOW7HuB51eGuaYH/3uXC14kBf3UeoHGAmerj8vmHTA0gQ+bEuHw
 u437N95/s1LQ5E9nybIojiSgD1T4ucsav18os1sZHv47K0zfDH59LWMPQmAZwynN
 G0E3udCGm9pPH9sC/IqJeptnv3Z7f48kHCuhWZFg3zj6e6uiSRUuwDOY82+4CUhC
 fLvkrOYH+/UcqAuxEnb73g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746769346; x=
 1746855746; bh=MB3lLFNoiR8mwVWRkKRUkc84kUA8vTg/iA4jkAjD9d8=; b=n
 cJHKtnGfneB0Vl+4Xi4kMNiWIID7ApTaIke6cGDPZZ+QK7wpDjpLiTArhp+wQK6s
 SRztqUnDObhn/TTba9bjACI5yPpns8Vo97WS4gHIQ2+wIBPYJo4i5t/zCQaV6vNa
 xFV773OYguC4lPKP+YaOdU/Bcz/P8Mfjv56cBRQdY7FeDsEWb9mWHL9OsAsGqRT9
 imY2A9UfmVKamBqAtHirMcTecBMkWziuIgi8bFXlfHN2czbn8XL8SSGWz2pe6ENF
 675+lJZButysg7tvkTiBZnYNHvpUy6uRqyXamZ6Z8nC+asbzac3gGo7rQVLvz+2V
 u/E/1+L85oP76jF7OKGRA==
X-ME-Sender: <xms:wZUdaD-uoZhpLt6Lb1mrTNxG-UrjexeQj0Nc_Ho8TMG-_IrV6LIRUg>
 <xme:wZUdaPvmbcunVL0yyPnxS3yuY7a43oPQzNdDvQ25ATNdUqvLDfjEW2dvp8elxpdSc
 Oc2CiDbJA4Dh_8sVTc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledukedtucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
 tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
 gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
 fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
 vdekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghnihgvlhdrrghlmhgvih
 gurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihl
 lhdrtghhpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoh
 eprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgidrghgrhihn
 ohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrvgifjhgsrghllhgrnhgtvg
 esghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdr
 tghomhdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtoh
 hmpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:wZUdaBAzFezhfoPmQPXS_oS4_1ahC4L0GwaYKLSb7IQO1CwJ9GxLhg>
 <xmx:wZUdaPeJisi11crPwsPU4HoSfQSpWCYtGk9qyRPPvqRdt1W7L1akIA>
 <xmx:wZUdaINs6Hja8YRah1_ViCVCFIENa7I9UyB5gzdf_NcfXLrxcenrTQ>
 <xmx:wZUdaBmCHnAxug-EbRWeoVulYz1dOJpYzQDAeQ_sos3ldGNUOEm_7A>
 <xmx:wpUdaJCWafaD1jFVg_sv9mefQ1HVDxBUJN7BP9Oyjsxu9z-QQR_-X9N8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 5AF1D1C20069; Fri,  9 May 2025 01:42:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tc229d2825b252d63
Date: Fri, 09 May 2025 07:42:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Ballance" <andrewjballance@gmail.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, bhelgaas@google.com,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "Raag Jadav" <raag.jadav@intel.com>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, me@kloenk.dev,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>, daniel.almeida@collabora.com
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org
Message-Id: <13e23d59-ca5d-4cc7-83cd-0c3f41b1bedc@app.fastmail.com>
In-Reply-To: <20250509031524.2604087-7-andrewjballance@gmail.com>
References: <20250509031524.2604087-1-andrewjballance@gmail.com>
 <20250509031524.2604087-7-andrewjballance@gmail.com>
Subject: Re: [PATCH 06/11] io: move PIO_OFFSET to linux/io.h
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

On Fri, May 9, 2025, at 05:15, Andrew Ballance wrote:
> From: Fiona Behrens <me@kloenk.dev>
>
> Move the non arch specific PIO size to linux/io.h.
>
> This allows rust to access `PIO_OFFSET`, `PIO_MASK` and
> `PIO_RESERVED`. This is required to implement `IO_COND` in rust.
>
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>

This puts an implementation detail of the x86 specific
iomap() code (unfortunately named "GENERIC_IOMAP" for historic
reasons) into common code. Please don't do that.

We still have a couple of users of GENERIC_IOMAP outside of
x86, but they all work in subtly different ways, and I've
been thinking about better ways to handle those. Ideally
the nonstandard iomap variants (x86, uml, powerpc/powernv,
m68k/q40) should just implement their own ioread/iowrite
helpers out-of-line like we do on alpha and parisc, while
everyone else just aliases them to readl/writel.

      Arnd

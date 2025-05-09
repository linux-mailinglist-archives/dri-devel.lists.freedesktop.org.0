Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31910AB0A41
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 08:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6277110E9B3;
	Fri,  9 May 2025 06:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="jnguVLlZ";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="FeQqFw4R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7AF10E9B3
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 06:05:33 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 5F1FC2540165;
 Fri,  9 May 2025 02:05:28 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
 by phl-compute-05.internal (MEProxy); Fri, 09 May 2025 02:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1746770728;
 x=1746857128; bh=qZ8PpynMyA3bGCmwcCrTN20BWUQt0buKgTswM5C+T9g=; b=
 jnguVLlZJaMH9cvyUpSiwX94nVTw/gCJ1+aZHXVhyAWhPyP7yJYe4uMAj8lGVIgQ
 RRct8Qm9jEAnBHolU4IIRIo8wGOnFNF4UGpRj8/zko3ha/ovPBefvLGkPQY8M/q4
 y9vwuWs77DF8sG5D10DN5hdOPAStxb9leTp6IpkmfC5+VWZNjcQdUizwYW1eBycQ
 08IPsfxCEjoSJNbUw/SkwBtSloAJkCDyNN7AlHY3v4/9LxGfJC6+hDJmgke++Vj9
 1KdpPA4VdCNmvc0eiCfdqoKzZj35zw+qXgA4OtezGvPVcz45WB/lbg1PcYV0uVoZ
 DxrlqsqmnQVV9F0aM//y3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746770728; x=
 1746857128; bh=qZ8PpynMyA3bGCmwcCrTN20BWUQt0buKgTswM5C+T9g=; b=F
 eQqFw4RJt5Pnwf9M0+4uwpBt+f8o/vNadtnZnBCch3NrLysDy/b3mgbzXxiL4Gqv
 iT2TSab7F3NPoVVVKXMQpkB/Ug4ciYTpUT4Qd4gYU8r6uGplUEo2oEk560bA4EZh
 caEJ0HcxlRAuCldWUnjarQdAzJ3Kp3CM+x4My3oO7xizXFzJw0AYoW89M4cumCyw
 gimP9/qfdRg2/ZgYzOMyzrw8WVxIxercZFT4eGINN9EcU4BMCN7OiRSCkgeuplD5
 kIjPxaZkMIzVaaXD80qcJ4pbxEXW/KodM1AAhlOAaNUggqIML7LHiGq2UAKmEOzy
 ML7K886wRKRo25ACyQ67g==
X-ME-Sender: <xms:J5sdaPRYsbI_VBfO7JlcgbY1exAaAs2G14mR33Y50tC1iDRUEwbJOw>
 <xme:J5sdaAw0VEzT0-TcHaSeGXzmI38XcDYv00yP7MdFFADvOWTuwNsceo0D1CMiuJlW0
 B7CuY1Er0rltue0N1o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledukeeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:J5sdaE1JDYETjLgyiECyW0ljfGM_hDj-7fdgBoJBYbi7yhku8AEHPA>
 <xmx:J5sdaPDPYoCj0N0Dmg2dITRziM42lxJWWfsvF0vGGrlOIRnL7q-V4A>
 <xmx:J5sdaIjtZ34cNXzDSi6ReDp0TWWLBexm8jKPfCwJqugvj7l_xW75Yw>
 <xmx:J5sdaDrv7pswzOnn80kNMGP9sKtq36dBscVnu_Oc7ST_E9kgoePbrQ>
 <xmx:KJsdaBlnaKL704IQpL9yXD7Jgzyvy_-qpxKsA4XEGdh4reS-gJXpLFjo>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 3BB071C20069; Fri,  9 May 2025 02:05:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tfe1d269e5f3a05db
Date: Fri, 09 May 2025 08:05:06 +0200
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
Message-Id: <03548041-89f9-41a2-8488-5b234ce11138@app.fastmail.com>
In-Reply-To: <20250509031524.2604087-5-andrewjballance@gmail.com>
References: <20250509031524.2604087-1-andrewjballance@gmail.com>
 <20250509031524.2604087-5-andrewjballance@gmail.com>
Subject: Re: [PATCH 04/11] rust: io: add PortIo
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
> +
> +#define define_rust_pio_read_helper(name, type)     \
> +	type rust_helper_##name(unsigned long port) \
> +	{                                           \
> +		return name(port);                  \
> +	}
> +
> +#define define_rust_pio_write_helper(name, type)                \
> +	void rust_helper_##name(type value, unsigned long port) \
> +	{                                                       \
> +		name(value, port);                              \
> +	}
> +
> +define_rust_pio_read_helper(inb, u8);
> +define_rust_pio_read_helper(inw, u16);
> +define_rust_pio_read_helper(inl, u32);
> +
> +define_rust_pio_write_helper(outb, u8);
> +define_rust_pio_write_helper(outw, u16);
> +define_rust_pio_write_helper(outl, u32);

These have to be guarded with "#ifdef CONFIG_HAS_PIO", since
most modern machines no longer support PIO at all, even behind
PCI.

The option is still enabled by default for a number of
architectures that normally don't have PIO, but it should
eventually become optional on pretty much anything but
x86 and a few 1990s-era workstations that implement x86-style
on-board devices.

     Arnd

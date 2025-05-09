Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0439AB09DD
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B6310E15C;
	Fri,  9 May 2025 05:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="yFlhotKn";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="L8WjzyeN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F37E10E15C;
 Fri,  9 May 2025 05:46:20 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id C8B231380299;
 Fri,  9 May 2025 01:46:19 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
 by phl-compute-05.internal (MEProxy); Fri, 09 May 2025 01:46:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1746769579;
 x=1746855979; bh=+1+xZSC34osRgfIQqLNaRNA6WjmcAgoDcTg1LRLRZG4=; b=
 yFlhotKnpiER4XVR3XsZRORud1Hs6z+IS4WAiNu6CxBdmq61ylLYy8NEt7mxM3wC
 5359Tg6X9Rzo9y6AgYvjQCnETFR5m0eo/Wo/ucMLxS7qbvahpbcNGlyje+YGyUaW
 IuhqINGDcw/PIDvPpOpPVMnJdUo9hmHcazeNNRn28mzyxnI99tupsjedlz+PfSVf
 TTF/VayGTPRkXzDMTAoLbrvgD5s5xxUtdxT70EG9QvWEvkwhct6zbZsUys28HGqx
 gGL+ac8UlQ/IfVDCGoEoaPy+rA3V+3Zr6JKvgfUl5hvIVEp5AxnCQAKjDGx23yE8
 9ZKmlgQlydumUqKSKL0WTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746769579; x=
 1746855979; bh=+1+xZSC34osRgfIQqLNaRNA6WjmcAgoDcTg1LRLRZG4=; b=L
 8WjzyeNnoFxWxb5qxjG5+LHsSUlA9er35Tu4NHVXBdN/sNbfaGHLTMBdLMeP9HKL
 4l0ASB13YcOrdL3FVK+rL+h1+A0ot2AofCpPZeJh1OXntysiMgcnl6ODofKpEKK+
 5LuFgDpasqbu1/PRNX+HpJPmALS1XOS8SyY5YW1xSaMGwMWOjg37JOnR853TnjT/
 WYFGss9q4+1CTT6jGpBA3R3nniEUKN8Pe85UMXwPIC1HrSxb76utVgeVuo0+X11k
 EjFk0F4PbXyWesufZrAtnwTg0N1eRYlx6I/DmYR3ZAXSjgBrUTtMtP+dWFAp8gnE
 Gi+wuUpKybXnXkN55qj0g==
X-ME-Sender: <xms:qpYdaKo-tquc02AU4c9qI6ZcYHHQC9GJvKkWsp53LvHPnqT6_D89Tw>
 <xme:qpYdaIqGk1EhNJg-hd5iC9-I6ijmKpwpgJ8zMV27buej4S6YLWaGjIcy5_rBCzihm
 g6PXCk6wzGO6RwiQMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledukeduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:q5YdaPOcSPGxyC1-W6dgo6AzLjBYr0E3nluy8VuFfYZEWXuVKm90Fg>
 <xmx:q5YdaJ6R1Kf-dXTk3dP4QigCAYp11CLkxX78tEIpkRfvqWQKmW0xfg>
 <xmx:q5YdaJ64Qe4C6uvfdNHjYvG-HvSb0FxCdMldMK2FQyNHgLYSmKuTFw>
 <xmx:q5YdaJgraDRO-OAgiLEfxV9WiuyfStMFEDyCsViJxbUjaTlYGdXgMw>
 <xmx:q5YdaKfNQuXTLi7OG1dqJLCXW_IultqJx1p6Eknlc2PVNI7ga9VI6cWU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id E5AE31C20068; Fri,  9 May 2025 01:46:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tef2df9750d8374d1
Date: Fri, 09 May 2025 07:45:58 +0200
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
Message-Id: <3ad271f7-12e3-4e92-82eb-cd8cd5dbd703@app.fastmail.com>
In-Reply-To: <20250509031524.2604087-8-andrewjballance@gmail.com>
References: <20250509031524.2604087-1-andrewjballance@gmail.com>
 <20250509031524.2604087-8-andrewjballance@gmail.com>
Subject: Re: [PATCH 07/11] rust: io: add from_raw_cookie functions
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

> +}
> +#[cfg(not(CONFIG_GENERIC_IOMAP))]
> +mod io_backend {
> +    // for everyone who does not use generic iomap
> +    // except for alpha and parisc, neither of which has a rust compiler,
> +    // ioread/iowrite is defined in `include/asm-generic/io.h`.

I think you should special-case x86 here then. The GENERIC_IOMAP
variant is likely to need another hack for powernv to actually work.

Hopefully we won't have to support m68k/q40 here.

     Arnd

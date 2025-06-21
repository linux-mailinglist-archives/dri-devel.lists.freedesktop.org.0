Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF5AAE2CA0
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 23:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2C210E2F6;
	Sat, 21 Jun 2025 21:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cj21Cs9v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462BF10E2F5;
 Sat, 21 Jun 2025 21:18:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CACC14A7DF;
 Sat, 21 Jun 2025 21:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DE0C4CEE7;
 Sat, 21 Jun 2025 21:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750540733;
 bh=Y442YX5hM85zpUXLCqKwJEt5Ke3jFuQq2IdIaKtfHnY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Cj21Cs9vo16c9/agcI0xqrPisWhf971Q8Grpd5dNTcqDw+yAnjC9eGBk+ZgSSM6ml
 WuLtpT48XOJTt1RgONS749wakxcv+P51epDks9uRM0XrRWkBF0mLImnsgqjZga29K9
 tBN1elhcw/BPM6kH5WzBFbuY01NeDCwjuarrEoVU/RyPCLfPP3lIsnsWi/eQ1+7pC5
 qdxytMND/2noNXE/IZOgLJnI3aN8UG3RFZcRSvVFgGx2kKH6nsnOhAzopPOHe2YYaN
 yEm4OPMaxgQ05giQba8s4/NR1TRJwD0jwShSfHzc2uGL/zWGegpZDSgpbVSTId73I3
 5stBWhNTlIWfA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250619-cstr-core-v12-5-80c9c7b45900@gmail.com>
References: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
 <20250619-cstr-core-v12-5-80c9c7b45900@gmail.com>
Subject: Re: [PATCH v12 5/5] rust: remove core::ffi::CStr reexport
From: Stephen Boyd <sboyd@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
 Tamir Duberstein <tamird@gmail.com>
To: Alex Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Arnd Bergmann <arnd@arndb.de>, Benno Lossin <lossin@kernel.org>,
 Bill Wendling <morbo@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>,
 Breno Leitao <leitao@debian.org>, Danilo Krummrich <dakr@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>, David Airlie <airlied@gmail.com>,
 David Gow <davidgow@google.com>, David S. Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Gary Guo <gary@garyguo.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Ira Weiny <ira.weiny@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Justin Stitt <justinstitt@goo
 gle.com>, Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Leon Romanovsky <leon@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Rae Moar <rmoar@google.com>, Rafael J. Wysocki <rafael@kernel.org>,
 Rob Herring <robh@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@google.com>,
 Simona Vetter <simona@ffwll.ch>, Tamir Duberstein <tamird@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Trevor Gross <tmgross@umich.edu>,
 Viresh Kumar <viresh.kumar@linaro.org>, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>
Date: Sat, 21 Jun 2025 14:18:52 -0700
Message-ID: <175054073280.4372.1963514562501935667@lazor>
User-Agent: alot/0.11
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

Quoting Tamir Duberstein (2025-06-19 08:06:29)
> Clean up references to `kernel::str::CStr`.
>=20
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---

For clk part

>  rust/kernel/clk.rs                    |  3 +--

Acked-by: Stephen Boyd <sboyd@kernel.org>

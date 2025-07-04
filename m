Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF60DAF89E8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E7B10E966;
	Fri,  4 Jul 2025 07:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="s7b8gHjl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2427A10E148;
 Fri,  4 Jul 2025 07:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=lLeBr9v7iWnmJB5WR8E+Qdx4chL/QEo8kPrObOm2XBg=; b=s7b8gHjlLshr/s6aHjDwESkoZv
 9xldLQc20XR4fF5OqxXWznCzk91go6X0+1hokaiCtTzgcvzRs3qRiKtfsqTUJE7KKzeAgCKHREsra
 kvnr9afUyBdWT23H0Pp+eDaPiqOZEqx4FXHdDlmRumtj22gq0Q3GoFqjbkWKDBxQn6m8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uXb7w-000B5q-N9; Fri, 04 Jul 2025 09:46:32 +0200
Date: Fri, 4 Jul 2025 09:46:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Jens Axboe <axboe@kernel.dk>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-pci@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
Message-ID: <307d7547-b8da-4a82-9ae6-c95f66a283d2@lunn.ch>
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com>
 <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org>
 <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
 <34c00dfa-8302-45ee-8d80-58b97a08e52e@lunn.ch>
 <CANiq72ksOG10vc36UDdBytsM-LT7PdgjcZ9B0dkqSETH6a0ezA@mail.gmail.com>
 <CAJ-ks9mkC3ncTeTiJo54p2nAgoBgTKdRsAwEEwZE2CtwbAS7BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ-ks9mkC3ncTeTiJo54p2nAgoBgTKdRsAwEEwZE2CtwbAS7BA@mail.gmail.com>
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

> There's also a tactical question about splitting by subsystem: are
> there any tools that would assist in doing this, or is it a matter of
> manually consulting MAINTAINERS to figure out file groupings?

You can run ./scripts/get_maintainer -f path/to/file.c

and it will give you the Maintainers for that file. From that you can
imply the subsystem.

It might be possible to do one tree wide patchset, since Rust is still
small at the moment. But you will need to get Reviewed-by: or
Acked-by: from each subsystem Maintainer for the patches. That is not
always easy, since some subsystems have CI systems, and will want the
patch to pass their CI tests before giving an Reviewed-by.

	Andrew

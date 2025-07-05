Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F65AF9F03
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 10:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DFA10E1E9;
	Sat,  5 Jul 2025 08:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="WovYhOnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD77710E1B6;
 Sat,  5 Jul 2025 08:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ZyzKEihZDNZ16DmOGMSJ88ULGx/pSbICKS/fdJw2ya4=; b=WovYhOnmAWVhGBmVShxVSXCTwl
 KsTC761cpyV/PL7pyO1+z87KG4GV/WJ5cZTpgj4Kw6nxQ5HZ6uDgyaA/G/6CqEJfp/U0bgh+VOJFS
 0yOZfJvHjAhF4e6yYUVUNjWH8BzxdJ/qNqWFS3TdQMHJToKBKeHkHyGdHnexNZTTDYdA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uXxsY-000NJL-1K; Sat, 05 Jul 2025 10:04:10 +0200
Date: Sat, 5 Jul 2025 10:04:10 +0200
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
Message-ID: <a9bd145e-b634-41ca-972c-5f81e5e1033d@lunn.ch>
References: <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org>
 <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
 <DB2PIGAQHCJR.3BF8ZHECYH3KB@kernel.org>
 <CAJ-ks9=WmuXLJ6KkMEOP2jTvM_YBJO10SNsq0DU2J+_d4jp7qw@mail.gmail.com>
 <CAJ-ks9kNiOgPO7FF3cAbaSNtTWs0_PzQ4k4W0AxjHNFuMJnDcQ@mail.gmail.com>
 <DB36T5JWBL10.2F56EDJ1XKAD0@kernel.org>
 <CAJ-ks9=Jutg+UAwCVER_X91BGxWzmVq=OdStDgLZjTyMQSEX6Q@mail.gmail.com>
 <CANiq72nZhgpbWOD4Evy-qw2J=G=RY4Hsoq9_rj6HGWMQW=2kTw@mail.gmail.com>
 <CAJ-ks9m4S1jujQvyt9TOvNMewjNSztps8vayGga+MnNU+0YUcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ-ks9m4S1jujQvyt9TOvNMewjNSztps8vayGga+MnNU+0YUcQ@mail.gmail.com>
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

> OK, with all the splitting requested, this comes out to ~54 patches.
> I'll send the first bit (which can go in cycle 0) as v14.

FYI: Some subsystems have limits as to how many patches can be posted
at once. e.g. for netdev, don't send more than 15.

This is another rule about making it easier for reviewers. If i see 20
patches, i will defer reviewing them until later, when i have more
time. For a handful of patches, especially small obvious patches, i'm
more likely to look at them straight away.

	Andrew

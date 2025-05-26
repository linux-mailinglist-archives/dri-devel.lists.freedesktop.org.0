Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B1AC457E
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 01:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C5B10E404;
	Mon, 26 May 2025 23:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Toydrlzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479B010E3EF;
 Mon, 26 May 2025 23:17:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 524FE629C6;
 Mon, 26 May 2025 23:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B731DC4CEE7;
 Mon, 26 May 2025 23:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748301470;
 bh=/j09BPeE3E/NiK7v4LnFTp0Eilk8zqqtlKV3xNNcsj0=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=ToydrlzgB4/AD3R5ylHQaqRl4ZwuDOd8XUO/vXyOQKaD+BNCEtkjvG30nQds8Kcck
 uxdM/EeTv80EfppD02Kl6C4PUw9tRq4C88IoPUPfvt/PChD2VVh0+gtYApq3ptma4t
 cEdfN2IMxVM0k1m6aAi0zb+s8pLJHC5osqxdDw/6IMPNdy6DC9O+rKe9eu4uqd2Td7
 bE9wD58tojx1yvua91L7DXNa+w4Fh3QxrkOeGSwJOPO6S4rjmraVwPGsIRDR5Ole7k
 SA0EGxWootSi2CsKpF8BX6pAT9QrnmKEXZrDlS9l1Wkjkd55uY+PVvKLL7Hqoy2VsH
 siNYX66Wiwi7Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 01:17:37 +0200
Message-Id: <DA6H562MA3LJ.25NISAF9FT1ZD@kernel.org>
Cc: "Michal Rostecki" <vadorovsky@protonmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "David Gow" <davidgow@google.com>, "Rae Moar"
 <rmoar@google.com>, "Danilo Krummrich" <dakr@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Saravana Kannan" <saravanak@google.com>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Waiman Long" <longman@redhat.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Heiner Kallweit" <hkallweit1@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Arnd
 Bergmann" <arnd@arndb.de>, "Jens Axboe" <axboe@kernel.dk>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
 <dri-devel@lists.freedesktop.org>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <llvm@lists.linux.dev>,
 <linux-pci@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <linux-block@vger.kernel.org>
Subject: Re: [PATCH v10 5/5] rust: remove core::ffi::CStr reexport
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-5-6412a94d9d75@gmail.com>
 <DA66OFXQCWUK.31LM78DIVABZV@kernel.org>
 <CAJ-ks9m=okC9_K2MJU80xbnO+3+Z0hvC_FYzCtzW9pD=WA_xqQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9m=okC9_K2MJU80xbnO+3+Z0hvC_FYzCtzW9pD=WA_xqQ@mail.gmail.com>
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

On Tue May 27, 2025 at 12:30 AM CEST, Tamir Duberstein wrote:
> On Mon, May 26, 2025 at 11:05=E2=80=AFAM Benno Lossin <lossin@kernel.org>=
 wrote:
>>
>> On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
>> > Clean up references to `kernel::str::CStr`.
>> >
>> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>> > ---
>> >  drivers/gpu/drm/drm_panic_qr.rs   |  3 ++-
>> >  drivers/gpu/nova-core/firmware.rs |  2 +-
>> >  drivers/net/phy/ax88796b_rust.rs  |  1 +
>> >  drivers/net/phy/qt2025.rs         |  1 +
>> >  rust/kernel/device.rs             |  3 +--
>> >  rust/kernel/driver.rs             |  4 ++--
>> >  rust/kernel/error.rs              |  6 ++----
>> >  rust/kernel/faux.rs               |  5 ++++-
>> >  rust/kernel/firmware.rs           | 15 ++++-----------
>> >  rust/kernel/kunit.rs              |  6 +++---
>> >  rust/kernel/lib.rs                |  2 +-
>> >  rust/kernel/miscdevice.rs         |  3 +--
>> >  rust/kernel/net/phy.rs            |  4 +++-
>> >  rust/kernel/of.rs                 |  3 ++-
>> >  rust/kernel/pci.rs                |  2 +-
>> >  rust/kernel/platform.rs           |  2 +-
>> >  rust/kernel/prelude.rs            |  5 +----
>> >  rust/kernel/str.rs                | 22 ++++++++++------------
>> >  rust/kernel/sync/condvar.rs       |  4 ++--
>> >  rust/kernel/sync/lock.rs          |  4 ++--
>> >  rust/kernel/sync/lock/global.rs   |  5 +++--
>> >  rust/kernel/sync/poll.rs          |  1 +
>> >  rust/kernel/workqueue.rs          |  1 +
>> >  rust/macros/module.rs             |  2 +-
>> >  24 files changed, 51 insertions(+), 55 deletions(-)
>>
>> Haven't compile tested this series yet, but this commit seems to suggest
>> to me that some of the previous commits introduced code that doesn't
>> compile or emits warnings? If so that needs to be fixed.
>
> That's not the case. There are no warnings and no compilation failures
> in prior commits.

Ah it's because of the `pub use`... I tested it both with 1.86 and 1.78
and aside from the `use<>` error reported by the bot everything worked.

---
Cheers,
Benno

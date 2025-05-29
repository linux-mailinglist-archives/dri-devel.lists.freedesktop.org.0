Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3DFAC8452
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 00:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5171210E796;
	Thu, 29 May 2025 22:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LSE+Qogj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5618610E136;
 Thu, 29 May 2025 22:28:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C68B614BA;
 Thu, 29 May 2025 22:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D1BC4CEE7;
 Thu, 29 May 2025 22:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748557730;
 bh=e8TEEjSp0s5O/t4hPJKOBKjjl39Qm/MlC3Px+bz4X6M=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=LSE+QogjEYxkiI3sLL/2EWF227oOpNqqRoZADdjan2fcCNc9UUQS4OdWtWVe/ergC
 1R1Sx85xFvZXUEYlIzWn1sSyL0FVVMn5ur0w5vTebKCYhUrnk9ONcxoYZssfGFTZc1
 jdV+lxkgQI9JODNCb7eV6uxeVlFJxq2wk9EGxpXI7JmY0dhMsy+fFiUZM5Rs+2Zhmz
 0Hy2mfoLEHBR0TkPikAF4nJBe4f0f+E2nKvjJx5CG3V5vJSePFppIjZpm0Rsc5IDB7
 Pw1TBBR2VABrd6+Goqd0O2vhvtFoR+IlRcGCQHedBRhDomXoDHAAiG1KvUPKMx/JJq
 pktQJ6hgr2jUA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 00:28:37 +0200
Message-Id: <DA8ZZA7P2QUW.ODHEX4NB0RTB@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Michal Rostecki"
 <vadorovsky@protonmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
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
Subject: Re: [PATCH v10 4/5] rust: replace `kernel::c_str!` with C-Strings
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-4-6412a94d9d75@gmail.com>
 <DA66NJXU86M4.1HU12P6E79JLO@kernel.org>
 <CAJ-ks9nd6_iGK+ie-f+F0x4kwpyEGJ-kQiQGt-ffdbVN5S6kOg@mail.gmail.com>
 <aDbnLzPIGiAZISOq@google.com> <DA7WJYNAN5AI.2HE6B953GR16A@kernel.org>
 <CAJ-ks9nmxdSKtEuzT=yBU-WEuZXBupr5N6tainzrk=w3U_enXw@mail.gmail.com>
In-Reply-To: <CAJ-ks9nmxdSKtEuzT=yBU-WEuZXBupr5N6tainzrk=w3U_enXw@mail.gmail.com>
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

On Fri May 30, 2025 at 12:21 AM CEST, Tamir Duberstein wrote:
> On Wed, May 28, 2025 at 11:35=E2=80=AFAM Benno Lossin <lossin@kernel.org>=
 wrote:
>> On Wed May 28, 2025 at 12:36 PM CEST, Alice Ryhl wrote:
>> > On Mon, May 26, 2025 at 06:29:46PM -0400, Tamir Duberstein wrote:
>> >> On Mon, May 26, 2025 at 11:04=E2=80=AFAM Benno Lossin <lossin@kernel.=
org> wrote:
>> >> >
>> >> > On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
>> >> > > +macro_rules! c_str_avoid_literals {
>> >> >
>> >> > I don't like this name, how about `concat_to_c_str` or
>> >> > `concat_with_nul`?
>> >> >
>> >> > This macro also is useful from macros that have a normal string lit=
eral,
>> >> > but can't turn it into a `c""` one.
>> >>
>> >> Uh, can you give an example? I'm not attached to the name.
>> >
>> > I also think it should be renamed. Right now it sounds like it creates=
 a
>> > c string while avoiding literals in the input ... whatever that means.
>>
>> Yeah that's a good way to put why the name is weird.
>>
>> > I like Benno's suggestions, but str_to_cstr! could also work?
>>
>> Hmm, I think then people won't know that it can also concat? I don't
>> think it matters too much, the macro probably won't be used that often
>> and if someone needs to use it, they probably wouldn't fine it by name
>> alone.
>
> What do you mean by "it can also concat"? This macro by itself doesn't
> concat, it takes only a single expr.

Oh right, seems like I thought it took `$($t:tt)*`...

> The example in the docs illustrates:
>
>     const MY_CSTR: &CStr =3D c_str_avoid_literals!(concat!(...));
>
> I think str_to_cstr is ok - I'll do that in v11.

Sounds good!

---
Cheers,
Benno

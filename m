Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46484BC2D14
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 00:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDACE10E704;
	Tue,  7 Oct 2025 22:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qffl5CaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B56610E064;
 Tue,  7 Oct 2025 22:09:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 288DC60234;
 Tue,  7 Oct 2025 22:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B73DC4CEF1;
 Tue,  7 Oct 2025 22:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759874946;
 bh=XS6kxUgIxY0xi7QvlRdjUhp7HYIxFJBZ7ARKYvS767s=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Qffl5CaEBIWcdvdFCYM3iPL9e1NOQQ6uvu7t/vI+JjgNFgD6rO5+4n+RpNc4qYNLw
 pIpHvO0kVy5e5ZB2pF9g97kX69Yu48257XCzH5CMLPGweSZQUJaNM8WHtbL8KfFmXp
 /O+jOOvNp1P2GYjFr7UFN3x+AprxLXI+xkL4HzyYbSfkuDkcLXOdBgLYjigEhTkCr9
 F54zHAgEDvBABH//A+T3l4g27HNf5sg7WxuRSyOrjh77ahYSyzrfQjqc56SNV2NmDm
 Y+v7bc91HxA95pT/mURPwchCu+MJQEcLGFP1FiVUZbx1CB7zy270q9ySpC3qcr+7YT
 UIRyTreQndmcg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Oct 2025 00:08:59 +0200
Message-Id: <DDCFLM3P5MCC.NEBRVTU7X2G3@kernel.org>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, <nouveau@lists.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
 <DDC49ZIRX79X.2Q4KW0UY7WUF3@kernel.org>
 <faa99188-7ccb-4c7c-b705-3a207f5acd17@nvidia.com>
In-Reply-To: <faa99188-7ccb-4c7c-b705-3a207f5acd17@nvidia.com>
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

On Tue Oct 7, 2025 at 11:08 PM CEST, Joel Fernandes wrote:
> Danilo, Yuri, Miguel, John, all,
>
> On 10/7/2025 9:16 AM, Danilo Krummrich wrote:
>> On Tue Oct 7, 2025 at 12:36 PM CEST, Alexandre Courbot wrote:
>>> Because letting it fully mature within nova-core also has the drawback
>>> that we might miss the perspective of other potential users, which may
>>> make us draw ourselves into a corner that will make the macro less
>>> useful generally speaking. We are at a stage where we can still make
>>> design changes if needed, but we need to hear from other users, and
>>> these won't come as long as the macro is in nova-core.
>>=20
>> There are two different things here that are getting mixed up a bit.
>>=20
>>   (1) Moving the register!() code out of nova-core to make it accessible=
 for
>>       other drivers.
>>=20
>>   (2) Generalize the bitfield implementation that so far is baked into t=
he
>>       register!() code.
>>=20
>> Both of those make sense, but they don't have to happen at the same time
>> necessarily.
>>=20
>> Now, I'm not saying that we necessarily have to change the approach here=
. The
>> current merge window isn't even closed, so we have plently of time left,=
 i.e.
>> there's no rush with with patch series.
>>=20
>> However, if it helps, I'm perfectly fine to take the register!() impleme=
ntation
>> into the I/O entry in a first step and in a second step generalize the b=
itfield
>> implementation and move it out of the register!() code.
>>=20
>> Again, there's no rush as far as I'm concerned, yet the latter approach =
might
>> add a bit more structure and hence run a bit smoother.
>
> In my view it is better to move both bitfield and register macros togethe=
r
> because if we only moved register, it means we would have no bitfield sup=
port
> for the page table / mm use case I just posted a patch for (which is why =
I
> started looking into Bitfield support initially) unless we create a copy =
of just
> the bitfield code within nova which we definitely shouldn't I think. So I=
 think
> it is best to move both.

Again, fine for me either way, but I wanted to open the possibility.

Typically, things run more smoothly when focusing on one thing at a time.
Especially when one thing is done to unblock something else, while the othe=
r
things needs some more discussion and might require a more slow-paced appro=
ach.)

(Slightly off-topic: Regarding the bitfields for page table management: Are=
 we
sure that we can use raw bitfields for this? I.e. will we always be able to
configure the GPU to match CPU endianness?)

> For the IO (register macro) change, I can add add an entry to the existin=
g IO
> record.

I don't think any changes are needed, it should be covered by just moving i=
t to
rust/kernel/io/register.rs.

Thanks,
Danilo

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693DAAC79C4
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 09:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0F710E710;
	Thu, 29 May 2025 07:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qMpEeeVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEF610E30C;
 Thu, 29 May 2025 07:27:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C2BDA5C55B4;
 Thu, 29 May 2025 07:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530A4C4CEE7;
 Thu, 29 May 2025 07:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748503660;
 bh=s6s6ARYurnzqxgQbwLV10a+xTKOthHY4uyCNDCpcO+Y=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=qMpEeeVoObJ4LXrmnAI6HhhTQnWyL4trC4W2xAaEynolLiOyEIaXO9yrQPdG/gcKj
 zI4Q23eUy2bD7gfPx6tMhtQaRvyCnHGvwVon2VSerZc0qxt4Rp/QjxKEmqSUKa2DBd
 YkYE1+w6BAxQzA1FR41e5JsBHzNRgP2r/jHRrWDfc+5qknnAG/7aF2XvZAUiRC4qNq
 5nmKqyc39jos7ZK6dRgaeO6AHW1SR23eFDi0FnZI8+Lg7JMwKZcW9vKkot8Quhs+Y5
 pwaFtzUPhcmpiT5Oq+t2wdOSV174YxaroTBIp5vYK7Fh25Yy2YdYHjk+OqVGtC6OEE
 kdmsCvhTsnWEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 May 2025 09:27:33 +0200
Message-Id: <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
 <DA88YHU4AZT7.B8JGZHW9P9L9@nvidia.com>
In-Reply-To: <DA88YHU4AZT7.B8JGZHW9P9L9@nvidia.com>
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

On Thu May 29, 2025 at 3:18 AM CEST, Alexandre Courbot wrote:
> On Thu May 29, 2025 at 5:17 AM JST, Benno Lossin wrote:
>> On Wed May 21, 2025 at 8:44 AM CEST, Alexandre Courbot wrote:
>>> Introduce the `num` module, featuring the `NumExt` extension trait
>>> that expands unsigned integers with useful operations for the kernel.
>>>
>>> These are to be used by the nova-core driver, but they are so ubiquitou=
s
>>> that other drivers should be able to take advantage of them as well.
>>>
>>> The currently implemented operations are:
>>>
>>> - align_down()
>>> - align_up()
>>> - fls()
>>>
>>> But this trait is expected to be expanded further.
>>>
>>> `NumExt` is on unsigned types using a macro. An approach using another
>>> trait constrained by the operator traits that we need (`Add`, `Sub`,
>>> etc) was also considered, but had to be dropped as we need to use
>>> wrapping operations, which are not provided by any trait.
>>>
>>> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  rust/kernel/lib.rs |  1 +
>>>  rust/kernel/num.rs | 82 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++++
>>>  2 files changed, 83 insertions(+)
>>
>> Have you proposed `align_down` to upstream rust? Not saying that we
>> shouldn't do it here, but if we haven't tried yet, it might be a good
>> idea to just get them upstreamed. (if you do, it should probably be
>> named `prev_multiple_of`)
>
> I haven't yet - haven't ever contributed anything to upstream Rust, so
> I'll have to look that one up first. :) But I agree a `prev_multiple_of`
> could be useful.

I'd recommend opening a thread on Zulip before you go implement stuff.
Then you can also get a more rusty name for `fls` :)

>>> +    /// Align `self` up to `alignment`.
>>> +    ///
>>> +    /// `alignment` must be a power of 2 for accurate results.
>>> +    ///
>>> +    /// Wraps around to `0` if the requested alignment pushes the resu=
lt above the type's limits.
>>> +    ///
>>> +    /// # Examples
>>> +    ///
>>> +    /// ```
>>> +    /// use kernel::num::NumExt;
>>> +    ///
>>> +    /// assert_eq!(0x4fffu32.align_up(0x1000), 0x5000);
>>> +    /// assert_eq!(0x4000u32.align_up(0x1000), 0x4000);
>>> +    /// assert_eq!(0x0u32.align_up(0x1000), 0x0);
>>> +    /// assert_eq!(0xffffu16.align_up(0x100), 0x0);
>>> +    /// assert_eq!(0x4fffu32.align_up(0x0), 0x0);
>>> +    /// ```
>>> +    fn align_up(self, alignment: Self) -> Self;
>>
>> Isn't this `next_multiple_of` [1] (it also allows non power of 2
>> inputs).
>>
>> [1]: https://doc.rust-lang.org/std/primitive.u32.html#method.next_multip=
le_of
>
> It is, however the fact that `next_multiple_of` works with non powers of
> two also means it needs to perform a modulo operation. That operation
> might well be optimized away by the compiler, but ACAICT we have no way
> of proving it will always be the case, hence the always-optimal
> implementation here.

When you use a power of 2 constant, then I'm very sure that it will get
optimized [1]. Even with non-powers of 2, you don't get a division [2].
If you find some code that is not optimized, then sure add a custom
function.

[1]: https://godbolt.org/z/57M9e36T3
[2]: https://godbolt.org/z/9P4P8zExh

> Also in the kernel we tend to use the `align` nomenclature and I think we
> should preserve that for clarity.

That's also fair, but we lose the constness of `next_multiple_of`, so
you can't use `align_up` in a const function. That might confuse people
and then they write their own const helper function... I'd prefer we use
all functions that are available in the stdlib.

>>> +
>>> +    /// Find Last Set Bit: return the 1-based index of the last (i.e. =
most significant) set bit in
>>> +    /// `self`.
>>> +    ///
>>> +    /// Equivalent to the C `fls` function.
>>> +    ///
>>> +    /// # Examples
>>> +    ///
>>> +    /// ```
>>> +    /// use kernel::num::NumExt;
>>> +    ///
>>> +    /// assert_eq!(0x0u32.fls(), 0);
>>> +    /// assert_eq!(0x1u32.fls(), 1);
>>> +    /// assert_eq!(0x10u32.fls(), 5);
>>> +    /// assert_eq!(0xffffu32.fls(), 16);
>>> +    /// assert_eq!(0x8000_0000u32.fls(), 32);
>>> +    /// ```
>>> +    fn fls(self) -> u32;
>>
>> Isn't this just `trailing_zeros` [2]?
>>
>> [2]: https://doc.rust-lang.org/std/primitive.u32.html#method.trailing_ze=
ros
>
> No, `trailing_zeros` counts from the LSB up to the first bit set to 1,
> whereas fls does that from the MSB. For instance, `0xffffu32.fls() =3D=3D
> 16` but `0xffffu32.trailing_zeros() =3D=3D 0`.

Ah right... Then maybe add that to the upstream suggestion :)

---
Cheers,
Benno

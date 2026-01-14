Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0532FD21BF1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 00:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F057A10E1CE;
	Wed, 14 Jan 2026 23:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ml7I8rsG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B35E10E1CE
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 23:21:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 47CE46000A;
 Wed, 14 Jan 2026 23:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2305C4CEF7;
 Wed, 14 Jan 2026 23:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768432917;
 bh=RRb+AYRR2cz5AJx/EsMIw4sXqanuM6N6ZqbK7konFe8=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=ml7I8rsGIehs6Qi/oZBUvUGwDDWnUpmvOvACAaijfbQf8C+ZWGtnskgsLMJGqHTn4
 J+MeBkS4kiBwtnrW5n8bN7p4kZsuz7XiFEGiNmXTojoOv4pZY/Gd7Tcd5zVdvuKmh4
 vZ57hxwDOmBe+9Z3GRTesSgfJR8YHAJRiZziWrkFwxlCP12YlSCYJsxCcwk1DfH9nm
 JJq0e6R7UHzlE4P6Lt7y4ftsd/XtCTTZh3O3TDoBAXLzwT+0gUhTL1qoaVIfW5N2rB
 lqACP6CtsV/3aAXWfxpH9+aga3tzp3K2Mllso3w1aQ82GSOoRw+l8PMb8TSVgxuohs
 MIdJQjp/njx/w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 00:21:51 +0100
Message-Id: <DFOP5BY09539.AFY5L5FV1HNV@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 7/8] rust: Introduce iosys_map bindings
Cc: <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <linux-kernel@vger.kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>, "Krishna Ketan Rai"
 <prafulrai522@gmail.com>, "Tamir Duberstein" <tamird@gmail.com>, "Xiangfei
 Ding" <dingxiangfei2009@gmail.com>, "Zhi Wang" <zhiw@nvidia.com>, "Matthew
 Maurer" <mmaurer@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>
References: <20251202220924.520644-1-lyude@redhat.com>
 <20251202220924.520644-8-lyude@redhat.com>
In-Reply-To: <20251202220924.520644-8-lyude@redhat.com>
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

(Cc: Zhi, Matt, Alex)

On Tue Dec 2, 2025 at 11:03 PM CET, Lyude Paul wrote:
> This introduces a set of bindings for working with iosys_map in rust code=
.
> The design of this is heavily based off the design for both the io and
> dma_map bindings for Rust.

I already had a chat with Lyude about this, but also want to post it here. =
I
have mainly two comment on this:

  (1) The backing memory of iosys_map may be a device resource and hence ha=
s to
      be protected against (bus) device / driver unbind.

  (2) The idea for the generic I/O infrastructure is to support arbitrary I=
/O
      backends rather than only MMIO. For instance, this can also be PCI
      configuration space, I2C, SPI, etc., but also DMA, VRAM, system memor=
y,
      etc.

      For this, there is a patch series from Zhi [1] splitting up the curre=
nt
      I/O structures into traits that we will land soon.

      We will also have macros analogous to dma_read!() and dma_write!() fo=
r the
      generic I/O infrastructure, which Matt also works on for his QC SoC
      driver.

      This will allow us to unify all kinds of I/O operations into a single
      interface, supporting the read!() and write!() accessors for values, =
the
      register!() macro and raw accessors, such as e.g. read32().

      With this we will have something that is way more powerful than iosys=
_map
      and makes this abstraction obsolete.

So instead of introducing an abstraction for iosys_map we should just imple=
ment
the corresponding I/O backends based on [1].

[1] https://lore.kernel.org/all/20260113092253.220346-3-zhiw@nvidia.com/

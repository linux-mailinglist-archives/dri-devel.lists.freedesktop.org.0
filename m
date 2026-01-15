Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3607AD21CF6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 01:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A8E10E280;
	Thu, 15 Jan 2026 00:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="eBMuh7m8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B10010E280
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 00:12:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768435958; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Cu9BhJRS52AhRwcYYPuvT1pqJUK9uA5l6SAW1kh+Aq8xXW2Dx3Z+7AYXbz7hUwgIvcHOMcRyKThBOs6S9LG9oH0Ob+AJMatc0LlqhWCans/LfQaz3bTWfbyQzM/kQYK9RnrAABqBrhn6TYM0htSnlafhihKUTYN7heERsXEI3L8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768435958;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6lVbJv/kp1JUHuRLdjg0Ul+82vhyOfz3TIwZBVs0ZQg=; 
 b=PIUdsk+8z0qcDow67YNcn8bA24NLOWHIDBX2P+CV2vtCt2aOg9yQ/zKPXn+UiySBdf8BrqPlec4P4J8LcwD5W1b38Mw0n+nI8eb6zq+Hgf7pg+amz6g6L3uwUWw5IZ1bpQA7rmVUiM6BaRx+J9z3HTSrWTf4A2V1uvx5Wse0qSM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768435958; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=6lVbJv/kp1JUHuRLdjg0Ul+82vhyOfz3TIwZBVs0ZQg=;
 b=eBMuh7m8x5gT3sApBclVZ3hLcWX/yF/AsMfFDP0Ehe2ChX1jQ9mrBOIHnKYpURIo
 XTfbFkc2QRtD9KXM/NP9/aaz7FTBJuFiBXnxzIobRnM7eqG9IrLFpbEB5GMr+10rIaR
 sRFv2go+z+4hLHZ2UXFkCtlsKAhNvwutX2z69STk=
Received: by mx.zohomail.com with SMTPS id 1768435955415274.62766790076466;
 Wed, 14 Jan 2026 16:12:35 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v6 7/8] rust: Introduce iosys_map bindings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DFOP5BY09539.AFY5L5FV1HNV@kernel.org>
Date: Wed, 14 Jan 2026 21:12:17 -0300
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
 linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 Matthew Maurer <mmaurer@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <449C35F3-CFA1-4B1B-A65D-A3C259E70DF7@collabora.com>
References: <20251202220924.520644-1-lyude@redhat.com>
 <20251202220924.520644-8-lyude@redhat.com>
 <DFOP5BY09539.AFY5L5FV1HNV@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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



> On 14 Jan 2026, at 20:21, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> (Cc: Zhi, Matt, Alex)
>=20
> On Tue Dec 2, 2025 at 11:03 PM CET, Lyude Paul wrote:
>> This introduces a set of bindings for working with iosys_map in rust =
code.
>> The design of this is heavily based off the design for both the io =
and
>> dma_map bindings for Rust.
>=20
> I already had a chat with Lyude about this, but also want to post it =
here. I
> have mainly two comment on this:
>=20
>  (1) The backing memory of iosys_map may be a device resource and =
hence has to
>      be protected against (bus) device / driver unbind.
>=20
>  (2) The idea for the generic I/O infrastructure is to support =
arbitrary I/O
>      backends rather than only MMIO. For instance, this can also be =
PCI
>      configuration space, I2C, SPI, etc., but also DMA, VRAM, system =
memory,
>      etc.
>=20
>      For this, there is a patch series from Zhi [1] splitting up the =
current
>      I/O structures into traits that we will land soon.
>=20
>      We will also have macros analogous to dma_read!() and =
dma_write!() for the
>      generic I/O infrastructure, which Matt also works on for his QC =
SoC
>      driver.
>=20
>      This will allow us to unify all kinds of I/O operations into a =
single
>      interface, supporting the read!() and write!() accessors for =
values, the
>      register!() macro and raw accessors, such as e.g. read32().
>=20
>      With this we will have something that is way more powerful than =
iosys_map
>      and makes this abstraction obsolete.
>=20
> So instead of introducing an abstraction for iosys_map we should just =
implement
> the corresponding I/O backends based on [1].
>=20
> [1] =
https://lore.kernel.org/all/20260113092253.220346-3-zhiw@nvidia.com/
>=20

I wonder if we can combine this with the idea of splitting I/O ranges =
that
we have been discussing for a while. It is a simple concept: you might =
have a
mapping that covers a given length (say, a single BO), but this mapping =
might
be split into multiple subregions that are not accessed simultaneously. =
This
allows for finer-grain control, as subregions are isolated from each =
other.

If the idea is to have all these types eventually dereference to =
=E2=80=9CIo=E2=80=9D
or something like this, the above may be as simple as adding a
=E2=80=9Csplit()=E2=80=9D method which generates a second Io while =
simultaneously
adjusting the bounds as needed.

If this is a good idea then I can spend cycles, as I=E2=80=99ll have a =
use for that in Tyr.

=E2=80=94 Daniel


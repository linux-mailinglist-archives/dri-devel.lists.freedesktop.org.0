Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97DBE5C4B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 01:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA90310E35D;
	Thu, 16 Oct 2025 23:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kxi83S+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0565892F6;
 Thu, 16 Oct 2025 23:11:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9C4B260305;
 Thu, 16 Oct 2025 23:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0351EC4CEF1;
 Thu, 16 Oct 2025 23:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760656289;
 bh=DhmOkJFUmVAYNN2dhznrvUOEoR1lqllzHqc00HdNTHY=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Kxi83S+Lgv8Hr7J61WS+2pdtWMAXY1zuvGuPEW1NW7TvZ3pVazoyfryIJ1lUWtAnz
 CI8Nko+75+oNrEWPXWeiF9Y0FMB2HaGZcOoZgQSIBqd0c0w2KUalqdhr8qAfVsmLd0
 HBcT3hY1hlMJYmxx94nXhEC1Z7ePFvMlpAApPYi0f4kLKgwWqAkV53jSbFnPRLeCRb
 TB3fevVCWEVb4dTuzZoNjgpXH9TYWkohIda3SeV/dqaCF7oPrlBQu8xkaoby8AkEJa
 OQxk/utu53CxUb/HB8fsTsc4jGWre5+iwWAKww4Xfga9rvDXxMjNTyCwYJ+Y+20D9U
 As6a+PhaL38iQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 01:11:23 +0200
Message-Id: <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
Subject: Re: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
Cc: "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-4-apopple@nvidia.com>
 <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com>
 <zwaefk62to77b5nyakeiboyj53fge3lysc3z7arp54tyyherdo@nsqhuig7bmbc>
In-Reply-To: <zwaefk62to77b5nyakeiboyj53fge3lysc3z7arp54tyyherdo@nsqhuig7bmbc>
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

On Fri Oct 17, 2025 at 1:03 AM CEST, Alistair Popple wrote:
> On 2025-10-16 at 17:23 +1100, Alexandre Courbot <acourbot@nvidia.com> wro=
te...
>> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
>> > +impl GspFwWprMeta {
>> > +    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayou=
t) -> Self {
>> > +        Self(bindings::GspFwWprMeta {
>> > +            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
>> > +            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
>> > +            sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
>> > +            sizeOfRadix3Elf: gsp_firmware.size as u64,
>>=20
>> Very unfortunately I'm afraid we will need to replace the `as` in this
>> method with `u64::try_from` and make it return a `Result` for now.
>
> And presumably most of the other `as` keywords in this function dealing w=
ith
> usize as well? Have made the change but would you mind quickly explaining
> why this is needed? Is the concern that usize might be more than 64 bits =
or
> something?

Since nova-core depends on CONFIG_64BIT, I think we want a helper function =
that
converts usize to u64 infallibly.

This helper function can simply generate a compile time error, when
!CONFIG_64BIT, etc.

We can do this locally in nova-core, but it could also find it's place in t=
he
generic infrastructure. nova-core clearly won't be the last driver running =
into
this inconvinience.

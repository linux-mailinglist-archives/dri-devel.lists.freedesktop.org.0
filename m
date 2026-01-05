Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5C7CF59E4
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 22:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C82910E44C;
	Mon,  5 Jan 2026 21:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="tefjr99v";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="q0o2Nukg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393D110E448;
 Mon,  5 Jan 2026 21:11:51 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dlRnJ5WwYz9t7s;
 Mon,  5 Jan 2026 22:11:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767647508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HI5WpvrjxWjcJrI6UBSQlk6VzP6z9tGQtFytnWsSSk=;
 b=tefjr99vbWPESve1qc6HX83gNPDv/eemhfdaqSE0vbiJHdTXP1rehD4Ez8BX3Gpq1ZsDOg
 /QNC+mU8WDZwoInNaJu39AqlK7kHQNtfP4DdFy5+zUea7xhzkUnU58HSe5yYZ3Qoq8+q+l
 5Ub1J6wOpc2LLMg/uZgrW8LtzCXKTf5+yS8oimrRcnHHI81JsGaPsa+WrwL1YLWAwqjcAl
 Iy3ZQ7R26v25bKgUIpe+Vmn2XYpeIdd4qH33apqiSg41193SjSorekqEME92L6S7m6w4m8
 4E4/mOK7rPZr/lILHVwSUUCswAzy07bH1uMD4gG8NErtQ/2fQFHimtRXVvLZ3w==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=q0o2Nukg;
 spf=pass (outgoing_mbo_mout: domain of mhi@mailbox.org designates
 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=mhi@mailbox.org
Message-ID: <cd9d7dd56e8191eb2d61dce1c3fd88ccffcff690.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767647506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HI5WpvrjxWjcJrI6UBSQlk6VzP6z9tGQtFytnWsSSk=;
 b=q0o2Nukg4efahLioZYLQvszxK/JkIcaoVvsr6SjQEj8aND8mNdSH4xd1dyoCFKg64V4ibs
 X/nmgIx0S1kEG6oLjulz1NNvOwZN3FAKziywRssqf6ulEPMqVPJxTGUJRq5YGD264b10e6
 NMLb9NjyApQL11U+RLFD7wz22KpB1OOqYzzJVUXdAnuEsZmPSMXjVLvL5G3HhDVfIOaXSf
 QOU1JVvSUsOcI3vxXvAxbbaTzLxDFQJhMxv2/5J1o5/+QpbqeShzXUHho8hYMLwRAfyhCN
 BY8L+YbY7dZt5KD4xS6o15vPY/h9epkM6RilQyXzODqbnB0dK4qfdjBOss+EoA==
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
From: Maurice Hieronymus <mhi@mailbox.org>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Benno
 Lossin <lossin@kernel.org>
Cc: mhi@mailbox.org, aliceryhl@google.com, acourbot@nvidia.com,
 airlied@gmail.com, 	simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 ojeda@kernel.org, boqun.feng@gmail.com, 	bjorn3_gh@protonmail.com,
 a.hindborg@kernel.org, tmgross@umich.edu, 	rust-for-linux@vger.kernel.org
Date: Mon, 05 Jan 2026 22:11:40 +0100
In-Reply-To: <20260105161110.5d1ab548.gary@garyguo.net>
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
 <20260105161110.5d1ab548.gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: e3b37c8d848180c9f6d
X-MBO-RS-META: q5k68eeri1785xog9na8rjnqh9reutb7
X-Rspamd-Queue-Id: 4dlRnJ5WwYz9t7s
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

On Mon, 2026-01-05 at 16:11 +0000, Gary Guo wrote:
> On Mon, 05 Jan 2026 11:29:04 +0100
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>=20
> > On Mon Jan 5, 2026 at 10:02 AM CET, Benno Lossin wrote:
> > > On Sun Jan 4, 2026 at 9:07 PM CET, Maurice Hieronymus wrote:=C2=A0=
=20
> > > > Add a derive macro that implements kernel::fmt::Display for
> > > > enums.
> > > > The macro outputs the exact variant name as written, preserving
> > > > case.
> > > >=20
> > > > This supports all enum variant types: unit, tuple, and struct
> > > > variants.
> > > > For variants with data, only the variant name is displayed.=C2=A0=
=20
> > >=20
> > > I don't think we should be adding this. Display is designed for
> > > user-facing output and so it should always be carefully designed
> > > and no
> > > automation should exist for it.=C2=A0=20
> >=20
> > In general I agree, but simple stringification of an enum variant
> > for a Display
> > implementation is a very common use-case and it seems pretty
> > unfortunate to have
> > to fall back to either do the below (especially if there are a lot
> > of enum
> > variants) or having to go the declarative path of doing something
> > as in [1].
> >=20
> > Especially in combination with things like FromPrimitive and
> > ToPrimitive it gets
> > us rid of the cases where we need such declarative macro mess.
> >=20
> > Eventually, drivers will most likely implement their own proc macro
> > for this or
> > repeat the declarative macro pattern over and over again.
> >=20
> > Maybe we should just pick a more specific name for such a derive
> > macro than
> > macros::Display.
> >=20
> > Maybe something along the lines of macros::EnumVariantDisplay? We
> > could also
> > have an optional argument indicating whether it should be converted
> > to lower /
> > upper case.
>=20
> I think the proposal is reasonable.
> Being able to print enum name is very common and this is why crates
> like
> `strum` exist.
>=20
Before I start implementing, I want to reach common ground.

In my opinion a derive macro which implements Display would be
perfectly fine, as long as the name suggests what it does. So for
example #[derive(DisplayEnumVariant)]. This would communicate the
intent clearly to the user.

Benno, would you be okay with that? If not, Gary and Danilo, are you
fine with the proposed trait implementation (e.g. the variant_name
function)?
> Perhaps if we want to make user having a thought about what names to
> expose to users, we can have the case conversion argument be
> mandatory, so
> they are forced to make a choice rather than blindly stuck
> `#[derive(Display)]` onto their enum.
>=20
Are there any common use-cases where one wants to change the case of
the enum variants? If not, I would not implement an argument and rather
name the macro accordingly, so the intent is clear.

Thanks,

Maurice
> Best,
> Gary

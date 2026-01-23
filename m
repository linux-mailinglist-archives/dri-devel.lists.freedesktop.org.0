Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ6iGlyPc2l0xAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:10:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AE37780F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D564E10EB17;
	Fri, 23 Jan 2026 15:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mCaIN9kf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E15810EB17
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 15:10:17 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-b8720608e53so366237066b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 07:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769181015; x=1769785815;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=oQ4w+Xy6ndskoNLeBRHiNM+vemoopb+vyDpfNKZnh6E=;
 b=mCaIN9kf0vE/cZey+rzuhK/nEEt/mFFj+QVZ6waLm8zoxtd8WdKiwOv6JnYDspkibR
 R634szfxfYIHRTRE3Hcy2EEF4bB1pGnK6rt0qaeep9xZb1A4NaD5U/WfUR3B+7Z8OOQ+
 Ap1aGsjVemSB45n2vBnDCsYSb7B3UxQyqUfRiOYIYI6J4pdNlnvdQUWJCzi93pNbTVuA
 Ul++9KJZvpUuTxNysK1GFSf6Sgx59xbGFCz/QOYoQQSwumhgpTIPNFqYPSpFP4CczTVO
 bO3DpQe8ajO5aPub94G6iLTqwizM6pkdcwAhYl4YWqTNtgaIb/Je+lhu7JSwts7Wlofo
 BGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769181015; x=1769785815;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oQ4w+Xy6ndskoNLeBRHiNM+vemoopb+vyDpfNKZnh6E=;
 b=c5TEDB0kopazwXhlVm0EXG4CjFsuFUamqlL59f1YNpUWfyXqmcSYQhUtSAzj8wHcAO
 dPvv9fBckc8f204tSxE0HWriOZkJsswq2bg+1zXcNBZEsk24No/bl/q47HGnPjQ6zd3P
 XalWf4xNCIlhw9OZxuyGAtc4uJqHdiwb3c4OKG1yzUuuJ8QOBtexjda8cBTQ/bkok3EZ
 GV32ATFU0ghfD+AMejLQBoumraU7LD4bbM9p1apOg1n91yg5gqhxRciXNrror/397QKg
 XBHl8PuAwt9suwyJtTxwm+lQ8t/YIju4Zn7JiNMSmxxYDa9x6B7Su31IPWz7UJ6fb3pI
 aziw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIv063lFsQ/CUw+GM7yCYLh2mmqtd3/WASLoH7gw2wpibh49flKNa9t2ON/s52SDa9Ba16v+/C0jQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjoRaPXUkESOIfC2MSn1Mzfmfi28vJJwQDa6R65e5A4yG3FO01
 nGzTfLM+VkxFRoIisaWzXqCsGjErTcrF6mri6Iucv7DDPn4padBftvXTHVPcgBZtsjT7i9JnN+g
 LINpLkqJvuNcrgwc+5Q==
X-Received: from ejeb5.prod.google.com ([2002:a17:906:1945:b0:b73:737b:c33c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:4787:b0:b87:fc5:40bd with SMTP id
 a640c23a62f3a-b885af085eamr251570566b.65.1769181015666; 
 Fri, 23 Jan 2026 07:10:15 -0800 (PST)
Date: Fri, 23 Jan 2026 15:10:14 +0000
In-Reply-To: <CANiq72m9Nq-Wonw57Nwk480CTCmoaDk-_rTLX-dFrqh_N+eyfg@mail.gmail.com>
Mime-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
 <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk>
 <DFVDKMMA7KPC.2DN0951H3H55Y@kernel.org>
 <CANiq72m9Nq-Wonw57Nwk480CTCmoaDk-_rTLX-dFrqh_N+eyfg@mail.gmail.com>
Message-ID: <aXOPVkAQGr0lEfml@google.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Mark Brown <broonie@kernel.org>,
 Deborah Brouwer <deborah.brouwer@collabora.com>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:dakr@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:broonie@kernel.org,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:miguelojedasandonis@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.779];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rust-lang.github.io:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C3AE37780F
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 04:01:42PM +0100, Miguel Ojeda wrote:
> On Thu, Jan 22, 2026 at 8:46=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
> >
> > If I run 1.85.0, I *instead* see the following ones from clippy:
> >
> >   CLIPPY [M] drivers/gpu/drm/tyr/tyr.o
> > warning: operator precedence can trip the unwary
> >   --> drivers/gpu/drm/tyr/gpu.rs:51:13
> >    |
> > 51 |             shader_present | u64::from(regs::GPU_SHADER_PRESENT_HI=
.read(dev, iomem)?) << 32;
> >    |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^ help: consider parenthesizing your expression: `s=
hader_present | (u64::from(regs::GPU_SHADER_PRESENT_HI.read(dev, iomem)?) <=
< 32)`
> >    |
> >    =3D help: for further information visit https://rust-lang.github.io/=
rust-clippy/master/index.html#precedence
> >    =3D note: `-W clippy::precedence` implied by `-W clippy::all`
> >    =3D help: to override `-W clippy::all` add `#[allow(clippy::preceden=
ce)]`
>=20
> I took a look at this --  Rust 1.85.0 extended the `precedence` lint
> to catch these, and then because it was too much, they split part of
> it into a new one called `precedence_bits` which is not enabled by
> default, which landed in Rust 1.86.0 (and is not in Rust 1.85.1,
> sadly).
>=20
>     https://github.com/rust-lang/rust-clippy/pull/13743
>     https://github.com/rust-lang/rust-clippy/issues/14097
>     https://github.com/rust-lang/rust-clippy/pull/14115
>=20
> I see others in the kernel have written similar expressions with
> parenthesis, e.g. for Rust in `ioctl.rs`, and I see a ton of those in
> C files too.
>=20
> Personally, I don't mind seeing the parenthesis, but I know others may
> feel like it is obvious.
>=20
> Now, seeing quite a bunch of parenthesis for this in C files, from
> kernel devs and crypto stuff and all over drivers and so on and so
> forth, means others definitely do not find it obvious or prefer to be
> explicit for extra clarity.
>=20
> So we can just clean this one up and later enable `precedence_bits`
> for newer versions. Or if we decided it is too much, then I guess I
> could allow `precedence` on Rust 1.85.0 only.
>=20
> Cc'ing others in case they want to give their opinion.

Having a lint that happens on just one random version is inconvenient,
so I think we should take at least one of these two actions:

1. Disable clippy::precedence on 1.85.0 only.
2. Enable the clippy::precedence_bits lint.

But I am ok with enabling clippy::precedence_bits.

Alice

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48D3A33662
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 04:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED01510E1AF;
	Thu, 13 Feb 2025 03:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="BWZ7KxFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163F410E1AF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 03:49:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739418578; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fbT64vxAHYqVOenrWrvSXND6bw3rDp0EXMcTJOW4r10ZOXOtwVDrbLXw6dIh13dyq2ic+xZp5mAWlYebunyhr1/d9Lu90tb73JFGzZYUmxZobh8wbHSkzbQ2D8WSwShuCf8OuBk89TJC4QenPFgsu3qeNZXr1AH73GMwvIMqcXo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739418578;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=WHYu1ZS/p9mxM+ozqemo6cP3PiAvsHAKZpgoXka46AI=; 
 b=jjwbtahT8Gdx7JKCLgxQGErqD+rckdyVpC2WOw6G0G0jfjDWpQeCcARlwmo7NWj/nKxPvqsSeClPekq2nesx2AB7QB2EKyrsatk4Mvdieid+NdLz9UBj+Xomq7nrN0wRR7e14hBGPEdlWjpTpOOfipJBujXifczHtd1GRAR8ep4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739418578; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=WHYu1ZS/p9mxM+ozqemo6cP3PiAvsHAKZpgoXka46AI=;
 b=BWZ7KxFPlgO5GbULTRCma04EoD7+75tnOegirkMZvna3Y7L5YPpONAufuMXrge58
 lhgYI9NMKUqKXgDYqkZkhd7MuISbzw/RHjh/iYPZO16XZBkJ9KYTrFzTp0TKi7rd32t
 LYcNn/bx1IHZH9EJt33APXIU2cbC4LOiTC2WpcvYXV0IbqcVZyc3bKBoqvJSs+/tKQ1
 mom5ncgtAytRKlE7AcglLfl182C7MIt6zRMUBJPJdP4V8R1VxBbXinDZ3ZBOmUr3wj3
 mlXbckpCrW1cUCuI5shoPAcGdwo6njybqw66USsKfCfE6xXMeZj0iEx+LDkkzGoj81n
 1YhNg8Eyfw==
Received: by mx.zohomail.com with SMTPS id 1739418575396322.68472183264555;
 Wed, 12 Feb 2025 19:49:35 -0800 (PST)
Message-ID: <d7d1fb8af8857e7ebfdea48213849ea9ba446477.camel@icenowy.me>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
From: Icenowy Zheng <uwu@icenowy.me>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Steven Rostedt <rostedt@goodmis.org>, 
 "Dr. Greg" <greg@enjellic.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Dave Airlie <airlied@gmail.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 phasta@kernel.org, Christoph Hellwig <hch@lst.de>,  Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>, Abdiel Janulgue
 <abdiel.janulgue@gmail.com>,  daniel.almeida@collabora.com,
 aliceryhl@google.com, robin.murphy@arm.com, 
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, Bj??rn Roy Baron <bjorn3_gh@protonmail.com>, Benno
 Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>,  airlied@redhat.com, "open list:DMA MAPPING
 HELPERS" <iommu@lists.linux.dev>,  DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Thu, 13 Feb 2025 11:49:20 +0800
In-Reply-To: <Z6nTxks3u-ErSalQ@cassiopeiae>
References: <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com>
 <Z6bdCrgGEq8Txd-s@home.goodmis.org>
 <1e8452ab-613a-4c85-adc0-0c4a293dbf50@marcan.st>
 <07c447b77bdac1f8ade1f93456f853f89d4842ee.camel@icenowy.me>
 <Z6nTxks3u-ErSalQ@cassiopeiae>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <d7d1fb8af8857e7ebfdea48213849ea9ba446477.camel@icenowy.me>+zmo_0_
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

=E5=9C=A8 2025-02-10=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 11:24 +0100=EF=BC=
=8CDanilo Krummrich=E5=86=99=E9=81=93=EF=BC=9A
> On Mon, Feb 10, 2025 at 05:41:30PM +0800, Icenowy Zheng wrote:
> > Furtherly, the monorepo nature of Linux kernel means to refactor an
> > interface, it's usually the person changing the callee that need to
> > change all callers to satify the interface change; having Rust code
> > in
> > tree calling the interface effectively means adding the
> > responsibility
> > of fixing the Rust code when the interface changes, which could be
> > not
> > acceptable by the C-only maintainers. In regards of adding a
> > maintainer, having more maintainers means more communication.
>=20
> This is exactly the same as for every new driver / component,
> regardless of
> whether it is written in C or in Rust.
>=20
> It is absolutely common that driver maintainers help with integrating
> core API
> changes, if necessary.
>=20
> I don't see why the same process should not work for Rust
> abstractions.

Because integrating API changes could involve change to contexts of API
calls, which could be difficult for Rust situation, especially when
it's not required for core API maintainers to be able to write Rust.

>=20
> (Additionally, in this particular case even one of the reviewers of
> DMA MAPPING HELPERS offered to be a reviewer of the Rust abstractions
> too, in
> order to keep eye on the DMA API angle.)

Sorry, but I did a fact check on this, and I found that the only
"reviewer" of DMA MAPPING HELPERS is Robin Murphy, he has only one
reply in this thread, and the reply only says "Indeed, FWIW it seems
like the appropriate level of abstraction to me,=20
judging by the other wrappers living in rust/kernel/ already", he
didn't offer to be a reviewer, and he still says "Rust folks are happy
to take responsibility for un-breaking the=20
Rust build if and when it happens".

He is just saying he's going to accept the abstraction, which should be
not able to forcibly override Christoph's explicit NACK here.

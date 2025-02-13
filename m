Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD20A33B9F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 10:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BDF10EA4F;
	Thu, 13 Feb 2025 09:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="jSEwOGCZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6F910EA3A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:50:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739440236; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cRWqjHO3xN30Cw8P6pNjxFBHiCsis+aZAywXAQQYz0GWTOzg1oiFFne67FvDzzHXxFXURB6pn6t9zRKK+0innD1DfTbe4wpQXyj08ECXCAZQEonjvmHTRwQmyjK43v+vQXRcp95/akdrW5jCorq02xdEyvArN9jJfyIcxciCJcg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739440236;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=aSRyyPeM6e5hQFaheTBxy/WzU6InWEh4hO0nlSkJE6o=; 
 b=aMuTrwZ2XVBEhcXDtMCdnSsVoVsZziE1u76i99bG7mvbsPT9lvzPSeDi+2QA0nqkLPa1D4GXwCaJsOUQQIH/qhQ8baPca8WdM/FXSr+tlzyVMJ884F3JxiwojjCNlk8ACNa5n/h2vtK+SaBLLZfi9EmWSSNVXH4SSd2l6iQw9dI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739440236; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=aSRyyPeM6e5hQFaheTBxy/WzU6InWEh4hO0nlSkJE6o=;
 b=jSEwOGCZw1I/yx2GrlRv6f9kQrS6mIJ7n6nMPE6VRODYffhsDVgZrLzBR3EGZKje
 o/FnCSuNxR1g0M44IR5Y5fqTl2HupozZDOx2YrZpECMrEGWoDERDy1cUpeL1i5s736a
 mktxmteFrD6x1efFzZ1jxYud5ZlOQNhbzpG9csJh5nPbdscUDKTTsCMOMkN6YvaWiZl
 wcZ7ggGLARF+nzr7N/lQUEvlQRbp8IkZYcxGlIxnEdRGcmPQT1B4KWyl5m//85XVCaT
 +BZWOHlEivDQWFWB/hfDVKGtOHu+w9eAzNoYuI/f/pd1Ab/recIDPshuoEgOPeyZMcE
 pQqQCE0HGw==
Received: by mx.zohomail.com with SMTPS id 1739440234709175.6616970322301;
 Thu, 13 Feb 2025 01:50:34 -0800 (PST)
Message-ID: <2e57e189de98a165e24bb0f65b2e0c9b17f51e40.camel@icenowy.me>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
From: Icenowy Zheng <uwu@icenowy.me>
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Danilo Krummrich
 <dakr@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Steven Rostedt <rostedt@goodmis.org>, 
 "Dr. Greg" <greg@enjellic.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Dave Airlie <airlied@gmail.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 phasta@kernel.org, Christoph Hellwig <hch@lst.de>,  Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>, daniel.almeida@collabora.com,
 aliceryhl@google.com,  robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, Bj??rn Roy Baron <bjorn3_gh@protonmail.com>, Benno
 Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, airlied@redhat.com, "open list:DMA MAPPING
 HELPERS" <iommu@lists.linux.dev>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Thu, 13 Feb 2025 17:50:20 +0800
In-Reply-To: <b0efde29-248f-43f2-97bf-ab16b55af63a@gmail.com>
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
 <d7d1fb8af8857e7ebfdea48213849ea9ba446477.camel@icenowy.me>
 <b0efde29-248f-43f2-97bf-ab16b55af63a@gmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <2e57e189de98a165e24bb0f65b2e0c9b17f51e40.camel@icenowy.me>+zmo_0_
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

=E5=9C=A8 2025-02-13=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 08:41 +0200=EF=BC=
=8CAbdiel Janulgue=E5=86=99=E9=81=93=EF=BC=9A
> Hi,
>=20
> On 13/02/2025 05:49, Icenowy Zheng wrote:
> >=20
> > Sorry, but I did a fact check on this, and I found that the only
> > "reviewer" of DMA MAPPING HELPERS is Robin Murphy, he has only one
> > reply in this thread, and the reply only says "Indeed, FWIW it
> > seems
> > like the appropriate level of abstraction to me,
> > judging by the other wrappers living in rust/kernel/ already", he
> > didn't offer to be a reviewer,=20
>=20
> Robin did offer:
>=20
> https://lore.kernel.org/rust-for-linux/4956d01e-2d06-4edd-813b-9da94b4820=
69@arm.com/

Well okay it's a further thing.


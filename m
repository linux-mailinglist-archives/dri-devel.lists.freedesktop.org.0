Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B15A3E167
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDBA10E4C9;
	Thu, 20 Feb 2025 16:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aFYoJXz7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE91410E4C9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 16:52:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3A4D76159D;
 Thu, 20 Feb 2025 16:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DDDC4CEDD;
 Thu, 20 Feb 2025 16:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740070353;
 bh=y/AlVIT3kLymBFi+Y3/Zj0WV5ydUhq8hGVLV1npStzo=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=aFYoJXz7gmhnfIFYZCXBkDEozmmsX4/STMr9zkqagwhQqgFNueICwHGUlUmiRe4fP
 uImHlgSyREV65OkNUWzX7CdT3WfxD0K6FM6KKuvpfKFwO/JbVcV0DiG0Z1gR4savqA
 RHjhwHBMMB2KHhQloC5B2ydH7+fa9hXSFwWsizvcH859Gh0ft30HGFU6WTWjOb4Tlm
 uVlYYR5/W2pXinAVedoEiIrvkAcG4N0Y949rmjKGtRZ/tNe2YuK/iOepLCYeJ588Hp
 F/3Kgqxg77/W8B/kS1rLlHMBHueo8et7psA3MrFAC7WGiH6Gnah6fwHqiMEv7Qi69e
 l7gKAJ1+91oPA==
Message-ID: <b286d05d02671cbb8622d77ed9968dc3f16ba841.camel@kernel.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@redhat.com>, 
 Theodore Ts'o	 <tytso@mit.edu>, "Dr. Greg" <greg@enjellic.com>, Linus
 Torvalds	 <torvalds@linux-foundation.org>, Hector Martin
 <marcan@marcan.st>, Dave Airlie	 <airlied@gmail.com>, Greg KH
 <gregkh@linuxfoundation.org>, phasta@kernel.org,  Christoph Hellwig	
 <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda	
 <miguel.ojeda.sandonis@gmail.com>, Abdiel Janulgue
 <abdiel.janulgue@gmail.com>, 	daniel.almeida@collabora.com,
 aliceryhl@google.com, robin.murphy@arm.com, 
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor	 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo	 <gary@garyguo.net>, Bj??rn Roy Baron <bjorn3_gh@protonmail.com>, Benno
 Lossin	 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>,
 open list	 <linux-kernel@vger.kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>,  "open list:DMA MAPPING HELPERS"	
 <iommu@lists.linux.dev>, DRI Development <dri-devel@lists.freedesktop.org>
Date: Thu, 20 Feb 2025 18:52:28 +0200
In-Reply-To: <20250220163747.GA69996@nvidia.com>
References: <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com>
 <20250208204416.GL1130956@mit.edu>
 <CAMwc25pxz2+B329BArDQMpxOvpMtvhop1u_Uwc0axn2LqNP0vA@mail.gmail.com>
 <Z7dXIfFJ2qXNKtwT@phenom.ffwll.local> <20250220163747.GA69996@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Thu, 2025-02-20 at 12:37 -0400, Jason Gunthorpe wrote:
> > =C2=A0=C2=A0=C2=A0 I think one of key advantages of open source is that=
 people
> > stick
> > =C2=A0=C2=A0=C2=A0 around for a very long time. Even when they switch j=
obs or move
> > =C2=A0=C2=A0=C2=A0 around. Maybe the usual =E2=80=9Cfor life=E2=80=9D q=
ualifier isn=E2=80=99t really a
> > great
> > =C2=A0=C2=A0=C2=A0 choice, since it sounds more like a mandatory senten=
ce than
> > something
> > =C2=A0=C2=A0=C2=A0 done by choice. What I object to is the =E2=80=9Cdic=
tator=E2=80=9D part, since
> > if your
> > =C2=A0=C2=A0=C2=A0 goal is to grow a great community and maybe reach wo=
rld
> > domination,
> > =C2=A0=C2=A0=C2=A0 then you as the maintainer need to serve that commun=
ity. And
> > not that
> > =C2=A0=C2=A0=C2=A0 the community serves you.
>=20
> +1
>=20
> I agree and try, as best I can, to embody this.

I keep four simple rules of email response list these days when
I response to LKML:

1. Be honest.
2. Address your concerns.
3. Ask for help where you need it.
4. Admit your possible misconceptions (getting things wrong is not a mistak=
e).

It's quite easy actually shift away from these even if you
don't do it purposely. So I actually just read what I'm going
to respond and reflect to these :-) It's anyhow usually best
to keep a short break and breath-in/outs before triggering
send, right?

The fourth one addresses so called "toxic positive" responses
as addresses in the associated Mastodon thread [1] :-)

> Jason

[1] https://social.kernel.org/notice/ArH99Q2ErS20vJB7Tc

BR, Jarkko

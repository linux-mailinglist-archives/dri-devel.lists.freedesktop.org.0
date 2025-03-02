Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D61AA4B413
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 19:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E24E10E099;
	Sun,  2 Mar 2025 18:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="giu50hYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D1710E099
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 18:31:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 804B9611CE;
 Sun,  2 Mar 2025 18:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DDAC4CED6;
 Sun,  2 Mar 2025 18:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740940301;
 bh=H+9GBlmiL0+MASzOfUf3x/aekpIE+MtJngbHKKTuS68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=giu50hYMzAquWhRQTt+DEWKLYK09d3blK2S4KxfrV3hPDm7/js6yPRC/uSOLa6LKu
 ncFW/g/18rGLG7ahTo05Sn6p2wCREYtxEx7CF6Zdw4qBGmRF+fw91RYR6KN+gTZUH3
 dKr9Cixl8NG971N5W594RAcWp9dtp2opo+WsNp5y4lGn5APqbJe4mjuvCxboYOWZwo
 gl1L0pUoLZ1fWjWWUDr3A74KIr+MjXObxUmuNW4ZcK89PcvJCMU/2yf8BEyan02esZ
 HTaEjqIBFj6wrw0L9jpdzMXzbykFI1lu79kJxmGAztXThb4E3wD99Zpj4Oh/2PO0cC
 0Dcuoo2XGi2WA==
Date: Sun, 2 Mar 2025 20:31:36 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>,
 Thomas =?iso-8859-1?Q?B=F6hler?= <witcher@wiredspace.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
Subject: Re: [PATCH 2/2] drm/panic: fix overindented list items in
 documentation
Message-ID: <Z8SkCA5HD2WxR_W0@kernel.org>
References: <20250301231602.917580-1-ojeda@kernel.org>
 <20250301231602.917580-2-ojeda@kernel.org>
 <CANiq72=69XAOapYBurbwsQOEaw2uamZ6ta=DT6cC-om9XK3dvA@mail.gmail.com>
 <Z8SMTiWzTDjIwGfO@kernel.org>
 <CANiq72nQNFSa0quEwLYMUVw-2CH3FwrV695k-rWfoQn5r0Mo0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nQNFSa0quEwLYMUVw-2CH3FwrV695k-rWfoQn5r0Mo0Q@mail.gmail.com>
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

On Sun, Mar 02, 2025 at 06:45:13PM +0100, Miguel Ojeda wrote:
> On Sun, Mar 2, 2025 at 5:50 PM Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >
> > (cosmetic) Nit:
> >
> > I think you could just:
> >
> > Cc: stable@vger.kernel.org # v6.12+
> 
> Thanks Jarkko -- I did something similar in the past, but sometimes
> patches got backported too much because they could be applied.
> 
> Normally they don't hurt, but I try to be more explicit nowadays so
> that the stable team can decide, and thus I copy-paste that line for
> changes that are related to new compiler cleanups and similar.

Ah, ok, I guessed that you might have some backing idea on what you put
:-) Thanks for the explanation.

> 
> Cheers,
> Miguel
> 

BR, Jarkko

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A79A4B384
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 17:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C6010E086;
	Sun,  2 Mar 2025 16:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZNeTWvmO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9192B10E0D6
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 16:50:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4D815C0527;
 Sun,  2 Mar 2025 16:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6053C4CED6;
 Sun,  2 Mar 2025 16:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740934227;
 bh=6niMakNmxQ42IQ7lLQeVf3Z8esUZUgPAraWkiGzNLgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZNeTWvmOBG+e9QTaXxEf/O2mdaTSldTRwrGlX36XLJy907Jvtf3noPrQKUs3enZ5i
 lz+e2LmqkIkEMS5tzuScZyo5gvMZmL4rx9YsvrZN6IwpjVpr/RH5YjcH5kWkDbKsan
 rd1FDkDXubsTffR1t9UEZgHKNHa2UwVNg5zloVxaivebjcawKR6m/OHrBcqZUAYLoz
 AGIuQO700jKig9ZQOGsVhf2TfRgUo29WFfqqWplrHOOt8j12vC8hiTSKUhzOg7bGoT
 9mOdzuRo5tSZ4/RgS1lEV2v4yAexdURNENLUbYvQ8hVvSi424wMmGlG9aBae1oPqKE
 T9SR+w+rNV3ig==
Date: Sun, 2 Mar 2025 18:50:22 +0200
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
Message-ID: <Z8SMTiWzTDjIwGfO@kernel.org>
References: <20250301231602.917580-1-ojeda@kernel.org>
 <20250301231602.917580-2-ojeda@kernel.org>
 <CANiq72=69XAOapYBurbwsQOEaw2uamZ6ta=DT6cC-om9XK3dvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=69XAOapYBurbwsQOEaw2uamZ6ta=DT6cC-om9XK3dvA@mail.gmail.com>
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

On Sun, Mar 02, 2025 at 07:54:00AM +0100, Miguel Ojeda wrote:
> On Sun, Mar 2, 2025 at 12:17 AM Miguel Ojeda <ojeda@kernel.org> wrote:
> >
> > Starting with the upcoming Rust 1.86.0 (to be released 2025-04-03),
> > Clippy warns:
> >
> >     error: doc list item overindented
> >        --> drivers/gpu/drm/drm_panic_qr.rs:914:5
> >         |
> >     914 | ///    will be encoded as binary segment, otherwise it will be encoded
> >         |     ^^^ help: try using `  ` (2 spaces)
> >         |
> >         = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#doc_overindented_list_items
> >
> > The overindentation is slightly hard to notice, since all the items
> > start with a backquote that makes it look OK, but it is there.
> >
> > Thus fix it.
> >
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
> Cc: stable@vger.kernel.org # Needed in 6.12.y and 6.13.y only (Rust is
> pinned in older LTSs).

(cosmetic) Nit:

I think you could just:

Cc: stable@vger.kernel.org # v6.12+

> 
> Cheers,
> Miguel
> 

BR, Jarkko

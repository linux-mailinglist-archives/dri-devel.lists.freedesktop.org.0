Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC8DC20C68
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0D710E9CF;
	Thu, 30 Oct 2025 14:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NZ/8uG9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEA810E9CF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 14:57:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A82B943898;
 Thu, 30 Oct 2025 14:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D33C4CEF8;
 Thu, 30 Oct 2025 14:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761836268;
 bh=MPH444EZaU6hB0oe8fwJQJCQuWbHbzn+g5+EsUVpY/8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NZ/8uG9sgSxgb3j2CP8YltLWsQB47scQpxGKcbR+MrBAvSTgaYZddAH9NvQVGxgCw
 jMpUMahh2MOfXnnLoIWYFzo/z5SUQWH6OtWirV1MskoUFnhA0Lw3LEVhTLAJ4ge2sB
 EaW7Xt7Ts72Nt2tAEOjVuHrEoE4oiAUc53DYyXuydo3/t8rkO7kS4zaierKba829eG
 lTVRQZtleWTO1rimqLOyp5tt4yk56zMv3caXQ/wkevBe5n0RkWPmE2h5jGuWpQ60AL
 gx4egPU999DB+RUobTImD6plP3mbmCWsKA1FWaCseeITaGgey0cf7mVcCxCSzZaRaR
 zCQ0turLOoXvg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Oliver Mangold <oliver.mangold@pm.me>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Benno
 Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman
 <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, Leon
 Romanovsky <leon@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Viresh Kumar
 <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd
 <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Asahi Lina
 <lina+kernel@asahilina.net>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, Oliver Mangold
 <oliver.mangold@pm.me>
Subject: Re: [PATCH v12 2/4] `AlwaysRefCounted` is renamed to `RefCounted`.
In-Reply-To: <20251001-unique-ref-v12-2-fa5c31f0c0c4@pm.me>
References: <20251001-unique-ref-v12-0-fa5c31f0c0c4@pm.me>
 <20251001-unique-ref-v12-2-fa5c31f0c0c4@pm.me>
Date: Thu, 30 Oct 2025 15:57:35 +0100
Message-ID: <87sef08mjk.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
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

Oliver Mangold <oliver.mangold@pm.me> writes:

> `AlwaysRefCounted` will become a marker trait to indicate that it is
> allowed to obtain an `ARef<T>` from a `&T`, which cannot be allowed for
> types which are also Ownable.
>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>

Please update the title to

 rust: rename `AlwaysRefCounted` to `RefCounted`

No period in the summary line.

With that, you can add my review tag.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Since this patch touches so many moving parts of the rust tree, it is
going to be a cat and mouse game regarding rebasing this thing. It also
touches a lot if peoples code. I am not sure how something like this
would merge. Do we need ACK from everyone @Miguel?

Best regards,
Andreas Hindborg




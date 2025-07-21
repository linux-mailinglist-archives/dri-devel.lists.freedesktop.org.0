Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE428B0C7AC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 17:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF0B10E56D;
	Mon, 21 Jul 2025 15:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FKLmbz+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6D510E56D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:33:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 88D0D5C5E03;
 Mon, 21 Jul 2025 15:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596E8C4CEED;
 Mon, 21 Jul 2025 15:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753112035;
 bh=hyyuyfbxHodKvSyqExb7ImrgCIZwTFL9rTdX6poyFrA=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=FKLmbz+CxSiNML7F+p65oJIHLjvl95Pv/hVEblsYZTTWlg6gn+oXGNJIX02LFyhNp
 dCdS718g72JP2jUZgODe+lsRafSHI8B1NVsB/c+RkJhy78hxeiwLkUZMb41Uksd/jQ
 5q6ZrH7iMt0d1l+wQzZBq9JoyE5TqH6cru4LgW2R2OZLRSzM95tonuefJNuY3N/ElU
 aCT0x45l7ucQzuuFb/++Py7R21I6ckm84W/+wl3v5oHefDsQ1a8hErT1TL7nXd8c0b
 1yH54Yn0rmRQ4fZGAyBU03ZovYUIPFViunpxP8ao3gwRYPJFwj24Z7eBR1asyjActb
 +fjS6Sh+P5zoA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 17:33:50 +0200
Message-Id: <DBHUCKLO3YG6.3MFXYIE4XZMN1@kernel.org>
Subject: Re: [PATCH v5] rust: drm: Drop the use of Opaque for ioctl arguments
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <aliceryhl@google.com>,
 <daniel.almeida@collabora.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <alyssa@rosenzweig.io>, <lyude@redhat.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Beata Michalska" <beata.michalska@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250626162313.2755584-1-beata.michalska@arm.com>
In-Reply-To: <20250626162313.2755584-1-beata.michalska@arm.com>
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

On Thu Jun 26, 2025 at 6:23 PM CEST, Beata Michalska wrote:
> With the Opaque<T>, the expectations are that Rust should not
> make any assumptions on the layout or invariants of the wrapped
> C types. That runs rather counter to ioctl arguments, which must
> adhere to certain data-layout constraints. By using Opaque<T>,
> ioctl handlers are forced to use unsafe code where none is actually
> needed. This adds needless complexity and maintenance overhead,
> brining no safety benefits.
> Drop the use of Opaque for ioctl arguments as that is not the best
> fit here.
>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

The patch does not apply on top of drm-misc-next and does not have a base
revision.

Can you please let me know which commit this patch applies on top of or res=
end?

- Danilo

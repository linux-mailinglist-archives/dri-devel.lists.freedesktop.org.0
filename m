Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40BEB0C852
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 17:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD45B10E26C;
	Mon, 21 Jul 2025 15:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EACw0aRG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E1510E26C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:58:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C2D4AA55CF7;
 Mon, 21 Jul 2025 15:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98093C4CEED;
 Mon, 21 Jul 2025 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753113515;
 bh=qbo+xEJPaR932zCk7aWILg7Tb2UFnLbvc0NVwxP6vLg=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=EACw0aRGC0BeyYgwfKl6NrQGRv8HDvPV0+6fMUTOGk4tc7h9UW5ZhDnA5RRDQQ+Qv
 maBolzLwqQxqv4t8LWKXspIHyVKmll/TmDSd9IeOZjmeNhmqGjupcLrVfrcSIRNySP
 pNZReBNAbgPD1osPYRIXH2dGgonn/18ow/1j2AVymINyBxbxG+sQmePA2YOzuHo3uw
 nTpZ85A+WK5ySMz8bZ+XN7fTOyQsl4KaJRa2PqrutXPeQ1yLO+qmVWn4KO2th85ALe
 0Hk4TkBWBlWX5l0ofSQ95eQrvnKGIbnLcj1J6Ps9yKMa3/VgnCik/MfBq1tSzVcmbx
 4RH56viDlZkTQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 17:58:30 +0200
Message-Id: <DBHUVGOM4AN2.6JKUWB03D5DJ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5] rust: drm: Drop the use of Opaque for ioctl arguments
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <aliceryhl@google.com>,
 <daniel.almeida@collabora.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <alyssa@rosenzweig.io>, <lyude@redhat.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Beata Michalska" <beata.michalska@arm.com>
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

Applied to drm-misc-next, thanks!

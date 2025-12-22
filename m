Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35E8CD6BFA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 18:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC0810E07B;
	Mon, 22 Dec 2025 17:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F6xmozyS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF59010E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 17:03:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F2C4C6014C;
 Mon, 22 Dec 2025 17:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0373DC4CEF1;
 Mon, 22 Dec 2025 17:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766422994;
 bh=tH4Nnl/oDlWWOeWn9ajIyRHG8aXXOcTM2+Wkimr9lTk=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=F6xmozySx2DQMXHYJx7FgT0KkMkOcfp7m8x6HYQsNEKVXIlhelEMiaLDLqDZfOmD2
 agDpQb9nx8OZ8oeaIYc08tgHD8LJfMtRPJNmXKsrffhQ7ZxLnBK++FLNeQ+YgZ38WM
 al+uDED8Y3JvWzjaf2Q3ZNKr7z/SPfpfPA6pdFR7beB+CE4qSO0jV5gxJoubi94CEa
 ZSG4GOZhiMa0vr6IAs4RE+8s/FoJZ0zOqd2dOfmYyHkbAJBuFYy0+JX5qbPyXPIIUp
 i7X0HaftE3gno/kaJyj3PcOzc02df6BI5dNuUKXNtKdKMyaLp2W1IbopfHZAAH+E1X
 dg+k0rdp9RvJg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 18:03:08 +0100
Message-Id: <DF4WOUGU3RJC.1XHFZM27Y3C1R@kernel.org>
Subject: Re: [PATCH] rust: drm: replace `kernel::c_str!` with C-Strings
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Tamir Duberstein" <tamird@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251222-cstr-tyr-v1-1-d88ff1a54ae9@gmail.com>
In-Reply-To: <20251222-cstr-tyr-v1-1-d88ff1a54ae9@gmail.com>
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

On Mon Dec 22, 2025 at 1:27 PM CET, Tamir Duberstein wrote:
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to drm-rust-next, thanks!

    [ Change commit subject prefix to 'drm: tyr:'. - Danilo ]

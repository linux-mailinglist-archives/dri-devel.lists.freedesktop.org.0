Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0DEAF9F59
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 11:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394D610E1BF;
	Sat,  5 Jul 2025 09:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZS9aTiEu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28C010E209;
 Sat,  5 Jul 2025 09:23:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A98125C4964;
 Sat,  5 Jul 2025 09:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DDD1C4CEE7;
 Sat,  5 Jul 2025 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751707438;
 bh=BgGICVAG3ufzyD8EANR6r892lXXUNui3d8R5OQencmU=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=ZS9aTiEucOKW5yPsPtD1gjQDbHT88+6an4F4oCrjx99JSv6bCia0h6Xjm91nZMUFj
 nmzNTuLPhAKEqwDKhwyuLsCjB+5/ze8q1gYN+3bF7wjL08B9aFGUuY/zFus3o+X1ku
 zVEklmoRntvsvmhunellnN5YuEVati9qGT+eqyx4/FU/Rat0ZXCQl+aJ5ohGJTBDVf
 enA5hk2Mtv5SAA8jlBySwuFL9R+hwJqxnrvzwVlUN0j3Kp6OC9Brtfr8SfBkOVx5P8
 c+cHJ1HyoF87IKnLFcwNotT+80S85I/03H3gdkqW4naX3QGFXLg2CGGMs1I3M9/Hhz
 AUzmaGvlxNdcQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Jul 2025 11:23:52 +0200
Message-Id: <DB40GLDJNB8Y.2HP3DHHVU0Z8Q@kernel.org>
Cc: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/6] rust: use `kernel::{fmt,prelude::fmt!}`
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Nishanth Menon" <nm@ti.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
 <20250704-core-cstr-prepare-v1-3-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-3-a91524037783@gmail.com>
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

On Fri Jul 4, 2025 at 10:14 PM CEST, Tamir Duberstein wrote:
> Reduce coupling to implementation details of the formatting machinery by
> avoiding direct use for `core`'s formatting traits and macros.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/error.rs            | 6 +++---
>  rust/kernel/print.rs            | 6 +++---
>  rust/kernel/str.rs              | 2 +-
>  samples/rust/rust_print_main.rs | 2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)

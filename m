Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31ABF06B3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 12:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376FE10E3C8;
	Mon, 20 Oct 2025 10:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bWTQj9Hu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0ED10E3C8;
 Mon, 20 Oct 2025 10:07:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 40C0C61D97;
 Mon, 20 Oct 2025 10:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B68C4CEF9;
 Mon, 20 Oct 2025 10:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760954869;
 bh=0M7psceSKNec+BNMfLQd3dOi35kp0PFPiLzND396b0c=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=bWTQj9Huar+h/bXT8YwORnYlSdYowu0LZCXGtiX9QGAK9oR0xV4XoUw/SzQ/PMOBy
 Z8fxL/cWMhvs5YC87okar1saPvO/0Q2ABk8pYCJsk1xEMnE13ZxGHfOeMIQGtRYpUO
 1pQqeq/4jyZsTqWpnYZIYBPLwVUGS1WVajUS4jRBcTN/7XqfiUEf/TC87BwXtIVKhm
 ei6O6AdN8C9biKuJ9A3bb6wSgX3eJBB9lE9ITo0qdQsVlYXy4vyA+XxAhi3QRKroCL
 n6BrOLAmsvCetS8unVKIjnh4plrEHEp4gl9T1b5IQ0RGRNUQibnPXzhek2vftL7SkJ
 c9rfVWEPYcB9g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 12:07:44 +0200
Message-Id: <DDN2EGMDUX8W.19VJKCEIPAMXI@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: replace wait_on with kernel equivalents
Cc: "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251020-nova_wait_on-v1-1-2eb87fb38d14@nvidia.com>
In-Reply-To: <20251020-nova_wait_on-v1-1-2eb87fb38d14@nvidia.com>
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

On Mon Oct 20, 2025 at 8:09 AM CEST, Alexandre Courbot wrote:
> wait_on was a temporary helper function waiting for a kernel crate
> equivalent.
>
> Now that read_poll_timeout and fsleep are available, use them and remove
> wait_on.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

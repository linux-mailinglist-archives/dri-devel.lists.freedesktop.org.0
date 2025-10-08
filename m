Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45E4BC44BD
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 12:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB84810E0D2;
	Wed,  8 Oct 2025 10:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mS8v4XQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D604A10E0D2;
 Wed,  8 Oct 2025 10:23:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B4F4C61F49;
 Wed,  8 Oct 2025 10:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29291C4CEF4;
 Wed,  8 Oct 2025 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759919027;
 bh=pgyDd5U4lx90hBvX9nM6Mbf+EYCdvQf0+HPHy40vgt8=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=mS8v4XQiuMI+8/hdm6D67HTsv1lFRpRqd/9dRgiHCxvNhfGJGffAnfXAyBU3f1KF4
 B+UnqCXC9/h9TkG8O9cV6GDttVb0OzlwKlnXZ2oyTsxn62YX++8u0zrsFjvSL/9fNC
 yLK8DnXfSEnCCg4ZPFT/WChXNGS+7N0Z+DeUrhF6Ap+7DkD1GUibu7rNr3FAh0cp4F
 ywYU+xVIL85CcLiofN7oZKB2g4vpo0hyWk6foZJygmi0aymK1mmahHFQJ5ieY2dVfS
 1n/MiYDhJfv4gmQ2s5L5F3AmGTToHgoSPiSaP4FBDtEStM8KSqboEWwyobwR4Zr7Pf
 NdWDLDJHhQylA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Oct 2025 12:23:40 +0200
Message-Id: <DDCV84IJHUML.126CB1CT0XMX5@kernel.org>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Alistair Popple" <apopple@nvidia.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Andrea Righi" <arighi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <695CCDCE-A205-4557-AA15-6F102B8CCF0C@nvidia.com>
In-Reply-To: <695CCDCE-A205-4557-AA15-6F102B8CCF0C@nvidia.com>
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

On Wed Oct 8, 2025 at 1:37 AM CEST, Joel Fernandes wrote:
> The Nvidia GPU architecture is little-endian (including MMU structures in=
 VRAM).

Yes, I'm aware (and I'd assume that there is no reason to ever change that)=
.

Just for the complete picture, there's also some endianness switch in the
NV_PMC_BOOT_1 register I think?

> All the CPU architectures our drivers support are expected to be little-e=
ndian.

Technically, all Rust supported architectures are indeed little-endian.

However, the only constraint for the Nova project as by now is 64-bit only.

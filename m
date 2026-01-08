Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91273D0175F
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 08:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81F410E2B4;
	Thu,  8 Jan 2026 07:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OlN06fkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60CB10E2B4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 07:53:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7BE906000A;
 Thu,  8 Jan 2026 07:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA84C116C6;
 Thu,  8 Jan 2026 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767858807;
 bh=nDXnKNmAJw0ktNPTmlWu+Kn+sJ7O1F/SsAeUoE2v82g=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=OlN06fkJI0hxv93SXzC+CYpIP/kFOQcISMk2RWljUBx/d0ktBFoLB7U2Ba2WHU3AT
 7xbOdIou+i8HnYwGPBLJxcKDDQfqyCK6jNuXRtrQTvVV8o6tlNvxCKEbX1Zsvk2w4e
 t0BlUPrRHZSGiIH/xFeq1I7tWleZ01Vbtz3Q/L51bmRbIfR5p2Mj+D2yFFzQeH589f
 cBNIM5g/4pyh2Yzbuy7yVwPQwRiXUm8RA9UipWoy8T+6vOC2i1D9qEaigqw5pqPsZ8
 O/cQsxG/rnZKhGOtG45dyrVXFNITrxin/pU4T1VDYCulX2npFOb4zizxLsgkNFWXzt
 bV6gZ5IN8YoEw==
Message-ID: <8bc73ccedec95c7054fb6e38e72d865a@kernel.org>
Date: Thu, 08 Jan 2026 07:53:22 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Subject: Re: [PATCH v3 3/3] rust: clk: use 'kernel vertical style' for imports
In-Reply-To: <20260107-clk-type-state-v3-3-77d3e3ee59c2@collabora.com>
References: <20260107-clk-type-state-v3-3-77d3e3ee59c2@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 rust-for-linux@vger.kernel.org, "Alice
 Ryhl" <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Drew Fustini" <fustini@kernel.org>,
 "Fu Wei" <wefu@redhat.com>, "Gary
 Guo" <gary@garyguo.net>, "Guo Ren" <guoren@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Miguel Ojeda" <ojeda@kernel.org>,
 "\"\\\"\\\\\\\"\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"Rafael
 J.
 Wysocki\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\"\\\\\\\"\\\"\""
 <rafael@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Stephen Boyd" <sboyd@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Trevor Gross" <tmgross@umich.edu>,
 =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWc=?= <ukleinek@kernel.org>,
 "Viresh Kumar" <viresh.kumar@linaro.org>
Content-Transfer-Encoding: quoted-printable
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

On Wed, 7 Jan 2026 12:09:54 -0300, Daniel Almeida wrote:
> Convert all imports to use the new import style. This will make it easier
> to land new changes in the future.
>=20
> No change of functionality implied.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E5CB59A95
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 16:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5527310E396;
	Tue, 16 Sep 2025 14:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mh/pih+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3759C10E396;
 Tue, 16 Sep 2025 14:43:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B4277434F9;
 Tue, 16 Sep 2025 14:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B099C4CEF0;
 Tue, 16 Sep 2025 14:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758033784;
 bh=27ySvtd3dUO78XvzUBYQ1gA9ElOvc66NxkQRlwyPYfI=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Mh/pih+ELUPiwHaVc/5+/no3vUj4N50DWncI5OZDjVYTLqf2vB9gb/8jeQdD6BR1U
 MiU83MiTC5eUHidRAe3IUhqZ+padDI8Zn3xfbCpHUm40Hshnr+ZUaGJnW1qgnSeyvj
 fEfjhayffU9+phEOFpwcE/cSRlhR/s0rZ8W7PURxJnK6wugMZvXfdQOAzIf5Q/EPbe
 gouCIumTkECRbygED4AJmR0FV6B7ASA58hoCmm+wKouYnz1SxzoMUCDu8WZNrij4W4
 GZa8g2OgbybCELuCicywK4vnYw0sLYzLR6NpvtuaziHIby1/ICMdvXGOraHrEBQIRr
 /TH7xsoHTeKNw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 16:42:56 +0200
Message-Id: <DCUAYNNP97QI.1VOX5XUS9KP7K@kernel.org>
Subject: Re: [PATCH v6 10/11] gpu: nova-core: Add base files for r570.144
 firmware bindings
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
 <20250913-nova_firmware-v6-10-9007079548b0@nvidia.com>
In-Reply-To: <20250913-nova_firmware-v6-10-9007079548b0@nvidia.com>
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

Two comments on this, just for the record.

On Sat Sep 13, 2025 at 4:12 PM CEST, Alexandre Courbot wrote:
> From: Alistair Popple <apopple@nvidia.com>
>
> Interacting with the GSP currently requires using definitions from C
> header files. Rust definitions for the types needed for Nova core will
> be generated using the Rust bindgen tool. This patch adds the base
> module to allow inclusion of the generated bindings. The generated
> bindings themselves are added by subsequent patches when they are first
> used.

For now this is perfectly fine, but in the long term we should avoid creati=
ng
bindings from C headers. Instead, I'd like to see the tooling that generate=
s the
C headers to generate the Rust data structures (in a more Rust idiomatic wa=
y)
right away.

> Currently we only intend to support a single firmware version, 570.144,
> with these bindings. Longer term we intend to move to a more stable GSP
> interface that isn't tied to specific firmware versions.

Yet, we have to prepare for proper abstraction of the firmware API:

(1) This is a community project. And as a community project it has to be
    written in a way that is guaranteed to remain maintainable for the
    community in any case.

    This means that the project can not rely on the hardware vendor to prov=
ide
    a stable firmware API; rather it has to written in a way that can deal =
with
    changing conditions.

    In fact, this is one of the issues why we don't see a way forward with
    nouveau, so we can't lock ourselves in here. :)

(2) While I think attempting to be as stable as possible with the firmware =
API
    is the correct approach, I also think it is better to reserve yourself =
some
    flexibility on changing it.

    I much rather prefer a firmware API that is evolving when really necess=
ary,
    than squeezing new features into an existing API (e.g. by adding confus=
ing
    extentions) that just isn't a good fit anymore at some point.

> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> [acourbot@nvidia.com: adapt the bindings module comment a bit]
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

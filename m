Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB97BC92A8
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 15:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E2710EA33;
	Thu,  9 Oct 2025 13:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U66bVbG+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAD910EA33;
 Thu,  9 Oct 2025 13:02:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BDB66622E1;
 Thu,  9 Oct 2025 13:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B61CC4CEF5;
 Thu,  9 Oct 2025 13:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760014966;
 bh=PuBhH69ek7xCWvm0d6VlgDo84TLqDlLMyWF4mF3IQws=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=U66bVbG+u9ZGnv56xEL2UQJ9Tl/4GNHCEj+Mqn80qMl6u9YpHbHHwbLkJqIiiPnEk
 lgex3EvWzBOUt2UBiZ+zZTgSvL3x6OFmKMs/BLkJ+lQ2uCfye6y1ks+CoM1fc0PZsy
 7CSCR2AKg6/RSufXN1Id4LxgRJ8quweikpk2FFbqYnrIVpM7+kAQzzaA5r9dmEkAfo
 Av3xe7vwtYVfUWcvGcmwcaMTqMQUWeJoWUe8EpPIU8eF+eYW0gK9cy3v0XiiQkdECY
 vscTpXwzqBp3P1M7QC/W830ChoVgOg536Rsq4B9iJ2gSGwLt2mKm81pdNZSXYm3PFn
 VPxBVMjj0sS6A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 15:02:39 +0200
Message-Id: <DDDT8EEG7E8B.27YT6QAFIS9GK@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
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
References: <695CCDCE-A205-4557-AA15-6F102B8CCF0C@nvidia.com>
 <DDCV84IJHUML.126CB1CT0XMX5@kernel.org>
 <22e8c33c-b444-4f58-b7ec-6374475e05be@nvidia.com>
In-Reply-To: <22e8c33c-b444-4f58-b7ec-6374475e05be@nvidia.com>
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

On Thu Oct 9, 2025 at 2:24 AM CEST, Joel Fernandes wrote:
> On 10/8/2025 6:23 AM, Danilo Krummrich wrote:
>> On Wed Oct 8, 2025 at 1:37 AM CEST, Joel Fernandes wrote:
>>> The Nvidia GPU architecture is little-endian (including MMU structures =
in VRAM).
>>=20
>> Yes, I'm aware (and I'd assume that there is no reason to ever change th=
at).
>>=20
>> Just for the complete picture, there's also some endianness switch in th=
e
>> NV_PMC_BOOT_1 register I think?
>
> You are referring to old GPUs. NV_PMC_BOOT_1 does not have endianness swi=
tch for
> Turing and later.

Ok, then there's no point in considering big-endian CPUs.

> If we want to add a Kconfig patch enabling Nova only on x86/ARM, that'll =
be Ok
> with me.

I don't see why we'd constrain it to x86 and ARM, but we should indeed cons=
train
it to little-endian architectures.

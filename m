Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03300BC1751
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 15:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3067410E193;
	Tue,  7 Oct 2025 13:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DhEl/zG+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A9B10E19D;
 Tue,  7 Oct 2025 13:16:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9932C6147E;
 Tue,  7 Oct 2025 13:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB19C4CEF1;
 Tue,  7 Oct 2025 13:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759843003;
 bh=6UjzVlz1EtzKDtCcbFvNlSfCTmDJhScI63/zH3jvfVA=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=DhEl/zG+D7xFgqiPWQVAdl3fHwTnoe02BBj4mm/Hut3L3AvLtiropA6iQKNKR9ihj
 PrDT+saQAFcMRAX90RlVlIsHlT5aSWD0Jun9zUaMYd1q0lm11iY0q4xTAH5bxq4BzW
 Imdfn0O0PVR1fezkl+US2ZbE2qKJrPd/JvACcmAJ1AWQ/bYAqYbptM3BiMKz9A/Pjz
 PJJVjtZ2YgwVK6RnK+i2UHpCyuoGHIuHRXM+fGJdFvf5pO/XqgZPh524KbGltDXMkm
 CsvbFYPZOYFlGn0tc6e7yh9a/XT4R/XE4NsqkLutt3X0cyrbsD5Uz8knxfBlMfKmMZ
 5QT6K/RWDIkbw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 15:16:36 +0200
Message-Id: <DDC49ZIRX79X.2Q4KW0UY7WUF3@kernel.org>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Alistair Popple" <apopple@nvidia.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, <nouveau@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
In-Reply-To: <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
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

On Tue Oct 7, 2025 at 12:36 PM CEST, Alexandre Courbot wrote:
> Because letting it fully mature within nova-core also has the drawback
> that we might miss the perspective of other potential users, which may
> make us draw ourselves into a corner that will make the macro less
> useful generally speaking. We are at a stage where we can still make
> design changes if needed, but we need to hear from other users, and
> these won't come as long as the macro is in nova-core.

There are two different things here that are getting mixed up a bit.

  (1) Moving the register!() code out of nova-core to make it accessible fo=
r
      other drivers.

  (2) Generalize the bitfield implementation that so far is baked into the
      register!() code.

Both of those make sense, but they don't have to happen at the same time
necessarily.

Now, I'm not saying that we necessarily have to change the approach here. T=
he
current merge window isn't even closed, so we have plently of time left, i.=
e.
there's no rush with with patch series.

However, if it helps, I'm perfectly fine to take the register!() implementa=
tion
into the I/O entry in a first step and in a second step generalize the bitf=
ield
implementation and move it out of the register!() code.

Again, there's no rush as far as I'm concerned, yet the latter approach mig=
ht
add a bit more structure and hence run a bit smoother.

- Danilo

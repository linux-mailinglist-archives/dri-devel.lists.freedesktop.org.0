Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B377EB0B8E4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 00:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333EE10E054;
	Sun, 20 Jul 2025 22:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aCC6EGbt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C7E10E054;
 Sun, 20 Jul 2025 22:37:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 36278A4E0D0;
 Sun, 20 Jul 2025 22:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64BCC4CEE7;
 Sun, 20 Jul 2025 22:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753051054;
 bh=kdUw/pZMaU0Ir4P1orWl8JNS6xpN1Y3f1hcA0PcAv5o=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=aCC6EGbt783gh3Ztm0yFdCp6NSvd5ya72MZ2dbBq/7HauFmIu2yZ5IwkeUBmbyBfL
 SxN0FcNk+U3B4aEE5efAFFXdE+ia2+oFY2My1f8oOAhkrx5qSLaxbNl1EBz/iADoOt
 KsnOHptvYVt3TRmODE+w133jbsQmvVFqrRl/ZZ2KYvjmxVP7Q2g4yd4Zk0O84BMsb6
 0ELvo/ZXACZNNla4GRFHdLdifbk8L1sMAJYajKi6TQFQo3uj16VLY+DUF0RWW8JlLY
 NirS+fB23fTSf1tyMIv2lQDlTQDP2TXe3QbruOTQjFQ+RpQ4ilKOXiH3Y8kZQCnnjZ
 yBTec5gu9/Xqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 00:37:28 +0200
Message-Id: <DBH8QE1NZVB4.2VJDAL24XIHG4@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/6] rust: kernel: remove `fmt!`, fix
 clippy::uninlined-format-args
Cc: "Tamir Duberstein" <tamird@gmail.com>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Nishanth
 Menon" <nm@ti.com>, "Stephen Boyd" <sboyd@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
 <20250704-core-cstr-prepare-v1-1-a91524037783@gmail.com>
 <CANiq72mjiBK+DE-NOx1p+wWuZpnK=aPtgnMUUEzig+4jHZzemA@mail.gmail.com>
In-Reply-To: <CANiq72mjiBK+DE-NOx1p+wWuZpnK=aPtgnMUUEzig+4jHZzemA@mail.gmail.com>
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

On Sun Jul 20, 2025 at 11:24 PM CEST, Miguel Ojeda wrote:
> On Fri, Jul 4, 2025 at 10:16=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
>>
>>  drivers/cpufreq/rcpufreq_dt.rs    |  3 +--
>>  drivers/gpu/nova-core/firmware.rs |  5 +++--
>>  rust/kernel/opp.rs                |  2 +-
>
> Danilo, Viresh: I assume you are OK with this, but let me know
> otherwise, thanks!

Sure, feel free to add

Acked-by: Danilo Krummrich <dakr@kernel.org>

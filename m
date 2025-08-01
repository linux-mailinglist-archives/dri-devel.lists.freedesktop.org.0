Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88ABB17FAA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 11:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDBF10E3DB;
	Fri,  1 Aug 2025 09:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r4Mxx2yk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1D410E3DB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 09:52:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 559BCA55796;
 Fri,  1 Aug 2025 09:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253ECC4CEE7;
 Fri,  1 Aug 2025 09:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754041971;
 bh=XWVfJARE29L6S8L6M85DEoeDJhaQJ3KW7VCi1swPty4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r4Mxx2ykiiEkKOFURdp0PlixlkEvQxTrQgVUXrvhUEVPRzDMUMaU9F9sycyJ8zQQt
 yOfMbkqws/fTDUC/1EY+A/NrHiE4BYTa5c9PW931U2kisyu2oV/6fF3pulWVjX6sh9
 dWCBneHfldpyTP7gAEbbFOgiTYVOvnieelMPZfx5pO5qdbzpCTwIXrZoHRyWSdpQZ4
 xY7qoOHZKL5jWShRgvq8pZGgNrpfhuGa1E7W2w46Bme4lgRJ9KmHkbn4V7zGCg7v1J
 mduy6bptGG9AQy+oCOesoWIXx8Yo85pEU8zZizvX84lz+Ph1OpfNWTBG1paOiepcBl
 IrOIvdDU0JPXQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 11:52:46 +0200
Message-Id: <DBQZZFBPENW5.1S84EVRD3DDH0@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>
Cc: <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] rust: drm: remove pin annotations from drm::Device
X-Mailer: aerc 0.20.1
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-4-dakr@kernel.org>
In-Reply-To: <20250731154919.4132-4-dakr@kernel.org>
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

On Thu Jul 31, 2025 at 5:48 PM CEST, Danilo Krummrich wrote:
> The #[pin_data] and #[pin] annotations are not necessary for
> drm::Device, since we don't use any pin-init macros, but only
> __pinned_init() on the impl PinInit<T::Data, Error> argument of
> drm::Device::new().
>
> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/drm/device.rs | 2 --
>  1 file changed, 2 deletions(-)

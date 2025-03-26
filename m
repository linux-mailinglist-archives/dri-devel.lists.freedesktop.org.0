Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5D5A71362
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 10:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610D610E684;
	Wed, 26 Mar 2025 09:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EkXuG9bY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBAC10E685
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 09:12:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C2459A40E49;
 Wed, 26 Mar 2025 09:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2343C4CEE2;
 Wed, 26 Mar 2025 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742980325;
 bh=Iiecn4yi6aAWiL3bXi2wBDDnJZawsPTL/Ynk29ROg+8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=EkXuG9bYYyR1bE+lhTm2EBEUniJ35vxS3V2bI4gP2PyBA3DKd8UTUXxCVkvCtRWQV
 FE5r2Quk8AsBatLS8nHs3Dj0psIxc4j6nvVGyxSb48G+WfxiNO1R6UDagHWoZkUpMf
 ex7lmNT6iBhRTJ0a5hXm1kdTEh6Tq3ECfpxAINstJDqp/trb1eLH3VKsx8UbdAZ/42
 HFDmjRMoiZhIBIkxR8IuxCqcmJ+4MIVX0xZ/+yf8QSmfpp6om/t9nh1Ei75dr1gc1h
 Cs6jh5odkS8RMonSo0dNL0rU29u+czGJ+TeqhC7NWnceZlaBJQT48a3cg95uMvJQdL
 tx+5pkxTZY4EQ==
Message-ID: <708aa17798df41f8a6b206eb48212217@kernel.org>
Date: Wed, 26 Mar 2025 09:12:02 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 4/8] rust: drm: add device abstraction
In-Reply-To: <20250325235522.3992-5-dakr@kernel.org>
References: <20250325235522.3992-5-dakr@kernel.org>
Cc: a.hindborg@kernel.org, acurrid@nvidia.com, airlied@gmail.com,
 alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, daniel.almeida@collabora.com,
 dri-devel@lists.freedesktop.org, gary@garyguo.net, j@jannau.net,
 lina@asahilina.net, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org,
 simona@ffwll.ch, tmgross@umich.edu, tzimmermann@suse.de, "Maxime
 Ripard" <mripard@kernel.org>
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

On Wed, 26 Mar 2025 00:54:31 +0100, Danilo Krummrich wrote:
> Implement the abstraction for a `struct drm_device`.
>=20
> A `drm::device::Device` creates a static const `struct drm_driver` filled
> with the data from the `drm::drv::Driver` trait implementation of the
> actual driver creating the `drm::device::Device`.
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

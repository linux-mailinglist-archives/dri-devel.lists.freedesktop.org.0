Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E64A74CF6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 15:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4052B10EA40;
	Fri, 28 Mar 2025 14:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uNve0Z0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F1C10EA40
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 14:42:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B2B8F614C9;
 Fri, 28 Mar 2025 14:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8EBC4CEE4;
 Fri, 28 Mar 2025 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743172944;
 bh=+zPTZBmyIEAoaSW++4iG9w8dxUKOISHbMHDdQn6vQpE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=uNve0Z0OC8fr2iOSBZeNLlyXVaJ+/OlT7lmoLw4dMUE0hPCAwvc3svkM8QiA0KF+r
 20kkHT8Xt/wHdUcq2MOFx1lMUNzKnSCrdBjz/qJJpn8t0OOl16A8rHEuWqdb3K/ZOi
 QBRCxH5PebTopMSvTYShH06l/XUoJBLMLeYfnq8GHS3SKVs9I/gIA7XBHJey5KNJ9s
 2CJnrepU00pI6AtL3Pkn3SajQmZwfXnlM7Dd5K8TJhEPwrz1nGhzn6q3wdqNMdKC9L
 a7MjioMqaUA7erSFeloHkoaHE8u+cg4UOHPs8YWAhU+KPip2TZHxmpfGD2GlN0sHVl
 Z8RPEPP737CSg==
Message-ID: <f3f8c1b43675e821e48cf9268fd15b05@kernel.org>
Date: Fri, 28 Mar 2025 14:42:22 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 6/8] rust: drm: file: Add File abstraction
In-Reply-To: <20250325235522.3992-7-dakr@kernel.org>
References: <20250325235522.3992-7-dakr@kernel.org>
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

On Wed, 26 Mar 2025 00:54:33 +0100, Danilo Krummrich wrote:
> A DRM File is the DRM counterpart to a kernel file structure,
> representing an open DRM file descriptor.
>=20
> Add a Rust abstraction to allow drivers to implement their own File types
> that implement the DriverFile trait.
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

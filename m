Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F989A71301
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 09:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E405710E667;
	Wed, 26 Mar 2025 08:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KgJ5F8yV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B0D10E667
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 08:46:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 311706112F;
 Wed, 26 Mar 2025 08:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1BAC4CEE2;
 Wed, 26 Mar 2025 08:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742978780;
 bh=uDjnAPivhTKuVNSo+18ftJxD9akeknBIx6lNFUOkFkA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=KgJ5F8yV9A3pEeN8PODfL90zI3m6llp/Nw5NG7h8yE1a8l0O9LxqdVGdg5vg47GHx
 Nj7hGXFzYgRaHV2acNbEj+57qMY2EBlLgzMKc9a4cifEVuvggIO41941zQe7kxeh4p
 o+2uWoMVAhDTAIfg29PZnPZJrMzt+RnGJelfHIohx/iobxJaYmX44gXuxmDXC35GwN
 TImwV77eN+0UQXLcr/wmWN65++1T4KAl/4ujH8so+YFnDVUdtXGMwDe0k4So7wdKNq
 5uIvfDx2ifTDOyv6Mb5PuNWjRZFdwgllb3Pa00WHYdfhTb/qwuuNscWtRkyaN7TogJ
 nOFCt+g6pwYgQ==
Message-ID: <ccdce4920ae2ba95a2afe8bb4d6f0f60@kernel.org>
Date: Wed, 26 Mar 2025 08:46:17 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/8] drm: drv: implement __drm_dev_alloc()
In-Reply-To: <20250325235522.3992-2-dakr@kernel.org>
References: <20250325235522.3992-2-dakr@kernel.org>
Cc: a.hindborg@kernel.org, acurrid@nvidia.com, airlied@gmail.com,
 alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, daniel.almeida@collabora.com,
 dri-devel@lists.freedesktop.org, gary@garyguo.net, j@jannau.net,
 lina@asahilina.net, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org,
 simona@ffwll.ch, tmgross@umich.edu, tzimmermann@suse.de, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
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

On Wed, 26 Mar 2025 00:54:28 +0100, Danilo Krummrich wrote:
> In the Rust DRM device abstraction we need to allocate a struct
> drm_device.
> 
> Currently, there are two options, the deprecated drm_dev_alloc() (which
> does not support subclassing) and devm_drm_dev_alloc(). The latter
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

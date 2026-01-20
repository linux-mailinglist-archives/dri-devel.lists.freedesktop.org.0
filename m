Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A0DD3C57B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF3210E5AE;
	Tue, 20 Jan 2026 10:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dlOSIwXo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B050510E5AE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:37:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A6350600CB;
 Tue, 20 Jan 2026 10:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC49C16AAE;
 Tue, 20 Jan 2026 10:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768905435;
 bh=ff8PvoLd27xknveeG6tYVL2fNILWoP3zoakHDhwG9Ys=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=dlOSIwXodDxENXTQ4oe4XMsP2C6ZFlTtGNI46ZMROnGG+sAWC8YO95xnGVTIHYKTR
 6BVF341QW9TDTshFp1OomC9KB8OE5iuNMvlOzmcyo3Vw7TqpOFamTFgpMA3BOe2h+s
 q8XyL6gan0YTUnKr5LCvVuTJk0sE3myDAA+xI9oZX9S0lzt3nod/q61rIYicCULAxk
 R1lSHa2wgFsFClrENX/zlBoeBI3Mmh2f4wmYHr1uCrERzi+dOvOHepGuN3GXzp/p1E
 64x/Ta8PgpIqUd3Qn1gpa3zneWtC9OUiOypwCy9/Bq3EdK6BaoSU1K6QuyrGyn3wBK
 CMe45qn4syJPQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 11:37:12 +0100
Message-Id: <DFTCN53K0NOW.3N95KVYE3Z1JC@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] drm/tyr: rename pad0 to selected_coherency
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Deborah Brouwer"
 <deborah.brouwer@collabora.com>, "Mark Brown" <broonie@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
References: <20260120-tyr-pad0-coherency-v1-1-91f40e56c67a@google.com>
In-Reply-To: <20260120-tyr-pad0-coherency-v1-1-91f40e56c67a@google.com>
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

On Tue Jan 20, 2026 at 11:34 AM CET, Alice Ryhl wrote:
> This applies the uapi change in commit ea78ec982653 ("drm/panthor:
> Expose the selected coherency protocol to the UMD") to the Tyr driver as
> well.
>
> Once this is merged with drm-rust-next, this kind of change to the uapi
> struct is automatically reflected in the Tyr driver's GpuInfo. [1]
>
> Link: https://lore.kernel.org/r/aW8-oH7dtp-OTAZC@google.com [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> For drm-misc rather than drm-rust.
> ---

Acked-by: Danilo Krummrich <dakr@kernel.org>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C06D3AA68
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473BF10E45D;
	Mon, 19 Jan 2026 13:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fM35nSQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA9F10E45D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 13:33:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A7BFD4343B;
 Mon, 19 Jan 2026 13:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE28C116C6;
 Mon, 19 Jan 2026 13:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768829610;
 bh=8fGKbiXSuaskQQ0Ap4cVCYo2PGF9Yb15kLd9rCnoU/I=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=fM35nSQV7rbCwksZUGPNHyGEGUnzIgJOtDWs+YQj4OFjlFKRORqcz0C2Otv3ngylx
 0FAJxuMD/tjvkIXEmah8j2c54cNpUToyOfutqfTFTHNM84sHhwzw5yxnhm5D/xM6Qe
 PeYKy/isphedVoYtMkJYq7Vh661dhBSROPh5BqGppx7LeA6vXemQDIc/DOlunwFmBu
 I9WMX/qc62Rh4zI/zA7cjCNFKAEYxToKFs53xdc0psKCTA3GrdEJpgCkBd1zI5WA92
 aO9y51hkEs3pG+RDyyWmZMekthM34dorjwExHjdfyTRwrIQUsxLa4Ks3qn1B2mGny1
 ubUtaNBngS9bA==
Message-ID: <d4a199738a7de363a50e349ad6a9a26e@kernel.org>
Date: Mon, 19 Jan 2026 13:33:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Eric Chanudet" <echanude@redhat.com>
Subject: Re: [PATCH v3 0/2] dma-buf: system_heap: account for system heap
 allocation in memcg
In-Reply-To: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
References: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, "Benjamin
 Gaignard" <benjamin.gaignard@collabora.com>,
 "Brian Starkey" <Brian.Starkey@arm.com>, 
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "John
 Stultz" <jstultz@google.com>, "Maxime Ripard" <mripard@kernel.org>, "Maxime
 Ripard" <mripard@redhat.com>, "Sumit Semwal" <sumit.semwal@linaro.org>, "T.J.
 Mercier" <tjmercier@google.com>
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

On Fri, 16 Jan 2026 15:05:37 -0500, Eric Chanudet wrote:
> Capture dmabuf system heap allocations in memcg following prior
> conversations[1][2]. Disable this behavior by default unless configured
> by "dma_heap.mem_accounting" module parameter.
>=20
> [1] https://lore.kernel.org/dri-devel/Z-5GZ3kJDbhgVBPG@phenom.ffwll.local/
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

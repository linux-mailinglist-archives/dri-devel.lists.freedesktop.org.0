Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A73CC05FCB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715C210EA37;
	Fri, 24 Oct 2025 11:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hds0sijd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEBE10EA37
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:34:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CC103450AF;
 Fri, 24 Oct 2025 11:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9BEC4CEF1;
 Fri, 24 Oct 2025 11:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761305669;
 bh=C2071/4y7/j52Jeu+ERq03SVVMZ5dIN9u1f1mb/b9vQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=hds0sijd3DpmsMZEdqENMgI9IkUzM1SysXUOE7+1iSLj3LZQowSCdwya7THigUfFN
 jCj6J3zgN7FDNy2936BUyuVb2acinCRajGsjPfkEnBVpmggk5F3AGlBPHyV1tZMKMS
 +a8P8ozie7oz7NLosPF2bPbIV//61MVzzMkVsN1RfBiaH8u9/ZRc7sDHc/NxpxLYTL
 VrJZBPR3347TWkt1m4xXZXabk+7cOQrYi6HSv8XuqkNJuEkH6f7O218k+iBn92f+0I
 tGi2Dw1pMnR/SacbDyl+BatQJMM6+pHyvtq5VapgyZn7Bhwkr+EZremykwk8sE7Xf6
 oqJk4HDV9OvCQ==
Message-ID: <51b0a361379b26ff14dd2f5b0aa4d6df@kernel.org>
Date: Fri, 24 Oct 2025 11:34:26 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Barry Song" <21cnbao@gmail.com>
Subject: Re: [PATCH v2] dma-buf: system_heap: use larger contiguous mappings
 instead of per-page mmap
In-Reply-To: <20251021042022.47919-1-21cnbao@gmail.com>
References: <20251021042022.47919-1-21cnbao@gmail.com>
Cc: 21cnbao@gmail.com, Brian.Starkey@arm.com, benjamin.gaignard@collabora.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, jstultz@google.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org, tjmercier@google.com,
 v-songbaohua@oppo.com, zhengtangquan@oppo.com, "Maxime
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

On Tue, 21 Oct 2025 17:20:22 +1300, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> We can allocate high-order pages, but mapping them one by
> one is inefficient. This patch changes the code to map
> as large a chunk as possible. The code looks somewhat
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

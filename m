Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E160AC4F12
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 15:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1F710E12D;
	Tue, 27 May 2025 13:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vKdAm5e/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0FA10E145
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 13:00:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E32E64A93C;
 Tue, 27 May 2025 13:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B66C4CEE9;
 Tue, 27 May 2025 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748350817;
 bh=ByY3v2Z6BPxv2P0JXnk/fpP5Gnu/Ld1qKUcEghmsQ/c=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=vKdAm5e/51iiN/W8WOdsfc91Jw+oMMaRIECe9P1oymn4oUYRcAclX0NDlrIau0AOJ
 Bqes1x9wHn9KDjJuOs6Z8XDznbs222PHmjiD+0j9GvIXN+HVvTbiNVBK7KVRPvDYxj
 jmuq23Q4I64jPT/n8ZeacK/7C+xwNIXZAiki+hMm6QNPLPoI7XBC8BaclisBZ2Fi0m
 NPKnVKHjJs6ThT/T1igeKE6QSVkBZ8WPJm0FAiu3f5u7g7a7QkW2rIV5ocXnPU3JnE
 /sJHvV8/t2h0RzIJYsnqyyh+nUC6fRqCjalh8u7hmDnavVzitv5/zLF7Bsj9ZcX8R5
 AY7Xde8EUjkcg==
Message-ID: <9470f08c3fcc49fcbbe890a5d66588a5@kernel.org>
Date: Tue, 27 May 2025 13:00:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jared Kangas" <jkangas@redhat.com>
Subject: Re: [PATCH v3 2/3] dma-buf: heaps: Parameterize heap name in
 __add_cma_heap()
In-Reply-To: <20250522191418.442390-3-jkangas@redhat.com>
References: <20250522191418.442390-3-jkangas@redhat.com>
Cc: Brian.Starkey@arm.com, benjamin.gaignard@collabora.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, jstultz@google.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mripard@kernel.org, sumit.semwal@linaro.org,
 tjmercier@google.com, "Maxime Ripard" <mripard@kernel.org>
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

On Thu, 22 May 2025 12:14:17 -0700, Jared Kangas wrote:
> Prepare for the introduction of a fixed-name CMA heap by replacing the
> unused void pointer parameter in __add_cma_heap() with the heap name.
> 
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

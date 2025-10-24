Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 543C8C062F4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 14:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B9E10E8FF;
	Fri, 24 Oct 2025 12:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KKvfsL01";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB16B10E8FF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 12:12:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9049E44675;
 Fri, 24 Oct 2025 12:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D608AC4CEF1;
 Fri, 24 Oct 2025 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761307979;
 bh=OUk76ys6nMYdTGFO9m0BC6J/XiUc43vsBYgM5iphDsI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KKvfsL016APxbCetUhGFzBkdrNnbXJrbu9QqLvml7A0H5TmGT9VKfKC4Q4gOE1Ayu
 p0cFFzA087tdWMnri0ZNtgEE4Ly3eKBPEqM18dJuqOLZ0HPn/MhBql7M/s+329FFp8
 lcBpyXEULsBsrLvrasfRQSXvoJj2G2wm4BHKvkVGXCsGjcWWiNebbRy3zIkHEpi141
 onbxiNmYbmKPUBougQcJ9UwqDw7jp7Wg2jIdciYo3Z1qNwFO7eCyEKuHPJC3BX2JhD
 41BTg6sN6z4uUSTWMgGi1pItjxuKwVtp9LueSPyOumGdiizabputuHu+iVzmNedH27
 JP3ejm2KpXwEw==
Message-ID: <89812f66-25a6-4f9e-aa4f-74adbf116db8@kernel.org>
Date: Fri, 24 Oct 2025 14:12:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251024075019.162351-2-phasta@kernel.org>
 <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
 <5de88e79575e06c053f2d61f7bb58bf9cf5b556e.camel@mailbox.org>
 <1d0bbdcf-f4d6-49c0-bbdf-364c2af80868@igalia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <1d0bbdcf-f4d6-49c0-bbdf-364c2af80868@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 10/24/25 1:31 PM, Tvrtko Ursulin wrote:
> Also, the short name can be reduced from a verbose starting point similar to yours:
> 
>  "unknown-driver-is-detached-from-the-signaled-fence"
>  "driver-detached-from-the-fence"
>  "driver-detached"
> 
> Or keep "detached-driver" as good enough. Mea culpa for typing it up transposed. :)

"detached-driver" is misleading, just because the fence is signaled it doesn't
mean that the driver is detached.

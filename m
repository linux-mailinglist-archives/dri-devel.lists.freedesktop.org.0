Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37DBB3C25D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 20:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676FD10EC21;
	Fri, 29 Aug 2025 18:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fBzxdt6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6593010EC21;
 Fri, 29 Aug 2025 18:21:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E427E45410;
 Fri, 29 Aug 2025 18:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D628C4CEF4;
 Fri, 29 Aug 2025 18:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756491670;
 bh=BQjci8KA9KRIrfOxe+R7ISy9o/J0YO0Tqyp01cTUx7A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fBzxdt6p/s0vBaqCGm6GWMs9L2kRJs+tcqEnbQjbLDmRciCgte+dMbPDyWUm2asI5
 nW07NcZNwlZz4qMWyUCwjrCtmtXWXw2BwQi4XIn+fafHNZAlJATNCE1fCfquIXz0az
 iSyEdyfYy3OnoGdNLKrWVzL9h/T4NpktzONrKvwNxmZ2fByr5Zs0GJXyVGqaYolzDy
 oDep5TNrmNX769NgQe4W2ufF5d9cAip5eeJNyF5DlWfKoan9iC9YRkpyy1TmF9o4KE
 aK1uQrfHJOn2nihg3aoi0zX3RkGnScpGJIhqeczSCCCgU9OLh5qyrtX6dguaIG7A6l
 T4k9fLJSq/D1g==
Message-ID: <825bb276-3421-4697-86fa-ba231cd799a7@kernel.org>
Date: Fri, 29 Aug 2025 20:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] nouveau: Membar before between semaphore writes and
 the interrupt
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20250829021633.1674524-1-airlied@gmail.com>
 <20250829021633.1674524-2-airlied@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250829021633.1674524-2-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 8/29/25 4:16 AM, Dave Airlie wrote:
> From: Faith Ekstrand <faith.ekstrand@collabora.com>
> 
> This ensures that the memory write and the interrupt are properly
> ordered and we won't wake up the kernel before the semaphore write has
> hit memory.
> 
> Fixes: b1ca384772b6 ("drm/nouveau/gv100-: switch to volta semaphore methods")
> Cc: stable@vger.kernel.org
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Applied to drm-misc-fixes, thanks!

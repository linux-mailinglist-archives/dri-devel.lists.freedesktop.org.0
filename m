Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA445A8443F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 15:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC4E10E9AD;
	Thu, 10 Apr 2025 13:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="B+jedoSI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE1410E9B0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744290606;
 bh=K6Ue5wV2m/qSbd7Qw6QNsM6vaGiNPmLXsokcST25jhs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B+jedoSIS5eq151IJIoIn8tTm6jENzsVM9whxlZvqCib0/o87V2J9hbQeqfhu0eSi
 n2X+IgQjTzskuQD0Tak5g3l22F8861exmM2csGEDKgUXt67hM9z+bs8DHGImh1aA7K
 bTQZlKeAipV4isVg5/y5O4RIf3KXmD03Sh4FpFc9hO1EnfH21YDSitMQRpLWBbvOGD
 80JjUGrPPUWa8ZhLMfD/IhWrlFlufFmL6OJGwAbP+0oreSl900yx2kDAQTmYOAHyYV
 1KOKgFewfm0xq2spyXHFzW4eTKVemfEsvIzv7vYIkx2MUvsYmOoE4dcjAlSuziAVIQ
 BWKSby1TjLJJA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 63EC017E0808;
 Thu, 10 Apr 2025 15:10:06 +0200 (CEST)
Date: Thu, 10 Apr 2025 15:10:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 0/5] drm/panthor: Misc fixes
Message-ID: <20250410151001.3668a295@collabora.com>
In-Reply-To: <20250404080933.2912674-1-boris.brezillon@collabora.com>
References: <20250404080933.2912674-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri,  4 Apr 2025 10:09:28 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
> 
> This is a collection of fixes for bugs found while working on adding
> JM support to panthor. Those are not particularly tied to JM support
> and are worth having regardless.
> 
> Note that the last two don't have Fixes tag because they fix issues
> we can't really hit with the current implementation (no fault
> handling, and no shared irq line).
> 
> Changelog available in each patch if you're interested.
> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (5):
>   drm/panthor: Fix GPU_COHERENCY_ACE[_LITE] definitions
>   drm/panthor: Call panthor_gpu_coherency_init() after PM resume()
>   drm/panthor: Update panthor_mmu::irq::mask when needed
>   drm/panthor: Let IRQ handlers clear the interrupts themselves
>   drm/panthor: Don't update MMU_INT_MASK in panthor_mmu_irq_handler()

Queued to drm-misc-next.

> 
>  drivers/gpu/drm/panthor/panthor_device.c | 8 ++++----
>  drivers/gpu/drm/panthor/panthor_device.h | 2 --
>  drivers/gpu/drm/panthor/panthor_fw.c     | 2 ++
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 2 ++
>  drivers/gpu/drm/panthor/panthor_mmu.c    | 9 ++++++++-
>  drivers/gpu/drm/panthor/panthor_regs.h   | 4 ++--
>  6 files changed, 18 insertions(+), 9 deletions(-)
> 


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D136565BFF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25B810FDEB;
	Mon,  4 Jul 2022 16:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 887BC10E1A4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 15:48:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0F3D2B;
 Mon,  4 Jul 2022 08:47:59 -0700 (PDT)
Received: from [10.57.41.70] (unknown [10.57.41.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD5913F792;
 Mon,  4 Jul 2022 08:47:57 -0700 (PDT)
Message-ID: <f5e4ea47-ea2d-1699-d863-686195021e5d@arm.com>
Date: Mon, 4 Jul 2022 16:47:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v7 0/2] Panfrost driver fixes
Content-Language: en-GB
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Clark <robdclark@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20220630200601.1884120-1-dmitry.osipenko@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220630200601.1884120-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2022 21:05, Dmitry Osipenko wrote:
> This series fixes two minor bugs in the Panfrost driver.
> 
> Changelog:
> 
> v7: - Factored out Panfrost fixes from [1] since I'll be working on
>       the dma-buf locking in a separate patchset now.
> 
> [1] https://lore.kernel.org/all/20220526235040.678984-1-dmitry.osipenko@collabora.com/
> 
> Dmitry Osipenko (2):
>   drm/panfrost: Put mapping instead of shmem obj on
>     panfrost_mmu_map_fault_addr() error
>   drm/panfrost: Fix shrinker list corruption by madvise IOCTL
> 
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 4 ++--
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

Thanks, I've pushed both to drm-misc-fixes.

Steve

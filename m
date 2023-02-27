Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5225F6A3FF1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C2110E1C3;
	Mon, 27 Feb 2023 11:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F47710E1C3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:05:39 +0000 (UTC)
Received: from [192.168.2.206] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 17DD6660230B;
 Mon, 27 Feb 2023 11:05:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677495937;
 bh=W2ZJSSHCunoA7oJzVM5TiJI76ePuSGXeQu0bCNtxgSc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kFXVnCj0SD3+lW1B9kOOebQFDqp8nZhXli/IxdQHlruzkg0h0zYEHM8H5f+XY4P9w
 8h3FUOPgvqjCm7tpoIFjNbfnyAuVftrInDjzbL5HJEZxCW0bsbMzD5EyVxKailTgUA
 k/jBHKfnAgGELN36Nh2/m2YJpWheHqXw3zBe1AAo0wZ6Az4S5zmXU7jm8wnj9PWjKg
 EBlTqxoqW4dSHqg2f2mzbDDweF3PwQt8Ubb8pt2goTNs/rCwQdTwgg8o/42yox0t9Z
 AvGolDi2WngRcnmRzyC1IOjptoZ2GysWxV3BKUHestXlYm3P7eYSHBn+zQLZmnN8cx
 CWcUo/d+GP2pQ==
Message-ID: <5185c15a-9cd4-75e2-e791-847a4e08711c@collabora.com>
Date: Mon, 27 Feb 2023 14:05:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 05/10] drm/shmem-helper: Add memory shrinker
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, David Airlie <airlied@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>
References: <20230227060219.904986-6-dmitry.osipenko@collabora.com>
 <202302271624.aEDOT0UV-lkp@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <202302271624.aEDOT0UV-lkp@intel.com>
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 oe-kbuild-all@lists.linux.dev, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/27/23 11:25, kernel test robot wrote:
> All errors (new ones prefixed by >>):
> 
>    drivers/gpu/drm/drm_gem_shmem_helper.c:832:18: warning: no previous prototype for function 'drm_gem_shmem_get_pages_sgt_locked' [-Wmissing-prototypes]
>    struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
>                     ^
>    drivers/gpu/drm/drm_gem_shmem_helper.c:832:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
>    ^
>    static 

This should've been a part of patch 7, will correct in v12.

-- 
Best regards,
Dmitry


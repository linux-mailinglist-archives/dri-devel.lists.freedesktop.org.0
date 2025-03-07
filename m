Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F533A56869
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 14:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050F110E994;
	Fri,  7 Mar 2025 13:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tkhI010w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B797310E994
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 13:03:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3FBDDA45771;
 Fri,  7 Mar 2025 12:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBBFC4CED1;
 Fri,  7 Mar 2025 13:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741352587;
 bh=YSC4zTaduDcQ0pfmQdR1zUB7q5EQNvRgQo9Tv2ARz2I=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=tkhI010wfshTuPhNuEdSyReoQ9bVkHjkYaaBVYtr8nW0YanG5V4wAL8WSZr77SEmg
 DDgdXYgIf/JXXWYaQC6BpnQSSJKC8C4Ze+09YfJAKPgavr2J4bO1mMRVGcCBYzc3pX
 uua6HUnkdSK5/CqCrlAUfZqCVoRkFYnJg4UhS7g3k+m9oJhtw1YaVwNB0xxkMWeBts
 QHlvRChw04m5eykI779u4i7DfDwrgRjnrU1GyHHrWBdW4dOHuURf5H0GfWmLsd5Hc1
 SC4cW5YUxZRmuk07DpYonvL87yIYsk9yqJUEjmY3Ed5NX9r7sp6o90QI83z48iLxtf
 eyyMg77FopS6w==
Message-ID: <27c8aaa39d53c4af0328442662f966be@kernel.org>
Date: Fri, 07 Mar 2025 13:03:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/5] drm/prime: Support dedicated DMA device for
 dma-buf imports
In-Reply-To: <20250307080836.42848-2-tzimmermann@suse.de>
References: <20250307080836.42848-2-tzimmermann@suse.de>
Cc: admin@kodeit.net, airlied@gmail.com, airlied@redhat.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 gargaditya08@live.com, hdegoede@redhat.com, jani.nikula@intel.com,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sean@poorly.run, simona@ffwll.ch, sumit.semwal@linaro.org, "Maxime
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

On Fri, 7 Mar 2025 09:03:59 +0100, Thomas Zimmermann wrote:
> Importing dma-bufs via PRIME requires a DMA-capable device. Devices on
> peripheral busses, such as USB, often cannot perform DMA by themselves.
> Without DMA-capable device PRIME import fails. DRM drivers for USB
> devices already use a separate DMA device for dma-buf imports. Make the
> mechanism generally available.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

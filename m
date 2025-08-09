Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F7EB1F49A
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 14:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D22710E1B6;
	Sat,  9 Aug 2025 12:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jWuCVM+5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BA810E1B6;
 Sat,  9 Aug 2025 12:38:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5CADB601E0;
 Sat,  9 Aug 2025 12:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1675C4CEF0;
 Sat,  9 Aug 2025 12:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754743107;
 bh=xnFHorLNEJtWO8XBpeP45stKZBT3GxS5WM+7abvByIY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jWuCVM+5iDsAHOH2rlzPfsg5hyxs36MzYPDDW/sIf2j2jNoKzqnSSBPVSlPatC5J+
 YG/Ueu4f0Sk4ki6Np5CbXLX8ZuCCrwgqh87VDg8wIklb9kKQnqmswUl5uN6Ct2PeEn
 m2Ihp4VwukNfmkzRhIBaZBRpkXSzhIVOrH0UObuMXrZKayVzm66R37GMwxo5/vB/H6
 5MfCaEKsV8+RF/zhgPFCkbzP743IiKqwzdFa2jGsMkfGpKtrsYe40a/T2TxrY+QNIn
 SyQtEhMhY05uZgvf+hNqSHjsoFY65xUcuCm2RIUG3g0GryouyNuFEh0JejQwy1YrOC
 M3gXhV6l4gZWw==
Message-ID: <a657ead8-7f2c-4165-9a4c-ce4d82ea2adc@kernel.org>
Date: Sat, 9 Aug 2025 14:38:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/nvif: Fix potential memory leak in
 nvif_vmm_ctor().
To: Fanhua Li <lifanhua5@huawei.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 liuyongqiang13@huawei.com, lyude@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, airlied@redhat.com, linux-kernel@vger.kernel.org,
 suhui@nfschina.com
References: <20250728115027.50878-1-lifanhua5@huawei.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250728115027.50878-1-lifanhua5@huawei.com>
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

On 7/28/25 1:50 PM, Fanhua Li wrote:
> When the nvif_vmm_type is invalid, we will return error directly
> without freeing the args in nvif_vmm_ctor(), which leading a memory
> leak. Fix it by setting the ret -EINVAL and goto done.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/all/202312040659.4pJpMafN-lkp@intel.com/
> Fixes: 6b252cf42281 ("drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm")
> Signed-off-by: Fanhua Li <lifanhua5@huawei.com>

Applied to drm-misc-fixes, thanks!

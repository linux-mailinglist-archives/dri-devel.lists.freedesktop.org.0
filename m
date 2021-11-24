Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E25E845C66D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 15:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3445E6E1C0;
	Wed, 24 Nov 2021 14:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 459F26E114
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 14:05:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3873ED1;
 Wed, 24 Nov 2021 06:05:20 -0800 (PST)
Received: from [10.57.56.56] (unknown [10.57.56.56])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66E5D3F73B;
 Wed, 24 Nov 2021 06:05:19 -0800 (PST)
Message-ID: <0dfb2ee7-e6ec-f085-ed16-650e646d24d7@arm.com>
Date: Wed, 24 Nov 2021 14:05:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/9] gpu: host1x: Add missing DMA API include
Content-Language: en-GB
From: Robin Murphy <robin.murphy@arm.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <cover.1637671820.git.robin.murphy@arm.com>
 <d7bc49bfda25a7ea19dc574f8e212cd9e42bf2e2.1637671820.git.robin.murphy@arm.com>
In-Reply-To: <d7bc49bfda25a7ea19dc574f8e212cd9e42bf2e2.1637671820.git.robin.murphy@arm.com>
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
Cc: joro@8bytes.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 willy@infradead.org, linux-tegra@vger.kernel.org, will@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-23 14:10, Robin Murphy wrote:
> Host1x seems to be relying on picking up dma-mapping.h transitively from
> iova.h, which has no reason to include it in the first place. Fix the
> former issue before we totally break things by fixing the latter one.
> 
> CC: Thierry Reding <thierry.reding@gmail.com>
> CC: Mikko Perttunen <mperttunen@nvidia.com>
> CC: dri-devel@lists.freedesktop.org
> CC: linux-tegra@vger.kernel.org
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> Feel free to pick this into drm-misc-next or drm-misc-fixes straight
> away if that suits - it's only to avoid a build breakage once the rest
> of the series gets queued.

Bah, seems like tegra-vic needs the same treatment too, but wasn't in my 
local config. Should I squash that into a respin of this patch on the 
grounds of being vaguely related, or would you prefer it separate?

(Either way I'll wait a little while to see if the buildbots uncover any 
more...)

Cheers,
Robin.

>   drivers/gpu/host1x/bus.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index 218e3718fd68..881fad5c3307 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <linux/debugfs.h>
> +#include <linux/dma-mapping.h>
>   #include <linux/host1x.h>
>   #include <linux/of.h>
>   #include <linux/seq_file.h>
> 

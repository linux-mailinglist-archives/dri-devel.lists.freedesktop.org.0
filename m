Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3DFB1233E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 19:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8350610E9F8;
	Fri, 25 Jul 2025 17:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="rRk/10Ix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810A410EA08
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 17:49:54 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56PHnc3d2251811;
 Fri, 25 Jul 2025 12:49:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1753465778;
 bh=+eBwJup3Yjm99HHyJ3Azuh5yfqVuAmBeRvTWq8BjN1Y=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=rRk/10Ix0X2smb4WE4ZUcNvU3FwYJWosRBjhlZORYEwD18orQCFeJEdiljeIaqR2w
 LrKV6RqWOaeGA3QvBh7Tpbysec16MIv+DxoJJ//NkeyX2g0NNRO/MWpev6OMWEuDFP
 Ly0mLMGHwG2FObKZhFIO7QgJTH5CMw7bfwAe02ds=
Received: from DFLE20.ent.ti.com (dfle20.ent.ti.com [10.64.6.57])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56PHncUf2468477
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Jul 2025 12:49:38 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.1748.24; Fri, 25 Jul
 2025 12:49:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 25 Jul 2025 12:49:38 -0500
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56PHnb9c2388126;
 Fri, 25 Jul 2025 12:49:37 -0500
Message-ID: <30d4bf10-274d-485c-84dd-7cbb8157efab@ti.com>
Date: Fri, 25 Jul 2025 12:49:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Documentation: dma-buf: heaps: Add naming guidelines
To: Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>
CC: Jared Kangas <jkangas@redhat.com>, Mattijs Korpershoek
 <mkorpershoek@kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>
References: <20250717-dma-buf-heap-names-doc-v3-1-d2dbb4b95ef6@kernel.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250717-dma-buf-heap-names-doc-v3-1-d2dbb4b95ef6@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 7/17/25 3:10 AM, Maxime Ripard wrote:
> We've discussed a number of times of how some heap names are bad, but
> not really what makes a good heap name.
> 
> Let's document what we expect the heap names to look like.
> 
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes in v3:
> - Grammar, spelling fixes
> - Remove the cacheable / uncacheable name suggestion
> - Link to v2: https://lore.kernel.org/r/20250616-dma-buf-heap-names-doc-v2-1-8ae43174cdbf@kernel.org
> 
> Changes in v2:
> - Added justifications for each requirement / suggestions
> - Added a mention and example of buffer attributes
> - Link to v1: https://lore.kernel.org/r/20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org
> ---
>   Documentation/userspace-api/dma-buf-heaps.rst | 35 +++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
> index 535f49047ce6450796bf4380c989e109355efc05..3ee4e7961fe390ba356a2125d53b060546c3e4a6 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -21,5 +21,40 @@ following heaps:
>      usually created either through the kernel commandline through the
>      `cma` parameter, a memory region Device-Tree node with the
>      `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
>      `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
>      might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> +
> +Naming Convention
> +=================
> +
> +``dma-buf`` heaps name should meet a number of constraints:
> +
> +- The name must be stable, and must not change from one version to the other.
> +  Userspace identifies heaps by their name, so if the names ever change, we
> +  would be likely to introduce regressions.
> +
> +- The name must describe the memory region the heap will allocate from, and
> +  must uniquely identify it in a given platform. Since userspace applications
> +  use the heap name as the discriminant, it must be able to tell which heap it
> +  wants to use reliably if there's multiple heaps.
> +
> +- The name must not mention implementation details, such as the allocator. The
> +  heap driver will change over time, and implementation details when it was
> +  introduced might not be relevant in the future.
> +
> +- The name should describe properties of the buffers that would be allocated.
> +  Doing so will make heap identification easier for userspace. Such properties
> +  are:
> +
> +  - ``contiguous`` for physically contiguous buffers;
> +
> +  - ``protected`` for encrypted buffers not accessible the OS;
> +
> +- The name may describe intended usage. Doing so will make heap identification
> +  easier for userspace applications and users.
> +
> +For example, assuming a platform with a reserved memory region located at the
> +RAM address 0x42000000, intended to allocate video framebuffers, physically
> +contiguous, and backed by the CMA kernel allocator, good names would be
> +``memory@42000000-cacheable-contiguous`` or ``video@42000000``, but

You dropped "cacheable" but left it here in the suggested names, maybe
replace with "protected" here. Otherwise, LGTM,

Reviewed-by: Andrew Davis <afd@ti.com>

> +``cma-video`` wouldn't.
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250520-dma-buf-heap-names-doc-31261aa0cfe6
> 
> Best regards,


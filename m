Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D687FDE66
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 18:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0267710E641;
	Wed, 29 Nov 2023 17:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0405F10E641
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 17:31:25 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20231129173122euoutp015e7bfd2307bba6afbee4c6a5cb96a849~cKE-f5nJF1331513315euoutp01a
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 17:31:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20231129173122euoutp015e7bfd2307bba6afbee4c6a5cb96a849~cKE-f5nJF1331513315euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1701279082;
 bh=+CPd+5TEbyJhr/GPUZmG7dH8aXuuHaI2jxwvUn/b3HM=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=VGoq6RYxzG6XCpasklkABnF3myXkd3NuMoozXIzI5lE4j5YA6N3Dv6YsNPTXt/NAa
 yLqsikxOnI3sdEWz9jzHTXtZNraSQM9N66pS3X3rOzL/xVV2FZ1U9jXQLXrQVwIDAe
 C4RkywaJOFaSvS+uXtW7UVAiV0aqseAhsaK7WygI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20231129173122eucas1p2d1b4abb1aee6e1b3ba9e4308f2aaa2f0~cKE-QNx9u2212122121eucas1p2D;
 Wed, 29 Nov 2023 17:31:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 7E.7E.09814.A6577656; Wed, 29
 Nov 2023 17:31:22 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20231129173122eucas1p151aaa125942f156e788ea7af9437b467~cKE_3LhZy1811418114eucas1p19;
 Wed, 29 Nov 2023 17:31:22 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20231129173122eusmtrp1057422e4990e6b7d3fa67c4072d51eac~cKE_1WVoF0987209872eusmtrp1V;
 Wed, 29 Nov 2023 17:31:22 +0000 (GMT)
X-AuditID: cbfec7f4-727ff70000002656-9a-6567756a71a3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 12.F9.09146.96577656; Wed, 29
 Nov 2023 17:31:21 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20231129173121eusmtip250b2123500def79312c4ad636ede2d6b~cKE9_kfLy1107511075eusmtip2C;
 Wed, 29 Nov 2023 17:31:21 +0000 (GMT)
Message-ID: <8a4b80dc-0841-48f8-81ad-7486bc57f3d7@samsung.com>
Date: Wed, 29 Nov 2023 18:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm/panfrost: Fix poweroff and sync IRQs for
 suspend
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20231128124510.391007-1-angelogioacchino.delregno@collabora.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsWy7djP87pZpempBrvvSVqcuL6IyeLSSgmL
 02dOMVn83zaR2eLK1/dsFpvP9bBa7H29ld3i8q45bBYLP25lsWjrXMZq8X/PDnaLxiNAJVve
 TGR14PVYM28No8eOu0sYPfZ+W8DisXPWXXaPTas62TzuXNvD5jHvZKDH/e7jTB6bT1d7fN4k
 F8AVxWWTkpqTWZZapG+XwJVx8m83a8EvnorXF04wNjBe5upi5OSQEDCROLT/PnsXIxeHkMAK
 RolNe44zQThfGCXaV81khHA+M0os+PqBDaZl7/X3UInljBJvzt1kg3A+MkrMvPOTCaSKV8BO
 4vLph2AdLAKqEpM3H2GGiAtKnJz5hAXEFhWQl7h/awY7iC0sECSxZMp8RhCbWUBc4taT+WBz
 RAQyJR7NeAl2ILPANCaJvYcegxWxCRhKdL3tAlrAwcEp4Cex+60lRK+8xPa3c5hB6iUEVnNK
 TOrbC3W2i8StGZNYIGxhiVfHt7BD2DISpyf3sEA0tAP9+fs+E4QzgVGi4fktRogqa4k7536B
 bWMW0JRYv0sfIuwosfbGZmaQsIQAn8SNt4IQR/BJTNo2HSrMK9HRJgRRrSYx6/g6uLUHL1xi
 nsCoNAspWGYheX8WkndmIexdwMiyilE8tbQ4Nz212CgvtVyvODG3uDQvXS85P3cTIzDdnf53
 /MsOxuWvPuodYmTiYDzEKMHBrCTCq/cxOVWINyWxsiq1KD++qDQntfgQozQHi5I4r2qKfKqQ
 QHpiSWp2ampBahFMlomDU6qBqdz5LUOh7tIb+czrFr5p/zRLY7/gJZPDrE9OyllL7fHTn/U7
 lI9vKjvb9m9Ct/4cr1R451V0si9y9vtbgaySTRd7jE7n/xdUijoobcf9WWrr3U0RGZsLml4r
 MG36foRh7UUJAaVZtVde/0/Su79o6bpV/UcYJvdKBa0S4Ne8e+J/QW2xVPLz3iA/hohsIYEQ
 fkUu02scHBpL+Tt5Gyev3tYS9++S24kNCgqiE2a+uZOm8EzAj/1pfuK8lWuajgud/mRoLbBR
 /YlzflHRufpAbpOPack135ek2aZy93uueasZYm2cf+ho7o1Axpx/r+d/Fdhaq+xmaDMp8QjP
 wedncg/prPBhkbNhKamfY1atxFKckWioxVxUnAgADc0+7uYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsVy+t/xe7qZpempBn//mVucuL6IyeLSSgmL
 02dOMVn83zaR2eLK1/dsFpvP9bBa7H29ld3i8q45bBYLP25lsWjrXMZq8X/PDnaLxiNAJVve
 TGR14PVYM28No8eOu0sYPfZ+W8DisXPWXXaPTas62TzuXNvD5jHvZKDH/e7jTB6bT1d7fN4k
 F8AVpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJdx
 8m83a8EvnorXF04wNjBe5upi5OSQEDCR2Hv9PWMXIxeHkMBSRomdxxoYIRIyEienNbBC2MIS
 f651sUEUvWeU2DapDayIV8BO4vLph2wgNouAqsTkzUeYIeKCEidnPmEBsUUF5CXu35rBDmIL
 CwRJLJkyH6yXWUBc4taT+UwgtohApsTL6dfYQRYwC0xhkni04y0zxLaFjBKbH58Gq2ITMJTo
 egtyBgcHp4CfxO63lhCDzCS6tnZBDZWX2P52DvMERqFZSO6YhWTfLCQts5C0LGBkWcUoklpa
 nJueW2yoV5yYW1yal66XnJ+7iREY39uO/dy8g3Heq496hxiZOBgPMUpwMCuJ8Op9TE4V4k1J
 rKxKLcqPLyrNSS0+xGgKDIyJzFKiyfnABJNXEm9oZmBqaGJmaWBqaWasJM7rWdCRKCSQnliS
 mp2aWpBaBNPHxMEp1cBkuqT9fSTrT6NArW9/2rx3rNWataDscMtbfRuXqZdfBSR+vBOxlLfq
 uduJQ+JmU228j/WwNaZZXJAx2BLF39srzxSofefDbOnEls6kh51T/1+bqbXvb9Mmq52ac06t
 k6rp1+p4m16oy/d4mvUPzdK7oZ83mNsvCee16On/Oq/ryW4d8bIv0Uv3mz7cntDDz6f78tid
 aCH/JBsuhvpHF7fzTD8702ZX6jeDmIPyb1buN8+UaOjUO3WyUNxENnLfk5fHpL9sW1bWG9z3
 eGqFDOMapQRFL/tt+VueH5RTZlDO9dy488hKplXFnK/v7dukvJP9lajNpms9XdOduW5cZDPl
 cbqqfTmZYc5KEXHzSc+UWIozEg21mIuKEwGP6RoBeAMAAA==
X-CMS-MailID: 20231129173122eucas1p151aaa125942f156e788ea7af9437b467
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231128124521eucas1p203694ed4721b9ffcde6f7f1d1933d56a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231128124521eucas1p203694ed4721b9ffcde6f7f1d1933d56a
References: <CGME20231128124521eucas1p203694ed4721b9ffcde6f7f1d1933d56a@eucas1p2.samsung.com>
 <20231128124510.391007-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28.11.2023 13:45, AngeloGioacchino Del Regno wrote:
> This series contains a fast fix for the basic GPU poweroff functionality
> and goes further by implementing interrupt masking and synchronization
> before suspend.
>
> For more information, please look at the conversation at [1], which
> explains the regression seen with the poweroff commit and the initial
> approaches taken to solve that.

Just to let You know, as there is still some discussion about 
beautifying the final code, I've tested this version on my test hardware 
and everything works fine again! Thanks!

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> Cheers!
>
> [1]: https://lore.kernel.org/all/20231123095320.41433-1-angelogioacchino.delregno@collabora.com/
>
> AngeloGioacchino Del Regno (3):
>    drm/panfrost: Ignore core_mask for poweroff and disable PWRTRANS irq
>    drm/panfrost: Add gpu_irq, mmu_irq to struct panfrost_device
>    drm/panfrost: Synchronize and disable interrupts before powering off
>
>   drivers/gpu/drm/panfrost/panfrost_device.c |  4 +++
>   drivers/gpu/drm/panfrost/panfrost_device.h |  9 +++++++
>   drivers/gpu/drm/panfrost/panfrost_gpu.c    | 29 +++++++++++++++-------
>   drivers/gpu/drm/panfrost/panfrost_gpu.h    |  1 +
>   drivers/gpu/drm/panfrost/panfrost_job.c    | 18 +++++++++++---
>   drivers/gpu/drm/panfrost/panfrost_job.h    |  1 +
>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 27 ++++++++++++++------
>   drivers/gpu/drm/panfrost/panfrost_mmu.h    |  1 +
>   8 files changed, 70 insertions(+), 20 deletions(-)
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


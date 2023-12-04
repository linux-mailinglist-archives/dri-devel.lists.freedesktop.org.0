Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD6380399E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 17:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2871510E270;
	Mon,  4 Dec 2023 16:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17D010E223
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 16:05:19 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20231204160517euoutp0254298c330d7bc51007b7f8a70921e1fc~drIQSXFSf2126621266euoutp026
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 16:05:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20231204160517euoutp0254298c330d7bc51007b7f8a70921e1fc~drIQSXFSf2126621266euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1701705917;
 bh=97jkE2BSkOLjo+/AOP4tEvoIrEIXJxvo3ugmZeP7zCQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=OE5dUCnf3OJzPLTQwrl370jaqztOST5UrGtobVX1paNTDW626iP3CDX02zT2ML6ky
 8fmvu7/4xm7XqhUMfgy3vMkHuc8hNH6iUEzs8YTz19h9qkfShVtjkHnW2EquDw72Do
 1v09JW/dc9tw1Oi4JWwJyX7m1afnNyHCjttLqKns=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20231204160517eucas1p1be82e51726b37de39d04fba3b58194de~drIQCHmDZ0078200782eucas1p1M;
 Mon,  4 Dec 2023 16:05:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 8E.D2.09814.DB8FD656; Mon,  4
 Dec 2023 16:05:17 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20231204160516eucas1p1741400688b44c438f3b373c374fb1446~drIPq3yUV0070300703eucas1p1q;
 Mon,  4 Dec 2023 16:05:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20231204160516eusmtrp158ee4898803b254f488ccb9043c25df5~drIPqVRNQ2505425054eusmtrp1d;
 Mon,  4 Dec 2023 16:05:16 +0000 (GMT)
X-AuditID: cbfec7f4-711ff70000002656-16-656df8bdd23a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B4.71.09274.CB8FD656; Mon,  4
 Dec 2023 16:05:16 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20231204160516eusmtip1fe8df228195bb5196eea965470161b7f~drIO-DW9j1335113351eusmtip1i;
 Mon,  4 Dec 2023 16:05:16 +0000 (GMT)
Message-ID: <4c70768c-c127-4577-9170-51857e657d19@samsung.com>
Date: Mon, 4 Dec 2023 17:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/panfrost: Ignore core_mask for poweroff and
 disable PWRTRANS irq
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20231204114215.54575-2-angelogioacchino.delregno@collabora.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsWy7djP87p7f+SmGlzfwW5x4voiJotLKyUs
 Tp85xWTxf9tEZosrX9+zWWw+18Nqsff1VnaLy7vmsFks/LiVxaKtcxmrxf89QF2NR4BKtryZ
 yOrA67Fm3hpGjx13lzB67P22gMVj56y77B6bVnWyedy5tofNY97JQI/73ceZPDafrvb4vEku
 gCuKyyYlNSezLLVI3y6BK2PT/IKC3bwVzfP3Mzcw/uHqYuTkkBAwkVj9ejt7FyMXh5DACkaJ
 07vPQzlfGCXePpjIClIlJPCZUWLjDVeYjsvTvzNCxJczSpw/rQTR8JFR4s6MfewgCV4BO4k9
 h68wgdgsAioSM7aeYIKIC0qcnPmEBcQWFZCXuH9rBli9sECSxOM1nWBxZgFxiVtP5oPViwhk
 Sjya8RLsImaBaUwSew89BtvMJmAo0fW2i62LkYODU8BX4v1vRYheeYntb+cwQxy6nFPi8m5b
 CNtFYn73dxYIW1ji1fEt7BC2jMTpyT0sIPMlBNoZJRb8vs8E4UxglGh4fosRospa4s65X2DL
 mAU0Jdbv0ocIO0o8fPsVLCwhwCdx460gxA18EpO2TWeGCPNKdLQJQVSrScw6vg5u7cELl5gn
 MCrNQgqVWUi+n4Xkm1kIexcwsqxiFE8tLc5NTy02ykst1ytOzC0uzUvXS87P3cQITHOn/x3/
 soNx+auPeocYmTgYDzFKcDArifDOu5WdKsSbklhZlVqUH19UmpNafIhRmoNFSZxXNUU+VUgg
 PbEkNTs1tSC1CCbLxMEp1cAkyGBusDl8bYn1jfVFh7vWGbJIzWlVSAl5L+JSc8ZLru7UTwcf
 6ZlOndUztpaeDOjbcuygmqAl69+DCTFLjr5vXDn1X0/3pLP/lW+n8Yg3GQnv5V9e9WZJ5mrO
 otKWA6bnT/7Mr2b8uGD5pKVnbjHxrv0hv0K4R4iXUUpQNL10GfPHa09e/vBOuPpq3Y/qFE4T
 56lbn8x992qpSMPnXwyLWv4Zn1ZxWLpYy2qDo9nJfD6LAw5phXvXZk57out/5CdT8tQv38Vi
 NNuknecUXVvB/K3v1rZj+hENBovVg+9+NVPvXJew1jRd4F7n5PsKc0VeHj66uOeyE2+/n2eX
 xovqWv9ZMjULd2d65s5f48OhxFKckWioxVxUnAgA6Pvyc+IDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsVy+t/xu7p7fuSmGsz/pmlx4voiJotLKyUs
 Tp85xWTxf9tEZosrX9+zWWw+18Nqsff1VnaLy7vmsFks/LiVxaKtcxmrxf89O9gtGo8AlWx5
 M5HVgddjzbw1jB477i5h9Nj7bQGLx85Zd9k9Nq3qZPO4c20Pm8e8k4Ee97uPM3lsPl3t8XmT
 XABXlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G
 pvkFBbt5K5rn72duYPzD1cXIySEhYCJxefp3xi5GLg4hgaWMEode/2KCSMhInJzWwAphC0v8
 udbFBlH0nlFi+q9uZpAEr4CdxJ7DV8AaWARUJGZsPcEEEReUODnzCQuILSogL3H/1gx2EFtY
 IEni8ZpOsDizgLjErSfzwepFBDIlXk6/xg6ygFlgCpPEox1vmSG2PQbaduA2WDebgKFE11uQ
 Mzg4OAV8Jd7/VoQYZCbRtbWLEcKWl9j+dg7zBEahWUjumIVk3ywkLbOQtCxgZFnFKJJaWpyb
 nltspFecmFtcmpeul5yfu4kRGN3bjv3csoNx5auPeocYmTgYDzFKcDArifDOu5WdKsSbklhZ
 lVqUH19UmpNafIjRFBgYE5mlRJPzgeklryTe0MzA1NDEzNLA1NLMWEmc17OgI1FIID2xJDU7
 NbUgtQimj4mDU6qByepb2Z2UHetj3dyNbjgVa/S0h+jf/H/1J7PN2dB5HzXuJbdvfCygn5no
 eOkov2r8opUNLZ1671kYVrz4VWL4e21/z7mXP348zm9LOuIUGbBDbvYx51g2vxu2t+2/eDVu
 /Paq5bLqjDJnr+y18e1593wzMqWWTu16e3HDv2yPiO+sTVEVXQKbHb1XvbnDk77jYc/nz99+
 vhOs5UnRFzfQrmja/SP9dO0d5ZJGRu1M78l1EzavnJU/e45FpLCdvbKnhvaDsPe7eh81KO8V
 /bZQqyiPz19H13qjUXGgz/XyD+s6tl2bytG5sfvV2TV8+bN3/dRnFmxKvsL2Ve9M0vecVbr9
 GYsZvzev5Xlh/jZJiaU4I9FQi7moOBEA6e2unncDAAA=
X-CMS-MailID: 20231204160516eucas1p1741400688b44c438f3b373c374fb1446
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231204114225eucas1p2f7981755a8d6f21825e32373f142ff48
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231204114225eucas1p2f7981755a8d6f21825e32373f142ff48
References: <20231204114215.54575-1-angelogioacchino.delregno@collabora.com>
 <CGME20231204114225eucas1p2f7981755a8d6f21825e32373f142ff48@eucas1p2.samsung.com>
 <20231204114215.54575-2-angelogioacchino.delregno@collabora.com>
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

On 04.12.2023 12:42, AngeloGioacchino Del Regno wrote:
> Some SoCs may be equipped with a GPU containing two core groups
> and this is exactly the case of Samsung's Exynos 5422 featuring
> an ARM Mali-T628 MP6 GPU: the support for this GPU in Panfrost
> is partial, as this driver currently supports using only one
> core group and that's reflected on all parts of it, including
> the power on (and power off, previously to this patch) function.
>
> The issue with this is that even though executing the soft reset
> operation should power off all cores unconditionally, on at least
> one platform we're seeing a crash that seems to be happening due
> to an interrupt firing which may be because we are calling power
> transition only on the first core group, leaving the second one
> unchanged, or because ISR execution was pending before entering
> the panfrost_gpu_power_off() function and executed after powering
> off the GPU cores, or all of the above.
>
> Finally, solve this by:
>   - Avoid to enable the power transition interrupt on reset; and
>   - Ignoring the core_mask and ask the GPU to poweroff both core groups
>
> Fixes: 22aa1a209018 ("drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()")
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>   drivers/gpu/drm/panfrost/panfrost_gpu.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFF2D06BBB
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 02:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAE110E7DA;
	Fri,  9 Jan 2026 01:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="GY6B1+W4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m155115.qiye.163.com (mail-m155115.qiye.163.com
 [101.71.155.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB6010E7DA
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 01:26:07 +0000 (UTC)
Received: from [172.16.12.51] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 3002cb6fd;
 Fri, 9 Jan 2026 09:26:02 +0800 (GMT+08:00)
Message-ID: <4e01f121-1912-4897-98e8-cb543a501707@rock-chips.com>
Date: Fri, 9 Jan 2026 09:26:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/rockchip: Drop ROCKCHIP_IOMMU depend for
 DRM_ROCKCHIP
To: Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org
References: <20251106020632.92-1-kernel@airkyi.com>
 <20251106020632.92-9-kernel@airkyi.com> <4072834.X9hSmTKtgW@phil>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <4072834.X9hSmTKtgW@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ba05c4d8f03abkunm1426e5ab1f2143
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkhKTlZCS0gaTUhNS0NDTx9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=GY6B1+W46frWd3oLL1NM66g6O0EUywg5e7gk4XfQ3+7+led+dGGAoMeVwkHlhjufEtT6S0JKF8Ui/NstMhkxCh8FkpHFb3JVv/f+FQiHYJd8kjAsXth6LNavSgbTlumydJfio2Zlgs31cMsy3m+jrDNfczdZ39KJiNyjhMpbMuo=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=IjEhf4jC5xnT6sGVRluMHT0B2HAAj6xJis8dbhxb8WM=;
 h=date:mime-version:subject:message-id:from;
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

Hi Heiko,

On 1/9/2026 3:03 AM, Heiko Stuebner wrote:
> Am Donnerstag, 6. November 2025, 03:06:31 Mitteleuropäische Normalzeit schrieb Chaoyi Chen:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> On the RK3506 platform, there is no iommu hardware. And even on
>> platform that have iommu hardware, it should be possible to use
>> VOP without enabling iommu. In this case, a contiguous memory
>> space like CMA should be used.
>>
>> So this patch removes the dependency on ROCKCHIP_IOMMU.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>  drivers/gpu/drm/rockchip/Kconfig | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
>> index b7b025814e72..a056d419190c 100644
>> --- a/drivers/gpu/drm/rockchip/Kconfig
>> +++ b/drivers/gpu/drm/rockchip/Kconfig
>> @@ -1,7 +1,8 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  config DRM_ROCKCHIP
>>  	tristate "DRM Support for Rockchip"
>> -	depends on DRM && ROCKCHIP_IOMMU
>> +	depends on DRM
>> +	depends on ROCKCHIP_IOMMU || !ROCKCHIP_IOMMU
> 
> I don't really understand this yes+no line :-)
> 
> Can't you just
> - drop the dependency altogether
> or
> - do a depends on ROCKCHIP_IOMMU if ARM64
> 
>

This trick is called optional-dependencies [0]. In addition to the 
familiar depends on ROCKCHIP_IOMMU part, the newly added !ROCKCHIP_IOMMU
ensures that DRM_ROCKCHIP can still be built even when ROCKCHIP_IOMMU
is not build.

[0]: https://docs.kernel.org/kbuild/kconfig-language.html#optional-dependencies

If we just:
- drop the dependency altogether 

When IOMMU is enabled, the dependency relationship cannot be handled 
correctly. For example, the following configuration is possible: 
ROCKCHIP_IOMMU=m, DRM_ROCKCHIP=y, which leads to a build failure.

- do a depends on ROCKCHIP_IOMMU if ARM64

This changes the semantics. On arm64 we should also be able to work
without IOMMU being enabled.

-- 
Best, 
Chaoyi

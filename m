Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD9FB01492
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 09:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5A910E9B9;
	Fri, 11 Jul 2025 07:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="MVDBP+Ml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15567.qiye.163.com (mail-m15567.qiye.163.com
 [101.71.155.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3D910E9B9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 07:27:02 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1bae50b4c;
 Fri, 11 Jul 2025 15:26:58 +0800 (GMT+08:00)
Message-ID: <ec271884-87a1-4117-a7f7-45e423b9de8a@rock-chips.com>
Date: Fri, 11 Jul 2025 15:26:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] drm/exynos: exynos_dp: Remove redundant
 &analogix_dp_plat_data.skip_connector
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-6-damon.ding@rock-chips.com>
 <6306541.2iPT33SAM4@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <6306541.2iPT33SAM4@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0saQ1ZPTxhIHh8aQx1OS0NWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97f86155fa03a3kunm5a905d91f32139
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MC46TRw5ATE0Qh8eE1ZDGTwX
 PEIKCy9VSlVKTE5JSUpDQ0lLSUpNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQk5INwY+
DKIM-Signature: a=rsa-sha256;
 b=MVDBP+MlXmQIBids0j03Vrslb0E7yHyCGuZ7vavVT9bPeByoPFrna+SYZtUEzpKc162OMDNeixdHM2x4Lyi7dBzfmK8GzfH9YcN70K/4VBtbxnDPFtyKHshIarOPguVv7/6s15pne+vD4nRZd1JOoUilcMrtPA7VZP8FsUR2+wQ=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=3f/SyxPB0VfACu7tJD6T5FVMoYuITfLiK8Gntfmm160=;
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

On 2025/7/10 3:58, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Mittwoch, 9. Juli 2025, 09:01:32 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> The &analogix_dp_plat_data.skip_connector related check can be replaced
>> by &analogix_dp_plat_data.bridge.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_dp.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
>> index 9d7d3f009e58..9e1313fdecad 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp.c
>> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
>> @@ -237,7 +237,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
>>   	dp->plat_data.power_off = exynos_dp_poweroff;
>>   	dp->plat_data.attach = exynos_dp_bridge_attach;
>>   	dp->plat_data.get_modes = exynos_dp_get_modes;
>> -	dp->plat_data.skip_connector = !!bridge;
>>   
>>   out:
>>   	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
>>
> 
> I think you might want to merge
> - drm/exynos: exynos_dp: Remove redundant &analogix_dp_plat_data.skip_connector
> - drm/bridge: analogix_dp: Remove redundant &analogix_dp_plat_data.skip_connector
> 
> Because when separate this creates a bisection issue.
> Like when a bisect happens to land directly on this commit, you already have
> removed the exynos assignment, but the updated check from the following patch
> is not yet in place.
> 
> 

Oh, I see. Squashing related commits together would be better.

Best regards,
Damon


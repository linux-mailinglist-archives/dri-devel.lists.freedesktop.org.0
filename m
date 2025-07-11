Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F64B01451
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 09:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEC610E9B5;
	Fri, 11 Jul 2025 07:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Aa+3MMGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973193.qiye.163.com (mail-m1973193.qiye.163.com
 [220.197.31.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E7810E9B5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 07:20:10 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1badf1316;
 Fri, 11 Jul 2025 15:20:05 +0800 (GMT+08:00)
Message-ID: <600f723d-1ec7-4e67-b6f1-316ac8c09235@rock-chips.com>
Date: Fri, 11 Jul 2025 15:20:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] drm/exynos: exynos_dp: Remove
 &exynos_dp_device.ptn_bridge
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
 <20250709070139.3130635-5-damon.ding@rock-chips.com>
 <4596850.bcXerOTE6V@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <4596850.bcXerOTE6V@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkxNSFYaH0NKSk8YGU9PHUJWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97f85b090603a3kunm38f22b26f2f422
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M0k6Ijo*FzE5HR8KEzA*Czwu
 HwowCQtVSlVKTE5JSUpDT0tMT0tCVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSUtPNwY+
DKIM-Signature: a=rsa-sha256;
 b=Aa+3MMGCvohGN1l0oGiN9mPE9+buYJEnl7ehbJtNvS297qP4+L7vINeEZPucXb9o8A4JzLAXyJsHSJEQslBF+pchRkHo/Eum2OyZKRYcPQ6U1nEYgyo+L5wX146JCFtmGeuaa1OuwRzenz3aIxjmbCmDgLQJwoJopLf5Na7YYzg=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=47mqYoiKeZ/zqm9N6N2f/Tu0kYWZlKHaQ/Ixw2H+aSk=;
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

On 2025/7/10 3:55, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Mittwoch, 9. Juli 2025, 09:01:31 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> Use &analogix_dp_plat_data.bridge instead of &exynos_dp_device.ptn_bridge
>> directly.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
>> @@ -155,7 +154,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>>   
>>   	dp->drm_dev = drm_dev;
>>   
>> -	if (!dp->plat_data.panel && !dp->ptn_bridge) {
>> +	if (!dp->plat_data.panel && !dp->plat_data.panel) {
> 
> typo. The second test should be for dp->plat_data.bridge

That was so careless of me! I will fix it in the next version.

> 
> 
>>   		ret = exynos_dp_dt_parse_panel(dp);
>>   		if (ret)
>>   			return ret;
> 
> 
> 
> 
> 

Best regards,
Damon


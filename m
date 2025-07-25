Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C2BB1162F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 04:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA6610E0EE;
	Fri, 25 Jul 2025 02:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="PVnDJ7pq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Fri, 25 Jul 2025 02:02:48 UTC
Received: from mail-m2453.xmail.ntesmail.com (mail-m2453.xmail.ntesmail.com
 [45.195.24.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AD310E0EE
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 02:02:48 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1d303d32a;
 Fri, 25 Jul 2025 09:57:42 +0800 (GMT+08:00)
Message-ID: <b0c9f1cb-1478-4afb-91dd-11c894adb957@rock-chips.com>
Date: Fri, 25 Jul 2025 09:57:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] drm/bridge: analogix_dp: Apply panel_bridge
 helper
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
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-15-damon.ding@rock-chips.com>
 <22774005.EfDdHjke4D@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <22774005.EfDdHjke4D@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a983f4ceb0203a3kunma3621b7ace742
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkhOSVYeSkgYTEofS04eQk9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=PVnDJ7pq+2r+4DMA8NohRlIruBXZ6gKP5DOewVoBX5Ylhaokv+t1PQXA1wz9DlnXhKIviBOFuSFK2az7J1VBnBVWbBLOX/xNfakDiLvSGeqwh0cRkks8NRZt4SoD2Kc/oRP7u314F63JU7vY40c1/YwCIuUlJVv545mfkGqrsn4=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=WLNloxMnqHrVGlM+X06CnaTEpSjYhIn6LZ5vpWKDrB8=;
 h=date:mime-version:subject:message-id:from;
X-HMAIL-Slblob-Mailprops: v1_kTakW7JjryuX/AmUDtQem/B3OxKuePxjilAMswNtGNl+d8SOM9348xuxK/oXXNSZwBcHuiF6t9UjgbNLcz4+KNbbW05FZ4IyRAbd7dk6NaD3SeghwoJx58BAZoH3EGsLJo00KsiNiNgrifg9SLmyS+Fz26TUrJoZQH9P9eLAw/n8hHzbXp+G+UiFTAXkLSLQ7CZngRj9UbbXxieF7xWF9qCtDt+E8N+0rYM03ZnXKLZRaGtijbVeFOqLPDHt9W5d
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

On 2025/7/24 21:08, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Donnerstag, 24. Juli 2025, 10:03:04 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> In order to unify the handling of the panel and bridge, apply
>> panel_bridge helpers for Analogix DP driver. With this patch, the
>> bridge support will also become available.
>>
>> The following changes have ben made:
>> - Apply plane_bridge helper to wrap the panel as the bridge.
>> - Remove the explicit panel APIs calls, which can be replaced with
>>    the automic bridge APIs calls wrapped by the panel.
>> - Unify the API of getting modes to drm_bridge_get_modes().
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> To keep the code bisectable, I think patches 12+13+14 need to be one patch?
> Removing the panel-handling fefore this conversion to the panel-bridge
> would produce a gap, where previously hooked up panels would not work
> if a git bisect lands directly before this patch 14, I think
> 
> 
> Heiko
> 
> 

As expected, patch 12 and patch 13 should remain functionally 
independent. They should be logically self-contained even without patch 
14. Otherwise, patch 14 would need to incorporate those panel operations 
via panel_bridge as well.

Both patch 12 and patch 13 have been independently validated on the 
RK3588S EVB1.

Best regards,
Damon

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3835B11602
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 03:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808A110E11A;
	Fri, 25 Jul 2025 01:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="JhBX+816";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49207.qiye.163.com (mail-m49207.qiye.163.com
 [45.254.49.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D1F10E11A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 01:47:16 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1d2fe2f3d;
 Fri, 25 Jul 2025 09:47:11 +0800 (GMT+08:00)
Message-ID: <0c923b86-e050-4152-abdb-81c05d40c013@rock-chips.com>
Date: Fri, 25 Jul 2025 09:47:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
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
 <20250724080304.3572457-9-damon.ding@rock-chips.com>
 <10694296.nUPlyArG6x@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <10694296.nUPlyArG6x@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a983f434c8003a3kunm70577913ca0a1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUxJT1ZPT04YHkkfT0hCHUJWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=JhBX+8167OtvqHOcu3utBjwzc4uAfcAN6HBMT77ismrywSVOMfk/yJYxo/6Q41/e0eZSW7SmdIYOVGZWDlTIO1gIBtLe91LlUIVo3A8nwIlzt4GezJEw/7GAtyL58OhQ+ics3bwVS1iUyf0R1VpNrWU5SpZUv6p4Z4y6yiMaqnY=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=uEJXYdE6sHQ3QcQ35RAz+8iw/E6lQ+J+vzPB9e0z0ZE=;
 h=date:mime-version:subject:message-id:from;
X-HMAIL-Slblob-Mailprops: v1_kTakW7JjryuX/AmUDtQem15we5fZOytnCjLWsB8oIjlciMWuGxDzbOtxADK+ULRCci231iZzkQ11iU5owAtXbbj5NS8gYL6ixyk+MAWCRxGQXH+bNfD6Ha3aRtowcL2hcB9jxrVPCg5v9f0PQYedLAcNZcGwNn0BdnjZLyBf2moJ4RRxoMTdb1kyZT64AJrpRqyMgl8IMoNEk8nU8Tm7ZNpASXRGaczqNfquYqiXCuK36LH+uEdmkgSaZiU1PbmoYgO1dJ5NfzYTTD0rFPN6Ig==
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

On 2025/7/24 21:00, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Donnerstag, 24. Juli 2025, 10:02:58 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> Apply drm_bridge_connector helper for Analogix DP driver.
>>
>> The following changes have been made:
>> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>>    and &drm_connector_helper_funcs.
>> - Remove unnecessary parameter struct drm_connector* for callback
>>    &analogix_dp_plat_data.attach.
>> - Remove &analogix_dp_device.connector.
>> - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
>>    &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
>> - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
>>    &drm_bridge_funcs.edid_read().
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
>>   static enum drm_connector_status
>> -analogix_dp_detect(struct drm_connector *connector, bool force)
>> +analogix_dp_bridge_detect(struct drm_bridge *bridge)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   	enum drm_connector_status status = connector_status_disconnected;
>>   
>>   	if (dp->plat_data->panel)
> 
> this needs an update to
> 
>   static enum drm_connector_status
> -analogix_dp_bridge_detect(struct drm_bridge *bridge)
> +analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
> 
> to follow Andy's patch [0] that got already applied to drm-misc-next
> 
> Heiko
> 
> 
> [0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5d156a9c3d5ea3dbec192121259dee2c2f938fa1
> 
> 
> 

I will update it in the next version.

Best regards,
Damon


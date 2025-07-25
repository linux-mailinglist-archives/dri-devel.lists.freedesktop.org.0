Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32321B11642
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 04:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCFB10E105;
	Fri, 25 Jul 2025 02:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="KMKARJPJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m32116.qiye.163.com (mail-m32116.qiye.163.com
 [220.197.32.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64CE10E126
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 02:15:11 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1d30daf98;
 Fri, 25 Jul 2025 10:15:07 +0800 (GMT+08:00)
Message-ID: <b0ce0d8d-4ceb-419e-a892-d39b8633aa13@rock-chips.com>
Date: Fri, 25 Jul 2025 10:15:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/14] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
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
 <3890785.kQq0lBPeGt@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <3890785.kQq0lBPeGt@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a983f5cdd0d03a3kunm18dd1a7ad70d9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk8YSlYYQxpJTUhCQk1PSBlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=KMKARJPJW06jkInizHjvIBa2f9dBzLMKkAMK563pYRj3p2h0dxgKuirrWh301Xv0TuGwm0OOTALQT9/UErJ0HweSyG88BuTMnkDSZTAH9b5AoJC+/+Dzp6HROoAHvz1cWYDn25PVnk/mD/yU9OE2aag4cqZ10fbbzaXH1xMcwh4=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=DLYgWqNIFGd0r4HW5nV9IESqFa9QNfwIUAHcBOdrhMg=;
 h=date:mime-version:subject:message-id:from;
X-HMAIL-Slblob-Mailprops: v1_neYYFWAlZzU6u2dlJ0lhZ12aW+i0SsOqX8Rm4Pg6RkfGLZmozKUU6x5A40Hc6yKyC1qlq+80qjSza2Y1HIN2NjdispGaVWjRTqdVEVgpar+crMlubXT8YV6YFLqV35pOqgfo0pUNmuOldDeoBn29b06JcK21G/ewWpdeShWy3g0cixvaTI1/oEdNxNt2mPo7mteEBG69+obILJxlVVK/q66A8wmimTogBggtogTENE1ssc0UsuG6uSxL2BrrUSv2e6Ww7EeM90Xg46l/shQvpw==
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

On 2025/7/24 21:10, Heiko Stübner wrote:
> Am Donnerstag, 24. Juli 2025, 10:02:50 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> PATCH 1 is a small format optimization for struct analogid_dp_device.
>> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>> PATCH 3 is to apply a better API for the encoder initialization.
>> PATCH 4-7 are preparations for apply drm_bridge_connector helper.
>> PATCH 8 is to apply the drm_bridge_connector helper.
>> PATCH 9-11 are to move the panel/bridge parsing to the Analogix side.
>> PATCH 12-13 are preparations for apply panel_bridge helper.
>> PATCH 14 is to apply the panel_bridge helper.
> 
> for future revisions, please provide a changelog on what changed since
> the previous version, I guess ideally here in the cover-letter.
> 
> 
> On my rk3588-tiger-displayport-carrier this works like a charm
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> 
> 
> 
> 

Glad to see your review and test. :-)

I will include the version-to-version changelogs (v2 -> v3 and v3 -> v4) 
in the next iteration.

Best regards,
Damon


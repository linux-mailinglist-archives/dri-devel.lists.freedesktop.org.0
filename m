Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687ADBC720D
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 03:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C2D10E0C0;
	Thu,  9 Oct 2025 01:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="WNdbsaZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m19731112.qiye.163.com (mail-m19731112.qiye.163.com
 [220.197.31.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A8A10E0C0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 01:51:09 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 253d44f19;
 Thu, 9 Oct 2025 09:45:58 +0800 (GMT+08:00)
Message-ID: <ac2b6c11-b3c2-4ecd-a0b3-fafc584425bc@rock-chips.com>
Date: Thu, 9 Oct 2025 09:46:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/18] drm/bridge: Move legacy bridge driver out of imx
 directory for multi-platform use
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-5-damon.ding@rock-chips.com>
 <x2fpm4rb7ermb2tyjefdwwbvwvzt6uosd45ad7ku3tp3yqkmqc@bayzgz3jsqkp>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <x2fpm4rb7ermb2tyjefdwwbvwvzt6uosd45ad7ku3tp3yqkmqc@bayzgz3jsqkp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a99c6a57e3103a3kunmfad084a5a34e64
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkkZGlZNHUxNTBlKSBlJH09WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=WNdbsaZbbltnfB98jhkb8/mQbmF1sAaoVzHqeW9JnKbGUruIhACGVxkCCl91k3GBm68p9ZqogDvjX5tMx77yXn/LSwAAWRdhdh2Af+R1vTKiL8aRbalbQV2uWiC25vNrgQ5aMK8cVPAUcZHFWBzKDp71wr7tro+sAejfj7pfigA=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=U8Lyg1iODEcriIg8AQsHGCBrZHwVaWgFuk2yxIxhxAI=;
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

Hi Dmitry,

On 10/1/2025 4:10 AM, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 05:09:06PM +0800, Damon Ding wrote:
>> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
>> out of imx/ subdir for multi-platform use. The driver is also renamed
>> to make it more generic and suitable for platforms other than i.MX.
>>
>> Additionally, a new API drm_bridge_is_legacy() is added to identify
>> the legacy bridge, allowing specialized handling for such cases.
> 
> Why do you need special handling for it?
> 

As you suggested, I will remove this API and add a temporary flag to the 
Exynos side.

>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/bridge/Kconfig                | 10 ++
>>   drivers/gpu/drm/bridge/Makefile               |  1 +
>>   drivers/gpu/drm/bridge/imx/Kconfig            | 10 --
>>   drivers/gpu/drm/bridge/imx/Makefile           |  1 -
>>   .../gpu/drm/bridge/imx/imx-legacy-bridge.c    | 91 -----------------
>>   drivers/gpu/drm/bridge/legacy-bridge.c        | 99 +++++++++++++++++++
>>   drivers/gpu/drm/imx/ipuv3/Kconfig             |  4 +-
>>   drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |  6 +-
>>   drivers/gpu/drm/imx/ipuv3/parallel-display.c  |  4 +-
>>   include/drm/bridge/imx.h                      | 17 ----
>>   include/drm/bridge/legacy-bridge.h            | 18 ++++
>>   11 files changed, 135 insertions(+), 126 deletions(-)
>>   delete mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
>>   create mode 100644 drivers/gpu/drm/bridge/legacy-bridge.c
>>   delete mode 100644 include/drm/bridge/imx.h
>>   create mode 100644 include/drm/bridge/legacy-bridge.h
> 
> I'm slightly concerned with the name of 'legacy drm bridge', It was fine
> for 'i.MX legacy', but now it might be a bit of overkill. Maybe
> something like drm_display_mode or drm_of_display_mode bridge?
> 

The 'drm_of_display_mode_bridge' is more descriptive. Compared to that, 
the 'legacy-bridge' is somewhat ambiguous.

Apologies for the delayed reply as I was on vacation. ;-)

Best regards,
Damon


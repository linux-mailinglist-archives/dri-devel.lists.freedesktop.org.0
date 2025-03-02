Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E5A4B01C
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 08:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4CD10E0DE;
	Sun,  2 Mar 2025 07:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Aqh6ofGa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3288.qiye.163.com (mail-m3288.qiye.163.com
 [220.197.32.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7081C10E0DE
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 07:15:35 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id ca138e88;
 Sun, 2 Mar 2025 15:15:30 +0800 (GMT+08:00)
Message-ID: <f835a852-24b8-4279-8e4b-42517d694493@rock-chips.com>
Date: Sun, 2 Mar 2025 15:15:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/15] drm/bridge: analogix_dp: Remove the unnecessary
 calls to clk_disable_unprepare() during probing
To: Doug Anderson <dianders@chromium.org>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 boris.brezillon@collabora.com, l.stach@pengutronix.de,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
 <20250224081325.96724-5-damon.ding@rock-chips.com>
 <CAD=FV=X7iWOyAvdfRDyFA9kdr+utU_aAaJ5F7nAsaHp2fMQgVw@mail.gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <CAD=FV=X7iWOyAvdfRDyFA9kdr+utU_aAaJ5F7nAsaHp2fMQgVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUhPQlYZTx9PSh0YTx4ZSUJWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9555b5c2df03a3kunmca138e88
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pjo6Lgw6CzIKHUsaFQsLF0tL
 OBUKCU9VSlVKTE9LQ0JCTEhKQ01CVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJS0hJNwY+
DKIM-Signature: a=rsa-sha256;
 b=Aqh6ofGacuT+B/WiOkyQRxEZYkd5NWw7bNn++OmrLNSFR5Y2zQSQ6S4knhbwrlYkwPve/ppWG4WrEx6B3hdO/jgE+1l3hEYxMT3Ah6BXdq2v3svwOMcgcj3L9US+GjHWVgNzBiTwKuNOceJpI6UFEEg1IWwgUjUnBrgLUK7S/mM=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=8d5ejZu4ZY9Y9Zh2+eVlwxl7XvRzlgNDw9s/Y5LNOs0=;
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

Hi Doug,

On 2025/2/25 9:40, Doug Anderson wrote:
> Hi,
> 
> On Mon, Feb 24, 2025 at 12:14 AM Damon Ding <damon.ding@rock-chips.com> wrote:
>>
>> With the commit f37952339cc2 ("drm/bridge: analogix_dp: handle clock via
>> runtime PM"), the PM operations can help enable/disable the clock. The
>> err_disable_clk label and clk_disable_unprepare() operations are no
>> longer necessary because the analogix_dp_resume() will not be called
>> during probing.
>>
>> Fixes: f37952339cc2 ("drm/bridge: analogix_dp: handle clock via runtime PM")
> 
> When possible "Fixes" should be pushed to the start of your series so
> it's obvious they have no dependencies when being picked to stable
> kernels. That should be possible here.
> 
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++++-------------
>>   1 file changed, 5 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index e23af674d91c..d9dafb038e7a 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1608,10 +1608,8 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>>          res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>
>>          dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
> 
> There is a context conflict when I apply to drm-misc-next because of
> commit 43c00fb1a518 ("drm/bridge: analogix_dp: Use
> devm_platform_ioremap_resource()"). You probably should rebase and
> re-apply.
> 
> Aside from the context conflict, this looks great to me:
> 
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> 

After rebasing, I found the conflict. I will move this patch to a 
separate series and ensure it has no dependencies.

Best regards
Damon


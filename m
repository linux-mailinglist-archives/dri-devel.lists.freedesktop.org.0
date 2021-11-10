Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D3444BBF8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 08:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ACD6FF9E;
	Wed, 10 Nov 2021 07:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE056FF9E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 07:12:38 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F167E8BB;
 Wed, 10 Nov 2021 08:12:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636528356;
 bh=ZwBxE70dRrKURPed6R+qPwS+SvLdIxA4HAckIX1C/kM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LfKu564aiaOMmC7UUDER0mebN9GCJRy6WgohmXUSJMp9op36l48jCR9sTmdQCE2mr
 5mSGwIQaw+1Oq07FFAZ6/tmX0JuST8eBBfwR35HPAJgpc1n98uK0/NtWf747tVsCyN
 oxh5scw4bO9Rfhn4WAUnkN64FmUD1mv1bOZzdXHM=
Subject: Re: [PATCH] drm/bridge: cdns-dsi: Make sure to to create proper
 aliases for dt
To: Nishanth Menon <nm@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
References: <20210921174059.17946-1-nm@ti.com>
 <20211109145538.fh3vsfnvfvvmcovb@automated>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <324d3d79-3ab2-f8ee-2a21-14d24f72fdce@ideasonboard.com>
Date: Wed, 10 Nov 2021 09:12:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109145538.fh3vsfnvfvvmcovb@automated>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Milind Parab <mparab@cadence.com>, r-ravikumar@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nikhil.nd@ti.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2021 16:55, Nishanth Menon wrote:
> On 12:40-20210921, Nishanth Menon wrote:
>> Add MODULE_DEVICE_TABLE to the device tree table to create required
>> aliases needed for module to be loaded with device tree based platform.
>>
>> Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
>> Signed-off-by: Nishanth Menon <nm@ti.com>
>> ---
>>   drivers/gpu/drm/bridge/cdns-dsi.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
>> index d8a15c459b42..829e1a144656 100644
>> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
>> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
>> @@ -1284,6 +1284,7 @@ static const struct of_device_id cdns_dsi_of_match[] = {
>>   	{ .compatible = "cdns,dsi" },
>>   	{ },
>>   };
>> +MODULE_DEVICE_TABLE(of, cdns_dsi_of_match);
>>   
>>   static struct platform_driver cdns_dsi_platform_driver = {
>>   	.probe  = cdns_dsi_drm_probe,
>> -- 
>> 2.32.0
>>
>>
> 
> Hi, Ping?
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

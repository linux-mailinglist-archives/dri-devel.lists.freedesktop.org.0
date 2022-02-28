Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE34C65CB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 10:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BFC10E275;
	Mon, 28 Feb 2022 09:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0001810E275
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 09:39:08 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8936478;
 Mon, 28 Feb 2022 10:39:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646041145;
 bh=PFehvEiXF30wC6an5vLf49LvGgKwjVvaSRlxJwK8Wz8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tf1SqDGUh31iiqRENKsA94L2Q7hIhz1Khg1tyh8b5cW4OAkSjrK1Qt1imNYjxjXVZ
 ZLmmrI6BPCEdCCUuDNHkwGt5dG51E7PATkiMTYg7ZSsc4JgxI3J6lEAl0p2XvgNwsn
 aupS7baEUiVvyvPqNRiJYQNjWKjjuikBn2eNWnoM=
Message-ID: <613c0fc8-8cad-ef38-a47d-794b08b1a083@ideasonboard.com>
Date: Mon, 28 Feb 2022 11:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/bridge: cdns-dsi: Make sure to to create proper
 aliases for dt
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
References: <20210921174059.17946-1-nm@ti.com>
 <20211109145538.fh3vsfnvfvvmcovb@automated>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20211109145538.fh3vsfnvfvvmcovb@automated>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Thanks, I'll apply to drm-misc-next.

  Tomi

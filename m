Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 073D938FFAE
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 13:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9726E9F2;
	Tue, 25 May 2021 11:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 469 seconds by postgrey-1.36 at gabe;
 Tue, 25 May 2021 09:37:14 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CBB6E9DD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 09:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1621935438; x=1653471438;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=PNtSVoFGvQfnAIpiiUi+iXcvVNJqpwQgjDgGgtw17jA=;
 b=BhS0auPK8bqPtE39JtWtDW5rZ9IPg1pDLUa1UzDPxVPdthhOf+qKHAFx
 cR6B8d/P9ncuDejrnlWMipUE5irgscSxsQzy9+TGJmYNnaxuyM3+Z743l
 MML0so7T+t/p93dWZ928fh4NIm0xSskIKi9U+H1DFyiq2bbrTd4AE4tjg
 qQk+mOVhsPNs4sIwtnDn09KHQf34jeewy688nA8Sx9u3zEEb0XybriHMi
 QsHxumFLSUMNSR8X/Oab4yomYgNDMDAeYd+28IT2fmk2lRHy78YhXrZWw
 IpDrmKZRmVBELS942S9YJ89cWmxsLZIZY/YbLYBcmndLTOcpXNmLsPA76 g==;
IronPort-SDR: oVFErXGWnMpgDMPxjuargxQbDAEdCErqM7QMOzVj2hFdWabAee0XBW4ltcKoUhBJC3cGmXnhRI
 6pDuIxd6W+3v2kfcjmkJ7Eta8ka63okHwmDsu4zK0sgaZS8UXka8tQzSHM8aBEmhE1C2A8JNmb
 WxGRLO0T+7n2/m4NPHdcC4E6ESVcKwphaoOATPDaD5oKZXJ6Dh/i5uzkcBxxmyoamfDziNF7xx
 sTXEd0u81tEMT7L/VjHcLLnez6S8rRciHZULmgbASWFrIXmOiW5U7LRwB7qGzMTKBja9f2rD+z
 XB4=
X-IronPort-AV: E=Sophos;i="5.82,328,1613458800"; d="scan'208";a="129362978"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 May 2021 02:29:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 02:29:18 -0700
Received: from [10.12.74.7] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 25 May 2021 02:29:16 -0700
Subject: Re: [PATCH] drm/atmel-hlcdc: Allow async page flips
To: Sam Ravnborg <sam@ravnborg.org>, Dan Sneddon - C50748
 <Dan.Sneddon@microchip.com>
References: <20210330151721.6616-1-dan.sneddon@microchip.com>
 <20210409105816.cfffdr3edzi4yntm@sekiro>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <088b0446-85c2-2d87-0439-a0cc14772c6a@microchip.com>
Date: Tue, 25 May 2021 11:29:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409105816.cfffdr3edzi4yntm@sekiro>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 25 May 2021 11:03:16 +0000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris
 Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ludovic Desroches - M43218 <Ludovic.Desroches@microchip.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/04/2021 at 12:58, Ludovic Desroches - M43218 wrote:
> On Tue, Mar 30, 2021 at 08:17:20AM -0700, Dan Sneddon wrote:
>> The driver is capable of doing async page flips so we need to tell the
>> core to allow them.
>>
>> Signed-off-by: Dan Sneddon <dan.sneddon@microchip.com>
> Tested-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Sam,

Do you need more from us or can you queue this patch (aka "ping")?

Best regards,
   Nicolas

>> ---
>>
>>   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> index 871293d1aeeb..f6c3d8809fd8 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> @@ -686,6 +686,7 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
>>   	dev->mode_config.max_width = dc->desc->max_width;
>>   	dev->mode_config.max_height = dc->desc->max_height;
>>   	dev->mode_config.funcs = &mode_config_funcs;
>> +	dev->mode_config.async_page_flip = true;
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.17.1
>>


-- 
Nicolas Ferre

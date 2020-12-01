Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5E12CA164
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 12:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE706E4D4;
	Tue,  1 Dec 2020 11:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29E689DD5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 11:33:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1BXGRF047173;
 Tue, 1 Dec 2020 05:33:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606822396;
 bh=sAQwRiuN5i2YI0e2yMEhA92FjOymkSWgwWd0eHAtf6c=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Kz61VlO5hF23KXTkMsEdik+jXpAxdZUliYtkyc8bEACUd+RNP04AmSPaKN64R97xw
 keeMYaySgoXDl6+9kcCG6JoCeNlTElprPsSGSlAsqZaEJsifXHNKM7TKqgXK1drXiT
 Wa16xMigPE715kFKbZ2UnRg6HceKbvXKEWYnSKEA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1BXGL7046620
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 05:33:16 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 05:33:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 05:33:15 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1BXDac068468;
 Tue, 1 Dec 2020 05:33:14 -0600
Subject: Re: [PATCH v4 70/80] drm/panel: panel-dsi-cm: drop unneeded includes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-71-tomi.valkeinen@ti.com>
 <20201201002740.GO25713@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <dd3b7430-52f9-34a4-e6c8-ec0044d4bd26@ti.com>
Date: Tue, 1 Dec 2020 13:33:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201002740.GO25713@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/12/2020 02:27, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Nov 24, 2020 at 02:45:28PM +0200, Tomi Valkeinen wrote:
>> Drop unneeded includes.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  drivers/gpu/drm/panel/panel-dsi-cm.c | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
>> index ec87b785871f..91ed8237a1c2 100644
>> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
>> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
>> @@ -9,12 +9,7 @@
>>  #include <linux/backlight.h>
>>  #include <linux/delay.h>
>>  #include <linux/gpio/consumer.h>
>> -#include <linux/interrupt.h>
> 
> This could go to the patch that moves TE handling to the code.

True.

>>  #include <linux/jiffies.h>
>> -#include <linux/module.h>
> 
> I'd keep module.h as you use macros it defines, and we shouldn't depend
> in indirect includes.

Ok.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

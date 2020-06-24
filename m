Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0FC20752C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 16:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BD16EB59;
	Wed, 24 Jun 2020 14:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2546EB59
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 14:03:34 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200624140333euoutp013dab289cf33852405bcdd36fe72e926f~bf81TCvzK1597915979euoutp01A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 14:03:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200624140333euoutp013dab289cf33852405bcdd36fe72e926f~bf81TCvzK1597915979euoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593007413;
 bh=wHOpM6p1smrfIUtajHAHSHxwW0Frk+zyQPrh22NGEIY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=CGWqSZB0Cfmdm+kGD5atAnZ2IyydqLfobCmqconi6oHNOJDKN2k/ovTmpRFA3AGsg
 b5X7uhvwqWuPDE2Gu7CUW4EDmcgc7vyNs68S2NtX1faaINGIjfjc6twn3vEypF7ctJ
 hxzgDMx4aiH7HtIOgTA/Fc/MEy3+l9YOzeY6mhgI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200624140332eucas1p1c3615a6bba3ac794b9c90ece63d1eb96~bf807NQzY0466904669eucas1p17;
 Wed, 24 Jun 2020 14:03:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 29.41.06318.43D53FE5; Wed, 24
 Jun 2020 15:03:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200624140332eucas1p23cf9408fda975d3ed90fbb8ba08e0ab5~bf80lyI2S3113231132eucas1p2E;
 Wed, 24 Jun 2020 14:03:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200624140332eusmtrp1b4cdea98165e506c4d9b2c982390fe88~bf80k7syW0595605956eusmtrp1K;
 Wed, 24 Jun 2020 14:03:32 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-15-5ef35d3407ed
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9F.E8.06017.43D53FE5; Wed, 24
 Jun 2020 15:03:32 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200624140331eusmtip16ccf9b7563979e8bfadd5e8baccc3f75~bf8zuvRLG0578505785eusmtip10;
 Wed, 24 Jun 2020 14:03:31 +0000 (GMT)
Subject: Re: [RESEND PATCH v5 5/5] drm/bridge: lvds-codec: simplify error
 handling code
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <e5f9ecbb-a372-5007-f1df-ba7bfd37ded1@samsung.com>
Date: Wed, 24 Jun 2020 16:03:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200624133312.GC5980@pendragon.ideasonboard.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfSxVcRjH97vn3HMOczku7T67UetutZiSaDurRskfZ8rWVm29DJ1yUsu9
 dC8KfyBp3qdMt3uxzMtI2s17bNKuihhTZEp1MyYsVF6iZDkOy3+f3/P9Ps/zfbYfhcknpUrq
 iiaS12q4MBVhjde/Wuze5RU4E7Sn4sN2Zjy7FTFV901SJndohGD65qYJJqnYRDDvfo1jzOtv
 73Am9U4JyVQP90uZ3qZ8gjHnNiPm8YtPJGPOOscUzOZih2zZ3v43GDs9kEyyjcZPJJuXYpCy
 1RWpBNue/VbCthRUkqwlvU3C1pTEs1m1FYh9npmDszPVW47bnLU+GMKHXYnmte7e560vd7fr
 pRFjdjeWn90jEtCyTRqyooD2gmLTcySwnC5HMGW4lIasV3gWQfnYICYKMwgyWy6uNxR2lUlE
 UxmCodHmtcc0gvmvP1dHOdBnoM/wiBTYkWYgs0iPBBNGV+HwcvgzIQgE7QJ/a96vsoz2hu/m
 XGkaoiic3g6fm1fnbKIDIcMygYkWe3htGMEFtqJ9QN87sMoYvRUaJvMxkRVwc/ahVNgFtIGC
 5KRbmBjbDzJn0iQiO8BEWy0pshN05mTgIseDpVzwC80pCOqeNK41H4CP3b8JIRy2EtrU5C6W
 D8NUoYUUykDbwsCkvZjBFu7W6zGxLIOU23LRvQ0sXXVrAxVQ2jNHZCOVccNlxg3XGDdcY/y/
 txDhFUjBR+nUobzOU8Nf363j1LooTejui+HqarTyCTuX2+aeomdLF8yIppDKRvbky48guZSL
 1sWozQgoTOUo8+3qDJLLQriYWF4bHqyNCuN1ZrSZwlUKmWfReKCcDuUi+as8H8Fr11UJZaVM
 QO2VHh0XDOf8eh627fdb0KQ/aCDc/BPrB087lvkHdMiUZ3f67Ag+pjy6QO/z9TD6Zc86L3bk
 1bXGVY5wTn+WpowN5XqfedcgTt0iiwvocb2W6HjSqdOpcSpktNtN60Z6K/WlJ6JdSrLSPfv1
 lPPTgtEjfaY+F7u9hpLYadMpRbsK113mPFwxrY77Bzw/XD6AAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleLIzCtJLcpLzFFi42I5/e/4XV2T2M9xBld28Fm8nHCY0WLjjPWs
 FlMfPmGzuPL1PZtF8+L1bBZXv79ktjj55iqLRefEJewWmx5fY7W4vGsOm8WhqXsZLdYeuctu
 cagv2mLul6nMDnwel69dZPZ4f6OV3WPnrLvsHrM7ZrJ6bFrVyeZxYsIlJo/9c9ewe9zvPs7k
 sXlJvUffllWMHgd6J7N4fN4kF8ATpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtl
 ZKqkb2eTkpqTWZZapG+XoJdx7sR01oIX/BX/9k1ja2D8x9PFyMkhIWAiseDsciYQW0hgKaPE
 pSWJEHFxid3z3zJD2MISf651sUHUvGWUOH/LA8QWFoiUuDJzNTuILSJgIdG7aDpjFyMXB7PA
 VhaJ3/smgTlCAu8YJWa3vgXrZhPQlPi7+SaYzStgJ/Hh0FTWLkYODhYBVYl7exlBwqICsRLd
 i3+wQ5QISpyc+YQFxOYUsJeYfvkGmM0sYCYxb/NDZghbXmL72zlQtrhE05eVrBMYhWYhaZ+F
 pGUWkpZZSFoWMLKsYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIz9bcd+btnB2PUu+BCjAAej
 Eg/vhgcf44RYE8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEU6LeJzFKiyfnA
 tJRXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoGxtpR/091Aq/yl
 hY8nWIWVXhF+u2dvDZet90Hj48pvUi6sYw1+wad2XeX9e7XCSdUZV2e0LMuRbp06+fbT9CsZ
 f56+Wm7t8TXn/fc5rxZInz3GsvYNg5LTBN/IixdCd213cbuYcmRunFPYk7T1Ikq6Nr7JiZ7V
 evriBYHz4zyFk9YnHuVyWLxFiaU4I9FQi7moOBEA/rWx7xMDAAA=
X-CMS-MailID: 20200624140332eucas1p23cf9408fda975d3ed90fbb8ba08e0ab5
X-Msg-Generator: CA
X-RootMTR: 20200624114138eucas1p262505da3ad1067720080d20209ff32de
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200624114138eucas1p262505da3ad1067720080d20209ff32de
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114138eucas1p262505da3ad1067720080d20209ff32de@eucas1p2.samsung.com>
 <20200624114127.3016-6-a.hajda@samsung.com>
 <20200624133312.GC5980@pendragon.ideasonboard.com>
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
Cc: andy.shevchenko@gmail.com, Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24.06.2020 15:33, Laurent Pinchart wrote:
> Hi Andrzej,
>
> On Wed, Jun 24, 2020 at 01:41:27PM +0200, Andrzej Hajda wrote:
>> Using probe_err code has following advantages:
>> - shorter code,
>> - recorded defer probe reason for debugging,
>> - uniform error code logging.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>   drivers/gpu/drm/bridge/lvds-codec.c | 9 ++-------
>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
>> index 24fb1befdfa2..c76fa0239e39 100644
>> --- a/drivers/gpu/drm/bridge/lvds-codec.c
>> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
>> @@ -71,13 +71,8 @@ static int lvds_codec_probe(struct platform_device *pdev)
>>   	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
>>   	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
>>   							     GPIOD_OUT_HIGH);
>> -	if (IS_ERR(lvds_codec->powerdown_gpio)) {
>> -		int err = PTR_ERR(lvds_codec->powerdown_gpio);
>> -
>> -		if (err != -EPROBE_DEFER)
>> -			dev_err(dev, "powerdown GPIO failure: %d\n", err);
>> -		return err;
>> -	}
>> +	if (IS_ERR(lvds_codec->powerdown_gpio))
>> +		return probe_err(dev, lvds_codec->powerdown_gpio, "powerdown GPIO failure\n");
> Line wrap please.


I hoped that with latest checkpatch line length limit increase from 80 
to 100 it is acceptable :) but apparently not [1].

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144


>
> It bothers me that the common pattern of writing the error code at the
> end of the message isn't possible anymore. Maybe I'll get used to it,
> but it removes some flexibility.


Yes, but it gives uniformity :) and now with %pe printk format it 
changes anyway.


Regards

Andrzej


>
>>   
>>   	/* Locate the panel DT node. */
>>   	panel_node = of_graph_get_remote_node(dev->of_node, 1, 0);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

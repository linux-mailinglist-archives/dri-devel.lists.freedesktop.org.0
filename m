Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FBA1CBF90
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 11:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071F46E312;
	Sat,  9 May 2020 09:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m176150.mail.qiye.163.com (m176150.mail.qiye.163.com
 [59.111.176.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3926E1F2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 08:44:57 +0000 (UTC)
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
 by m176150.mail.qiye.163.com (Hmail) with ESMTP id 4293E1A3189;
 Fri,  8 May 2020 16:44:20 +0800 (CST)
Message-ID: <AEMAEgD6CFDEXGkP4OWX94rO.3.1588927460255.Hmail.bernard@vivo.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gZHJtL2V4eW5vczogcmVtb3ZlIG5vIG5lZWQgZGV2bV9rZnJlZSBpbiBwcm9iZSBbcmUtc2VuZCwgd2VsY29tZSBhbnkgY29tbWVudHNd?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 157.0.31.122
In-Reply-To: <20200508075210.GA8789@ravnborg.org>
MIME-Version: 1.0
Received: from bernard@vivo.com( [157.0.31.122) ] by ajax-webmail (
 [127.0.0.1] ) ; Fri, 8 May 2020 16:44:20 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Fri, 8 May 2020 16:44:20 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSFVNQk1LS0tLQkJKQ0lKSFlXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUhMTU5ITkNJTUJKN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6PjY6Phw*TTg9Pz4jPBArTzQsI0JPCTRVSFVKTkNDQklMT01OSE1JVTMWGhIXVRkeCRUaCR87
 DRINFFUYFBZFWVdZEgtZQVlKTkxVS1VISlVKSUlZV1kIAVlBTUlPSjcG
X-HM-Tid: 0a71f374f3bc93b4kuws4293e1a3189
X-Mailman-Approved-At: Sat, 09 May 2020 09:04:57 +0000
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
Cc: opensource.kernel@vivo.com, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



From: Sam Ravnborg <sam@ravnborg.org>
Date: 2020-05-08 15:52:10
To:  Bernard <bernard@vivo.com>
Cc:  Inki Dae <inki.dae@samsung.com>,Joonyoung Shim <jy0922.shim@samsung.com>,Seung-Woo Kim <sw0312.kim@samsung.com>,Kyungmin Park <kyungmin.park@samsung.com>,David Airlie <airlied@linux.ie>,Daniel Vetter <daniel@ffwll.ch>,Kukjin Kim <kgene@kernel.org>,Krzysztof Kozlowski <krzk@kernel.org>,dri-devel@lists.freedesktop.org,linux-arm-kernel@lists.infradead.org,linux-samsung-soc@vger.kernel.org,linux-kernel@vger.kernel.org,opensource.kernel@vivo.com
Subject: Re: [PATCH] drm/exynos: remove no need devm_kfree in probe [re-send, welcome any comments]>Hi Bernard.
>
>On Wed, May 06, 2020 at 08:49:03PM +0800, Bernard wrote:
>> Remove no need devm_kfree in probe.
>> The change is to make the code a bit more readable
>> 
>> Signed-off-by: Bernard Zhao <bernard@vivo.com>
>
>Could you take a closer look and fix similar patterns
>in the rest of the driver?
>For example in exynos_dpi_probe()
>
>Is would be nice to only have to review for this
>type of changes once, so one patch-set is preferred
>over single patches over time.
>
>You can add:
>Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
>to this patch when you re-send a new series.
>
>Thanks,
>	Sam

Hi
Sure, this is also a good chance for me to learn this code.
I will re-check this part of the exynos driver code to see 
if there are similar patterns, and then re-send a patch series.

Regards,
Bernard

>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_dpi.c | 10 +++-------
>>  1 file changed, 3 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
>> index 43fa0f26c052..e06f7d7a6695 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
>> @@ -181,10 +181,8 @@ static int exynos_dpi_parse_dt(struct exynos_dpi *ctx)
>>  			return -ENOMEM;
>>  
>>  		ret = of_get_videomode(dn, vm, 0);
>> -		if (ret < 0) {
>> -			devm_kfree(dev, vm);
>> +		if (ret < 0)
>>  			return ret;
>> -		}
>>  
>>  		ctx->vm = vm;
>>  
>> @@ -233,10 +231,8 @@ struct drm_encoder *exynos_dpi_probe(struct device *dev)
>>  	ctx->dev = dev;
>>  
>>  	ret = exynos_dpi_parse_dt(ctx);
>> -	if (ret < 0) {
>> -		devm_kfree(dev, ctx);
>> -		return NULL;
>> -	}
>> +	if (ret < 0)
>> +		return ERR_PTR(ret);
>>  
>>  	if (ctx->panel_node) {
>>  		ctx->panel = of_drm_find_panel(ctx->panel_node);
>> -- 
>> 2.26.2
>> 
>> 
>> [re-send, welcome any comments]
>> Regards,
>> Bernard
>> 
>> 
>> 
>> 
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

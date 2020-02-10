Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE50A157108
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374216E944;
	Mon, 10 Feb 2020 08:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A146E944
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 08:49:45 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200210084943euoutp0195c68fd39f78b87aed46f1a45eccdc26~x-lSO7xMm0360403604euoutp01g
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 08:49:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200210084943euoutp0195c68fd39f78b87aed46f1a45eccdc26~x-lSO7xMm0360403604euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1581324583;
 bh=VYnf6oG6WiY9tx3YEp3feJ9GxMUAC6NQ8rnNbKufyUA=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=Hcdz1jPQvewNOWuTEUBFJoIT1K74GmjjxVZzEG5s4n4koftT/jA/RG/7Cwn2lmMUY
 fZGejaUfPWILjV+3m9WlO1OFf3aP+KG7EuLMt4my0T73duX/Bex+a/0JObdDYAMm+C
 Yqs4JIW/vtMKvshlOeKbFpwP99MfGliXKZDSXRq0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200210084943eucas1p2ce4c411bfbfe4445978b2e20409bffa5~x-lSAqEsu1702317023eucas1p2V;
 Mon, 10 Feb 2020 08:49:43 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 91.64.60679.629114E5; Mon, 10
 Feb 2020 08:49:43 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200210084942eucas1p1c8ea97f272a6cb24849d238cba213a39~x-lRotqwT1844918449eucas1p1r;
 Mon, 10 Feb 2020 08:49:42 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200210084942eusmtrp209d2a4290c22495506338d7988f82e4c~x-lRoG2IE3047230472eusmtrp2N;
 Mon, 10 Feb 2020 08:49:42 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-92-5e411926a7d2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 2B.9A.07950.629114E5; Mon, 10
 Feb 2020 08:49:42 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200210084942eusmtip250a906928cd393dcd01622feec2b126b~x-lRR3Img2708727087eusmtip2V;
 Mon, 10 Feb 2020 08:49:42 +0000 (GMT)
Subject: Re: [PATCH v2] drm/bridge: tfp410: add pclk limits
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <narmstrong@baylibre.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <58e2b0d6-0e18-d2e0-d139-835d22b3a364@samsung.com>
Date: Mon, 10 Feb 2020 09:49:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <123befc8-8c57-4718-c23d-1bec9cf55ef4@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djPc7rqko5xBiduM1pc+fqezaJz4hJ2
 i0N90Rbr599ic2DxeH+jld1jdsdMVo/73ceZPI7f2M4UwBLFZZOSmpNZllqkb5fAlTHpyVHG
 gl08FZOfTWZsYGzh6mLk5JAQMJF4f+84G4gtJLCCUeLyc+EuRi4g+wujxNdDi1kgnM+MEj83
 3GWG6bj28gIjRGI5o8SRg5eYIJy3jBIbuq6xgFQJC1hLNFx7ywRiiwisZ5S402EDYrMJaEr8
 3XwTbB+vgJ3E4y/fwKayCKhKvH6zlBXEFhWIkHhy5TErRI2gxMmZT8BmcgpYSVw91gM2k1lA
 XmL72znMELa4xK0n88GOkBBoZ5c4d6ePFeJUF4mXt3ugzhaWeHV8CzuELSPxf+d8Jgi7XuL+
 ihZmiOYORomtG3ZCNVhL3Dn3C+hSDqANmhLrd+lDhB0l7rxsZgUJSwjwSdx4KwhxA5/EpG3T
 mSHCvBIdbUIQ1YoS989uhRooLrH0wlc2CNtD4uCMNYwTGBVnIflyFpLPZiH5bBbCDQsYWVYx
 iqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEppbT/45/2cG460/SIUYBDkYlHl4He4c4IdbE
 suLK3EOMEhzMSiK8faq2cUK8KYmVValF+fFFpTmpxYcYpTlYlMR5jRe9jBUSSE8sSc1OTS1I
 LYLJMnFwSjUwGpvG/F/2TFYiQFPdMWXZup9rteLNuA/8+OvbmtTyZ23arjdJq89NK+7Zx/pt
 +WJWjrMsl3oKfS1i5zwyS6y+6HfC5PWe854WZ7+HuDW08ov4XikNKY/gPhPz7mW6iHSgPV/+
 8lnLrOb8ehMffP79JZFSycZnkcF+C69JvO0XOmdit1MvwG6TEktxRqKhFnNRcSIAWxk4ECkD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsVy+t/xe7pqko5xBhfWKVlc+fqezaJz4hJ2
 i0N90Rbr599ic2DxeH+jld1jdsdMVo/73ceZPI7f2M4UwBKlZ1OUX1qSqpCRX1xiqxRtaGGk
 Z2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5eglzHpyVHGgl08FZOfTWZsYGzh6mLk5JAQ
 MJG49vICYxcjF4eQwFJGia0frjNBJMQlds9/ywxhC0v8udbFBlH0mlHixL33rCAJYQFriYZr
 b5lAEiIC6xklzm+7zg5R9ZZRYsHZO2DtbAKaEn8332QDsXkF7CQef/kGFmcRUJV4/WYp2CRR
 gQiJt79vskLUCEqcnPmEBcTmFLCSuHqsB+wkZgF1iT/zLjFD2PIS29/OgbLFJW49mc80gVFw
 FpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzAyNl27OeWHYxd74IP
 MQpwMCrx8DrYO8QJsSaWFVfmHmKU4GBWEuHtU7WNE+JNSaysSi3Kjy8qzUktPsRoCvTcRGYp
 0eR8YFTnlcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgdLO1893S
 933q3WiT2U466yOZXN/6pvzu4++68qkqXzZq5R73jS0fjauTXBOuV3oIfeI8rD99xeeuF988
 CxgybBcefilZ+/21ovWVfo5JxyzsYtjSNvuWpKpl8KYYS3PebVOaUStWubJIwE7ZvH7vxwjH
 6t8X6jbcE72oe3Zi6BneilsvYn8qsRRnJBpqMRcVJwIA/Z0/mLICAAA=
X-CMS-MailID: 20200210084942eucas1p1c8ea97f272a6cb24849d238cba213a39
X-Msg-Generator: CA
X-RootMTR: 20200210082202eucas1p25526395f284a3518d6486faefd9361cc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200210082202eucas1p25526395f284a3518d6486faefd9361cc
References: <20200113134528.9851-1-tomi.valkeinen@ti.com>
 <20200121094655.9092-1-tomi.valkeinen@ti.com>
 <CGME20200210082202eucas1p25526395f284a3518d6486faefd9361cc@eucas1p2.samsung.com>
 <123befc8-8c57-4718-c23d-1bec9cf55ef4@ti.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.02.2020 09:21, Tomi Valkeinen wrote:
> Hi Andrzej,
>
> On 21/01/2020 11:46, Tomi Valkeinen wrote:
>> Add pixel clock limits to the driver as per TFP410 datasheet: min 25MHz,
>> max 165MHz.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/bridge/ti-tfp410.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
>> index 6f6d6d1e60ae..108e8cd7ab68 100644
>> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
>> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
>> @@ -167,10 +167,23 @@ static void tfp410_disable(struct drm_bridge *bridge)
>>   	gpiod_set_value_cansleep(dvi->powerdown, 1);
>>   }
>>   
>> +static enum drm_mode_status tfp410_mode_valid(struct drm_bridge *bridge,
>> +					      const struct drm_display_mode *mode)
>> +{
>> +	if (mode->clock < 25000)
>> +		return MODE_CLOCK_LOW;
>> +
>> +	if (mode->clock > 165000)
>> +		return MODE_CLOCK_HIGH;
>> +
>> +	return MODE_OK;
>> +}
>> +
>>   static const struct drm_bridge_funcs tfp410_bridge_funcs = {
>>   	.attach		= tfp410_attach,
>>   	.enable		= tfp410_enable,
>>   	.disable	= tfp410_disable,
>> +	.mode_valid	= tfp410_mode_valid,
>>   };
>>   
>>   static void tfp410_hpd_work_func(struct work_struct *work)
>>
> Is this ok to merge?


Yes, If I remember you have merge rights. If not, let me know.


Andrzej


>
>   Tomi
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

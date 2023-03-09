Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F406B283C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 16:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7911C10E0F5;
	Thu,  9 Mar 2023 15:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D84410E0F5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 15:06:29 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230309150627euoutp0260938db90e0d578ca19362b8a50c876a~KyJzx063A1247912479euoutp02X
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 15:06:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230309150627euoutp0260938db90e0d578ca19362b8a50c876a~KyJzx063A1247912479euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1678374387;
 bh=w/5ccIvt981fYFEPcr0iYcAkmWG0oM6tbsViHkMWFU0=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=JNNWxbYCYAXC+5WyQ9Dm3BaLAZny54F1j8Gp+GNi3hpV0ESDRRogNe7VY4gR3G2iq
 vr1iIOu5cBsDSxVvFeG9e9mQccgPL3ERfUPzPspaK9zS+qx+uw7HitpBHdDDUm69w3
 /n/+l63l8NmN011oZ0Xw296KkEp1nSBJRaeyKKBw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230309150627eucas1p1ae3ef499dde9be2d1ca8e9af31a8e3ce~KyJzek89w0761107611eucas1p1r;
 Thu,  9 Mar 2023 15:06:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 67.13.09503.3F5F9046; Thu,  9
 Mar 2023 15:06:27 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230309150626eucas1p2db5b73ae3f8bb5595d3883818f374dab~KyJzKcChC1110911109eucas1p2w;
 Thu,  9 Mar 2023 15:06:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230309150626eusmtrp1bdf6347a949f66860b781a53d1ec68ee~KyJzJ2er81444414444eusmtrp1p;
 Thu,  9 Mar 2023 15:06:26 +0000 (GMT)
X-AuditID: cbfec7f2-ea5ff7000000251f-9a-6409f5f3f4fc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A4.CB.09583.2F5F9046; Thu,  9
 Mar 2023 15:06:26 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230309150626eusmtip100e9f38106b65078616812efe521a1ba~KyJygZGaH2475624756eusmtip1h;
 Thu,  9 Mar 2023 15:06:26 +0000 (GMT)
Message-ID: <098ef3a5-937c-e094-7aa5-6ed4955e2722@samsung.com>
Date: Thu, 9 Mar 2023 16:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion
Content-Language: en-US
To: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20230309085501.et7ngd32u25befqu@rcn-XPS-13-9305>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMKsWRmVeSWpSXmKPExsWy7djPc7qfv3KmGMxZyWlx4voiJoupD5+w
 WfzfNpHZ4srX92wWbx4dYbb42b6FyWLBbG6LY4tOsljMWXqCxeL9zluMFv+Ofmd24PZ4f6OV
 3WPH3SWMHnu/LWDx2DnrLrvH0wmT2T02repk87hzbQ+bx/3u40wem5fUB3BGcdmkpOZklqUW
 6dslcGW0tW9lL5jBV7F01mumBsYX3F2MnBwSAiYSt972sHQxcnEICaxglJja+pAZwvnCKHHw
 2jJGkCohgc+MEnc/RcF0zN9wjAmiaDmjxLzVFxkhnI+MEv3b1rJ3MXJw8ArYSXyYlgvSwCKg
 IvF89ipmEJtXQFDi5MwnLCC2qECKxI7zu8HKhQXCJR78DwYJMwuIS9x6Mp8JxBYRcJFY9G0N
 K8h4ZoGJzBJzF55hA0mwCRhKdL3tArM5gVat7b3ADtEsL9G8dTbYBxICszklFn0+yQJxtYvE
 ikU3oWxhiVfHt7BD2DISpydD/C8h0M4oseD3fSYIZwKjRMPzW4wQVdYSd879YgM5lVlAU2L9
 Ln0QU0LAUWLCjEIIk0/ixltBiBv4JCZtm84MEeaV6GgTgpihJjHr+Dq4rQcvXGKewKg0CylU
 ZiF5fxaSb2YhrF3AyLKKUTy1tDg3PbXYMC+1XK84Mbe4NC9dLzk/dxMjMJ2d/nf80w7Gua8+
 6h1iZOJgPMQowcGsJML7XYojRYg3JbGyKrUoP76oNCe1+BCjNAeLkjivtu3JZCGB9MSS1OzU
 1ILUIpgsEwenVAOTGdvXL5Ouvsk79ycq7ExuflOVeJV93q5PHpsmhbFWViys2F/TpKTxrjxw
 YXmapGAR9yvD9Utjzy0w1Zj69bgxy9GSqbr2c5d+c+DorlupOZtv1wWppZXvLYOPL2/m893z
 2TRFsHfrYuutrREuT2K3Hz7o1Fx+wn2/wYfd3c01q5x+7da8XFnX9Ijv45ZHWp2iCg9lGPMa
 T9z+/9R6gsK8L+e8qqU8c7VaVKY4eyz2VJazylm35P/O5lCBs+KecVGrOlrOZuzXCT/XXi9S
 aaWvlLF3OWu+5tGYmEtpPTsO8DjY9zi9q94jovlDizH89d2a5Bd18rFsl1fVvmY1XKd6Vqdg
 xqV9jNcWB695tV2JpTgj0VCLuag4EQCEV1vt1gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsVy+t/xu7qfvnKmGCz5rG9x4voiJoupD5+w
 WfzfNpHZ4srX92wWbx4dYbb42b6FyWLBbG6LY4tOsljMWXqCxeL9zluMFv+Ofmd24PZ4f6OV
 3WPH3SWMHnu/LWDx2DnrLrvH0wmT2T02repk87hzbQ+bx/3u40wem5fUB3BG6dkU5ZeWpCpk
 5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GW0tW9lL5jBV7F01mum
 BsYX3F2MnBwSAiYS8zccY+pi5OIQEljKKLHwyhUWiISMxMlpDawQtrDEn2tdbBBF7xkltnZf
 Y+9i5ODgFbCT+DAtF6SGRUBF4vnsVcwgNq+AoMTJmU9YQEpEBVIkZnfpgJjCAuESD/4Hg1Qw
 C4hL3HoynwnEFhFwkVj0bQ0ryHRmgcnMEv++n2OHWHWUUaJn+Ts2kCo2AUOJrrddYDYn0Nq1
 vRfYISaZSXRt7WKEsOUlmrfOZp7AKDQLyRmzkCychaRlFpKWBYwsqxhFUkuLc9Nzi430ihNz
 i0vz0vWS83M3MQIjeNuxn1t2MK589VHvECMTB+MhRgkOZiUR3u9SHClCvCmJlVWpRfnxRaU5
 qcWHGE2BYTGRWUo0OR+YQvJK4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KLYPqY
 ODilGpi8gl7asTYvbzj4+7v6s59rBfosE5wl9kZ9eLRZdGW6ONPhH8FxeksignoOL9p/LnZX
 u5xkETPnLEVR6xoxvxfGDXt6D+668VGAq+X9JWHeR90hx6QjoqSOrBdqjBf72y4obLUhnpk3
 py/w9/PfU6fU+IjfKfY4riJ2PjKd/bnOeUXh9lbNJ7WiprfcLt/idX6uzO1QuPs/z7P1UVfa
 L04MOR0xX36lVMRapWVSr6p0uZLc1ifcXbP8xHvdeSe/vOe9neNowaWw89Lz107nXtjG8z7r
 Dv4XkjyHcd/0OV7vQ9zvpx7Zf1w+6OJqny0CMep7HwQ3zhVOM4yo8pQPu+0XYrAtQC3a2WDb
 q/6kTCWW4oxEQy3mouJEAAqTGK5pAwAA
X-CMS-MailID: 20230309150626eucas1p2db5b73ae3f8bb5595d3883818f374dab
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230109220056eucas1p26418012878272961a3a21a365192ef60
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230109220056eucas1p26418012878272961a3a21a365192ef60
References: <CGME20230109220056eucas1p26418012878272961a3a21a365192ef60@eucas1p2.samsung.com>
 <20230109220033.31202-1-m.szyprowski@samsung.com>
 <20230309085501.et7ngd32u25befqu@rcn-XPS-13-9305>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ricardo,

On 09.03.2023 09:55, Ricardo Cañuelo wrote:
> On lun 09-01-2023 23:00:33, Marek Szyprowski wrote:
>> devm_regulator_get_enable_optional() function returns 0 on success, so
>> use it for the check if function succeded instead of the -ENODEV value.
>>
>> Fixes: 429e87063661 ("drm/meson: dw-hdmi: Use devm_regulator_*get_enable*()")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index 7642f740272b..534621a13a34 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> @@ -718,7 +718,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>>   	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>>   
>>   	ret = devm_regulator_get_enable_optional(dev, "hdmi");
>> -	if (ret != -ENODEV)
>> +	if (ret < 0)
>>   		return ret;
>>   
>>   	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
>> -- 
>> 2.39.0
> This patch seems to have caused (or uncovered) a regression in the
> bootrr.deferred-probe-empty test for meson-g12a-sei510. Apparently, this
> causes a driver to stay in the deferred probe list after boot.

Indeed my fix causes regression on the platform, which doesn't have 
"hdmi" regulator. Thanks for pointing that. I was really convinced that 
devm_regulator_get_enable_*optional*() returns 0 if requested regulator 
is not present (as "_optional" suffix suggests). Unfortunately it 
returns -ENODEV, what breaks meson_dw_hdmi driver. I will send a fix in 
a few minutes.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9203EB096
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7856F6E525;
	Fri, 13 Aug 2021 06:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 508 seconds by postgrey-1.36 at gabe;
 Fri, 13 Aug 2021 06:49:20 UTC
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815ED6E525
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 06:49:20 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210813064050epoutp0170092237e00302f378a82ded6bc897dc~aynw2LxlH0972109721epoutp01G
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 06:40:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210813064050epoutp0170092237e00302f378a82ded6bc897dc~aynw2LxlH0972109721epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1628836850;
 bh=GX0PO2UHB6tTTJjjXKR54Z+KLcMN1qE53qgK1OrgN60=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=J8wEaX0dBPDLhms2cd/7kSOWnYettEydvQLMrx/Gc8C0iVeCznEprPy+C7wmvYhfk
 iJCETxT62wKZWHqYkjxxunFJ7j/2Gj7TRAJai2lExZGnpCbMPdwDa1YZxq0hvbNx7u
 znQgFA9HqLPx3EF2bxTUGxEE7VL5VAnvLVOPRwpI=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210813064047epcas1p17a8367b4039e58d070f50b9b5fa0435e~aynur26k81882218822epcas1p1e;
 Fri, 13 Aug 2021 06:40:47 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.156]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4GmDTT3Pwqz4x9QH; Fri, 13 Aug
 2021 06:40:45 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 29.5D.09551.DE316116; Fri, 13 Aug 2021 15:40:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20210813064044epcas1p4f7c29f06e3cef0a2bfc68e2ee11235b8~aynri7T0q0205602056epcas1p4Y;
 Fri, 13 Aug 2021 06:40:44 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210813064044epsmtrp12719afc16604b5f1140a951b39c13782~aynrgns5S2484924849epsmtrp1i;
 Fri, 13 Aug 2021 06:40:44 +0000 (GMT)
X-AuditID: b6c32a36-2b3ff7000000254f-1d-611613ed5110
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 53.B2.08394.CE316116; Fri, 13 Aug 2021 15:40:44 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210813064044epsmtip10c02018d10720510f320b6285c1addb7~aynrRs_hm2938429384epsmtip1h;
 Fri, 13 Aug 2021 06:40:44 +0000 (GMT)
Subject: Re: [RFC PATCH 06/17] drm/exynos: dsi: Handle exynos specifics via
 driver_data
To: Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Andrzej
 Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Daniel Vetter <daniel.vetter@intel.com>,
 Marek Vasut <marex@denx.de>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <79ef7f71-b167-2368-e0fd-d4ccaee596c2@samsung.com>
Date: Fri, 13 Aug 2021 15:50:56 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YP2el40V3K4R7ner@ravnborg.org>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUxTVxjGd+69vS0sHaWgnJEM8ZJhxIG9heKVgVtEt5sgGdvCyJQJd3BH
 GaVtWnDovnAo4Uu+3ARbt7oAQzCyiYUAMh2VKGTIRwbIGqFQGLELiCjgCoyt7XUZ//2e9zzv
 e85zTo4AFRfyfQXpyixWo2QUBO6Otd7aGRI877WVkRhLfShzUz+Pqu9rQilDt4OGlxdwamrk
 LepMnUMtNZfj1IOJIYy6Ov8XQt39ao5PFVbU8qn68hs41Tw9yqOKVhtQqnrgBkLN5Z8ElKn0
 CPVYN4VSl+wtgKo+a8Nf96avLFp49MLYaT6tyz2D09/pejC6XTfOp/UF53l0TacNobtHanj0
 /dFOnLYU30Hoa7Vf0lcftiF07bkRnC41NgL6SbNfnMfhjEg5y6SyGn9WmaJKTVemRREx7yZF
 J8nCJWQwuZfaQ/grmUw2ijhwKC74jXSFIzbhf4xRZDtKcYxWS+zeF6lRZWex/nKVNiuKYNWp
 CvVedYiWydRmK9NCUlSZEaREIpU5jMkZ8oVBA1+tj8yxXxjk5YJRSRFwE0BRGDSZl3hFwF0g
 FrUB2FH6N8qJxwCeqppCOLEC4HrXdceKwNWS+yCBq/8MYMOsHePEAoD1XaW4c66X6H3YvWZH
 nOwtOgQ7K9ddjIoWebDdpnEyLnoZVlyyuPxC0T64cKua72TMUf9Gv4g5eYtjzsD1ixjn8YS9
 52dc7CZ6BY6azSg30weaZwzP5m+DeS16VwQouuwGjVU2nAt6AI5NWFGOveCfd4x8jn2hrSyf
 zzXkAVhR/SvCiQIAx6fvYZwrFN6sO4s486OinfDHjt1ceTtsX/sWcDu/AB8ul/C4KxLCgnwx
 ZyHg7aExwDGEg7UVz85Dw0fXhrBysF23KZtuUx7dpjy6/ze+CLBGsJVVazPTWC2plm5+7mbg
 +hNB4W2gcv5RiAkgAmACUIAS3sJ2PzEjFqYyx0+wGlWSJlvBak1A5rjtCtR3S4rK8amUWUmk
 TBoaGkqFkeEykiR8hCsfLCeLRWlMFpvBsmpW818fInDzzUX2WKWfGWwdHjMKz0SJ7eMc37LV
 VnKspGstuKWnfyYgxtDTyx/3KUHnj/xW+DUy8VNQnLFgMm9t2/HXYsfiB/Lr9BEb6eLnWi1h
 E/27xrtPC7uD12Wh+pc8/gl6Pv3ecOfq0jvFTUGR8camroSAHb+rj0WXWf1ggPxN912IIDln
 f8LdZGO89mCZHexotKzERvUNkw8DX+1rkxJPb+qOBvojTxInDxqSin/wrLnQanvxlOd7Vz5t
 lCZ/NLt/43ZXw0ZKmiDCin5on/z88h9kYe9TuSXgsFBQcnTu+ymPc2/LPD+5H9g3a23ySf2l
 MnpcZlqZzk6x4omxpHk9pupk7BfwBEZgWjlDBqEaLfMvJF0TtZwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfVDLcRzHfX9P+7UTv7bSV1FnrutSevD4PUJcx8/DHac/Eg6j3yW2mv1U
 cofJccxJHlprRbmNrVx1pfVwOseWwxGhDTskFBErlmv0h61x13+vz/vzfn3++tC4qI8IoTOz
 9nPKLKlMQgmJJqskbPaAeIo0/tepAOSofUwi46NaHFW0e6hr2EmhHtt6dOaqZ3I1FFHo89un
 BKr/NoKhjoIBATp1ziBAxqJbFGr4YCeR+ncVjrRPbmFo4MRRgCyFW9APXQ+OTG4zQNoL/VRS
 IFsz1E2yzpfHBaxOdYZiL+vuE2yr7o2ALTtZSrL6tn6MbbfpSfa1vY1iu0/fw9gbhiNs/fcW
 jDVobBRb2FgN2J8NYRsmbxYmpnOyzFxOGbd0h3C3s7NCoChLPOAu7yRVwB6vBjQNmXlQ9TlV
 DYS0iLkJYM+n8wJfDmGjmfahGFqtvK/yDcBXRgOhBn60mEmD7X/cmJcDmXWw7fwo5i3hzDAJ
 r5jNhM/4CmDpUz3pbVFMBDxn6qa87M8shU6rVuBlwpMXlw2NXQ3yXP1Z+YX0dQLgg9KPY7kf
 EwPtDgfuZZyJhKOXn/3jYOj4WIH5OBweM5fhRUCkG6frxim6cYpunFIJiGowlVPw8gw5n6BI
 yOLyYnmpnM/JyojdlS1vAGOvMCuqBTRXD8ZaAEYDC4A0Lgn05z3PIfJPl+Yf5JTZ25U5Mo63
 gFCakAT7d6ofbBcxGdL93F6OU3DK/1uM9gtRYS3v7NpkieZ5oX5PzYolX/Pn21hr19lJebU2
 Q1w/qr0eU6JofZ+yQpgwYbFMf7d5eQ0Rb0o6lL3JBUtCnphKSHlyfOPCuU2xcwoad9zT5NYs
 q5zC8KvixEPuvE6lsdTeJXcdjE6P6N0U9Gle6FtNe+/oyrRtqS+IlOhK15bkO5ETCtIi9g1e
 zzEyH1Q3RmbWHXNUhaO92jldG3dOR6uRc1B2sTd/2tZhTd+0sCWLE6PIoEWHy025G0Ij9OuT
 Mu9ecn9vDiq+9tDS0VcuHpwt3jZC325bvSb82dBac2Jv8MQZqa1c5OuWBa2jdVT9j6rCDv3R
 mOzN99PmTp54QpI83eGSEPxuacIsXMlL/wJc2jSceQMAAA==
X-CMS-MailID: 20210813064044epcas1p4f7c29f06e3cef0a2bfc68e2ee11235b8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210725172551epcas1p31dff839439ac37757cf061405b5ac65c
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-7-jagan@amarulasolutions.com>
 <CGME20210725172551epcas1p31dff839439ac37757cf061405b5ac65c@epcas1p3.samsung.com>
 <YP2el40V3K4R7ner@ravnborg.org>
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

Hi,

21. 7. 26. 오전 2:25에 Sam Ravnborg 이(가) 쓴 글:
> On Sun, Jul 04, 2021 at 02:32:19PM +0530, Jagan Teki wrote:
>> Exynos DSI driver is actually a Samsung MIPI DSIM bridge
>> IP which is also used in i.MX8MM platforms.
>>
>> Right now the existing driver has some exynos drm specific
>> code bases like te_irq, crtc and component_ops.
>>
>> In order to switch this driver into a common bridge driver
>> We can see 2 options to handle the exynos specific code.
>>
>> A. Drop the component_ops, and rework other specifics.
>>    This may lead to more foundation work as it requires
>>    more changes in exynos drm drivers stack.
>>
>> B. Handle the exynos specifics via driver data, and make
>>    the common bridge work in different platforms and plan
>>    for option A in future.
>>
>> So, this patch is trying to add option B) changes to handle
>> exynos specifics via driver_data.
> 
> We really should find someone that has the time, energy, knowledge and
> hardware that can include device_link support once anf for all for
> bridges.
> Then we would avoid hacks like this.
> 
> I see no other options at the moment, but look forward for a better
> solution.
> 
> 	Sam
> 

I'm not sure that it's correct to share this mipi dsi driver with I.MX8MM SoC even though it's a same IP because this MIPI DSI device isn't peripheral device but in SoC.
It would mean that Exynos MIPI DSI device depends on SoC architecture, and Exynos and I.MX series are totally different SoC. So if we share the same driver for the MIPI DSI device then many things we didn't predict may happen in the future. I don't want to make Jagan's efforts in vain for the community but clarify whether this is correct way or not. If this is only the way we have to go then we could more focus on actual solution not such hack. Impossible work with Jagan alone I think.

So let's get started with a question,
- Is MIPI-DSI bridge device or Encoder device? I think that MIPI-DSI is a Encoder device managed by atomic KMS. If MIPI-DSI should be handled as bridge device then does now drm bridge framework provide everything to share one driver with one more SoC? I mean something that drm bridge has to consider for such driver support, which is shared with one more SoC.  


And Display mode - VIDEO and COMMAND mode - is generic type of MIPI DSI, and also componentised subsystem is a generic solution to resolve probing order issue not Exynos specific feature. These are driver specific ones not Exynos SoC I think. As SoC specific things should be considered, I think MIPI DSI Driver - interrupt handler and probing order things are really specific to device driver - should be separated but we could share the control part of the device.

I was busy with other projects so didn't care of Linux DRM world so there may be my missing something.

Thanks,
Inki Dae

> 
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 37 +++++++++++++++++++------
>>  1 file changed, 29 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> index 99a1b8c22313..53d878d4d2d7 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> @@ -250,6 +250,7 @@ struct exynos_dsi_driver_data {
>>  	unsigned int wait_for_reset;
>>  	unsigned int num_bits_resol;
>>  	const unsigned int *reg_values;
>> +	bool exynos_specific;
>>  };
>>  
>>  struct exynos_dsi {
>> @@ -459,6 +460,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
>>  	.wait_for_reset = 1,
>>  	.num_bits_resol = 11,
>>  	.reg_values = reg_values,
>> +	.exynos_specific = true,
>>  };
>>  
>>  static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
>> @@ -471,6 +473,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
>>  	.wait_for_reset = 1,
>>  	.num_bits_resol = 11,
>>  	.reg_values = reg_values,
>> +	.exynos_specific = true,
>>  };
>>  
>>  static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
>> @@ -481,6 +484,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
>>  	.wait_for_reset = 1,
>>  	.num_bits_resol = 11,
>>  	.reg_values = reg_values,
>> +	.exynos_specific = true,
>>  };
>>  
>>  static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
>> @@ -492,6 +496,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
>>  	.wait_for_reset = 0,
>>  	.num_bits_resol = 12,
>>  	.reg_values = exynos5433_reg_values,
>> +	.exynos_specific = true,
>>  };
>>  
>>  static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
>> @@ -503,6 +508,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
>>  	.wait_for_reset = 1,
>>  	.num_bits_resol = 12,
>>  	.reg_values = exynos5422_reg_values,
>> +	.exynos_specific = true,
>>  };
>>  
>>  static const struct of_device_id exynos_dsi_of_match[] = {
>> @@ -1484,7 +1490,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>>  	 * If attached panel device is for command mode one, dsi should register
>>  	 * TE interrupt handler.
>>  	 */
>> -	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
>> +	if (dsi->driver_data->exynos_specific &&
>> +	    !(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
>>  		int ret = exynos_dsi_register_te_irq(dsi, &device->dev);
>>  		if (ret)
>>  			return ret;
>> @@ -1495,8 +1502,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>>  	dsi->lanes = device->lanes;
>>  	dsi->format = device->format;
>>  	dsi->mode_flags = device->mode_flags;
>> -	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
>> -			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
>> +	if (dsi->driver_data->exynos_specific)
>> +		exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
>> +					    !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
>>  
>>  	mutex_unlock(&drm->mode_config.mutex);
>>  
>> @@ -1515,7 +1523,8 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>>  	if (drm->mode_config.poll_enabled)
>>  		drm_kms_helper_hotplug_event(drm);
>>  
>> -	exynos_dsi_unregister_te_irq(dsi);
>> +	if (dsi->driver_data->exynos_specific)
>> +		exynos_dsi_unregister_te_irq(dsi);
>>  
>>  	return 0;
>>  }
>> @@ -1737,6 +1746,15 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return ret;
>>  
>> +	if (!dsi->driver_data->exynos_specific) {
>> +		ret = mipi_dsi_host_register(&dsi->dsi_host);
>> +		if (ret) {
>> +			dev_err(dev, "failed to register mipi dsi host: %d\n",
>> +				ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>>  	platform_set_drvdata(pdev, dsi);
>>  
>>  	pm_runtime_enable(dev);
>> @@ -1747,9 +1765,11 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>>  
>>  	drm_bridge_add(&dsi->bridge);
>>  
>> -	ret = component_add(dev, &exynos_dsi_component_ops);
>> -	if (ret)
>> -		goto err_disable_runtime;
>> +	if (dsi->driver_data->exynos_specific) {
>> +		ret = component_add(dev, &exynos_dsi_component_ops);
>> +		if (ret)
>> +			goto err_disable_runtime;
>> +	}
>>  
>>  	return 0;
>>  
>> @@ -1767,7 +1787,8 @@ static int exynos_dsi_remove(struct platform_device *pdev)
>>  
>>  	pm_runtime_disable(&pdev->dev);
>>  
>> -	component_del(&pdev->dev, &exynos_dsi_component_ops);
>> +	if (dsi->driver_data->exynos_specific)
>> +		component_del(&pdev->dev, &exynos_dsi_component_ops);
>>  
>>  	return 0;
>>  }
>> -- 
>> 2.25.1
> 

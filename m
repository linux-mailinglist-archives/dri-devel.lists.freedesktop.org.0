Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD043EFA77
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 07:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCFE6E3C1;
	Wed, 18 Aug 2021 05:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C506E3C1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 05:59:09 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210818055907epoutp043f70293f48e301e9385e37bde701418a~cURx82SVP3199331993epoutp04Z
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 05:59:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210818055907epoutp043f70293f48e301e9385e37bde701418a~cURx82SVP3199331993epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1629266348;
 bh=j5yG67Q1qH/KzoH+iRAnhmptxxBdmKCQjW0XIsEf0gI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=iAzKKB2IC/+Z2h+Zc+jMmEaiKKMTE5S9mo7fpnSqOZ/4ZIXIAtEAILDzb7fKE0tZL
 EvjlodI3YjTQx5RDEvwKpEaNOw/hx28lHGdcvjTDywtQUlq2fiUWAyscNUy8I5ud1x
 Xxy+RIIPqWeYdBadxJwLEUYH2zK0rg1yjHlpXV8E=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20210818055906epcas1p3930e8b08063f705a85423d5f0ca734fc~cURwwqNm31467114671epcas1p37;
 Wed, 18 Aug 2021 05:59:06 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.157]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4GqHK305V9z4x9Pv; Wed, 18 Aug
 2021 05:59:03 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 FB.1D.13454.6A1AC116; Wed, 18 Aug 2021 14:59:02 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20210818055902epcas1p39a2034b036d42523c908f7a77b6ace26~cURsu-jap1467614676epcas1p3m;
 Wed, 18 Aug 2021 05:59:02 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210818055902epsmtrp248a5a6c996e5006822f553b0b91d0948~cURstxmb23178431784epsmtrp2k;
 Wed, 18 Aug 2021 05:59:02 +0000 (GMT)
X-AuditID: b6c32a39-16fff7000002348e-6e-611ca1a6b8e5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C2.17.08394.6A1AC116; Wed, 18 Aug 2021 14:59:02 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210818055901epsmtip25516c96e78cb857ce22a5b7d85fed532~cURsVjYe-1153711537epsmtip2i;
 Wed, 18 Aug 2021 05:59:01 +0000 (GMT)
Subject: Re: [RFC PATCH 06/17] drm/exynos: dsi: Handle exynos specifics via
 driver_data
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Jagan Teki
 <jagan@amarulasolutions.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Daniel Vetter
 <daniel.vetter@intel.com>, Marek Vasut <marex@denx.de>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <9165278a-547f-cb11-9609-ecf498192db7@samsung.com>
Date: Wed, 18 Aug 2021 15:09:16 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRZioZvYrU99fQxJ@pendragon.ideasonboard.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0wTZxjH816v19IMvVXQd+gG3LIY2KCUWncwcE4N3ASEiYuKZuwCNwqU
 tmlBGQkZ4GD8EEJlCtYNUAooAoYfMhggsxBQx9ZhQNAMGIMswCo/KkyEZO7KYcZ/n+/zfL/3
 vM97eYU8cZ7ASRirSmS0KlpJYCK0pdtN4lF1dRftVfNQTj6p/5VPVvfX88iyHpYGl+cxcmIo
 lMyvZNVSYyFGTo8NoGTD0xWE/CXDIiBz9EYBWV14ByMbJx/xydzVGzyyxHwHIS1Z6YA0FZwi
 rYYJHnn9xW1AlhTNYPsdqLrFcT41P5IpoAxp+RhVariHUm2GUQF1Jfsyn6romEGonqEKPvX7
 ow6MGs/rQ6gm41dUw1wrQhkvDWFUQXMNoJ41vhW2NSLeT8HQ0YzWhVFFqaNjVTH+RFB45MFI
 +V4vqYfUh3yfcFHRCYw/cSg4zCMgVsmuTbicoZVJbCmM1ukIyT4/rTopkXFRqHWJ/gSjiVZq
 fDSeOjpBl6SK8YxSJ/hKvby85azx83jF47JOVGM6kVzUYeSngYnAXGAnhPgeePPuJTQXiIRi
 vBXAqt5bGCesAA6OdiGc+AfA2hUT71VkNsPI5xqdALaYszZc86y4axHYXNvwk7Bn7QViYwec
 hPnXioHNxMMzMbj4wIzaGhj+DtRfH8dsbI/vgzdWa9cDKFtfKr0AbOzIfsjcXo5yntfh/ctT
 62yH+8LRrI51Dw/fAZ9MlSEcO8Nzt6/wbMMgXm0Hp/94vnHuQzC9+yXK8TY429cs4NgJPpvr
 xLjAOQD1JT8jnMgGcHRyeCMhg12VRWxDyI5wg7d+lHBlV9i29v3GKbbAueXzfJsF4vYwO0vM
 WQjYOzACOIbwN6Me45iCC00DaCFwNWzazbBpH8OmfQz/Dy4HaA3Yzmh0CTGMTqqRb/7hjWD9
 Vbj7tILipwueJoAIgQlAIY9wsN8tdKLF9tH0lymMVh2pTVIyOhOQs7et5zk5RqnZZ6VKjJTK
 vWUyGblHulculRI77HUhO2kxHkMnMvEMo2G0r3KI0M4pDcke+9QtsP34fe+Is11z0+nKvy+K
 Q7Jcv80ISK3L6zsSZJG+Zi472h4cWR6RM4xvf9inm7CY2luNvVZrfalkOHMcnrgp37IWGn44
 TuUs+yRnsuFfl5Imb02nYUli1Z+0Br5cVla/W1iTV5Uiq7j33rFj/R8rZgu+eAM7krt7KKxt
 kAnoK34uMvsB36nkitTCgZDVltqFo99ZP5tVp7uFvv0B841P1djps6a/UsZFi2r31MNB569e
 e5wQd2po59aM5tnS5P5gR8tHlaLK+hb3pm5JHO/iyP4Ldc6nP2zuPr528OuinzKmwtV1uYrM
 ifjiH9rCHtQnvel4gAiYObMS8WcBseuAiEB1ClrqztPq6P8AuM3ydp4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SZ0xTURhAvW/1tRZ9FghXHCQ1LiJV4rpB3KIvxgRXXCjyos+KQm1a6opR
 cKDUQIoowjMytAKiotSCEIsmpYobFEsQQYJgFGSIhShCjB0x4d+59zvn+/XRuOwr4U9Hq+J4
 jYqLkVMSorRSHhCUlzuem3W3ZQxqKHpDovxXRTjKtjnpfX8PhVrs4Sj5hvPVZzJQ6NuntwQq
 7vqNodcnO0UoKdUoQvmGRxQytdaRSP/nJo4yqh9hqDMxASBrSgT6KbTgqGCgBKCMtHZqiQ97
 p7eZZHvqz4hYIT6ZYrOEZwRbLjSJ2CvnMkn2uqUdY2326yTbWGeh2ObzVRh733iCLe4uw1hj
 up1iU8yFgHWYJq4dvU0SupuPiT7Ia2YuipLs/ZBdQaitWw6nWYxkPGhZpQdiGjJzYMdJI6kH
 ElrGPASw1l5F6AHtHEBoLqE96A0rK7UepQtAc2MKcLXezFZoGxzAXOzDIJh87TJwSTiTRMHi
 zHbMU9RgcNBSSrgsipkMUwuaKRd7MYvgzT+33TXh/O/LuuDe6uvc6sjpID3OGPg8s83dipkQ
 2JRocTs4MxUOZb3DPewHG9qyMQ8HwFMlV3ADkAnDcmFYIgxLhGFJDiAKwVherY1VxmqD1cEq
 /pBCy8VqdSqlYteBWBNw30Lg9DLwoPCHwgowGlgBpHG5j9dU2p+Tee3mjhzlNQd2anQxvNYK
 xtGE3M+rRv98p4xRcnH8fp5X85r/U4wW+8djQqTOEFXbUECziY43/TVwqV09oti8TLpr36a+
 kbq4AOlTQ8aMsFH4LHliZvw7X2XjvsjcW979FYt1rb8r5oZz0uDq1UnYpPW/TofkdPwU+VTe
 eIhfPaSncgP3v1RJu3tE6Oy0jbaVIxzd+T8uRryvW5KuWO6bhKLEqfderJwzpdT8vaiXWTh7
 e6tv7bkzbXf0XeIVgTb/z93WeRW612HTdlSp4kxkQkaIzG/dqpTzQ1in9yA6Pt+RAL5kVUOx
 pHcDJY2Ifpy3pr5x1Mzw7LzQsUV/04fGHddM+tj3+PRhe2vyns1PtwZFTLCcbf82oHiyZ8Gx
 tGfKupDymkv5keUBoWFyQruXCw7ENVruH/npcxp6AwAA
X-CMS-MailID: 20210818055902epcas1p39a2034b036d42523c908f7a77b6ace26
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
 <79ef7f71-b167-2368-e0fd-d4ccaee596c2@samsung.com>
 <YRZioZvYrU99fQxJ@pendragon.ideasonboard.com>
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

Hi Laurent,

21. 8. 13. 오후 9:16에 Laurent Pinchart 이(가) 쓴 글:
> Hi Inki,
> 
> On Fri, Aug 13, 2021 at 03:50:56PM +0900, Inki Dae wrote:
>> 21. 7. 26. 오전 2:25에 Sam Ravnborg 이(가) 쓴 글:
>>> On Sun, Jul 04, 2021 at 02:32:19PM +0530, Jagan Teki wrote:
>>>> Exynos DSI driver is actually a Samsung MIPI DSIM bridge
>>>> IP which is also used in i.MX8MM platforms.
>>>>
>>>> Right now the existing driver has some exynos drm specific
>>>> code bases like te_irq, crtc and component_ops.
>>>>
>>>> In order to switch this driver into a common bridge driver
>>>> We can see 2 options to handle the exynos specific code.
>>>>
>>>> A. Drop the component_ops, and rework other specifics.
>>>>    This may lead to more foundation work as it requires
>>>>    more changes in exynos drm drivers stack.
>>>>
>>>> B. Handle the exynos specifics via driver data, and make
>>>>    the common bridge work in different platforms and plan
>>>>    for option A in future.
>>>>
>>>> So, this patch is trying to add option B) changes to handle
>>>> exynos specifics via driver_data.
>>>
>>> We really should find someone that has the time, energy, knowledge and
>>> hardware that can include device_link support once anf for all for
>>> bridges.
>>> Then we would avoid hacks like this.
>>>
>>> I see no other options at the moment, but look forward for a better
>>> solution.
>>
>> I'm not sure that it's correct to share this mipi dsi driver with
>> I.MX8MM SoC even though it's a same IP because this MIPI DSI device
>> isn't peripheral device but in SoC.
>>
>> It would mean that Exynos MIPI DSI device depends on SoC architecture,
>> and Exynos and I.MX series are totally different SoC. So if we share
>> the same driver for the MIPI DSI device then many things we didn't
>> predict may happen in the future.
> 
> Isn't that true for external components true thought ? Any driver shared
> by multiple systems will face this issue, where it will be developed
> with some use cases in mind, and regressions may happen when the driver
> is then extended to support other use cases not required for the
> original platform.
> 
> In general we don't want multiple drivers for the same IP core unless
> there are valid technical reasons for that. It's the whole point of the
> device tree, being able to describe how IP cores are integrated, so that
> code can be reused across platforms. Of course, integration differences
> between SoCs can sometimes vary wildly and require some amount of glue
> code.

Agree with you. It would be a good chance to clarify what we need to share same device driver without any regress in this time.

> 
>> I don't want to make Jagan's efforts
>> in vain for the community but clarify whether this is correct way or
>> not. If this is only the way we have to go then we could more focus on
>> actual solution not such hack. Impossible work with Jagan alone I
>> think.
> 
> I do agree that we need more correct solutions and less hacks in general
> :-) The issues faced on Exynos also exist on other platforms, so it
> would be much better to solve them well once that duplicating
> implementations with less test coverage and reviews. There have been
> efforts in the past to address some of these issues, which have resulted
> in solutions such as the component framework. However, I'd argued that

Yeah, most of ARM systems have various separate devices but DRM subsytem wanted each ARM driver to work like one device driver for all of them. And the component framework has been adopted by several ARM DRM drivers for it including Exynos.

> we've never taken it to the last step, and have always stopped with half
> solutions. The component framework, for instance, is painful to use, and
> the handling of .remove() in most drivers is completely broken because
> of that (not just because of that though, we have issues in the DRM core
> that make hot-unplug just impossible to handle safetly).

This may be one of what we have to clarify. I think ARM DRM drivers need component framework or similar thing to address probing order issue.
So would we need to enhance existing compoent framework to be suitable for DRM subsystem, or introducing an alternative solution?

Otherwise, would there be some way to address the probing order issue without the compoment framework?

> 
>> So let's get started with a question,
>> - Is MIPI-DSI bridge device or Encoder device? I think that MIPI-DSI
>> is a Encoder device managed by atomic KMS. If MIPI-DSI should be
>> handled as bridge device then does now drm bridge framework provide
>> everything to share one driver with one more SoC? I mean something
>> that drm bridge has to consider for such driver support, which is
>> shared with one more SoC.
> 
> The DRM "encoder" concept was a bit of a historical mistake that we are
> stuck with as drm_encoder is exposed to userspace. It comes from a time
> where nobody was envisioning chaining multiple encoders. DRM is moving
> to modelling every component after the CRTC as a bridge. This brings

Thanks for explanation and seems correct direction. :) However, there would be something we have to address before changing the existing modeling because any regress shouldn't be allowed.

Thanks,
Inki Dae

> much more flexibility, and in that model, the drm_encoder becomes more
> or less a stub.
> 
> The DRM bridge API has been extended in the past to support more
> features, and if anything is still missing that makes it difficult to
> move away from drm_encoder, we can of course address the issues in
> drm_bridge.
> 
>> And Display mode - VIDEO and COMMAND mode - is generic type of MIPI
>> DSI, and also componentised subsystem is a generic solution to resolve
>> probing order issue not Exynos specific feature. These are driver
>> specific ones not Exynos SoC I think. As SoC specific things should be
>> considered, I think MIPI DSI Driver - interrupt handler and probing
>> order things are really specific to device driver - should be
>> separated but we could share the control part of the device.
>>
>> I was busy with other projects so didn't care of Linux DRM world so
>> there may be my missing something.
>>
>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>> ---
>>>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 37 +++++++++++++++++++------
>>>>  1 file changed, 29 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> index 99a1b8c22313..53d878d4d2d7 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> @@ -250,6 +250,7 @@ struct exynos_dsi_driver_data {
>>>>  	unsigned int wait_for_reset;
>>>>  	unsigned int num_bits_resol;
>>>>  	const unsigned int *reg_values;
>>>> +	bool exynos_specific;
>>>>  };
>>>>  
>>>>  struct exynos_dsi {
>>>> @@ -459,6 +460,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
>>>>  	.wait_for_reset = 1,
>>>>  	.num_bits_resol = 11,
>>>>  	.reg_values = reg_values,
>>>> +	.exynos_specific = true,
>>>>  };
>>>>  
>>>>  static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
>>>> @@ -471,6 +473,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
>>>>  	.wait_for_reset = 1,
>>>>  	.num_bits_resol = 11,
>>>>  	.reg_values = reg_values,
>>>> +	.exynos_specific = true,
>>>>  };
>>>>  
>>>>  static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
>>>> @@ -481,6 +484,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
>>>>  	.wait_for_reset = 1,
>>>>  	.num_bits_resol = 11,
>>>>  	.reg_values = reg_values,
>>>> +	.exynos_specific = true,
>>>>  };
>>>>  
>>>>  static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
>>>> @@ -492,6 +496,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
>>>>  	.wait_for_reset = 0,
>>>>  	.num_bits_resol = 12,
>>>>  	.reg_values = exynos5433_reg_values,
>>>> +	.exynos_specific = true,
>>>>  };
>>>>  
>>>>  static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
>>>> @@ -503,6 +508,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
>>>>  	.wait_for_reset = 1,
>>>>  	.num_bits_resol = 12,
>>>>  	.reg_values = exynos5422_reg_values,
>>>> +	.exynos_specific = true,
>>>>  };
>>>>  
>>>>  static const struct of_device_id exynos_dsi_of_match[] = {
>>>> @@ -1484,7 +1490,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>>>>  	 * If attached panel device is for command mode one, dsi should register
>>>>  	 * TE interrupt handler.
>>>>  	 */
>>>> -	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
>>>> +	if (dsi->driver_data->exynos_specific &&
>>>> +	    !(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
>>>>  		int ret = exynos_dsi_register_te_irq(dsi, &device->dev);
>>>>  		if (ret)
>>>>  			return ret;
>>>> @@ -1495,8 +1502,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>>>>  	dsi->lanes = device->lanes;
>>>>  	dsi->format = device->format;
>>>>  	dsi->mode_flags = device->mode_flags;
>>>> -	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
>>>> -			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
>>>> +	if (dsi->driver_data->exynos_specific)
>>>> +		exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
>>>> +					    !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
>>>>  
>>>>  	mutex_unlock(&drm->mode_config.mutex);
>>>>  
>>>> @@ -1515,7 +1523,8 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>>>>  	if (drm->mode_config.poll_enabled)
>>>>  		drm_kms_helper_hotplug_event(drm);
>>>>  
>>>> -	exynos_dsi_unregister_te_irq(dsi);
>>>> +	if (dsi->driver_data->exynos_specific)
>>>> +		exynos_dsi_unregister_te_irq(dsi);
>>>>  
>>>>  	return 0;
>>>>  }
>>>> @@ -1737,6 +1746,15 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>> +	if (!dsi->driver_data->exynos_specific) {
>>>> +		ret = mipi_dsi_host_register(&dsi->dsi_host);
>>>> +		if (ret) {
>>>> +			dev_err(dev, "failed to register mipi dsi host: %d\n",
>>>> +				ret);
>>>> +			return ret;
>>>> +		}
>>>> +	}
>>>> +
>>>>  	platform_set_drvdata(pdev, dsi);
>>>>  
>>>>  	pm_runtime_enable(dev);
>>>> @@ -1747,9 +1765,11 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>>>>  
>>>>  	drm_bridge_add(&dsi->bridge);
>>>>  
>>>> -	ret = component_add(dev, &exynos_dsi_component_ops);
>>>> -	if (ret)
>>>> -		goto err_disable_runtime;
>>>> +	if (dsi->driver_data->exynos_specific) {
>>>> +		ret = component_add(dev, &exynos_dsi_component_ops);
>>>> +		if (ret)
>>>> +			goto err_disable_runtime;
>>>> +	}
>>>>  
>>>>  	return 0;
>>>>  
>>>> @@ -1767,7 +1787,8 @@ static int exynos_dsi_remove(struct platform_device *pdev)
>>>>  
>>>>  	pm_runtime_disable(&pdev->dev);
>>>>  
>>>> -	component_del(&pdev->dev, &exynos_dsi_component_ops);
>>>> +	if (dsi->driver_data->exynos_specific)
>>>> +		component_del(&pdev->dev, &exynos_dsi_component_ops);
>>>>  
>>>>  	return 0;
>>>>  }
> 

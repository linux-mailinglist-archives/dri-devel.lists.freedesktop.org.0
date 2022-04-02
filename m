Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F294F060D
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 22:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C0E10E080;
	Sat,  2 Apr 2022 20:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22BF10E19E
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 20:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OgpSvd+sEKNYnhFTtmz9rc03zoQTnAyTRtqKshoW03c=; b=O8i5i12gdbIiEYBkVUMTvyapiC
 HO2iJvNBtGmhAS+HUvDLOYBMqqmRaB4tGtxvEUDl2yW0c1/qQqdU46LfMhP3aISchcfvhJxqWvMaf
 zRwnk0MjioWJH+9G97IzT4MJQC4o7jbWNxgkdeVt4BJDGzSWE/2xHt6XLzpFtalfMD49GUHR6kj+v
 jVoYEnNK4TlPYKiAwmphwJoZRrHTmRzQ3JHEOxxAEDAEEnePLqTTkZqaUbFQ5iTSCK/WFXl3R9LFI
 rNCp+E50issSM+ZgVxj34p1F44gwqRPqU6X0hBz25Iby94IS1FIdW2ORq75KdX+kr9QS9WTnJlkm0
 qrWXKZFQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:63235
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nak2b-0004sz-Hf; Sat, 02 Apr 2022 22:08:09 +0200
Message-ID: <db7c6ab5-afe3-2e92-33c7-7ebf75801439@tronnes.org>
Date: Sat, 2 Apr 2022 22:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC][PATCH 2/3] drm/modes: Make width-mm/height-mm mandatory in
 of_get_drm_panel_display_mode()
To: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220401163755.302548-1-marex@denx.de>
 <20220401163755.302548-2-marex@denx.de>
 <YkdImJRIRkaqeGDl@pendragon.ideasonboard.com>
 <efaa195a-bbdc-ca24-eccc-271995dfd27f@denx.de>
 <YkfAtkOtaWksnrlH@pendragon.ideasonboard.com>
 <a8b45b0a-b458-f9dd-c983-6ef4ec175432@denx.de>
 <d16332a6-63cc-8fa6-91f2-59064ce333f1@tronnes.org>
 <d230da1b-2649-2f8d-680b-015e9044540e@denx.de>
 <35a66df7-5619-cb10-620e-008adb64f2d7@tronnes.org>
 <92a5854f-0dc0-8bb9-0607-549d52822af1@denx.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <92a5854f-0dc0-8bb9-0607-549d52822af1@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 02.04.2022 19.55, skrev Marek Vasut:
> On 4/2/22 19:08, Noralf Trønnes wrote:
>>
>>
>> Den 02.04.2022 18.39, skrev Marek Vasut:
>>> On 4/2/22 09:45, Noralf Trønnes wrote:
>>>>
>>>>
>>>> Den 02.04.2022 06.28, skrev Marek Vasut:
>>>>> On 4/2/22 05:19, Laurent Pinchart wrote:
>>>>>> On Fri, Apr 01, 2022 at 10:36:24PM +0200, Marek Vasut wrote:
>>>>>>> On 4/1/22 20:46, Laurent Pinchart wrote:
>>>>>>>> On Fri, Apr 01, 2022 at 06:37:54PM +0200, Marek Vasut wrote:
>>>>>>>>> Make the width-mm/height-mm panel properties mandatory in
>>>>>>>>> of_get_drm_panel_display_mode(), print error message and
>>>>>>>>> return -ve in case these DT properties are not present.
>>>>>>>>> This is needed to correctly report panel dimensions.
>>>>>>>>
>>>>>>>> Can we guarantee this won't cause a regression ?
>>>>>>>
>>>>>>> For the upstream DTs, I think we can.
>>>>>>> For downstream DTs, we cannot know.
>>>>>>
>>>>>> Are there users of this function whose DT bindings don't require the
>>>>>> width-mm and height-mm properties ?
>>>>>
>>>>> There is literally one user of this function upstream:
>>>>> drivers/gpu/drm/tiny/panel-mipi-dbi.c
>>>>
>>>> Yes, the function was added for that driver since it was so generic in
>>>> nature. What about adding an argument to
>>>> of_get_drm_panel_display_mode()
>>>> that tells if the properties are mandatory or not?
>>>
>>> Sure, we can do that, but maybe the question here is even bigger than
>>> this series.
>>>
>>> Should every panel set mandatory width_mm/height_mm so e.g. the user
>>> space can infer DPI from it and set up scaling accordingly, or should
>>> width_mm/height_mm be optional ?
>>>
>>> I think width_mm/height_mm should be mandatory for all panels.
>>>
>>> Thoughts ?
>>
>> If this had come up during the review of the driver I would have no
>> problem making it mandatory. It makes sense for DPI. Maybe it's possible
>> to get around the ABI break by getting in a change through -fixes before
>> 5.18 is released? I'm fine with that.
> 
> Well that's awesome, the dbi-spi.yaml didn't land in any kernel release
> yet, so we still have a chance to fix it ?

It entered this merge window.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA024F19EB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 21:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D449710E5A5;
	Mon,  4 Apr 2022 19:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA7C10E5A5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 19:23:23 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9B04083982;
 Mon,  4 Apr 2022 21:23:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649100202;
 bh=mMKYrei9pXix9LC9TPFNhCTigf2OWVCOY3+upceWb3o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Cl7J7pyqoMdlBy6umrtD42Eylr//5Q1+g6Km95PMqDex3oHvnyB1+8xFvH0clPMmO
 31bZn+NIA6j0/ws9hSDKmu/IPsGeDL6ab29v/htBRRWo0+BH6280aG152PDb3AB1lE
 rhGUP+hawP6mc5/+wnxVgYdTUgrs3W2cTHvQE9e0/ilL3f5mzfmmke9nRfiOK8wB4w
 Qakxs/y44H73Zh10jaMfqWn6gmWWRBMeNSk3YN3w/0NfWS9YS7ysD/GqsyWcIyu5Q7
 LbVi9cyH3O95rtolff+D9UCsjgpILBk1+ijOJb/fE+0iii/yZQ0OUUEcy/yVk+wRnR
 XS8Tn9gDLtt3g==
Message-ID: <755d1696-1984-b6d1-cdd1-d29621cb6238@denx.de>
Date: Mon, 4 Apr 2022 21:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC][PATCH 2/3] drm/modes: Make width-mm/height-mm mandatory in
 of_get_drm_panel_display_mode()
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
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
 <YksWPK6ukLGAUTUo@robh.at.kernel.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YksWPK6ukLGAUTUo@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/4/22 18:01, Rob Herring wrote:
> On Sat, Apr 02, 2022 at 07:55:59PM +0200, Marek Vasut wrote:
>> On 4/2/22 19:08, Noralf Trønnes wrote:
>>>
>>>
>>> Den 02.04.2022 18.39, skrev Marek Vasut:
>>>> On 4/2/22 09:45, Noralf Trønnes wrote:
>>>>>
>>>>>
>>>>> Den 02.04.2022 06.28, skrev Marek Vasut:
>>>>>> On 4/2/22 05:19, Laurent Pinchart wrote:
>>>>>>> On Fri, Apr 01, 2022 at 10:36:24PM +0200, Marek Vasut wrote:
>>>>>>>> On 4/1/22 20:46, Laurent Pinchart wrote:
>>>>>>>>> On Fri, Apr 01, 2022 at 06:37:54PM +0200, Marek Vasut wrote:
>>>>>>>>>> Make the width-mm/height-mm panel properties mandatory in
>>>>>>>>>> of_get_drm_panel_display_mode(), print error message and
>>>>>>>>>> return -ve in case these DT properties are not present.
>>>>>>>>>> This is needed to correctly report panel dimensions.
>>>>>>>>>
>>>>>>>>> Can we guarantee this won't cause a regression ?
>>>>>>>>
>>>>>>>> For the upstream DTs, I think we can.
>>>>>>>> For downstream DTs, we cannot know.
>>>>>>>
>>>>>>> Are there users of this function whose DT bindings don't require the
>>>>>>> width-mm and height-mm properties ?
>>>>>>
>>>>>> There is literally one user of this function upstream:
>>>>>> drivers/gpu/drm/tiny/panel-mipi-dbi.c
>>>>>
>>>>> Yes, the function was added for that driver since it was so generic in
>>>>> nature. What about adding an argument to of_get_drm_panel_display_mode()
>>>>> that tells if the properties are mandatory or not?
>>>>
>>>> Sure, we can do that, but maybe the question here is even bigger than
>>>> this series.
>>>>
>>>> Should every panel set mandatory width_mm/height_mm so e.g. the user
>>>> space can infer DPI from it and set up scaling accordingly, or should
>>>> width_mm/height_mm be optional ?
>>>>
>>>> I think width_mm/height_mm should be mandatory for all panels.
>>>>
>>>> Thoughts ?
>>>
>>> If this had come up during the review of the driver I would have no
>>> problem making it mandatory. It makes sense for DPI. Maybe it's possible
>>> to get around the ABI break by getting in a change through -fixes before
>>> 5.18 is released? I'm fine with that.
>>
>> Well that's awesome, the dbi-spi.yaml didn't land in any kernel release yet,
>> so we still have a chance to fix it ? Rob ?
> 
> Yes, it can be fixed. And the binding, not the kernel, is the place to
> enforce it being mandatory IMO.

All right, I sent 1/3 separately with Fixes: tag, so it can be applied .

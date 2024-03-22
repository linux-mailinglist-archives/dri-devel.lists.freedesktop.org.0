Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58708886FB5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 16:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CF611253A;
	Fri, 22 Mar 2024 15:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="xvYY0svq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74DB11253A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 15:22:58 +0000 (UTC)
Message-ID: <9063f7cd-e922-484f-a2ac-cf84c4f47100@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711120976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n14/GAey1MVQQZ9496BWTZLRI/CaUeVuyvNjQAWmb5w=;
 b=xvYY0svqy/qpIv8OVXzIJyTXGPfIQ8a+wpEAnw9O+QTGZHAcRZMZBQVKKx6XXX7TSoVUlC
 GnkjohFYMbvlftzsyBSuC9aWBUWd2vLYgSf5Cx+aALEGQiIaIG338DTeE20B5GvyViTxIy
 r3J597Jj4gHupcJDt3bMrHISFxO9h/4=
Date: Fri, 22 Mar 2024 11:22:52 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/8] drm: xlnx: Fix kerneldoc
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: Michal Simek <michal.simek@amd.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20240319225122.3048400-1-sean.anderson@linux.dev>
 <20240319225122.3048400-2-sean.anderson@linux.dev>
 <e2eba421-cba1-4dd5-837c-6be5f07ed402@ideasonboard.com>
 <d4072aa1-47e4-45d3-9e04-2cd9d782b593@infradead.org>
 <2c38ac1c-cc0e-43b3-86d3-5b6a2f00f9e7@linux.dev>
 <19d6da67-f9a6-4e01-a956-3b60f0ebf769@ideasonboard.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <19d6da67-f9a6-4e01-a956-3b60f0ebf769@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 3/22/24 01:50, Tomi Valkeinen wrote:
> On 21/03/2024 17:33, Sean Anderson wrote:
>> On 3/20/24 02:05, Randy Dunlap wrote:
>>>
>>>
>>> On 3/19/24 22:42, Tomi Valkeinen wrote:
>>>> On 20/03/2024 00:51, Sean Anderson wrote:
>>>>> Fix a few errors in the kerneldoc. Mostly this addresses missing/renamed
>>>>> members.
>>>>>
>>>>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>>>>> ---
>>>>>
>>>>> Changes in v2:
>>>>> - New
>>>>>
>>>>>    drivers/gpu/drm/xlnx/zynqmp_disp.c  | 6 +++---
>>>>>    drivers/gpu/drm/xlnx/zynqmp_dpsub.h | 1 +
>>>>>    drivers/gpu/drm/xlnx/zynqmp_kms.h   | 4 ++--
>>>>>    3 files changed, 6 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>>>> index 407bc07cec69..f79bf3fb8110 100644
>>>>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>>>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>>>> @@ -128,9 +128,9 @@ struct zynqmp_disp_layer {
>>>>>     * struct zynqmp_disp - Display controller
>>>>>     * @dev: Device structure
>>>>>     * @dpsub: Display subsystem
>>>>> - * @blend.base: Register I/O base address for the blender
>>>>> - * @avbuf.base: Register I/O base address for the audio/video buffer manager
>>>>> - * @audio.base: Registers I/O base address for the audio mixer
>>>>> + * @blend: Register I/O base address for the blender
>>>>> + * @avbuf: Register I/O base address for the audio/video buffer manager
>>>>> + * @audio: Registers I/O base address for the audio mixer
>>>>
>>>> Afaics, the kernel doc guide:
>>>>
>>>> https://docs.kernel.org/doc-guide/kernel-doc.html#nested-structs-unions
>>>>
>>>> says that the current version is correct. Or is the issue that while, say, 'base' is documented, 'blend' was not?
>>>
>>> Hi,
>>>
>>> I would do it more like so:
>>>
>>> ---
>>>   drivers/gpu/drm/xlnx/zynqmp_disp.c |    3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff -- a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>> @@ -128,8 +128,11 @@ struct zynqmp_disp_layer {
>>>    * struct zynqmp_disp - Display controller
>>>    * @dev: Device structure
>>>    * @dpsub: Display subsystem
>>> + * @blend: blender iomem info
>>>    * @blend.base: Register I/O base address for the blender
>>> + * @avbuf: audio/video buffer iomem info
>>>    * @avbuf.base: Register I/O base address for the audio/video buffer manager
>>> + * @audio: audio mixer iomem info
>>>    * @audio.base: Registers I/O base address for the audio mixer
>>>    * @layers: Layers (planes)
>>>    */
>>>
>>>
>>> but in my testing, Sean's way or my way result in no warning/errors.
>>>
>>
>> The specific errors are:
>>
>> ../drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or struct member 'blend' not described in 'zynqmp_disp'
>> ../drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or struct member 'avbuf' not described in 'zynqmp_disp'
>> ../drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or struct member 'audio' not described in 'zynqmp_disp'
>>
>> I don't see the need to document a single-member struct twice. Actually,
> 
> But if only the struct is documented, then we're documenting the wrong thing. A tool showing to the user what blend.base is would miss that documentation.

Are there any such tools? kerneldoc e.g. just prints the definition and
then a list of members with documentation. So from the user's
perspective the only thing which changes is the name.

--Sean

>> maybe it would be better to just lift the .base member to live in
>> zynqmp_disp. But I think that would be better in another series.
> 
> Yes, there's not much point with the structs.
> 
>  Tomi
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2860988666E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 06:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7BD10E2A1;
	Fri, 22 Mar 2024 05:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yrz8fDUV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F5D10E2A1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 05:51:00 +0000 (UTC)
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi
 [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C95782A;
 Fri, 22 Mar 2024 06:50:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1711086631;
 bh=GY/sUvmM1mLxF32AoCd7xA0bTlkUTTNkywVo0ImEZZQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Yrz8fDUVV5FnG9d3LMNWlJgC6nrHFP/33N6EC36BMK6xj04TKksWmoYFvdcQ2zEg5
 tQI96VEk+SQzYrQ/UioOP8POk2BkTgH45FoGmLvsfV6mBsDapOvgRE8WYbLZcgsmRn
 L1qS3qNPqgvF7jIMDE24EMQODkTYCPVYtaxRe2Gg=
Message-ID: <19d6da67-f9a6-4e01-a956-3b60f0ebf769@ideasonboard.com>
Date: Fri, 22 Mar 2024 07:50:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] drm: xlnx: Fix kerneldoc
Content-Language: en-US
To: Sean Anderson <sean.anderson@linux.dev>,
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
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <2c38ac1c-cc0e-43b3-86d3-5b6a2f00f9e7@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 21/03/2024 17:33, Sean Anderson wrote:
> On 3/20/24 02:05, Randy Dunlap wrote:
>>
>>
>> On 3/19/24 22:42, Tomi Valkeinen wrote:
>>> On 20/03/2024 00:51, Sean Anderson wrote:
>>>> Fix a few errors in the kerneldoc. Mostly this addresses missing/renamed
>>>> members.
>>>>
>>>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - New
>>>>
>>>>    drivers/gpu/drm/xlnx/zynqmp_disp.c  | 6 +++---
>>>>    drivers/gpu/drm/xlnx/zynqmp_dpsub.h | 1 +
>>>>    drivers/gpu/drm/xlnx/zynqmp_kms.h   | 4 ++--
>>>>    3 files changed, 6 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>>> index 407bc07cec69..f79bf3fb8110 100644
>>>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>>> @@ -128,9 +128,9 @@ struct zynqmp_disp_layer {
>>>>     * struct zynqmp_disp - Display controller
>>>>     * @dev: Device structure
>>>>     * @dpsub: Display subsystem
>>>> - * @blend.base: Register I/O base address for the blender
>>>> - * @avbuf.base: Register I/O base address for the audio/video buffer manager
>>>> - * @audio.base: Registers I/O base address for the audio mixer
>>>> + * @blend: Register I/O base address for the blender
>>>> + * @avbuf: Register I/O base address for the audio/video buffer manager
>>>> + * @audio: Registers I/O base address for the audio mixer
>>>
>>> Afaics, the kernel doc guide:
>>>
>>> https://docs.kernel.org/doc-guide/kernel-doc.html#nested-structs-unions
>>>
>>> says that the current version is correct. Or is the issue that while, say, 'base' is documented, 'blend' was not?
>>
>> Hi,
>>
>> I would do it more like so:
>>
>> ---
>>   drivers/gpu/drm/xlnx/zynqmp_disp.c |    3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff -- a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> @@ -128,8 +128,11 @@ struct zynqmp_disp_layer {
>>    * struct zynqmp_disp - Display controller
>>    * @dev: Device structure
>>    * @dpsub: Display subsystem
>> + * @blend: blender iomem info
>>    * @blend.base: Register I/O base address for the blender
>> + * @avbuf: audio/video buffer iomem info
>>    * @avbuf.base: Register I/O base address for the audio/video buffer manager
>> + * @audio: audio mixer iomem info
>>    * @audio.base: Registers I/O base address for the audio mixer
>>    * @layers: Layers (planes)
>>    */
>>
>>
>> but in my testing, Sean's way or my way result in no warning/errors.
>>
> 
> The specific errors are:
> 
> ../drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or struct member 'blend' not described in 'zynqmp_disp'
> ../drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or struct member 'avbuf' not described in 'zynqmp_disp'
> ../drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or struct member 'audio' not described in 'zynqmp_disp'
> 
> I don't see the need to document a single-member struct twice. Actually,

But if only the struct is documented, then we're documenting the wrong 
thing. A tool showing to the user what blend.base is would miss that 
documentation.

> maybe it would be better to just lift the .base member to live in
> zynqmp_disp. But I think that would be better in another series.

Yes, there's not much point with the structs.

  Tomi


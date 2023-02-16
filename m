Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 845A0699C5D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 19:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9C410E181;
	Thu, 16 Feb 2023 18:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 455 seconds by postgrey-1.36 at gabe;
 Thu, 16 Feb 2023 18:34:09 UTC
Received: from forward502c.mail.yandex.net (forward502c.mail.yandex.net
 [178.154.239.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3FA10E181
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 18:34:09 +0000 (UTC)
Received: from iva8-eaa10739bb9b.qloud-c.yandex.net
 (iva8-eaa10739bb9b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:c20e:0:640:eaa1:739])
 by forward502c.mail.yandex.net (Yandex) with ESMTP id A08895EEB9;
 Thu, 16 Feb 2023 21:26:31 +0300 (MSK)
Received: by iva8-eaa10739bb9b.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id TQqiIlBYp0U1-EKlK2b5X; Thu, 16 Feb 2023 21:26:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lach.pw; s=mail;
 t=1676571991; bh=+N+w4FHvR3Wjef2EHy6zll+1B2G14vAMncJdLdK0Ogo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=a2Qiv7hwTp5yNYPhWoVpNHATB+bHBOISVtxk28g7FUvcyaQt+oigBh59vSHUgaH+p
 cH7Ws62eINz0arMvYBeWv8y/fLNIw+7Jvv2DSBI+vx/P6Uc+qBRBKTqVPUOOtY8xsR
 DC1lha5BJjFVpTPvuUHakryDk+Ga8pLu1ddhQTlQ=
Authentication-Results: iva8-eaa10739bb9b.qloud-c.yandex.net;
 dkim=pass header.i=@lach.pw
Message-ID: <d6f66bf7-356a-4bd9-fa21-a3197c0dff50@lach.pw>
Date: Thu, 16 Feb 2023 19:26:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/edid: Add Vive Pro 2 to non-desktop list
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20220118170037.14584-1-iam@lach.pw>
 <5d5a8183-aebc-6660-9cbc-03950f9b14b8@collabora.com>
 <87v8k5vqg6.fsf@intel.com>
 <831e7daf-48ae-cea8-a5d2-3786317b3b65@collabora.com>
 <87sff9vl6j.fsf@intel.com>
 <b5f6c63e-adf3-38a6-18fb-c92c764c23f3@collabora.com>
From: Iaroslav Boliukin <iam@lach.pw>
In-Reply-To: <b5f6c63e-adf3-38a6-18fb-c92c764c23f3@collabora.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/14/23 12:50, Dmitry Osipenko wrote:
> On 2/13/23 14:50, Jani Nikula wrote:
>> On Mon, 13 Feb 2023, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>> On 2/13/23 12:56, Jani Nikula wrote:
>>>> On Sun, 12 Feb 2023, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>>>> Hi,
>>>>>
>>>>> On 1/18/22 20:00, Yaroslav Bolyukin wrote:
>>>>>
>>>>> Add a brief commit message, describing a user-visible effect of this
>>>>> patch. Tell that this change prevents exposing headset as a regular
>>>>> display to the system, while it will work with SteamVR.
>>>>>
>>>>>> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>>>>>> ---
>>>>>>   drivers/gpu/drm/drm_edid.c | 3 ++-
>>>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>>>>> index 12893e7be..fdb8f0a6f 100644
>>>>>> --- a/drivers/gpu/drm/drm_edid.c
>>>>>> +++ b/drivers/gpu/drm/drm_edid.c
>>>>>> @@ -200,9 +200,10 @@ static const struct edid_quirk {
>>>>>>   	EDID_QUIRK('V', 'L', 'V', 0x91be, EDID_QUIRK_NON_DESKTOP),
>>>>>>   	EDID_QUIRK('V', 'L', 'V', 0x91bf, EDID_QUIRK_NON_DESKTOP),
>>>>>>   
>>>>>> -	/* HTC Vive and Vive Pro VR Headsets */
>>>>>> +	/* HTC Vive, Vive Pro and Vive Pro 2 VR Headsets */
>>>>>
>>>>> Nit: I'd keep the original comment, or change it to a generic "HTC VR
>>>>> Headsets" to prevent further comment changes
>>>>>
>>>>>>   	EDID_QUIRK('H', 'V', 'R', 0xaa01, EDID_QUIRK_NON_DESKTOP),
>>>>>>   	EDID_QUIRK('H', 'V', 'R', 0xaa02, EDID_QUIRK_NON_DESKTOP),
>>>>>> +	EDID_QUIRK('H', 'V', 'R', 0xaa04, EDID_QUIRK_NON_DESKTOP),
>>>>>>   
>>>>>>   	/* Oculus Rift DK1, DK2, CV1 and Rift S VR Headsets */
>>>>>>   	EDID_QUIRK('O', 'V', 'R', 0x0001, EDID_QUIRK_NON_DESKTOP),
>>>>>>
>>>>>> base-commit: 99613159ad749543621da8238acf1a122880144e
>>>>>
>>>>> Please send the v2 patch with the added EDID for Cosmos VR and the
>>>>> addressed comments. Thanks!
>>>>
>>>> Yeah, we'll need to EDID to check that it doesn't have the Microsoft
>>>> VSDB to indicate non-desktop. See 2869f599c0d8 ("drm/edid: support
>>>> Microsoft extension for HMDs and specialized monitors").
>>>
>>> Do you mean to skip using the EDID_QUIRK_NON_DESKTOP if MS VSDB entry
>>> presents in the EDID?
>>>
>>> These HTC EDIDs don't have MS VSDB, otherwise the quirk wouldn't be needed.
>>
>> Okay, I didn't know that. I just observed that the original patch was
>> sent before the the MS VSDB parsing was added.
> 
> This will be good to mention in the v2 commit message.
> 

This headset does support some kind of HMD signalling, however, this is 
not a microsoft-specific extension (0xca125c) but part of the DisplayId 
spec, "Display Product Primary Use Case" field is set to "7".

The problem is, I have no idea what spec I should refer to, as I can't 
find this errata in the original spec, and the only reference to this 
value I see is in https://git.linuxtv.org/edid-decode.git utility:

https://git.linuxtv.org/edid-decode.git/tree/parse-displayid-block.cpp?ref=aa956e0dd5fb85271dde900ea1ebdda795af7f8b#n1676

I would like to implement this feature, but I need some spec reference.

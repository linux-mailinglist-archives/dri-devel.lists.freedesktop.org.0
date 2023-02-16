Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E61699CE9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 20:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA55A10E187;
	Thu, 16 Feb 2023 19:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF96610E187
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 19:17:48 +0000 (UTC)
Received: from [192.168.2.109] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 00E3D66020C5;
 Thu, 16 Feb 2023 19:17:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676575067;
 bh=KelSBIcFPOMpwc6QrwAztZm3NSF4137ddDvT1p48FBw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dM+uL5TQseZUO7mMSdY2OYwFJ3km5PZW1CGa1qU+JeYSFYJiYH/9ZgVMCXGAbm0lW
 QfDkhY34pl5mZrAOiIWn/vBBQ09EGZaBrNeeMjHIyKSFbW0SRNKCNr8puOH+zGv0x8
 w6CjG2Xc6tu8muZ6eaCtMfLkbLy6lP/p89HlOTfxt0NkkQ6esf+rz0S9GUAytZ2NlO
 gQR1jAFBpz4jLaehwwpCxhUpw1woYFB2rOkAlHGElysU9y+KsA9F5a65Fy57L7w4sp
 KV7S3bEp6s2MwKwx5xrU3ccSNfmMWBywNvhXK8w/vsxSXdcUCGrXtjNs/saoFlebSi
 ou197pcV4eq6g==
Message-ID: <88191cc6-e751-daa9-37f5-eda92d541098@collabora.com>
Date: Thu, 16 Feb 2023 22:17:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/edid: Add Vive Pro 2 to non-desktop list
Content-Language: en-US
To: Yaroslav Boliukin <iam@lach.pw>, Jani Nikula
 <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20220118170037.14584-1-iam@lach.pw>
 <5d5a8183-aebc-6660-9cbc-03950f9b14b8@collabora.com>
 <87v8k5vqg6.fsf@intel.com>
 <831e7daf-48ae-cea8-a5d2-3786317b3b65@collabora.com>
 <87sff9vl6j.fsf@intel.com>
 <b5f6c63e-adf3-38a6-18fb-c92c764c23f3@collabora.com>
 <d6f66bf7-356a-4bd9-fa21-a3197c0dff50@lach.pw>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <d6f66bf7-356a-4bd9-fa21-a3197c0dff50@lach.pw>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/16/23 21:26, Iaroslav Boliukin wrote:
> On 2/14/23 12:50, Dmitry Osipenko wrote:
>> On 2/13/23 14:50, Jani Nikula wrote:
>>> On Mon, 13 Feb 2023, Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> wrote:
>>>> On 2/13/23 12:56, Jani Nikula wrote:
>>>>> On Sun, 12 Feb 2023, Dmitry Osipenko
>>>>> <dmitry.osipenko@collabora.com> wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 1/18/22 20:00, Yaroslav Bolyukin wrote:
>>>>>>
>>>>>> Add a brief commit message, describing a user-visible effect of this
>>>>>> patch. Tell that this change prevents exposing headset as a regular
>>>>>> display to the system, while it will work with SteamVR.
>>>>>>
>>>>>>> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/drm_edid.c | 3 ++-
>>>>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>>>>>> index 12893e7be..fdb8f0a6f 100644
>>>>>>> --- a/drivers/gpu/drm/drm_edid.c
>>>>>>> +++ b/drivers/gpu/drm/drm_edid.c
>>>>>>> @@ -200,9 +200,10 @@ static const struct edid_quirk {
>>>>>>>       EDID_QUIRK('V', 'L', 'V', 0x91be, EDID_QUIRK_NON_DESKTOP),
>>>>>>>       EDID_QUIRK('V', 'L', 'V', 0x91bf, EDID_QUIRK_NON_DESKTOP),
>>>>>>>   -    /* HTC Vive and Vive Pro VR Headsets */
>>>>>>> +    /* HTC Vive, Vive Pro and Vive Pro 2 VR Headsets */
>>>>>>
>>>>>> Nit: I'd keep the original comment, or change it to a generic "HTC VR
>>>>>> Headsets" to prevent further comment changes
>>>>>>
>>>>>>>       EDID_QUIRK('H', 'V', 'R', 0xaa01, EDID_QUIRK_NON_DESKTOP),
>>>>>>>       EDID_QUIRK('H', 'V', 'R', 0xaa02, EDID_QUIRK_NON_DESKTOP),
>>>>>>> +    EDID_QUIRK('H', 'V', 'R', 0xaa04, EDID_QUIRK_NON_DESKTOP),
>>>>>>>         /* Oculus Rift DK1, DK2, CV1 and Rift S VR Headsets */
>>>>>>>       EDID_QUIRK('O', 'V', 'R', 0x0001, EDID_QUIRK_NON_DESKTOP),
>>>>>>>
>>>>>>> base-commit: 99613159ad749543621da8238acf1a122880144e
>>>>>>
>>>>>> Please send the v2 patch with the added EDID for Cosmos VR and the
>>>>>> addressed comments. Thanks!
>>>>>
>>>>> Yeah, we'll need to EDID to check that it doesn't have the Microsoft
>>>>> VSDB to indicate non-desktop. See 2869f599c0d8 ("drm/edid: support
>>>>> Microsoft extension for HMDs and specialized monitors").
>>>>
>>>> Do you mean to skip using the EDID_QUIRK_NON_DESKTOP if MS VSDB entry
>>>> presents in the EDID?
>>>>
>>>> These HTC EDIDs don't have MS VSDB, otherwise the quirk wouldn't be
>>>> needed.
>>>
>>> Okay, I didn't know that. I just observed that the original patch was
>>> sent before the the MS VSDB parsing was added.
>>
>> This will be good to mention in the v2 commit message.
>>
> 
> This headset does support some kind of HMD signalling, however, this is
> not a microsoft-specific extension (0xca125c) but part of the DisplayId
> spec, "Display Product Primary Use Case" field is set to "7".
> 
> The problem is, I have no idea what spec I should refer to, as I can't
> find this errata in the original spec, and the only reference to this
> value I see is in https://git.linuxtv.org/edid-decode.git utility:
> 
> https://git.linuxtv.org/edid-decode.git/tree/parse-displayid-block.cpp?ref=aa956e0dd5fb85271dde900ea1ebdda795af7f8b#n1676
> 
> I would like to implement this feature, but I need some spec reference.

The [1] says it's "VESA DisplayID Standard v2.0", which should be okay
to refer, IMO.

[1]
https://learn.microsoft.com/en-us/windows-hardware/drivers/display/specialized-monitors-edid-extension

-- 
Best regards,
Dmitry


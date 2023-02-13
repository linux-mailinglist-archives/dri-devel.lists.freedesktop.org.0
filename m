Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9089D69424E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 11:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E5210E51B;
	Mon, 13 Feb 2023 10:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA5210E51B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 10:08:47 +0000 (UTC)
Received: from [192.168.2.90] (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 40A18660210A;
 Mon, 13 Feb 2023 10:08:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676282926;
 bh=YPLHnkQNpca9VTtsx1eIso2TqXYEdu5z+uATtJlB3do=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S/bLB7DxztJqMO/z9ugNy+ayGKeJ7MpT+9XXHYEGiGoyVMbCQPWqha6ixtSnH/AI4
 KuKOTfcuvxYCDGhj6xjUGELBDn6ihQeLC8r1id6YKaP+CJ//FV1NssKiXHKqHEYwjS
 CaRRPi91KohlMYE633TN/yUQivREzL4fFM/sZIVuNfzdV1l8Zdhy/gyA0TACwJMPo7
 mzrrn0iUZkKoaMUyv4+2PWXmkrUxbDSi1ItVeEpvzYa7Hk0bBc8IixZF8wlsZHeOKT
 wceVAGo1QhmLFqG1wXVo0zCS+Qf5jdkjiv6I7rd7YE0V9g3K0oAlaBQA+3eEKE6E1X
 aymFj4Lo1GehA==
Message-ID: <831e7daf-48ae-cea8-a5d2-3786317b3b65@collabora.com>
Date: Mon, 13 Feb 2023 13:08:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/edid: Add Vive Pro 2 to non-desktop list
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, Yaroslav Bolyukin
 <iam@lach.pw>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20220118170037.14584-1-iam@lach.pw>
 <5d5a8183-aebc-6660-9cbc-03950f9b14b8@collabora.com>
 <87v8k5vqg6.fsf@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <87v8k5vqg6.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/13/23 12:56, Jani Nikula wrote:
> On Sun, 12 Feb 2023, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>> Hi,
>>
>> On 1/18/22 20:00, Yaroslav Bolyukin wrote:
>>
>> Add a brief commit message, describing a user-visible effect of this
>> patch. Tell that this change prevents exposing headset as a regular
>> display to the system, while it will work with SteamVR.
>>
>>> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>>> ---
>>>  drivers/gpu/drm/drm_edid.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>> index 12893e7be..fdb8f0a6f 100644
>>> --- a/drivers/gpu/drm/drm_edid.c
>>> +++ b/drivers/gpu/drm/drm_edid.c
>>> @@ -200,9 +200,10 @@ static const struct edid_quirk {
>>>  	EDID_QUIRK('V', 'L', 'V', 0x91be, EDID_QUIRK_NON_DESKTOP),
>>>  	EDID_QUIRK('V', 'L', 'V', 0x91bf, EDID_QUIRK_NON_DESKTOP),
>>>  
>>> -	/* HTC Vive and Vive Pro VR Headsets */
>>> +	/* HTC Vive, Vive Pro and Vive Pro 2 VR Headsets */
>>
>> Nit: I'd keep the original comment, or change it to a generic "HTC VR
>> Headsets" to prevent further comment changes
>>
>>>  	EDID_QUIRK('H', 'V', 'R', 0xaa01, EDID_QUIRK_NON_DESKTOP),
>>>  	EDID_QUIRK('H', 'V', 'R', 0xaa02, EDID_QUIRK_NON_DESKTOP),
>>> +	EDID_QUIRK('H', 'V', 'R', 0xaa04, EDID_QUIRK_NON_DESKTOP),
>>>  
>>>  	/* Oculus Rift DK1, DK2, CV1 and Rift S VR Headsets */
>>>  	EDID_QUIRK('O', 'V', 'R', 0x0001, EDID_QUIRK_NON_DESKTOP),
>>>
>>> base-commit: 99613159ad749543621da8238acf1a122880144e
>>
>> Please send the v2 patch with the added EDID for Cosmos VR and the
>> addressed comments. Thanks!
> 
> Yeah, we'll need to EDID to check that it doesn't have the Microsoft
> VSDB to indicate non-desktop. See 2869f599c0d8 ("drm/edid: support
> Microsoft extension for HMDs and specialized monitors").

Do you mean to skip using the EDID_QUIRK_NON_DESKTOP if MS VSDB entry
presents in the EDID?

These HTC EDIDs don't have MS VSDB, otherwise the quirk wouldn't be needed.

-- 
Best regards,
Dmitry


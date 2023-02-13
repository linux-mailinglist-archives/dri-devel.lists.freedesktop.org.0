Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AC56944DA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 12:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC41710E576;
	Mon, 13 Feb 2023 11:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BE610E576
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 11:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676289039; x=1707825039;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HHo5hkf7ePnw7hymMJz5mvT09MRA7S3XjdFPfPAUUwA=;
 b=lTtzogpgBxjePojj0m4NEK1DJm1WYRMfQLW/W5DYIyi3ODRWO2qcrW0T
 rfmSPeMInNWds0xflU5VAZ9s6dl2uwRqHGI2CtbMnSOjzx+Cb3/QDlMhu
 NvNGC27/q8ZJZqLymxlO/xAaCHPgul1djTQqi9ZDkegpcUOn97oLUYW4q
 aVvYRuRuDccsVg+olC4PZ4a4AEsbym40SkfUh/kygmSap+oSaRfsCQ9mC
 fFepdUvhrnxWL+IckISo8PvTgvQfnAekgh9y2am+z0mbzpqzeSSr/56xD
 /4Zae1qGvfWL5pYfHWhnrJ6sdNrU5Q/aIUZRu3i7ipmU93ztA7WeJBm/D A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="358281683"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="358281683"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 03:50:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="701241864"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="701241864"
Received: from tkatila-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 03:50:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Yaroslav Bolyukin
 <iam@lach.pw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/edid: Add Vive Pro 2 to non-desktop list
In-Reply-To: <831e7daf-48ae-cea8-a5d2-3786317b3b65@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220118170037.14584-1-iam@lach.pw>
 <5d5a8183-aebc-6660-9cbc-03950f9b14b8@collabora.com>
 <87v8k5vqg6.fsf@intel.com>
 <831e7daf-48ae-cea8-a5d2-3786317b3b65@collabora.com>
Date: Mon, 13 Feb 2023 13:50:28 +0200
Message-ID: <87sff9vl6j.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 13 Feb 2023, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> On 2/13/23 12:56, Jani Nikula wrote:
>> On Sun, 12 Feb 2023, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>> Hi,
>>>
>>> On 1/18/22 20:00, Yaroslav Bolyukin wrote:
>>>
>>> Add a brief commit message, describing a user-visible effect of this
>>> patch. Tell that this change prevents exposing headset as a regular
>>> display to the system, while it will work with SteamVR.
>>>
>>>> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>>>> ---
>>>>  drivers/gpu/drm/drm_edid.c | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>>> index 12893e7be..fdb8f0a6f 100644
>>>> --- a/drivers/gpu/drm/drm_edid.c
>>>> +++ b/drivers/gpu/drm/drm_edid.c
>>>> @@ -200,9 +200,10 @@ static const struct edid_quirk {
>>>>  	EDID_QUIRK('V', 'L', 'V', 0x91be, EDID_QUIRK_NON_DESKTOP),
>>>>  	EDID_QUIRK('V', 'L', 'V', 0x91bf, EDID_QUIRK_NON_DESKTOP),
>>>>  
>>>> -	/* HTC Vive and Vive Pro VR Headsets */
>>>> +	/* HTC Vive, Vive Pro and Vive Pro 2 VR Headsets */
>>>
>>> Nit: I'd keep the original comment, or change it to a generic "HTC VR
>>> Headsets" to prevent further comment changes
>>>
>>>>  	EDID_QUIRK('H', 'V', 'R', 0xaa01, EDID_QUIRK_NON_DESKTOP),
>>>>  	EDID_QUIRK('H', 'V', 'R', 0xaa02, EDID_QUIRK_NON_DESKTOP),
>>>> +	EDID_QUIRK('H', 'V', 'R', 0xaa04, EDID_QUIRK_NON_DESKTOP),
>>>>  
>>>>  	/* Oculus Rift DK1, DK2, CV1 and Rift S VR Headsets */
>>>>  	EDID_QUIRK('O', 'V', 'R', 0x0001, EDID_QUIRK_NON_DESKTOP),
>>>>
>>>> base-commit: 99613159ad749543621da8238acf1a122880144e
>>>
>>> Please send the v2 patch with the added EDID for Cosmos VR and the
>>> addressed comments. Thanks!
>> 
>> Yeah, we'll need to EDID to check that it doesn't have the Microsoft
>> VSDB to indicate non-desktop. See 2869f599c0d8 ("drm/edid: support
>> Microsoft extension for HMDs and specialized monitors").
>
> Do you mean to skip using the EDID_QUIRK_NON_DESKTOP if MS VSDB entry
> presents in the EDID?
>
> These HTC EDIDs don't have MS VSDB, otherwise the quirk wouldn't be needed.

Okay, I didn't know that. I just observed that the original patch was
sent before the the MS VSDB parsing was added.

BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center

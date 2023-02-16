Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB3B699E2B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 21:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7694B10E194;
	Thu, 16 Feb 2023 20:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F41310E194
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 20:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676580399; x=1708116399;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=5XGO952p7J79OlOiOumtG7WXvo8d+ppeqjm8EtI4dAw=;
 b=EAYdZNZo77vLSKJkPMFYITBzOcBoAqDSmfZemHl61nYED54V3j661tjK
 thPi35gdej2mYNPtvQK423+cNV8RHlge2vzrYkORPq70jI/3JNtAyuFfK
 xI4GvNWh/Obm1+O1jwvr/1vExKC8LaiEnVl5qaxIb3XBh8zxQ0qoJ9qIl
 Ywx99m4eELSLEMudstcAHyeGt/R8FThkGq3aihUxBZAJe6ggU/Y+cVJRH
 UKTzOKwWm+1fiQj1o2PMmS742YxgZQcnxO6j6DDJbr6qw8EjnUICw5iS6
 QZEj3li1ooZ+YYi+tAwV54wZ1/EX2FvSE8VAnhgugzP5S3aeYnn/AR2JS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="396511866"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="396511866"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 12:46:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813128584"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="813128584"
Received: from uwah-mobl.ger.corp.intel.com (HELO localhost) ([10.252.63.106])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 12:46:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Yaroslav Boliukin
 <iam@lach.pw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/edid: Add Vive Pro 2 to non-desktop list
In-Reply-To: <88191cc6-e751-daa9-37f5-eda92d541098@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220118170037.14584-1-iam@lach.pw>
 <5d5a8183-aebc-6660-9cbc-03950f9b14b8@collabora.com>
 <87v8k5vqg6.fsf@intel.com>
 <831e7daf-48ae-cea8-a5d2-3786317b3b65@collabora.com>
 <87sff9vl6j.fsf@intel.com>
 <b5f6c63e-adf3-38a6-18fb-c92c764c23f3@collabora.com>
 <d6f66bf7-356a-4bd9-fa21-a3197c0dff50@lach.pw>
 <88191cc6-e751-daa9-37f5-eda92d541098@collabora.com>
Date: Thu, 16 Feb 2023 22:46:31 +0200
Message-ID: <87cz69z6c8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 16 Feb 2023, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> On 2/16/23 21:26, Iaroslav Boliukin wrote:
>> On 2/14/23 12:50, Dmitry Osipenko wrote:
>>> On 2/13/23 14:50, Jani Nikula wrote:
>>>> On Mon, 13 Feb 2023, Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> wrote:
>>>>> On 2/13/23 12:56, Jani Nikula wrote:
>>>>>> On Sun, 12 Feb 2023, Dmitry Osipenko
>>>>>> <dmitry.osipenko@collabora.com> wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 1/18/22 20:00, Yaroslav Bolyukin wrote:
>>>>>>>
>>>>>>> Add a brief commit message, describing a user-visible effect of this
>>>>>>> patch. Tell that this change prevents exposing headset as a regular
>>>>>>> display to the system, while it will work with SteamVR.
>>>>>>>
>>>>>>>> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>>>>>>>> ---
>>>>>>>> =C2=A0 drivers/gpu/drm/drm_edid.c | 3 ++-
>>>>>>>> =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid=
.c
>>>>>>>> index 12893e7be..fdb8f0a6f 100644
>>>>>>>> --- a/drivers/gpu/drm/drm_edid.c
>>>>>>>> +++ b/drivers/gpu/drm/drm_edid.c
>>>>>>>> @@ -200,9 +200,10 @@ static const struct edid_quirk {
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EDID_QUIRK('V', 'L', 'V', 0x91be, E=
DID_QUIRK_NON_DESKTOP),
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EDID_QUIRK('V', 'L', 'V', 0x91bf, E=
DID_QUIRK_NON_DESKTOP),
>>>>>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 /* HTC Vive and Vive Pro VR Headsets */
>>>>>>>> +=C2=A0=C2=A0=C2=A0 /* HTC Vive, Vive Pro and Vive Pro 2 VR Headse=
ts */
>>>>>>>
>>>>>>> Nit: I'd keep the original comment, or change it to a generic "HTC =
VR
>>>>>>> Headsets" to prevent further comment changes
>>>>>>>
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EDID_QUIRK('H', 'V', 'R', 0xaa01, E=
DID_QUIRK_NON_DESKTOP),
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EDID_QUIRK('H', 'V', 'R', 0xaa02, E=
DID_QUIRK_NON_DESKTOP),
>>>>>>>> +=C2=A0=C2=A0=C2=A0 EDID_QUIRK('H', 'V', 'R', 0xaa04, EDID_QUIRK_N=
ON_DESKTOP),
>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Oculus Rift DK1, DK2, CV1=
 and Rift S VR Headsets */
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EDID_QUIRK('O', 'V', 'R', 0x0001, E=
DID_QUIRK_NON_DESKTOP),
>>>>>>>>
>>>>>>>> base-commit: 99613159ad749543621da8238acf1a122880144e
>>>>>>>
>>>>>>> Please send the v2 patch with the added EDID for Cosmos VR and the
>>>>>>> addressed comments. Thanks!
>>>>>>
>>>>>> Yeah, we'll need to EDID to check that it doesn't have the Microsoft
>>>>>> VSDB to indicate non-desktop. See 2869f599c0d8 ("drm/edid: support
>>>>>> Microsoft extension for HMDs and specialized monitors").
>>>>>
>>>>> Do you mean to skip using the EDID_QUIRK_NON_DESKTOP if MS VSDB entry
>>>>> presents in the EDID?
>>>>>
>>>>> These HTC EDIDs don't have MS VSDB, otherwise the quirk wouldn't be
>>>>> needed.
>>>>
>>>> Okay, I didn't know that. I just observed that the original patch was
>>>> sent before the the MS VSDB parsing was added.
>>>
>>> This will be good to mention in the v2 commit message.
>>>
>>=20
>> This headset does support some kind of HMD signalling, however, this is
>> not a microsoft-specific extension (0xca125c) but part of the DisplayId
>> spec, "Display Product Primary Use Case" field is set to "7".

I just sent patches to hopefully fix this, and make the quirk
unnecessary [1].

BR,
Jani.

[1] https://patchwork.freedesktop.org/series/114116/


>>=20
>> The problem is, I have no idea what spec I should refer to, as I can't
>> find this errata in the original spec, and the only reference to this
>> value I see is in https://git.linuxtv.org/edid-decode.git utility:
>>=20
>> https://git.linuxtv.org/edid-decode.git/tree/parse-displayid-block.cpp?r=
ef=3Daa956e0dd5fb85271dde900ea1ebdda795af7f8b#n1676
>>=20
>> I would like to implement this feature, but I need some spec reference.
>
> The [1] says it's "VESA DisplayID Standard v2.0", which should be okay
> to refer, IMO.
>
> [1]
> https://learn.microsoft.com/en-us/windows-hardware/drivers/display/specia=
lized-monitors-edid-extension

--=20
Jani Nikula, Intel Open Source Graphics Center

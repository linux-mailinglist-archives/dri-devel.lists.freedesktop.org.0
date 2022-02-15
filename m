Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB344B74B7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 20:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D022789BF1;
	Tue, 15 Feb 2022 19:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999A689BF1;
 Tue, 15 Feb 2022 19:34:33 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id h18so23069edb.7;
 Tue, 15 Feb 2022 11:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NPOCujyusK5ykKnoxBuwp+u72+0QqKzn06oxgPodhqo=;
 b=GdTlaXbSaqSNMbRMPMqz7PIbqBq9LPPgGEPUEEqsoW62Y8RgOLsN39URyP4hVVq5Ri
 yO4dMVHfIQep6xsldY+xQ5E07Pxgjg6frTPqdt4OISZcyCMIpmK5wcWXe5J5NNzObE2g
 S8BjcdExKIurc816LFPY9ICr+4HNCcXLK2+io01d4zsBM34vzU9xd+L3xrZIrAJBFXxC
 A4r53/pB10TQbPM4q+TmiYRMJxkbD5ydQCsr2cxEy+vzHPTAOnxPdxY12VmaXM4YO2Cj
 CKsHItClQSx3S3ku1Hj0m2+I6OCR66VsRgK8RaoyNrshXxn/haJTDpgwGZMnEeSAGxAX
 G05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NPOCujyusK5ykKnoxBuwp+u72+0QqKzn06oxgPodhqo=;
 b=KJFgBr3FcBc03rLZ9ljPh8lh6slrP7eEAF/JDNY8A2vMbScgH9feAG2JqjzdHlb+nq
 dTvpyukPoIvxVgZOixu0eY+6htKCLesUUYPjbmbHNqeU+3pM8qZStSmMt3gOGyFDoKvb
 oSWpXxUPFy97byV3Pmesq3s0Lo+5uno/u1O5m35MM3Gl73JD8W7kRJwlhwVBlz4gVKV3
 9q70ORGmC1Iye8KvFiOca1XqIMJUOmKTS/WkT+05eKvyY2Tsltz9zis28ep97VXunQj4
 Un7ZVCsxDPU6GY4UuYNtJZoM+ui+dgL2u488CV8FgNuq4lcXPfOTU0ujYFTLhGXJNFco
 6niQ==
X-Gm-Message-State: AOAM530wvs7Nhal8DVXRS04ecGwJq7ywrp92YpnfMPi6ZI1W4OkIV/KF
 bq2ghF9QCc+IJMjl2unOqkg=
X-Google-Smtp-Source: ABdhPJwzc9V2dhu2WvV2S9VmjPAoRmf4RZwgXTryaAecY1aIqBmD1MbSlLaybhVQIHZJhTMFfTegtQ==
X-Received: by 2002:a05:6402:4313:: with SMTP id
 m19mr497688edc.320.1644953671895; 
 Tue, 15 Feb 2022 11:34:31 -0800 (PST)
Received: from [0.0.0.0] ([134.134.137.84])
 by smtp.googlemail.com with ESMTPSA id ek21sm329816edb.27.2022.02.15.11.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 11:34:31 -0800 (PST)
Message-ID: <1c7ebd63-aef0-accf-16ce-857b8352c3ba@gmail.com>
Date: Tue, 15 Feb 2022 21:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [Intel-gfx] [PATCH v5 16/19] uapi/drm/dg2: Introduce format
 modifier for DG2 clear color
Content-Language: en-US
To: "Chery, Nanley G" <nanley.g.chery@intel.com>,
 Nanley Chery <nanleychery@gmail.com>, "C, Ramalingam"
 <ramalingam.c@intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
 <20220201104132.3050-17-ramalingam.c@intel.com>
 <CAJDL4u+hX2Dbu7q5P48t44XLSOr7vA9mf_jiC607oA1Y6+2k6Q@mail.gmail.com>
 <a95a1168-5419-0688-0700-c9e81e50727b@gmail.com>
 <dc66535e7a5d4a9dae25a9548f333385@intel.com>
 <3e514431-ab0d-a455-871d-b7c9b183a98b@gmail.com>
 <3ff28a866f494a7ebec5b09eddd894c4@intel.com>
 <07650a50-6de5-7508-5602-4eaeba9d6cbb@gmail.com>
 <0d24d1ba37644f0fbd587dda983e5e00@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <0d24d1ba37644f0fbd587dda983e5e00@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: juhapekka.heikkila@gmail.com
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15.2.2022 20.24, Chery, Nanley G wrote:
> 
> 
>> -----Original Message-----
>> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Sent: Tuesday, February 15, 2022 9:32 AM
>> To: Chery, Nanley G <nanley.g.chery@intel.com>; Nanley Chery
>> <nanleychery@gmail.com>; C, Ramalingam <ramalingam.c@intel.com>
>> Cc: intel-gfx <intel-gfx@lists.freedesktop.org>; Auld, Matthew
>> <matthew.auld@intel.com>; dri-devel <dri-devel@lists.freedesktop.org>
>> Subject: Re: [Intel-gfx] [PATCH v5 16/19] uapi/drm/dg2: Introduce format
>> modifier for DG2 clear color
>>
>> On 15.2.2022 18.44, Chery, Nanley G wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>> Sent: Tuesday, February 15, 2022 8:15 AM
>>>> To: Chery, Nanley G <nanley.g.chery@intel.com>; Nanley Chery
>>>> <nanleychery@gmail.com>; C, Ramalingam <ramalingam.c@intel.com>
>>>> Cc: intel-gfx <intel-gfx@lists.freedesktop.org>; Auld, Matthew
>>>> <matthew.auld@intel.com>; dri-devel <dri-devel@lists.freedesktop.org>
>>>> Subject: Re: [Intel-gfx] [PATCH v5 16/19] uapi/drm/dg2: Introduce
>>>> format modifier for DG2 clear color
>>>>
>>>> On 15.2.2022 17.02, Chery, Nanley G wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>>>> Sent: Tuesday, February 15, 2022 6:56 AM
>>>>>> To: Nanley Chery <nanleychery@gmail.com>; C, Ramalingam
>>>>>> <ramalingam.c@intel.com>
>>>>>> Cc: intel-gfx <intel-gfx@lists.freedesktop.org>; Chery, Nanley G
>>>>>> <nanley.g.chery@intel.com>; Auld, Matthew <matthew.auld@intel.com>;
>>>>>> dri- devel <dri-devel@lists.freedesktop.org>
>>>>>> Subject: Re: [Intel-gfx] [PATCH v5 16/19] uapi/drm/dg2: Introduce
>>>>>> format modifier for DG2 clear color
>>>>>>
>>>>>> On 12.2.2022 3.19, Nanley Chery wrote:
>>>>>>> On Tue, Feb 1, 2022 at 2:42 AM Ramalingam C
>>>>>>> <ramalingam.c@intel.com>
>>>>>> wrote:
>>>>>>>>
>>>>>>>> From: Mika Kahola <mika.kahola@intel.com>
>>>>>>>>
>>>>>>>> DG2 clear color render compression uses Tile4 layout. Therefore,
>>>>>>>> we need to define a new format modifier for uAPI to support clear
>>>>>>>> color
>>>>>> rendering.
>>>>>>>>
>>>>>>>> v2:
>>>>>>>>       Display version is fixed. [Imre]
>>>>>>>>       KDoc is enhanced for cc modifier. [Nanley & Lionel]
>>>>>>>>
>>>>>>>> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
>>>>>>>> cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>>>>>>> Signed-off-by: Juha-Pekka Heikkilä
>>>>>>>> <juha-pekka.heikkila@intel.com>
>>>>>>>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/i915/display/intel_fb.c            |  8 ++++++++
>>>>>>>>      drivers/gpu/drm/i915/display/skl_universal_plane.c |  9 ++++++++-
>>>>>>>>      include/uapi/drm/drm_fourcc.h                      | 10 ++++++++++
>>>>>>>>      3 files changed, 26 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c
>>>>>>>> b/drivers/gpu/drm/i915/display/intel_fb.c
>>>>>>>> index 4d4d01963f15..3df6ef5ffec5 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/display/intel_fb.c
>>>>>>>> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
>>>>>>>> @@ -144,6 +144,12 @@ static const struct intel_modifier_desc
>>>>>> intel_modifiers[] = {
>>>>>>>>                     .modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS,
>>>>>>>>                     .display_ver = { 13, 13 },
>>>>>>>>                     .plane_caps = INTEL_PLANE_CAP_TILING_4 |
>>>>>>>> INTEL_PLANE_CAP_CCS_MC,
>>>>>>>> +       }, {
>>>>>>>> +               .modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC,
>>>>>>>> +               .display_ver = { 13, 13 },
>>>>>>>> +               .plane_caps = INTEL_PLANE_CAP_TILING_4 |
>>>>>>>> + INTEL_PLANE_CAP_CCS_RC_CC,
>>>>>>>> +
>>>>>>>> +               .ccs.cc_planes = BIT(1),
>>>>>>>>             }, {
>>>>>>>>                     .modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
>>>>>>>>                     .display_ver = { 13, 13 }, @@ -559,6 +565,7 @@
>>>>>>>> intel_tile_width_bytes(const struct drm_framebuffer *fb, int
>> color_plane)
>>>>>>>>                     else
>>>>>>>>                             return 512;
>>>>>>>>             case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
>>>>>>>> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>>>>>>>>             case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>>>>>>>>             case I915_FORMAT_MOD_4_TILED:
>>>>>>>>                     /*
>>>>>>>> @@ -763,6 +770,7 @@ unsigned int intel_surf_alignment(const
>>>>>>>> struct
>>>>>> drm_framebuffer *fb,
>>>>>>>>             case I915_FORMAT_MOD_Yf_TILED:
>>>>>>>>                     return 1 * 1024 * 1024;
>>>>>>>>             case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
>>>>>>>> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>>>>>>>>             case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>>>>>>>>                     return 16 * 1024;
>>>>>>>>             default:
>>>>>>>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>>>>>> b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>>>>>> index c38ae0876c15..b4dced1907c5 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>>>>>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>>>>>> @@ -772,6 +772,8 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
>>>>>>>>                     return PLANE_CTL_TILED_4 |
>>>>>>>>                             PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE |
>>>>>>>>                             PLANE_CTL_CLEAR_COLOR_DISABLE;
>>>>>>>> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>>>>>>>> +               return PLANE_CTL_TILED_4 |
>>>>>>>> + PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
>>>>>>>>             case I915_FORMAT_MOD_Y_TILED_CCS:
>>>>>>>>             case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
>>>>>>>>                     return PLANE_CTL_TILED_Y |
>>>>>>>> PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
>>>>>>>> @@ -2358,10 +2360,15 @@ skl_get_initial_plane_config(struct
>>>>>>>> intel_crtc
>>>>>> *crtc,
>>>>>>>>                     break;
>>>>>>>>             case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_4 on XE_LPD+
>> */
>>>>>>>>                     if (HAS_4TILE(dev_priv)) {
>>>>>>>> -                       if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
>>>>>>>> +                       u32 rc_mask =
>>>> PLANE_CTL_RENDER_DECOMPRESSION_ENABLE |
>>>>>>>> +
>>>>>>>> + PLANE_CTL_CLEAR_COLOR_DISABLE;
>>>>>>>> +
>>>>>>>> +                       if ((val & rc_mask) == rc_mask)
>>>>>>>>                                     fb->modifier =
>>>> I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
>>>>>>>>                             else if (val &
>> PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE)
>>>>>>>>                                     fb->modifier =
>>>>>>>> I915_FORMAT_MOD_4_TILED_DG2_MC_CCS;
>>>>>>>> +                       else if (val &
>> PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
>>>>>>>> +                               fb->modifier =
>>>>>>>> + I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC;
>>>>>>>>                             else
>>>>>>>>                                     fb->modifier = I915_FORMAT_MOD_4_TILED;
>>>>>>>>                     } else {
>>>>>>>> diff --git a/include/uapi/drm/drm_fourcc.h
>>>>>>>> b/include/uapi/drm/drm_fourcc.h index b8fb7b44c03c..697614ea4b84
>>>>>>>> 100644
>>>>>>>> --- a/include/uapi/drm/drm_fourcc.h
>>>>>>>> +++ b/include/uapi/drm/drm_fourcc.h
>>>>>>>> @@ -605,6 +605,16 @@ extern "C" {
>>>>>>>>       */
>>>>>>>>      #define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS
>>>>>> fourcc_mod_code(INTEL,
>>>>>>>> 11)
>>>>>>>>
>>>>>>>> +/*
>>>>>>>> + * Intel color control surfaces (CCS) for DG2 clear color render
>>>> compression.
>>>>>>>> + *
>>>>>>>> + * DG2 uses a unified compression format for clear color render
>>>>>> compression.
>>>>>>>
>>>>>>> What's unified about DG2's compression format? If this doesn't
>>>>>>> affect the layout, maybe we should drop this sentence.
>>>>>>>
>>>>>>>> + * The general layout is a tiled layout using 4Kb tiles i.e. Tile4 layout.
>>>>>>>> + *
>>>>>>>
>>>>>>> This also needs a pitch aligned to four tiles, right? I think we
>>>>>>> can save some effort by referencing the DG2_RC_CCS modifier here.
>>>>>>>
>>>>>>>> + * Fast clear color value expected by HW is located in fb at
>>>>>>>> + offset
>>>>>>>> + 0 of plane#1
>>>>>>>
>>>>>>> Why is the expected offset hardcoded to 0 instead of relying on
>>>>>>> the offset provided by the modifier API? This looks like a bug.
>>>>>>
>>>>>> Hi Nanley,
>>>>>>
>>>>>> can you elaborate a bit, which offset from modifier API that
>>>>>> applies to cc
>>>> surface?
>>>>>>
>>>>>
>>>>> Hi Juha-Pekka,
>>>>>
>>>>> On the kernel-side of things, I'm thinking of
>> drm_mode_fb_cmd2::offsets[1].
>>>>>
>>>>
>>>> Hi Nanley,
>>>>
>>>> this offset is coming from userspace on creation of framebuffer, at
>>>> that moment from userspace caller can point to offset of desire.
>>>> Normally offset[0] is set at 0 and then offset[n] at plane n start
>>>> which is not stated to have to be exactly after plane n-1 end. Or did I
>> misunderstand what you meant?
>>>>
>>>
>>> Perhaps, at least, I'm not sure what you're meaning to say. This
>>> modifier description seems to say that the drm_mode_fb_cmd2::offsets
>>> value for the clear color plane must be zero. Are you saying that it's
>>> correct? This doesn't match the GEN12_RC_CCS_CC behavior and doesn't
>> match mesa's expectations.
>>>
>>
>> It doesn't say "drm_mode_fb_cmd2::offsets value for the clear color plane must
>> be zero", it says "Fast clear color value expected by HW is located in fb at offset 0
>> of plane#1".
>>
> 
> Yes, it doesn't say that exactly, but that's what it seems to say. With every other
> modifier, it's implied that the data for the plane begins at the offset specified
> through the modifier API. So, explicitly mentioning it here (and with that wording)
> conveys a new requirement.

I don't have objections on changing this description but for reference 
gen12 version of the same says "The main surface is Y-tiled and is at 
plane index 0 whereas CCS is linear and at index 1. The clear color is 
stored at index 2, and the pitch should be ignored.", only plane indexes 
are mentioned. I anyway wrote neither of these descriptions.

> 
>> Plane#1 location is pointed by drm_mode_fb_cmd2::offsets[1] and there's
>> nothing stated about that offset.
>>
> 
> Technically, plane #1's location is specified to be the combination of ::handles[1]
> and ::offsets[1]. In practice though, I can imagine that there are areas of the stack
> that are implicitly requiring that all ::handles[] entries match.

I didn't think we needed to go deeper as you started to just talk about 
how drm_mode_fb_cmd2::offsets[1] not being used. Let's not waste time.

> 
>> These offsets are just offsets to bo which contain the framebuffer information
>> hence drm_mode_fb_cmd2::offsets[1] can be changed as one wish and cc
>> information is found starting at drm_mode_fb_cmd2::offsets[1][0]
>>
> 
> If the clear color handling is the same as GEN12_RC_CCS_CC (apart for the plane
> index), I propose that we drop this sentence due to avoid any confusion.
> 

But it need to defined as part of the modifier. It's the modifier 
features which are being described here.

> This offset discussion raises another question. The description says that the value
> expected by HW is at offset 0. I'm assuming "HW" is referring to the render engine?
> The kernel is still giving the display engine the packed values at ::offsets[1] + 16B right?

Generally answer is yes but these parts you can see in patch "[PATCH v5 
17/19] drm/i915/dg2: Flat CCS Support" and should be discussed there. 
Here "HW" should probably be changed something meaningful though.

/Juha-Pekka

>>
>>>
>>>> For cc plane this offset likely will not be zero anyway and caller
>>>> can move it as see fit to have cc plane (plane[1]) location[0] at place where
>> wanted to have it.
>>>>
>>>> /Juha-Pekka
>>>>
>>>>>
>>>>>>>
>>>>>>> We should probably give some info about the relevant fields in the
>>>>>>> fast clear plane (like what's done in the GEN12_RC_CCS_CC modifier).
>>>>>>
>>>>>> agree, that's totally missing here.
>>>>>>
>>>>>> /Juha-Pekka
>>>>>>
>>>>>>>
>>>>>>>> + */
>>>>>>>> +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC
>>>>>> fourcc_mod_code(INTEL,
>>>>>>>> +12)
>>>>>>>> +
>>>>>>>>      /*
>>>>>>>>       * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>>>>>>>>       *
>>>>>>>> --
>>>>>>>> 2.20.1
>>>>>>>>
>>>>>
>>>
> 


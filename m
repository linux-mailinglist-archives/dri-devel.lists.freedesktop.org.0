Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFEB4B700C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 17:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CEC10E4AE;
	Tue, 15 Feb 2022 16:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8DD10E4A8;
 Tue, 15 Feb 2022 16:15:19 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id jg20so20392905ejc.3;
 Tue, 15 Feb 2022 08:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q3izX7XA01H870oUtgTFqIX7KpuLKFrP57QsnyxZRXU=;
 b=aI1ZUXAr9kGlL0ro/e7sase0hC759aty8/CaDEcBZJ8R5oG4vHVviejLLsVoTtTHee
 xeXXAfNrD0XHzFMeuvJy1yjxmXJ/ZYU73VxUJ+s7PhR0Da42mj2x6WMl53gi9kJBvxCU
 KGMvX/yqgjoWEJaTbo6Fs9qooupTGj7CptocbkyDOYhm5w8JEihftpMLGRz0VuFDfSZg
 Zcsnso7jgf4IYEoWKAhSWePZcHe8JrejDR6wf0vBuaoPkxwxIE3O9KzKweZuHPVVDoiY
 dbarO0lpabW1boQ80UKXqDe+FuhI02v3IioRWmGNfZIpzvMDTnoM/78sayTVt6WeYpGx
 xdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q3izX7XA01H870oUtgTFqIX7KpuLKFrP57QsnyxZRXU=;
 b=xNeQYaa2a9afx3+ae2ifECGzCA0n7JTYCE8leeZYnex3UppyW0CEmpu8aIp7CsbdRR
 14XKmFbslYMSKd3cwos0ampnnLbsVgGT4GYUMQ+3VHLgq8HkeM9Xg7WGqpbnB0lE6EGI
 Nkti0BDEgOq9ubFPM2s276hhfrxkWH78n36ad4wzJ4RlwuSXM7YAfX+mwPHA6iBNLTII
 C0wGjUh/frI/mYzixmvVzlwWUGQpsSPuiqS6f2EalsqO7MdAsiTTeY+FIEM5/vOCPCNa
 RIcMDoUc++q43lNqfzQ6Knb+LF2uYCxQfFogKIgDG6ID55xzUc6ZgtRQA9vIo+VhfOTN
 FvjA==
X-Gm-Message-State: AOAM530IqSozThmHBGQqAgVCAs26FP6P6mDu+CHsi2I9NlTOLP5VW+/R
 vaB6V3B3stXIBeThf6o/yx89AU3rGNa9y/VnADw=
X-Google-Smtp-Source: ABdhPJzuRwb9QPXfQBP1XPHyuoOL/+hvQV8Gtpdg+eWE7pLI6bJA5lAGdcmhK/J2yI81rQ3vjddFOA==
X-Received: by 2002:a17:906:5186:: with SMTP id
 y6mr3525925ejk.40.1644941717550; 
 Tue, 15 Feb 2022 08:15:17 -0800 (PST)
Received: from [0.0.0.0] ([134.134.137.84])
 by smtp.googlemail.com with ESMTPSA id d25sm11803373eje.41.2022.02.15.08.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 08:15:17 -0800 (PST)
Message-ID: <3e514431-ab0d-a455-871d-b7c9b183a98b@gmail.com>
Date: Tue, 15 Feb 2022 18:15:09 +0200
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
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <dc66535e7a5d4a9dae25a9548f333385@intel.com>
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

On 15.2.2022 17.02, Chery, Nanley G wrote:
> 
> 
>> -----Original Message-----
>> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Sent: Tuesday, February 15, 2022 6:56 AM
>> To: Nanley Chery <nanleychery@gmail.com>; C, Ramalingam
>> <ramalingam.c@intel.com>
>> Cc: intel-gfx <intel-gfx@lists.freedesktop.org>; Chery, Nanley G
>> <nanley.g.chery@intel.com>; Auld, Matthew <matthew.auld@intel.com>; dri-
>> devel <dri-devel@lists.freedesktop.org>
>> Subject: Re: [Intel-gfx] [PATCH v5 16/19] uapi/drm/dg2: Introduce format
>> modifier for DG2 clear color
>>
>> On 12.2.2022 3.19, Nanley Chery wrote:
>>> On Tue, Feb 1, 2022 at 2:42 AM Ramalingam C <ramalingam.c@intel.com>
>> wrote:
>>>>
>>>> From: Mika Kahola <mika.kahola@intel.com>
>>>>
>>>> DG2 clear color render compression uses Tile4 layout. Therefore, we
>>>> need to define a new format modifier for uAPI to support clear color
>> rendering.
>>>>
>>>> v2:
>>>>     Display version is fixed. [Imre]
>>>>     KDoc is enhanced for cc modifier. [Nanley & Lionel]
>>>>
>>>> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
>>>> cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>>> Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
>>>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/display/intel_fb.c            |  8 ++++++++
>>>>    drivers/gpu/drm/i915/display/skl_universal_plane.c |  9 ++++++++-
>>>>    include/uapi/drm/drm_fourcc.h                      | 10 ++++++++++
>>>>    3 files changed, 26 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c
>>>> b/drivers/gpu/drm/i915/display/intel_fb.c
>>>> index 4d4d01963f15..3df6ef5ffec5 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_fb.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
>>>> @@ -144,6 +144,12 @@ static const struct intel_modifier_desc
>> intel_modifiers[] = {
>>>>                   .modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS,
>>>>                   .display_ver = { 13, 13 },
>>>>                   .plane_caps = INTEL_PLANE_CAP_TILING_4 |
>>>> INTEL_PLANE_CAP_CCS_MC,
>>>> +       }, {
>>>> +               .modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC,
>>>> +               .display_ver = { 13, 13 },
>>>> +               .plane_caps = INTEL_PLANE_CAP_TILING_4 |
>>>> + INTEL_PLANE_CAP_CCS_RC_CC,
>>>> +
>>>> +               .ccs.cc_planes = BIT(1),
>>>>           }, {
>>>>                   .modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
>>>>                   .display_ver = { 13, 13 }, @@ -559,6 +565,7 @@
>>>> intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
>>>>                   else
>>>>                           return 512;
>>>>           case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
>>>> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>>>>           case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>>>>           case I915_FORMAT_MOD_4_TILED:
>>>>                   /*
>>>> @@ -763,6 +770,7 @@ unsigned int intel_surf_alignment(const struct
>> drm_framebuffer *fb,
>>>>           case I915_FORMAT_MOD_Yf_TILED:
>>>>                   return 1 * 1024 * 1024;
>>>>           case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
>>>> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>>>>           case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>>>>                   return 16 * 1024;
>>>>           default:
>>>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> index c38ae0876c15..b4dced1907c5 100644
>>>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> @@ -772,6 +772,8 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
>>>>                   return PLANE_CTL_TILED_4 |
>>>>                           PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE |
>>>>                           PLANE_CTL_CLEAR_COLOR_DISABLE;
>>>> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>>>> +               return PLANE_CTL_TILED_4 |
>>>> + PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
>>>>           case I915_FORMAT_MOD_Y_TILED_CCS:
>>>>           case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
>>>>                   return PLANE_CTL_TILED_Y |
>>>> PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
>>>> @@ -2358,10 +2360,15 @@ skl_get_initial_plane_config(struct intel_crtc
>> *crtc,
>>>>                   break;
>>>>           case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_4 on XE_LPD+ */
>>>>                   if (HAS_4TILE(dev_priv)) {
>>>> -                       if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
>>>> +                       u32 rc_mask = PLANE_CTL_RENDER_DECOMPRESSION_ENABLE |
>>>> +                                     PLANE_CTL_CLEAR_COLOR_DISABLE;
>>>> +
>>>> +                       if ((val & rc_mask) == rc_mask)
>>>>                                   fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
>>>>                           else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE)
>>>>                                   fb->modifier =
>>>> I915_FORMAT_MOD_4_TILED_DG2_MC_CCS;
>>>> +                       else if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
>>>> +                               fb->modifier =
>>>> + I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC;
>>>>                           else
>>>>                                   fb->modifier = I915_FORMAT_MOD_4_TILED;
>>>>                   } else {
>>>> diff --git a/include/uapi/drm/drm_fourcc.h
>>>> b/include/uapi/drm/drm_fourcc.h index b8fb7b44c03c..697614ea4b84
>>>> 100644
>>>> --- a/include/uapi/drm/drm_fourcc.h
>>>> +++ b/include/uapi/drm/drm_fourcc.h
>>>> @@ -605,6 +605,16 @@ extern "C" {
>>>>     */
>>>>    #define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS
>> fourcc_mod_code(INTEL,
>>>> 11)
>>>>
>>>> +/*
>>>> + * Intel color control surfaces (CCS) for DG2 clear color render compression.
>>>> + *
>>>> + * DG2 uses a unified compression format for clear color render
>> compression.
>>>
>>> What's unified about DG2's compression format? If this doesn't affect
>>> the layout, maybe we should drop this sentence.
>>>
>>>> + * The general layout is a tiled layout using 4Kb tiles i.e. Tile4 layout.
>>>> + *
>>>
>>> This also needs a pitch aligned to four tiles, right? I think we can
>>> save some effort by referencing the DG2_RC_CCS modifier here.
>>>
>>>> + * Fast clear color value expected by HW is located in fb at offset
>>>> + 0 of plane#1
>>>
>>> Why is the expected offset hardcoded to 0 instead of relying on the
>>> offset provided by the modifier API? This looks like a bug.
>>
>> Hi Nanley,
>>
>> can you elaborate a bit, which offset from modifier API that applies to cc surface?
>>
> 
> Hi Juha-Pekka,
> 
> On the kernel-side of things, I'm thinking of drm_mode_fb_cmd2::offsets[1].
> 

Hi Nanley,

this offset is coming from userspace on creation of framebuffer, at that 
moment from userspace caller can point to offset of desire. Normally 
offset[0] is set at 0 and then offset[n] at plane n start which is not 
stated to have to be exactly after plane n-1 end. Or did I misunderstand 
what you meant?

For cc plane this offset likely will not be zero anyway and caller can 
move it as see fit to have cc plane (plane[1]) location[0] at place 
where wanted to have it.

/Juha-Pekka

> 
>>>
>>> We should probably give some info about the relevant fields in the
>>> fast clear plane (like what's done in the GEN12_RC_CCS_CC modifier).
>>
>> agree, that's totally missing here.
>>
>> /Juha-Pekka
>>
>>>
>>>> + */
>>>> +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC
>> fourcc_mod_code(INTEL,
>>>> +12)
>>>> +
>>>>    /*
>>>>     * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>>>>     *
>>>> --
>>>> 2.20.1
>>>>
> 


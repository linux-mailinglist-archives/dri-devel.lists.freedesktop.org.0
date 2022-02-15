Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9C74B6F6E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 15:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329A910E380;
	Tue, 15 Feb 2022 14:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB8510E3FB;
 Tue, 15 Feb 2022 14:54:09 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id gb39so10073947ejc.1;
 Tue, 15 Feb 2022 06:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m1PHGNaAVTzwPzJF1RjYgd5+uI3hDMnOrloSJ5Bz1g4=;
 b=aOSv5v6PDhy7ZUIUSZ1mPCp8OmpWdoIT27flccTCW2s+7pPdQyR87hRpmQCUWKLDSB
 Ppv87C0H2go0G2jrr3/iJ5SPnHcIMoCYU8XN7/3RROgAVS8HT08+LxoIkKbw5dT/p1QP
 iaoR2UA2JsbpDi0ToSvec2VqGxMyQnTlOwOlq/cl/wGdLE90+1bd3ddec6JXA41QFzNw
 bC98E4zFhNDDHloo5+qaLgw0L41EuETZ5LfEBJ3WhMWKykA8FgItPn7pdjVVEUXy9ztn
 XTwVX9CWZbgMp3BEbMs7gY++JwKlDqyNrhac0ZRMBF0jTWENqqaIRz8jVfD+7iQpvbPi
 husg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m1PHGNaAVTzwPzJF1RjYgd5+uI3hDMnOrloSJ5Bz1g4=;
 b=BNK5IhQiSSnohsirk0lfBF5CbEd4peI/QaKBm9UrZQFS0kMTaHaPp1rX3qsOehz0g+
 wx2cTt6M7OC0U6SumP9ucvKaRMOlv0eIOBtEoYe4HJto4HRBinlpJ6Zs1UZazE+BJa5O
 gJrmLO5TjlIvlYPGO4aQfRhWN/zNysWjko5oex9WaIcXllz5bXsf3aW6hUH6sugU2dCd
 4JWeuTqOgSzMR+qLhWoyBydTYv4II+SWeLRYHm0kJMo7IO1G/AR1kGFSZslUrXgUK7ge
 jbc+ZR/llQnOX+9u62djdCQOuHNreWmzEF2kmdx5S6zVtSQ80U86WCrhYS5UuhOrOkBj
 e1uQ==
X-Gm-Message-State: AOAM531Zv2Zws7gj9vbB8k4i+i9r9zGTYkOhL7Icsh1TAZg4oTAMzjoe
 JPP0DWbm3+p+VISSdWrNSPfKt13eGRQNNcnH73g=
X-Google-Smtp-Source: ABdhPJxA7Rou0FDZ2KeaoDYEm08UYL37287Iw4ku9tfvBaLziuBz3YcnBQ3Xg4Yo8BSYYd0JmdfdXA==
X-Received: by 2002:a17:906:8158:: with SMTP id
 z24mr956649ejw.650.1644936847645; 
 Tue, 15 Feb 2022 06:54:07 -0800 (PST)
Received: from [0.0.0.0] ([134.134.137.84])
 by smtp.googlemail.com with ESMTPSA id p24sm2731754ejx.53.2022.02.15.06.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 06:54:06 -0800 (PST)
Message-ID: <326a4099-f7d9-8adf-f371-d8ab0532256e@gmail.com>
Date: Tue, 15 Feb 2022 16:53:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [Intel-gfx] [PATCH v5 15/19] drm/i915/dg2: Add DG2 unified
 compression
Content-Language: en-US
To: Nanley Chery <nanleychery@gmail.com>, Ramalingam C <ramalingam.c@intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
 <20220201104132.3050-16-ramalingam.c@intel.com>
 <CAJDL4uKokNLKhx1Yd_gnxyqto+bcg+=efLZFLVxqp-D7aQW0oQ@mail.gmail.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <CAJDL4uKokNLKhx1Yd_gnxyqto+bcg+=efLZFLVxqp-D7aQW0oQ@mail.gmail.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Nanley Chery <nanley.g.chery@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.2.2022 3.17, Nanley Chery wrote:
> On Tue, Feb 1, 2022 at 2:42 AM Ramalingam C <ramalingam.c@intel.com> wrote:
>>
>> From: Matt Roper <matthew.d.roper@intel.com>
>>
>> DG2 unifies render compression and media compression into a single
>> format for the first time.  The programming and buffer layout is
>> supposed to match compression on older gen12 platforms, but the actual
>> compression algorithm is different from any previous platform; as such,
>> we need a new framebuffer modifier to represent buffers in this format,
>> but otherwise we can re-use the existing gen12 compression driver logic.
>>
>> v2:
>>    Display version fix [Imre]
>>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> Signed-off-by: Mika Kahola <mika.kahola@intel.com> (v2)
>> cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_fb.c       | 13 ++++++++++
>>   .../drm/i915/display/skl_universal_plane.c    | 26 ++++++++++++++++---
>>   include/uapi/drm/drm_fourcc.h                 | 22 ++++++++++++++++
>>   3 files changed, 57 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
>> index 94c57facbb46..4d4d01963f15 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fb.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
>> @@ -141,6 +141,14 @@ struct intel_modifier_desc {
>>
>>   static const struct intel_modifier_desc intel_modifiers[] = {
>>          {
>> +               .modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS,
>> +               .display_ver = { 13, 13 },
>> +               .plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_MC,
>> +       }, {
>> +               .modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
>> +               .display_ver = { 13, 13 },
>> +               .plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_RC,
>> +       }, {
>>                  .modifier = I915_FORMAT_MOD_4_TILED,
>>                  .display_ver = { 13, 13 },
>>                  .plane_caps = INTEL_PLANE_CAP_TILING_4,
>> @@ -550,6 +558,8 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
>>                          return 128;
>>                  else
>>                          return 512;
>> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
>> +       case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>>          case I915_FORMAT_MOD_4_TILED:
>>                  /*
>>                   * Each 4K tile consists of 64B(8*8) subtiles, with
>> @@ -752,6 +762,9 @@ unsigned int intel_surf_alignment(const struct drm_framebuffer *fb,
>>          case I915_FORMAT_MOD_4_TILED:
>>          case I915_FORMAT_MOD_Yf_TILED:
>>                  return 1 * 1024 * 1024;
>> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
>> +       case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>> +               return 16 * 1024;
>>          default:
>>                  MISSING_CASE(fb->modifier);
>>                  return 0;
>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> index 5299dfe68802..c38ae0876c15 100644
>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> @@ -764,6 +764,14 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
>>                  return PLANE_CTL_TILED_Y;
>>          case I915_FORMAT_MOD_4_TILED:
>>                  return PLANE_CTL_TILED_4;
>> +       case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
>> +               return PLANE_CTL_TILED_4 |
>> +                       PLANE_CTL_RENDER_DECOMPRESSION_ENABLE |
>> +                       PLANE_CTL_CLEAR_COLOR_DISABLE;
>> +       case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>> +               return PLANE_CTL_TILED_4 |
>> +                       PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE |
>> +                       PLANE_CTL_CLEAR_COLOR_DISABLE;
>>          case I915_FORMAT_MOD_Y_TILED_CCS:
>>          case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
>>                  return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
>> @@ -2094,6 +2102,10 @@ static bool gen12_plane_has_mc_ccs(struct drm_i915_private *i915,
>>          if (IS_ADLP_DISPLAY_STEP(i915, STEP_A0, STEP_B0))
>>                  return false;
>>
>> +       /* Wa_14013215631 */
>> +       if (IS_DG2_DISPLAY_STEP(i915, STEP_A0, STEP_C0))
>> +               return false;
>> +
>>          return plane_id < PLANE_SPRITE4;
>>   }
>>
>> @@ -2335,9 +2347,10 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
>>          case PLANE_CTL_TILED_Y:
>>                  plane_config->tiling = I915_TILING_Y;
>>                  if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
>> -                       fb->modifier = DISPLAY_VER(dev_priv) >= 12 ?
>> -                               I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS :
>> -                               I915_FORMAT_MOD_Y_TILED_CCS;
>> +                       if (DISPLAY_VER(dev_priv) >= 12)
>> +                               fb->modifier = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
>> +                       else
>> +                               fb->modifier = I915_FORMAT_MOD_Y_TILED_CCS;
>>                  else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE)
>>                          fb->modifier = I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS;
>>                  else
>> @@ -2345,7 +2358,12 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
>>                  break;
>>          case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_4 on XE_LPD+ */
>>                  if (HAS_4TILE(dev_priv)) {
>> -                       fb->modifier = I915_FORMAT_MOD_4_TILED;
>> +                       if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
>> +                               fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
>> +                       else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE)
>> +                               fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS;
>> +                       else
>> +                               fb->modifier = I915_FORMAT_MOD_4_TILED;
>>                  } else {
>>                          if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
>>                                  fb->modifier = I915_FORMAT_MOD_Yf_TILED_CCS;
>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>> index b73fe6797fc3..b8fb7b44c03c 100644
>> --- a/include/uapi/drm/drm_fourcc.h
>> +++ b/include/uapi/drm/drm_fourcc.h
>> @@ -583,6 +583,28 @@ extern "C" {
>>    */
>>   #define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
>>
>> +/*
>> + * Intel color control surfaces (CCS) for DG2 render compression.
>> + *
>> + * DG2 uses a new compression format for render compression. The general
>> + * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
>> + * but a new hashing/compression algorithm is used, so a fresh modifier must
>> + * be associated with buffers of this type. Render compression uses 128 byte
>> + * compression blocks.
> 
> I think I've seen a way to configure the compression block size on TGL
> at least. I can't find the spec text for that at the moment though...
> Could we omit these mentions?

Not sure why general possibility of changing compression block size is 
relevant? All hw features can be changed but this defines how this 
modifier is being implemented.

Say you take I915_FORMAT_MOD_4_TILED_DG2_RC_CCS framebuffer including 
control surface and copy it out, then come back and restore framebuffer 
with same information. It is expected to be valid?

/Juha-Pekka

> 
>> + */
>> +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS fourcc_mod_code(INTEL, 10)
>> +
> 
> How about something like:
> 
> The main surface is Tile 4 and at plane index 0. The CCS plane is
> hidden from userspace. The main surface pitch is required to be a
> multiple of four Tile 4 widths. The CCS is configured with the render
> compression format associated with the main surface format.
> 
> ....I think the CCS is technically accessible via the blitter engine,
> so the part about the plane being "hidden" may need some tweaking.
> 
> 
> -Nanley
> 
>> +/*
>> + * Intel color control surfaces (CCS) for DG2 media compression.
>> + *
>> + * DG2 uses a new compression format for media compression. The general
>> + * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
>> + * but a new hashing/compression algorithm is used, so a fresh modifier must
>> + * be associated with buffers of this type. Media compression uses 256 byte
>> + * compression blocks.
>> + */
>> +#define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 11)
>> +
>>   /*
>>    * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>>    *
>> --
>> 2.20.1
>>


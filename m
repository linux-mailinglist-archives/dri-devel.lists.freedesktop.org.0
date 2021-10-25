Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DACD4394A7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 13:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE4A89E0E;
	Mon, 25 Oct 2021 11:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A10189E0E;
 Mon, 25 Oct 2021 11:20:16 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id a26so17162200edy.11;
 Mon, 25 Oct 2021 04:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zAWkQGbOaZKbHWppqd+rLJs80WGOQG4H53gr2sV0vAQ=;
 b=ID59gtr8f5xxJGnGvueDL1ILVtTOzGCrTqfDtDUPaDjfeCMKykIHmSCoT4bFRbtmu5
 wpFOaCdtv65eLNkjdDy9eu4C4l39ZxEeRfU/WxrePOWUCeg86EfSas5In+rWFGu4CW9e
 cZ+0KmssTd6fjcBjmc4QdcUniFpY5uhhGUQINIjzlHI69gxK2rRYk7fFnyE/AY59MEA4
 WnahY4Ilpm6fnr9PaqnK/u5JrnV3odFsEojxOZjXGiZKmrHoujlEmZV3gt6xg/o0beqH
 MxjJI5y4VYDHheC47EWctklA1WMnQIlEdKtYIhbxg1Btv1XOtkENHCFs6UW7tT5LAg2c
 t39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zAWkQGbOaZKbHWppqd+rLJs80WGOQG4H53gr2sV0vAQ=;
 b=bPYaxRX1U3CbQqbY9FqBAfOq7ORwk5osp4by4+qT0onQcIi3jdVHnJf1+lG4w73oik
 VUxmeQ4LPjpvSH5itlxEfyq3z2E+yxAJ/MUcHP5zswgKeI0kvm9C1MhQFXJfJ/6CB7dZ
 pgF0oAgZ97GB/ArhZG5/33TtOxrsa/EDSr5QauC2QGDm9kQvuMz4r1yPPveYtjsjbYHf
 lc9rLW9hMlnBcWIh3drRl3wpDhLDCCB+8rur31M7xE74tHbBWcuf57C5KGtnJKlbjMQb
 Daac50tTnkvEI4WYF9lT49dfUl4z9kP+X9XfyG7s+IAl15wJLT+utYdMoQ0oGqWTV7Da
 Pb4g==
X-Gm-Message-State: AOAM531D8F6760THpsP/X6LiRTW14/2LJEmT5w8EkQz3QPbk5i9tUSfu
 9FEuRX7dXbjDEmQT4r4reGg=
X-Google-Smtp-Source: ABdhPJyWolZaNeYs6hLCgbIy8OFyS2r8sI+XXWlxCE7+b7RQkIICzRZWDbBkkYUk6wDyHxsA5dNUkQ==
X-Received: by 2002:aa7:d556:: with SMTP id u22mr25631139edr.226.1635160814573; 
 Mon, 25 Oct 2021 04:20:14 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.89])
 by smtp.googlemail.com with ESMTPSA id n8sm771738edy.59.2021.10.25.04.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 04:20:13 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH v2 14/17] uapi/drm/dg2: Format modifier for
 DG2 unified compression and clear color
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Ramalingam C <ramalingam.c@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Daniel Vetter
 <daniel@ffwll.ch>, CQ Tang <cq.tang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20211021142627.31058-1-ramalingam.c@intel.com>
 <20211021142627.31058-15-ramalingam.c@intel.com> <YXF6tItZLX4Cn6Aw@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <4b263070-a30e-85fb-d3d7-6983b05ec323@gmail.com>
Date: Mon, 25 Oct 2021 14:20:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXF6tItZLX4Cn6Aw@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.10.2021 17.35, Ville Syrjälä wrote:
> On Thu, Oct 21, 2021 at 07:56:24PM +0530, Ramalingam C wrote:
>> From: Matt Roper <matthew.d.roper@intel.com>
>>
>> DG2 unifies render compression and media compression into a single
>> format for the first time.  The programming and buffer layout is
>> supposed to match compression on older gen12 platforms, but the
>> actual compression algorithm is different from any previous platform; as
>> such, we need a new framebuffer modifier to represent buffers in this
>> format, but otherwise we can re-use the existing gen12 compression driver
>> logic.
>>
>> DG2 clear color render compression uses Tile4 layout. Therefore, we need
>> to define a new format modifier for uAPI to support clear color rendering.
>>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Mika Kahola <mika.kahola@intel.com> (v2)
>> Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>> cc: Simon Ser <contact@emersion.fr>
>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_display.c  |  3 ++
>>   .../drm/i915/display/intel_display_types.h    | 10 +++-
>>   drivers/gpu/drm/i915/display/intel_fb.c       |  7 +++
>>   .../drm/i915/display/skl_universal_plane.c    | 49 +++++++++++++++++--
>>   include/uapi/drm/drm_fourcc.h                 | 30 ++++++++++++
>>   5 files changed, 94 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>> index 9b678839bf2b..2949fe9f5b9f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -1013,6 +1013,9 @@ intel_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
>>   					  cmd->pixel_format);
>>   	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
>>   	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
>> +	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS:
>> +	case I915_FORMAT_MOD_F_TILED_DG2_MC_CCS:
>> +	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC:
>>   		return lookup_format_info(gen12_ccs_formats,
>>   					  ARRAY_SIZE(gen12_ccs_formats),
>>   					  cmd->pixel_format);
> 
> That seems not right. Flat CCS is invisible to the user so the format
> info should not include a CCS plane.
> 

I had cleaned out those rc and mc ccs from here long time ago, I wonder 
where did they come back from? On my development tree they're not there. 
Also I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC is here in totally wrong 
place, it should have its own gen12_flat_ccs_cc_formats table.

/Juha-Pekka

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 988AF67B2D2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 14:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9488810E7B7;
	Wed, 25 Jan 2023 12:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382A610E7B6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 12:59:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so1153551wml.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 04:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=froggi.es; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HtdSuK06HlKR8WfrMg8Z7Ie826M7VYBC49CWb6eCAM8=;
 b=LMBr/EBP3AmN43gbvAMVpbbkpXqooG+FDiFGofxWW7uv3AamLh+nP96SYNPRv8NiI2
 38ZdU0ZQi826+R7F19kCZu+CvH0qysC5fiWsjk/tG/TObOTI2uQQa+WbY1WNVO4ZeAF9
 0Tnf5c2q3EAr/Nib68eZsilW4cAv27fC4YAA4a0m5cGdgnFAvgQfeWjsaqdRvHOdm4mt
 3sI6Ew1B+s4Eus6SCTInKkRYZ0XNPvUoiK5ZMZJ3fQl8GWZdlwLDIBQ6Qx3ArmSTtXyZ
 1QeNJiOOQtuVaFzUq8Qt6PwdS6Ssz6gqdHJcJfqjIjvmarbyn8hgg+fCHrsa0+88S0po
 qAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HtdSuK06HlKR8WfrMg8Z7Ie826M7VYBC49CWb6eCAM8=;
 b=rHm5ryJR5LMfyLYO+Vc3KTnkGHXPSPlYJGuQFdENCLVP1/fUoiiaQDaKOLKqlM4gQj
 7Wpi5IJasUWbTowxQa+aTvnPMT/SkuOvIMd2YCxMB/onViY1MzetsDstP6BGnH6rKHpP
 JZgs8mhkZJZ+siD+ph3Uh6bC1NqGY97vx7FmER64zWCDxFnN9UP7kMli7BMZxVRtR4q7
 OY9gnrh527Mvj+w9vFdTYoyDn5sAaviwxZBib/uQe2Q1/S/QCeipZ2luDNqbZNwoCkSz
 AyJ/eFnwT/ON2q/uGVgvfTRsBlBPX3WG70XxBPuvqx0lht3htcnrnyv1iLLX5JRBJQM7
 bpgQ==
X-Gm-Message-State: AO0yUKWpoSzw1HDB1G/zSzsmaqB2DXzj+oYWwWovrVWGjaXLDeAVd8ls
 PvwL7FIgva6yeR/wnAcOyMSOTt3Mu60hInEt
X-Google-Smtp-Source: AK7set+b4dUKacP/7NmUOnK9mGOFj2qFtNpLHclQmQQ1ParabuEWDgg1v5y1LZkbE+fxEpYOzZw+Zg==
X-Received: by 2002:a05:600c:46cb:b0:3dc:1da2:b2d6 with SMTP id
 q11-20020a05600c46cb00b003dc1da2b2d6mr1911178wmo.1.1674651594679; 
 Wed, 25 Jan 2023 04:59:54 -0800 (PST)
Received: from [192.168.0.89]
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c16d400b003dc1763da37sm1721349wmn.17.2023.01.25.04.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 04:59:54 -0800 (PST)
Message-ID: <79ca3c26-11e8-0dad-641d-af21ec557d07@froggi.es>
Date: Wed, 25 Jan 2023 12:59:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 18/21] drm/amd/display: Fallback to 2020_YCBCR if the
 pixel encoding is not RGB
To: Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
 <20230113162428.33874-19-harry.wentland@amd.com>
 <CA+hFU4xHKNSWO21Swq_b2VPPxtYGdeo4e3rPEVo44OPmB+opZw@mail.gmail.com>
Content-Language: en-US
From: Joshua Ashton <joshua@froggi.es>
In-Reply-To: <CA+hFU4xHKNSWO21Swq_b2VPPxtYGdeo4e3rPEVo44OPmB+opZw@mail.gmail.com>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/23/23 20:30, Sebastian Wick wrote:
> A new property to control YCC and subsampling would be the more
> complete path here. If we actually want to fix this in the short-term
> though, we should handle the YCC and RGB Colorspace values as
> equivalent, everywhere. Technically we're breaking the user space API
> here so it should be documented on the KMS property and other drivers
> must be adjusted accordingly as well.

I am happy with treating 2020_YCC and 2020_RGB as the same.

I think having the YCC/RGB split here in Colorspace is a mistake.
Pixel encoding should be completely separate from colorspace from a uAPI 
perspective when we want to expose that.
It's just a design flaw from when it was added as it just mirrors the 
values in the colorimetry packets 1:1. I understand why this happened, 
and I don't think it's a big deal for us to correct ourselves now:

I suggest we deprecate the _YCC variants, treat them the same as the RGB 
enum to avoid any potential uAPI breakage and key the split entirely off 
the pixel_encoding value.

That way when we do want to plumb more explicit pixel encoding down the 
line, userspace only has to manage one thing. There's no advantage for 
anything more here.

- Joshie 🐸✨

> 
> On Fri, Jan 13, 2023 at 5:26 PM Harry Wentland <harry.wentland@amd.com> wrote:
>>
>> From: Joshua Ashton <joshua@froggi.es>
>>
>> Userspace might not aware whether we're sending RGB or YCbCr
>> data to the display. If COLOR_SPACE_2020_RGB_FULLRANGE is
>> requested but the output encoding is YCbCr we should
>> send COLOR_SPACE_2020_YCBCR.
>>
>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Vitaly.Prosyak@amd.com
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: amd-gfx@lists.freedesktop.org
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index f74b125af31f..16940ea61b59 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -5184,7 +5184,10 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
>>                  color_space = COLOR_SPACE_ADOBERGB;
>>                  break;
>>          case DRM_MODE_COLORIMETRY_BT2020_RGB:
>> -               color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
>> +               if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB)
>> +                       color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
>> +               else
>> +                       color_space = COLOR_SPACE_2020_YCBCR;
>>                  break;
>>          case DRM_MODE_COLORIMETRY_BT2020_YCC:
>>                  color_space = COLOR_SPACE_2020_YCBCR;
>> --
>> 2.39.0
>>
> 

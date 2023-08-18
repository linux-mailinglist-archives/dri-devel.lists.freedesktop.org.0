Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AB1780AAC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 13:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0F410E4EF;
	Fri, 18 Aug 2023 11:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967BE10E4EE
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 11:03:18 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so12536291fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 04:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692356597; x=1692961397;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Jh7ItFYHU5zNIGLCstW/Pzdq1xmgVbG9y2RMD0DjmE=;
 b=ImO4DuA79mgCfrF590YuamU/xZhUWnoTy+yVYcQtO1frAroKqxut6QZJI+LacYKq5F
 qHkJ6IdzqcPmHHD3s/d4XzYPkE6/pDOQD0CETUl/wXsQRGndehiVvEVj/z29vm3/Wm5+
 SndiY9n2iID5YlSCpzB2a/a5Ygvsg7c7bEG9ulm6lJR6sQdlU8bZkBy7i6oJG6AT3qUq
 jwGBqUlGvg9BolzBQ6Ptf/70OZajMpFQZtgXr/uM2pDCAfzQ1vzuwXcEgZBwFtyH8lbw
 uTrihK8I2mrAPyq4WSG4f28n3WHIctIqcaDlXa/5PiTOJgM/5J0+4CuRwE6Ak63iDjjw
 dI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692356597; x=1692961397;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Jh7ItFYHU5zNIGLCstW/Pzdq1xmgVbG9y2RMD0DjmE=;
 b=DtDlY7ed4iW2DFV09Xg6C3T+tIeP9kjZ6zkwOJJIHFq9Q7RJgjr6OYWjBCuVqlutbL
 82HpdcbI4ltkRLtRp4cqypovVGfQVkA+NWaD/mvllHhUH+aik+16mLis9Wv9g+G2xKmL
 kudfsONRkyJ1dJH8Gro2oA+aKwciQ9aF5hZKTx6rIHAVMU2bT/mjbC+dUBV2PX0SbjRn
 K/dSW8Hrq92CWdbjkPqTS1+knfd8CGUf6QKUEySasmCnZQT5id2vNgj9AXkuyfX9geHu
 TFwYLvPQoUQ5dcqECTcAPIhiiKK5e7O/RHGNyUwf88JZQS/Fw36WMUXssxek9MAQxwrE
 la+w==
X-Gm-Message-State: AOJu0YzEidjIbe1aYHvxwnk+dFQAX5hHadTsYTpr8dyZpie6OEVuVYd3
 ZmmJ7t3/t97jKCMq7oklgJUACQ==
X-Google-Smtp-Source: AGHT+IHyLaj7lSH6UWei+LJ0Jvr8+Gydj89mLdky8jn0+n2TFP3T21x4hd6OTXGGBdOQVsHAwnNEsw==
X-Received: by 2002:a2e:9914:0:b0:2b9:bbf5:7c6 with SMTP id
 v20-20020a2e9914000000b002b9bbf507c6mr1623479lji.43.1692356596092; 
 Fri, 18 Aug 2023 04:03:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a2e9d47000000b002b9899d0f0bsm363898ljj.83.2023.08.18.04.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 04:03:15 -0700 (PDT)
Message-ID: <c4b7e9eb-fb5d-4b2f-8358-f41598d7d983@linaro.org>
Date: Fri, 18 Aug 2023 14:03:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 02/10] drm: Introduce solid fill DRM plane property
Content-Language: en-GB
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-2-053dbefa909c@quicinc.com>
 <CAA8EJpq=pbDoYc9wqKKrX+RahXp8zWTPFqVqA=S-0TkWXXJUjQ@mail.gmail.com>
 <CA+hFU4y38MTTUsbri1jy=n4Vyp7xx2CosD9Nmk97z_au6NHCdQ@mail.gmail.com>
 <CAA8EJpoFpUcQL_7pb0toDoLFsK=9GdBLQH+h_MMffrp9k7eCyw@mail.gmail.com>
 <20230818135133.3fdeddba@eldfell>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230818135133.3fdeddba@eldfell>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sebastian Wick <sebastian.wick@redhat.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 wayland-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/08/2023 13:51, Pekka Paalanen wrote:
> On Fri, 4 Aug 2023 16:59:00 +0300
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
>> On Fri, 4 Aug 2023 at 16:44, Sebastian Wick <sebastian.wick@redhat.com> wrote:
>>>
>>> On Fri, Aug 4, 2023 at 3:27 PM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On Fri, 28 Jul 2023 at 20:03, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>>>
>>>>> Document and add support for solid_fill property to drm_plane. In
>>>>> addition, add support for setting and getting the values for solid_fill.
>>>>>
>>>>> To enable solid fill planes, userspace must assign a property blob to
>>>>> the "solid_fill" plane property containing the following information:
>>>>>
>>>>> struct drm_mode_solid_fill {
>>>>>          u32 version;
>>>>>          u32 r, g, b;
>>>>> };
>>>>>
>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>> ---
>>>>>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
>>>>>   drivers/gpu/drm/drm_atomic_uapi.c         | 55 +++++++++++++++++++++++++++++++
>>>>>   drivers/gpu/drm/drm_blend.c               | 30 +++++++++++++++++
>>>>>   include/drm/drm_blend.h                   |  1 +
>>>>>   include/drm/drm_plane.h                   | 35 ++++++++++++++++++++
>>>>>   include/uapi/drm/drm_mode.h               | 24 ++++++++++++++
>>>>>   6 files changed, 154 insertions(+)
>>>>>   
>>>>
>>>> [skipped most of the patch]
>>>>   
>>>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>>>> index 43691058d28f..53c8efa5ad7f 100644
>>>>> --- a/include/uapi/drm/drm_mode.h
>>>>> +++ b/include/uapi/drm/drm_mode.h
>>>>> @@ -259,6 +259,30 @@ struct drm_mode_modeinfo {
>>>>>          char name[DRM_DISPLAY_MODE_LEN];
>>>>>   };
>>>>>
>>>>> +/**
>>>>> + * struct drm_mode_solid_fill - User info for solid fill planes
>>>>> + *
>>>>> + * This is the userspace API solid fill information structure.
>>>>> + *
>>>>> + * Userspace can enable solid fill planes by assigning the plane "solid_fill"
>>>>> + * property to a blob containing a single drm_mode_solid_fill struct populated with an RGB323232
>>>>> + * color and setting the pixel source to "SOLID_FILL".
>>>>> + *
>>>>> + * For information on the plane property, see drm_plane_create_solid_fill_property()
>>>>> + *
>>>>> + * @version: Version of the blob. Currently, there is only support for version == 1
>>>>> + * @r: Red color value of single pixel
>>>>> + * @g: Green color value of single pixel
>>>>> + * @b: Blue color value of single pixel
>>>>> + */
>>>>> +struct drm_mode_solid_fill {
>>>>> +       __u32 version;
>>>>> +       __u32 r;
>>>>> +       __u32 g;
>>>>> +       __u32 b;
>>>>
>>>> Another thought about the drm_mode_solid_fill uABI. I still think we
>>>> should add alpha here. The reason is the following:
>>>>
>>>> It is true that we have  drm_plane_state::alpha and the plane's
>>>> "alpha" property. However it is documented as "the plane-wide opacity
>>>> [...] It can be combined with pixel alpha. The pixel values in the
>>>> framebuffers are expected to not be pre-multiplied by the global alpha
>>>> associated to the plane.".
>>>>
>>>> I can imagine a use case, when a user might want to enable plane-wide
>>>> opacity, set "pixel blend mode" to "Coverage" and then switch between
>>>> partially opaque framebuffer and partially opaque solid-fill without
>>>> touching the plane's alpha value.
>>>
>>> The only reason I see against this is that there might be some
>>> hardware which supports only RGB but not alpha on planes and they
>>> could then not use this property.
>>
>> Fair enough.
>>
>>> Maybe another COLOR_FILL enum value
>>> with alpha might be better? Maybe just doing the alpha via the alpha
>>> property is good enough.
>>
>> One of our customers has a use case for setting the opaque solid fill,
>> while keeping the plane's alpha intact.
> 
> Could you explain more about why they must keep plane alpha intact
> instead of reprogramming everything with atomic? Is there some
> combination that just cannot reach the same end result via userspace
> manipulation of the solid fill values with plane alpha?
> 
> Or is it a matter of userspace architecture where you have independent
> components responsible for different KMS property values?
The latter one. The goal is to be able to switch between pixel sources 
without touching any additional properties (including plane's alpha value).

-- 
With best wishes
Dmitry


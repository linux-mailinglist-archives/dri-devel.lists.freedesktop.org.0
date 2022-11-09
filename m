Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA99622CE7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 14:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3120F10E5D0;
	Wed,  9 Nov 2022 13:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E7510E5D0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 13:53:48 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d6so25695180lfs.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 05:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aQx1MWsXU+Imy86oBBQjePIiYtoz74Po33wTeE8vT+Q=;
 b=SuOuVXASzqaq/qSvDexqcCRqoFeRgAkqx018KuSs96xS0wR8uv1rfMcW21Q/1PEoE2
 z9Rfu88gm7Q7cSBzEL8wmc6p+f4Q2605EYTxYOip45zjstGqURZwULj5onY8zbnO2QwC
 xv5nZ5oRBKZOV5cVJxI1OMIIgu2y0beaumTO6e+OsPcS0N9mJlkPgP8uzIhia/oXg+2a
 RbyCzdMiszWZejV6DXybbziJaZ7md7E71h9NIUK+977fSoIsfYsc0yOS4FbzPJco/GIx
 xqZEUCt8JSvSu6bLz33J4bIJzJQH9/5POgWory7LBsIG/GPQY021KQVypNluX4tIqszt
 Dlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aQx1MWsXU+Imy86oBBQjePIiYtoz74Po33wTeE8vT+Q=;
 b=Za62iUl29wvuli95A5kXj7FWx6U+jDFtVLjnV3JMEcyRKitIkVJKtjbJJVazNnKiCt
 D2qtIF6IttqR5Kr2zZ904CfPAI9SD/NTLFC9l51W4gNQdyaACpFQ3koF6csNchXhusLE
 69OTQ+4O3Cwrw1etaObmA9vLkzle25ozLNfi1ytI0n3IqUM3Vcrn5sTjAPHz2MZ+XVl1
 gcA+I/870WfkCCWMyOHwOvzPpzXb/ewDKVp9jbsmtlyGZY5jw0SYJsKYwcgPpjNbJJRZ
 DFvCkzAealaGPWKFPAQPkzf1nA6FfmNW4CAI3VFPt6ZevAlRmo0z4SXpOczw/9IhLGQL
 NR0A==
X-Gm-Message-State: ACrzQf0aVYYXLfvc1LVq+fE2yxz66FiEPbO1OInh8xInnafhLRzCJUje
 SGCczvknMtEAYEHuaI8rDy8vhg==
X-Google-Smtp-Source: AMsMyM7HSuMlxeZ3JSgcK8zqLjvZEljnTSKcWacPbpdYU/TGY04cCSmPPZfQ/a/t5apVrP1ZPTxuDw==
X-Received: by 2002:a05:6512:3404:b0:4a2:c77d:9212 with SMTP id
 i4-20020a056512340400b004a2c77d9212mr21495929lfr.489.1668002026927; 
 Wed, 09 Nov 2022 05:53:46 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f36-20020a0565123b2400b004acb2adfa1fsm2223857lfv.307.2022.11.09.05.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 05:53:46 -0800 (PST)
Message-ID: <ee755c43-434a-a990-0efa-ed5c6baa237e@linaro.org>
Date: Wed, 9 Nov 2022 16:53:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Content-Language: en-GB
To: Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
 <fqY-wVvRxd553E0flH80_NaZMpmiVTIdhvu6F31qM9T4yQ0L5fbT9JiixWIhDcDAt3Hxy1roQxwntvgVEnqm5WK6dzEIKqXnlLRcywGhYH4=@emersion.fr>
 <Y2uwjKCN4KGzm3aN@phenom.ffwll.local>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y2uwjKCN4KGzm3aN@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, daniel.vetter@ffwll.ch,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2022 16:52, Daniel Vetter wrote:
> On Tue, Nov 08, 2022 at 06:25:29PM +0000, Simon Ser wrote:
>> On Saturday, October 29th, 2022 at 13:23, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>>
>>> On 29/10/2022 01:59, Jessica Zhang wrote:
>>>
>>>> Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
>>>> drm_plane. In addition, add support for setting and getting the values
>>>> of these properties.
>>>>
>>>> COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
>>>> represents the format of the color fill. Userspace can set enable solid
>>>> fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
>>>> the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
>>>> framebuffer to NULL.
>>>
>>> I suppose that COLOR_FILL should override framebuffer rather than
>>> requiring that FB is set to NULL. In other words, if color_filL_format
>>> is non-zero, it would make sense to ignore the FB. Then one can use the
>>> color_fill_format property to quickly switch between filled plane and
>>> FB-backed one.
>>
>> That would be inconsistent with the rest of the KMS uAPI. For instance,
>> the kernel will error out if CRTC has active=0 but a connector is still
>> linked to the CRTC. IOW, the current uAPI errors out if the KMS state
>> is inconsistent.
> 
> So if the use-case here really is to solid-fill a plane (and not just
> provide a background color for the crtc overall), then I guess we could
> also extend addfb to make that happen. We've talked in the past about
> propertery-fying framebuffer objects, and that would sort out this uapi
> wart. And I agree the color fill vs PLANE_ID issue is a bit ugly at least.
> 
> But if the use-cases are all background color then just doing the crtc
> background color would be tons simpler (and likely also easier to support
> for more hardware).

No. The hardware supports multiple color-filled planes, which do not 
have to cover the whole CRTC.

-- 
With best wishes
Dmitry


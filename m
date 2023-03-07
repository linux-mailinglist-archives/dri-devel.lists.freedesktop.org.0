Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783B76AE0B3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 14:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEB810E49F;
	Tue,  7 Mar 2023 13:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB7710E49F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 13:37:24 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id k14so17088449lfj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 05:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678196242;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=att8u7Sg5USMKd1JWAj5fcOvxLzquAm+yctu+vJJGmk=;
 b=u8jio6M4Bi1IlrmYfdfyYX69Nv3uGK3nF/sCLrFA5zvGkRs88KOrLJBo0V8kh4rDRv
 S+CN3pvqUd8eH23svbBD1gPKdL+QB1E5CmWcRgoFDW0u987cl+zWzZLOIElUBd+RplDy
 MH6AlJIB2OdsQYFFHNiRTM0T2DBO9XY0uoJm2f8WGDI0nxIytNy74fHndvMBAJwscsvI
 iQTXf4wLm88WgzzcLw/F8/qcKKDgyPRtS/syh+tfGLi4Ppe9ZlyvhQYlfr8+d84U4g0x
 yvF9pHL9CK4sM2O9udVjdMxdu2xlZ0JU4BlGVmoeRJMDAN6o0FQnnYqyF/cyRbmWQ1X9
 +Qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678196242;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=att8u7Sg5USMKd1JWAj5fcOvxLzquAm+yctu+vJJGmk=;
 b=h37DuLlMwRTsc1VP0/OWyl3yQIJWLZd4MT2121f9741KsJ+Jo91HZTSewf+/kb+9lb
 KhARib+Ghbp8PQbWLOXzSYVtOmdxU59ly9uGOscQhrUSfaUoH0enkzZKHWTYznOiQ5Af
 j0V4OCNZCluWNqLq25m+eTg0JASIUwoA09HWP6FJqg8SbTttSd4omd8BZ86rVo7XVTFM
 4A6d3kFnvsamY1SeP1ku/HjBdNexkQiVxaLV6muOSkl0jzPHOf3TyUSouVbO+qGG3A9O
 T+GcvYYZEAuWyFmHzoTAuKhiYYcgXzWAFry7yuegWuxmZCM72E/baMJSjqxlVhHTMZmL
 i58g==
X-Gm-Message-State: AO0yUKWHPNAmj8F+hlGbRu5bVuvtUZu0BEr9HPXRj6Lwl2DPE2F4BYxr
 954HPruILXwAYEbykIHsB0mhyg==
X-Google-Smtp-Source: AK7set/iUKVW9nOe4bWML5c3IaCFN7RLZmIEWrMcDr+hW+xy2LV1qA52wUvkDgDJASXLtisA+EjlGQ==
X-Received: by 2002:ac2:59dc:0:b0:4d8:537a:753f with SMTP id
 x28-20020ac259dc000000b004d8537a753fmr4746540lfn.6.1678196242448; 
 Tue, 07 Mar 2023 05:37:22 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a2eb5b0000000b00294692d8645sm2193108ljn.17.2023.03.07.05.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:37:22 -0800 (PST)
Message-ID: <3f7a065b-fa41-36ee-2055-617979435be2@linaro.org>
Date: Tue, 7 Mar 2023 15:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 07/10] drm/display/dsc: include the rest of pre-SCR
 parameters
Content-Language: en-GB
To: Jani Nikula <jani.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
 <20230228113342.2051425-8-dmitry.baryshkov@linaro.org>
 <87pm9tycn5.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <87pm9tycn5.fsf@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/02/2023 18:31, Jani Nikula wrote:
> On Tue, 28 Feb 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> DSC model contains pre-SCR RC parameters for other bpp/bpc combinations,
>> include them here for completeness.
> 
> Need to run now, note to self:
> 
> Does i915 use the arrays to limit the bpp/bpc combos supported by
> hardware? Do we need to add separate limiting in i915.

There is already a limitation in intel_dsc_compute_params(): the driver 
uses DRM_DSC_1_1_PRE_SCR only in a limited amount of cases (bpp 8 or 12, 
bpc 8, 10 or 12). But thanks, I noticed a bug there.

> 
> BR,
> Jani.
> 
-- 
With best wishes
Dmitry


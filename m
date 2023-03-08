Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 907BD6B0722
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 13:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4449710E5CA;
	Wed,  8 Mar 2023 12:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68B410E5CA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 12:32:18 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id s22so21091476lfi.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 04:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678278737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JYCVnd5YdaFCR9H8GFpuIDv5wtoHNnFAfbde7RyXdY0=;
 b=KuRZTVNh++1Nt8ce7WUjamI0nwjZ1pIzbNfdZ/2XCgUtas1hsUeqDSIXbVR43pP40k
 cdtFVTT2SkgUiNlb6lhQf0wGkMilP2Jvc97dgMvINYwmbCUwHf5kO+BeeKefryBRCXZR
 XAXRszm/oHTJOcv+Ziij3SyfrpHwPIbd/PPFnyHuJ76+IhzFxMS78Z56WRelIAE2eQSm
 Myizvn5e1OvwZ66Og518Iea97K5G91NlFZRQdDG2ViRg1z5bgMVFApIt1slketIkKa5h
 Rff7bt3rwkNx3s0dXmLF6ZDy91NWcbedhr52VThrbQmjWBPXT14I0asVzvU7mEJ55FNE
 SREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678278737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JYCVnd5YdaFCR9H8GFpuIDv5wtoHNnFAfbde7RyXdY0=;
 b=752vVnHvTW1zvmUGatEDN1EdvAsmhnmsELeFed2FFd8vhJUHP3vz+MY1+aJT3CyjsJ
 MuAClzuim8qMrsJGjV0HOBNRtVXLiFcRK/CUUU1dgyUob4oWxtmtNEMnTJzOfnPS6hBT
 gdPirIv4MmYI3H6Gnp5NoPjjWgRGPdL2HzKFhnwLN5ecaEJ66E1mE6eSxuVD6JLTrsT3
 8Ws96iq1rdW5QLAQu/kfPsctSEstN8OAS1K4vCyHtyF2R/T1UgD0frUkJUiYQMhQxyaU
 exUNe/KTbqQVfn1YPWihTfMv18eilStXQbKp57joe3sUIbA/y8tiJa/rNsgsjLNpew3G
 qjWg==
X-Gm-Message-State: AO0yUKWV4L+a0uI3CURqpwnx3FRm66U4Ho3LMPWHfANQuI4dOisleJVr
 UOXv4wr0ac52eZ6FLTw4D1fdKA==
X-Google-Smtp-Source: AK7set9J8lhl9WY2p1nliUzTFep+iO/5QH9qGot2puNZHGZVwNyHDNIGSjdPAu41Hkd/+/0J2wERgg==
X-Received: by 2002:ac2:5486:0:b0:4dc:65c0:c74e with SMTP id
 t6-20020ac25486000000b004dc65c0c74emr4947358lfk.29.1678278737107; 
 Wed, 08 Mar 2023 04:32:17 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d21-20020ac25455000000b004dc7fe3a2d3sm2317764lfn.135.2023.03.08.04.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 04:32:16 -0800 (PST)
Message-ID: <6bd9b493-01da-0542-2a21-10602dba6a1a@linaro.org>
Date: Wed, 8 Mar 2023 14:32:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/7] Enable YCbCr420 format for VDSC
Content-Language: en-GB
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <87ttyvbhuz.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <87ttyvbhuz.fsf@intel.com>
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
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/03/2023 13:30, Jani Nikula wrote:
> On Wed, 22 Feb 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
>> This patch series aims to enable the YCbCr420 format
>> for DSC. Changes are mostly compute params related for
>> hdmi,dp and dsi along with the addition of new rc_tables
>> for native_420 and corresponding changes to macros used to
>> fetch them.
>> There have been discussions prior to this series in which some patches
>> have gotten rb and can be found in the below link
>> https://patchwork.freedesktop.org/series/113729
> 
> I think it would be useful to get [1] from Dmitry merged to
> drm-misc-next first, have that in drm-next, and again backmerged to
> drm-intel-next before this. At least patches 1-5.
> 
> There's not much point in all drivers duplicating the parameters, and we
> need to move towards common code. Dmitry has been helpful in
> contributing this to us.

Note, while I slightly reworked the calculate_rc_params() function, I 
did not touch the intel_qp_tables (mostly since we do not need them for 
drm/msm (at least for now). Our current plan is to use fixed params (at 
least in the short notice). We might have to reconsider it at some point.

However it might be wise to merge them with amdgpu's qp tables. amdgpu 
driver also contains code to calculate RC params. It might be worth 
moving RC calculation to the common helper.

> 
> BR,
> Jani.
> 
> 
> [1] https://patchwork.freedesktop.org/series/114473/
> 
>>
>> Ankit Nautiyal (2):
>>    drm/dp_helper: Add helper to check DSC support with given o/p format
>>    drm/i915/dp: Check if DSC supports the given output_format
>>
>> Suraj Kandpal (4):
>>    drm/i915: Adding the new registers for DSC
>>    drm/i915: Enable YCbCr420 for VDSC
>>    drm/i915/display: Fill in native_420 field
>>    drm/i915/vdsc: Check slice design requirement
>>
>> Swati Sharma (1):
>>    drm/i915/dsc: Add debugfs entry to validate DSC output formats
>>
>>   drivers/gpu/drm/i915/display/icl_dsi.c        |   2 -
>>   .../drm/i915/display/intel_crtc_state_dump.c  |   4 +-
>>   .../drm/i915/display/intel_crtc_state_dump.h  |   2 +
>>   .../drm/i915/display/intel_display_debugfs.c  |  78 ++++++++
>>   .../drm/i915/display/intel_display_types.h    |   1 +
>>   drivers/gpu/drm/i915/display/intel_dp.c       |  39 +++-
>>   .../gpu/drm/i915/display/intel_qp_tables.c    | 187 ++++++++++++++++--
>>   .../gpu/drm/i915/display/intel_qp_tables.h    |   4 +-
>>   drivers/gpu/drm/i915/display/intel_vdsc.c     | 108 +++++++++-
>>   drivers/gpu/drm/i915/i915_reg.h               |  28 +++
>>   include/drm/display/drm_dp_helper.h           |  13 ++
>>   11 files changed, 442 insertions(+), 24 deletions(-)
> 

-- 
With best wishes
Dmitry


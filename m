Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE53C705B97
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 02:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5074910E389;
	Wed, 17 May 2023 00:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8E710E388
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 00:03:20 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ac80ed7f26so383841fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 17:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684281797; x=1686873797;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2ieFz8z1+Uma6qKTvu/I6fnjYeaEZwlD0iXkEDsR+9k=;
 b=UshE9JIJ/9HvEJVKWrA762EiI36kpduypzigFBQuJwlZW7f6WGcWA5yq8sBWUGM0eu
 HS29i3pTtqcvTcwsgOac0ZNMa33Y8zb4untGl0yC73/7pcZ0tRPXRcU+uJsbGmJzcJkW
 RzfnDVFtPe47xpnYnjnEADQvcdrorT6JXjGVJW4yUbuPQlUTw+bCdgf5u8V9d27m3xOn
 lLK7Etj8BdDifTR/bI3/WgspAE5I/q69PCG6be2kN6BdpnDtepoRqKOG0WXDUCXOy8z7
 WFFdg0lHsfLBuXFIklVcOb+8KK4FyRyjajIA02dFHobHe9ApLag/GH8/k9meTiC2+KPx
 UTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684281797; x=1686873797;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ieFz8z1+Uma6qKTvu/I6fnjYeaEZwlD0iXkEDsR+9k=;
 b=EJ6vqjQMF/Vh/hiJii7VPRUuN75n82ZbcDSPW3RRhxwqf/RW/KNCjU9eD59zrnMWUW
 nMyF193GO1dVrCF2X4Ayyot6dZMAKRM/TrRhYW2UzJGB+ZPyykG84Lvg5eCQIz1yTls3
 2Gp8TGBznfGGdF0dyZJaXzHiaSOY0PPgnr3zCUB4Fft/Fx/U12kFmuvG/kIbgyXe3xBI
 rdCU1R4+LcFRotstwGfH8GXLEnftdsjw0IOYk2/8A/cZczRzpwbpkfvv5IeLVC5K75EY
 X4+r4MaHDNRnmT5y3kK9F41GZkZjOVmFucb0h//A+RNVCMGsFoRnQoBl9rOpGErncrkF
 q9/Q==
X-Gm-Message-State: AC+VfDwkkjfNjXebsdyR8l8DhkotapUEOrwBQp+qIp3JkUe7/oyR9z7m
 XTji8SZgHhlHxfe9elkW+RcY3A==
X-Google-Smtp-Source: ACHHUZ7F1Ki5yXvEvp0yB37BNoPUY0CUEmQYoTrjfK5dJahsPlYAan5ywIdhaactI13TQSM3yHahoQ==
X-Received: by 2002:a2e:b002:0:b0:2ac:87f6:7b4a with SMTP id
 y2-20020a2eb002000000b002ac87f67b4amr8575604ljk.2.1684281797277; 
 Tue, 16 May 2023 17:03:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a2e8182000000b002a8e8c776e9sm4338909ljg.56.2023.05.16.17.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 17:03:16 -0700 (PDT)
Message-ID: <12082d1c-4ff2-5ca6-fdaa-2fad6bd06e84@linaro.org>
Date: Wed, 17 May 2023 03:03:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH v5 6/8] drm/display/dsc: split DSC 1.2 and DSC
 1.1 (pre-SCR) parameters
Content-Language: en-GB
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230504153511.4007320-1-dmitry.baryshkov@linaro.org>
 <20230504153511.4007320-7-dmitry.baryshkov@linaro.org>
 <SN7PR11MB6750F3758BA9B176904C449BE3799@SN7PR11MB6750.namprd11.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <SN7PR11MB6750F3758BA9B176904C449BE3799@SN7PR11MB6750.namprd11.prod.outlook.com>
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
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2023 21:46, Kandpal, Suraj wrote:
>>
>> The array of rc_parameters contains a mixture of parameters from DSC 1.1
>> and DSC 1.2 standards. Split these tow configuration arrays in preparation to
>> adding more configuration data.
>>
> 
> Hi ,
> Needed to add some more comments apart from the previous ones already given
> 

[skipped]


>> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c
>> b/drivers/gpu/drm/i915/display/intel_vdsc.c
>> index d4340b18c18d..bd9116d2cd76 100644
>> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
>> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
>> @@ -226,7 +226,15 @@ int intel_dsc_compute_params(struct
>> intel_crtc_state *pipe_config)
>>   	if (DISPLAY_VER(dev_priv) >= 13) {
>>   		calculate_rc_params(vdsc_cfg);
>>   	} else {
>> -		ret = drm_dsc_setup_rc_params(vdsc_cfg);
>> +		if ((compressed_bpp == 8 ||
>> +		     compressed_bpp == 12) &&
>> +		    (vdsc_cfg->bits_per_component == 8 ||
>> +		     vdsc_cfg->bits_per_component == 10 ||
>> +		     vdsc_cfg->bits_per_component == 12))
>> +			ret = drm_dsc_setup_rc_params(vdsc_cfg,
>> DRM_DSC_1_1_PRE_SCR);
>> +		else
>> +			ret = drm_dsc_setup_rc_params(vdsc_cfg,
>> DRM_DSC_1_2_444);
>> +
> 
> I do not think this kind of assignment works as you will also be adding
> DRM_DSC_1_2_422 and DRM_DSC_1_2_420 in further patches and AFAICS
> There is no where in patch 8 that you have accounted for when 422 or 420 will be used.
> Maybe you can add an if case inside the else block to check pipe_config->output_format
> to pass the rc_param_data in patch 8

I don't think this is necessary for now. The driver doesn't support YUV 
422. The YUV 420 is supported only for DISPLAY_VER(dev_priv) >= 14, 
however these helpers are only used for DISPLAY_VER(dev_priv) < 13.

I did not move RC calculation to drm_dsc_helpers.c (yet ?), which is 
used for DISPLAY_VER >= 13.

> 
> Regards,
> Suraj Kandpal
>>   		if (ret)
>>   			return ret;
>>
>> diff --git a/include/drm/display/drm_dsc_helper.h
>> b/include/drm/display/drm_dsc_helper.h
>> index 1681791f65a5..c634bb2935d3 100644
>> --- a/include/drm/display/drm_dsc_helper.h
>> +++ b/include/drm/display/drm_dsc_helper.h
>> @@ -10,12 +10,17 @@
>>
>>   #include <drm/display/drm_dsc.h>
>>
>> +enum drm_dsc_params_kind {
>> +	DRM_DSC_1_2_444,
>> +	DRM_DSC_1_1_PRE_SCR, /* legacy params from DSC 1.1 */ };
>> +
>>   void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);  int
>> drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
>> void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set
>> *pps_sdp,
>>   			      const struct drm_dsc_config *dsc_cfg);  void
>> drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg); -int
>> drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg);
>> +int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum
>> +drm_dsc_params_kind kind);
>>   int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>>
>>   #endif /* _DRM_DSC_HELPER_H_ */
>> --
>> 2.39.2
> 

-- 
With best wishes
Dmitry


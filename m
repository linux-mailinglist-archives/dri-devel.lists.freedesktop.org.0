Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B367064E1
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 12:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9474A10E3DC;
	Wed, 17 May 2023 10:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5C810E3DC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 10:09:42 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f2510b2b98so721679e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684318179; x=1686910179;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9rQtuk8SGkxNukVCo7LlvhK3JDoIhkFBqXPIuBONNGY=;
 b=NSQkvAOxCODv6jiL8sh20OLFflkAYnkZ2beFR9qEsuko/eQQQrFib/ClrrCeg4Qli6
 Sd9arGGkyFU/7oVki3cnLz4KWQ7jxvqVaiCou9047wAukw+OQ3Z+bEmDjEWNNg8XvacT
 836291EXjiMI68WlXWUbfI46l5YUkjR7y5Ko7VcIV1lrpPprQ8JTd7OF7iJMRptq7zvW
 Ka6MkzLG9OwpsB5y+QCUlIzo1CeqQYBZLksjMVoXqSfUGz1HxI1WtXKn6mabAhnv+qcl
 d62rBX6fPK2fpMJIOW0y9xvFcaKZlx8AFdOb1AtG3s/kaXgjH4ABMBakRi/+WRNsnZt7
 ALhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684318179; x=1686910179;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9rQtuk8SGkxNukVCo7LlvhK3JDoIhkFBqXPIuBONNGY=;
 b=UgepITgrZ2s+gJYu90U5BUgzImpNCrw03lgXnOzCSySy300NBTlk5ZvJhc8wuGgSQJ
 uwZ8xyFp4YknvBy2eamJmpH2zmJucjpUOAzLCKOhGjJqcZEswul22BRTyxJEp1fd4dGP
 bfOZTqdSVbjqRCkfF2JXiKTLz0G+cDryNLewvkrAS1KDTJ1dv3siXoNiEMzZdXGJVxWD
 xrjMm8UZmIZBI68s4BXku2ng8NSL81kmmgtrXoqXG8XChOF3O1fZOtXDW5S4RtKrfuvq
 WLMV0TYRE+kzV9RvX+uYfK6SG0ApuCqa8limo55vsBF5/utVdVLDnKTUOTugLZdizSO7
 w1aw==
X-Gm-Message-State: AC+VfDyI0Jagck9ZAuQlsPTl5dRYqlU1rU147+mw3n8N2Wfh3CXc2381
 XJ8eIk1x5ASzI+HN/7ys6Qj0zg==
X-Google-Smtp-Source: ACHHUZ7FtCbg0lq+akFWOA5Vp8mULeTuKj1ob5Kaospamb5TNoJS916jAC9TyuZACEW05B3CKRINqA==
X-Received: by 2002:ac2:5145:0:b0:4eb:43f5:738e with SMTP id
 q5-20020ac25145000000b004eb43f5738emr36080lfd.60.1684318178802; 
 Wed, 17 May 2023 03:09:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c6-20020ac25306000000b004f00d3d9df9sm3319055lfh.188.2023.05.17.03.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 03:09:38 -0700 (PDT)
Message-ID: <524ed4f7-d2da-5864-dd2a-16fd04533667@linaro.org>
Date: Wed, 17 May 2023 13:09:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 6/8] drm/display/dsc: split DSC 1.2 and DSC 1.1
 (pre-SCR) parameters
Content-Language: en-GB
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230517000740.2102599-1-dmitry.baryshkov@linaro.org>
 <20230517000740.2102599-7-dmitry.baryshkov@linaro.org>
 <SN7PR11MB675047C1B66D356C56C1A0B0E37E9@SN7PR11MB6750.namprd11.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <SN7PR11MB675047C1B66D356C56C1A0B0E37E9@SN7PR11MB6750.namprd11.prod.outlook.com>
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

On 17/05/2023 06:10, Kandpal, Suraj wrote:
>>
>> The array of rc_parameters contains a mixture of parameters from DSC 1.1
>> and DSC 1.2 standards. Split these tow configuration arrays in preparation to
>> adding more configuration data.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/display/drm_dsc_helper.c  | 139 ++++++++++++++++++----
>> drivers/gpu/drm/i915/display/intel_vdsc.c |  10 +-
>>   include/drm/display/drm_dsc_helper.h      |   7 +-
>>   3 files changed, 129 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c
>> b/drivers/gpu/drm/display/drm_dsc_helper.c
>> index acb93d4116e0..f9d01d72c1ff 100644
>> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
>> @@ -325,10 +325,88 @@ struct rc_parameters_data {
>>   #define DSC_BPP(bpp)	((bpp) << 4)
>>
>>   /*
>> - * Selected Rate Control Related Parameter Recommended Values
>> - * from DSC_v1.11 spec & C Model release: DSC_model_20161212
>> + * Rate Control Related Parameter Recommended Values from DSC_v1.1
>> spec
>> + prior
>> + * to DSC 1.1 fractional bpp underflow SCR (DSC_v1.1_E1.pdf)
>> + *
>> + * Cross-checked against C Model releases: DSC_model_20161212 and
>> + 20210623
>>    */
>> -static const struct rc_parameters_data rc_parameters[] = {
>> +static const struct rc_parameters_data rc_parameters_pre_scr[] = {
>> +	{
>> +		.bpp = DSC_BPP(8), .bpc = 8,
>> +		{ 512, 12, 6144, 3, 12, 11, 11, {
>> +			{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
>> +			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
>> +			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
>> +			{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
>> +			}
>> +		}
>> +	},
>> +	{
>> +		.bpp = DSC_BPP(8), .bpc = 10,
>> +		{ 512, 12, 6144, 7, 16, 15, 15, {
>> +			/*
>> +			 * DSC model/pre-SCR-cfg has 8 for
>> range_max_qp[0], however
>> +			 * VESA DSC 1.1 Table E-5 sets it to 4.
>> +			 */
>> +			{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
>> +			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
>> +			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
>> +			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
>> +			}
>> +		}
>> +	},
>> +	{
>> +		.bpp = DSC_BPP(8), .bpc = 12,
>> +		{ 512, 12, 6144, 11, 20, 19, 19, {
>> +			{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
>> +			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
>> +			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
>> +			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
>> +			{ 21, 23, -12 }
>> +			}
>> +		}
>> +	},
>> +	{
>> +		.bpp = DSC_BPP(12), .bpc = 8,
>> +		{ 341, 15, 2048, 3, 12, 11, 11, {
>> +			{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
>> +			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
>> +			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
>> +			{ 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
>> +			}
>> +		}
>> +	},
>> +	{
>> +		.bpp = DSC_BPP(12), .bpc = 10,
>> +		{ 341, 15, 2048, 7, 16, 15, 15, {
>> +			{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
>> +			{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
>> +			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
>> +			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
>> +			}
>> +		}
>> +	},
>> +	{
>> +		.bpp = DSC_BPP(12), .bpc = 12,
>> +		{ 341, 15, 2048, 11, 20, 19, 19, {
>> +			{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
>> +			{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
>> +			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
>> +			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
>> +			{ 21, 23, -12 }
>> +			}
>> +		}
>> +	},
>> +	{ /* sentinel */ }
>> +};
>> +
>> +/*
>> + * Selected Rate Control Related Parameter Recommended Values from DSC
>> +v1.2, v1.2a, v1.2b and
>> + * DSC_v1.1_E1 specs.
>> + *
>> + * Cross-checked against C Model releases: DSC_model_20161212 and
>> +20210623  */ static const struct rc_parameters_data
>> +rc_parameters_1_2_444[] = {
>>   	{
>>   		.bpp = DSC_BPP(6), .bpc = 8,
>>   		{ 768, 15, 6144, 3, 13, 11, 11, {
>> @@ -388,22 +466,18 @@ static const struct rc_parameters_data
>> rc_parameters[] = {
>>   		{ 512, 12, 6144, 3, 12, 11, 11, {
>>   			{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
>>   			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
>> -			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 }, { 5, 12, -12 },
>> -			{ 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
>> +			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 10, -10 }, { 5, 11, -12 },
>> +			{ 5, 11, -12 }, { 9, 12, -12 }, { 12, 13, -12 }
>>   			}
>>   		}
>>   	},
>>   	{
>>   		.bpp = DSC_BPP(8), .bpc = 10,
>>   		{ 512, 12, 6144, 7, 16, 15, 15, {
>> -			/*
>> -			 * DSC model/pre-SCR-cfg has 8 for
>> range_max_qp[0], however
>> -			 * VESA DSC 1.1 Table E-5 sets it to 4.
>> -			 */
>> -			{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
>> +			{ 0, 8, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
>>   			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
>> -			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
>> -			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
>> +			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 14, -10 }, { 9, 15, -12 },
>> +			{ 9, 15, -12 }, { 13, 16, -12 }, { 16, 17, -12 }
>>   			}
>>   		}
>>   	},
>> @@ -412,9 +486,9 @@ static const struct rc_parameters_data
>> rc_parameters[] = {
>>   		{ 512, 12, 6144, 11, 20, 19, 19, {
>>   			{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
>>   			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
>> -			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
>> -			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
>> -			{ 21, 23, -12 }
>> +			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 18, -10 },
>> +			{ 13, 19, -12 }, { 13, 19, -12 }, { 17, 20, -12 },
>> +			{ 20, 21, -12 }
>>   			}
>>   		}
>>   	},
>> @@ -498,8 +572,8 @@ static const struct rc_parameters_data
>> rc_parameters[] = {
>>   		{ 341, 15, 2048, 3, 12, 11, 11, {
>>   			{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
>>   			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
>> -			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 11, -10 },
>> -			{ 5, 12, -12 }, { 5, 13, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
>> +			{ 3, 8, -8 }, { 3, 9, -10 }, { 5, 9, -10 }, { 5, 9, -12 },
>> +			{ 5, 9, -12 }, { 7, 10, -12 }, { 10, 11, -12 }
>>   			}
>>   		}
>>   	},
>> @@ -508,8 +582,8 @@ static const struct rc_parameters_data
>> rc_parameters[] = {
>>   		{ 341, 15, 2048, 7, 16, 15, 15, {
>>   			{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
>>   			{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
>> -			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
>> -			{ 9, 17, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
>> +			{ 7, 12, -8 }, { 7, 13, -10 }, { 9, 13, -10 }, { 9, 13, -12 },
>> +			{ 9, 13, -12 }, { 11, 14, -12 }, { 14, 15, -12 }
>>   			}
>>   		}
>>   	},
>> @@ -518,9 +592,9 @@ static const struct rc_parameters_data
>> rc_parameters[] = {
>>   		{ 341, 15, 2048, 11, 20, 19, 19, {
>>   			{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
>>   			{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
>> -			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 19, -10 },
>> -			{ 13, 20, -12 }, { 13, 21, -12 }, { 15, 21, -12 },
>> -			{ 21, 23, -12 }
>> +			{ 11, 16, -8 }, { 11, 17, -10 }, { 13, 17, -10 },
>> +			{ 13, 17, -12 }, { 13, 17, -12 }, { 15, 18, -12 },
>> +			{ 18, 19, -12 }
>>   			}
>>   		}
>>   	},
>> @@ -602,7 +676,8 @@ static const struct rc_parameters_data
>> rc_parameters[] = {
>>   	{ /* sentinel */ }
>>   };
>>
>> -static const struct rc_parameters *get_rc_params(u16 dsc_bpp,
>> +static const struct rc_parameters *get_rc_params(const struct
>> rc_parameters_data *rc_parameters,
>> +						 u16 dsc_bpp,
>>   						 u8 bits_per_component)
>>   {
>>   	int i;
>> @@ -622,11 +697,13 @@ static const struct rc_parameters
>> *get_rc_params(u16 dsc_bpp,
>>    * function.
>>    *
>>    * @vdsc_cfg: DSC Configuration data partially filled by driver
>> + * @type: operating mode and standard to follow
>>    *
>>    * Return: 0 or -error code in case of an error
>>    */
>> -int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg)
>> +int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum
>> +drm_dsc_params_type type)
>>   {
>> +	const struct rc_parameters_data *data;
>>   	const struct rc_parameters *rc_params;
>>   	int i;
>>
>> @@ -634,7 +711,19 @@ int drm_dsc_setup_rc_params(struct
>> drm_dsc_config *vdsc_cfg)
>>   			 !vdsc_cfg->bits_per_component))
>>   		return -EINVAL;
>>
>> -	rc_params = get_rc_params(vdsc_cfg->bits_per_pixel,
>> +	switch (kind) {
> 
> Shouldn't this be type now.

Yes. I missed one hunk when squashing fixup patches.

> 
> 
>> +	case DRM_DSC_1_2_444:
>> +		data = rc_parameters_1_2_444;
>> +		break;
>> +	case DRM_DSC_1_1_PRE_SCR:
>> +		data = rc_parameters_pre_scr;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	rc_params = get_rc_params(data,
>> +				  vdsc_cfg->bits_per_pixel,
>>   				  vdsc_cfg->bits_per_component);
>>   	if (!rc_params)
>>   		return -EINVAL;
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
>>   		if (ret)
>>   			return ret;
>>
>> diff --git a/include/drm/display/drm_dsc_helper.h
>> b/include/drm/display/drm_dsc_helper.h
>> index 1681791f65a5..66eac7276d04 100644
>> --- a/include/drm/display/drm_dsc_helper.h
>> +++ b/include/drm/display/drm_dsc_helper.h
>> @@ -10,12 +10,17 @@
>>
>>   #include <drm/display/drm_dsc.h>
>>
>> +enum drm_dsc_params_type {
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
>> +drm_dsc_params_type type);
>>   int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>>
>>   #endif /* _DRM_DSC_HELPER_H_ */
>> --
>> 2.39.2
> 

-- 
With best wishes
Dmitry


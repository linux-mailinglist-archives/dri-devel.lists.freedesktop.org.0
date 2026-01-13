Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1329D1B54D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 22:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320CB89D8E;
	Tue, 13 Jan 2026 21:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+qWKaYj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToCp2PKv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367BF89D8E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 21:02:13 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DIE1WW389531
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 21:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PN/lkOtrYA2OT2ZpcMymY52CzXoyPIuxPKU48Dyzghs=; b=M+qWKaYjaEwGs7Xv
 1f0ZBNDgMy5taVSN17y1VlpHKIz3yinTD/VEQZMCRYUaE2DcUPd+JALbn2IOWlTe
 C5zbGPVBlFxdNbHlArgTGvZk9N00vfcXAhfhd1WNN6HapejiP2ok+FmMLvwN8IlA
 7HxHc0OVNZopGB7BjYxer4BjBHr4Jm2lY0Jax3wrEDOzo2QZqo+Rg5qbBP6vbsIs
 azoJn7eLlyYL0ngJDucVHxYUtsTYLKVMci05VaRJzDVaHcqLk+s1BrMtXNDt13kU
 ng4zgKl3pygNStskRIUSlSzqoQ3NSsLXDQDIwMjXaBLHXxBBtJ2ClqJSQ66dP2Ow
 /Ld6tQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58rgkc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 21:02:12 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5636136aed8so10989105e0c.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768338132; x=1768942932;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PN/lkOtrYA2OT2ZpcMymY52CzXoyPIuxPKU48Dyzghs=;
 b=ToCp2PKvIrXHm9TgQD+o3dsuyFGmd+E2EwM2Y1kkHhkpBc6GaunrQHSj9QA5Pk+oPx
 xONMXcehVUKQfKJgCTUMgvHVB9vkuoFA5NlkkQTj9gm0zTfBW807thgyBdDmydKJXy+Q
 yxNyZOJ9ms0GqyZSLAHEvc+0Kg9P4gbTjUVFYOWTJXVAYUC15vwhbFQdQqNrX0nCGTz9
 JqMlIui6qbwetT0F1oU4bgFzgV3VeCur1BgH5DHOMl1GkmUScP6lkD2OmKuAa84ndP9u
 B9FeYvCvZcw/kv/qyHhP6qKm8LsOo4qSEfRwevTfci9Kcf4uaKW/3AE/3DNiyKxbn59g
 n+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768338132; x=1768942932;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PN/lkOtrYA2OT2ZpcMymY52CzXoyPIuxPKU48Dyzghs=;
 b=stNvPhcABpYXHeSe2NWwodOpirB1dWqlCRpJ8eq8gOPrJN7bsGLE5fxtwMAABcleAK
 OEQUC1PXGIBTlQmgZIPnQKuLdgRJFHJTsCmc6VVKBdBfpy2g0v8Z34OwjCq4wCummy4g
 RYu6QJH/xaIHmGMQg6yEbT4+dyAsWzFLhY6x77rCuSEnggLkAgeSqcsqAUdMahOxJ7TK
 IkIgDP9D1Jypa9rco0UY3NYxFqU4OuiRIJgilzbfJyrcKilCOZB1ldA9R7Uk1SrDteYv
 fhLW3xB0WWnHJfsH0hLVn/2zwK+uFHSlFneV1HB6KHUUREqY7QJ5H7486vm/mLmcKCDo
 PPMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqwreTBlWbsnS6AfV7IoJ7DGKch+xpkCYptUn7ab+g74JV4nN7lbGJbBK6M8MHTXJSi34BN8dGy24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy19AWdZp7BbRW+cSrZRFEx16wowaGUO6tI5zc6Wx+HU7OPST0p
 /zefWfG3h3o0Gy95UOrrEAcPHHU9WnDzknKclWscfHTURl2sqgZOEGFh18qkBRzueaW0Wmh4L+R
 bp+zFwONZ0WlILL3hAi2iKQenSUuiRHU7UaEZflpraurPLAlHzpNHHoirctaeGnlF6I4YZoo=
X-Gm-Gg: AY/fxX7UfPwWxWgvpaGUtTCSWHUKLnOQKHGuL4wp0hLhqmgSDB+IlR62iiG7Eb6D2Po
 /tIOLwWsn8VpNXBweB5DjWwEp+3QODrdtgxFWZGUdoGHcK7NsfF1wtdIe9pXm7L+7XQEXzFFutF
 yrW2qFQrqNrbgvXMBC6LIR3fk/j38VUGPIAI/2YAz0l3XVCjLIxFK4N0dW3n/Pf0GMKqCg1vT50
 22/SuU3ruVORD5SmO1ZoQLfstosU/nywiiIrna00LaZ4CyqFfKm+mQ+UmrxNGZ+kPwHQlIC02bl
 X8ZYsLx+tT9Q8f1r7syRBSHQMXQ7eUNQc95s6qevPRAg3ejeJa4EDwRykuSNJo80/UCxf9qV17+
 4s1D+l5RPYXBlCP7gXRvmHUiYA/X3miNkNFG9pJLNzLIFLRet18jMWxsDaKE1CaLrOK8acLf9x9
 ZFI7Hq
X-Received: by 2002:a05:6122:46a2:b0:563:687f:360c with SMTP id
 71dfb90a1353d-563a08080a7mr278138e0c.0.1768338131572; 
 Tue, 13 Jan 2026 13:02:11 -0800 (PST)
X-Received: by 2002:a05:6122:46a2:b0:563:687f:360c with SMTP id
 71dfb90a1353d-563a08080a7mr278104e0c.0.1768338131125; 
 Tue, 13 Jan 2026 13:02:11 -0800 (PST)
Received: from [192.168.1.188] (87-92-245-163.rev.dnainternet.fi.
 [87.92.245.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86ebfd007fsm1126590566b.31.2026.01.13.13.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 13:02:10 -0800 (PST)
Message-ID: <0919844a-9246-4bdc-979c-115ccc3995c2@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 23:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
 <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>
 <zmfgq5d2gwrxgvr4eh4th2gjef76gpbv54kz2myvfnqgpor4dn@7qjr262yryap>
 <20260113205955.GA2893481@ax162>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260113205955.GA2893481@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE3MiBTYWx0ZWRfX53a2IflTZiI5
 rtYnTkKfPw1CrBCoFJ2XTFqcmdWXr4NQkQMZIiGaw7reaNG/oStY3H+cSD9tK2xii8CebgltIcg
 mEJasMy7ssCnNm4VWxzMZMVkfn50XzvNKuZFaFkVzFf8fHAh0KB/SLNOR3Hgp2lpzlrN7rfUZZJ
 KPmDsmwoafhJtqBeW69/i6hP6T0+VjcfwgcRtzxvSNpSJwhahEE04manahkEBFvrmA5C8Y37bNr
 T02K1xKL5cH9ufIhRlbhkhJm0iczY8n997liRrwqMEr2cgd7DEN9p5x31U0xnjmuhNI/qoRkHb3
 RmyoBckXUZHVYHFo/riNWvk3LwDEApiOo8h5mEjO/WrzXOHf/Ukl+KZapyRmASIpISPkYJQ3L+b
 bq3e2XWDnyuUzXaGG34cRzUZ0sBtl1VWR9yVkjePt0y4uUppGJLFCUlCdTc8mFXOJ6fBZx6krRy
 QZ7r8+LF3uw9eGurjQg==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=6966b2d4 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8
 a=0--PztnLt7rTvDwXMSMA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: MEmaXNxao9JqFr2xNQocUIMj0VqnqlES
X-Proofpoint-GUID: MEmaXNxao9JqFr2xNQocUIMj0VqnqlES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130172
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13/01/2026 22:59, Nathan Chancellor wrote:
> On Mon, Jan 12, 2026 at 04:37:46AM +0200, Dmitry Baryshkov wrote:
>> On Fri, Jan 09, 2026 at 10:06:29AM +0100, Konrad Dybcio wrote:
>>> Dmitry, would it be beneficial to throw an actual error when the rate is
>>> is mangled? i.e.
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> index aa2303d0e148..4f710b8e6bc6 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> @@ -2404,9 +2404,9 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
>>>          return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
>>>   }
>>>   
>>> -static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>> -                              u32 rate, u32 stream_rate_khz,
>>> -                              bool is_ycbcr_420)
>>> +static int msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>> +                                 u32 rate, u32 stream_rate_khz,
>>> +                                 bool is_ycbcr_420)
>>>   {
>>>          u32 pixel_m, pixel_n;
>>>          u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
>>> @@ -2415,14 +2415,21 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>>          u32 const link_rate_hbr3 = 810000;
>>>          unsigned long den, num;
>>>   
>>> -       if (rate == link_rate_hbr3)
>>> +       switch (rate) {
>>> +       case link_rate_hbr3:
>>>                  pixel_div = 6;
>>> -       else if (rate == 162000 || rate == 270000)
>>> -               pixel_div = 2;
>>> -       else if (rate == link_rate_hbr2)
>>> +               break;
>>> +       case link_rate_hbr2:
>>>                  pixel_div = 4;
>>> -       else
>>> +               break;
>>> +       case 270000:
>>> +       case 162000:
>>> +               pixel_div = 2;
>>> +               break;
>>> +       default:
>>>                  DRM_ERROR("Invalid pixel mux divider\n");
>>> +               return -EINVAL;
>>
>> Well... In the ideal world, we can't end up here, PHY's
>> configure_dp_clocks (or qcom_edp_set_vco_div()) will fail if the link
>> rate is is invalid here. I think, we should return an error here, but
>> there is no need to propagate it further.
>>
>> See the discussion at https://lore.kernel.org/dri-devel/f2ce6ae51c50b0d2e57b905c63b43413@codeaurora.org/
> 
> I interpret that as approving of the above hunk but omitting the hunk
> that modifies msm_dp_ctrl_on_stream(). In that case, what is the point
> of changing the return type of msm_dp_ctrl_config_msa()? Wouldn't the
> below diff have the same exact effect as a smaller change? I don't mind
> rolling this up as a v2.
> 
> Cheers,
> Nathan
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index aa2303d0e148..d8ea73b89f7c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2409,20 +2409,27 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>   			       bool is_ycbcr_420)
>   {
>   	u32 pixel_m, pixel_n;
> -	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> +	u32 mvid, nvid, pixel_div, dispcc_input_rate;
>   	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
>   	u32 const link_rate_hbr2 = 540000;
>   	u32 const link_rate_hbr3 = 810000;
>   	unsigned long den, num;
>   
> -	if (rate == link_rate_hbr3)
> +	switch (rate) {
> +	case link_rate_hbr3:
>   		pixel_div = 6;
> -	else if (rate == 162000 || rate == 270000)
> -		pixel_div = 2;
> -	else if (rate == link_rate_hbr2)
> +		break;
> +	case link_rate_hbr2:
>   		pixel_div = 4;
> -	else
> +		break;
> +	case 162000:
> +	case 270000:
> +		pixel_div = 2;
> +		break;
> +	default:
>   		DRM_ERROR("Invalid pixel mux divider\n");
> +		return;

Please add a comment, stating that we can't actually reach it. LGTM 
otherwise.

> +	}
>   
>   	dispcc_input_rate = (rate * 10) / pixel_div;
>   

-- 
With best wishes
Dmitry


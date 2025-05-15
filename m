Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69684AB8D4A
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 19:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E95510E2A6;
	Thu, 15 May 2025 17:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5GcOq9j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0191410E1A8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 17:13:21 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFDpt007863
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 17:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yYY5LgPRLIrcdKBo4sFGaqpoE0nGNKtVE2RVccwfFlg=; b=Y5GcOq9jFeWOZVDD
 Wp0cXL7yUw4LnTspT78KA03rujBHrF7cXUO/6KD3mzlgkEHiicB0Ytq2lQtoQad8
 4N1SAwIhxX3Aa/Gc1l6xPR1ZVa6Vp8idrnEOYmgSDkv3HAWUZYbnuNF5z4voWMAP
 hd1ei+t35uiJmG9EHY5U8Mqds8UbUKC6b7oGUpGjU8Kld0SbCP/qna4vc4jsApIP
 vc85l6eaNVSYhHGxJcl3qDn5/lkIpNwKx8Op+w696lD4gX5ihJd+t4LKP4CjnwXm
 oK20wWCxR7rVJgqVnKKMzTPBNC5eJ0hv3LGC205kIEfZTh1TjBjuQjiCePRfru+/
 nAn7Lg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpy0y2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 17:13:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-30a80fe759bso1943596a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 10:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747329200; x=1747934000;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yYY5LgPRLIrcdKBo4sFGaqpoE0nGNKtVE2RVccwfFlg=;
 b=PTphlNgE7hFb5pwEozjoksRmE025YsOHlK46VffLtmrm81bNsPYDPvJsalUASxkbh6
 toTNr9NaSgmP+eJYBMG6h41iOQ2XkvjfS5Dg8qjk8O0B4gkmMjL1U8x+UhleepD4Fsk0
 lpfo7GRKOQS+B0Nd0QTp/iYMagBl1eaUwqEOfr8P8Vr7Sj6DvjMO+56LebC5bGrFLkW0
 GHvTSY3Etb6glyUiuIVMHepEmjl4SV4ew13bqYlalEIdRlaxenColugIDhQaSC06Rf5K
 HtENKUtKuWgL28UNKjFIdptJYchzoba0Q28swrKBdTDMU+FoaBELTN6h0JvcxbOPEJv5
 BiKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIecUka0G0V9/jxcDlktKsvP1lEzFtIk1kjJ1wyQ54Kmujw98atAAMkFhSHERQ9wYxuNhTrMaidZw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTthM1yyi8x9LBgtEpSSf/ZLhO6Uc0kyP1N+1vJWNhDNiy6P/E
 8n4KF6VAKZM49NouI6HQVyCzWb/V/NENGksA+1DaRRCYow2o+P0CNe3UAJzjUYdYFtEEYVEO02G
 YO1xFDBkQWMMUHn5bO+rv95rckWn1bZD5Ppg/KRI4DYIGNH3Ge4vHRTY0rj8QcCSczRkNdiA=
X-Gm-Gg: ASbGncsh1/V+UGFDAHMnW8/WlFnvgxdybOKPxT35AGnQ8+OZVx7Gp6R/XLfO3GSJA8y
 sUxADHC2oFTg6TYnPtV+toldYIWmjje4rYmyKWC0n5MpHArVeOjc/ij6cr3reN4pxbYunodeGpU
 OAfXeP9OcRFOKZYrtAy/lZvnVhJCfxTiMkB//riRPFFGEzJNIwo5Sj9vnxrXrOtlYKF/8CMCLev
 OeBEyfsNjDzguLy187krVm0nt+fpaP9Ym3ezubS+lEU7on4m3cQl5fBA6aL1xwU3xbcS/fq6MLX
 d3lRCskwcVOAYm8ckDuVutdOuIff7g+p2ei8mje3GqRhR06BxU9QqlgqAFegox6DyhOYlQ==
X-Received: by 2002:a17:90b:33c2:b0:2ff:6608:78cd with SMTP id
 98e67ed59e1d1-30e7d544fd4mr288089a91.9.1747329199744; 
 Thu, 15 May 2025 10:13:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNDu7NvHwl9BxUYwJis4ASPQgBchI/AV8+LYPCkrCV2kofbKQRnSnmom5F9mPfzufGWwElaA==
X-Received: by 2002:a17:90b:33c2:b0:2ff:6608:78cd with SMTP id
 98e67ed59e1d1-30e7d544fd4mr288065a91.9.1747329199310; 
 Thu, 15 May 2025 10:13:19 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e7d5918aesm64070a91.49.2025.05.15.10.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 10:13:19 -0700 (PDT)
Message-ID: <abc767ff-acb9-47c3-8b6e-6c6150f7b19e@oss.qualcomm.com>
Date: Thu, 15 May 2025 10:13:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/msm/dpu: Add max pingpong and dsc width to HW
 catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-2-c8ba0d9bb858@oss.qualcomm.com>
 <txn2anohfbrymaseeo55slmzimstietsrmhx3mhigw4fcx3ow4@b42b3n53et6l>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <txn2anohfbrymaseeo55slmzimstietsrmhx3mhigw4fcx3ow4@b42b3n53et6l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ierd1rY0dBxkxiYLfywbIW2VcnzGnzos
X-Proofpoint-ORIG-GUID: ierd1rY0dBxkxiYLfywbIW2VcnzGnzos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3MCBTYWx0ZWRfX+41zla+fTYFw
 vHFIUiuO2SDo9hzqkoyDtCOPC0k55DMaLF1MgyT16iNAeu5uHRYtKt/8wa86xeyV0VpwEzqUl2e
 N+oATRQ92YqrhG76eb48Ufb7y11vAWOgyIFC2OYKbahRphF1oZ6OmKxqmJCS89pBo3Y0CK+UiCz
 RD3+v574CNyiQRknazlQgOPl82syzAlyk5l/lHcUBEub35klWUKXol8nnsvLTr3+h/2V5qllvAS
 anyhFg+BofxloN/l1guw4wdeUgm//q7HGNg0LN59bYb1GZkNFOYlii8qwISYW7VQqQ3GvEZ5Zzs
 9/WjTHXwY3hff20jvhJe1qQn67kacwhsnZRoHgo3I/JSwAMb7r4z27pSRLHLrjE0Bt9z8NfQhem
 3Wc9Tsf+W0XHcDLbMio0DrqoxV+O2CmeOlUBkdMybT2mSAp05Xt8j3j8+q+bHzWQwjijPnzd
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=682620b0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=_YleJFLcT2wxSgV-J2oA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150170
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



On 5/14/2025 5:21 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 04:52:30PM -0700, Jessica Zhang wrote:
>> Add max_dsc_encoder_width to dpu_caps struct and max_linewidth to
>> dpu_pingpong_cfg for all chipsets within the HW catalog.
>>
>> Note: The max supported PINGPONG width was 4096 but increased to 5120
>> after DPU 6.x. In addition, DPU 8.x+ increases the max supported width
>> of PINGPONG_0 specifically to 8960.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 11 +++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 +++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  7 +++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  5 +++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  7 +++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 10 ++++++++++
> 
> This needs to be rebased on top of linux-next, otherwise you've missed
> dpu_9_1_sar2130p.h .

Ah yes, forgot to update my local working branch.

Thanks,

Jessica Zhang

> 


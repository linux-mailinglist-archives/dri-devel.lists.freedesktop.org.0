Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C38AB933E
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 02:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E824910E989;
	Fri, 16 May 2025 00:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhWIqLhA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC0810E989
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 00:39:10 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFLAx009277
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 00:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GlqhZcs+erk3iBh+80fphQbFA+uOB/LMqliG0REwbBc=; b=dhWIqLhAtjrxwtE2
 pPBq6XHxgW9JdIiD1TWG0LkoytjCi2O4joojeUGxcMzCW5YfWAuWuxlidB3ZCaLE
 AtamsNgvWmIJtIGm/SOEQCWpX8F88vPLs0yNxK1Bw2HZ+R380ZJbvqlNaY+OPOaY
 Np1gumqPX7sYhMznsiZuKrxFvWQafOFTY3/c78erAGmsyRq3vIWz5j+WhOGIDdRn
 QdmKDxsWRK2OyxMTc8dtvvdFKbyBknu4TTxelCJD6tGR/pjk+juLUrHTtSmSHjYr
 ERK8JrINMKfa7rgA0SZASrpsiucWkln624roJfPHnhr4ZH1deH2OFTJGLX5mYi/2
 Z2nxIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex83cb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 00:39:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-22fafbbe51fso21504385ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 17:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747355949; x=1747960749;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GlqhZcs+erk3iBh+80fphQbFA+uOB/LMqliG0REwbBc=;
 b=KHzROJgEn7yn9MshSfUPPWUte/G55htEkVS6VMQjTRS8MdVFESTddbvGR0WvcmFiLO
 gpE46qAjA/VfNX0Tg2kCFDIeMF6SGOzn31YoruCKc84p3qlbKLz+5OijcYZWfeoO38pm
 El+AaQaWZiMPzzG/6P5h2cSTx7Q3S8lvzoJK/7T9SzObXmhK101lVrHNCQYvlGT2JS60
 2POILlOAGbOwJHyIDgfWGyvxuqvD1jERJzGw/3lVG3O3i0FuvS4zyPF93YD88dQrVD0R
 kPAgZsZv8grSNfPkfFkdwP+GquPLQKGZP6FxgDqhou0FeJkbT2uf/fBuA7BTQfRA6Yuh
 VlPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURY+DZWCw8sWhb15e5yChiDMaV00+SWLlHBQbfwjLzIbLE733AyQcuwyhT42wqTVX0Idcm4LiWrDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yznf8ldgDh7vTcKUNiEN7s8gxx9oOqJPPwt+ISPCmq9FgY/Ml18
 qBQRaFkFAlAGondOJNR2odVoKp6B77xLlruFnSWZpW58OJS1jGi3hQKlMBQnhII/vTTQI2WEv16
 jc5w6MwwF4wqRHRAcqA3UEbERAefKtJhhQqGewhnEKcwZyH7oIiU4Qcq7DKylBdMEqfUBO0M=
X-Gm-Gg: ASbGnctwB/N19lbwH4Pxi80Fb/HPdSyuK5TGYskjCyJHC0EpvsjH4k68mzDWDqvyy9T
 qv2joMfI9UbeaqNd206b5K2xTOMd+y3K9N7gXClhHnGJJ4U8Rk5RLN1XVn8nSOSzZbCjlt0PofL
 GiIf52mRgdZ+8Kff2JBLmhBXP76JqQCbi1eCgzxlHt6yc0LW4lBpCepKJGRsq49wm0z0NWLMsAp
 zHNuVby1w568uyzGNEXcKUet9BRSUnp3W/gRcUrZr5MmERDpwQVVJg1M0H35Q0a8rWxWE3Fb/eP
 oiCs2kDOTid6INQMhq4MunzkXRoWC4Q15faiifsqK8cNBeZKVBlQ5PS46lEfC7s4VYTZKg==
X-Received: by 2002:a17:903:f8d:b0:224:f12:3734 with SMTP id
 d9443c01a7336-231d43d36ffmr15463015ad.30.1747355948945; 
 Thu, 15 May 2025 17:39:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCIxa42I2fd9QBBq3jcy1OxAa7Gi6L2HevXKicZ0G0GjWZp48BnGCRKieCJE4fuG/o3RumIg==
X-Received: by 2002:a17:903:f8d:b0:224:f12:3734 with SMTP id
 d9443c01a7336-231d43d36ffmr15462825ad.30.1747355948541; 
 Thu, 15 May 2025 17:39:08 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231e069c592sm755765ad.100.2025.05.15.17.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 17:39:08 -0700 (PDT)
Message-ID: <24e419da-71f8-4b0d-9416-0fe4c63eed0f@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:39:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm/dpu: Check mode against PINGPONG or DSC max
 width
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
 <f2brfgvsnwqu5rudr32fkjx6qiuut2im546mjqrk2ouego4npx@g6avls6o7kws>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <f2brfgvsnwqu5rudr32fkjx6qiuut2im546mjqrk2ouego4npx@g6avls6o7kws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAwMyBTYWx0ZWRfXyqasNWsZooIN
 6rc2dSz01XuQZZZIDB0TodzFe+1lm8Rmje7OOQ72+iHqltGJo3jvBRekMhcInDRpfROE4rmN9IF
 +w+VAAQ0nrp7a8tFz8uwyOmtYto4elheDWTMJIW8E1lkAbKRgjwUTqFs1PMZzAFJ8LSTQjvpDeI
 ZfP4RsKSqGOx5H1V01sbm0MuFURJerREATnjrVVC+iNfKu6cSKNFOPmEvZ+4v17sami/xdDKX2h
 /2jPnDHpoQx5oLrz1qm7RQoyNzmbzFJsS5x1Dv+HIZK5w7DjweCuJEJrD+YtF//6DrFM+oD9fEJ
 zO1XgCKUoveYvQncTyQtx5l8c2PP0TsHQH8/Rmi0qPYY91y4t6mCDmF5f1FqrLu/yHm8js2dWap
 T2Jiufv7F3wrv6f0ckc84uehzAEJBQOCFwW6sADLbj33CQvUyjqB5JAjsg0HJAo+2QrGHyZh
X-Proofpoint-ORIG-GUID: 9rCGgmQWX4rQ0ERSI8yHuPh86AH_t2y3
X-Proofpoint-GUID: 9rCGgmQWX4rQ0ERSI8yHuPh86AH_t2y3
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=6826892d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=lZyNh1K7jJI6hNXvg3QA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_11,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160003
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



On 5/14/2025 5:28 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 04:52:31PM -0700, Jessica Zhang wrote:
>> Validate requested mode and topology based on the PINGPONG or DSC encoder
>> max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
>> off of PINGPONG or DSC encoder max width
> 
> Separate commit for num_lm, please.

Hi Dmitry,

Ack.

> 
>>
>> As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
>> for PINGPONG_0, there is some additional logic that needs to be added to
>> the resource manager to specifically try and reserve PINGPONG_0 for
>> modes that are greater than 5k.
>>
>> Since this is out of the scope of this series, add a helper that will
>> get the overall minimum PINGPONG max linewidth for a given chipset.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++++++++-----
>>   1 file changed, 39 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 0714936d8835..6131d071b051 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -723,6 +723,31 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
>>   	_dpu_crtc_complete_flip(crtc);
>>   }
>>   
>> +static int msm_display_get_max_pingpong_width(struct dpu_kms *dpu_kms)
>> +{
>> +	const struct dpu_pingpong_cfg *pingpong;
>> +	u32 max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;
>> +
>> +	/*
>> +	 * Find the smallest overall PINGPONG max_linewidth in the catalog since
>> +	 * max_linewidth can differ between PINGPONGs even within the same
>> +	 * chipset.
>> +	 *
>> +	 * Note: While, for DPU 8.x+, PINGPONG_0 can technically support up to
>> +	 * 8k resolutions, this requires reworking the RM to try to reserve
>> +	 * PINGPONG_0 for modes greater than 5k.
>> +	 *
>> +	 * Once this additional logic is implemented, we can drop this helper
>> +	 * and use the reserved PINGPONG's max_linewidth
>> +	 */
>> +	for (int i = 1; i < dpu_kms->catalog->pingpong_count; i++) {
>> +		pingpong = &dpu_kms->catalog->pingpong[i];
>> +		max_pingpong_width = min(max_pingpong_width, pingpong->max_linewidth);
>> +	}
> 
> Since we are skipping PINGPONG_0, wouldn't it be enough to return
> max_linewidth of PP_1 ?

I don't think we're skipping PINGPONG_0 here since `u32 
max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;` at 
the top of the function.

> 
> I think, it would be easier to follow .max_dsc_encoder_width and store
> .max_pingpong_linewidth in dpu_caps (and later add special
> .max_pp0_linewidth).

Ack. I think my only concern for this is that max_pp0_linewidth won't be 
set for all chipsets. But if you're fine with that I'll go ahead and 
make this change.

Thanks,

Jessica Zhang

> 
>> +
>> +	return max_pingpong_width;
>> +}
>> +
>>   static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>>   		struct drm_crtc_state *state)
>>   {
> 


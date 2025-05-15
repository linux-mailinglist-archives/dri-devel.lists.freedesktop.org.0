Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E908FAB8B6B
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 17:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F83810E901;
	Thu, 15 May 2025 15:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiXF5xpl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1B410E904
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:51:09 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFCrs007841
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bwVpEIqOsJer60fiNoaqHMYmRIZm7xE7Ct+1ZmlS3Vo=; b=GiXF5xpl7xptwRm4
 pF19Ie4+u9zfT3/0yx/lR+Plg5siSxVxCoZqPYLXYudzC6fan3bDGi21iMkiYH7m
 CDEprpPjdpkkKiMg99Bm6QH8BiCwvolrAl8J+TV8PWsvGY2XXjhXFshGDeFQaNMn
 sSkApNLLbWr3QUtpTLSawzouCafJktmVFIqgViNC9d+zt9gCzoBcJqkACr0AsNQ3
 iLJR8hBv8ydXUoDWnOsFX+C4g1c9VBahqhk2FTKVmPBWmg1MB+MGr1i0f5RIfnRb
 V1Vp/cIR2+okLCUOp2k+hA76l+/wZBfe1kDsmxYynkFYDx1JJVfPMPhuYBAaFJLv
 uTaI/Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpxq6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:51:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8aab0a94cso1402456d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 08:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747324268; x=1747929068;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bwVpEIqOsJer60fiNoaqHMYmRIZm7xE7Ct+1ZmlS3Vo=;
 b=bLfWbQX/3WN2STDm8GpdU3OYYGme++GYr8UVatQ973ICuPm7+vVAT8s8jbjEA9/Vx7
 2eMNoQ9paxN/tMNYqmYrR/Bz9QFc/q7lnRvnPr+3qaJof2UAHcPhSshk4DVUWKVQC9RH
 FiizHBQj7sDiDyqqWcgkCbMpstytcp31uCd2BaLWRAKJdFZ5YIiJKe5MSVi4+CF3sJKA
 eqCSoCsY4qGU12SrMM8Q7mVbjcNevCOOiPXHThyyroAHeePH1UQJ1LLTLHt0sfiKHpar
 2H9P6y2OwVgEwf9eyQqmkCytgArunRjfUmJZVepgqRxWDM7UdCW5EYyAQikETb+ldg6A
 Gx8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWCIYI1GnQWmDRxNfFdjFJHdPGLiCBwKfKcazsDR1H26UkyOa0Ox0SPP8XQ96esH/dVmx14ZeQQ+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcRa8+i68jfG9q0d4l7K4yvlrp1+V1lbUepzM4G+jOByPgh4DJ
 my+loonU/l0yDafQ9aKY7c0vbpt5eGuLee3M50wQksyQJMXHNv5CUlXLNLG8B6hFw6j0jnUyfnN
 +i32zszLPJ/xnj7hjYEG6XTrPX61wm+UXJsAhxlIyYGVBYj8OfpM8SWDoV3ppubwwRCtUTro=
X-Gm-Gg: ASbGncsPIYTqsixrrnTiyEPNOQE5DpkKxhQfrgN4H3TUGU4q7byDn60ZLae65pwNuKW
 xn4cbyvelgBOzA04WRZqmQj8RCF9np5GOHcG4mKleips1iyIeZtg3ArPkte7rdIQTUQ2uX8kfP5
 +pNdYWNmi5n9BET6CcH2h966IikM0iBEv2gzcWxYvBFoTXnsUMIRGwETTyU7GwgBWT67MXHxHtc
 W/ee3fLQ3UUbupBDCr+XHhR58mz6ff3FkyD6YpXExctDp8m9go53n4sHuJDGSeotjtwplU6EJy0
 C2nsBOI+EBCM9KYUw5r8OGX8UMcPKxtSWWMGry7mTTyiIR+SIChrM/VJTTu/Lj/4yw==
X-Received: by 2002:ad4:5aa3:0:b0:6f8:a978:d32 with SMTP id
 6a1803df08f44-6f8b08811b3mr1262656d6.5.1747324267827; 
 Thu, 15 May 2025 08:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuP636c4a4W/vTuDcHADRpcLgMarKC0rmzXDUBxsuM0NINQpQHYG/rJHp1KJPbZZsCqr9WEQ==
X-Received: by 2002:ad4:5aa3:0:b0:6f8:a978:d32 with SMTP id
 6a1803df08f44-6f8b08811b3mr1262376d6.5.1747324267436; 
 Thu, 15 May 2025 08:51:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d276592sm7839866b.73.2025.05.15.08.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 08:51:06 -0700 (PDT)
Message-ID: <d7cf919e-bded-45a1-a352-6b2e659d0197@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 10/15] drm/msm/a6xx: Simplify min_acc_len
 calculation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-10-09ecbc0a05ce@oss.qualcomm.com>
 <h55v7u3tcxyu6v5ltiahdih22fdu2odqv4f4ix4xbepb4msaus@m6n4ftyp5nd4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <h55v7u3tcxyu6v5ltiahdih22fdu2odqv4f4ix4xbepb4msaus@m6n4ftyp5nd4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _cLORVCiIezBoejan7_bWnAGhY3QsR8u
X-Proofpoint-ORIG-GUID: _cLORVCiIezBoejan7_bWnAGhY3QsR8u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NyBTYWx0ZWRfX+wf0BY4E8NdP
 IXBHUtlUdgHj2JiNeyYlWbtUDzC5cp0UF/A3itZsK/nAxwkmCBnHbQ4KOlbvyseBArieCQITecU
 ImrzNZHI4y/vw23EfHCNYq8gT/J/pHAvQDRhYLfodWMfsAPl8VgZdCk4kS94xVQP1cvaak0Wr3r
 y4B6OG6iN+UqiMC+zsAl/4ZFiQJAxXq1QCUe/9dzgFwuLfGGSY9d9dVsTwo7idtZ/B97BWKRGYg
 cOEN1MIZ/uzcwb7Fz4k/HVW0yp/nW0ehgWa5BtQLyAk+jltN0W9guk8pk+x8/zpyZpnq1+TrDLJ
 w2dr+S0tz7KbB4lOVcbGTKaqLlUWSrn6pKljfsICeF9lf6WPlXeF6HtFyT3IQ9noXkYkSaIGQvv
 3DlA+WQ1073LfkLVw8HlTxD4jgRbH1Aw6xkPO1w+kwknP4hL+c3XCW2VFEcABVgZh6rpcgb2
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=68260d6c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=zQN7QPYGGEOyCfchBhgA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150157
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

On 5/14/25 9:19 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:30PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> It's only necessary for some lower end parts.
>> Also rename it to min_acc_len_64b to denote that if set, the minimum
>> access length is 64 bits, 32b otherwise.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
>>  1 file changed, 6 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 5ee5f8dc90fe0d1647ce07b7dbcadc6ca2ecd416..fdc843c47c075a92ec8305217c355e4ccee876dc 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -592,14 +592,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  	if (IS_ERR(gpu->common_ubwc_cfg))
>>  		return -EINVAL;
>>  
>> -	gpu->ubwc_config.min_acc_len = 0;
>>  	gpu->ubwc_config.ubwc_swizzle = 0x6;
>>  	gpu->ubwc_config.macrotile_mode = 0;
>>  	gpu->ubwc_config.highest_bank_bit = 15;
> 
> It occurred to me that here (and in some previous patches) you stopped
> setting the field, but you didn't drop it from adreno_gpu.ubwc_config.
> Would you mind updating the patches in this way?
> 
> With that fixed:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I mean.. I could.. but I delete the whole thing couple patches later

Konrad

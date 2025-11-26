Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1AFC87EF2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 04:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9607010E4FD;
	Wed, 26 Nov 2025 03:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkUQofnj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzNbP7K3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2907E10E4FF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 03:21:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APGgHat3587283
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 03:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pUSij966+HRiUH0i/n3DzHvXFNJRC2P5sPL2WyUURiI=; b=kkUQofnjt5WDQGaa
 hDSbJQvYF9Hqo/CIzg89Tud5/GIlC9KofKQZ7Gt2X/gXx2UZTd9oyVaNTtAIP0YJ
 Xdxy8n08L+RKfkfloxLk0+pYhCkCHWGKkQDJlpG+mWPXAICTW0uypgZITDq1YVlc
 f5CUr6hHxny324cDx1Fg+QRxOY/Nwx7FTxNMOWd/CC90jLkb5Fvam220sffIikUq
 sGKfKqa/QTNACvyVTAaCgLEMe9u+WZlb26zEkXhvMY2U0gNqhfXEvuJ6y+a0hTKU
 f3RQUsdl5T6NzOkaFHEuECvVKjdujUkjql2Zve9A96FEsZtD7FZYZxy/qGxM/NNi
 8VC8CA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ang791emf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 03:21:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b9b9e8b0812so10732835a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 19:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764127264; x=1764732064;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pUSij966+HRiUH0i/n3DzHvXFNJRC2P5sPL2WyUURiI=;
 b=DzNbP7K3ZcJ9g3o6m3+U7EhI4CIXu12w78u3JJMjInniaGeLjBG/SuP/7R31RfDn7d
 VfnGPZA3c6z+vLhKfsARskThSGGFXylGswfNMzGHBXVk3zIXLejJebmBo3SjUpG4V6cf
 4+ZkcyqgLbhz0zRTDTRnvw3kNa9lxkhflMqiYKjsrl6UFXTOvzJARWW3JYIQsZTUF+sn
 RcMrCQlaiTs8G2fbJBxmxm611OneceRBiPjKecyMBVd4dciSh1dVpqEnXqZlUVkQKBU3
 ENK8EycGFLZmC1FcnPr7UplLoNjhgNlLVw1ByM4TGN4XnULw8Y1JDuSiqUsrduLj4EtB
 FvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764127264; x=1764732064;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pUSij966+HRiUH0i/n3DzHvXFNJRC2P5sPL2WyUURiI=;
 b=i4j6hhEB1y0L6ZmFXNn862hefR6hoDb0gfPhtiz9ud3AEjlAp8nVB6rixe3sXpxEtV
 clD/hGfaMqAZhqEYunPH2dLc3fIjd3BhuTGndbBM7pMoQuqR45cmdVhS7Hb4qAdgawSm
 wi4BoD7/4Zy+ZPHWYnZSL9skmmysraYi6ybpJx1g49jfCbLca5l2+HtI60QrcWAtXBQ6
 YXmnlPUhXeMcNjmr4Q4zGBILV4B7r8pP5Ls0pfGCL+C8/6AhiQ3vmGIm80PP1OaNPkDJ
 5+6abvFEjmSZGr1w18yAqI4JFTRxYZxSrHM0L1xbuNCkngsjhdZloC92rpYX0HRaP79Q
 UoZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW14K8mReSkr34ZC2Ofy40ofaiWZQ0IoABfcmqW5y6jITUOe4hisxyFxE12nvpic9JDIeGbZD1Jtr8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSEM09lvaT07VvWbGGIbZ6yy3R8ADUaPV1B0/xPWGTub9hVkAM
 J/bl9MQbvq9snxzIecLc8uosqnaGQEqrJEJaH7LqSl69CSGJvYXNebY8uQHykvy8G70RGDKFGac
 pHuS2Q9wVs/rSVLce1XzrL+7V433yP7bvg8n1hqB9A8nRad8NVvJjm7KrVX4aQUZT1/g27nE=
X-Gm-Gg: ASbGncuC20FaQh51/tleUSkNTAKr9SCAgS0n/iHAg21oT05EigvJzpa7HbJdpBDepGM
 tGYflu2t0RHMMbLOfqlMP2SGbsBt0mImQ0Q8hBlnVReJFkK/0goTm56+vRfTUVIzWuEeWH4PB+8
 2yqm7grwqFAR0oz9gCD/oFMZgKjl0Oi+AV56tFxHHDth3tk6EjEtrlU/s30OVQwCH0hVxcIlX9l
 J1mt/8zV/IJkcaLhggSbZ1j/al20Kn93siV14010F8Ad03e+MC76i14p+duS9CMYxccl0iqxKTD
 BpKDbsXiY1LAxq0hkNFpjpBqbbIygmA59gMMPL5ke0r+lTD5fE895fhc4OCGk21+dBykiAslRIC
 GC9JrT/T/E8j0SOxV7rvGFgBu3LuxzaSIhx+ZeIyFWKWdIWs5howJBiyfhvr99OmrT0d+1A==
X-Received: by 2002:a05:6a20:4311:b0:35b:ae01:a4cc with SMTP id
 adf61e73a8af0-3614eb27712mr21998844637.1.1764127263988; 
 Tue, 25 Nov 2025 19:21:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHY5GTmXB6LRIcB/8CKQbkXtSEMjcFcfmYhsgY/Tg9UhZJyBXxtYvylvK9lnxc5BwtLpd4OJQ==
X-Received: by 2002:a05:6a20:4311:b0:35b:ae01:a4cc with SMTP id
 adf61e73a8af0-3614eb27712mr21998793637.1.1764127263426; 
 Tue, 25 Nov 2025 19:21:03 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bd775ccabfdsm17447699a12.29.2025.11.25.19.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 19:21:03 -0800 (PST)
Message-ID: <48e5427b-a17f-42f6-9c04-ddba8f383d58@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:20:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/msm/dp: fix the intf_type of MST interfaces
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20251125-mdss_catalog-v4-1-df651fba2702@oss.qualcomm.com>
 <3cnujrkkcui34wg3jrfoezradc5itm2paw5mgkii2d2snlac2a@lerj4ldbvf4l>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <3cnujrkkcui34wg3jrfoezradc5itm2paw5mgkii2d2snlac2a@lerj4ldbvf4l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9Q3RyAu c=1 sm=1 tr=0 ts=69267220 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=aISMk_G62U0n0vxTSHQA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ulQYQlqkGWLnkW_KgUGKdtY_P7e7f6_b
X-Proofpoint-ORIG-GUID: ulQYQlqkGWLnkW_KgUGKdtY_P7e7f6_b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAyNCBTYWx0ZWRfX8EgS55GIa+fM
 dbDorQIH3PBDIYbWRikDCCl5t/tQZYO3RkYvtsdc0cB0Vs4d8aaxTEYItiFOGdHD4iyGoHR89cj
 /hLF23h+mi2yTJCmjIAA/0/EmAR7XV+1PX4E9B0fV2ZaPbqknBn8SOg71BbHso49PglcjLGOvoh
 pYSgdM3kE2BmYLGJRpubXPiTQvPNB3OahzLoGueCAVTOrOD+qT/h6IUIMbhoT8lVaBTPaxWDh5a
 v+SwcNG2XRnp1MNfDEVGjLMvkVZvqhIox9gbWotcxRNRhV56yWdmPXVkelR72eL2vL7FVzGaLu4
 KmfvL752515SuOdnKyJWi0GPkn2eSnFG83vaXWGbAtACq/by7NOaGh01ZNr4OfjRAyXnf2PsJXq
 BplKfwfUxqhHuy/x/kuVc8KuW/+jGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260024
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



On 11/26/2025 8:36 AM, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 04:22:12PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Interface type of MST interfaces is currently INTF_NONE. Update this to
>> INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
>> dpu_8_4_sa8775p.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>> This patch was split out from the MST V3 patch series:
>> https://lore.kernel.org/all/20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com/
>> ---
>> Changes in v4:
>> - Splite chagne out from the MST V3 series.
> 
> Why?
> 
I would like to send out some patches that are independent and have no 
dependencies on the overall series, to make maintenance and review 
easier. For example, in V3, patches 1, 29, 33, and 37. I mentioned this 
approach in the first patch of V3 before. Please let me know if this is 
appropriate. If not, I will stop immediately.

>> - Link to v3: https://lore.kernel.org/all/20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com/
>>
>> Changes in v3:
>> - Fix through the whole catalog
>> - Link to v2: https://lore.kernel.org/all/20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com/
>>
>> Changes in v2:
>> - Change the patch order in the series.
>> - Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com/
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
>>   3 files changed, 12 insertions(+), 12 deletions(-)
>>
>> @@ -363,15 +363,15 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>>   	}, {
>>   		.name = "intf_6", .id = INTF_6,
>>   		.base = 0x3A000, .len = 0x280,
>> -		.type = INTF_NONE,
>> +		.type = INTF_DP,
>>   		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>>   		.prog_fetch_lines_worst_case = 24,
>> -		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
>> -		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
>> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
>> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
> 
> This is a separate fix, it should be a separate patch.
> 
Got that, thanks..


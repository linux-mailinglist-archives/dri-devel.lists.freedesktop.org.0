Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC77ABAF15
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 11:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC11510E1BA;
	Sun, 18 May 2025 09:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0/g6Spg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E3610E1E3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:48:25 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I5wjfP002839
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xeOReUMI3Hxt03467caU2I9E
 n3IbDwST/lECenXzhQA=; b=X0/g6SpgQqhIg+wgpQurGGuX+B1uwWoypnY27hcY
 Y1MbNVyNZBBE7z84kQO32/lwWMR3x8t3FI+JtqWuYGmg3u+MaygDIiQ8xYn4l3QO
 gktAdp8JExjheKeUn4VsqN8hgkWhkxtJA9tCdjbMqSve3P7X6pikMyunlEY9usqY
 /SDsoqvJetWtcD0R08dTgL3VDYkjwzoolLyl/mvyIFA2KPh9WzlgxMTKhkf1SViN
 61kV6R6KdylosE1wLWLLkHnTQb7niqeKxYFUXhR2Ixa0zilpjfGVvKOfu9k+OqQ1
 wnww4x+uGTcjAG2/mHRsaLqkj+6lsnDd1WREOaofdUknPw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4stad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:48:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c7c30d8986so1092144485a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 02:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747561703; x=1748166503;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xeOReUMI3Hxt03467caU2I9En3IbDwST/lECenXzhQA=;
 b=G6Z0jDx1dWqI5ZXdIAXkhhnFcJQeLrj+cCH+CnBBteCtoHoWgP3cOurrul/GkRnuEy
 EbLu5n36WQ8GbY4Kc1Cd4FbeF8BJUKWl21EdUbXAm5dx37Tg/ZMogkrEvj+N9QY/taqI
 /6FtCfyoX5QGj1RuYUvp7fyZzHkfAdoYxYZpDx1iTbB3T4LWh48DptuSLcXVr6jf7ArD
 EuQB7FsmDHOJxVtAuVFYvgHJ3N0bAdwbtdCOF/ftI861o+DRL8N45+F6DsHdVRcuFM0h
 82Td1H86/UED8LpAfcggd5QKkQiXx7vxSz4WsvflIzio39uHiAenTJeICPK49CshpqlX
 KRiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUWoZMcTvWNLPSL2pUlCRWcKFylVn9iZKCP09cu8LkJK4QbxDcSODO6lA3A9ewlWRCWV98WVVIbo0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8u5ZRSNrWp9a8rME65BtMqCxI3boOwkmKx57a52Ffo7UZfSWG
 b8Rv/ij4YGLBP7RJmHwjj4uQGx2KwjjlEyjbOzTptiPtrpSrE+AJEzWL657bbJPnzgKvQRVH3n0
 fEIxK+oi/5ZFP+P18xwjud22TjCXK5HurY9ydH5FC1FA6FfJKGWYWzN0sH1uFbF2pvRqmhEA=
X-Gm-Gg: ASbGncvWKSBfRz8OoUk14qPKps+2Mt7G99Q1ddW7amvPdW80Boq/H+/ku2Gmu71czmC
 55bub0RYgAiP8pZd3UJIZf6iKVOe5ynL+BZL/X+TdiXp3zIVb8GyTrwNHq00TD3l1CM7EUB2826
 0ikPYToOW3AIFMofKA1r6bWkcFt63d7AsKQliSSR9OmoNq8UI1WRQz/4Y9Nk6uCSfog6Uuf7gDA
 JByZWxhSgr0nvxs/Q90VMifpll7xCzhjLAxPMzGdGu2Oc51h91YXHxuA1s4eKltF3f4E5nW8zLD
 omjhXbLxlqnyR5zlPgUTH6fETc9K3z5dqY5FxCXeq9yx8d8OjFYZGEH2ruxkwvCVuxHw94BlP7o
 =
X-Received: by 2002:a05:620a:19a7:b0:7cc:fddb:74d9 with SMTP id
 af79cd13be357-7cd47f1f04emr1103060285a.22.1747561703388; 
 Sun, 18 May 2025 02:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhxYxoAbPZWvahXZRqd8LNtg4r08bn/rUDslpr+bykQGwOpoo53NY0+RqXYiJ6KdhKIbXOig==
X-Received: by 2002:a05:620a:19a7:b0:7cc:fddb:74d9 with SMTP id
 af79cd13be357-7cd47f1f04emr1103057685a.22.1747561703046; 
 Sun, 18 May 2025 02:48:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e7017eb3sm1344694e87.119.2025.05.18.02.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:48:22 -0700 (PDT)
Date: Sun, 18 May 2025 12:48:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 08/14] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
Message-ID: <ubugepmnr66od42jux65ffegreksmfxmfzkjcjred32htkzoch@h2pfezdxan4c>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-8-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-8-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=6829ace8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=OT4qMnZDQSWkCWZbIpoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 7eig3kRJZpsCGJy1BXfE_Cu3QKaUQpkB
X-Proofpoint-GUID: 7eig3kRJZpsCGJy1BXfE_Cu3QKaUQpkB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MSBTYWx0ZWRfXwyM6CRF8hGaY
 KPw57R7//e+BijaEL8hhe2bA5ifSj+r3A1QnWcpBfZD5yJDFAK6eFPH+jDGWtsB/nJgah1/Urk7
 +giXGE67Z4TivpKiXnbfF7FisFnvo76xJyoJNdrErt6//A32g/WCrU695DUIMG8uRs8dE0eoARI
 Vo8qV1+KvcM+2Fppr2Ofbut3i9RgEdzVTT31auhrNr1hrhaWv0I1stZKhiYNiblBs5toJlQjDBj
 W7RHBTYOZ4eEkpGY9fcOSxu5GZs84wbkASEWYgjUN9Ni/TyMSaalBjvSPDm9w0KnTP7u4pj+BcZ
 lduXdEsQXJnDuD3c09HLISQIXeQO4AJcqI/TFXbEM9L+9+EwXfGZvIpOVIWjVFCTmcgSCun0n/b
 tJ0awl4+MCmFfFIeaVTJktUcR70OT0UYoFJ+S8u7rqEP0txalTT5UO0HAuuCLJEhOCQkETAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180091
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

On Sat, May 17, 2025 at 07:32:42PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> ubwc_swizzle is a bitmask. Check for a bit to make it more obvious.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 154346591365f3f89d467674952abb2f067e7ce3..a20b57e964d31adb22f0b79a5178b45f0f5ec5d5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -668,12 +668,12 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  	 */
>  	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>  	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));

Nit: UBWC_SWIZZLE_ENABLE_LVL2 ?


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
>  	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
>  	u8 uavflagprd_inv = 0;
>  	u32 hbb_hi = hbb >> 2;
>  	u32 hbb_lo = hbb & 3;
> -	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>  
>  	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
>  		uavflagprd_inv = 2;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7066AB758B
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 21:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130AA10E6F9;
	Wed, 14 May 2025 19:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D04WyHYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42D010E6F9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:15:29 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvNs002539
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=toamc2daXxgjaeXdZ8/hVu4d
 twjcBOGn9eztJcSpD8s=; b=D04WyHYH6rOt2gr9pdDx2ne+EyzhnnIrz2RhMmNR
 HWgLozm4McqxnMD+QFxHQmyCmrsa72oMwPPd7FBSluNW2fbYpsHanPNE1eEEdfmS
 dWWIpM4fnGewdI1lwwylUJ6rIVjJSIu8qu/ZoALlu7bT82UqS2SK64AMgqXu0aje
 lcj6rQnpuq5tK/4LDaBhYkQ1g27iX3yvifSV+SMq73d3ci7qWrklmybHCB9XGZrG
 AqrS0GlTl7PGr7+QGLbkNtLupZFiXkGw9LPkoPLu6j2z8Ow6wLxSS8KRHwR30MSe
 4Hgngi0vpQVHG7PCB2zL1X276gCzSZC6S44q+FQyWV9IWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex3tnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:15:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7cabd21579eso12318985a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250128; x=1747854928;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=toamc2daXxgjaeXdZ8/hVu4dtwjcBOGn9eztJcSpD8s=;
 b=dmjz3cDoPLzLD2Bk4i5ecx/tMIjAJ0k7LQRqFz4tbEhjCFGWdpbyO7oBHeqY8E/Wqk
 IOhJDAHuJu/CcS88GOrqO/prapQ1n6XH6cV5mMAboq16v0h/rVlaiUdq4aHBsWFm+NZ6
 nbta06Z9sq+bWv3u91EUsmUqIylKcfpCajRI9GsRsPvrFCwz+SL4yxja4tCslaAPU8CQ
 2wdztCZpt2mlkpXttrR47P/UqKdo0ApuydoL+FbWcstkBtWPy63KQ9WxdUDdSFbDTcO3
 inZdmIMucJfgmQnShOlUIRKKA9rfrnXqniCZc7YcFPyK8Ag5vHGXq9dea7eIG4pGJnod
 PkGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiT2rZKnzuWUX6iepaXO+wsm3BkNvpqVN3o2zZtDCk16Zxtc4ioJOpe1n5ZaBNb0Nmhgd+Dd84Fq4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yycc42Jh1nofSlpIZvl2DSZ1Yq7qTw5RKsOqX+xTP5MGNu3Yo37
 q+/xBkLIp1Ba4HgWQc4EaF83gxOVOQxpVJSmo4bfvC++5MvA3/f014/ynjQFNzJxBqdEnAvc3eb
 NLheybPy/VkKuJePGdqsOAvlYQFA9M37BgFXiCOMtJzdRkmFPqMdQHERqNeK6f1qY+7U=
X-Gm-Gg: ASbGncvfZv+hxQqIpQAWeMECSi4kmIV5+0dD4IWdFSidQI/AjMTe/2LLa7lDkt8cKbP
 UimWEDNgdmkpG1A3kJlVw7QKbmlCO8dmxY2YHkHnjl5m2/zPWf71ZQO0eg/09cf0nn8gsyJHwhn
 pC+lVT6hGyZ5vRsWEF0QLZET4WqWbbPTkMN/lPIpwLTHnVUmT1cDHN/1ADCG2e6YECquK5enBCQ
 YBRgWwHd8OjZgjxvCL62C5VDI73T415oIiETyy/ak0geUalLSTNHGT5xUd/DshsOqwjjb9V7I6S
 oKCOnoWCAju8fnIEIB6xuhMG3qzwhNQeMqtjfB+ydBMPtJbm3qW0rFZc/uvKfwGhsMA7H3SEO8I
 =
X-Received: by 2002:a05:620a:f0b:b0:7cc:c07d:e3d4 with SMTP id
 af79cd13be357-7cd288557b9mr577861085a.35.1747250127856; 
 Wed, 14 May 2025 12:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAmx0iWZKMm9tkE65sUZ+0KOPm2/eiRcewpi4kWrjcOrS5/n92vEonleB4k+OU4sB6qDStmg==
X-Received: by 2002:a05:620a:f0b:b0:7cc:c07d:e3d4 with SMTP id
 af79cd13be357-7cd288557b9mr577857285a.35.1747250127440; 
 Wed, 14 May 2025 12:15:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c33b7c1bsm20552461fa.35.2025.05.14.12.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:15:26 -0700 (PDT)
Date: Wed, 14 May 2025 22:15:25 +0300
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
Subject: Re: [PATCH RFT v2 08/15] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
Message-ID: <vnjkfbxyfpeb5nbu6nnasdcbkiviefi7hu7qtpthz4uu6zwnnc@2u6e5j22ozvx>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-8-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-8-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfX0UQ/HdVlDFJn
 SVPrFJHMhcB2944eTf3dPyHKX0XzpjtL6Cd9l8dFVVeWFlpKWhxb0YpQ+pwIw8oyLCYPGVJ8qza
 WClQaPsiOvXTyANPQTxX1qKH6NrX6R3q0CB2zQ1mY4QPCiYSaStdhWz5CEYS0Q32YYr16uDuem2
 DdmAM8D2IbLVXQu6+QTCojtLuu2b5Y5ZEYIi66qMIVLTHqfawUz/hr8vKha88us23CFOy+o9nQT
 i3k2tHqXFz666k/CjNdeK6AZ0wOaROVgfzI9fYQrmHpDGbul4S6Hg88WC9sDROpAOADaoPnVSbt
 Ta8RTbEoubM/pVgkLbzwsntinAjheikinzAy6ZRdvsZZYyLCgcRvQHpPG9Jj75qmo8C7zKPY3ua
 PBR3nTh2xPS6hPd3tN0dsbhI3y38tnAitnkkSgQEOq49PViROdU48upw34voHjDgxamVAFiW
X-Proofpoint-ORIG-GUID: IrhsBWeMNKBVdccNFQ0olxZGJSMJopNn
X-Proofpoint-GUID: IrhsBWeMNKBVdccNFQ0olxZGJSMJopNn
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=6824ebd1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=0v1qzFne9LvPmFAOVWMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=813 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140175
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

On Wed, May 14, 2025 at 05:10:28PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> ubwc_swizzle is a bitmask. Check for a bit to make it more obvious.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

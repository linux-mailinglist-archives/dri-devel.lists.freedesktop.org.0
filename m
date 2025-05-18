Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD513ABAF2A
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 11:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B4210E273;
	Sun, 18 May 2025 09:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2tPW4JL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CF510E273
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:58:05 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I4qoXk026096
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gT+4GMAdIcHZx7zz1ZKYcaAm
 iPe1Cu+OKG7s22TPW8w=; b=i2tPW4JLvJ5hIuvroOV6KoP+4P1hb/Kz/hcuDHwc
 qYMXkEDUeGjeQ4sM4hmp9/jn816r/Cm+ysNRlafQi36HUE7uD5x8KBV9yaQvYlbG
 3paaIYVP4qwfJPwluXrgXu90X32j4gzQM5uOM9ilyt1QHHNpx69oBDScF0V5NiUg
 Q2d4DeX4i9OR01Sh+v7UCZUKAOVwu+qSwfaItOh1KUX+Xe00QjEJjaXlwMKlUjEC
 nBjgNkkCE+Hv90nNYOVHCrFtB9bqbRtqLeTBNeEZaeurY9O02/RZCg2ALxf3KlJq
 uKywxubi/IAqNGD2l637Dd0+v7kNiGDCY8nKrp4lKV8tFA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9srr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:58:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8c0a83f9cso33634326d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 02:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747562283; x=1748167083;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gT+4GMAdIcHZx7zz1ZKYcaAmiPe1Cu+OKG7s22TPW8w=;
 b=fuG8NMz0E5rbCvHQlC/+fl9qvH4lCYnTATzcYveWnhTQm6FH8WW5iDpzo5FgVQkDxh
 NpCP714775fAGSL1ahQvnlRxHw1SEDD+rYmDon2QpkC9ieh8TAu3XAJGZpoSrKCNlvMH
 789urnN+KWu//SwnkSIACU+VCZlPrlkr94E0lIX/58/w/icTtM6l4CsxGvSXp3Hh2C3v
 BwWwMgq4mIribSbyJGJg3veUOJZTLIPBzz6Jr55ww3AGr5FAWEEZOdpQB5CS3k2dYdMv
 VNV0QvkFHgOFQFIyz/03+I6h87itYgmc9ZSuMyWI4CRQlPkfwb/qS1ak6M09/Mv2grDa
 DJow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdOXfvm7S9/Bg3dz3H3qgtTqqG7635zsfnQkjOcCMIu8FTz5AuqHJ5BXhu5ex7kywu/mqiptMOJe8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYvmeJn8gaQ9T7h2InnNstk6A+uuhDp1szQ6PBjoZWjc4NK8dX
 YNGRq0ahYhYjuotkiEAOkSMb68KmvuUCkwl3Rkpt8C9I4bbsftyCCZSaTVtejytEuZyKGJVDWCY
 4nMoO9gNwFIe69TJZPKS5aWhdFvALPBc07BiZ9n/urfeJiygynqHqZvXLnnHjIVD0lG6/iIM=
X-Gm-Gg: ASbGnctIWM4Ot5YEkQ/RUjLCN+RYZpsGFggxia0CY3LOGXgLfuwylnnIPl0CoK1JYsO
 HMzLHiC26w5xi/CYaaHtJsAhZDYsA736so50AOX9m6FkniP/CCPI3qeAFOgf1rk3oB/Vz7PEqzt
 F8sjTMxBrjtJLLy7TlNJOia8Iymw+6zpSaK9bn5/bpBGj1ey5bmR/yPPdRJeLRmOuXrxoZ9shLU
 Evdh9/x3vptSCxFpKSC4joaQkzp9pil5QfJddN3JhpJo61MG7os8nBMtmov3xMaem5ge1c/X+kV
 mBnB06yXx4cZTNEXC25wjsv2FfAVMivgyNJjaXahf+XNGu2NtoIwwAzcmYq+ANXOgrNrMxnQ7wU
 =
X-Received: by 2002:a05:6214:1244:b0:6e8:fde9:5d07 with SMTP id
 6a1803df08f44-6f8b2d43931mr131431286d6.26.1747562283618; 
 Sun, 18 May 2025 02:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXOR6vgmS6GPiW625UI3++wlwyBg0bFxpLkN+zyktFFittJClz/BbivAaprb8YwW0sMhFTKw==
X-Received: by 2002:a05:6214:1244:b0:6e8:fde9:5d07 with SMTP id
 6a1803df08f44-6f8b2d43931mr131431096d6.26.1747562283284; 
 Sun, 18 May 2025 02:58:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cf976sm14124621fa.103.2025.05.18.02.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:58:02 -0700 (PDT)
Date: Sun, 18 May 2025 12:58:00 +0300
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
Subject: Re: [PATCH RFT v3 11/14] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
Message-ID: <lkzvk5vqxy3oe4f67tg5hirmqarfcq6xibljhtspvufuebxbna@k36dw3km25qa>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-11-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-11-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-GUID: yRAG-JPOT4xAfaA7k1V7J4F9BGv1x3av
X-Proofpoint-ORIG-GUID: yRAG-JPOT4xAfaA7k1V7J4F9BGv1x3av
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=6829af2c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=lyADY8evpk1XTh_PsdgA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MyBTYWx0ZWRfX9YzATQ1XWz9K
 xWFp/bkoZGeiEH483GqwLf2mnWR+ZlVcopJKDj7CMfyOG54Zihu3UOMwnQJIVKbT7UT0f2pyCuA
 sFz2WMPGVgDMSbl5KB3WptG040/L9adw8wqDOo2xAjQjRUYVDHaxfE+Oxktq/IJAtkjt3YxVyDn
 8FhD0Sg4gXjDR51Rj9JMmt0g3135oDgrznCMluC5rzfSOmIUGkq8g6rGJW3jOjRhTalbjxedkEq
 AsKwPs/tcAWKpQ+oyqBqsZDeceK71n1sX/W0iSRbQE864H3FcmADn/sJ30mswk5AswBo5AGa9Vl
 Rifv9Q4IKcAuJ9GklAUbKNlHEE3+rKGdvCUSwP6ZZWcEBch+b3jhDXizWifAGUYIs6iZ0fuUyRD
 0llPAGZJi4UxEjkroXKVlZy6d1SsZ7pOwKWbDTkfK/7msPB4/m9aaCq9q8hpfp4VmqLDBdu2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=982 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180093
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

On Sat, May 17, 2025 at 07:32:45PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
> swizzling) is what we want on this platform (and others with a UBWC
> 1.0 encoder).
> 
> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
> bits, as they weren't consumed on this platform).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

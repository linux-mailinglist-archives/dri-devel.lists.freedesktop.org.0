Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE97CB267D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 09:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F7410E6C4;
	Wed, 10 Dec 2025 08:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jMKxYa0b";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K6oDTmp3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A3E10E6B7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 08:29:08 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BA6DnYW1243520
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 08:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LQ6U8pxK0994QNAVNbIVYwcO
 SDd35n5YdbkWgIRVSjo=; b=jMKxYa0bus/38+fd9gLXBkmvpqqWPH0+JTEgNDLC
 jwS4uaREm9WzGYpfvDGToH2dPj+g8/UI9Ifx3Y0MPGhKRlO7g1QYsqutQcRafoO3
 Npsr03imjQqOUpit7zLTVgM6CIBh04wgQ2Tz1IE1gtEzD5G5z0oIPlh38C8WiokS
 uZGE2mK1kvH99ya07vc5QTge0CHf55mWHNs1gy9jrH1kx54LztMDmDIiM42ulbdJ
 iL8dRfcu79rzthOh1o6dwTLQJG2zIJnWBzvohqQV/Y8pKv6ntSe32qo8u2EePh/w
 jwchKbFB1MZlSfSAOPkKEDKJm1Pi0vB6r0j6xGZZItAZ3w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp4vu36a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 08:29:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4edad69b4e8so12154721cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 00:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765355347; x=1765960147;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LQ6U8pxK0994QNAVNbIVYwcOSDd35n5YdbkWgIRVSjo=;
 b=K6oDTmp3rTeWecn306GgfS2CPBo1xrzCHw1G1iaMqht88a/kkBpsHC27MX+gDhxBsj
 BeiIUMKWridOBGr0164/oCP6gPcJQpu+jlZsAskQIzINxm9xRhEWg5dRlFlD1A3EJrIs
 7o61m3gdEw3iJWqYhJbgJzh/tXauox7V7muCIH4JMTBZeHGKZyPX15dX/arT4EaP1wrS
 XHuSwhDrF/YXyLDMuCMz15CsMk3sv4FrttyqHPHVI3UwftOdnxxLMvbI5Q01D3KJTZih
 ttvO2GUfqmH5ahXrtEFa5d6hjVnEsWAoBt9tBU/VCg0BPQEADVop3QLMIFvd0BjbBVQh
 xYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765355347; x=1765960147;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LQ6U8pxK0994QNAVNbIVYwcOSDd35n5YdbkWgIRVSjo=;
 b=MZO+Hw4vZ+tYAtzO2JN1GP7IIcAxfZNs0RHombO3vUuZRiF3cEuXjWPED1sJunJE9E
 IXxuOgiv0glrmNMnjPkl3l6iooer1tGU/xfyZhOjgb65wSz3JjEjXP/cx/SYbyMwxt2Q
 3c3TAjii5CUWJZJteHFrTPQsKwskuqCppXOvx0rqG2vzMqtIIaOtEqZ6L4aMhZ6sInSW
 KZFKHAPAcLBOwUOw0sqNcnzutCN+c3HhXQr66RJLpfzM7EYFxINMSENYbHrn0VmrWWIU
 QZjA8lK0vELIBhnlSBaRYljk9oKLzL6RVIs4QVJMuoKsDhuZteIB3urUGHs62FzCse9C
 X0Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8+oB5dEt7Zh47AO3UihI5QM8hiyxim6dcdkiTZjZ5UJSJhEpJKVFICQcnxMTRLkb8OIR/8kkAT4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwLO1niHyfVyJfAkkmqNcW8GXzq4ZeXWFQtar/lgQ50YQboAST
 V7HcpQUpbnQ9HKaHsY85a16+A8EZZE+7AjCE+H3xWXoy0MlkXyxIXWGFsOLiGPa1rdYO/23vC9w
 mKsenIMHFBCzNqy3xcqlh2x4O7ONmfHt8a/B41KXrDUoFlCJq9aN+PvJs60Oo4jXUyu4CNpw=
X-Gm-Gg: ASbGncsj1cD5vERqCcLe6n+Ohb+FHa6KnvVMQJvthUAq2eAX9BnfWFzcNBtIMuxNSzl
 PW2jWuXpbcwUE+7ni+hLfJM2JkyejLg0GO95Lcb6xLJXYjuFuNj6fLfeXurt4LUqP08y+0AtBWa
 xRgxCK7AE6HTtE3jCZPscPeLJ6wA0NHD0oj06dvZ7DIZzvIf+++t7GHAfmRKwGapqr8sl623EbV
 ZPeetPLfCe+6kR7k7nnOmANj2LHYXrhyJqdvlArGOpOdHfK9x7nZf8tUS8+/zbSKHdiuTpQVGgu
 GaHKRgUhq/WPJehHfFdtmZwth8cxyN/l9mSBWqY6yDxZcrdv/b9zr+F3R2tfY+Brw+WEeTnL5Q8
 zHgUSV08tuVbVLJvoVcJ0iemAhTLSGT6NzECuZOqnkSph0oVBDzrT4CB0SevxULvY2V77XS1JeL
 8HKADepfdMQiEAl9+zVpa/c3w=
X-Received: by 2002:a05:622a:146:b0:4ed:9264:30fa with SMTP id
 d75a77b69052e-4f1a9b5345emr61274151cf.31.1765355346835; 
 Wed, 10 Dec 2025 00:29:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5yN2+4yMhNVOKdG3urL+Lh/0KSj3dcRe9MDeVCagD75jX9QBzox9VjYfSqdlDnHahOyqOGA==
X-Received: by 2002:a05:622a:146:b0:4ed:9264:30fa with SMTP id
 d75a77b69052e-4f1a9b5345emr61273781cf.31.1765355346374; 
 Wed, 10 Dec 2025 00:29:06 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7c1e32esm6151019e87.53.2025.12.10.00.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 00:29:05 -0800 (PST)
Date: Wed, 10 Dec 2025 10:29:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicinc.com, quic_amitsi@quicinc.com
Subject: Re: [PATCH v2 1/3] drm/msm/dp: Update msm_dp_controller IDs for
 sa8775p
Message-ID: <sfnfn3vctmhuks3wjco2f4y5vcfon3fn3pprcwgz7umpx6jt3t@dlps76vcmybc>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-2-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125105622.1755651-2-quic_mkuntuma@quicinc.com>
X-Proofpoint-GUID: nXfBcwdhz2Bq8kx9NWDQxBDOWMdlnIc4
X-Proofpoint-ORIG-GUID: nXfBcwdhz2Bq8kx9NWDQxBDOWMdlnIc4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA3MiBTYWx0ZWRfXyW8Dv6GWgP0i
 EK/KtHkId/g2tCboanBYOIqZRkPpjeNRhsLMM3kESyJ3oSoO6+2tAD2Shha4x+y5UPkjxmS6xVf
 GzYeEyY/yddaVFxw2tHiT8+gChuS9z5CnKOwa9+3HKxVKyatucooz39qqZUaKslDS6Fw3LShGOi
 IR8N0SBS7mC7x+//GheHV5pY8rS7v5v3sds8KZWW7tlrRPVZMWkx9t5AbNxEo4OiPaSvuURJUpf
 713gOzF3oIYDGusEmLeHbM4dOQqfNGcS9ecmtkPnFFi6EE7fjYwcYglyHlchdzkkzDLdwJyuYkM
 1j1+h5IQMVLeHwHaoqHZpLfiGfnIbjxFSV0wpgbjrhs1GPpClqI0t+w2LoDBY4odSNnryT+Aahz
 LIz2C4KDqdXIjJAiGVbkhU5j8rkpxA==
X-Authority-Analysis: v=2.4 cv=IoYTsb/g c=1 sm=1 tr=0 ts=69392f53 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=m0UsThpCaeJMxhqdgYYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100072
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

On Tue, Nov 25, 2025 at 04:26:20PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.
> 
> Fixes: dcb380d19e58 ("drm/msm/dp: Add DisplayPort controller for SA8775P")
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

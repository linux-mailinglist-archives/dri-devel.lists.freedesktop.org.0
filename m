Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EBFA8371F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 05:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A36610E07C;
	Thu, 10 Apr 2025 03:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l26YO7Hp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B7310E357
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 03:17:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HIZ2Z032297
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 03:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=J4vapM77cSti5bfb1sVRmOKt
 P/l43U94DBDBHARRk/k=; b=l26YO7Hp/3Xnqpfqk6OCkoMckC02cfXwFLi56OcQ
 oIbKH6lg5s7IRst/ta7+Y/qvR/VjbEt1I23DEQ1bibVKVXnETTmTEGpwacD81IOV
 94JHGUAJEXPH8mfAfwgVA0E/yH/IrUBuEPSGgpQ1DjREata1lCt/Ouzi7bYheY3I
 cDFAPvDb9hRVGm3auHE35IIlQNxCPq68H2XI9ph3KECz6wLkA3BaM6DHQ5mCUysI
 G29vtDGdPja88UCsmWKLpgTY72RD1oa/TAotrDj9rYat3nMfnSuh8cDlaMAgHdCN
 tHPteiluv949GYg36J/XpNh86ZxVbELTyXou/LQrJcgHvw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbedh1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 03:17:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c09f73873fso61864185a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 20:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744255071; x=1744859871;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4vapM77cSti5bfb1sVRmOKtP/l43U94DBDBHARRk/k=;
 b=bhbGz1bfJ77kM+BIiQo6X+k/QJ+i0uucmH+MC8x5aHa6w+bR6gkPiCj/4IcFKZdQNx
 uruE+LeNBFxqfUY+EyCsHkZxkIXohxeL0eXowjulUWOTfWTfQH6YWJIg33nv42hIiO4j
 5XToFueR1f6MUCiI6hV5sFBl+siWcJY6k3RTPii+xOuS8+6lA9tjtgfgUTiPFtE+1XGY
 U+ltxO1hzaMlAXP+LPF7nG5DOS5mcVXV/1wEevXJ8QMqIdwHCI6wb3sKlfphecBe1UdM
 Nyi4+WD1nPWiKE1jXJXrmnzEpIHO3FrL2uMPsvSNsqM9wC5+7e38bbkD3JKgWeSRLj4S
 q87w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlV+65K8L061FMxpqcNMQDhvJ6/Lf4r70SxCYzG79+jerxnf9o532Dpb1PajXZfjD0gB7msnQ6tVA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNbzlAod1CENsO/f0huyJq4iCvbRx2tpxi3u4OIzpnHuVOGn10
 Wzhq6NMoGD93UwvLUmqW0gNBKK7w5hoeoIKe/JoFZBybo8gt7BuxYnCSOvoJroLD3HJy/U+Jh+6
 y6hzLTqIHNwq6BSSyBJGFq4v2xrbf6mihnJALHMJwU0jku8+nOGLNviYWp56f6wtdRx4=
X-Gm-Gg: ASbGncsTYcQuCEZ+w7TIDf5ZboERkUyz6hh7QJ7tXlpBjvSBCOP5o531tvq0WA1y2IV
 bdGMso4L2zpLMbt5QxqAfN/DTnGAEwtIJBGCoew50FutYqO1ig8ziNY5Ky+vn4bB2MTrLNv+fNq
 B5PvyA8x4qoWEAKxd5EE6Difq4QCG2qFoX7ivsHkT2fYr5dfTYgBiq63pkbZnEaX7lXWBOXRONU
 0JGKI9pU4bU6Nt9NB/AYVY1EXGRHqA1gcXa7y2dCdcpDcZDylHZQT0MS2RKZdLDJOhANpsKI7Pq
 sRwuIj2yNK/zSKSk0wYcE6dxj56ZQJ0YQ3kWOHdw/h98ldB0yOHIvZZN6GXxEvs5Q9alYkQmies
 =
X-Received: by 2002:a05:620a:4307:b0:7c7:a184:7cb1 with SMTP id
 af79cd13be357-7c7a76541abmr188374085a.9.1744255070786; 
 Wed, 09 Apr 2025 20:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGzzjX1o0TcqEOTY7eZvvnApnC9rSYSkmrMBaCu6EkLc3SNpzaEh88pityD5H16hgadZkgng==
X-Received: by 2002:a05:620a:4307:b0:7c7:a184:7cb1 with SMTP id
 af79cd13be357-7c7a76541abmr188370785a.9.1744255070482; 
 Wed, 09 Apr 2025 20:17:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d50265fsm26992e87.138.2025.04.09.20.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 20:17:49 -0700 (PDT)
Date: Thu, 10 Apr 2025 06:17:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
 quic_abhinavk@quicinc.com, lumag@kernel.org,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Convert comma to semicolon
Message-ID: <zuypdi4r67sljda4hugqm2armuvole4hz67rexbu27rrda2mu6@dapzcs34peao>
References: <20250410025221.3358387-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410025221.3358387-1-nichen@iscas.ac.cn>
X-Proofpoint-GUID: gewTrJ0ccIxG_xP3M31q0fIs9_4WBm3i
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f73860 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=sNhlO-HqowW9r6Pg40gA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: gewTrJ0ccIxG_xP3M31q0fIs9_4WBm3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=840 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100022
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

On Thu, Apr 10, 2025 at 10:52:21AM +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/msm/msm_ringbuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9307CB348AC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 19:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021A010E130;
	Mon, 25 Aug 2025 17:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tt3DgFih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2B510E130
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:30:30 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGBZmn025970
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=neFHy6pBsQ6WKu78LyU0YORv
 KojYkODY55mUj+tWBZo=; b=Tt3DgFihIWZWpb8M2OycE6c3K9q+17l8lBS2LmWB
 LjYJf25JSmO0wFd9sSymNJRegve8fnxCBe4K8ixVPASR9chvfzHmI8aAg+zjzWhc
 8S22LMYfj9W8ptiA4ZQ8pjkU677sc8ibmJ+XtUAseTTuSAs8crDeMq0rixCww7gG
 KdtULlz8rvKFV4ywGPmZvoCwRoKZZlHooJgladeUP9R9ulnpC87wjBXHMMsoJoZj
 0Q3Pmc6EKeSCgTduueV38xX8h91PC6eC891+vHNGc5Ts5p5CGjkHGkLigdRgc3uy
 vESihqsZM889I8qmIC/Rdvzy7/+re5fUc0JQOFn18LpEoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unnuvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:30:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109bc103bso106599401cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756143022; x=1756747822;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=neFHy6pBsQ6WKu78LyU0YORvKojYkODY55mUj+tWBZo=;
 b=sf0OTN9VkiZkLTFIe43WsaohzRBBTEE94BXlbGzO9QJLXJ+M+HpWkFizZtF6fm20KJ
 rYCfyEjSzF422oQacYeXKQHps/ckfaifpMJx77YoIWH5Wrc3cSI4P5r74iJAAaxWUhfq
 03JAQ8NuETyKjDerNnmi/8dbZUfqZ/IcUaJhuu/OvZDeFSNixcoO8p2Qr5fvcrFZFjA4
 JgOlVkt/I4BM4qtfK1r0DmB0OG4r7vWvbkaqp8WAUruyEMs89gYFhPwH7LEtsLXKDn9K
 B5kbmhW3fO3Cx3Owk+4eszfcZjneZdyo9D5QrvEyQP9wlahRbza7wQPz5c4CcLPRYhmp
 UqAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUazasaNy0bqpQ7ZsZjtiyq2jGl2/e7B37sQmTJZwJhKoqKU7DGKjeoiy+00GnXdUPiYdzEHeUmrTE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3FaRM6XhBerk8UZOYE9Cd8tdVpw/vG/N9rIPz+adzj7v9qsQy
 HKEgeMfoNptI52GmGk9PBnab5jPlG3Yyg+XH0knQkRU9btdAKmNqNnMzKFRjZdXVChywf94QoYZ
 StfJQPAYFf7JHVL9o9VCfM0WULTcbk36aQxRXxzO0D07TIO5nPtsAuZM1uT4OMXNToFv7ADg=
X-Gm-Gg: ASbGncu/xDFDRKA3KCEIx0YLcSF0GooUx6BG0F6uvuyNbl44V41sEiB+qbCSlJiWJTu
 mVo0qLpGBzUDShjXlKzs6j1pR7soSEhKjQS08kmnWXYxJKuAqOZRZ2kkwNh3IHifCXMfa4rYOdg
 li97r9qYDzIrLaXzMIhPLURWy+oKHMGkylHGnYoq/A8A56if3do/QALhtHj+xUIlOvXSRP8naHc
 ToPp6w9mZeo3ZdQ9KFJIhQ/SCUeRC0lV6vnpqcBoEUtWRTxkQR7mK9ka9IK89jdGob3aukHk+WR
 GKjY29tAHAKqf5SncA5k86lPW50rBkWGmQQxLMUudK6iopETB/2Rv44KdJqKKiq5rWaVKWN1G9T
 K3YCuCoHiypK4WrFyA5J/G3I05Y3MS8soQEmIZ4guiZR9oIGoAknB
X-Received: by 2002:a05:622a:2cc:b0:4b2:e13c:7fee with SMTP id
 d75a77b69052e-4b2e13c80ccmr3483251cf.17.1756143021905; 
 Mon, 25 Aug 2025 10:30:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELS/2d5+L9lLpB0VeTUT8WkNv8ohXmJEbk9C/iG2W8QoPWz1VZXbRnGVLPIHh5rG8YSI3gDA==
X-Received: by 2002:a05:622a:2cc:b0:4b2:e13c:7fee with SMTP id
 d75a77b69052e-4b2e13c80ccmr3482741cf.17.1756143021326; 
 Mon, 25 Aug 2025 10:30:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f3b946df6sm1466108e87.36.2025.08.25.10.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:30:20 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:30:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/38] drm/msm/dp: extract MISC1_MISC0 configuration
 into a separate function
Message-ID: <sxn2uecmqxbfqkmuzj33pythn4qhxzofbweacrpht3muc7djnv@nd5i4zzt3up6>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-6-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-6-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: pgiaxM5t1QFLi98LxpH8EAsEp0vEB3q1
X-Proofpoint-ORIG-GUID: pgiaxM5t1QFLi98LxpH8EAsEp0vEB3q1
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ac9db5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=JkHNupl4tvVLzN8DOdMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX5rcDdXZgQKiG
 EdftAt7NzV11assQWgkseYfkLZUCH44mJDqWDf2zg+zPXPzgPEMhFgVLHGY5qg7oZNl1kNBZmx7
 Pp192ARyd2QpQTyGYEU8rcKGXVZbbmt3nApKXZ3rmxiw9zJ4TgGRgH8/80iHmtX0zC03GlDEe7W
 6Hj1MEmR5yOCdc0yHMBBVfaw+K+C5rTkFWtzaq52ERET6kKsGAUoHtqnt+SuRu57DN/4H+GWjhA
 8qYN2kOs9nlOLTSQEGFy4qlSd4+z/3+TpFhPC0heozSLuyDmL/LflOQhYQhK/AVULR3655FFxPP
 L6+VAQLReu5wk+TLZfVE3nJ6/HKP4519Od0mEb1OmDRPyamtBsD2HFLXdLoKGyh32sIdCyz/bUA
 1i4iht7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
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

On Mon, Aug 25, 2025 at 10:15:52PM +0800, Yongxing Mou wrote:
> The MISC1_MISC0 register contains stream-specific configuration bits.
> To improve code clarity and modularity, this patch refactors the related
> code into a new helper function: msm_dp_ctrl_config_misc1_misc0().
> 
> This separation also prepares the codebase for future MST stream
> programming support.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 

With the commit message fixed (see previous comments, I won't repeat
that again and again):


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D60DA9D79E
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 07:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A0610E20F;
	Sat, 26 Apr 2025 05:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwiPqJcW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DAC10E050
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 05:06:48 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q3YteD002338
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 05:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eIL0w0SaX4fEgbdtMZSS99AU
 nD4HN81VW+RR9ZFL48M=; b=UwiPqJcWeRfXKGZLlT0agSw339wTDg3PCCVj8LQH
 yA5RINtNoHEdSVM1JsHflF+FPX3yiiaGkso7Zz9lz09vSwtO79HJQ50Qh+g8nZX/
 vHhrHJbs23P3OlGSTxLMtHWF3WGTZXU7YZ+MxbgrRvJBuW8D/jiwHBILVxoWvCx6
 oLpQT9fRf9hSZrYbtlFjcNDFg9gAQ7yGtliUCQzzTopF8pV5qpbYkxAYVK41hg2m
 SyXa3VebwcVirsIOEWrc4NQEOOZMmb+yzcfK/nWpZla4JSm/dGtOQbiMnTkGpME3
 T4poN4r+p477qwePiZpI2s5rXEEQNpwZ569C0nlIG8SxBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq585w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 05:06:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c7c30d8986so838928785a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 22:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745644006; x=1746248806;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eIL0w0SaX4fEgbdtMZSS99AUnD4HN81VW+RR9ZFL48M=;
 b=ZAhqQQBd7pqm4UL+YUbQnX6heVxoPVfBHFX3phvEn53iWww3pljE+ZrxS21/1df6CO
 sD6LWvuMyJrEebIYVlCAz0eh9ocCkePfhrLtinq/X3mQezeGzMsewzyqVaazWCjBN1M8
 J+7FUWnTLFxFM/0SV68FeR6obYGpkZeN/JpW1s7vb30Ui/vU7exgKw07dkBCqvNGPTWX
 kCiVDrIBiy0B1zS3eXMIWXV87m3boXLUX7tpxnKXnYjmsDpe0jsXQOexaBD696wquMu4
 A4jm6N9l/rPpqCAAjaaXqc6Y/eR7Zki6NlTDfPgq3bHBHEHiefVqlbTO3YJLjaUKmSOE
 ffPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1a6gTXl/xdu/ZziS4//YWklYoTnrMlBvD3u9dz6DmXiwG03KKqyWalcRkKzU6gQ83KKw+zI+t5U4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8mPZKMoq42xbIc/+KcLjiBvfOx8VbkWyBJUBon/RUS9sVcc8V
 6WPwujaRwjTMMLMd6Gr/BLlSh06T/hKF4FngV2EsX9mM1wCJahuaVq7qrkYk3vBSwZZ7DV3odq/
 0oombE8GBvMM5NsP4rumBAZsTGfbjq89w6PkyDoBoFWIgjDj68AYnHgoXlRty5B/XKwk=
X-Gm-Gg: ASbGncudOiJufsCVzQm8HyFsERbgENUwDxE3LKKvr9JX0L0PqZg4bbWj0HOb2IqUHQl
 dqmF+rDs0WlAuX8x+teHq5xjkBpIczWDnA+1kctwMlyg4g8ApOoPMWpyD2nEBL8Z595NDZckPU+
 OtrB9TW/o+yAQHOyLbNNuCDVamLtlkC6RzD81N7cWVutMwCN1KEdLg7WfHMwBS45pQokm6A8xh1
 RQ7m2yp+0C/8jNk3IXDRdsY1uKr6y95BwHrZ2d1PerVswE7L+0UNGu1W6DVd2ZSfYfi13HiPaS8
 qMLEVlm/kKzQnEcPkWq0U8iBFw5Lo8yxhEXos41o+4MlQ8xz8UwFKrjnnIT2xqAbQpnX3J6jw3U
 =
X-Received: by 2002:a05:620a:2894:b0:7c5:5e05:df33 with SMTP id
 af79cd13be357-7c9668cda1cmr346615985a.51.1745644006431; 
 Fri, 25 Apr 2025 22:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMaVXLId8fuUgq9yIofTuCxPmggQOFvjAUGTOfOuo8GXCozhFMNKAnbZiG2Wbb5ZGjE45ggQ==
X-Received: by 2002:a05:620a:2894:b0:7c5:5e05:df33 with SMTP id
 af79cd13be357-7c9668cda1cmr346614185a.51.1745644006052; 
 Fri, 25 Apr 2025 22:06:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb7bf9sm837712e87.215.2025.04.25.22.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 22:06:45 -0700 (PDT)
Date: Sat, 26 Apr 2025 08:06:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: msm: qcom,mdss: Document
 interconnect paths
Message-ID: <cmmongeaqwfsfnhpmwdsvozhjzkbdqncktiski4jvqgn5sjmsj@2lw4vesrcwjc>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
 <20250420-msm8953-interconnect-v2-1-828715dcb674@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-msm8953-interconnect-v2-1-828715dcb674@lucaweiss.eu>
X-Proofpoint-ORIG-GUID: 6vJM4uOSpjLcfJAVJ1rD8T15vm-Rl1H0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAzMCBTYWx0ZWRfX41HvY1g3vWfv
 Ug2gJBAqGJeS0kBAPz+7hhXycVevolsdSXM3CdLpNofTznXzaOuj/IK1931VlsrzD4O48njhs/Z
 leeBMrRj70wrI1FufT8Gbtj8KnpUb3nfHGQUrs7G6o81D2jjk1fIqFNbl5M7o+ah7VUmGvTU5CE
 +tEOszlqkcun0/sTh1JA+Cf6jaQ/lrp8xBr7uz+PMJoSJHD3WVY+l7W3k+G/4jlObJ6Hvt9+HcQ
 Kx4Ac/6KZmQsM/chkMvEU4MyTd4tuY9kdcRLmFixa2jpvQx/Ip/YMt7nH76z8/rJBLbzc4wxDRj
 kb+zCYybH9vkFPESh1Fe78s5/NxQwmndr2a5XhfoETDhy3s6I7jsis70ch3ixzLpUbBC5tGv9ka
 3okTsGB9ba78G1NSgDgRHvwB70vXNHfStA1AWyK5OFsbmCKb3MKJp45B7ArMiteBy/gzP0sH
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680c69e7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=z5yIEXyMNdJ1grE4PEwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: 6vJM4uOSpjLcfJAVJ1rD8T15vm-Rl1H0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260030
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

On Sun, Apr 20, 2025 at 05:12:43PM +0200, Luca Weiss wrote:
> Document two interconnect paths found on the MDSS on MSM8953.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> There's also some interconnect paths defined in the mdp5 schema, both
> drivers accept it. Newer mdss schemas seem to prefer mdp0-mem + cpu-cfg
> in the mdss schema instead of in the dpu subnode. Since there's no
> cpu-cfg defined with mdp5, I've added these paths here.
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

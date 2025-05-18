Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A9ABAF3E
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 12:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FC410E299;
	Sun, 18 May 2025 10:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqYmtgij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58EE10E299
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:17:32 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6rTE1017500
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xhP2SUjlpvQeAhCQLCmidVhe
 TvgcNKpIoIA/DfNmF0w=; b=aqYmtgijKPblFq2cjnFlErAz+xLO8o76zBtq84Ey
 la+rOgsOL8EX9MRiz/0iCCQOwjc1F/zhnepbT7Sei80RzXhxDebmiMjvFZBG8T7z
 8ie0S2evStccKTK+8jPrHmUNdE3ypmM3ipv4MThgKjcfF/bxWX06NHRd+eu5yA0L
 3MqRFYhSkNO+Zd+H0qR40nANgLa4w89X920/ntIYSHrKSzCIlcoaFGWEfv6uiEDp
 OvID5V44n5pM090M1QltDdYZtANQV8mpOWwHJAnQg0eM2H4RfxvkRxMO5Jn5IM9O
 X8oHMAAl5W0RcrYaBIyZKYfe18lM8TmujdGbB4ibxqduig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyhuh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 10:17:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8c0a83f9cso34012136d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 03:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747563451; x=1748168251;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xhP2SUjlpvQeAhCQLCmidVheTvgcNKpIoIA/DfNmF0w=;
 b=W3F83U9B6rea12j7YiJ4zEq2SuwDEhB9s4Xl+nQ7q9O+t87JVPjyGk430A4oJquaPa
 JD2yncXi7bH5wjPmd6hwQQP+oH7m9aOewh7beLkgytgl7kxNkZudPRt8bUhFmfSC+/xk
 iuzs43+dxKYbXXy9rHRP0Il4x2zr9F72xax3HS32QdoESpvJxl6BG/+HeMJHDA1o3k/U
 u74noBdyF/anVxHnQgl4L95eQtmDOJe1agh4kDv20LwG05TuB2rvm1V/vH3GwZ9YNZ/z
 nTqwS9qTWV78sYh9CKCX9FyMUWmOroaeE/5pgrrw3IQZ79hVGtaqa0lkCg5naVmZB20d
 jRIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP9kyqUbRpS055+EaTnJV+pixNJOTL2Y1J/OewGVPQEKhPebnICVSA5+nwYLtDM7gz5jjeIkrQ23A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiDLb1X/W3hwk+1TRzSgakq7HqhLSLzPx4Ee4N0/yC6XWrH5FJ
 EdVa9hQmYd8LcYwn7dl/yJUN/2aIy6T06cb374Dl+RtAo2sh9T760GFBbXbovZgp/0+2Pr3lUJ/
 4CAUv599GMONbyMaKSXGV9moHw9cry7BjacV4xFm2lGYFP5m5RZFMSm9kXZqnevPoiOVrTwQ=
X-Gm-Gg: ASbGncu1esuYQpUZitGrZ8Qp/n+cxSYLV38FQ+YgppbnM6K1MXSOVP1Db0MsMrmL2aC
 JAeD2rkGt8u4qAM5ORREmsT1Kv2u4lg8RrvGSaaA7a6z0MAHvPnrQV3q2OF3BCPD0EcT/j8SD4T
 H38PbWuo/Vd6ftbDFSMXXEHSKOtrciqpzwyKj1xjecPgWyCN3rpIOX5lzt+7VEay+8DKOsvA18Y
 YhwKgZPv9zPFZPW0dE603Pf7dng+aAK2Ik4TBoKnVVKEPn1cTNBWHyvYC3khHy0NgPCIcNPFgcD
 qm4+murw5BWYkVntwN0Q/yVXEr+pKrwiMhtdTxFnSwiPV0tL7oZLvgBb7i848HSBSmayuOnwORA
 =
X-Received: by 2002:a05:6214:252c:b0:6f8:9a2e:170a with SMTP id
 6a1803df08f44-6f8b2b67f15mr145182186d6.0.1747563450913; 
 Sun, 18 May 2025 03:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/QdroMCAgOdxUn8/7R10XW9Bp00ARKToH4sQUo+1oHi7NcXV+IvTd0N1GOa+Vj7DtOkw51A==
X-Received: by 2002:a05:6214:252c:b0:6f8:9a2e:170a with SMTP id
 6a1803df08f44-6f8b2b67f15mr145182006d6.0.1747563450612; 
 Sun, 18 May 2025 03:17:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e8bea4b0sm1319372e87.19.2025.05.18.03.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 03:17:29 -0700 (PDT)
Date: Sun, 18 May 2025 13:17:27 +0300
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
Subject: Re: [PATCH RFT v3 14/14] drm/msm/adreno: Switch to the common UBWC
 config struct
Message-ID: <dwhxtakgpjzd54krxqxpocpuwrk3cgh7sfiel4thgawsolo63b@ty7me7p6a3lo>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-14-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-14-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5NyBTYWx0ZWRfXzRkrBQR6jLLn
 MxV46yBSovx+Ut79G25JWcJ3ex5lkzm+r0QqArg8Wh2cGrU2VeZGq3jAPUIebyBHTCXzFuP5kbi
 87nlHhInww4QfRaJs37jICuwWouiEUflIew/grU9PkT8Ya/X95fMhAGA5DpfZXaTIH43YD6GHyl
 Sqxuin722xbwWBYaJkAdShDfBb6eIDq00WFu/KPohCIh4sGT1KjHh7A6S4d+dA1bT3PZHFyIExw
 kICpzQvbgtNUXhKnyUTrYPPc9z8K4gHdvjQ9PHE6aKLDh4q9vftSSTLz0ZPp0VzSlMO1kzOtTUy
 EruueowGoXmFFYD8HxXaoqkEcmuInTbWmdrUaFmQxYn99jBJ4t/lRxK/m7ZBTb5HX6kgc0pt/ht
 QOHjlvWtRP2U3qsqNG3wYDmuLXu6HucxL2W6FQ4nm/btg/6aKlWcAO/2cTWrrsiqNFBD9HQA
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=6829b3bb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=dxQFKmM27UcP91gbFjcA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: y1n_DyWi-Cotbd0JcSjOmyNihOfZiP6O
X-Proofpoint-ORIG-GUID: y1n_DyWi-Cotbd0JcSjOmyNihOfZiP6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=961 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180097
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

On Sat, May 17, 2025 at 07:32:48PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Now that Adreno specifics are out of the way, use the common config
> (but leave the HBB hardcoding in place until that is wired up on the
> other side).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 20 ++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 76 ++++++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 +--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 45 +++----------------
>  4 files changed, 60 insertions(+), 87 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

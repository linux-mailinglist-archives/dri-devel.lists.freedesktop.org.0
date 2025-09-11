Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A2DB532E2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF4F10EB1F;
	Thu, 11 Sep 2025 12:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOFpioyS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB57810EB20
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:57:28 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B4kKK1019146
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5F4kfREjeTfa3WqC2b/52lNM
 yv9yD3hosyjF57uJTA8=; b=LOFpioyS9HMKxtSXT1eBG8itb3soeCkkvdviL5y7
 r7k7dvSbrqFumJfMv129e9MLbytCrCNOlkgq/BzGfpKPyQYRXDQfYYsnyhfQ2LzC
 jiFiHMPazPyXNf87ca9RgMd5JlYmblWTs0lIbK7JtevSbJR8Z7XTwpnQI/jZSucv
 CYzI3gpj3CMVywF4txmp9Bo/ZzjqOhO0AhvGbgf83fcSaBLBnI9I1/YT+Up6Y6TP
 PUEG+Lwb/UC6OjzgHy5B4W/pWH4zOSEY4GVR+Gf4t6NDeAcWBOT4ED8XhNLc1Sc3
 il3+Agv3M2bXsMT71eo23InBbrzEKBBlyLkAKgWpuSOylQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphsefh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:57:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b548745115so17572361cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 05:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595447; x=1758200247;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5F4kfREjeTfa3WqC2b/52lNMyv9yD3hosyjF57uJTA8=;
 b=Ha8Kk9Ea+xCrI+kd6JLB2qopEB5Kw7Umhw3BtcgglKvLk/NbMnat6dzIDEEPbXd4CX
 WOi2AYSbLoc2xuYw5vzG9XL5kuz/wstbTEO/Gp0Y/kuASgEJR1gCHtu9EY4jcCFmwjN8
 urweb791+hhsq6d++jV6YaSnuIlsHRBdP8nMhTgbdNr7qYxCloG3WTrMdtdb5Bgw1AaN
 HGywxW+BFbR8sAl6mf6C5uDn4Pv5PJn+A3/TSItc2OcqaFa9AwIUwr44pMpECFD+JFFQ
 5dOe3XyR/JodMxBUTBgy3KfVvqoQUJT50nUGz4TsO93iFeVJotWf8vC9ia0k2q33dKU3
 H0FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ0T7VdvXhomp8+MZ7l/V5j3lnjO7sj7PM+ll2c641KuYa8x2WOVqhgKT41G2uLKivaCh2Q4/jtAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzvbx6rs+ZK37S7hpkOoTJZfpSaqnffmSUSmbyWLAPLSEFRN0iV
 mr8hG4uzAUN8hdmO7TQ8D4mjbhBc/keQ3mYYjojj5Jp8q3AzxwJpfUaKceW+CGaBldiRs0Gz2re
 YjuvGEHRAJS1C/yOFsL64ghNheEia2x/3NCk2bU09LfYZ/HhUfwqJlbCTcskXEi4LlwegrMw=
X-Gm-Gg: ASbGncsE31bGZenCeRFOZeYeesuMeB/kzCkzFus33Pr5K3D/mp5lpKi6moSDBSRylGi
 /+ZugFuJB50lRZ+PWzotbL5kkXst6iIbwMOHBM7vECT7UdK1tqXlEr1hqEE3fGnHDvA9lt6kHcF
 DsUVtf7frsrlT4J85HzRJLxzr2IJkvoHwYROpZ5i79RRzE0R9z3kqd20ylM6qpYTCg6j99EzlfF
 1jawXGgvBmGT3vwC7HAPW7Hxl4/WW+KXANuAXJs2ntL/8wovGXKOaExBhLtELHPG9yqvgW1owbN
 7WYolz8+prEdHYRK2uvW+40RXmi0nSUz6vr+auZAvlOn0w0zCOMtgdupZS5CHouvdOXVlp2SSC5
 MXzC/46/UzQbsrc4P2SwnecVg3n5KQr2UAYB4YJFoaYy656mkqZ/d
X-Received: by 2002:a05:622a:130d:b0:4b5:6f48:e55a with SMTP id
 d75a77b69052e-4b6346f39e1mr42311721cf.12.1757595446926; 
 Thu, 11 Sep 2025 05:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmfeR7fqbYQsz/Cx0vhB0h7BtieRzZWfwREik41OqRawcDy0H0xPFZm8LueVdNLZmIIf7boA==
X-Received: by 2002:a05:622a:130d:b0:4b5:6f48:e55a with SMTP id
 d75a77b69052e-4b6346f39e1mr42311341cf.12.1757595446424; 
 Thu, 11 Sep 2025 05:57:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c3b5fadsm422254e87.6.2025.09.11.05.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 05:57:25 -0700 (PDT)
Date: Thu, 11 Sep 2025 15:57:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] drm/msm/dpu: Add support for Glymur
Message-ID: <d7his4r3txgmpgptl6ohnjzslm5s3wquxxsi67gli4wcyszlsd@klru2kjlk6i4>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-5-d391a343292e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-5-d391a343292e@linaro.org>
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c2c737 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Z5WwtQVXMiuTecYWR00A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ldPQbZXMYEtxUr9yG7MRnSSMGABMrJk6
X-Proofpoint-ORIG-GUID: ldPQbZXMYEtxUr9yG7MRnSSMGABMrJk6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX3irvRuTTVTuR
 DqO9mQAbdhQtiXh9yFQzWRhVskvG+Fk5mBD5naZ4l1MI7tQmd9+oz2TT5KnpT/YYw8FmTJeuTbs
 Rh/BG/HsbLsfDhmA5fzHQ68RwSBE0egxCQZXTA6rAxttf0PwhtzWqleBaoMfjh5rNAtzn7MFLZn
 ruFje0Svz6T8SJ/s59VuEPt4mkR9MDnBVhudy3MTBwdNX+pHPdebqHtPN41fVBjw8+RWzdJGL4t
 lirpZYZevznclQxDDLKEPuWCiTO36zW618LWtmF0WZYsGhG/sC2kpMtV2OcenvFwRoCUPDvQlUx
 Nu1FSCQ7cJ2MObD3iuuXIJxX7nORX90J36GawiAwRYAlb9FoaN1vTjkqua7cQjatlOrakEgcVLv
 me9hf2yd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040
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

On Thu, Sep 11, 2025 at 03:28:52PM +0300, Abel Vesa wrote:
> Add DPU version v12.2 support for the Glymur platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    | 541 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  5 files changed, 550 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

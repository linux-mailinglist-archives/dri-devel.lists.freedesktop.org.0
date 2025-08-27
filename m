Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6A3B376B3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 03:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D0610E6E8;
	Wed, 27 Aug 2025 01:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUJYYuwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B5C10E6E9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 01:18:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QJf3hv000801
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 01:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Bx+duUP1GALERBeSBTVPOrXM
 scOH+ezdQWGpYAtJpSQ=; b=aUJYYuwfAjFvp98BcSfP9wgOvviNGgAb3iP/Uyeh
 bBZajVeViijgS9PvK0tayRC8E663JaLFc1TW2wc9yW9NTzWdct/Ktwu3WYaahJ7a
 CvaB67tBd/ERl/Q5BxfuMavD009wwGPSnkVDuyQAEB9IukNJsbkOWYv0z4LUo4r/
 ETVF0iTRrWZ5FJN0tPoYoVPgJdCXJyerzFruYWehFJaX+uj+qX7sNb+RplTrQFic
 qgBjzpoA0uHMBSZbp4yLslNTFpbAYK6w2WN0hkhTWxz6T2mLvvPUmO+v+GsPw6NM
 mNcQd+1Wq4b0NXFQCZ0JtdXRj8rd1v5wi+Zek7+UNZDhLg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpu2h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 01:18:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b10946ab41so13818111cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257519; x=1756862319;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bx+duUP1GALERBeSBTVPOrXMscOH+ezdQWGpYAtJpSQ=;
 b=r1XM+0qUI1BRMbV0luHOZ8aIQ31pJFwWz9BiLLfPo73n3wTxAi6mXT46i4+E4wUTIJ
 Bov7mLYhBSWKvB6lc5jq5+ada3jNUUO8+f6lY37hIF3OUgl2cZPWKqym9qi5PiT5fyZq
 V9fFWS3KY0VIKYgAtY44vTPCYWnbap7fGLoZYqhgOEqRg2gBu8looKAjyHEPSQBTmvne
 0HFY87b94EOw9Xcaf/XYQ4sEQQc9isnNjLpApY46rcNttq8MQgZGwu6XBBRGAC9L4xFE
 8jYHvAPXsoTpT1UBVzklyfrMl4iIQnkyAjpSvk6n5gY1UwHgqiNnamJEyNeYmuKbRgKv
 x9Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLHW9gXt6jovoSbXzG+gHlIAsi3hLp+x7IfVoOE6skVOkllrdX2eYnHlzreJ41WoM75taJfQ9SIVg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWaCw0oqT/JWsADWAY1luENn5le5LP1n62akVxBofht09O3ylH
 cAkDoce7FwbO3vxLDP+fjO/uHXrTGD5BM3+QOAoJgDz7XO8o/BvRCtl8b2rxn1ol0MSRqp/t2yi
 b24+mw+WEU4rhef60np5pKYGdMqMN/yTSpZpp4jRCr/FHxEAHvCHKBS1Sc+XeTnPNQEGP5j4=
X-Gm-Gg: ASbGncslAZP/7rHKC5oiXm/FGLPPnG9IWkT3lULSVgFIFchIFvmHPN+7lnI3a2bo8r/
 JGccUVd4EY1EWdaXzHogH2aQHPjLcdN8vVizx8XggDCZhbFnZgl5uMgJuV6GfzSVwd+SCS62YNt
 7/9RNugJHUj3SC0UEs9+Kc08IEVnWOTBTS6z/8SXfXAZ0pCo/i+EBp0pO9aTD+bzGvquVyjit8H
 8UAkxYPbcdPjyRXoj9TBMou/Nai+JYj2Bsd2v/bUCKU+cxC37E8qIDS+UDpVkIqtqElOZ4upQr1
 pdstJlmKRG5VQ2ykkhYeGlNn0jNbvXwkCiMt6iXdBNwBqKqjrSxf13DGBsmQ4rYNX24b4RM4Zya
 8ee6eZX3ahW4zwlwuIJKHzHgot9OMOO1Xc+RORhwoR+FGhB96DLpJ
X-Received: by 2002:a05:622a:5c0e:b0:4b2:9b79:e6ff with SMTP id
 d75a77b69052e-4b2e76f6c24mr36188191cf.7.1756257518815; 
 Tue, 26 Aug 2025 18:18:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlWgyLt/FiqiOWOJS0LqGdTAYap/k8kB9YXuoapGqnOCEle6fLztfOxdXwebefsByFu+0ZLg==
X-Received: by 2002:a05:622a:5c0e:b0:4b2:9b79:e6ff with SMTP id
 d75a77b69052e-4b2e76f6c24mr36188011cf.7.1756257518351; 
 Tue, 26 Aug 2025 18:18:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c02020sm2529995e87.29.2025.08.26.18.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:18:37 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:18:34 +0300
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 37/38] drm/msm/dp: fix the intf_type of MST interfaces
Message-ID: <pp7s4wyvchoe2en6xqtow7cw3wfjfgnb5lu2l4f26azwssolpk@ydjm2ezqumu5>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ae5cf0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ELchz9PJ39Up9ouDmgAA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xRub5N99n2RdjTNJezXXZWBwseA7zc4s
X-Proofpoint-ORIG-GUID: xRub5N99n2RdjTNJezXXZWBwseA7zc4s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/N0lCMGcgYyr
 0zEW3azv3neMCsNpgo2K4ZqN+bhIvtGEk2M1IHTaRXAfheLE3GXYL1asoNNN9WwPqxLIEzjG/9k
 gxdqspQnViTRw5gF4bgdW7/Dx/njGOZlr9MxvQ04CAi5ECLh9kXxvaa+2qnjku47o4FJGYuJ/ko
 ZHaZMrgCLYAIBN9HkoTPhUtjCrv6daXDoaG7iAehuTVqd9JxSKE3CXGLeFJqUhSyqEp3d3zQ1cU
 olp83HJPudxIM3HkSVooxoUdYO5McL4zhhtjPq5oMIwFLEopJlxFitkPFo+soA6uCNVTdV3aOdx
 +0rwLa6y1Yp1F64v0HcIPoOqyxwOuVCjFN6MaaEiJQW3vHtrYoA38gsLgXosG4JXeAKTjB097v8
 5D1FbnuI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:16:23PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Interface type of MST interfaces is currently INTF_NONE. Update this to
> INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
> dpu_8_4_sa8775p.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---

Also, as far as I remember, INTF_3 is not a DP1, but DP0 MST on the following platforms:
- 4.0, SDM845
- 5.0, SM8150
- 5.2, SM7150
- 5.3, SM6150
- 6.0, SM8250
- 7.0, SM8350
- 8.1, SM8450
- 9.0, SM8550
- 9.1, SAR2130P
- 10.0, SM8650

Please update them them as a separate patch.

For this patch:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

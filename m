Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6411AB750C
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 21:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DFF10E6E3;
	Wed, 14 May 2025 19:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNdq2vHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D658B10E6E8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:04:13 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EI6INq002689
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aPZSuuY1W/lCvYUJRt7cqKLa
 wbwX8uiQ1760f2RdC0w=; b=GNdq2vHPVhfWAK6PbeUHRHsKrtZBokiSj1Nab4rk
 5Ozx0/lcH9cJtLSQ1MdsbKEQMwLdK4bECGNjR1LPwlmPWUZTvAav+UGyJrv5yXeF
 M9XWiaG11phSC6ApxL0u6sS5JcfFsh78mtjDUGGhDIRcIy9hA3BJIYqzTeyLTwMi
 BF9Aoo8Xr31a9ZsnvT+jZrOcqeovKOKv1LDK7KkUCCbcoRZpHIgdLdU64zuZCpHh
 UZPp0nqaTy+VumjBxJE7W6jE1j4g5f173hjVJ+R3rCXIzhhGI18iOjCQQZI1N2uF
 gyrXXTBcvjLdL2qFClDTARQXmbNMWZykHg82Gsua1hCqRA==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex3s4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:04:13 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3d93e2ac7fbso2868505ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747249452; x=1747854252;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aPZSuuY1W/lCvYUJRt7cqKLawbwX8uiQ1760f2RdC0w=;
 b=Vhv/fye9VU47h+llydXa8vpHEpRQ3y5r+bCXE9Xy4z0bjkjGQdwZWjbNSfGEMuczOA
 KKt9jDQ0LsNuIODMDRHMrvvy2w2yoPfMVnx2Z+iJtBu/pkgYdyeOtHi2sTkloSj4mm76
 4Yi+XP/2JEdRtjyADl8x/M98JD9CWJ/Ih4DagsmKnpc4k7FAIlQBMXyVvpgOy687o4uZ
 XDhjtZTCtp1nTv1uKRm3bkb+cWScMwrIBfGDIUXleDfsClCcKvGu5TH6pQCMoPqyOfj1
 pHpVVzqwprIZE+IGU6PdUuiXdmiDBP1hoXCE4UL0DlzKL0ABKW87cV937EuDhBldmbFu
 I2zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFHuzUOKNy7RknJbrjiAzA+kSp6t8GOuO1qtyrqRL4f5BMB+UZ0A0eBivIgSgXv+037687Wg+dBoo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFaXUlOgBKb5jE4nfK7mCEUaiuyUWYuhlH6arBINK1lug9n6Oh
 a2Qj169P6JYpt5SpAgbg44QvZNgAf3xCQB4MzXSZ5UT1ejZjWTvPgt9KgvOGMYq9+JA+6RJHW1+
 vZ/2wNQnvKItCsM1S4WinMaeixF3iKo+BVrXVVg0isT53swBVOWDc/6oinaLnnwP0MIg=
X-Gm-Gg: ASbGncsJcXU+IuqsHzfrsZ8E8iUmU1bVOLKksfhEOdKgXXXpzTcqSEA9M+oUW1V7E1y
 u8gxSzITmc1t0EE1B9ONoPx4+Dqmdk6jVSLTxQB9JmDPcb52t1TE3G/Y+EQAhLa4UPx5Sr5ykoa
 ySG33IaAPrZXmW2gI+0Sz4JMlUwkHsQY0m8Eo6UIVEGPjsyRRlhQJnS9ttE/z5Yd+NlTvN2GFvx
 WQ8+UMImv/FBoPx4fue+AHmXlgRg3oOovtDIQXM1KwCg9edOVvy8k+yJF9s+u4/NbRZOd5mUpWs
 t8JcGA7md1Sr8iDYIwUsWg7FkZbnxZt4+8dxeEbPKkURmvPxV0rGiPC6OBBNGEv+kvp9XMcsiSA
 =
X-Received: by 2002:a92:ca09:0:b0:3d9:3a09:415e with SMTP id
 e9e14a558f8ab-3db6f7f8816mr51919465ab.19.1747249452366; 
 Wed, 14 May 2025 12:04:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1XZOwFPXRq4qN4nQf+1LdGLzvGFgQT2vfouD5tcjh/PXEkQ7Sf0nUxsz+NzWLL1xiMHL/tQ==
X-Received: by 2002:a92:ca09:0:b0:3d9:3a09:415e with SMTP id
 e9e14a558f8ab-3db6f7f8816mr51919015ab.19.1747249451992; 
 Wed, 14 May 2025 12:04:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64d07d8sm2362836e87.257.2025.05.14.12.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:04:11 -0700 (PDT)
Date: Wed, 14 May 2025 22:04:09 +0300
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
Subject: Re: [PATCH RFT v2 02/15] drm/msm: Offset MDSS HBB value by 13
Message-ID: <zrz32vlzyozool76prwmwtz3us27dubfscpdtxjoydr7jps7tq@awla4zpep7kk>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-2-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-2-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MyBTYWx0ZWRfX7wXG2hsM/84a
 tQf1Rie+9QoRNb+W7bzd9XRFmf8aAGYAombU4zv8PUi56av4TCXrXh/s0BOL9m3IJCJ0jhko6rI
 Xp4czg8xI4BLZdh+XZ5Ste/rIty53EScbZpHSGHzg5cakzZ7SZHVZMN1kkhhZNJZCXeOAmF+1s9
 i98enga9hkm0dTYdF6119C/yEhrfr5N7kG5OR3AJnqkH6vVYTU5pBN1LRoa3ZJZRQrNqh02lqL3
 00dVU6wp0EqZN/gXSpDQ+eH/pLb/KjftPe2pEQwJ8KNZOLHaNL0tGWOGNUnk5Y213Qw3pY0NAEd
 lTg6kDU3kG31X6ekwFaJOwcKwP6QQHI9TsNGp2cXiS7/oI1RFmf+QgYGz2jZUuRWp4f1pxXLURN
 Iv2DPg+/EZPNUiT+33oZDfUs+6jiMoP7czS1CYw/50tbIdE3Z5DXmnUxoYCbadVytjfUTSMB
X-Proofpoint-ORIG-GUID: xEGF9_ECKXFG5vMp6cob9zMw_g48Slyz
X-Proofpoint-GUID: xEGF9_ECKXFG5vMp6cob9zMw_g48Slyz
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=6824e92d cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JTEDtJd_13X3dLxXeFUA:9 a=CjuIK1q_8ugA:10
 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=836 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140173
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

On Wed, May 14, 2025 at 05:10:22PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Adreno part of the driver exposes this value to userspace, and the
> SMEM data source also presents a x+13 value. Keep things coherent and
> make the value uniform across them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 50 +++++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

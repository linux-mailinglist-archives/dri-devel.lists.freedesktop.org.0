Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCCAB1BF5B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 05:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BAF10E71C;
	Wed,  6 Aug 2025 03:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ky5hYJjO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40DB10E71C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 03:34:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761ekrN008619
 for <dri-devel@lists.freedesktop.org>; Wed, 6 Aug 2025 03:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vth/2Y/jgsPixg8dhAKuw2SN
 Go8Ue+WIsJu8g0n76us=; b=ky5hYJjOnww1R/xoC4N1pXPVFWroBLAe5pfNyjWy
 66AqCAs3NHStzYDJ1JJoL1iWs74SksGM36HfTCwAAgFPNjW1KEV7oTQAeJA00FMx
 yzDWagytDuOdPwbVUdq6SD68LVW1P/Kb9epzZcap+Jo+d+xDmUyB7PCv/XhUiKrM
 3Pmv6UvuVH8x+0DhWSROpkExfXOF0dukgqXa7sZ5PbCxQT/p7c0/cPJ7UOKQqdVG
 XlmsoePLIo7su/iy0Jt2gdYAo7pHIJ38NZpU1i2Yoc4CMNqkICZ8ssML8FKMKj7N
 +x7uoip+lMbk/nGPVUqZpRgm59TpRWPfsYsqcNIgYxdGZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy899aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 03:34:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7074cb63bccso109731636d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 20:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754451281; x=1755056081;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vth/2Y/jgsPixg8dhAKuw2SNGo8Ue+WIsJu8g0n76us=;
 b=uSLXsgLSuUrfdu4ZPi0xeZ+lZwlkAHxwUW2c/OVvgBdnJgk19NRBgJVRc6zp6nf0jd
 7yn0FEzk95ook14+4Taksd4bc03gk+zfGdnX/9zbmE20QAjyjfupFTLCjLgLOTQ2sFPc
 3wUNeZR3CQBgIHmyCJoqUlEkyimnmX7r/4u5FVkJ/mlz66sUYrKJoFOztCDJ4GyUsq/l
 vzN4h3a93R7jHj/2OJj2UHfiyfEust6ab4CEO9G+enhu1BsltUHD31GuSlkNZyEdV5Ey
 hBFX5kLtNEF14oNScJ+gKjwDxFCJbpnsAJWtNRrQEVx5L2K/LtvV53cS+NR6kZlW/Kfw
 gFgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVoRBos/EGt1bx5eSCBsN9RXuLMxwq5/jdGiXDWVSoLfe1ICTSs1J+EIRanBrkX0EJMxxpBAqCYOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDp1BqZM0s/6hDWr+xedLgGkpkX79Sk8Yv2+s6ukhwGZHBURfk
 Nz5eLQbHjHgmBLBxpqArHmJPTM479hHT2UokMEeRDE/nPlwaodONlt/uoavkdbAEx7WuhUDrmFf
 J3uIsGvQ3WS+f7F7ji6CjDMEaGrApoYpv2hSMr87fqtAOgjjtQkKvg/Vb2KEUMdxMfa7zIVw=
X-Gm-Gg: ASbGncvkJq4hOqqlHBi3RO0Gq+GUQ7lT2VMJun75Ptk+BCRXIgo6XxTbBaaaoE5SsAP
 EXROuPgzdnVbRb2dcy7qo4pelSBnOZTpoWmW6iCAN7USvtEZob/eRBtbLkbM2UMnj5xuDFACDYT
 pY3SHBZhKqF/jFYf+UbMLmS158YnRdCWof4/6IVJVz9xMt7kmhkZ5YEdLj//Nb9Cj8tMN3+udqs
 Y9Om4swbN9JfQ8CJTAspp/eyRwt/RwTK+Wj8i7TmQItf5ortvkbvtCSl8CFSpYwhigQsFsGM4PK
 uWDXSsRkS1BEUElR+38m7uYUkMHpDf817AeFvBGuWtybG0jjNmGannVHs9lhh1/ubrhHuZodVMO
 3ks8/HcVMBNIma5k+VW8bmmPKzEgGe6/ONNReOTihI47HeqWFyqf0
X-Received: by 2002:a05:622a:5a99:b0:4ab:5c58:bb33 with SMTP id
 d75a77b69052e-4b0915e48abmr22498921cf.49.1754451280630; 
 Tue, 05 Aug 2025 20:34:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7vcXFUJ30iJDUbRPzNDGIhCemggG/HQOqpvhQreed4gLOPOyKQ2xyiSwmnN889jRgtv0Jfg==
X-Received: by 2002:a05:622a:5a99:b0:4ab:5c58:bb33 with SMTP id
 d75a77b69052e-4b0915e48abmr22498721cf.49.1754451280181; 
 Tue, 05 Aug 2025 20:34:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898beeesm2165977e87.17.2025.08.05.20.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 20:34:38 -0700 (PDT)
Date: Wed, 6 Aug 2025 06:34:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/6] drm/msm: mdss: Add QCS8300 support
Message-ID: <edsul4zxzcgg2lglxpor5xlzfq35c7r6gmw4o3iermf4z7ftpr@elzstjjft5m4>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-4-dbc17a8b86af@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-mdssdt_qcs8300-v6-4-dbc17a8b86af@quicinc.com>
X-Proofpoint-GUID: Ob8WT4BNFxf_rS1wZFkK-PnoYXzdlkDt
X-Proofpoint-ORIG-GUID: Ob8WT4BNFxf_rS1wZFkK-PnoYXzdlkDt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX6P52l8Sm3AAZ
 TOOuHgzueCSOnK90Cvc7z8JWv0SPUTEK2srSWA8EqvLvdImC1efwuMMCY01rRvJ7Ofpbez9TaXU
 FI6lIg0A3PINA+knZRFUW27Mdujw9s3oa//691b2HN/NnzL5ZZ1BOaLx3QKBFJRgk8vz0ZNp6+Z
 Tm9bxQDI7MGBv/EL86fulalV2ut06WT9fiA1VYaZ+08nCLOlYdMcFbDZOiQszyB4i9+T1F/QFoC
 pGpZdb0EV3Z7tqE8iIoOXSbpFX8q+oIsuOKtOFHP1gFhuAStKIBg13g0z+pw4joErTSYSFSE7LL
 G7wt+FIMqOfQmsdBQw9faW6KMFiafzeYotEPiadyYw2Goi7n8RTZXD79Q/lS63wm7T++A2yR5Xt
 mdQM2PWj
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=6892cd52 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=FdNK5TKXhCwMvpUfx80A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

On Wed, Aug 06, 2025 at 11:16:48AM +0800, Yongxing Mou wrote:
> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
> 
Nit: the order of patches is incorrect, UBWC should come before MDSS. No
need to resend the series just for the sake of this change.

-- 
With best wishes
Dmitry

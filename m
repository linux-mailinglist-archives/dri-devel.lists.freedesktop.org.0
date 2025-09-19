Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A835EB8AF71
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 20:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100A710EA6E;
	Fri, 19 Sep 2025 18:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/PK5xiK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B986510E060
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:43:03 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JDkRsW009015
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=iDUVT1j3d1+CSBXfFOTmyvH1
 fdhZ2PGbb9X8k35Q3Ls=; b=K/PK5xiKgRdHln+rXzsf7M3F+hfCe70jVbWY+97H
 vb8vd4bOKlTFixKmvI69F2HTXw9VGxrQBm46A6YdcUnOoU/SxCmibMOx3jPVlOdW
 EN443q8AcfUV/InJZoSJ279xcEKACXMiBb9dq946wlZRV3RynEUHF3+IQJgtNm5A
 xLR9ytZdCiRF2T8hgyeB9H1YY1+F1PO4SQYthEXMuZX0w58qwerZlXGec1hl44nC
 FkkhWac4GEz4e31yLaU+3N1wBViYWHKzovqtTJBvA/fVLo6XGJPLwLAi3qD+MNwq
 5+1T6yT6KtUTFgjiJg0XWSgIuHSLxemc+SaAdWnrcJdS7w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498q9dbytp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 18:43:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-78f6250f0cdso38970556d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 11:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758307382; x=1758912182;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDUVT1j3d1+CSBXfFOTmyvH1fdhZ2PGbb9X8k35Q3Ls=;
 b=eY5giuqlbzieZWZnWeuOGRd5u5XEw0Fnkcl8X0rQmC3b0LdI0Hi6RP275+ZleYZ+kt
 ODct1PDoWNkj4+6xfSbzB2G5DuLGqyTJHqotCFfysklTppjyfOmqwVZQT/NNGUbs5u8X
 gYCJIv0i+yAzaJBL7mX4J0KF++5rSLuc4MIhW7vV/m/UoM7BF7oQpLQ/C9+LtbHtNyEG
 xszGyYiI+GIP0fdnOlIqOznXFQxHID42Smj2V1YId1V75qVN0xMjShDL3AlmbkCsGZxJ
 XfIP90FPGRye1Nn1GufSeSQyB38371ByFqgOuT0XOLMvFRz7Dx05c6/ZqAFoe1yrGj+P
 QWjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmGIjvxnBcMwzb20fGJiMFnaczeWlKDsOWlXlHjMF66QEatvhHb4lvGjf3GNaQKWT+/sFvMOVIU6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDeX+RbpEUxvEGsuCLOXmGhBZfI+LDrDYn3iRMnvlpqva8n5N2
 rA1NgAo2ga5Ir9FKFpsI+xyHonpc5eEaK/mchikPPhjoTVDQvp7VzH0wocc0VZnCTWIKOEiZdSY
 20zxEUWEN2lW3ld3BbQykTxmGXzlfKZvu606/EPUgwJ5UCRFj5ze7nAPvbv6ltiamYrZbKeQ=
X-Gm-Gg: ASbGncvFbieHktu10acyQbVB0AgVSFapBl+wk+K37RCCnkKdivTuoXE8C8QRKHpXT3n
 csB0gIhRhEx0GGm+FPMHtD2RfurykrADeU9K25p/tdxhjryUHgXMDjGSjGUcns5PpR3ZBXuqu1H
 JrwJunZ7IZp3o4b4Pd/xkGahJ9SGWe5aWKkchpmex05aOf5cpRSEAKJkBpSFByVJmycS++jK6a+
 2svYfIE+vM9Qy+JuzU+bxyI+hiBuQsheD39zUIHUVjdwooItlyG2GDtELvvRD3Ot2gErZM1S2sU
 IKpuzmHGrI/e83jCS4tBPMv5C6g0x3trME2xagPGIELwfQkiGSbPWGHAtoCTSffbogOLUwnNzUW
 PsHAJvIyMixnhEDyIbWcy01jTszXJAtqksU0iNbme3Pzn++4xVRJL
X-Received: by 2002:a05:6214:620d:b0:79e:88e2:1e60 with SMTP id
 6a1803df08f44-79e88f16526mr13039946d6.29.1758307381864; 
 Fri, 19 Sep 2025 11:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBKob9aSVicKYLHzXQPUikT9E64t9XkAJpeGDW6LHYdfXs9n7cQ4eZ9GnUtn4na0s2vbgtzw==
X-Received: by 2002:a05:6214:620d:b0:79e:88e2:1e60 with SMTP id
 6a1803df08f44-79e88f16526mr13039536d6.29.1758307381248; 
 Fri, 19 Sep 2025 11:43:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a5f447f3sm1549103e87.13.2025.09.19.11.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 11:43:00 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:42:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 09/14] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
Message-ID: <zhqm6bqnlx3cu2rlv2wdhbhnuwc35jtia72tjotchyq3utla7x@45ws52wsii3w>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-9-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-9-eae6681f4002@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YsAPR5YX c=1 sm=1 tr=0 ts=68cda436 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gZRqL4tbKlavufozYNMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: _ijr8sDo3FZx0UH4RzChPeaBVCYYSj4C
X-Proofpoint-ORIG-GUID: _ijr8sDo3FZx0UH4RzChPeaBVCYYSj4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDE2MyBTYWx0ZWRfX0xC88wnEWL6u
 oE21iHQdj2RdtuALj4vNB2Nl1HcGDSJ8/hi95078aBRoH+oACLeyxV3zUS7CVF5m78ifFcE3GWx
 ikKxx66nDtRz9Ffct0aZpysYPKjGrL3pA5Rqq/aD8rJ/A7HZpeMUeZGDz3SNFdWp5SB33+G+lKi
 CPPBytCn/yNKYpjtR8v05FnuEsD+5SvfelxGc4UOiSMykAMdG9WBa6BNt4zzrUQr/dj/hrghnwD
 3GOPgvvzVTYaxT7QHhWoR99I6p0M+kK41NeHajsrQlnhQDMSK9KwyiNmL/I3lTRUWdg0ch3W1Pe
 sYbCpnkV7ldS5FMfCWw8mpgXhXwQNQbWi8+PCbUdfxTijJL929iBfsQDs382Wr3Sx1sWxGJvblR
 z9UeziuS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180163
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

On Fri, Sep 19, 2025 at 10:24:26PM +0800, Xiangxu Yin wrote:
> Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
> switchable PHYs.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 194 ++++++++++++++++++++++++++++++-
>  1 file changed, 193 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

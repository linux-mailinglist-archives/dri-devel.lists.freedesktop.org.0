Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D7EAA87BC
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 18:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623E810E2CF;
	Sun,  4 May 2025 16:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTA9X857";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795AC10E2CE
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 16:13:47 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5444vxXm002483
 for <dri-devel@lists.freedesktop.org>; Sun, 4 May 2025 16:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=; b=kTA9X857O4qZsmJA
 6y2rNIy9JrJ8GrF81eNoH58AnwJNaWPIBB1Q3dMByyCJNeOL5Sma4DJ9GG+g1Gnr
 cBIl1ZyZVs1j1guQmlWPODmhrfUmF+vYHk4rUkSWGFPa4FtPciVsHmRztZrAs1iq
 nMdNbqpxt0qbZLJ4SCwHx0YOOPeuIw7pgrcGgRhZy8GZAb2jRJGiomKmUNxmZWsi
 jLH0R20DZ/Zt+t/mAooQzIZ1I99RlVqfdYmhhT0Dy3IPcC8kaSBg8vkQSBs8VbvX
 4Ap1lb/kMycBkqrAZrI8WDIVxHFqaSltHWRdennRthYKtBrNwHW19tYiXPT8SGYh
 OhLqLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rt82b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 16:13:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4768656f608so77615261cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 09:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375225; x=1746980025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=;
 b=BXg+FYFCVAHEJn+AuSYJfANY80COAoTATM2s7UeiO8Muq88ZELc2Ww6d2Z5IjX91Ay
 J91iKJ1lF/4FVGlsZUbyVMqihI2xMyNyjYu0GedaK7Rr3BYNCKUuQi+d7fHnfDZN8LPA
 CyG8l+XHT2/2Y/UDCN6Mqt4236qO8iFWtStXXp7/YoIZqseYJLyTrxqsgJvVgYcq1PRV
 p8kJZG4oWO1q/iRACDJgmJ2+964MQSdcMRrwTNgXe24cvBFeL3YonkPJDAnpwFocyh+a
 bh48UOxxm3pN/PwUphE2zYpPcIETK9MnFgpUMdKBcgKly5seA+Uo50UnLObcMf5Sf4Tp
 7TQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9x5ToMmAb1UIBJm2akg9tIeLC4c0zTScAnt/aI1p51PxDwEc+NBiRX+MVATG/UlptC26jHVs8/uQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtDdqZRZO2Phs/2f6Q8Ws8OeqsVcViBgIlP/Kn1pOxSt8BA0wB
 cqLy/qvSzFmGX1J7xoU3TVlwRj6AfXE5FDLhe97GAdo7ICye/UK91lFj6TpL3Ktf1r8zAXRHd0s
 YGCDTI4Iv3AAJvYs07LmUdqnVoXaJFdpKk65QJi3nEnVHh139RmHToyIJMdF4y7/0EjY=
X-Gm-Gg: ASbGncspXzMQzSFMsmE7kqIhsVnUzJQkxKrk9bMmHaxbN3rRBZLMQIGeMbZroOVM1dN
 +eHKdoQ45b4AVmMc9iwLvY/O9VmE4Eidj3wb3Pf2nE4QNeIXjUFfXz8EXplHJcZ/pCNdFhadGCG
 wGfmmhBjI56jvhxpSw2Bg2Yw6ZnBp9dSONKlDXxbklZ539YiKBqLXHA/nXFTfjYheQeQSA8vIp5
 DAc7BYu/d/2BAxylBCPrKS45y8WcyAt414snik5US5gU/g452S3KFuIj7YjmZlp836vfOr7M/NP
 bt2rtzOO1IerMmhXVuPrwLkOD4l46gT6ucvHw/MH+LutWbMjlsrAPEb4c1uAr9/i0wzxPZ7p2d7
 sIn4Ve5PY9qVKg4e2NTM4a26K
X-Received: by 2002:a05:622a:1b8b:b0:47a:eade:95d3 with SMTP id
 d75a77b69052e-48e0115d91amr64683991cf.33.1746375225661; 
 Sun, 04 May 2025 09:13:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEodRLHLfsZWcNzptQvg9NDQY4Nk8aia4aLV5WiHHWopfrsacCXqFhOTDBmUdTbnXE8qdnXrw==
X-Received: by 2002:a05:622a:1b8b:b0:47a:eade:95d3 with SMTP id
 d75a77b69052e-48e0115d91amr64683641cf.33.1746375225283; 
 Sun, 04 May 2025 09:13:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7] drm/msm/dpu: allow sharing SSPP between planes
Date: Sun,  4 May 2025 19:13:26 +0300
Message-Id: <174637445761.1385605.4846218535199859363.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
References: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: N1MDfR_MJe4JnSb9pSAnzQdsNpI5TL0U
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6817923a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=-ylb_1dp-gWGt-a8D6MA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: N1MDfR_MJe4JnSb9pSAnzQdsNpI5TL0U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX1WzjpxXrTpXi
 OFqe5z1stEjohEiBytn0oxIQ38ow1rTKSRW0+KCrFgvFv895hbVdvvoEMFvQPd2bzlPWtBgrh3N
 Ys4zfZI3HtYvSR3Lw1e7cqK5U/C0lt52Vdu7BhVWigWYsqpaCPuRxRf4vpJ4ajDNfF1/r8B+pIf
 irTXBGWO9S7DNsOpl3vn97SGu1dAU+3PSKFUuPVCBXk6dmEP/GKeCyrlAndwgVLqzDtz/+ckE2g
 EIWSc7fdei3pd421dlSLzIK53G0kbHG+j9P3y5gfREEW41/IDiZf8/v0L45575E1dFAaF0OMlSu
 EVpOx/Ybq3Y1Hl9pkeSflcKwrFZA7OMJGYwfU7rTsk+akw33xW7YWFlhAQCP6rG3D/HRUa6T9pK
 sjoNLVt3t/EbH8BeTC2aHKH0xilpMiL3uuSg43QuacDSaq2bNWv4cV1E2Fi2w36vJsoExHJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=658
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152
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


On Sat, 26 Apr 2025 07:51:17 +0300, Dmitry Baryshkov wrote:
> Since SmartDMA planes provide two rectangles, it is possible to use them
> to drive two different DRM planes, first plane getting the rect_0,
> another one using rect_1 of the same SSPP. The sharing algorithm is
> pretty simple, it requires that each of the planes can be driven by the
> single rectangle and only consecutive planes are considered.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: allow sharing SSPP between planes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3ed12a3664b3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E0DBABCDB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6406910E503;
	Tue, 30 Sep 2025 07:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hshRb6I+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAD110E289
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:23:58 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4Hjme030731
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=n9P8C3EgLujC+SyMjcSHJMVn
 TiYYgF5ShDLErcRG4l8=; b=hshRb6I+JHtIlOsVBCil9QBuCchiZ2SvX49aR691
 j4cL9/QnIkuDfSpqQfv3+WCgl/DPub0oI/kSe4TthzAOFULW+uiCdcogm52iRZQT
 ZJZMdP9SO4crLjRvGAKOwb8uPNXgd7fEbD0GWG/Dy4X0ITKMT83EHGCT01XV5xWt
 v0FyH5XcS92EFEQ2jA5VleBvCdiKss+wqWZsuoMPqfd+fXQEoo8AZI4ejb2ings/
 i83BZxxS1ABWC/x2xWYdwe5BqWPAxA5t6rGFisSQg6B9zYc/1EougHlhZ0oINwMM
 cpA1JPQ23+P2stdnT5+A/9rV6lpQ0hvJ45owHmpF6LB7Pw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdftnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:23:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-828bd08624aso1095316585a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 00:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759217036; x=1759821836;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n9P8C3EgLujC+SyMjcSHJMVnTiYYgF5ShDLErcRG4l8=;
 b=HQiGXY5wyRKjvs1xsvhg59uHqyPEf5oyi7P+QIokvdzthao0cEetQdZeAP/GwqYrJp
 HegN5YW70W5V17VNxWJexcGO0/vNApPTEpUUL3Ht3j8MKgHs9kjTTuzNhOtzLjCRSCP4
 PPWMMWdiqzqOXE18p4B9NabRUEzhv08RJ3CHQBCKSbZhlLkWbhjzJ4hkB5gDMzVCgz0t
 40+O2AbYrcYZQvK8/86jGvlZIwjb/3WgXdCHmi/5OZvgk1H0nODzOzPqWjg+JOrRNURq
 8iOMyt9iugRWTh/NPt7tOAaq4OlvQEcNr0uXlPNn1YdVV9qRRl09fxxKxNzprZcAL7Qu
 6Fdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtghcKrw8peOvuPW020RTW98egoSl0S/PgSrt/S64cP1vT/2agIn+t9gQ3/3tDis+mTSK387k1Ing=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpHrph6EFKYdFQxt8aXIjvgHxbtrTo5Js3O5ucccBLqFpvVbzl
 TzOC3FkYpj7vmBz086X/nuFY2nE1CrU+tdYxNMxl7hk6v75WkMdyjpft1WLFTXLloSDMoiVWtD1
 MX3tUOuRAq3jGzmjZ3cgR0XKumEHvpEVac40OHSviUsgLhKERHpnucrJBJGX9MA/kBVqK+Og=
X-Gm-Gg: ASbGncuF/wymXYj2w7qFzBPGkcMUwBi1PKBL0rjnnNdoJaMlmw/PahOke/djp9LpOPy
 QoKv8G4yP0t1e3T9i7XZftuHz8zRN2E0y7519QRJdEBvMdcpmdvzLqJ3gX4i+DaGgRAXo1GsYCI
 XoD5YB08nl2x9iXMF+3Nggq6q+S/qpUztbcTU3Vf2tsVfmZBkH7kcyHd/JMhtaXKwbbvdE8C01R
 ZK3z4H6uv5VlSvSUeK5usJq6Qd41eI5TQZWA4mdRU+Dbc45OicKbG2X3AaWFG4M/eHll+3Iw7Ry
 G80g0UpWtswEbUQc7ZI0XGVck5LVIp20MRxn9CTaKUmyXkbr/JeAkr/q0eoB7TcF9QrZ9Jp3ITp
 VpXcr+j5ZzkODut2bg4HGIM9PomJhTTcrN7z5IZr3TAqMlaCPzJAQg/qc7w==
X-Received: by 2002:a05:620a:298b:b0:82b:3bb5:5e03 with SMTP id
 af79cd13be357-85ae033ce46mr2294501485a.30.1759217036304; 
 Tue, 30 Sep 2025 00:23:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtokqh05kg7AoFYMORm7EciWzypwxfanES3STHoDORc8Badi06y8IJ5mTLaRxU8ZjwP/+wMA==
X-Received: by 2002:a05:620a:298b:b0:82b:3bb5:5e03 with SMTP id
 af79cd13be357-85ae033ce46mr2294499785a.30.1759217035829; 
 Tue, 30 Sep 2025 00:23:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb771023esm31994681fa.41.2025.09.30.00.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:23:54 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:23:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Rebase GMU register offsets
Message-ID: <s4no2wy3yskk6l6igtx7h4vopaupc3wkmu7nhpnocv3bbs4hqi@uhie6j7xr2pt>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-GUID: F4Fq-JrayP8lC0M2jYbTxXTqGLvIUCOC
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68db858d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xSz5tX2VPR3T1CvqFR4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: F4Fq-JrayP8lC0M2jYbTxXTqGLvIUCOC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXz+W51JMKayKk
 rk8Aa3MC3TcvzOQkTsAOa4A67/uhQkDEPlKi9n4ZckVxV29MF2UzrB98xr0JRtqkyo0YbX6Xfse
 P9RBrE+QwooXbfhS8LpkN8K9TcMmePw+2FgJ/U816Aug5dg/i5XDkQ7hTjmETnfPyRjY32wPPr1
 KYLuSmF8ZAk8TbQmtgHQMtexDeXXORhdsPySvcKyIzikO/SaboujsFiDrmoRcPmrCoe4gT3Ivgb
 GLng050gSlCN9N5vdPi8avheAQW6EjYpXTj7cQH9b6/DqMd2xDuMY990GMR/VAamhdrBsv2Tyqx
 FIwmKGEIx3nVIZP507ONSSFa4Pd3nwpcaB+2bo1p3Rl+D+nEb9kbXTvqThe/8TFjA9B9OeGgkMp
 dh9ggekXBtwEGZGHEZK9k6xxIYMzHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
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

On Tue, Sep 30, 2025 at 11:18:15AM +0530, Akhil P Oommen wrote:
> GMU registers are always at a fixed offset from the GPU base address,
> a consistency maintained at least within a given architecture generation.
> In A8x family, the base address of the GMU has changed, but the offsets
> of the gmu registers remain largely the same. To enable reuse of the gmu

I understand the code, but I think I'd very much prefer to see it in the
catalog file (with the note on how to calculate it). Reading resources
for two different devices sounds too strange to be nice. This way you
can keep the offsets for a6xx / a7xx untouched and just add the non-zero
offset for a8xx.

> code for A8x chipsets, update the gmu register offsets to be relative
> to the GPU's base address instead of GMU's.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |  44 +++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  20 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
>  3 files changed, 172 insertions(+), 140 deletions(-)

-- 
With best wishes
Dmitry

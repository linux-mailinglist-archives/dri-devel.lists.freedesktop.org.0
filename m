Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D50B41A13
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 11:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F5910E660;
	Wed,  3 Sep 2025 09:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQebEawf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099E710E672
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 09:31:30 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5831i24Q020050
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 09:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R11J2ZPvgur12OjpaY/ZBN77+0uB5Jyxu+Du4WBbtJU=; b=nQebEawfeJJnuXoR
 oYb9e0BDMX88zWnTCjsF7RF6K4CiWoG0eQaks94P1AOzf62xoxfRioKg//b8fT9X
 fP+cikewvFXxRHKyqCKbk6k9DsvyB/DbI679LULgbnnA5SDlCQvQxR2ywD+EtRFv
 dfdRvo4+psm8oJqYiISEjExTEU2olybDvUQT+EkvatX1rAakhNK+aFUDlaHAxqgS
 eGnySm59KpzSp98H9OMWwvs9kKvidnq3ZHMIMTDmWxRZzcTh7+XO4FilZw08cXEe
 g2sPvJq5lY6Q3oxlKed6nJ5bG8voYlnRsi/0MOfmZ5IaHVbDBalkp7eeI2Cv6uBU
 BBhlYQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0336g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:31:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-726a649957dso1650736d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 02:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756891889; x=1757496689;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R11J2ZPvgur12OjpaY/ZBN77+0uB5Jyxu+Du4WBbtJU=;
 b=J8vOtGPc6g8jYkbSzAvCwk++gzo6SEClt4Cn7Vs9392sqqU5NvZKx/x43OVUi9ZX8m
 DQdJtuy1dfAbM7e2aToUqg3GCnYN4jxnc8BSzllg18bOD15sbIFahDhTzkEOW2ghcVGA
 Xd+H2gYl1pVnZ5rHMa24x5Ug1X/XTDAOc8ijaU/kEM/5XD8YTHsOXHnfbvH4O3r+a9Qf
 OXx26k6adrFxgFtYIGsEbxR+pkvDLJ1+WnHHCar38g4bBYgCQB39Uf79teztSa+AxPfT
 vOoADZGsUMQtlhZih7QvwCDFBF4bqwxTt9VCwYHH6aPnJeszZofhNLjgGrICeQgWDNgF
 wV+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ4QvxW4E22XW6vDGfFTJCb7Hy5EX+HeipQOwJp91KznDuzLbeJlN1ojKdOTrkgsvsj5FYEnO6ntE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbIZtxK7Za8/73KRvhBAYnb17k3q1SrQpar4smYNUGT0s90bFc
 tufHDCj3Btc59VOOIjxj1pIpeALt8ccLN647pKCeoiCbLn5vWHI1i8Qhr1RZjcabmnFL6FeFyNZ
 flJbn09+mGOfgObOD4PNHh2qFLu71B1xTj8T3EEN3qwDPhIqQLYmYNy77bBE7Cpf40Dkpm8c=
X-Gm-Gg: ASbGncuCEatMsPFECW8WKOmkQMVSJQRS/u5XQwKdLRcr31oDqc8+6CZspU6YI5yxQfW
 M0CnbD95i8+p3gr4LUbnNLmHqNwWsL5NhvKAU8L1mCTn5hiq1b8RlTLY89w9byS6TBT4XptsJHE
 ByD5sBSIj9bUROFmAD7aW5Opz4ZoZoiJHKMsV0K7klCfLa1R7GTMIYwl9EFhrl5sXhhiZQUXXn6
 0reOmkNZ1CxVhNWJncmWLToI7u0zAamnvBthRZ4qJ+crSf2Aw39mXpYY6rnb9CkHpjmfwvox7SP
 COJCZ4fS1X86mcpnqYil29jmcJ+vDL3aa9FBBOJaxBHkquHVwR4P0Y2GjCiUTzyh+4dVL4BPLuv
 yNfmaYiqVLzZfX6flSsG/vf0f/0LG2xuM+V8+hqG2LaLvjqEhFnKN
X-Received: by 2002:a05:6214:d87:b0:71e:d4f7:b43c with SMTP id
 6a1803df08f44-71ed4f7b6fbmr81039116d6.18.1756891889143; 
 Wed, 03 Sep 2025 02:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpn1OxrJPfcU6oHH4NoCR91bC/412PrDtsPmAKHu53l4V9VVcrDS9TC7zY3OUCJn7dGPO9ng==
X-Received: by 2002:a05:6214:d87:b0:71e:d4f7:b43c with SMTP id
 6a1803df08f44-71ed4f7b6fbmr81038866d6.18.1756891888652; 
 Wed, 03 Sep 2025 02:31:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50b0e98sm9071431fa.60.2025.09.03.02.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 02:31:26 -0700 (PDT)
Date: Wed, 3 Sep 2025 12:31:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: Add GPU cooling
Message-ID: <tjdqt4pgagy52xncrqk7dkjjpsfqukjbthrgpddjatfkd3xd6g@7vglhah32f5x>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
 <20250903-a623-gpu-support-v5-4-5398585e2981@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903-a623-gpu-support-v5-4-5398585e2981@oss.qualcomm.com>
X-Proofpoint-GUID: EXUklAJZ9mm_hquGjSE0DQj2E4FoOfGo
X-Proofpoint-ORIG-GUID: EXUklAJZ9mm_hquGjSE0DQj2E4FoOfGo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX/LYu5bviIfqt
 ZMisS3fFTa95O9L7JiOptypmbEAKOVMZA+s/i0J/3PSzZxl4mQjPU6hYYRSzUFVJt8V8FY8SoqG
 g1srsWg6r5Hqv+0KjJakOPOyojcDzviuXyENW721qVmjDQKuhcXbOnlwIvaGyecka8DWpN1bjPJ
 dWpFiKH0CvQ7HvDhgSRfDxJfPXD69BmHGAgCpifL+0TZ4cuwhLGaKsYdNMWXoWKpjAn/ZsN3pnn
 G/n4aug0wZiN5yLyjP1KYlX/SWbW1g49gAVDpC0xIEGtaqNPI30jjkrbh3PC7OsSFpPTekY9HxM
 IFfLa1Rw/MsVSOhlyxbKxK6sM4WYL9ljwsCJj255sMuggZN52gvEbmt4j3z0iyHz+rwpsU+ec6/
 7rVRSB0b
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b80af2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8h3n1EBGBd86Ebf8828A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

On Wed, Sep 03, 2025 at 12:49:55PM +0530, Akhil P Oommen wrote:
> From: Gaurav Kohli <quic_gkohli@quicinc.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 115°C.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

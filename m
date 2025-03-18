Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF477A673AB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 13:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3853E89131;
	Tue, 18 Mar 2025 12:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQW8Mgan";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC46C89131
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:17:53 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IB2gJZ011301
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FaaCN1q/n3kjQfPqICNHxVDL
 1mCCzIPacgi5zEqisuI=; b=LQW8MganX/bSqJMTX80JL/g4gJtfrPh1JKfpjZ19
 q64aUn3bocVCCL0XROtkvcwFD2VAfY8AisoTQNcvodZh2bQOQ5RG7VQogsS45D8q
 OobdY3EFwWYqZAPv5ZD2k9IOmddEYWdsVt1EVLd2EEJHKEewEXyYNdxacuFQMH7q
 Ivq7XeWZvcAEoCxNnC5WztUEEsVrLa3lDVZ6V9FrtPdJkXKisYjTT/7F1G8PWy2v
 EXNZY6wTqohJU9Jk1UcQkRb/7aay3c30yrD3YGPlriTZwapbO+9cEvJiDevm4HoN
 IFcmG0etoCmLESBMAF475MfL2gAI1S/hBiKHdYnyEKPErg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exx31qt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:17:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4765f7bbe1bso96270281cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 05:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742300272; x=1742905072;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FaaCN1q/n3kjQfPqICNHxVDL1mCCzIPacgi5zEqisuI=;
 b=TH4WbxhnylMNmQqYBgujsu3hXgSz5igbvZ1CY9uNtyiTQFy+KO4BujCRJsOSbiFWrA
 UalPHpcjRBFqEEJUYNrWv8jfel4O08xPZ4j1JvctCx7OOaqFPeV0WWN5tQhvH8EKdzwX
 jb8Tieah/24Fa2QKiMhpuIodIgTQZPixxk6nu8JfQCbnwUFADp1Eega6c7n4GJKotNtr
 kPdRZcKe8ruOs/MIssUyzlKjJNVD8o1N1czeEg0UaAPxhvE2Uh0bZK5NU/AngayuOWyF
 0dP1JIDlbp7qov1lMbgqeHHXCXqbfrnEIinE7ksiCyiEmvqLRYaAlbvMk6h8ZTE+MbBm
 6BPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRNqQj1jFlGr8j2Kjvulcb+51ixdqhKytV7ngTtaNNpholOG7qK3i1BwiE3qibrbWLcCzZzoimbdw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznZfwqh4bVT/tY04K46QfpExDEH719F9UHg7LDjYaYtx49df40
 nUm38yJj2UzBLMXpBrqtU66RTjmcCSFxGonTpDYhrYLVvw52pYMPD3KieTahjUPt46xLgVMbubP
 VoVbbHpHG0gwjPPMC8gReBkFjCis5JZJUUqeQnkd6ul3MhLbjGG+MZAYoggxV+TOaVP0=
X-Gm-Gg: ASbGncuVDXEs2arOpFUcqYLzegjBBxMp8MeBJXO6Y6Pu9riglRsEqRnx4s9AwCKjle5
 pMc4dg4cEoUZr4UOYh09qTaPEPgQ5UsoTZA7Dq8AI9lQKAlSI/2PkXMyJZQqbxtwCKJAOQrqIWJ
 zekfQ5fQIZJ9S71XlXYgMt9dDBmGrqHMNNaqnh62YZQMvkbp+lthTe/drWoEr8Vgg8gBlqaO+6J
 rEuXTnAaV8FEwFaMRCv98W4v171mq30j5Pj0MySrER6kM/3jG9PtSXv0QVKp63Qmq3xonMPJ4D1
 Tap2fRdVav2RFPUBwoiIhCk4ni1FzMqW79ZI7eHtasIi8StJYGWmjmhdstap33o3NNSh2aJBFGj
 x0Lo=
X-Received: by 2002:a05:622a:453:b0:471:cdae:ac44 with SMTP id
 d75a77b69052e-476c81dfaf8mr248672561cf.47.1742300271840; 
 Tue, 18 Mar 2025 05:17:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPpyCMBm/+FHacTciTYh4rtRvXfyv+VeST5ueZfSRLIXQQ10PAbp2U7DCjEI40J7DQsicDmQ==
X-Received: by 2002:a05:622a:453:b0:471:cdae:ac44 with SMTP id
 d75a77b69052e-476c81dfaf8mr248672001cf.47.1742300271483; 
 Tue, 18 Mar 2025 05:17:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba8a9525sm1640499e87.238.2025.03.18.05.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 05:17:49 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:17:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/9] dt-bindings: soc: qcom: add Smart Peripheral System
 Interrupt Controller
Message-ID: <fr2s2ndjzyd2z7m6bsztudyb74a7rdvunehb6qfu6ar3s3i7hf@x7fap3clhlbe>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-3-655c52e2ad97@oss.qualcomm.com>
 <20250318-dandelion-aardwolf-of-radiance-695fd9@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-dandelion-aardwolf-of-radiance-695fd9@krzk-bin>
X-Authority-Analysis: v=2.4 cv=b+uy4sGx c=1 sm=1 tr=0 ts=67d96471 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=eq-DVYtN1lDvlgNQnWEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: i5B-gzgS37nIV498ZIZFmuwLtfhKtntP
X-Proofpoint-GUID: i5B-gzgS37nIV498ZIZFmuwLtfhKtntP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=588 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180091
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

On Tue, Mar 18, 2025 at 08:56:46AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Mar 17, 2025 at 07:44:38PM +0200, Dmitry Baryshkov wrote:
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sps-sic.yaml
> > @@ -0,0 +1,38 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/qcom/qcom,sps-sic.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Smart Peripheral System Interrupt Controller
> 
> Interrupt controller should have interrupt-cells. Or this is not
> interrupt controller...

Well, it is an interrupt controller, per the name of the block.

> 
> Anyway same comments as for previous patch.

Ack


-- 
With best wishes
Dmitry

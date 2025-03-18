Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E975A673B3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 13:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D1710E472;
	Tue, 18 Mar 2025 12:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmFSr/yi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B580910E472
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:19:10 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAepGf022120
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hILqfklUi9PlGDk5cSktWHoM
 g/OfnafokmfjRW4bYAE=; b=OmFSr/yiZh9e8LVMgaM1dN/BUH35vbio+fXb6R+W
 d91HTV21fp44jHQ2j/zv0s5JZ7i5Y7rApUEXJFwwy5ez8nHhv01tMXVV9X7/VXq6
 4jpTQjaCgszRbXTaBgFcrJGpP2CS2ToxrZJsyLxaygvuCaYlfsYBwD29BW39h3TG
 7We9Xekrmq0UONcUsFd6IJg2X2083C8kYFelNlucCjI9zl0pcr4HwN/uj5SBCX2K
 t6zmhwdXCjQ53SRAOWJ8JlNV1Yg2zVYhgCxgXRDAIH9V59TpWdI6kvUkYX2cHh7L
 6Msuh+7r+5UTonzy+UjbV3v6oivKh6ATkdj+loO6zSczvA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx1qjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:19:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c59ac9781fso201834885a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 05:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742300347; x=1742905147;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hILqfklUi9PlGDk5cSktWHoMg/OfnafokmfjRW4bYAE=;
 b=Ym5YOAYWhLNRsP1Yd0ykWG3Ub8zPFaetBCC1gBxJtu1meRXsc88jaFhit3l+ZL7UeT
 zzlthdkP5G1OM+GfRNNCrKINjc8CrXb7j1uBskKKczu9xMXE8Iru5JeXQEEf/+FCI4rd
 8+IV2vWX8Wp6yFvwy+0XMrwywoqKwUGadD8IIXdxcrwzjLMOQxqps/WIB1hWpNLqHtgr
 TlxdmoOJBhTILnLzdrBA+SCfoNx8j5dpjBCuRyS+4VlxWT1jMhqyrEzqCtY7SRwX07FW
 4TWFdc9zizNvlu9KODCVuw1s3GWFBq6v4V68kvnGXQn8DI8yTa9mwaLxbFtfFryKXRay
 E4sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUzGHZO9ucMjYF6mvh/cJjLbYKuvFcMAiQTv5FMm2PhT40IcAtGCzbBQAOG83Mv63h4LxblYab1bY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykcNizPLriEC2LTKD9vhfoVEneG2ldM4C1CTtJAMIXnjqLnJo7
 wTMgmspfCup3fDTBPTVBjZHxyvDE8GF2JBmsLDd23oJnFd4sneYt6goWTEPSw5vlkJSGnYfXZCN
 ts965T3lxomHmYJL7d8Yf+A2gTjMt6qZkpYAZd0UJLejJOL5lSGz7hpLdylBhDvLfo4s=
X-Gm-Gg: ASbGncu9s208iJzaMEDyXokJQMbvhdmbdWNcOf480PpEfReB4yl/AL03bozWxw5s79U
 2jAlaH35nFATLhAxWePqMQVv3/1l9L5ZNHU9ex5RSxBYNDSsy7itOtIvmGAhRhwG+vjwYQdUZyg
 3M0M6K0bWcg1YK2Z+wisPpmwpy3zjq4wXoYAiPG0v5B2K0Zaim4XiSzSAgGP7JHsLlrkXPFV9Hl
 6H58d4Q5EQ8UJmeqaTmic7zbilyd9cWD+kMpxHks4cVcQnnOsZgS3g3adi4uLJKGHXRNtxavOeH
 MKJWdssfx6LJpRYZMsWZu9ODJ5I4N2jBafVS4ER56ucBRhvTFGnc1q9AXc7yegQCuR7A88axlfI
 8Fww=
X-Received: by 2002:a05:620a:288e:b0:7b6:cb3c:cb81 with SMTP id
 af79cd13be357-7c59b8a96cfmr452958585a.18.1742300347415; 
 Tue, 18 Mar 2025 05:19:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJww/OeoqM71hDROPaSNOo2HPiouKcRNCZZrYVpQSl8tKKuN/JdG5hgHf15pqrGPXeGO/1Vw==
X-Received: by 2002:a05:620a:288e:b0:7b6:cb3c:cb81 with SMTP id
 af79cd13be357-7c59b8a96cfmr452952285a.18.1742300346954; 
 Tue, 18 Mar 2025 05:19:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0d2601sm20203871fa.2.2025.03.18.05.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 05:19:06 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:19:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
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
Subject: Re: [PATCH 4/9] dt-bindings: arm: qcom,coresight-static-replicator:
 add optional clocks
Message-ID: <klcggfxrhjqty4rktx24xmnosqnwzsbyfzgv5ea6okqbffyswn@5yei6276hlla>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
 <7b0af57c-a38c-4c30-9bb7-efe511d6bd1d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b0af57c-a38c-4c30-9bb7-efe511d6bd1d@arm.com>
X-Proofpoint-ORIG-GUID: Aie63a3dcTKJcYJZOxJ2lojmnR1kI8GR
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67d964bc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=thsJD53E2aUhtArdJCMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Aie63a3dcTKJcYJZOxJ2lojmnR1kI8GR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
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

On Tue, Mar 18, 2025 at 10:38:17AM +0000, Suzuki K Poulose wrote:
> On 17/03/2025 17:44, Dmitry Baryshkov wrote:
> 
> nit: Subject:
> 
> s/qcom,coresight-static-replicator/arm,coresight-static-replicator
> 
> > As most other CoreSight devices the replicator can use either of the
> > optional clocks (or both). Document those optional clocks in the schema.
> > 
> > Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   .../bindings/arm/arm,coresight-static-replicator.yaml          | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..56e64067ed3d63c5e293a0840858f13428bacb45 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > @@ -30,6 +30,16 @@ properties:
> >     power-domains:
> >       maxItems: 1
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> 
> For the static replicator, you don't have an APB clock, as they can't be
> programmed. It may have an ATB clock. So minItems 0, maxItems: 1

It can, see qcom-apq8064.dtsi

Also minItems:0 doesn't make sense to me. I'd rather keep this as an
optional property rather than requiring an empty set.

> 
> Suzuki
> 
> 
> 
> > +  clock-names:
> > +    minItems: 1
> > +    enum:
> > +      - apb_pclk
> > +      - atclk
> > +
> >     in-ports:
> >       $ref: /schemas/graph.yaml#/properties/ports
> >       additionalProperties: false
> > 
> 

-- 
With best wishes
Dmitry

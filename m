Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C3DA67F07
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 22:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B8D10E4D2;
	Tue, 18 Mar 2025 21:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4DEoCaJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4143A10E4D2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 21:44:30 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IIBQB9005360
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 21:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1AADZSfOJp1nqwWbAo5LBvnE
 CeULh4CN3wu8KY8UPqc=; b=J4DEoCaJzOk2VyeY5U33+eaH07Vb4XSJW1StC9Jy
 ykt/CDU29tYbROqazvA/NfwJCPVLCfsAMabfxoMyYDsWGoqmRsLXSeKShPqpcwki
 /abMPu2sHFTsJCTx3DEFyiIby/RmD/lweeAGjCJvnQzHo7gnltZW4iyWDzDsP/Sg
 dNM21EC3bp1CX3EyRktIkG53OVCXiiquwT4tpbkkCggLMG3zdorsxzbcpd5HBhtl
 yqoYZJUITMTDB065MF2NqtTDV5K8Aoz1TEJT5exag9p3Gyg6LvfCMKuRTzGESRDo
 IIcDBhsuHlnT/7hY/xaLUjS5Y6tPvEarTBNZJn04ourB/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdvxge7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 21:44:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7bb849aa5fbso32678185a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 14:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742334267; x=1742939067;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1AADZSfOJp1nqwWbAo5LBvnECeULh4CN3wu8KY8UPqc=;
 b=rHQwdJsLIrng67gzwLmwv/bGskiZCgBCg+513XGMZfizEGTE9pr+E+r1xg7ZZfMDKo
 ZD11eooIcWMdGXwS0F/nVgqRO9fj6HYHnjAzBncNX35xM77EuzlgE5DkYrVEGKDh2G2g
 HKNIHatM+0dnVA4wx9xR47Sf/kcfyOaWhzIcXtr2d5+EW8UTN9U2xEvPBCncgGP/8Qk2
 9ginKuQK2P6y7hNhf8MnQzDhPck2+/XMQAtnxQ6dztl5PvjH9PeLJBzH3FndYLtwovsX
 SXQbxJv9OvYg/4RG66eMT5TJjJ87nYBMRxyoKinKUoh8EYYiWk/dhvZB9GFK9yiwZIjG
 P8eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8Cp2UGIOA5sV4h7dbDj4P7IBbk7BxVHTHFeoE80dFfC2jMtkycpuMThcqqdpu2BZDAhbgwIklFio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ1Uf6BlmCymnpjxpbh2s/6oZqfwMDFPKjV084o6BxqrH2ttCA
 bhtjZnWpJu7b38bbk2m3JiwlcweH0EloFKvf1/oBu2n5O9lpKe36MOTaQLR6K6Gk0zrFy9iCpnK
 oYVCYyvsyWqCZzUeDp2ZU6kW7LVyeoiIweg6J1E3EwcnQGY5Fi2k7Btd8UvSabWu/hHs=
X-Gm-Gg: ASbGnctmUxI2j9EhDw5LO8CKqFh+eqyFOReumJ0wae7Jx/gxSQh6yd/xiHuvp4091e7
 E82onf/bJYAeQ8hSeZrvkDorVn4n4O45Zy6uDLxYlYWZlm+G2heJN33qbTg1Axm8fS0CG+D0hLJ
 9r6DiLzE464QcL7XxNYK/reF5sKWbx4GN5UhQU813OxATl+jD9JB/Ge6KFvWe9NOgzxFyY1keq7
 jfYPnIfGoqZCkTe0TV7H9nBchR+aDLRPggFhEHz+GMi3dGAwVD+ABrkt+kJxF8KmaiEn0Ploo+q
 mi2+98eMWluBXt/puNNecrdwp2F/z2gzG+0wLeHh1uCPRYsVkD7cdoBG3W7wsD5yFFAQujTs4Id
 K8Uw=
X-Received: by 2002:a05:620a:4482:b0:7c5:5a51:d2c0 with SMTP id
 af79cd13be357-7c5a84a2371mr32780885a.52.1742334267639; 
 Tue, 18 Mar 2025 14:44:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6UtxUCzUOH9lP3JjinEPv01rFFWt5zsaCfHfEx/eMPLwAv0vPpL/ftuphg+XNF8apY83cqw==
X-Received: by 2002:a05:620a:4482:b0:7c5:5a51:d2c0 with SMTP id
 af79cd13be357-7c5a84a2371mr32777485a.52.1742334267258; 
 Tue, 18 Mar 2025 14:44:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f100c39sm21020321fa.48.2025.03.18.14.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 14:44:25 -0700 (PDT)
Date: Tue, 18 Mar 2025 23:44:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
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
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/9] dt-bindings: arm: qcom,coresight-static-replicator:
 add optional clocks
Message-ID: <3ibbttdnygwsikfm2anusyrg6zoghhlj5sfom2f4ujc434dg22@xa6x5igbrbmf>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
 <7b0af57c-a38c-4c30-9bb7-efe511d6bd1d@arm.com>
 <klcggfxrhjqty4rktx24xmnosqnwzsbyfzgv5ea6okqbffyswn@5yei6276hlla>
 <eeff769a-ff81-4017-9738-98ad130980a9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeff769a-ff81-4017-9738-98ad130980a9@arm.com>
X-Authority-Analysis: v=2.4 cv=SKhCVPvH c=1 sm=1 tr=0 ts=67d9e93c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=J51RNj2YpcLuybvcX6kA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ufuPoYdzRSg2mBZsGg9qsXFW7hJhLf4N
X-Proofpoint-GUID: ufuPoYdzRSg2mBZsGg9qsXFW7hJhLf4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503180157
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

On Tue, Mar 18, 2025 at 01:37:23PM +0000, Suzuki K Poulose wrote:
> On 18/03/2025 12:19, Dmitry Baryshkov wrote:
> > On Tue, Mar 18, 2025 at 10:38:17AM +0000, Suzuki K Poulose wrote:
> > > On 17/03/2025 17:44, Dmitry Baryshkov wrote:
> > > 
> > > nit: Subject:
> > > 
> > > s/qcom,coresight-static-replicator/arm,coresight-static-replicator
> > > 
> > > > As most other CoreSight devices the replicator can use either of the
> > > > optional clocks (or both). Document those optional clocks in the schema.
> > > > 
> > > > Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >    .../bindings/arm/arm,coresight-static-replicator.yaml          | 10 ++++++++++
> > > >    1 file changed, 10 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > > > index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..56e64067ed3d63c5e293a0840858f13428bacb45 100644
> > > > --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > > > @@ -30,6 +30,16 @@ properties:
> > > >      power-domains:
> > > >        maxItems: 1
> > > > +  clocks:
> > > > +    minItems: 1
> > > > +    maxItems: 2
> > > > +
> > > 
> > > For the static replicator, you don't have an APB clock, as they can't be
> > > programmed. It may have an ATB clock. So minItems 0, maxItems: 1
> > 
> > It can, see qcom-apq8064.dtsi
> > 
> > Also minItems:0 doesn't make sense to me. I'd rather keep this as an
> > optional property rather than requiring an empty set.
> 
> Interesting, that must be atclk in fact. Because a static replicator
> only manages ATB transactions. It doesn't have an APB interface.

Ack. Unfortunately there are platforms (and grepping revealed more than
just APQ8064) that list the apb_pclk. We have to support those DTs :-(

> 
> I am not an expert in DTB schema. But the point is the clocks are optional.

This is handled by not listing the 'clocks' / 'clock-names' under the
'required' list.

> 
> Suzuki
> 
> 
> > 
> > > 
> > > Suzuki
> > > 
> > > 
> > > 
> > > > +  clock-names:
> > > > +    minItems: 1
> > > > +    enum:
> > > > +      - apb_pclk
> > > > +      - atclk
> > > > +
> > > >      in-ports:
> > > >        $ref: /schemas/graph.yaml#/properties/ports
> > > >        additionalProperties: false
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry

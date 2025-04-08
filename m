Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D78A80209
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 13:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D860B10E674;
	Tue,  8 Apr 2025 11:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUpQTWNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408C310E674
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 11:44:25 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BUf8j008171
 for <dri-devel@lists.freedesktop.org>; Tue, 8 Apr 2025 11:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=QiH0xgG4cw0AZfAy/Vvm2ZJJ
 V+VbLE6k/8voYBHRRpk=; b=EUpQTWNF0QGjiTo5X2CUR/GYtBQCAM9kje5bNJN9
 7w6PzBw9QzAnLVlko7o/QmN5PcSfHqy2A44CsEXISrPWbijoFz+Dn9C6+SJIyudi
 3SjrY8xKY7uSwSoQNhD7xLhUIPW7K8u2jEEwa16LB8F6aneBmvMJT8jc3rD+MWqr
 xagh561hbh8IWhPdTmtSzqXfVVSTnJnNj8s9COV7vvx9nxcwELPHgT0T6evxo9qN
 bOyanp+H2LMmb1TsA6EXlZeUcSDJ8KpdZ5Eg9ufPBJU03vQcwby6wwjL1AA0Zza6
 VT7j4O191SllL2CKQYz5bHsgjVwgcl2A/vcG2w7E53SY8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtayn91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 11:44:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5d9d8890fso1230178685a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 04:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744112658; x=1744717458;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QiH0xgG4cw0AZfAy/Vvm2ZJJV+VbLE6k/8voYBHRRpk=;
 b=CU0TdpE+ijxT1C/JZzXAQTZaa4FAk09bEu9w/3GRFTEMnkGbP4A1o5X0dEp7mJI1Ko
 SYPBvbDY8/IdPFnZuomYoCsCpJssC7le4FmWEPaqa5cnZ5TmwEc9LkhUJOXdpx3WMSIi
 uY5sznfefKwGDofbBcCJyGfqyHV11wBJG6Nesqdq5iw2/Inx9UIK9w8CKKO6iCEhdyUR
 G8BKsREj9fNCX9BSPbtJntG+GEARB2faGZqBH0WVPSPt96JKm8A51UL35U8rHlzzmpK1
 wNa4j4IndDVPsNmBf3xYa8lN7keXPjEPWI7WQ9uaFE56flEBZz1sr0L7vhC7WXc3FH3y
 t7ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOMEtvCpZ+6K6wpGzOwaVOPSy4ZA7dpe4eiSBTK1ty+O0OtC1ARGFdoACos/lOiD3Q+w2itZHxD/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxqkl26c7pt55uUpfPgm7JJu6rp/WmBaD9IZi/nJzLiSXrVpBYU
 j95vC6wofciMl3nenKYGNryYbe2LABansRGCyzl3SeAL9DJ8RHQl6i90uL0lLScI8Xb2bAAqx7N
 tHMfJR5IJ/FboYw9MpLcG0mgcEXnj9V5fUV6/LMshvjGqhsb3fAj8Ow+vIiEqZZKT1PM=
X-Gm-Gg: ASbGncsk4Fy8Va9IH4hYS6lmWEAhgbQBdk8X8fFaNaUsrXqY3ilXr69XxqSDhs6c/kE
 hHDD6/1A5CG1wHzPylPkS5scK/+ZJPY9E8Jj4sJkPb13IOBCJCBe1FsND8Mg/sft7FPtOANZQIx
 UCJdmcbBPMJxNyk4MQJ1YLiiIVRYq/GlGcbUSCB3inHv1raOOEfNu69F6CSWjbF+uGCNaVgPJDX
 CdtGJK2YGqI3i66w0Sq4sQylqPxkT5RwGySrNVxhHY4ss0oSMzYjOaq4NUbYkUkPdxBq3iD84tg
 Wf/FVo9hyLxNT04wQhprMfIxhjpddrX4s7Mj48PSbuAwg1Y/ahhCcqSoI6rmVnnDBlF/lPJBtdo
 pr3s=
X-Received: by 2002:a05:620a:1a85:b0:7c2:f39d:d0e0 with SMTP id
 af79cd13be357-7c79405806amr399834785a.3.1744112658515; 
 Tue, 08 Apr 2025 04:44:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9w/HQSwcn+z9yoY59a3SkR++9C/Xa/l18tIcBrY3nXcExKTwVPb0rBd71tZyAyXxczD6fRg==
X-Received: by 2002:a05:620a:1a85:b0:7c2:f39d:d0e0 with SMTP id
 af79cd13be357-7c79405806amr399830485a.3.1744112658207; 
 Tue, 08 Apr 2025 04:44:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f031246acsm19338721fa.16.2025.04.08.04.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 04:44:17 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:44:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 03/10] dt-bindings: display: msm: document DSI
 controller and phy on SA8775P
Message-ID: <zpmr6cpiixyu2sj7r7oqpqsge6dcqw6xszldf7ugznmcrxqsme@efiwnggcn5qx>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-4-quic_amakhija@quicinc.com>
 <20250312-calm-steadfast-cricket-fe9dd8@krzk-bin>
 <654d409e-2325-46e7-a064-ed9e64277e69@quicinc.com>
 <a168a473-c363-4041-8e3e-84fa44e92b10@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a168a473-c363-4041-8e3e-84fa44e92b10@kernel.org>
X-Proofpoint-GUID: -AMCDFMm-eCe-ShFIf29DO4IdXBROr5H
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f50c13 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=VUUUEbkTROAwnXgzEp4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: -AMCDFMm-eCe-ShFIf29DO4IdXBROr5H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=832 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080083
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

On Tue, Apr 08, 2025 at 01:03:53PM +0200, Krzysztof Kozlowski wrote:
> On 08/04/2025 12:38, Ayushi Makhija wrote:
> >>> +    properties:
> >>> +      compatible:
> >>> +        items:
> >>
> >> contains
> >>
> >>> +          - const: qcom,sa8775p-dsi-ctrl
> >>> +          - const: qcom,mdss-dsi-ctrl
> >>
> >> Drop fallback
> >>
> >  
> > Hi Krzysztof,
> > 
> > I couldn't understand the meaning of "Drop fallback", could please elaborate it ?
> Look at SM8750 example on the lists. Keep only front compatible.

Why?

-- 
With best wishes
Dmitry

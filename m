Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C5B32236
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 20:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A0A10EB83;
	Fri, 22 Aug 2025 18:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpuGHeU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3055510E0B9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 18:20:08 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHV8dU021051
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 18:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NxtKtumnK8P7jbCRmulzU2bs
 GNNl6vGrxyGS2XDmajI=; b=IpuGHeU4jrXI4gbTONzrAZjNBA3CK7V8iBxkC60B
 sj5U69qXm/weLcj1eell4vGtNtYrJ/EY1pqfDac2TlDKpUBlsZSEUFqMThAFz3dI
 PB7nAi+FUyA7uegSWpZ03reG70vEsYs+DmT+jHmDdqIm/vb70nQeG04RjGcbldUp
 KDVoeVy7/lUgc1zAd+udtwxFTvlbJLTsJG5nPGBWN36FOH7ln6o7k0coLlCqgf9q
 IgaPem2IJFvGh8FZADYK6QmqEDp1jAn66IT2uIEw0s8Zv7whlF62C9JKbk90oYCr
 ziV1i+Q3PLdv0hbvAZE2tDiMWSsWQ4/RlFd36Do2GuNbYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw13g4sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 18:20:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b109912dd8so23676151cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755886806; x=1756491606;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NxtKtumnK8P7jbCRmulzU2bsGNNl6vGrxyGS2XDmajI=;
 b=g6OgIotMIQTQpWYMFohbG9PTZ+ZCl1MFgi1V47i1+Fim0ZOKwGvPM+idKWDGfAPBgx
 6HnJKNb/A7KgjzHs0lumxiFgfQwodaQ31txO9VHxg6FLnS05tvI3tOIoDdnI1+aFLjK7
 GcFDi8Nu7+yxMINyMIhG8N47U8h+hjjiu+yEDYEDvQn7cPZEEitHGU9lbgom398E92Jn
 qYcHQTbvln33qIHlv4feY6HVZ5rQZQeDmp+efwbaMasMGlbpdUYdTkWpLcG3H1pTpqOJ
 cs3j99/zkY7apba34DFyvgHE3q3KqQhYx5aWC76gKSoQBvBwHn9Xruw/8pczh5o+Ytqr
 g8fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbx1u4SPYQgir4p9a1q5P4yAZX4oY3kLBXjoynZqDyjfGFhw7SNP/K/DQEoH26NwWk3Txwm1Pu4h4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXVfDq3Y4n4iHiUcOrf9WIvWAEvyOaKPAaRbkps5y/nXL44ZAF
 hh2cNlmhSKvmml59zzSALjRd0AKMbZrnoqRwgUZwyLNm369QE5ugGLjylCHHeJR96JSZthvFN4v
 CHOF7BJD/dwl+tfmPKRKI5BmasUK3CH/dMlcxucK2stgYmXDkEE6f8Dkw7VK2ZU8muPvT17Y=
X-Gm-Gg: ASbGncutxVz3gjQs6dR/asqdMjsAhR7bwbApIrcdAz2mL+W00mglOpaP+c2k7p97MSu
 awEG7uMzBDaXMsrsMBAu92SA+7Bn986430XLeTQUFDKj6BcTImzuoKZ2DYIZtrHsn37e2v60kgk
 X615hMqsInLp4z57xlEpmGVZxxUs84yjCoGLk/JIro3m71ly7PCJvJhj5SJVD5v4d9X/GCzOi8J
 ZIEZTQPjobhEdjuHqnEryfurzXqwcHSFw9q8es0w5f0McNTBV5vXrPo7rpRvKI+OjD+AKL/KFD6
 7r9EE9hO1P+JtWQgWogago330RVY0PIfSu77GTvgzH1oUCRhkTr9eN74FhTek5/Ix5oBTFF8g9y
 /E67gL+BKlbYO1Mn5d9o3q5GzywC7dLq6gttC3ukPnUa6wBEs5y9d
X-Received: by 2002:a05:622a:1189:b0:4b0:8e2e:fd9b with SMTP id
 d75a77b69052e-4b2aaa6e774mr45148231cf.28.1755886806035; 
 Fri, 22 Aug 2025 11:20:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoFNCLWAF2tAYF5UUONq++OfHCr9UeqtIPtGxLe6haKB6Cwu0mLgt3aWR5hszae30Z3Zz6DQ==
X-Received: by 2002:a05:622a:1189:b0:4b0:8e2e:fd9b with SMTP id
 d75a77b69052e-4b2aaa6e774mr45147641cf.28.1755886805361; 
 Fri, 22 Aug 2025 11:20:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e2373acsm665231fa.18.2025.08.22.11.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 11:20:03 -0700 (PDT)
Date: Fri, 22 Aug 2025 21:20:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 02/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
Message-ID: <vbzqtpsjkxd5qhth4k2exo2dsnfmfn5km5i5z74wun7jc5j7nb@n7dqdw3t235v>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
 <20250822142230.GA3591699-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822142230.GA3591699-robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX8SwZJezrtfps
 pQ0qEy0ZJ8SdNdAT15zy0lsaM8jBYQu/OObBk2QWDMlFxQOw/tmrkNRgHnkd/5jte+SAtLg+QTA
 8Iq5uqH/uO0L4ISd6kGPM6BiQCAHEV6R9194uNLZBW9bUvOA0IF+L9/uuprX5g6bme8KjRGldLL
 TbgWt/HOv8AtCSCEa+SIXOG0DN0hjAjJaXtFmJdEl0igkXF4gGHbgqvodBNACcMOQ/8BSvDRwAK
 ilIHXy94mSnnmIoolLNqlvndEPxsOcIJUa9Uolmm7sw/GaWE3DSEqDqiNAB9k0+tPNEuSROmhEQ
 rB0PKO4aF62wSEDgILavOApLE6J64xtS6SG1nIB3xHZYTPO1iKZNbMM21RxifHzRPazkPfP2aKi
 N/hF+h7e
X-Proofpoint-ORIG-GUID: LoUEi4-jhI3UJNP-GPHwI5WfgPIakASy
X-Authority-Analysis: v=2.4 cv=F6NXdrhN c=1 sm=1 tr=0 ts=68a8b4d7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=FkOoeBMDyMZldznMw-cA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: LoUEi4-jhI3UJNP-GPHwI5WfgPIakASy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508220160
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

On Fri, Aug 22, 2025 at 09:22:30AM -0500, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 05:34:44PM +0800, Xiangxu Yin wrote:
> > Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
> > on QCS615 Platform. This PHY supports both USB3 and DP functionality
> > over USB-C, with PHY mode switching capability. It does not support
> > combo mode.
> > 
> > Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > ---
> >  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 108 +++++++++++++++++++++
> >  1 file changed, 108 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c2b1fbab2930f0653f4ddb95f7b54d8fe994f92d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml

> > +
> > +  resets:
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    items:
> > +      - const: phy_phy
> 
> phy_phy?

Yes, see other Qualcomm USB PHYs. And unfortunately we can not use just
'phy' here. Once this lands I plan to push corresponding changes for
several other USBC PHYs (described in qcom,msm8998-qmp-usb3-phy.yaml)
and those will have both "phy" and "phy_phy" resets.

> 
> > +      - const: dp_phy
> > +

-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719A9BD303E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 14:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF7510E44A;
	Mon, 13 Oct 2025 12:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Palj9H/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECA710E444
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:37:51 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DB1vsq024083
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UTXiDHZxjE5lYanBLZzc3WtP
 FhwD6zEyaiJPl3VCc+c=; b=Palj9H/ZHdSeQ9v8BmEGpcpToPtdkFkW8L9foVqF
 ma0Q1ih6Vl4BSwmHNHJip8SFxWjaPUnPkijbB4VH1suCrIPjty4Yc84bssgGeMkz
 YlcM7rGi7pTcoviN/WtNMDuncdFFQxwPk2wXEBMC2ddryPuWkzM/LoaqKh1gZds+
 Txq97tHGJjSZ4ihmFmyr+fYQUucuLypOmod2sd4WiKuelVCEp5Iyje9EZmhFaDsJ
 kREEkvjwGMCOFsY0eqoBnH0uZ3NvHxfrtABxbZozsX7wIGrFq8zrtlZet1NUdQWF
 3WoD985IMAHdfy6W+Br7NDrmgdCYGfBoBF8QKOC2Gwighg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa84jsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 12:37:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-828bd08624aso2153447585a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 05:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760359070; x=1760963870;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UTXiDHZxjE5lYanBLZzc3WtPFhwD6zEyaiJPl3VCc+c=;
 b=MLHDSKL6U8igtpA/oyPjd/c9d78AVzD8Q/jVNLRzmDt0aBvc0I+eUabOpmfeTp8juB
 L/aGtcegOWyE25yXeqYyVKpdk/tr6VPRSogqnY/P3PU6mfKXz9cceQ5RitEYeskexvAk
 1nPFNWbut2swfWEOFNWo26ts+fmv9gIaBda6bIHVkMeq7aL6A188Uw+vBQ0X+Nfq3R8E
 p9Fu7sDkoc6TMEyUN3pSUncEXSszQmJkIthoktSDe5xnmh67DixwXZJNb2RNtjiSWPuf
 jEK8qml8yoBi1GgPuMcN1ID0J4e/n3GkIbbN2MpK8BARAyzzcibtlFVqyRHZOnG4lrDX
 42Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMzQDRl/y8eZnL6sv+U7m/mIx0iUUqdoD+HXBsCeFUDW90QW8GDkd/wWXko/Wa8vnSe1w0fpKoDDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyR+y7VTCXanPduR/xcPx6tuukUMcgTLUCrcBJlvGqKuDCnOjGp
 I9cGIxbnOlOPwwtBxUhLmnHx88Bdud2UkMz/ZhnZg6g02zyJyzVbXHQ/KB6vQ6rZkP3rHt0bIdm
 3yI1IqRKRgzxf876OZ137B/4LDScpOFe4EWjNg4fHuXsU9FvbK9J3pdkkgbbhZMrEK4oyviI=
X-Gm-Gg: ASbGncscqh+Nlmc8EzpAwmbnNBhoNo3yfpyyB070Pvlt4qNVcHfq1zGm2B6HGFwzmHN
 5dINM0QWlqpACF0DdCOFETpr51FraADFtV0WqISF6GYMbOCdK923O+TmvIl2lahDOdxynwwkLzj
 KlY3j3Wz/m6L5dvcttYDkmiYgWb/OxvlUBJKnJP5N06byPHz+1hg2x0WaIWmRe8+Uqig97EX1wQ
 pbqJkVnAhKBGFbk7to5NBmbU5Or9E2k2rg5C/qlg9rIXXkwuUUqQZiQf4/oXFyh7GZXs7hhVrY2
 dNkijehsjvP/NjnY6ttLS8NdlpVb8GysniLh+K/Y+zE7wo3dDazAI1mqUGRG3Tgb2+ZV800ybpf
 zrfCMi6vGeD81XHdUNVyCTHUK+Cji+aIVGffiAai67+N9VLao7xIQ
X-Received: by 2002:a05:622a:189f:b0:4e7:28c4:3367 with SMTP id
 d75a77b69052e-4e728c43476mr38351761cf.82.1760359070262; 
 Mon, 13 Oct 2025 05:37:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWOjldqO3QYpUkgEWR+chHtoaSrhdJCEvdufVafxS4s9vy3NHcZihffXxkbgVUGrgtKFOT7Q==
X-Received: by 2002:a05:622a:189f:b0:4e7:28c4:3367 with SMTP id
 d75a77b69052e-4e728c43476mr38351181cf.82.1760359069747; 
 Mon, 13 Oct 2025 05:37:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5908857792dsm4079248e87.105.2025.10.13.05.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 05:37:48 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:37:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add edp ref clk for
 sa8775p
Message-ID: <xofvrsdi2s37qefp2fr6av67c5nokvlw3jm6w3nznphm3x223f@yyatwo5cur6u>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-2-quic_riteshk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013104806.6599-2-quic_riteshk@quicinc.com>
X-Proofpoint-GUID: k-apk8h8yHLIqZrKppFf_ams-06UUKqF
X-Proofpoint-ORIG-GUID: k-apk8h8yHLIqZrKppFf_ams-06UUKqF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX+X/mmoSDuSoW
 LN3nvDFDDp5WyVelDSSMaajqwSdGUR+Bem6MT1TdgyV7cs2soYKf1yz/JESxQv4ylKYBj3al/ZY
 S0RYBWY5oKxwVZgCeB/ukSAcx00qNZLAedfsqyHkV8bNpQoDRnfO+EnBgu1iWXmKXSkDOgJBQri
 sHPD0olux0nfUiI3ToXRSgzUG9bv/Rq/DFEL+3e1YIsCHvzcA1z400g2e3o/lE1gD0Ui3f/58pU
 1WiXtadR0KUr87Hqvx6CUbQTQu0hngxC/Jfzf8Nnt2v0vkT2Bggv8/qye3oOhDb6caq7ZUqeBDk
 s6C35md9yR0N2XKarlA3ySBa/afA7TLhAysbOkgJs0mJD2P/XbcOVJUJjenSyFZTjB1GR+8me3X
 LpSVeFbxiHULe8uIq1gJwG9m3SaJ1A==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ecf29f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=1RwfRIOwSLSNpsoXFEwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
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

On Mon, Oct 13, 2025 at 04:18:04PM +0530, Ritesh Kumar wrote:
> Add edp reference clock for sa8775p edp phy.

eDP, PHY.

I'd probably ask to squash both DT binding patches together, but this
might cause cross-subsystem merge issues. I'll leave this to DT
maintainers discretion, whether to require a non-warning-adding patch or
two patches with warnings in the middle of the series.

> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index bfc4d75f50ff..b0e4015596de 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -73,6 +73,7 @@ allOf:
>          compatible:
>            enum:
>              - qcom,x1e80100-dp-phy
> +            - qcom,sa8775p-edp-phy
>      then:
>        properties:
>          clocks:
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

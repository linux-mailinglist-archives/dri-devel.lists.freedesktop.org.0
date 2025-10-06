Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBE8BBDA00
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 12:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A914B10E3D8;
	Mon,  6 Oct 2025 10:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSyLqFuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA4310E08A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 10:09:31 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5961V71g012086
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 10:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bXYSL6RF+4InEd3ZqLPZ7ukK
 78ULLvWwWztGrXPi/Lg=; b=NSyLqFukvnIpuOu0VLpXrMUvszqgIVaaEH8fuVtR
 tWz55tSwDwm2jpHH1++YsLnANV/+mQiFLa9Ywznq/mBSdWVwcvlsf2rFgq0jMqfl
 Gc6ARMtgS+x5tAVeHlG/5UkpDokjLECeAJSEzBb4P3F5xswVzQYwsSoKwd+k2LDR
 nzl7KhZ/RidNcWa/n0C0w5/YqznBux5sMRFjfTNVFg2il/aUXJC98g1ai31NuLM8
 AQf8NdRIQvkktvAujGf1LL0hSICTipG5K0+jEJQJs7uDSgin/RaeGwTyav9+8mv2
 yVI8l6B32zzL6fz5TOyZcMjW24C/o+4CvytdoVb0VG1EZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn3s8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 10:09:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d6a82099cfso121706131cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 03:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759745370; x=1760350170;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bXYSL6RF+4InEd3ZqLPZ7ukK78ULLvWwWztGrXPi/Lg=;
 b=aAaUlBZ/NYLJOAfoHqj23dyDufnBE9dhxa6tN2aJpJ4wfwAy9feLu50co2Th07MZY+
 hGhhp1KsOWamH6mhKIi6m/O8v8HRZMM/L70OVB2WNgiRyWH+BcNCh/hny39JmXBEdb2D
 x0v8hJC83fP6icZM3sqb8ASKkdm3ydTFw6jEtDPXDh04ftMJ1GrvU5NqPg7go+lqrkBM
 9reiAkawZsLLvZOabhJad555IF7eW+uF4x2D+x4/10cDsU9szP4jYLzN94t8iL8IbEVT
 pKdosBNd2pD7xOq35z2ZTwSduyixRBdaUMQz04RttSCsm/jtkeaZyV36R8d7qq14BscR
 +0dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxVNUj+r5wDgjbSs65MOkdbFC08HdYhZjPA2lJXE8mFvDb4TQ72oWUfUWvH4A3dHh8HCt64tLfbrA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdjVmM7iVo/SZrilD/7jRMwPiuEUAyqoQthSyC9nPHAPhc6wAG
 u1mXrgOiQwRt82GqJIlugBwVNj3L7aU06OKETF08uZ2+GC/wzfEqvG+98gyXSS3vu2+Ix8Qb0bi
 lRbPxlb9R6vN3Igi3h/QdSKLcGInLHW3eCSma+dzSgarQSRBPDhVoUnZ3xovgF3BTgHNXeWk=
X-Gm-Gg: ASbGncs9UeZbUjYO4iYwRPOJOQfPUF1ggpkEpHZfST+KwN2wPP9foaOeKZ9Iq2OM/y0
 M4/WO/1TM79VlDqQ9lPNgBcqdqxJr+p8fBt6ssls6bb78xMtv85TbO3G7CsHVXswSdnF7tvKOh1
 HGnIvcu4ohIQmeU161hnoV2dUUsxWmvN7/XXI5XY182Q5ogk4VJvWiEBhaDhlHe1BSXDjhu6TqA
 O558c4g2TBd4pzeG/HX4rj+FsbYSljqNFtcvyuZO9VySA6NJqA/bdpct+uXw3TMpibJv3MUB6Rn
 ylSMHrjd6fvOSfBZpgniSIA4CFLqRZBk5ynpaXvQKLjFLCK/yKqZqEk+FoeH2BwJcSW9FUU7BFl
 Ss0G4vli81HZmiJZJ5qQmTLSo2mGBjsT11h1TUc+4ZVg04DiiGVcRLQX2Rg==
X-Received: by 2002:a05:622a:1f06:b0:4db:f0f4:9661 with SMTP id
 d75a77b69052e-4e576ad691emr146555001cf.65.1759745370139; 
 Mon, 06 Oct 2025 03:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/EFwvYFDtuXYBmDcVcbVZDXlZvHJf8WdbRFA9SctOvGp2clXL+AeK+d+ABYU0RotnUXbOKg==
X-Received: by 2002:a05:622a:1f06:b0:4db:f0f4:9661 with SMTP id
 d75a77b69052e-4e576ad691emr146554711cf.65.1759745369675; 
 Mon, 06 Oct 2025 03:09:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b011ab24fsm4891035e87.120.2025.10.06.03.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 03:09:28 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:09:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 2/7] dt-bindings: msm: dsi-controller-main: document
 the QCS8300 DSI CTRL
Message-ID: <anirh7smpjsis24pl4k4wckrimujbbodwnl67n3ipebprz673c@kdaowpncrzia>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-3-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006013924.1114833-3-quic_amakhija@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfXzNE9T20G3PDr
 SmX4qN8NEotRHYwBGAFpO4zD9Rya28ktVDO15gjLojYfrrHAfeQ+kbcDHWHNP47bOl7GBSl6Ioc
 lBYsWEJYDWabMMWSaIlFZgjZPhFuO3UQxTXFwYbFo6RCDQsY6kwKHmXkP0+hbObCYFmqBY492a7
 wvpmBd9bmYH1Y7qK92nwm24iXrTHARkDwWb8Irayu986Tj3YElUIZzG/LQ1pVi5mq+iOx2RcR0e
 4kygXcPdC4xNsWiprug234ifBA3Ok49JYMGV0XG/m/RMqEscW5OTZ6I/zD94kq+cveBVdvfZ4Ay
 iCcCp8x4QRj0z5e7lAGaJEi5rlm2N5EnLzW1thxP5lqF6vKvDY6OXTIC6cCVGbcUujY/E6oXDQu
 KOr03Lco5+1Vii/bwO2NyoiurVbXhg==
X-Proofpoint-GUID: nt1rOLC9Ba143HUyqCKsT0ojp07-UMzB
X-Proofpoint-ORIG-GUID: nt1rOLC9Ba143HUyqCKsT0ojp07-UMzB
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e3955a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=F4Q9eJ9c0RUMKujZamsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001
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

On Mon, Oct 06, 2025 at 07:09:19AM +0530, Ayushi Makhija wrote:
> Document the DSI CTRL on the QCS8300 Platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 4400d4cce072..8ae08d3b0200 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -45,6 +45,11 @@ properties:
>                - qcom,sm8650-dsi-ctrl
>                - qcom,sm8750-dsi-ctrl
>            - const: qcom,mdss-dsi-ctrl
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-dsi-ctrl
> +          - const: qcom,sa8775p-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl
>        - enum:
>            - qcom,dsi-ctrl-6g-qcm2290
>            - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
> @@ -329,6 +334,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,msm8998-dsi-ctrl
> +              - qcom,qcs8300-dsi-ctrl

No need to, your compat settings already contain the sa8775p string,
which will match this clause

>                - qcom,sa8775p-dsi-ctrl
>                - qcom,sar2130p-dsi-ctrl
>                - qcom,sc7180-dsi-ctrl
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

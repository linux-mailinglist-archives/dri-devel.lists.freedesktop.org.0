Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F098B59559
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 13:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A7610E788;
	Tue, 16 Sep 2025 11:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhgXC3H5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD0A10E77E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:37:07 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9vCcs020364
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8r+uRlaevPVdXlAyT4T9NwO2zYw30Nbmp0nZRslTI10=; b=AhgXC3H5SED8o8nr
 /sacaXb8HtYMysQNCcT0CthTAQZ9iWqMK2W7hleKFmth8FN5AIpPa9/X1aMhkiF6
 jv6UvKzwXjHITupz+xHy9DrwPiir7Klbv/7aqfaJ4I62h6lB2kqZn736ew3ccnft
 1bTGLV3raPmRJJETBKXjJUki6fVMeKrvnoZ8YvqrJ5qbunstQLo/rxqGOjthBKs5
 G117Uj9t7ShkuBJAd6NN3TCTS3c/Iru4T/B5ct5O89t3hGHnBjoymCqnk+2dmjrl
 jaG4Qa6tSggMYbHGp6bnCcK4/pLEpbwGsRVq/m0HiJ+AFP6R8QuVsdKJY178s511
 OcFZcg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1sm6ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:37:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-778eac53ed9so72887616d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758022625; x=1758627425;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8r+uRlaevPVdXlAyT4T9NwO2zYw30Nbmp0nZRslTI10=;
 b=hhJfUuHSmu411q5poZ6UiiVnkT8eu3w/5rphewZFXRt3GRbBgES0Ud0YDu9Zrb6FTE
 6QVY+mmgliT657SxN3DtWP0xQQrxUouLsjKagHV4G+PLHFscNUAsuuIpw62EetWvBAXo
 pMNtYMlIKYZCQWD8yBhqRV+KlrM8M3usouU6SUzvMnWEtvyXZnieIBKjk3X2HQFkHJai
 Gb6vGD2nZGQjo3rfLT2Lh9i5HaHrXfXKOy9qPrmkO2fqPiQEd1yMmYhL9Y6VlUwV6+kr
 j6p1d866ZP9qzjP6odtxMejI6TKk2dGisxmsQgsHukwXdA1AcxkXdGNK8/XmO2hvR/s7
 YQDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO5ZeuPnexKfTIDdclKfr3yA951qShxD48tda0v4XfDLnKU8qFdQx+4ZJhd+iRe93Yds72NSSaXuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIvSvZIEc/szYuHtrE9oOP+FpfpXVdQxlJu5rbNXBlIwGDp5sv
 U/8eE3VCDRemqEcYeWhfc4Xu9o8av66H1DBvTLemICtwyTfx3ATP6GoxqKVlEMDMbYiYYecs9Rm
 +VgccgcdGKSBCt4lEuZ/o8MzcduOqqaiuKwGMmx+mY5fODW6W3SY5mXdqqr6Wx/Eiib9PLmbRId
 gIUvQ=
X-Gm-Gg: ASbGncsShETW2bczJZyvNxlPDxVRyTip+ZHQ1n1wUFPYfvdwuWGq2/cNbXYr2kBBHkx
 V45wxwMTcVGQkP+f101/Nm7LArzi5AAXLBqB4h++X8GW+XvXEUfnJuc5bxkQ01LFP/Z982SyN40
 8kvIS/knx/08nZ31KCxkoTnqxyxkq7eSYeU6gCGK4r+G1vYAxWtrLEUQAtak6Pss9cdqXZZPjdo
 hRKGCyvJ6qt6fWOmgJhUCzf4IVGtEjZ1OtQi+v4/lvg1HP9PkNTOfSTjRKClWhPFWBsGyoGBpvf
 tWLBALpghUnGRJk5jGLwtwRm7/8P5JMcsgLiTXbk51U9JxRvPAati6UX0VO94bHgYN0DojKeeOb
 yepGmEQ2uuEkHPr6SoCkasQ3kkKLpk1DnVTvpWbogeU45y1DGmKR3
X-Received: by 2002:a05:6214:4104:b0:72d:2745:e51b with SMTP id
 6a1803df08f44-767c1f72004mr181805156d6.44.1758022625209; 
 Tue, 16 Sep 2025 04:37:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrdj7CKBZutEb3X6G6Si0JxbfNPIbPU3VNg/diPoQkuTWBTcD8Rz2tsUYzQoStTeuysCm17Q==
X-Received: by 2002:a05:6214:4104:b0:72d:2745:e51b with SMTP id
 6a1803df08f44-767c1f72004mr181804586d6.44.1758022624520; 
 Tue, 16 Sep 2025 04:37:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65a3464bsm4260659e87.139.2025.09.16.04.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 04:37:03 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:37:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <lf254j35dxbvenodtexxd4fdlzfp3esu7fgakhekya66ce3tfc@7oe47nc2tjun>
References: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
 <5sg43rsun33i6bm3vz7io7yx2p4m7bmk5bnrnjg6u3zrulyofs@gyxtnfs4gvhz>
 <d302e71f-19bb-426f-a7df-c0d7854e97af@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d302e71f-19bb-426f-a7df-c0d7854e97af@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZDYd2PqU-_W-4XfaERXL5jQU9OFCyItP
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c94be2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2Fl1_B1TyGCfFF3moNUA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: ZDYd2PqU-_W-4XfaERXL5jQU9OFCyItP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfX7/nTanKeLtgF
 7eBNniOVpnuYx6hOQRxw5bzAN8wHX24brx9Apn1k+opjjBxAvOBsuR4bq683J6A8kmGtUdcHuV3
 UrAR8UfQv0VVcGQvbE2Y7WbM99w5JVLlDFESZGvBpTSz+dlE2xPoTYzGOgtGZzKtodKEbDYc+Vs
 Up7aHUUUZWcrWxRcR5a56pKVAW0OfrxbXagzQrdYvj7gVeYFJlNHngDD0ezA1XNCweM09+HSzHZ
 8hMG8qcQOKQeejrmsBByGg761CMp6wJC4h0WTw3TWl2wNgBX4T0fFiP95eestvXT3NS8i/n/0Uh
 7zi4U7ftqqBK/fPdvpCwYxMbiLaF572PNJaW24+FZRl5WSWpGVJXZivPsWuUpvgazIT8LmA+aYT
 Aw7TRKi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098
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

On Tue, Sep 16, 2025 at 07:25:28PM +0800, Xiangxu Yin wrote:
> 
> On 9/16/2025 6:22 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 16, 2025 at 03:31:35PM +0800, Xiangxu Yin wrote:
> >> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
> >> 'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp'.
> >> Declare 'qcom,sm6150-dp' as a fallback compatible to 'qcom-sm8350-dp'
> >> for consistency with existing bindings and to ensure correct matching and
> >> future clarity.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >> This series splits the SM6150 dp-controller definition from the
> >> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
> >> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
> >>
> >> The devicetree modification for DisplayPort on SM6150 will be provided
> >> in a future patch.
> >> ---
> >> Changes in v2:
> >> - Update commit message and binding with fallback configuration. [Dmitry]
> >> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
> >> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
> >> ---
> >>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..82481519005a1b038a351aa358b9266239d0e8a9 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> @@ -46,6 +46,7 @@ properties:
> >>        - items:
> >>            - enum:
> >>                - qcom,sar2130p-dp
> >> +              - qcom,sm6150-dp
> >
> > In the review to the previos iteration I think I was a bit explicit:
> > "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom-sm8350-dp". You seemed to
> > agree to it. Now you didn't implemet that. Why?
> 
> 
> Sorry, I misunderstood your previous comment.
> I thought the recommendation was only about the commit message, not the
> binding structure.
> 
> Does the current implementation mean that qcom,sm6150-dp and qcom,sm8150-dp
> fallback to "qcom,sm8350-dp"?
>     - items:
>         - enum:
>             - qcom,sar2130p-dp
>             - qcom,sm6150-dp
>             - qcom,sm7150-dp
>             - qcom,sm8150-dp
>             - qcom,sm8250-dp
>             - qcom,sm8450-dp
>             - qcom,sm8550-dp
>         - const: qcom,sm8350-dp
> 
> Do you mean modifying it as below?

I suggested a compat string. Please modify schema accordingly.

>     - items:
>         - enum:
>             - qcom,sar2130p-dp
>             - qcom,sm6150-dp
>             - qcom,sm7150-dp
>             - qcom,sm8250-dp
>             - qcom,sm8450-dp
>             - qcom,sm8550-dp
>         - const: qcom,sm8150-dp
>         - const: qcom,sm8350-dp
> 
> 
> >>                - qcom,sm7150-dp
> >>                - qcom,sm8150-dp
> >>                - qcom,sm8250-dp
> >>
> >> ---
> >> base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> >> change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86
> >>
> >> Best regards,
> >> -- 
> >> Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>

-- 
With best wishes
Dmitry

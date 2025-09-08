Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE044B48970
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 12:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9443910E085;
	Mon,  8 Sep 2025 10:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jti3dHSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF4F10E085
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 10:04:13 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58891Gqe000478
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 10:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TUCQQaCIPPEbbTPsTsrcgsfo9TDR5bbHwDO1+w8BQ9A=; b=jti3dHSMhzULG8Nj
 wCZiRdihhFxxIy1SsTTyx3LzZWw6KjQuj3M3tFnG8aDGyKq3AHH+NgAOANyq02fR
 UfdzzQ1TRTMpkmBRr4bZN49OgiZGjiR02V4fZdFV1DjwlGgJ1PCSgNjJQc7PUhFI
 mVLIfyLvBdNzamnMEdjBeyNrK9lLW72r4mYaSptG53R3QQ60V2FnMQZI8RpYjZ1l
 BLpLrIY1oUN2SnS0NpOrcGX2kbk+N2ptO3YW9E/5ppy0hhdaJJ3rwfbH+c7IEuJq
 nKG6q+R3BRfAgP3YE4dJtmpRq63HxzG9exP+3c8Y3TJK0PiyBzxI+17Lce6ndUrB
 PzZacg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8v861-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 10:04:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-72023d1be83so149841136d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 03:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757325851; x=1757930651;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TUCQQaCIPPEbbTPsTsrcgsfo9TDR5bbHwDO1+w8BQ9A=;
 b=lIQEaAvGO3a+B7BJmDG1tctXObDEUNgXySMTMQN57jn4tcOafFdfvonHMqC1oiCkXU
 lGWZvGG5eTgVXxVXDyi4jyKzh67N8jsDwl7NQIb/rM6T4K+kuROIQo1TWlFfef7Y//Hp
 arFNm8pYklpholeY31zMNCZ9X0Xy4yuMM82ySuzW6Edo/3q/M1QFmJPk9s/405Yb7ewD
 ZWwqap2yulPZ1ODzDk/mhhjrYuAsrSH961nHNoa7ZrJvVWDsP9ceicldTAo4iKrJVYDi
 JIq/ft3jiLmmg3qoy73t9rgkoi31CmVRhDYaiDl+ZwU6cS7BgDwj9SfVoO1Jvslo5wcf
 esBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO0JNta/qXwkY55367UprC8m5r9ljgoeva+kPZuy/hwuXLaGMxiH6aqpEBbKGYvRYK+kP6bx48+/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcCx6TgJDSamCMLoTmkNo96ihfYIgZo5WdvjgfKR9w6xm69C9B
 SjuDNA/OCgBgeoZ8sHJ6VaUmuR4LEkUnS0wG+4RzmAxe/DyN49E5jkDbHms0YEu9Q0wCbTcJUWC
 c2j/TIUgYSsidz2NTUs4x+UZjD1bL8KSb78ROOryUg++ym60FW65LY2l2LamSciyxDQeoHlw=
X-Gm-Gg: ASbGnctOauIqFhr56OhJDyJ0YcOxZOnMpfSfTWes4TDQ8zAJC5WQW2T0q5JEYxmjjoz
 +icCNUgIcqOb4AfDWm/0HgQoJBTJrhaPIAUdin9xQRpw44LQrHWSSsccPlM3LwheorC9Hb5YyUW
 2+oqnTWjsPNvR5jk1qltxH+fFZUVM98miWciXk5UAIoRsjNPcMCAPYbs3dd1MvqUMU+dsIw12/J
 T4GcKwvzLbq2Ud1S+oMqs2j6+gonjqPekai5BqShX0wlIy2e+3+PxHicMO3RO47Mm5kwyYGWCDx
 ZH760a5diqeTnPNLtHe/ip9e4Kjt4ClT18JAa0YCAwDKyRDgHrfs6ej5dD/6207oC3B4FArsC9W
 R+d5mzVui3szzCbdJbeC6gSv6iITJpXWMWP2nzwOxxsWMLlVSIH1p
X-Received: by 2002:a05:6214:c2e:b0:70f:a8e4:9de with SMTP id
 6a1803df08f44-739322f8babmr88180506d6.27.1757325851210; 
 Mon, 08 Sep 2025 03:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTM2Aa+Miz0K6s7xyeRR6TpR0YSRPsezwYwrqqCf24cX0g/PXlLkfxbUOlt6qGOF4asGVuOg==
X-Received: by 2002:a05:6214:c2e:b0:70f:a8e4:9de with SMTP id
 6a1803df08f44-739322f8babmr88179646d6.27.1757325850389; 
 Mon, 08 Sep 2025 03:04:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9cb5sm3498239e87.95.2025.09.08.03.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:04:09 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:04:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller:
 document QCS8300 compatible
Message-ID: <pwbmqjspoyj2n7gchyaycxfp7ge46pyvm5dntkk7awkr6pblmi@wun2jdt5iehq>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
 <p2okyfwfl23bip65koaqezlvhyo3z47bnugojcieuspr37xc7b@s3qwgbqmts4l>
 <d8aaff46-9e3b-4b53-a690-351253753edd@oss.qualcomm.com>
 <jdbwncstextusng5boqg4v5r7krbnjts6f3zgd65cu4rrst7ay@kkod7ihbgfrp>
 <69219cdd-bcca-4673-9a81-084184fda6db@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69219cdd-bcca-4673-9a81-084184fda6db@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68beaa1c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KvANTHea1ihHQiRrGRIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: rKR-CA9sadDJAEYzr6yUDd6jHNWYI8K4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX2jCilpTl0Bqp
 g1qhdjyuEBnQxYByarR59aB7iMhkxCF5JFAa+ThQ2O8PeMaZrYRBGBTeQGY3hV4fZ4gcZURrpcx
 lEuVUdaoIewUvHsrthDj3fYxmh3DVEmoWqC2oG7UmI7Um43Cy/kmtSiWt4JilLEq6/Pijuczvm8
 DRUYP2ZENk0/cY44JV1V8y+sJrwuTDv5FKMRdQ3NSW/LQ/l3zcs2N48BFrtHrz8Qbf6KyAvTm6d
 xbb+yvfzpXcZ0jt19Sk8KaoV0JkgRFxc2mzinwo3GRD6gz7LReKZ2BCGUfjqTCWQ7azZiHqKoYx
 YzYdAufzUkd9bewisCC5OZNalfNU0wTSRsCqEjUgmP/LVMiQoeMAK88jDCFkyR+lD1kVv3jtjyk
 BCrKt6pC
X-Proofpoint-ORIG-GUID: rKR-CA9sadDJAEYzr6yUDd6jHNWYI8K4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Mon, Sep 08, 2025 at 05:46:30PM +0800, Yongxing Mou wrote:
> 
> 
> On 9/5/2025 9:48 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 05, 2025 at 10:50:33AM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 9/4/2025 9:43 PM, Dmitry Baryshkov wrote:
> > > > On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
> > > > > Add compatible string for the DisplayPort controller found on the
> > > > > Qualcomm QCS8300 SoC.
> > > > > 
> > > > > The Qualcomm QCS8300 platform comes with one DisplayPort controller
> > > > > that supports 4 MST streams.
> > > > > 
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
> > > > >    1 file changed, 22 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > > > index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
> > > > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > > > @@ -18,6 +18,7 @@ properties:
> > > > >      compatible:
> > > > >        oneOf:
> > > > >          - enum:
> > > > > +          - qcom,qcs8300-dp
> > > > 
> > > > Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
> > > > new one?
> > > > 
> > > I think we can not use fallback to sa8775p, since we don't have DP1
> > > controller for QCS8300. SA8775P actually have 4 DP controllers (now only 2
> > > really used). So in the hardware, i think it is different with SA8775P and
> > > we need a new one.>>             - qcom,sa8775p-dp
> > 
> > The DP controller is the same as the one present on SA8775P.
> > 
> Yes, it is same.. I just want to confirm again—even if we only need DP0 for
> QCS8300, we can also use sa8775p as fallback, right?

What makes you think that we can't? Let me repharse the question: which
part of DP controller (single one) on QCS8300 is incompatible with the
DP controller on SA8775P?

> 
> static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>     { .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported
> = true },
>     { .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported
> = true },
>     { .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported
> = true },
>     { .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported
> = true },
>     {}
> };
> .mst_streams = 4 is suitable for both QCS8300 and SA8775P DP 0 here.
> 
> Previously, my understanding here was that we might need a new compatible
> for QCS8300.
> 
> Thanks~~>>>>              - qcom,sc7180-dp
> > > > >              - qcom,sc7280-dp
> > 
> 

-- 
With best wishes
Dmitry

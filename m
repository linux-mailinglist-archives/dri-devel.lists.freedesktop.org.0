Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D99BBCCD0
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 00:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43C010E2B6;
	Sun,  5 Oct 2025 22:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lF6Cdduc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1CD10E108
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 22:02:13 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595KFEJh024247
 for <dri-devel@lists.freedesktop.org>; Sun, 5 Oct 2025 22:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=N256hlAuYoC5VZZOOilDZ2b/
 UfNCJGDfOP6dgO8ecLc=; b=lF6CdducMpVUxg7v5KV2xvLDDr/WMRHAUalgLEZ7
 kLNEId6NLIuWAfWhK047h0e2/E0TQO5xAMTh8+awSmuUS37KuZSQ/MyJEKnp7PZn
 K0/MIrNdK0xbz9X4rt5bA2v1BQmG2hrxZKckDOiUEfCoZoGMKrjRdMJHdbrvcTiS
 wAW5ZGsnrRQAtQve6pOyQTX7Zqs1iGsyxYdFcP19g4LnNi110y3zaKvW91gQThcY
 rojAaBssKiLTLp3HImNDdKOoy5KuBIwQoooOcFqJ4vc5g/7l6+PDfUoo31QGmoAP
 QgsjbfQ68z1fZyNnSwpoTdPFjw5mGc877HnZN968KnS7jQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1jftd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 22:02:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-269880a7bd9so45378285ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 15:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759701732; x=1760306532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N256hlAuYoC5VZZOOilDZ2b/UfNCJGDfOP6dgO8ecLc=;
 b=be2bZZRyTaVgb8RECoFoumV3PTFG97FGrvIFbuoDczqOKaTWhNiwKrQQ3JDOQ39XDm
 1lxIEwT06JeiJmdi6wcmZ/FGBhdJZ1mCc5ffJwmxk9bjUzg1KnGKm1LwIXYCcC3tjAb4
 oI449d7+9gfIYdvUsaPpJXtDTIuzTWYuKB2Cy5i98yIDvRj0/attkkWoljSD22UAxsgi
 xn6ze4HWPp4hg9+pGD0NC50TOcrkAQIzVZDDsJi8u+5YIrGqAXxjnbmcOH35Z5FM21vI
 73lWeyHqq07muDSJNjTwTu81vyBytsiXe+QD5Dto56yjHBb+2flddjjzRjWE1XKIEYpO
 EoYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIcxFRQ4raynx0ZnKPTxofM+bFN9UiN2e+9DscaxFDYBgUqpbUzEgMWQrPFGS1USmvIojhM6NiZBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBhdAUhMiZ5CI1IEchYvznxNI7EcO78T1NO/MeZiR/lOoaFSoU
 Im55bqrbE0aivjTM1bt+2kZf0QBrBmmEGYRSXaXN9jbo9RIQ0HPUr7XVQjgIrYYuGIyvawpMzDM
 JyCby2GKydeu9Sp9SFbiIy3GUFsyHfg6/7NSuDtaynVjU3fWV5tMhC2LUsrDmS+1ClyeK1/VVWj
 UyWA7//OVAZMZDIl/ATTxnw29LDP/DdA8yteDtUlR87Qi0TZF75edY8g==
X-Gm-Gg: ASbGnctXHqXnOoXUy0fVA0SUWBybLoOyZoAJhlBguv85AN7IvC3wpbs6p+r310bx2a4
 jH+gUrPnwfYaxAEgOajyTLiVVu8wd+7Rw3kHGKH0ycsFIzwvnQBDMO2iFFjFNoFnRbepaZ/tt8t
 zLvDU8MY61tTIeEps+LrmpRv/EuJMEqdAWnE+DkaVQ5/H/y9Po0XaSH6uGrA==
X-Received: by 2002:a17:902:db0b:b0:269:b2a5:8827 with SMTP id
 d9443c01a7336-28e9a5441d2mr123489725ad.16.1759701731626; 
 Sun, 05 Oct 2025 15:02:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw5H3bnClwmyFijTzPlTIdJv/FoUFtpaPkBeTmanH+Kmn1x1n5CJdxzZudHkd+BA4S2ApQpqFUagP05oAcE14=
X-Received: by 2002:a17:902:db0b:b0:269:b2a5:8827 with SMTP id
 d9443c01a7336-28e9a5441d2mr123489405ad.16.1759701731098; Sun, 05 Oct 2025
 15:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-3-quic_amakhija@quicinc.com>
 <vsty7sy7gi2eeyifokwcqpoycmarxietkijmlkymwrmzmdsfws@x64f4ulbc6ja>
 <aaa9f760-70aa-4bee-b6ab-d6fb02ea3c78@quicinc.com>
In-Reply-To: <aaa9f760-70aa-4bee-b6ab-d6fb02ea3c78@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 01:01:59 +0300
X-Gm-Features: AS18NWCM1r74v1bXxfrsrgftusyMHXRCg5iM3xO5_k0pu2EPz6imHWWBkRHsRFA
Message-ID: <CAO9ioeWHJSj74VBR=2kHJDe_p1oG9Ngs6q9+s=CySGD3KY6sPQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: ibmNUiu3nzOgWGw0WRqGtNgFvof0W37T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfXyEs83nzL84AN
 7VWmiZde8xymBdKdieOAXMrvtVDATEI7G4pBY+Cp/qpbpPblmojclo1rqluw4HFq2bOwaJJNSAd
 VdrJ82IpJ7UVwgYj9/V6PXonEhjFKpy8J24oZT7IyJS7lD8q6WAmWmP38yo5YP25P/s5koNcNa6
 mnbFseIwn6Sz70nOhKdJGOLvrlxjBudt/zihUzuyHpdXNPwwl6dK8jcwKHFaHckEJKyjpyVSIjU
 TtDWlGzcK9hok5sLZFowkaDVtYybxLxcMHTnYBhtPOrrz8OIbeATws40YRknUs4v7LwRVyXIvAz
 s2YD/aSFQvrv/7R1YQhxjlwnuhRS4MulixN1c+wvqHa3Q9XiUbVdYMj3ZG3QSh5Cj+gkQa2GgD/
 gHCnGYbtbL5s58Vb/cVHiu7F+9PIkQ==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e2eae4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=0nM2LEvACttjMDtNBYMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ibmNUiu3nzOgWGw0WRqGtNgFvof0W37T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027
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

On Sun, 5 Oct 2025 at 19:49, Ayushi Makhija <quic_amakhija@quicinc.com> wrote:
>
> On 9/26/2025 3:32 AM, Dmitry Baryshkov wrote:
> > On Thu, Sep 25, 2025 at 11:06:01AM +0530, Ayushi Makhija wrote:
> >> Add device tree nodes for the DSI0 controller with their corresponding
> >> PHY found on Qualcomm QCS8300 SoC.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 95 ++++++++++++++++++++++++++-
> >>  1 file changed, 94 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> >> index e0e1f63fc45b..834ae0522f2f 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> >> @@ -3,6 +3,7 @@
> >>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>   */
> >>
> >> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
> >>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
> >>  #include <dt-bindings/clock/qcom,rpmh.h>
> >>  #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> >> @@ -4854,6 +4855,13 @@ dpu_intf0_out: endpoint {
> >>                                                      remote-endpoint = <&mdss_dp0_in>;
> >>                                              };
> >>                                      };
> >> +
> >> +                                    port@1 {
> >> +                                            reg = <1>;
> >> +                                            dpu_intf1_out: endpoint {
> >> +                                                    remote-endpoint = <&mdss_dsi0_in>;
> >> +                                            };
> >> +                                    };
> >>                              };
> >>
> >>                              mdp_opp_table: opp-table {
> >> @@ -4881,6 +4889,89 @@ opp-650000000 {
> >>                              };
> >>                      };
> >>
> >> +                    mdss_dsi0: dsi@ae94000 {
> >> +                            compatible =  "qcom,sa8775p-dsi-ctrl","qcom,mdss-dsi-ctrl";
> >
> > qcom,qcs8300-dsi-ctrl. You might use three compatibles (qcs8300, sa8775p
> > and the generic one), but there should be qcs8300 one.
> >
>
> Hi Dmitry,
>
> If I am adding three compatible string for ctrl,
>
> compatible = "qcom,qcs8300-dsi-ctrl",
>              "qcom,sa8775p-dsi-ctrl",
>              "qcom,mdss-dsi-ctrl";
>
> while validating dt-binding and dtsi against dt-schema. I am getting below errors
>
>
> /local/mnt/workspace/amakhija/linux_next/linux/arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: dsi@ae94000: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['qcom,qcs8300-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
>         'qcom,qcs8300-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
>         'qcom,mdss-dsi-ctrl' was expected
>         from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>
> According to the dsi-controller-main.yaml schema only two strings are allowed one is the SOC specific and other one is generic "qcom,mdss-dsi-ctrl".
>
> Shall I keep only two strings qcom,qcs8300-mdss.yaml and the generic one "qcom,mdss-dsi-ctrl" or if we want to support 3 strings in compatible sting we need to modify the dsi-controller-main.yaml ?

Of course.

> Similarly, I am getting error for dsi_phy compatible string only one SOC specific compatible string is allow.

So, what's the question? You are adding support for the platform. So
yes, you need to modify the schema.

-- 
With best wishes
Dmitry

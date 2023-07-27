Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DCA764819
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCBB10E4EC;
	Thu, 27 Jul 2023 07:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2263F10E4DE;
 Thu, 27 Jul 2023 07:08:40 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36R5Kevm029575; Thu, 27 Jul 2023 07:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=7WdUAhOgFOapGgHfnHV7zG0ejtt/2WBLLC+aVEpo1wk=;
 b=VH76wugnfPooQVPRw87DPW3YYrU+SNgbp+1ymkiW6QIeSzdxztB6NHsjpnJYQ1xTe05X
 J6KnqYPLzjjYqHZy1iSWyfNaQFU+HWW5G4mHg+rlFB7r9wrvdTZBVC9Ktu2SY3RkwLPT
 ZXqHVpOUDsMoQqCnSD1AhlunGWMs1Rv1+3GAfoMmzh3z1zeUSWV1sIpV9xzcUZCu2Xnv
 0YQ/oFSllBHNWNgYBrIGOeMd7QiGYAc5SQzxbKLMZArJm7kVp/qCnZUUAfU3XJfkEKpk
 rB4Koy5KR2ZzRmNzJpYUk/tiSpw6r8+TASqL11S4q5SPpfK1c5x8yOy+w/AOv5xa1VAw uA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s3105a7hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 07:08:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36R78URY003352
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 07:08:30 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 27 Jul 2023 00:08:20 -0700
Date: Thu, 27 Jul 2023 12:38:16 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Subject: Re: [PATCH] dt-bindings: qcom: Update RPMHPD entries for some SoCs
Message-ID: <3da310cc-b866-4829-8411-befaa719f10d@quicinc.com>
References: <1690433470-24102-1-git-send-email-quic_rohiagar@quicinc.com>
 <edac596d-2b3d-4632-9468-4af863aff6f4@quicinc.com>
 <86c6e8b1-d286-6858-5de6-b8faf6557fe4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <86c6e8b1-d286-6858-5de6-b8faf6557fe4@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2L7Av94BbgIvbPJwck9Ufq7yOOZg_19U
X-Proofpoint-GUID: 2L7Av94BbgIvbPJwck9Ufq7yOOZg_19U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxlogscore=630
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307270062
X-Mailman-Approved-At: Thu, 27 Jul 2023 07:11:21 +0000
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
Cc: ulf.hansson@linaro.org, mturquette@baylibre.com,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_vgarodia@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 marijn.suijten@somainline.org, linux-clk@vger.kernel.org, rfoss@kernel.org,
 jonathan@marek.ca, stanimir.k.varbanov@gmail.com, agross@kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 bhupesh.sharma@linaro.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, robh+dt@kernel.org, mchehab@kernel.org,
 sean@poorly.run, neil.armstrong@linaro.org,
 Pavan Kondeti <quic_pkondeti@quicinc.com>, mathieu.poirier@linaro.org,
 sboyd@kernel.org, andersson@kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, quic_tdas@quicinc.com,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org,
 vladimir.zapolskiy@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 12:24:10PM +0530, Rohit Agarwal wrote:
> 
> On 7/27/2023 11:06 AM, Pavan Kondeti wrote:
> > On Thu, Jul 27, 2023 at 10:21:10AM +0530, Rohit Agarwal wrote:
> > > Update the RPMHPD references with new bindings defined in rpmhpd.h
> > > for Qualcomm SoCs SM8[2345]50.
> > > 
> > > Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> > > ---
> > >   Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml    | 3 ++-
> > >   Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml   | 3 ++-
> > >   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml     | 3 ++-
> > >   Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml    | 3 ++-
> > >   Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml   | 3 ++-
> > >   Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml    | 3 ++-
> > >   Documentation/devicetree/bindings/clock/qcom,videocc.yaml          | 3 ++-
> > >   Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml | 3 ++-
> > >   .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml          | 7 ++++---
> > >   Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml | 3 ++-
> > >   .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml          | 5 +++--
> > >   Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml | 3 ++-
> > >   .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml          | 7 ++++---
> > >   Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml | 3 ++-
> > >   .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml          | 7 ++++---
> > >   Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml     | 3 ++-
> > >   Documentation/devicetree/bindings/mmc/sdhci-msm.yaml               | 3 ++-
> > >   Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml  | 5 +++--
> > >   18 files changed, 44 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> > > index d6774db..d6b81c0 100644
> > > --- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> > > @@ -83,6 +83,7 @@ examples:
> > >     - |
> > >       #include <dt-bindings/clock/qcom,rpmh.h>
> > >       #include <dt-bindings/power/qcom-rpmpd.h>
> > > +    #include <dt-bindings/power/qcom,rpmhpd.h>
> > >       clock-controller@af00000 {
> > >         compatible = "qcom,sm8250-dispcc";
> > >         reg = <0x0af00000 0x10000>;
> > > @@ -103,7 +104,7 @@ examples:
> > >         #clock-cells = <1>;
> > >         #reset-cells = <1>;
> > >         #power-domain-cells = <1>;
> > > -      power-domains = <&rpmhpd SM8250_MMCX>;
> > > +      power-domains = <&rpmhpd RPMHPD_MMCX>;
> > >         required-opps = <&rpmhpd_opp_low_svs>;
> > >       };
> > >   ...
> > Does this file still need to include old header? The same is applicable
> > to some of the other files in the patch also.
> > 
> > We also discussed on the other thread [1] to move the regulator level
> > definitions to new header. should this change be done after that, so that
> > we don't end up touching the very same files again?
> > 
> > [1]
> > https://lore.kernel.org/all/a4zztrn6jhblozdswba7psqtvjt5l765mfr3yl4llsm5gsyqef@7x6q7yabydvm/
> Removing this header directly would also be fine as we are not using any
> macro defined directly in these
> bindings.
> I already checked with dt_binding_check by removing this header.
> 
Thanks for checking, then we should remove the old header in this patch
it self, right?

Thanks,
Pavan

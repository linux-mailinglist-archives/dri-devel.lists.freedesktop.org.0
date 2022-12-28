Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833866571DB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2A910E377;
	Wed, 28 Dec 2022 01:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D64110E375;
 Wed, 28 Dec 2022 01:52:28 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BS1RbQ2006084; Wed, 28 Dec 2022 01:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OWoUMHMAg6ZFQZMXZ1sQvOf70adLDMIIlMo8dd0/UUU=;
 b=OZTgQcvHqblhK/p/LeC+MgtmZI8Q82Y4hNFjcBxsja2zGnBtj9HUkM8A4KIqaTCMt9sw
 Xw3rjTXe0xle0Y2Vl0vRBWI/HFMMNx1JBNSK2v0Hj5ieGbhuSLQiOqGOL9TR0ApCh3Yv
 p/lWe0oSIMStvO59aFpbBe5/zCBI0KdRf2qqd5KzYSNMm9qj5/f8IUmPsTHQ9/s0GiMz
 rcDjyKfMTWSAZx4gqIYk5IK1BHYROsg1pQbWyOlIuQIbQyZ6BsIZgoVvwZ8M8CzDMWOk
 CT9HgdFZQwoMPSZJVsrpSlBp34Unv1vAF5cvE10PcWMBz75lFsozH3I6eFN17h53A5LE 3A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mnrd1dvk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Dec 2022 01:52:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BS1qNhI000348
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Dec 2022 01:52:23 GMT
Received: from [10.110.12.185] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 27 Dec
 2022 17:52:22 -0800
Message-ID: <9bec497c-a0f9-ac9a-03a4-82e42688df1f@quicinc.com>
Date: Tue, 27 Dec 2022 17:52:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] dt-bindings: msm/dsi: Don't require vdds-supply on 10nm
 PHY
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>, 
 <andersson@kernel.org>, <agross@kernel.org>,
 <krzysztof.kozlowski@linaro.org>
References: <20221116163218.42449-1-konrad.dybcio@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221116163218.42449-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: tpnjjpBv9_QGlzROx12kjvd7-_5yLgmr
X-Proofpoint-GUID: tpnjjpBv9_QGlzROx12kjvd7-_5yLgmr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_18,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=906
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212280011
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, patches@linaro.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/16/2022 8:32 AM, Konrad Dybcio wrote:
> On some SoCs (hello SM6350) vdds-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
> which is voted for in the DSI ctrl node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Fixes: 8fc939e72ff8 ("dt-bindings: msm: dsi: add yaml schemas for DSI 
PHY bindings")

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> index d9ad8b659f58..3ec466c3ab38 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -69,7 +69,6 @@ required:
>     - compatible
>     - reg
>     - reg-names
> -  - vdds-supply
>   
>   unevaluatedProperties: false
>   

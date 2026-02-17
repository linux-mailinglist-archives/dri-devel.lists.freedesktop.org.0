Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CKiD1L8k2n4+AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 06:27:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E491F148CE5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 06:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060CF10E43A;
	Tue, 17 Feb 2026 05:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TIlgbO1T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FE510E206;
 Tue, 17 Feb 2026 05:27:41 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61GNunqW1935465; Tue, 17 Feb 2026 05:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3BxA4miqDIYOLKIcAaLqUANJmnRjEKPnTXy72ZA8o0c=; b=TIlgbO1TItRjzDGN
 l16ab4NwKHqjxBZrOuj/Gkp8UNlL1Xl+Jh8QGIXW/k4HCoi0z4Z6KrO1dBUer/dl
 QJ0SdgUPh+klzdW7ZrQD3PfnGvLEojcfzYLJLO1bD7ACG1kIArUUos+YWkMoACD0
 cnnJ3+iZIksRFMX7h6rSCDWXa/dmhCmy5TqcKbn0nf8lY0Pxd6IekUHv7G7at+F5
 Mc4uFn3anFgDc9F5R9dlhPJNG6RQ3dXCJ9Dvs5MPYXs5lIngeAJ1SUc2E3RAxT33
 vJzYJWyUQ0K9jEUEvIW/HdtF0cvJe6sUS0nWkDTwFi287UTNXUBRN3kQ90iUz+RT
 BzjnhQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662sa4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Feb 2026 05:27:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61H5RQEk031672
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Feb 2026 05:27:26 GMT
Received: from [10.204.79.129] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 21:27:19 -0800
Message-ID: <4ae28713-9996-4662-85c1-52321e317eee@quicinc.com>
Date: Tue, 17 Feb 2026 10:57:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <andersson@kernel.org>,
 <robh@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <konradybcio@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonathan@marek.ca>, <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260124203925.2614008-1-quic_amakhija@quicinc.com>
 <20260124203925.2614008-2-quic_amakhija@quicinc.com>
 <CAFEp6-16r0eo3z0muGWk0G2-NGa-G7PdyM92z19xKPpE46v3mg@mail.gmail.com>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <CAFEp6-16r0eo3z0muGWk0G2-NGa-G7PdyM92z19xKPpE46v3mg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA0MyBTYWx0ZWRfX96evfY2n0c+f
 kCoeJ1mFo8KDnkxw7yn4ypyyFoI20SxxEV7FrBeVf/Mb3iNHGwTNKbeKx/P9LBm5TxtLpp+vnMJ
 p8NONYcDi91INoYGrTfIEBcBOgNJOXAl9xZCuvAoRGBy9nY/JQFAAzjCJCO4X0jIxYJnMrfduDc
 SsavOdTi28QwMuSykFht+2ea+g5fZu8+kekhcrauzA4N1PITeYxILUS0uPSCcqTeW7Ie92gxDca
 VbuKNCMw6AW6yVlNi6rZEd87rMSZoWdNsAToRiGb5DO8CCEX+OrLVXnQM8te9PbDYxjeJYcpT5c
 jctYWSVyPPzcx1v8Yyxt0iLhTjcD/Flh0qBGbgFnZpAD3O2oPQlwGP3Hc/goD8Q6O1Ma+gkT1u+
 RSJAM8S3P/i46A27BuQs1NweDkh85x41UYPEfVr7fqCxQysux5cX8hGk+IpWHu3LoF/EZgib8Fr
 KStamIN9iCJV+5uj2dg==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=6993fc3f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9P1oJjtBLAIuoJThx18A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hIdkFj0eyqlwPXQIFiCuSEZ0hs9-aDqo
X-Proofpoint-ORIG-GUID: hIdkFj0eyqlwPXQIFiCuSEZ0hs9-aDqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_08,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170043
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com,oss.qualcomm.com,poorly.run,somainline.org,kernel.org,intel.com,linaro.org,ideasonboard.com,marek.ca,kwiboo.se,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[quic_amakhija@quicinc.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,ae94000:email,0.0.0.1:email,qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E491F148CE5
X-Rspamd-Action: no action

On 2/12/2026 3:57 PM, Loic Poulain wrote:
> Hi Ayushi,
> 
> On Sat, Jan 24, 2026 at 9:39 PM Ayushi Makhija
> <quic_amakhija@quicinc.com> wrote:
>>
>> Add device tree nodes for the DSI0 controller with their corresponding
>> PHY found on Qualcomm QCS8300 SoC.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 105 ++++++++++++++++++++++++++-
>>  1 file changed, 104 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 5d2df4305d1c..7dda05bda3e7 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -3,6 +3,7 @@
>>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>
>> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>  #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>> @@ -5573,9 +5574,19 @@ port@0 {
>>                                                 reg = <0>;
>>
>>                                                 dpu_intf0_out: endpoint {
>> +
>>                                                         remote-endpoint = <&mdss_dp0_in>;
>>                                                 };
>>                                         };
>> +
>> +                                       port@1 {
>> +                                               reg = <1>;
>> +
>> +                                               dpu_intf1_out: endpoint {
>> +
>> +                                                       remote-endpoint = <&mdss_dsi0_in>;
>> +                                               };
>> +                                       };
>>                                 };
>>
>>                                 mdp_opp_table: opp-table {
>> @@ -5603,6 +5614,96 @@ opp-650000000 {
>>                                 };
>>                         };
>>
>> +                       mdss_dsi0: dsi@ae94000 {
>> +                               compatible = "qcom,qcs8300-dsi-ctrl",
>> +                                            "qcom,sa8775p-dsi-ctrl",
>> +                                            "qcom,mdss-dsi-ctrl";
>> +                               reg = <0x0 0x0ae94000 0x0 0x400>;
>> +                               reg-names = "dsi_ctrl";
>> +
>> +                               interrupt-parent = <&mdss>;
>> +                               interrupts = <4>;
>> +
>> +                               clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK>,
>> +                                        <&dispcc MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
>> +                                        <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK>,
>> +                                        <&dispcc MDSS_DISP_CC_MDSS_ESC0_CLK>,
>> +                                        <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
>> +                                        <&gcc GCC_DISP_HF_AXI_CLK>;
>> +                               clock-names = "byte",
>> +                                             "byte_intf",
>> +                                             "pixel",
>> +                                             "core",
>> +                                             "iface",
>> +                                             "bus";
>> +
>> +                               assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
>> +                                                 <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
>> +                               assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
>> +                                                        <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
>> +
>> +                               phys = <&mdss_dsi0_phy>;
> 
> I'm quite sure DSI requires a refgen regulator, so add the proper
> refgen-supply link.
> 
Hi Loic, sure will add in new patchset.

Thanks,
Ayushi

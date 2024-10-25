Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C2B9B1890
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 16:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2625310E12C;
	Sat, 26 Oct 2024 14:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VYryn2Ge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021DE10EB72
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 18:20:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PC33iq030348;
 Fri, 25 Oct 2024 18:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oAy1YgtvI9kU8j8PJEc4zNG2
 x9Wg7jzn8x8frdfkCN8=; b=VYryn2GeW1q2cbuvLXwTem4c6IMLWuKYTGSL5UIa
 V+kJW+4vKnYB5zmINrbC54hPwSRQTznfTLB29GEuWjK20dpMdo/LAIMqFLxjbj6H
 sYLi6TFGloepIQsK7wMHL/pRD6f5Lg0jeypdxIikHDxpF5ahcCME+2F+LEdbQMqM
 3y4RQl3KWtqucfQ71u2IB1OLXBTD/KnMjGMJd0lC664MtRcmncY1fP6EWUyf5H8o
 ddx30bBJmhEd5QXsItznPWjYfGMZMQQL3pJVJw05o6O7qUPCwVxV1KutnbAV79JD
 gqIy6szoDjwReNyPiU1VSD47JWGn3xbTDRdcN/pf7mWcUA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wa2w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2024 18:19:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PIJt51016820
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2024 18:19:55 GMT
Received: from [10.216.38.148] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 11:19:46 -0700
Content-Type: multipart/alternative;
 boundary="------------tv0rFu0HO0ZhZZs1T6CxipEO"
Message-ID: <d6e9900b-5cec-466e-9f0e-33af9cdf86d2@quicinc.com>
Date: Fri, 25 Oct 2024 23:49:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] arm64: dts: qcom: Add support for configuring
 channel TRE size
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
 <20241015120750.21217-3-quic_jseerapu@quicinc.com>
 <78a1c5c8-53c8-4144-b311-c34b155ca27c@kernel.org>
 <7e7ksit5ptjrcnct66v75mbxuabnzzloungockdal2dl2y6nn5@ge4mrsjmd746>
 <658c19c7-9eeb-4329-aa96-a4a9b09d7117@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
To: undisclosed-recipients:;
In-Reply-To: <658c19c7-9eeb-4329-aa96-a4a9b09d7117@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jN7rhtcKn2HyUg1atIdpw6-sIX7z0PP7
X-Proofpoint-GUID: jN7rhtcKn2HyUg1atIdpw6-sIX7z0PP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250140
X-Mailman-Approved-At: Sat, 26 Oct 2024 14:21:05 +0000
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

--------------tv0rFu0HO0ZhZZs1T6CxipEO
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/17/2024 12:40 PM, Krzysztof Kozlowski wrote:
> On 16/10/2024 16:35, Bjorn Andersson wrote:
>>>> @@ -1064,7 +1064,7 @@
>>>>   		};
>>>>   
>>>>   		gpi_dma0: dma-controller@900000 {
>>>> -			#dma-cells = <3>;
>>>> +			#dma-cells = <4>;
>>>>   			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
>>>>   			reg = <0 0x00900000 0 0x60000>;
>>>>   			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
>>>> @@ -1114,8 +1114,8 @@
>>>>   							"qup-memory";
>>>>   				power-domains = <&rpmhpd SC7280_CX>;
>>>>   				required-opps = <&rpmhpd_opp_low_svs>;
>>>> -				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
>>>> -				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
>>>> +				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C 64>,
>>>> +				       <&gpi_dma0 1 0 QCOM_GPI_I2C 64>;
>>> So everywhere is 64, thus this is fixed. Deduce it from the compatible
>>>
>> If I understand correctly, it's a software tunable property, used to
>> balance how many TRE elements that should be preallocated.
>>
>> If so, it would not be a property of the hardware/compatible, but rather
>> a result of profiling and a balance between memory "waste" and
>> performance.
> In such case I would prefer it being runtime-calculated by the driver,
> based on frequency or expected bandwidth.
>
> And in any case if this is about to stay, having here default values
> means all upstream users don't need it. What's not upstream, does not
> exist in such context. We don't add features which are not used by upstream.
>
> Best regards,
> Krzysztof


Thanks Krzysztof and Bjorn for the review comments.

I have reverted the changes of supporting channels tre size from DT and 
will make use of existing channel tre size defined in GPI driver which 
is 64.

Regards,

JyothiKumar.

>
--------------tv0rFu0HO0ZhZZs1T6CxipEO
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/17/2024 12:40 PM, Krzysztof
      Kozlowski wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:658c19c7-9eeb-4329-aa96-a4a9b09d7117@kernel.org">
      <pre class="moz-quote-pre" wrap="">On 16/10/2024 16:35, Bjorn Andersson wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">@@ -1064,7 +1064,7 @@
 		};
 
 		gpi_dma0: dma-controller@900000 {
-			#dma-cells = &lt;3&gt;;
+			#dma-cells = &lt;4&gt;;
 			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = &lt;0 0x00900000 0 0x60000&gt;;
 			interrupts = &lt;GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH&gt;,
@@ -1114,8 +1114,8 @@
 							"qup-memory";
 				power-domains = &lt;&amp;rpmhpd SC7280_CX&gt;;
 				required-opps = &lt;&amp;rpmhpd_opp_low_svs&gt;;
-				dmas = &lt;&amp;gpi_dma0 0 0 QCOM_GPI_I2C&gt;,
-				       &lt;&amp;gpi_dma0 1 0 QCOM_GPI_I2C&gt;;
+				dmas = &lt;&amp;gpi_dma0 0 0 QCOM_GPI_I2C 64&gt;,
+				       &lt;&amp;gpi_dma0 1 0 QCOM_GPI_I2C 64&gt;;
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
So everywhere is 64, thus this is fixed. Deduce it from the compatible

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
If I understand correctly, it's a software tunable property, used to
balance how many TRE elements that should be preallocated.

If so, it would not be a property of the hardware/compatible, but rather
a result of profiling and a balance between memory "waste" and
performance.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
In such case I would prefer it being runtime-calculated by the driver,
based on frequency or expected bandwidth.

And in any case if this is about to stay, having here default values
means all upstream users don't need it. What's not upstream, does not
exist in such context. We don't add features which are not used by upstream.

Best regards,
Krzysztof</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks <span style="white-space: pre-wrap">Krzysztof and </span><span
      style="white-space: pre-wrap">Bjorn for the review comments.</span></p>
    <p><span style="white-space: pre-wrap">I have reverted the changes of supporting channels tre size from DT and will make use of existing channel tre size defined in GPI driver which is 64.</span></p>
    <p><span style="white-space: pre-wrap">Regards,</span></p>
    <p><span style="white-space: pre-wrap">JyothiKumar. </span></p>
    <blockquote type="cite"
      cite="mid:658c19c7-9eeb-4329-aa96-a4a9b09d7117@kernel.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------tv0rFu0HO0ZhZZs1T6CxipEO--

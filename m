Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 858649D4D2C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 13:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0439810E915;
	Thu, 21 Nov 2024 12:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MsKk/+l4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5041E10E915
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 12:52:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL7v4AU023179;
 Thu, 21 Nov 2024 12:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IDQZyEdNFTl6ugScjbH51zYYXoRfidT+VjWlo/Wzb8c=; b=MsKk/+l4Ct/bKGZQ
 BAyo5III8MbR72ekMQAnlGzj9/p/4Dhdbo/5z8X23yerPr0/NAOBBDQMGqohi4w7
 Rr85AcoUHaW0+oK/Dshab2DzvfiFWQbPgSZxWLavgqJqbEQQjspCL8J8Cmoqlqmo
 XsqTiCrLgXNM1Wcmvcyw6T1GnbUMKTOwtFNUDzS6SGjEhZK5NAo+l+Z9KTdkASsX
 foQNNUmqZn+bFDfY8Xnv2CPNJnaEL3BQoAlhSwIHfn0Sm+kePKfUKkAli6fmlWEY
 tnvaAWaGeWkMfqX2rioq0sA2NDtwY8ti+Dt6XXsAvrRG0hH2W6JGoasShRY0z5Rr
 taNJRA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320wk0wp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2024 12:52:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALCqlYA008845
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2024 12:52:47 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 04:52:43 -0800
Message-ID: <775eb18a-b8d5-4503-b9ac-bfa79be115f2@quicinc.com>
Date: Thu, 21 Nov 2024 18:22:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND 2/3] i2c: qcom_geni: Update compile dependenices
 for qcom geni
To: Bjorn Andersson <andersson@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
 <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
 <quic_vtanuku@quicinc.com>
References: <20241111140244.13474-1-quic_jseerapu@quicinc.com>
 <20241111140244.13474-3-quic_jseerapu@quicinc.com>
 <3fkfjeif3e4z3utcim5dou2obwjoagtr3z2bnwkywa2xlm4jrb@jon6mwtp4ahv>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <3fkfjeif3e4z3utcim5dou2obwjoagtr3z2bnwkywa2xlm4jrb@jon6mwtp4ahv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 5JzLxyqB180F_xC2Lu4YmMgymE60ApOx
X-Proofpoint-GUID: 5JzLxyqB180F_xC2Lu4YmMgymE60ApOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=966
 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210101
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



On 11/12/2024 9:39 AM, Bjorn Andersson wrote:
> On Mon, Nov 11, 2024 at 07:32:43PM +0530, Jyothi Kumar Seerapu wrote:
>> I2C_QCOM_GENI is having compile dependencies on QCOM_GPI_DMA and
>> so update I2C_QCOM_GENI to depends on QCOM_GPI_DMA.
>>
> 
> Given that this is a separate patch, your wording can only be
> interpreted as this being an existing problem.
> 
>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>> ---
>>
>> v1 -> v2:
>> 	This patch is added in v2 to address the kernel test robot
>> 	reported compilation error.
>> 	ERROR: modpost: "gpi_multi_desc_process" [drivers/i2c/busses/i2c-qcom-geni.ko] undefined!
> 
> But as far as I can tell you introduce this problem in patch 3. If so
> this addition should be part of patch 3.

Sure, this change is added part of patch3.
> 
> 
> 
> Also, you have different subject prefix for patch 2 and 3, yet they
> relate to the same driver. Not pretty.
Thanks, corrected it.
> 
> Regards,
> Bjorn
> 
>>
>> drivers/i2c/busses/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index 0aa948014008..87634a682855 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -1049,6 +1049,7 @@ config I2C_QCOM_GENI
>>   	tristate "Qualcomm Technologies Inc.'s GENI based I2C controller"
>>   	depends on ARCH_QCOM || COMPILE_TEST
>>   	depends on QCOM_GENI_SE
>> +	depends on QCOM_GPI_DMA
>>   	help
>>   	  This driver supports GENI serial engine based I2C controller in
>>   	  master mode on the Qualcomm Technologies Inc.'s SoCs. If you say
>> -- 
>> 2.17.1
>>
>>

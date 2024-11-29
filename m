Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D19DC198
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 10:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D4410EDC5;
	Fri, 29 Nov 2024 09:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bsSSD7Ri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8457F10EDC5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 09:43:57 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT83vaN004494;
 Fri, 29 Nov 2024 09:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gtdtYxt7yTx0KLUyvnV//EGcEUs43332Pgjx121kuL0=; b=bsSSD7Ri3plJQvi8
 zPj4mIWtdu97ZjIE7lhs7J86zAit3tcHWzAD7bb8TSWxWyR3QxfdyXXiK4+tpl/f
 JS8STX0l4sqKTN6ujsc5mHJ4vFFdr6HFPDlXu+3Yo9qknR2Z5vPHm5J5YWtigDXx
 FEP4z4slksOb/pzMTWk1emwokXSs8bw5AuX03l04qUzySIc+C0CKXBKYdzX/jMAL
 NNAmp1CnVi60wRVItvNUg8C09mQo2F9Ararp/FrrpF+APVRrwn3ukYJoEUGGalAC
 /4Wg9dBkMsYfmRrF78IYAQK+XmwCniUg5dCX5vniYzWulC3wT7epXzgAAW0uwgoE
 YFS+LQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4379s6r8fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 09:43:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT9hoKR025335
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 09:43:50 GMT
Received: from [10.216.24.185] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 01:43:46 -0800
Message-ID: <a52483fb-d8ea-4dfd-9d29-5270376de1d9@quicinc.com>
Date: Fri, 29 Nov 2024 15:13:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] i2c: i2c-qcom-geni: Update compile dependenices
 for I2C GENI driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
 <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
 <quic_vtanuku@quicinc.com>
References: <20241121130134.29408-1-quic_jseerapu@quicinc.com>
 <20241121130134.29408-4-quic_jseerapu@quicinc.com>
 <zfkhbjm6wrmcocqcvluov3nbrpb2ozbo52c6nlwxro44gublcw@5645ksz4cfm2>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <zfkhbjm6wrmcocqcvluov3nbrpb2ozbo52c6nlwxro44gublcw@5645ksz4cfm2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 42OQXquwmQrh0AN9gU47rFgN46NHDaud
X-Proofpoint-GUID: 42OQXquwmQrh0AN9gU47rFgN46NHDaud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290079
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



On 11/22/2024 3:40 AM, Dmitry Baryshkov wrote:
> On Thu, Nov 21, 2024 at 06:31:34PM +0530, Jyothi Kumar Seerapu wrote:
>> I2C functionality has dependencies on the GPI driver.
>> Ensure that the GPI driver is enabled when using the I2C
>> driver functionality.
>> Therefore, update the I2C GENI driver to depend on the GPI driver.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>> ---
>> v2 -> v3:
>>     - Moved this change to patch3.
>>     - Updated commit description.
>>
>> v1 -> v2:
>>     -  This patch is added in v2 to address the kernel test robot
>>        reported compilation error.
>>        ERROR: modpost: "gpi_multi_desc_process" [drivers/i2c/busses/i2c-qcom-geni.ko] undefined!
>>
>>   drivers/i2c/busses/Kconfig | 1 +
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
> 
> So... without this change the previous patch is broken, which is a
> no-go. And anyway, adding dependency onto a particular DMA driver is a
> bad idea. Please make use of the DMA API instead.

Sure, thanks for the details. In V4, will withdraw these changes.
> 
>>   	help
>>   	  This driver supports GENI serial engine based I2C controller in
>>   	  master mode on the Qualcomm Technologies Inc.'s SoCs. If you say
>> -- 
>> 2.17.1
>>
> 

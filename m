Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EB690E41D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 09:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D2810EA3A;
	Wed, 19 Jun 2024 07:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="p4ssT5bg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BD010E996
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 06:45:21 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILatwX005243;
 Wed, 19 Jun 2024 06:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2zQG5rpfveKT5CZj2sKXl6+Qs2AE/hn/5gVvr49XbQw=; b=p4ssT5bgYadotBzC
 LVb1dPhR0ydsafJpE7w/qhT5ebY0R36xtX/RcMBTupfUnlrZMS4Es5i90aQAbbPr
 VWCfzQgjiopEG0ZgGnQToIhXIak2cJ7AH5QoOLdNWX9ONAJeIMcD586j7hekcaD/
 upEwisPd59EiHEhQ9Ml1vFai3ENAnVtOPphv5fzMY6JP0rZQ4fT0L2tBNCNC9pRe
 gE7FRzIiAlsx4BuIeEfHCaFHdYitXs+2ExU/4mcJfgo+33wMV7U2dbO9629hIrTu
 fGYFlCCnLxv9qDr6dwzctmgqrjolJL/clcWO1Zg/CLF/3Iv6+fk+MgzaLuuYwhDf
 HExnsg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja78v0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 06:45:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45J6j9xg019592
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 06:45:09 GMT
Received: from [10.206.107.125] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 23:45:06 -0700
Message-ID: <00b2c65e-c00e-48bf-b118-4785d216cd19@quicinc.com>
Date: Wed, 19 Jun 2024 12:15:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Oded Gabbay
 <ogabbay@kernel.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3cyEyfsJrW4uV-d2w2MWgoiE8b1NlTu3
X-Proofpoint-GUID: 3cyEyfsJrW4uV-d2w2MWgoiE8b1NlTu3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=894 malwarescore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190048
X-Mailman-Approved-At: Wed, 19 Jun 2024 07:12:53 +0000
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



On 6/12/2024 11:58 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
>> Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
>> to be added for PD notifications and other missing features. Adding
>> and maintaining new files from within fastrpc directory would be easy.
>>
>> Example of feature that is being planned to be introduced in a new C
>> file:
>> https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
>>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  MAINTAINERS                          |  2 +-
>>  drivers/misc/Kconfig                 | 13 +------------
>>  drivers/misc/Makefile                |  2 +-
>>  drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
>>  drivers/misc/fastrpc/Makefile        |  2 ++
>>  drivers/misc/{ => fastrpc}/fastrpc.c |  0
>>  6 files changed, 21 insertions(+), 14 deletions(-)
>>  create mode 100644 drivers/misc/fastrpc/Kconfig
>>  create mode 100644 drivers/misc/fastrpc/Makefile
>>  rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> Please consider whether it makes sense to move to drivers/accel instead
> (and possibly writing a better Kconfig entry, specifying that the driver
> is to be used to offload execution to the DSP).
Planning to keep the driver to misc/ only as part of this patch. Moving to accel/ might
introduce some conventions to be followed which might require significant changes
in driver.

I'll write more meaningful Kconfig entry in next spin.

Thanks
--Ekansh
>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d6c90161c7bf..e9c79e9063f8 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -18501,7 +18501,7 @@ M:	Amol Maheshwari <amahesh@qti.qualcomm.com>
>>  L:	linux-arm-msm@vger.kernel.org
>>  S:	Maintained
>>  F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> -F:	drivers/misc/fastrpc.c
>> +F:	drivers/misc/fastrpc/
>>  F:	include/uapi/misc/fastrpc.h
>>  
>>  QUALCOMM HEXAGON ARCHITECTURE
>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> index faf983680040..630e8ccd8669 100644
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -276,18 +276,6 @@ config QCOM_COINCELL
>>  	  to maintain PMIC register and RTC state in the absence of
>>  	  external power.
>>  
>> -config QCOM_FASTRPC
>> -	tristate "Qualcomm FastRPC"
>> -	depends on ARCH_QCOM || COMPILE_TEST
>> -	depends on RPMSG
>> -	select DMA_SHARED_BUFFER
>> -	select QCOM_SCM
>> -	help
>> -	  Provides a communication mechanism that allows for clients to
>> -	  make remote method invocations across processor boundary to
>> -	  applications DSP processor. Say M if you want to enable this
>> -	  module.
>> -
>>  config SGI_GRU
>>  	tristate "SGI GRU driver"
>>  	depends on X86_UV && SMP
>> @@ -602,4 +590,5 @@ source "drivers/misc/cardreader/Kconfig"
>>  source "drivers/misc/uacce/Kconfig"
>>  source "drivers/misc/pvpanic/Kconfig"
>>  source "drivers/misc/mchp_pci1xxxx/Kconfig"
>> +source "drivers/misc/fastrpc/Kconfig"
>>  endmenu
>> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
>> index 153a3f4837e8..f83d73844ea5 100644
>> --- a/drivers/misc/Makefile
>> +++ b/drivers/misc/Makefile
>> @@ -16,7 +16,6 @@ obj-$(CONFIG_TIFM_CORE)       	+= tifm_core.o
>>  obj-$(CONFIG_TIFM_7XX1)       	+= tifm_7xx1.o
>>  obj-$(CONFIG_PHANTOM)		+= phantom.o
>>  obj-$(CONFIG_QCOM_COINCELL)	+= qcom-coincell.o
>> -obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
>>  obj-$(CONFIG_SENSORS_BH1770)	+= bh1770glc.o
>>  obj-$(CONFIG_SENSORS_APDS990X)	+= apds990x.o
>>  obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
>> @@ -69,3 +68,4 @@ obj-$(CONFIG_TMR_INJECT)	+= xilinx_tmr_inject.o
>>  obj-$(CONFIG_TPS6594_ESM)	+= tps6594-esm.o
>>  obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
>>  obj-$(CONFIG_NSM)		+= nsm.o
>> +obj-y				+= fastrpc/
>> diff --git a/drivers/misc/fastrpc/Kconfig b/drivers/misc/fastrpc/Kconfig
>> new file mode 100644
>> index 000000000000..3243dc56b2a0
>> --- /dev/null
>> +++ b/drivers/misc/fastrpc/Kconfig
>> @@ -0,0 +1,16 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# Qualcomm FastRPC devices
>> +#
>> +
>> +config QCOM_FASTRPC
>> +	tristate "Qualcomm FastRPC"
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on RPMSG
>> +	select DMA_SHARED_BUFFER
>> +	select QCOM_SCM
>> +	help
>> +	  Provides a communication mechanism that allows for clients to
>> +	  make remote method invocations across processor boundary to
>> +	  applications DSP processor. Say M if you want to enable this
>> +	  module.
>> \ No newline at end of file
>> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
>> new file mode 100644
>> index 000000000000..77fd2b763b6b
>> --- /dev/null
>> +++ b/drivers/misc/fastrpc/Makefile
>> @@ -0,0 +1,2 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc/fastrpc.c
>> similarity index 100%
>> rename from drivers/misc/fastrpc.c
>> rename to drivers/misc/fastrpc/fastrpc.c
>> -- 
>> 2.43.0
>>


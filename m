Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736EB9B25A3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 07:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C120610E344;
	Mon, 28 Oct 2024 06:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HZub/aH6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01AB10E344
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 06:33:00 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RLTlG1027417;
 Mon, 28 Oct 2024 06:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +Qw+FLHj+Dl+u0+4sab+m9r1yUWuDHpofhdSqmcUwdE=; b=HZub/aH6YSeiNUzF
 Eoh3VuSS5E0+603jKcd6ekiXrvRWUPSuLq76LbPB1RdWhRHtl3mZlID7dTJV2U0k
 LhB5ccKtkr/GnSqnuiKETGFmlTs8BsACX0wSye/4a59IohmlBOE5o3VOE6+7a3iJ
 NHu27uvrp1i4BT889Py9ukBO6ZUN2yb/DKko5tvNWkkDCB+GxBsCFLR84KWyq2CK
 PA+BH6VtaY5Zfx5sGPZGMplfAPJEfb+lULHtrdZQuFuK/Kc+nug605aT6fuoHVM3
 NbYs63uYree8U0UWQs66A7NPrX9SweFLPrThomnxvOf3WpUEmh6f/iPY5+5alJlG
 5TnFWQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn4uwew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2024 06:32:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S6Wr7O027687
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2024 06:32:53 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 23:32:47 -0700
Message-ID: <f9c0a0be-6d2c-415d-983a-dec5d20a3ecc@quicinc.com>
Date: Mon, 28 Oct 2024 12:02:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] dmaengine: qcom: gpi: Add provision to support TRE
 size as the fourth argument of dma-cells property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
 <quic_vtanuku@quicinc.com>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
 <20241015120750.21217-4-quic_jseerapu@quicinc.com>
 <333948f0-44ff-424a-8d38-5fba719d2aeb@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <333948f0-44ff-424a-8d38-5fba719d2aeb@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -_0h1Dh-XhPoAyQTSsPZnKyg0t7ImVbX
X-Proofpoint-ORIG-GUID: -_0h1Dh-XhPoAyQTSsPZnKyg0t7ImVbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280053
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



On 10/25/2024 11:47 PM, Konrad Dybcio wrote:
> On 15.10.2024 2:07 PM, Jyothi Kumar Seerapu wrote:
>> The current GPI driver hardcodes the channel TRE (Transfer Ring Element)
>> size to 64. For scenarios requiring high performance with multiple
>> messages in a transfer, use Block Event Interrupt (BEI).
>> This method triggers interrupt after specific message transfers and
>> the last message transfer, effectively reducing the number of interrupts.
>> For multiple transfers utilizing BEI, a channel TRE size of 64 is
>> insufficient and may lead to transfer failures, indicated by errors
>> related to unavailable memory space.
>>
>> Added provision to modify the channel TRE size via the device tree.
>> The Default channel TRE size is set to 64, but this value can update
>> in the device tree which will then be parsed by the GPI driver.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>> ---
> 
> 1. Is the total memory pool for these shared?
Total memory we need preallocate and so for each serial engine this 
mentioned channel TRE size be used for config, go, dma tres preparation.
> 
> 2. Is there any scenario where we want TRE size to be lower and
>     not higher? Are there any drawbacks to always keeping them at
>     SOME_MAX_VALUE?
We are keeping minimum channel tre size to 64 to make sure that enough 
size is present to handle the requested transfers.
> 
> 3. Is this something we should configure at boot time (in firmware)?
>     Perhaps this could be decided based on client device settings (which
>     may or may not require adding some field in the i2c framework)
> 
This memory is for software usecase and preallocated prior to GPI driver 
allocated this memory to channels and events handling.

I have reverted the changes related to adding new argument for dma-cells 
property and instead used existing value for channel TRE size in GPI 
driver, which is 64.

> 
> Konrad


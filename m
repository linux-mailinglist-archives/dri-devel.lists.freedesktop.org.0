Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9939B9F98A0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 18:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5124510E2CC;
	Fri, 20 Dec 2024 17:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XRdT+A5W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C7310E2CC
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 17:50:24 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBbgoi023148;
 Fri, 20 Dec 2024 17:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VI2zlFkuGJMcoqTxZvE7t7cO7B3ftY5nFuRyA8qwXc8=; b=XRdT+A5WF+unfSWT
 +K8uXtYDfdrnlFauQjE9d6/MMSvHFeufnSpbbU4yPm1uIBWDNLmnQxnhR9m8st5y
 Jz0vKX0ALuKLb+jmDIUWNgVhNfXrjTfN1DNon1CmXUJ8WZpS39s8gQ2KznNDoiz0
 LDvdiDT8p4Le7f+3ZTIOXE+M+qT7ptjChaVW7AQmbiXBloQtbG1frX/AomvNaPtB
 nRxuNOlsNpoDRyRsYuTWgwlwalIfBSugpot0898R54aIbJOt4tVDGb67CNDkPCsS
 0mGXRqjdn/PWDdiaetTMJ0TuXNGsMo69YPu72u8XiKD0/7mr7DY8momi3YHiLtbu
 9APxwQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n7vg106p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Dec 2024 17:50:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKHoGp6032570
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Dec 2024 17:50:17 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Dec
 2024 09:50:16 -0800
Message-ID: <ed88797f-9094-ed93-5036-0af42767dbe3@quicinc.com>
Date: Fri, 20 Dec 2024 10:50:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 7/7] accel/qaic: Add AIC200 support
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <quic_carlv@quicinc.com>,
 <manivannan.sadhasivam@linaro.org>, <quic_yabdulra@quicinc.com>,
 <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-8-quic_jhugo@quicinc.com>
 <65a59247-f028-28f9-1a65-5e4dd62dadec@amd.com>
 <dd83ba8c-0b37-7d1e-39a7-4b25ef7e5faf@quicinc.com>
 <ce41ab48-a923-7a29-1c50-3338fed39ea6@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <ce41ab48-a923-7a29-1c50-3338fed39ea6@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3QKbM1CHyj0dHB1lOCi3OE3gZAmTbfF8
X-Proofpoint-ORIG-GUID: 3QKbM1CHyj0dHB1lOCi3OE3gZAmTbfF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200142
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

On 12/20/2024 10:33 AM, Lizhi Hou wrote:
> 
> On 12/20/24 09:26, Jeffrey Hugo wrote:
>> On 12/13/2024 5:49 PM, Lizhi Hou wrote:
>>>
>>> On 12/13/24 13:33, Jeffrey Hugo wrote:
>>>> +static const struct qaic_device_config aic200_config = {
>>>> +    .family = FAMILY_AIC200,
>>>> +    .bar_mask = BIT(0) | BIT(1) | BIT(2) | BIT(4),
>>>
>>> Will this pass the BAR mask check in init_pci()?
>>
>> Yes, BITs 0, 1, 2, 4 would be 0x17 and that value is & with 0x3f 
>> (masking off upper bits).  The result would be 0x17.
> 
> It seems BIT(1) is not expected in init_pci?
> 
>      if (bars != (BIT(0) | BIT(2) | BIT(4))) {

I think you are only referencing patch 5, when you should also reference 
patch 6.  This check gets modified in patch 6 -

-	if (bars != (BIT(0) | BIT(2) | BIT(4))) {
-		pci_dbg(pdev, "%s: expected BARs 0, 2, and 4 not found in device. 
Found 0x%x\n",
-			__func__, bars);
+	if (bars != config->bar_mask) {
+		pci_dbg(pdev, "%s: expected BARs %#x not found in device. Found %#x\n",
+			__func__, config->bar_mask, bars);
  		return -EINVAL;
  	}


Do you still see an issue?


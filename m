Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19B49F9797
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 18:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0EA10EFE3;
	Fri, 20 Dec 2024 17:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TPJ66f/L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2562D10EFE3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 17:15:21 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBufEt021470;
 Fri, 20 Dec 2024 17:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jL8wzg1WIwIc06XhdSbJ86n/ra6NV5dfqg+1tzKaYwc=; b=TPJ66f/LcFTXQO0L
 be9kt+j80PjKg0LauW+1TIBHn+Y+YUqiGlKyLg/n9y5k0X2gGk8oqlsMV6Ud+5a8
 WAieeWPq/CldfmP5H49xiU6M+hxY2ACdV/XIGPnj7qIz5XcByziELAHehDhKT6UA
 8ms/iiD9sgeqQ5ABuRJfrJzkoNAtZxqyZvfOGJs8ihA8yrcnCYeYw2q90uC8Ee01
 cgvpXNw3CmbQ8gmvfMID6NBN1F8e2B6e2O9yO8d+YEZm9JHoTG4F5YSZy3ID0aBe
 GIrRbchKX0lmFZfqRXUMggQH01TcYnRV/F2FmzH9f+ZePuRXRbj6FsicA9GAhpam
 AhufiQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n85d8uex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Dec 2024 17:15:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKHFD7r002329
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Dec 2024 17:15:13 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Dec
 2024 09:15:12 -0800
Message-ID: <c24e081b-7e2a-4bb0-9445-458e21e964f3@quicinc.com>
Date: Fri, 20 Dec 2024 10:15:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 6/7] accel/qaic: Add config structs for supported cards
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <quic_carlv@quicinc.com>,
 <manivannan.sadhasivam@linaro.org>, <quic_yabdulra@quicinc.com>,
 <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-7-quic_jhugo@quicinc.com>
 <cd442cee-a37d-7d3b-8acf-59a3b5138bf4@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <cd442cee-a37d-7d3b-8acf-59a3b5138bf4@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: -44IGdAB1AHWsexn3k_gSIkcTuSGcU6m
X-Proofpoint-GUID: -44IGdAB1AHWsexn3k_gSIkcTuSGcU6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=892 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412200138
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

On 12/13/2024 5:35 PM, Lizhi Hou wrote:
> 
> On 12/13/24 13:33, Jeffrey Hugo wrote:
>> -static struct qaic_device *create_qdev(struct pci_dev *pdev, const 
>> struct pci_device_id *id)
>> +static struct qaic_device *create_qdev(struct pci_dev *pdev,
>> +                       const struct qaic_device_config *config)
>>   {
>>       struct device *dev = &pdev->dev;
>>       struct qaic_drm_device *qddev;
>> @@ -365,12 +391,10 @@ static struct qaic_device *create_qdev(struct 
>> pci_dev *pdev, const struct pci_de
>>           return NULL;
>>       qdev->dev_state = QAIC_OFFLINE;
>> -    if (id->device == PCI_DEV_AIC080 || id->device == PCI_DEV_AIC100) {
>> -        qdev->num_dbc = 16;
>> -        qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, 
>> sizeof(*qdev->dbc), GFP_KERNEL);
>> -        if (!qdev->dbc)
>> -            return NULL;
>> -    }
>> +    qdev->num_dbc = 16;
> 
> Is it better to put num_dbc in qaic_device_config?

I think there is no clear "right answer".  All known devices use 16. 
There may be a future device which has a different value, at which point 
I think this needs to be in qaic_device_config.  For this patch, I was 
conservative and only included items in qaic_device_config which do vary 
between the known devices.

I'll think in this a bit more.

> 
> Thanks,
> 
> Lizhi
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1B79B0CC3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 20:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5635D10EB6F;
	Fri, 25 Oct 2024 18:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="W9QkW8Dp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B6210EB6F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 18:12:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBoPao026096;
 Fri, 25 Oct 2024 18:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EvqTHD3AOeoanjh0hJCV1UA/D77b/1zguJLN43kmrs8=; b=W9QkW8DpDhHr5mh8
 5uMFybPIkIbL4KDzDu8r6DxoT2eJK7tVXecG5yp/tjgWKKfzFAXqvWIzDSoOricA
 pQ4abZsfsPXgkGRGaqWhUGGdpbCDCZt58n5UOxiqFvoTB2iDVnSqOD2pc2uCri9q
 F5JdSyaWhJMEozHLc9IZAK22kOSA2xIcnK1T7i9GOeUk8G39TAR6ZmwvFqvfjVl2
 vg61poePy4TJ/4NAEAkFErWnK5SYLpzcm1imTemFNOz982eBiK8/KR6YKHiYrSaF
 j65YMxRhusUXxNhVZJiWNwNyEoLJHMVBNLJi2a+HK4LmfqrLcPy1shF9yPzt2XK3
 cgec/g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wt384-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2024 18:12:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PIC3ib005047
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2024 18:12:03 GMT
Received: from [10.216.38.148] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 11:11:57 -0700
Message-ID: <7f0987c6-5f44-47c4-ad98-d10700b32383@quicinc.com>
Date: Fri, 25 Oct 2024 23:41:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] dt-bindings: dmaengine: qcom: gpi: Add additional
 arg to dma-cell property
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 "Sumit Semwal" <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
 <quic_vtanuku@quicinc.com>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
 <20241015120750.21217-2-quic_jseerapu@quicinc.com>
 <0c304de2-26c6-49b3-9809-bf1e7619e5b8@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <0c304de2-26c6-49b3-9809-bf1e7619e5b8@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -14JeimTgOlYk4AEPC3DqM1KaMGfH3IS
X-Proofpoint-ORIG-GUID: -14JeimTgOlYk4AEPC3DqM1KaMGfH3IS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 mlxlogscore=985 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250139
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


On 10/15/2024 7:01 PM, Krzysztof Kozlowski wrote:
> On 15/10/2024 14:07, Jyothi Kumar Seerapu wrote:
>> When high performance with multiple i2c messages in a single transfer
>> is required, employ Block Event Interrupt (BEI) to trigger interrupts
>> after specific messages transfer and the last message transfer,
>> thereby reducing interrupts.
>>
>> For each i2c message transfer, a series of Transfer Request Elements(TREs)
>> must be programmed, including config tre for frequency configuration,
>> go tre for holding i2c address and dma tre for holding dma buffer address,
>> length as per the hardware programming guide. For transfer using BEI,
>> multiple I2C messages may necessitate the preparation of config, go,
>> and tx DMA TREs. However, a channel TRE size of 64 is often insufficient,
>> potentially leading to failures due to inadequate memory space.
> Please kindly test the patches before you sent them. Upstream is not a
> testing service.

Sure, i will take care to test the required patches.


>
> Best regards,
> Krzysztof
>

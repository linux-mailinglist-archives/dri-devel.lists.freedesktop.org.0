Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C586291AB03
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C1710E00A;
	Thu, 27 Jun 2024 15:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="b6+UfSJt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC6C10EA73
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 11:20:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R2kkJ6018190;
 Thu, 27 Jun 2024 11:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OUE7BDXt8xyZYKC7KXK5T2sUjQ7gfHYZIAdwzaUj9cA=; b=b6+UfSJtuTY8IfH3
 DrIeVJlDcbf57ULf2F1gXW9dE/Kj50zSdzGPIX+XY/3/OcPlQBXrq4clvgTJ0+Xv
 MsdMoBOexorm1/qQjey6/NxBLV7ZhuaAEet5zqJ+yyVZg8tjfbopFMlKBFnEfuU7
 4Cql6ZbIa0Z8obZCV2WJpBM6XVvupO9KNt7JZjWKzCtaVAEIP3Z6nlKSCgTFfvVW
 8R2UFZQY7lpA5A3SKwaheVhvRD7mRRdWuy6I4vIyQx8baOvplWVZtJnyDT9zY474
 YSfmSTjh3ppitefEDKXYPCxKXaX8HWnc/vMjEzUh91e2bvOQafo7OAxt1oMlkF27
 3ooOlQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywppvbt9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 11:20:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45RBKjoQ023843
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 11:20:45 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 04:20:42 -0700
Message-ID: <bf5661dd-9d3b-4e7e-868b-600efdf3d65f@quicinc.com>
Date: Thu, 27 Jun 2024 16:50:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <arnd@arndb.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240627104245.1651214-1-quic_ekangupt@quicinc.com>
 <2024062715-ultra-muppet-c899@gregkh>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024062715-ultra-muppet-c899@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: uPx-b0PPAW9Wk8l-6xF0vTW-rjI7nYNz
X-Proofpoint-ORIG-GUID: uPx-b0PPAW9Wk8l-6xF0vTW-rjI7nYNz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_06,2024-06-27_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406270086
X-Mailman-Approved-At: Thu, 27 Jun 2024 15:21:11 +0000
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



On 6/27/2024 4:48 PM, Greg KH wrote:
> On Thu, Jun 27, 2024 at 04:12:44PM +0530, Ekansh Gupta wrote:
>> Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
>> to be added for PD notifications and other missing features. Adding
>> and maintaining new files from within fastrpc directory would be easy.
>>
>> Example of feature that is being planned to be introduced in a new C
>> file:
>> https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
>>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>> Changes in v2:
>>   - Updated Kconfig.
>> Changes in v3:
>>   - Added newline in kconfig.
>>
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
> For now, no, sorry, not a new directory for just one .c file.
>
> If you want to add more stuff, wonderful, then do this as the first
> commit of the series when that actually happens.
>
> sorry, but I'm not going to take this now.
Sure, understood. I will bring in the new file/s along with this new directory change.

--Ekansh
> greg k-h


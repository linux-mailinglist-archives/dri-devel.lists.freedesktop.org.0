Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998C79D477D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 07:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D423D10E130;
	Thu, 21 Nov 2024 06:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="S1jOWJSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B83D10E130
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 06:25:25 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKJujd9006031;
 Thu, 21 Nov 2024 06:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /He31/zSuIoyM8liQVZXh3lBwnQ1JwgncJP/XBmnxnw=; b=S1jOWJSUfRnEDpiX
 HQbFPUjGKpSNiueu9HlBsBGaNdRMzprLobNY7dETrbl2IIO8xvuDOyOgMr56CqJW
 6kpNezhrcsSUiU8YDeOFGFSiF3UMLJ3W7WWYa/krbptPn6A6UW9A6mpq4+qmFAkv
 L+Jh7k31YexVJ1i6CHxowfqo3lXCB7YATh/4sZBu/a9F3vDc04YmdIXEK+ZhK9Kq
 8zxaVJwLa+pcNX2S99qnQ0zViVKgLPykaRya8970sHjlu/cAWKSFkZYAykFdzy8E
 norixYzTAAlOz1WIYAr1uRZwhoo4yUcYClqzAER4XXnUfgSJHSr7sFdiat1Gkm44
 7tEp8w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4317t23mqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2024 06:25:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL6PKp7002520
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2024 06:25:20 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 22:24:24 -0800
Message-ID: <6e1fa7cc-c80b-40c1-aee5-d2e954ae1513@quicinc.com>
Date: Thu, 21 Nov 2024 11:54:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] misc: fastrpc: Rename fastrpc.c to fastrpc_main.c
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <arnd@arndb.de>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-3-quic_ekangupt@quicinc.com>
 <2024111841-egotistic-unranked-ad4a@gregkh>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024111841-egotistic-unranked-ad4a@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 64uoepTuLKebVLXedNi06VAfJtK8lZNg
X-Proofpoint-ORIG-GUID: 64uoepTuLKebVLXedNi06VAfJtK8lZNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210047
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



On 11/18/2024 7:28 PM, Greg KH wrote:
> On Mon, Nov 18, 2024 at 02:10:44PM +0530, Ekansh Gupta wrote:
>> Rename the main fastrpc source file to accomodate new files to be
>> compiled in the same kernel object.
>>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc/Makefile                      | 1 +
>>  drivers/misc/fastrpc/{fastrpc.c => fastrpc_main.c} | 0
>>  2 files changed, 1 insertion(+)
>>  rename drivers/misc/fastrpc/{fastrpc.c => fastrpc_main.c} (100%)
>>
>> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
>> index 77fd2b763b6b..020d30789a80 100644
>> --- a/drivers/misc/fastrpc/Makefile
>> +++ b/drivers/misc/fastrpc/Makefile
>> @@ -1,2 +1,3 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
>> +fastrpc-objs	:= fastrpc_main.o
>> \ No newline at end of file
>> diff --git a/drivers/misc/fastrpc/fastrpc.c b/drivers/misc/fastrpc/fastrpc_main.c
>> similarity index 100%
>> rename from drivers/misc/fastrpc/fastrpc.c
>> rename to drivers/misc/fastrpc/fastrpc_main.c
> Why not just "main.c"?  You are in your own subdir, no need for the
> fastrpc_* prefix anymore, right?
Ack. I will update the names in next patchset. Thanks.

--ekansh
> thanks,
>
> greg "naming is hard" k-h


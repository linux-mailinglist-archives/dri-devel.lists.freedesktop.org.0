Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A58C9398F2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 06:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50ED10E3FA;
	Tue, 23 Jul 2024 04:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MO5ejMxO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFC410E3FA
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 04:37:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MMP2bb026365;
 Tue, 23 Jul 2024 04:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RJZP5SvLZT9uydmvhiZ+gjBOkuDGN8SCcvs3Mq+DGbo=; b=MO5ejMxOJULsRUn8
 3u3eIjQfvRfDdj8alHP7BmRTL7h6JduybLACimcxOTUReZ3dULaeWNn/Vwp3whB2
 /NhiJc3WjRA2K9zTwk2yDIdAjMHpe7VxjWQ4dAs6y8EshJpq9R9bfzcvLCmCAmwP
 HKy4WImocrba63UvF/TwV98yC6iMFB5kkEO8Stod7h4HWA8udEj/CPLRfcqIvy9x
 aZIga8v3envUDlkqaGQe46AYgazCPXsj5346xLvY13FJjVfMdgE+5fTY8Ts8AwmR
 tPaIGgU5Lx2DgCFbUKDgI1ItPUt8Lz64oHMJ+5PrRodTtVtZuC4YN+1LKGb16gvK
 vrtBMA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g46s5kj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jul 2024 04:37:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46N4bYVr010787
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jul 2024 04:37:34 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 21:37:31 -0700
Message-ID: <396b3e20-19da-4c92-ba03-848627069c25@quicinc.com>
Date: Tue, 23 Jul 2024 10:07:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] Fix user PD inimem requirements
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
References: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
 <bob3pkwyu7g3qf4q546uittggzfywc6o5h7b73isx4lijsfj4j@h3uqpaevawgg>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <bob3pkwyu7g3qf4q546uittggzfywc6o5h7b73isx4lijsfj4j@h3uqpaevawgg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vHUMvP8JrHEH1vYuWPYNe2S9dfyHnC9P
X-Proofpoint-ORIG-GUID: vHUMvP8JrHEH1vYuWPYNe2S9dfyHnC9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxlogscore=862 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230032
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



On 7/22/2024 1:56 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 22, 2024 at 01:31:58PM GMT, Ekansh Gupta wrote:
>> This patch series fixes the incorrect initmem size assumptions for
>> signed and unsigned user PD.
>> Previous single patch[v4]: https://lore.kernel.org/all/20240719085708.1764952-1-quic_ekangupt@quicinc.com/
>>
>> Changes in v2:
>>   - Modified commit text.
>>   - Removed size check instead of updating max file size.
>> Changes in v3:
>>   - Added bound check again with a higher max size definition.
>>   - Modified commit text accordingly.
>> Changes in v4:
>>   - Defined new initmem specific MACROs.
>>   - Adding extra memory for unsigned PD.
>>   - Added comment suggesting the reason for this change.
>>   - Modified commit text.
>> Changes in v5:
>>   - Splitted the change into separate patches.
>> Changes in v6:
>>   - Changed Unsigned extra length macro name.
>>   - Add comment in proper format.
> Please allow reviewers to finish with the previous iteration first. The
> usual recommendation is to send new iteration once per 24h timeframe.
Noted.

Thanks,
Ekansh
>
>> Ekansh Gupta (2):
>>   misc: fastrpc: Define a new initmem size for user PD
>>   misc: fastrpc: Increase unsigned PD initmem size
>>
>>  drivers/misc/fastrpc.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> -- 
>> 2.34.1
>>


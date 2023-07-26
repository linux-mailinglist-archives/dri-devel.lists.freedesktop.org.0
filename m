Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AEF7637BB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 15:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2448910E48E;
	Wed, 26 Jul 2023 13:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC8310E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 13:38:10 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36QCEbXL029223; Wed, 26 Jul 2023 13:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xr58Ttl/tZUIt/Rk6PYHYfdDG34LXOshnBUPuif6OfI=;
 b=NSuMPOS7BAsFYtk1ChGXugYPGq7CN+Qyk8bNuhD3EviojnhtvdirdiUohEN9MNcuCQ08
 hnZpdFc18kkQOqIbF/lQLXiv66c1Ih7xRtT1u+AHwajUOEftYHwAB47axL4pHbdE/DLL
 N9uRB4x46KftNGZA0kwJDJ1oiD9En6HYh3RahKtfXgO9ns+C0Y8HSduT4ikgLCiMNDh/
 yZdfixn2zLZlq37A39Z8rJQT0Om2rLpsVzo23lBM4tPQHwqg/jbeSujzvHqGwLzm7ZVS
 0sS8RiC6j6bAcaIkmMxXiLiDLLNwof2ZrLbGzzW4j13IB2ayrLWkhsSQVE6Mnh2DGu3r qg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s2v4tgyvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 13:38:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36QDc6ZI003783
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 13:38:06 GMT
Received: from [10.50.21.246] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 26 Jul
 2023 06:38:03 -0700
Message-ID: <c0b314db-bd29-7211-2a70-667405eb5bd0@quicinc.com>
Date: Wed, 26 Jul 2023 19:08:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH][next] accel/qaic: remove redundant assignment to pointer
 pexec
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Colin Ian King
 <colin.i.king@gmail.com>, Carl Vanderlip <quic_carlv@quicinc.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <20230725114037.36806-1-colin.i.king@gmail.com>
 <e457b416-3e63-0bae-0cd7-7788b43f30c1@quicinc.com>
Content-Language: en-US
From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
In-Reply-To: <e457b416-3e63-0bae-0cd7-7788b43f30c1@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: gNn-ja2ju0Xs11dqy647vzHtwKvYu086
X-Proofpoint-GUID: gNn-ja2ju0Xs11dqy647vzHtwKvYu086
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_06,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307260120
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/26/2023 8:30 AM, Jeffrey Hugo wrote:
> On 7/25/2023 5:40 AM, Colin Ian King wrote:
>> Pointer pexec is being assigned a value however it is never read. The
>> assignment is redundant and can be removed.
>>
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>> ---
>>   drivers/accel/qaic/qaic_data.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/accel/qaic/qaic_data.c 
>> b/drivers/accel/qaic/qaic_data.c
>> index e9a1cb779b30..8a6cb14f490e 100644
>> --- a/drivers/accel/qaic/qaic_data.c
>> +++ b/drivers/accel/qaic/qaic_data.c
>> @@ -1320,7 +1320,6 @@ static int __qaic_execute_bo_ioctl(struct 
>> drm_device *dev, void *data, struct dr
>>       user_data = u64_to_user_ptr(args->data);
>>       exec = kcalloc(args->hdr.count, size, GFP_KERNEL);
>> -    pexec = (struct qaic_partial_execute_entry *)exec;
>>       if (!exec)
>>           return -ENOMEM;
> 
> It does look like pexec is not used in this function after it was 
> refactored.  Shouldn't the declaration at the beginning of the function 
> also be removed?

Yeah we should remove the declaration as well. Although it is used some 
where to calculate its size i.e. sizeof(*pexec). We need to directly use 
the type in sizeof() i.e. sizeof(struct qaic_partial_execute_entry).

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79378746491
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 22:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA8010E075;
	Mon,  3 Jul 2023 20:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADA410E075;
 Mon,  3 Jul 2023 20:59:52 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 363KvACF017740; Mon, 3 Jul 2023 20:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WH/0qrqsEgj2S2AECSNEQU9SUXXP5xNCh5ALL+O6vzE=;
 b=AvzsV5kUnFp57PZ9cZVGDNuELLbXzKj8xeGq8SDc3ieYWB1q8YUGh5xjCIwUs+boEvqH
 HxgmI+264sTVYc9WqnRd38mmhjOfvZdiWLNDwnMVBRdacrqjoeUSFeQ/sIcKMHQTTbPU
 qpCsv79yjxi1LohFH63AsRPU0PzgcxB0DOeHaNG2f0EOpW60M4arCqcdWAEqI0EL/LJ5
 5QfQMJf/o5diYspuDGJwVgZ4xZwnpwclur4UyZoOgre84EVQGYkkV+G8wUwuG5+NCJZh
 cgqbTpGpAmTsmxSltK/zSJDIABX3em2QrQsQ3RERiSukteiKPxHFvn3NU0kulQ0Xra93 tg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rjc80w20g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jul 2023 20:59:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 363KxjD4028237
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Jul 2023 20:59:45 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 13:59:44 -0700
Message-ID: <e2c6a4cc-264e-7e2d-0e77-730a170df9a6@quicinc.com>
Date: Mon, 3 Jul 2023 13:59:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 14/19] drm/msm/dpu: inline MERGE_3D_BLK macros
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-15-dmitry.baryshkov@linaro.org>
 <b11a9c1f-0f20-e12e-57cd-1bf7f9839e34@quicinc.com>
 <CAA8EJprXC531DaTJR1XoCC0ZeHn4q3L2vt6zLMKmYPXyLrab6Q@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprXC531DaTJR1XoCC0ZeHn4q3L2vt6zLMKmYPXyLrab6Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: URZkVgbtrcEQEQm_4kCfXnd0p91sJLud
X-Proofpoint-GUID: URZkVgbtrcEQEQm_4kCfXnd0p91sJLud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_15,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxlogscore=746 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307030191
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/3/2023 1:58 PM, Dmitry Baryshkov wrote:
> On Mon, 3 Jul 2023 at 23:29, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/19/2023 2:25 PM, Dmitry Baryshkov wrote:
>>> To simplify making changes to the hardware block definitions, expand
>>> corresponding macros. This way making all the changes are more obvious
>>> and visible in the source files.
>>>
>>> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> the value of MERGE_3D_SM8150_MASK is 0, so to be uniform with what has
>> been done with some of the prev patches to drop 0 feature fields
>> assignment, do you want to do the same here?
> 
> These patches do macro expansion (+ obvious 0-field removal). So
> removal of MERGE_3D_SM8150_MASK had to wait until patch 18.
> 

Ah okay, got it.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A520743306
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 05:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE4110E034;
	Fri, 30 Jun 2023 03:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C1E10E034;
 Fri, 30 Jun 2023 03:18:04 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35U2gpw7022282; Fri, 30 Jun 2023 03:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ppRpzLjCmaBGpK95I3wujTHujrzMpJsGutWS5vZ6WNU=;
 b=ZUgbe7g1yDc2kgNFhxw2hS9wZ7xqlTcLmg4Y9STVlFyh6yVZprJI67uyOAAapMyPGG7L
 MbqUY8HSJCw8yCiYtENguLlMkDpXez/mbdUmCYxzvtiODx5NKpopjP63Tq8zsXiZ/DDL
 JTISEemhgE4NYBQly0Jx+XwwMDN8M/nJzoTere2AAFspCSaLSz/iYycX2PNbJMpE6fet
 AiWdXAc+by/nCRxSQp/h/slo28vkxld1Q0XDsRY1pusIyyKQ8apD6l8udHqazW7BHhF5
 dLQn39h+YLbb7LikqHDr9a/IKRZPkXtpzvAybiJiAlBuq1KhrQ/XQ/eKwpaZCG97da/2 UA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rhnt0r3ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 03:17:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35U3HwSK012559
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 03:17:58 GMT
Received: from [10.110.33.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Thu, 29 Jun
 2023 20:17:56 -0700
Message-ID: <060b6125-f08c-f8a4-e28f-f3d12b971c79@quicinc.com>
Date: Thu, 29 Jun 2023 20:17:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/3] drm/msm/dpu: re-introduce dpu core revision to the
 catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230629193001.22618-1-quic_abhinavk@quicinc.com>
 <aab1883a-b367-f919-8ff6-d3e09ebc0ffe@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <aab1883a-b367-f919-8ff6-d3e09ebc0ffe@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rbIR2KXDjcBIKYOnAhq1U9b_KXmK91Jy
X-Proofpoint-ORIG-GUID: rbIR2KXDjcBIKYOnAhq1U9b_KXmK91Jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_10,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300025
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/29/2023 5:24 PM, Dmitry Baryshkov wrote:
> On 29/06/2023 22:29, Abhinav Kumar wrote:
>> With [1] dpu core revision was dropped in favor of using the
>> compatible string from the device tree to select the dpu catalog
>> being used in the device.
>>
>> This approach works well however also necessitates adding catalog
>> entries for small register level details as dpu capabilities and/or
>> features bloating the catalog unnecessarily. Examples include but
>> are not limited to data_compress, interrupt register set, widebus etc.
> 
> Generic note: this description can be moved to the cover letter, it 
> covers the series intent.
> 

I kept it here as I didnt really have a cover letter but I can add one 
and move this there.

>> Introduce the dpu core revision back as an entry to the catalog so that
>> we can just use dpu revision checks and enable those bits which
>> should be enabled unconditionally and not controlled by a catalog
>> and also simplify the changes to do something like:
>>
>> if (dpu_core_revision > xxxxx && dpu_core_revision < xxxxx)
>>     enable the bit;
>>
>> Since dpu's major and minor versions are now separate fields, lets
>> drop all the DPU_HW_VER macros.
>>
>> [1]: https://patchwork.freedesktop.org/patch/530891/?series=113910&rev=4
> 
> Please use `commit aabbcc ("do this and that")' in the commit messages.
> 

Ack.

>>
>> changes in v3:
>>     - drop DPU step version as features are not changing across steps
>>     - add core_major_version / core_minor_version to avoid conflicts
>>     - update the commit text to drop references to the dpu macros
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

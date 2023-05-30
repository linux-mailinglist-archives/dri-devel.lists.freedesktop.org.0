Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCF9716B3E
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 19:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA8410E117;
	Tue, 30 May 2023 17:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFF610E117;
 Tue, 30 May 2023 17:37:59 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34U8aqeb007650; Tue, 30 May 2023 17:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=z9UryKPY++sLkaBIxrTXU+ep6jQ1z+TFu7RofzWPkcA=;
 b=gEHApG58ZTY+64/99u63+HsYzinHk0w4qcLGoKgy/xAuC12ha2+baeF32qmZw4ZBsDpq
 HBKhxfJav3sxXvUtsP39BfdKJ4tHffpEzN/UoGOm7AqJMQkDFc5mxaMhRVWL6icj9Dcw
 SHcUW9Ksu11P0fsnEVXx9GLzLIhQepCqI4yEUrAMNj1BzGE4o8wRC/e3SjtWCQCdaAHH
 Fj4p2J4hqKgoR+Rr8Vj0mOWXtgwbvMavzEgkaHL0edfKycasIGmwcgQL9xZbaKgrBRay
 gg3SJXlolgUcIIOwK/J8fS+w2UqpXiwxxmglaAui7ka6FMvgtTVhULQ1wql3v7q/NKXU 5A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qw8v4srd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 17:37:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34UHbtiP017023
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 17:37:55 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 30 May
 2023 10:37:54 -0700
Message-ID: <9001aaaf-778e-5b3c-e87f-2b196d8b62ed@quicinc.com>
Date: Tue, 30 May 2023 10:37:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
 <bvjtgmuyz4zdjvt4jyjyt5hasiwnnaz4lyse6mf6b7grtig23f@yuji3z2mxue2>
 <c18c8687-0c4e-894e-a629-bc55e54031c5@quicinc.com>
 <6se25tikdg2tkiprz4h4umfta34tc5orddksvwi6woklf7c74k@rbserwp5kt3a>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <6se25tikdg2tkiprz4h4umfta34tc5orddksvwi6woklf7c74k@rbserwp5kt3a>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hDsi95Jad4DhLjwACCwN7FQjlS_fIf3J
X-Proofpoint-GUID: hDsi95Jad4DhLjwACCwN7FQjlS_fIf3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_13,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxscore=0 mlxlogscore=462 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305300140
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/29/2023 2:36 PM, Marijn Suijten wrote:
> On 2023-05-24 12:18:09, Abhinav Kumar wrote:
>>
>>
>> On 5/24/2023 2:48 AM, Marijn Suijten wrote:
>>> On 2023-05-23 13:01:13, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 5/21/2023 10:21 AM, Dmitry Baryshkov wrote:
>>>>> Drop SSPP-specifig debugfs register dumps in favour of using
>>>>> debugfs/dri/0/kms or devcoredump.
>>>>>
>>>>
>>>> I did see another series which removes src_blk from the catalog (I am
>>>> yet to review that one) . Lets assume that one is fine and this change
>>>> will be going on top of that one right?
>>>
>>> It replaces src_blk with directly accessing the blk (non-sub-block)
>>> directly, because they were overlapping anyway.
>>>
>>>> The concern I have with this change is that although I do agree that we
>>>> should be in favor of using debugfs/dri/0/kms ( i have used it a few
>>>> times and it works pretty well ), devcoredump does not have the support
>>>> to dump sub-blocks . Something which we should add with priority because
>>>> even with DSC blocks with the separation of enc/ctl blocks we need that
>>>> like I wrote in one of the responses.
>>>>
>>>> So the "len" of the blocks having sub-blocks will be ignored in favor of
>>>> the len of the sub-blocks.
>>>
>>> The sub-blocks are not always contiguous with their parent block, are
>>> they?  It's probably better to print the sub-blocks separately with
>>
>> Yes, not contiguous otherwise we could have just had them in one big range.
>>
>>> clear headers anyway rather than dumping the range parent_blk_base to
>>> max(parent_blk_base+len, parent_blk_base+sblk_base+sblk_len...).
>>>
>>> - Marijn
>>
>> When I meant sub-block support to devcoredump, this is how I visualize
>> them to be printed
>>
>> =========================SSPP xxx =======================
>> =========================SSPP_CSC =======================(for SSPP_xxx)
>> =========================SSPP_QSEED =====================(for SSPP_xxx)
> 
> Yeah something along those lines, though I don't really like the `(for
> SSPP_xxx)` suffix which we should either drop entirely and make the
> "heading" less of a "heading"
> 

I wrote that "for SSPP_xxx" to explain the idea, ofcourse it wont be 
part of the print itself.

Without that, it matches what you have shared below.


> ========================= SSPP xxx =======================
> ...
> ------------------------- SSPP_CSC -----------------------
> ...
> ------------------------- SSPP_QSEED ---------------------
> ...
> 
> And/or inline the numbers:
> 
> ========================= SSPP xxx =======================
> ...
> ----------------------- SSPP_xxx_CSC ---------------------
> ...
> ---------------------- SSPP_xxx_QSEED --------------------
> ...
> 

sure this is also fine with me.

> Either works, or any other pattern in the title (e.g `SSPP xxx: CSC`)
> that clearly tells the blocks and sub-blocks apart.
> 
> - Marijn

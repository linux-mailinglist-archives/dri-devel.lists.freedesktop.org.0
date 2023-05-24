Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D710070FE64
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 21:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B910510E5C9;
	Wed, 24 May 2023 19:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D50D10E5C2;
 Wed, 24 May 2023 19:18:17 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34OIOSCb032504; Wed, 24 May 2023 19:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lCfQK3PZdoU4IXN7kX3ABqZmrGysqoCjzH6J9fmfKFQ=;
 b=EC3kiX7ktIszxV9rlgP/CrzTTJRA6HEMtsybi6kMn2mw/H6g6kuLT9JxNRcNF63tGTKc
 REgHIgcC11sr31362KMRHDZ8vhVoYnrj7LEvEuZnUKFNadj9acFGTshKrXHfGWk3FiJr
 SYL5cmPDgqTpCw9cHBCKa32AAQsZBZLuc8rWgHsp7OlpGd22/UBbfU5Sf1jdSmz1Cvms
 iFEfTI85yuLquMReKYSkFNwPaGgzFZwY88XlAjjvdF9n5TZMm6nWjWwFEbanG0Q3dKLe
 rRaCRRjFAgW8a8aPgyHUJR6/OIyhr942+AxA32Kn0fWXniL1fAwAkN2ZaI39uyTneXZW tg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qsf881gng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 19:18:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34OJIBDq000641
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 19:18:11 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 12:18:10 -0700
Message-ID: <c18c8687-0c4e-894e-a629-bc55e54031c5@quicinc.com>
Date: Wed, 24 May 2023 12:18:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
 <bvjtgmuyz4zdjvt4jyjyt5hasiwnnaz4lyse6mf6b7grtig23f@yuji3z2mxue2>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <bvjtgmuyz4zdjvt4jyjyt5hasiwnnaz4lyse6mf6b7grtig23f@yuji3z2mxue2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 4mW86tnvETjPPs_tWA-2BP2Nv5SmhbZE
X-Proofpoint-GUID: 4mW86tnvETjPPs_tWA-2BP2Nv5SmhbZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_13,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=462 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240160
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/24/2023 2:48 AM, Marijn Suijten wrote:
> On 2023-05-23 13:01:13, Abhinav Kumar wrote:
>>
>>
>> On 5/21/2023 10:21 AM, Dmitry Baryshkov wrote:
>>> Drop SSPP-specifig debugfs register dumps in favour of using
>>> debugfs/dri/0/kms or devcoredump.
>>>
>>
>> I did see another series which removes src_blk from the catalog (I am
>> yet to review that one) . Lets assume that one is fine and this change
>> will be going on top of that one right?
> 
> It replaces src_blk with directly accessing the blk (non-sub-block)
> directly, because they were overlapping anyway.
> 
>> The concern I have with this change is that although I do agree that we
>> should be in favor of using debugfs/dri/0/kms ( i have used it a few
>> times and it works pretty well ), devcoredump does not have the support
>> to dump sub-blocks . Something which we should add with priority because
>> even with DSC blocks with the separation of enc/ctl blocks we need that
>> like I wrote in one of the responses.
>>
>> So the "len" of the blocks having sub-blocks will be ignored in favor of
>> the len of the sub-blocks.
> 
> The sub-blocks are not always contiguous with their parent block, are
> they?  It's probably better to print the sub-blocks separately with

Yes, not contiguous otherwise we could have just had them in one big range.

> clear headers anyway rather than dumping the range parent_blk_base to
> max(parent_blk_base+len, parent_blk_base+sblk_base+sblk_len...).
> 
> - Marijn

When I meant sub-block support to devcoredump, this is how I visualize 
them to be printed

=========================SSPP xxx =======================
=========================SSPP_CSC =======================(for SSPP_xxx)
=========================SSPP_QSEED =====================(for SSPP_xxx)
etc

OR for DSC

========================DSC_xxx ==========================
========================DSC_CTL ========================== (for DSC_xxx)
========================DSC_ENC ===========================(for DSC_xxx)

This is clear enough headers.

> 
>> If we remove this without adding that support first, its a loss of debug
>> functionality.
>>
>> Can we retain these blocks and remove dpu_debugfs_create_regset32 in a
>> different way?
> 
> <snip>

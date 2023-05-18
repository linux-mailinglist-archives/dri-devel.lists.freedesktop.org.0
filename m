Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 043C5708B61
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 00:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C0110E567;
	Thu, 18 May 2023 22:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2E910E137;
 Thu, 18 May 2023 22:19:23 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34ILuIsp029154; Thu, 18 May 2023 22:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=F2KDyZjGgigvoKQcIYa0b9DEhnQVy66PQU256r88rm4=;
 b=fLd6KI9SSYt/rQoUPGE1p1Wwh4rv8qToFEpVtngNHiqvYFmvZF7JyWrB90hbXkxaHs7C
 M08TbeVd4MDD7y0UJ1PqDEP6TU/wdr/UKPrxe/pVC1tp7opVV9jKE+p86QPpTcKCuK/Z
 BpOKBG3GCEZ0FHdmu0Qj1mSLzMgRuJWu3BtmIb+SKq8J/1ItdNmyXKJArzDF9Vx1y3vV
 CZx+a5MROnwiodlCXAGcf2DptX+cbhIV+95Cr6sDnLDum9dvfrHeqiRwChPkHY07wx/Y
 nhseqXi+/EWb+OAGyYMlNpkqwfEtKPTaljbPoWb40/hDJKTK1h8LTh7Yb+eUfr05lNfW mQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qn8a62kgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 22:19:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34IMJ8NR000685
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 22:19:08 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 18 May
 2023 15:19:07 -0700
Message-ID: <5fda5128-072b-d8f3-f294-ae3eaef44d25@quicinc.com>
Date: Thu, 18 May 2023 15:19:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: drop DSPP_MSM8998_MASK from hw catalog
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230428223646.23595-1-quic_abhinavk@quicinc.com>
 <20230428223646.23595-4-quic_abhinavk@quicinc.com>
 <kap4lpzbv5qihf2k7fdznmx72hrhpx4acjgcng45kxnshxo6ge@gzke6ruy3x6u>
 <2c688487-a5b1-155c-f73a-69358d03e478@linaro.org>
 <dexkdzb3wo3jjveys4i2ujh22fbyti5kugie7nl23s7lv63pky@ryycjghsifva>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <dexkdzb3wo3jjveys4i2ujh22fbyti5kugie7nl23s7lv63pky@ryycjghsifva>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: LllXyVNTZpC0IuK20YNA2_VcflkKxOKN
X-Proofpoint-ORIG-GUID: LllXyVNTZpC0IuK20YNA2_VcflkKxOKN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_15,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=708 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305180184
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 quic_jesszhan@quicinc.com, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/18/2023 2:36 PM, Marijn Suijten wrote:
> On 2023-05-19 00:26:33, Dmitry Baryshkov wrote:
>> On 18/05/2023 22:41, Marijn Suijten wrote:
>>> On 2023-04-28 15:36:46, Abhinav Kumar wrote:
>>>> Since GC and IGC masks have now been dropped DSPP_MSM8998_MASK
>>>> is same as DSPP_SC7180_MASK. Since DSPP_SC7180_MASK is used more
>>>
>>> is *the* same
>>
>> And, I think, a comma is missing before DSPP_MSM8998_MASK.
> 
> Possible, but not needed I think; both would work.
> 
>> Note: since the English language is not native for most of the
>> developers, I usually don't nitpick on these issues provided we can
>> understand the message without too much trouble (and the mistake doesn't
>> stand out aloud, begging for it to be fixed).
> 

I also dont nitpick on these.

> I hope you don't mind me pointing them out when they make the reader go
> "huh, a word is missing here", breaking my sentence-parser.
> 
> - Marijn

Sure, but I dont expect another version to be sent if that was the only 
issue.

> 
>> I will fix missing articles when applying, if I don't forget.
> 
> <snip>

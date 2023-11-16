Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF0C7EE8A5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 22:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DC710E2C9;
	Thu, 16 Nov 2023 21:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A9910E28A;
 Thu, 16 Nov 2023 21:05:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AGJ2GTE016673; Thu, 16 Nov 2023 21:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=h/ceQFvVd7icRg18RKM+vHrf4FiKh0owxs7zhww8GgQ=;
 b=Uzwwwt1Xv5PMnINNbk9NxzxpLf8pEvbyPa9Zn4xcgCMTBAhJ+m12mbKxM+GiAchwJTYm
 2WLmSc5OGKyjevxLNMvhsFUkelIsHJVRWgfBzlLVCEkE9/raueDvUXTVwdsI86xpajL1
 zGgWl3G3/D2ysJzCkmYunJ9LERjzuGaVB5Ebs18SdL8SAYPRpkRCcSq8qRIaG5YTsOwu
 SwuFr2fvri4N7rTnHuWcV8rVORyinnsJi/RqWA7mMcfmi0EgrqT1gK+ZvHGvEHfajc3G
 L3szu0DaBPO6xLMEn6MgCLGbePwXJsxS6AF6qPm3qDq+XGkkTwfx/LQ44m6IUDSajp/Y 2w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udrvs0bf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 21:05:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AGL5sZ1014322
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 21:05:54 GMT
Received: from [10.110.71.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 13:05:53 -0800
Message-ID: <62943ca3-26ac-8712-2caa-102dc98f099c@quicinc.com>
Date: Thu, 16 Nov 2023 13:05:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v2] drm/msm: remove unnecessary NULL check
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Rob Clark <robdclark@gmail.com>
References: <ZSj+6/J6YsoSpLak@kadam>
 <095b7283-3555-cc38-a73e-83efec8a9bf8@quicinc.com>
In-Reply-To: <095b7283-3555-cc38-a73e-83efec8a9bf8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QlIewNp0jlFkpuRtJKY-uWweuP2I9WYO
X-Proofpoint-ORIG-GUID: QlIewNp0jlFkpuRtJKY-uWweuP2I9WYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_23,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=956
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160163
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
Cc: Su Hui <suhui@nfschina.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/1/2023 12:23 PM, Abhinav Kumar wrote:
> 
> 
> On 10/13/2023 1:25 AM, Dan Carpenter wrote:
>> This NULL check was required when it was added, but we shuffled the code
>> around and now it's not.  The inconsistent NULL checking triggers a
>> Smatch warning:
>>
>>      drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
>>      variable dereferenced before check 'mdp5_kms' (see line 782)
>>
>> Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the 
>> _probe function"

A small error here. Its missing the closing brace for the Fixes tag.
Checkpatch cries without it.

I have fixed it while applying.

>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>> v2: Added a Fixes tag.  It's not really a bug fix and so adding the
>> fixes tag is slightly unfair but it should prevent this patch from
>> accidentally getting backported before the refactoring and causing an
>> issue.
>>
>> Btw, fixes tags are often unfair like this.  People look at fixes tags
>> and think, "the fix introduced a bug" but actually it's really common
>> that the fix was just not complete.  But from a backporting perspective
>> it makes sense to tie them together.
>>
>> Plus everyone introduces bugs.  If you're not introducing bugs, then
>> you're probably not writing a lot of code.
>>
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
> 
> LGTM,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

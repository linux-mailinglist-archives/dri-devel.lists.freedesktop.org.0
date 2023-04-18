Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D416E6EAB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 23:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538E610E269;
	Tue, 18 Apr 2023 21:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1C910E269
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 21:51:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33ILOi1M031252; Tue, 18 Apr 2023 21:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3HsRrfr6uEi597nAEVxngP/P+gdrt96xB0IUuG8Lktk=;
 b=hstE+GG4ITf7i1MOoBBRMo+fKsYmx/TVMd1EZtkF/lUJzduUkyXldmMEN/Id2gtjaO+H
 9T0/VqNIk5cEJKPLeEbZpWWq9kj/mwBZLhlupPanPet5CAznkQE/48XyxY1gFjW1tTUF
 1s/HJuYeSrI1+1gRhcoeqGqfZcxKUp614lqeqGYTWXnSSwnwteWBjCoVSiOGDcLGEGg9
 JujpoY7CPhNm6X/pOZS+qVtW8ely1t6lzK5lH7cTH3acL36ByH9yXJWVtHiIDDwoIgYM
 9GX3MBT8xea2erTL0WowMgxNpomU6A+e8xKFtjQ8e19BdQQAxhmc5KHRb9HjUFz2xM4U aA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q1v2ahbw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Apr 2023 21:51:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33ILpQPm006302
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Apr 2023 21:51:26 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 18 Apr
 2023 14:51:24 -0700
Message-ID: <3f27c84f-f8b0-bddf-cdd5-952c9576c6c3@quicinc.com>
Date: Tue, 18 Apr 2023 15:51:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: initialize ret variable to 0
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>
References: <20230418192046.3235870-1-trix@redhat.com>
 <fe7da2c1-904e-ee4f-9a6c-443049c214b7@quicinc.com>
 <CAKwvOdmFGVPddi98yt22i+U+3aow+dwhxKgdJ45h3n1i-n3bzw@mail.gmail.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <CAKwvOdmFGVPddi98yt22i+U+3aow+dwhxKgdJ45h3n1i-n3bzw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: tAIzabtbEnlqnjwMTzlJetoLznbSrvbL
X-Proofpoint-ORIG-GUID: tAIzabtbEnlqnjwMTzlJetoLznbSrvbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_15,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304180182
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
Cc: quic_pkanojiy@quicinc.com, Tom Rix <trix@redhat.com>, ogabbay@kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nathan@kernel.org,
 stanislaw.gruszka@linux.intel.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/18/2023 2:48 PM, Nick Desaulniers wrote:
> On Tue, Apr 18, 2023 at 1:46 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>>
>> On 4/18/2023 1:20 PM, Tom Rix wrote:
>>> clang static analysis reports
>>> drivers/accel/qaic/qaic_data.c:610:2: warning: Undefined or garbage
>>>     value returned to caller [core.uninitialized.UndefReturn]
>>>           return ret;
>>>           ^~~~~~~~~~
>>>
>>> The ret variable is only set some of the time but is always returned.
>>> So initialize ret to 0.
>>
>> This does not appear to be entirely accurate to me.
>>
>> Do you know what analysis Clang is doing?  Is it limited to the function
>> itself?
>>
>> remap_pfn_range, which initializes ret, will always run at-least once.
> 
> What happens if the loop body is never executed, say if `bo->sgt->sgl` is NULL?

qaic_gem_object_mmap() doesn't get called unless a valid GEM object is 
provided by userspace.  For userspace to get a valid GEM object, it has 
to go through qaic_create_bo_ioctl().  qaic_create_bo_ioctl() will not 
return a valid GEM object unless sgt is allocated and initialized.

The loop body will execute at-least once.  The if body will execute 
at-least once.  remap_pfn_range() will run at-least once.  Therefore, 
ret is always initialized.

This is how the code is intended to operate, and how it appears to be 
implemented from what I see.  Unless I'm missing something.

I can see how Clang might not be able to infer these things, but I don't 
believe the code is broken.  I feel that the commit text is unclear and 
suggests that the code is infact, broken.

Userspace should not call mmap() in a critical path thus I don't see a 
true performance concern here.  So while my understanding of the coding 
style is that redundant initialization of variables are to be avoided, I 
think we can say that this is not redundant because it silences a 
warning (because Clang is limited).

>> Feels more accurate to say that Clang cannot detect that ret will be
>> initialized, and we want to quiet the warning from the false positive.
>>
>>> Fixes: ff13be830333 ("accel/qaic: Add datapath")
>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>> ---
>>>    drivers/accel/qaic/qaic_data.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
>>> index c0a574cd1b35..b46a16fb3080 100644
>>> --- a/drivers/accel/qaic/qaic_data.c
>>> +++ b/drivers/accel/qaic/qaic_data.c
>>> @@ -591,7 +591,7 @@ static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
>>>        struct qaic_bo *bo = to_qaic_bo(obj);
>>>        unsigned long offset = 0;
>>>        struct scatterlist *sg;
>>> -     int ret;
>>> +     int ret = 0;
>>>
>>>        if (obj->import_attach)
>>>                return -EINVAL;
>>
> 
> 


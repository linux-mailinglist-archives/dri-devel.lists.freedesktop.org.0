Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD7DADAE6A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 13:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4935610E358;
	Mon, 16 Jun 2025 11:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HdwNL9IX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F003110E339
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 11:28:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G94Zcs018985;
 Mon, 16 Jun 2025 11:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 01w4xeUp6kyf+8akdVukYs1b2iQXiuC3TQyQt599JeM=; b=HdwNL9IXKRWuOOm+
 +mLdLbjwRtw+NTiSXvoimVfrlX141MocllaUL26aQzYSX5LoLIbaLv6VC7CBNvNh
 lZAZhqirEzpqOvUv9kY1gpTleA3LymqLF0l8mkIS4zVYLHU/XuriqYcJNqqgsZNJ
 cHo6EgMaPVYqScCNo4UDmmQO84uZbugMgD/OgZHinPQWXpVrjEb1io0ACZ3ylaZ4
 U133FP4x3W8zjHpPIdXvT5njByCfrAr5ePrURvCvJIyF2gAomefEP/w2Xkvj+k/r
 Frtkx5Nhq0zrr2Jop1t2DT4sqmK65X+DvSwxfxFOd1THi+E/OGIiOsuWgjFGZgqE
 XFTocQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791ugc684-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 11:28:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GBS9q8025382
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 11:28:09 GMT
Received: from [10.239.29.49] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 04:28:05 -0700
Message-ID: <5f70a482-6e61-4817-afdb-d5db4747897a@quicinc.com>
Date: Mon, 16 Jun 2025 19:28:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <amahesh@qti.qualcomm.com>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
 <e2a8528b-fa18-471f-9cb8-da64bb488f2a@quicinc.com>
 <07bfc5f3-1bcb-4018-bd63-8317ec6dac48@linaro.org>
Content-Language: en-US
From: Ling Xu <quic_lxu5@quicinc.com>
In-Reply-To: <07bfc5f3-1bcb-4018-bd63-8317ec6dac48@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MSBTYWx0ZWRfX8QsCNPGSSmbn
 ou+nFuW/C+xlHZ2jvPSaOmuuUDGgrI/lFpswCyVm9EzV73PQfmFVuqEoFN9jxV9iG3UCykJgF5u
 R1s+8l4WCAuo5opx1R65aqfeIn0Iq8MAqVZGZpk0I7b5VdpEHYTdTlAf5A9kxs2KJrsys2eMV46
 e4rQIwcjVYdNVI11XpSJ4q0qCWoHlEDzDAKjp1ouYWLOQLhp0PV11tvDJ5Sx4UypkjtwiVgJLBo
 hwvlCm9oos6REdTt0wUukkLnbqoRxF8glUl5hYB7p8JEB0Q9iMmDlWc1Azs6E4Th8GuHwgnnCnz
 qa/yNvkgN1Gra8wpRYoAvapoHIe0FYi3bqpSS+K9JlX3LSxH6Jd0e4EWt5+ctPW6eS37/H8yrZp
 ovrYzRVvfwU7HkXh7VgxtuxFpzOV1CK/FUsjpmGf1XiBvUKLq3Beb2AOf3HqAiDsXad46uOF
X-Proofpoint-GUID: gyuxjK-MlJ35ekllCiW63hY02ufVtZ6k
X-Authority-Analysis: v=2.4 cv=NtnRc9dJ c=1 sm=1 tr=0 ts=684fffc9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=vhOWYKygyC3EXpa9EXEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gyuxjK-MlJ35ekllCiW63hY02ufVtZ6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160071
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

在 4/8/2025 4:14 PM, Srinivas Kandagatla 写道:
> 
> 
> On 07/04/2025 10:13, Ling Xu wrote:
>> 在 3/21/2025 1:11 AM, Srinivas Kandagatla 写道:
>>>
>>>
>>> On 20/03/2025 09:14, Ling Xu wrote:
>>>> The fastrpc driver has support for 5 types of remoteprocs. There are
>>>> some products which support GPDSP remoteprocs. Add changes to support
>>>> GPDSP remoteprocs.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>>>> ---
>>>>    drivers/misc/fastrpc.c | 10 ++++++++--
>>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index 7b7a22c91fe4..80aa554b3042 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -28,7 +28,9 @@
>>>>    #define SDSP_DOMAIN_ID (2)
>>>>    #define CDSP_DOMAIN_ID (3)
>>>>    #define CDSP1_DOMAIN_ID (4)
>>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>>> +#define GDSP0_DOMAIN_ID (5)
>>>> +#define GDSP1_DOMAIN_ID (6)
>>>
>>> We have already made the driver look silly here, Lets not add domain ids for each instance, which is not a scalable.
>>>
>>> Domain ids are strictly for a domain not each instance.
>>>
>>>
>>>> +#define FASTRPC_DEV_MAX        7 /* adsp, mdsp, slpi, cdsp, cdsp1, gdsp0, gdsp1 */
>>>>    #define FASTRPC_MAX_SESSIONS    14
>>>>    #define FASTRPC_MAX_VMIDS    16
>>>>    #define FASTRPC_ALIGN        128
>>>> @@ -107,7 +109,9 @@
>>>>    #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>>>      static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>>>> -                        "sdsp", "cdsp", "cdsp1" };
>>>> +                        "sdsp", "cdsp",
>>>> +                        "cdsp1", "gdsp0",
>>>> +                        "gdsp1" };
>>>>    struct fastrpc_phy_page {
>>>>        u64 addr;        /* physical address */
>>>>        u64 size;        /* size of contiguous region */
>>>> @@ -2338,6 +2342,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>>            break;
>>>>        case CDSP_DOMAIN_ID:
>>>>        case CDSP1_DOMAIN_ID:
>>>> +    case GDSP0_DOMAIN_ID:
>>>> +    case GDSP1_DOMAIN_ID:
>>>>            data->unsigned_support = true;
>>>>            /* Create both device nodes so that we can allow both Signed and Unsigned PD */
>>>>            err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
>>>
>>>
>>> Can you try this patch: only compile tested.
>>>
>>> ---------------------------------->cut<---------------------------------------
>>>  From 3f8607557162e16673b26fa253d11cafdc4444cf Mon Sep 17 00:00:00 2001
>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> Date: Thu, 20 Mar 2025 17:07:05 +0000
>>> Subject: [PATCH] misc: fastrpc: cleanup the domain names
>>>
>>> Currently the domain ids are added for each instance of domain, this is
>>> totally not scalable approch.
>>>
>>> Clean this mess and create domain ids for only domains not its
>>> instances.
>>> This patch also moves the domain ids to uapi header as this is required
>>> for FASTRPC_IOCTL_GET_DSP_INFO ioctl.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> ---
>>>   drivers/misc/fastrpc.c      | 45 ++++++++++++++++++++-----------------
>>>   include/uapi/misc/fastrpc.h |  7 ++++++
>>>   2 files changed, 32 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>> index 7b7a22c91fe4..b3932897a437 100644
>>> --- a/drivers/misc/fastrpc.c
>>> +++ b/drivers/misc/fastrpc.c
>>> @@ -23,12 +23,6 @@
>>>   #include <uapi/misc/fastrpc.h>
>>>   #include <linux/of_reserved_mem.h>
>>>
>>> -#define ADSP_DOMAIN_ID (0)
>>> -#define MDSP_DOMAIN_ID (1)
>>> -#define SDSP_DOMAIN_ID (2)
>>> -#define CDSP_DOMAIN_ID (3)
>>> -#define CDSP1_DOMAIN_ID (4)
>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>>   #define FASTRPC_MAX_SESSIONS    14
>>>   #define FASTRPC_MAX_VMIDS    16
>>>   #define FASTRPC_ALIGN        128
>>> @@ -106,8 +100,6 @@
>>>
>>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>>
>>> -static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>>> -                        "sdsp", "cdsp", "cdsp1" };
>>>   struct fastrpc_phy_page {
>>>       u64 addr;        /* physical address */
>>>       u64 size;        /* size of contiguous region */
>>> @@ -1769,7 +1761,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>>>           return  -EFAULT;
>>>
>>>       cap.capability = 0;
>>> -    if (cap.domain >= FASTRPC_DEV_MAX) {
>>> +    if (cap.domain >= FASTRPC_DOMAIN_MAX) {
>>>           dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
>>>               cap.domain, err);
>>>           return -ECHRNG;
>>
>> I tested this patch and saw one issue.
>> Here FASTRPC_DOMAIN_MAX is set to 4, but in userspace, cdsp1 is 4, gdsp0 is 5 and gdsp1 is 6.
> 
> 
> Why is the userspace using something that is not uAPI?
> 
> Why does it matter if its gdsp0 or gdsp1 for the userspace?
> It should only matter if its gdsp domain or not.
> 

Give an example here:
In test example, user can use below API to query the notification capability of the specific domain_id,
(actually this will not have any functional issue, but just return an error and lead wrong message):
request_status_notifications_enable(domain_id, (void*)STATUS_CONTEXT, pd_status_notifier_callback)

this will call ioctl_getdspinfo in fastrpc_ioctl.c:
https://github.com/quic-lxu5/fastrpc/blob/8feccfd2eb46272ad1fabed195bfddb7fd680cbd/src/fastrpc_ioctl.c#L201

code snip:
	FARF(ALWAYS, "ioctl_getdspinfo in ioctl.c domain:%d", domain);
	ioErr = ioctl(dev, FASTRPC_IOCTL_GET_DSP_INFO, &cap);
	FARF(ALWAYS, "done ioctl_getdspinfo in ioctl.c ioErr:%x", ioErr);

and finally call fastrpc_get_dsp_info in fastrpc.c.

if I use the patch you shared, it will report below error:

UMD log:
2025-01-08T18:45:03.168718+00:00 qcs9100-ride-sx calculator: fastrpc_ioctl.c:201: ioctl_getdspinfo in ioctl.c domain:5
2025-01-08T18:45:03.169307+00:00 qcs9100-ride-sx calculator: log_config.c:396: file_watcher_thread starting for domain 5
2025-01-08T18:45:03.180355+00:00 qcs9100-ride-sx calculator: fastrpc_ioctl.c:203: done ioctl_getdspinfo in ioctl.c ioErr:ffffffff

putty log:
[ 1332.308444] qcom,fastrpc 20c00000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: Error: Invalid domain id:5, err:0

Because on the user side, gdsp0 and gdsp1 will be distinguished to 5 and 6.
so do you mean you want me to modify UMD code to transfer both gdsp0 and gdsp1 to gdsp just in ioctl_getdspinfo?
> 
> --srini
> 
> 
>> For example, if we run a demo on gdsp0, cap.domain copied from userspace will be 5 which could lead to wrong message.
>>
>> --Ling Xu
>>
>>> @@ -2255,6 +2247,24 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
>>>       return err;
>>>   }
>>>
>>> +static int fastrpc_get_domain_id(const char *domain)
>>> +{
>>> +    if (strncmp(domain, "adsp", 4) == 0) {
>>> +        return ADSP_DOMAIN_ID;
>>> +    } else    if (strncmp(domain, "cdsp", 4) == 0) {
>>> +        return CDSP_DOMAIN_ID;
>>> +    } else if (strncmp(domain, "mdsp", 4) ==0) {
>>> +        return MDSP_DOMAIN_ID;
>>> +    } else if (strncmp(domain, "sdsp", 4) ==0) {
>>> +        return SDSP_DOMAIN_ID;
>>> +    } else if (strncmp(domain, "gdsp", 4) ==0) {
>>> +        return GDSP_DOMAIN_ID;
>>> +    }
>>> +
>>> +    return -EINVAL;
>>> +
>>> +}
>>> +
>>>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>   {
>>>       struct device *rdev = &rpdev->dev;
>>> @@ -2272,15 +2282,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>           return err;
>>>       }
>>>
>>> -    for (i = 0; i < FASTRPC_DEV_MAX; i++) {
>>> -        if (!strcmp(domains[i], domain)) {
>>> -            domain_id = i;
>>> -            break;
>>> -        }
>>> -    }
>>> +    domain_id = fastrpc_get_domain_id(domain);
>>>
>>>       if (domain_id < 0) {
>>> -        dev_info(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
>>> +        dev_info(rdev, "FastRPC Domain %s not supported\n", domain);
>>>           return -EINVAL;
>>>       }
>>>
>>> @@ -2332,19 +2337,19 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>       case SDSP_DOMAIN_ID:
>>>           /* Unsigned PD offloading is only supported on CDSP and CDSP1 */
>>>           data->unsigned_support = false;
>>> -        err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
>>> +        err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>>>           if (err)
>>>               goto fdev_error;
>>>           break;
>>>       case CDSP_DOMAIN_ID:
>>> -    case CDSP1_DOMAIN_ID:
>>> +    case GDSP_DOMAIN_ID:
>>>           data->unsigned_support = true;
>>>           /* Create both device nodes so that we can allow both Signed and Unsigned PD */
>>> -        err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
>>> +        err = fastrpc_device_register(rdev, data, true, domain);
>>>           if (err)
>>>               goto fdev_error;
>>>
>>> -        err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
>>> +        err = fastrpc_device_register(rdev, data, false, domain);
>>>           if (err)
>>>               goto populate_error;
>>>           break;
>>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>>> index f33d914d8f46..89516abd258f 100644
>>> --- a/include/uapi/misc/fastrpc.h
>>> +++ b/include/uapi/misc/fastrpc.h
>>> @@ -133,6 +133,13 @@ struct fastrpc_mem_unmap {
>>>       __s32 reserved[5];
>>>   };
>>>
>>> +#define ADSP_DOMAIN_ID (0)
>>> +#define MDSP_DOMAIN_ID (1)
>>> +#define SDSP_DOMAIN_ID (2)
>>> +#define CDSP_DOMAIN_ID (3)
>>> +#define GDSP_DOMAIN_ID (4)
>>> +
>>> +#define FASTRPC_DOMAIN_MAX    4
>>>   struct fastrpc_ioctl_capability {
>>>       __u32 domain;
>>>       __u32 attribute_id;
>>

-- 
Thx and BRs,
Ling Xu


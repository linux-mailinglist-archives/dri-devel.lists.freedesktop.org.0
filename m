Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C6F7E2B06
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 18:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E9410E396;
	Mon,  6 Nov 2023 17:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C310010E396;
 Mon,  6 Nov 2023 17:36:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A6GdBP5022997; Mon, 6 Nov 2023 17:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FrfXeWtjU0Ruex8wMO6jSQzaCluEQ3NY8dv9N4305wc=;
 b=Uac931rR+5ooJz4n5ak651QTsQM9wUunEY0Crd0orpfBOP7xX9znq4smui4mSlHrBoLc
 XMvx2hFLvEpd6IPGxdaCieZUJys9Z6EC+VXSDqw2e3Qy/cDak+SIbUhn4hiGxsK9/gtB
 ZvCEhGod9fzcqErd435y0Ruvrl+4xMLbBsn2GLKqqo0An2tZ1OQ9vDwnNqzoZfr6wz+Y
 Yj7mxrR/6fp3T31HBqQAqY7sJry3jfq0Mk3OAN+FoMTdb22eX8wyNAQumVEgUMbjHt14
 thjTIGWkCvkSSZna7JKOUSeimbLad5DYdz6QlK3dyCFPCzPcAX8iOJY7JoIimjdrBoy8 jA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u5f8dvx6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Nov 2023 17:35:56 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A6HZuQO003465
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Nov 2023 17:35:56 GMT
Received: from [10.71.110.254] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 6 Nov
 2023 09:35:56 -0800
Message-ID: <f97c86a6-34d3-45e1-8673-8a3f02f88392@quicinc.com>
Date: Mon, 6 Nov 2023 09:35:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/ci: Add support for SM8250 Gitlab Runner
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
References: <20231010-rb5-runner-v1-0-aba1fcc6e3aa@quicinc.com>
 <0b0b1065-06e8-44ea-a4a1-395980afac5a@collabora.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <0b0b1065-06e8-44ea-a4a1-395980afac5a@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oidrzqcyGQaChlGbzrGUmlmHaPwU8_VC
X-Proofpoint-GUID: oidrzqcyGQaChlGbzrGUmlmHaPwU8_VC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_13,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311060143
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
Cc: robdclark@chromium.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/4/2023 6:02 AM, Helen Koike wrote:
> Hi Jessica,
> 
> On 10/10/2023 19:25, Jessica Zhang wrote:
>> Recently, we've registered a Gitlab runner for a Qualcomm RB5 device 
>> that will be
>> hosted and maintained in Qualcomm labs.
>>
>> This series will add a corresponding CI job for testing SM8250 devices 
>> and add the
>> skip/fails/flakes list. We were able to complete a successful run [1] 
>> with these
>> changes.
>>
>> For now, we will keep the job as manual trigger only and drop that 
>> rule later
>> after we stabilize the tests.
>>
>> [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/50092719
>>
>> ---
> 
> Thank you for you patchset.
> 
> I'm getting the following error:
> 
> "serial.serialutil.SerialException: [Errno 2] could not open port 
> /dev/ttyUSB0: [Errno 2] No such file or directory: '/dev/ttyUSB0'"
> 
> https://gitlab.freedesktop.org/helen.fornazier/linux/-/jobs/51193215#L146
> 
> I'm wondering if I'm missing some configuration.
> 
> I tested on top of drm-misc-next.

Hi Helen,

Sorry for the inconvenience, but I had to temporarily take down the 
runner last Friday to physically move the setup (as part of a 
reorganization of our lab here).

I'll update this thread as soon as the runner is back up -- the move 
will be complete by the end of this week.

> 
> Also, I'd like to add in the docs an entry about the devices we have, 
> which tag they need, which dts they correspond to, which farm they are 
> located, who to contact if there is any problem and maybe some comment 
> about the device (how it is hooked up, the logs comes from uart or ssh, 
> does it use fastboot, etc) if you find it useful.
> Would you mind adding an entry in the docs with this information for the 
> sm8250? (Than I'll add the info of the other devices after yours).

Sure, sounds good.

> 
> 
>> Jessica Zhang (3):
>>        drm/ci: Add SM8250 job to CI
> 
> I would also move this patch to last, so we don't have a commit where 
> things shouldn't work properly.
> Or maybe squash them all.

Acked -- I'll move this patch to the end.

Thanks,

Jessica Zhang

> 
> Regards,
> Helen
> 
>>        drm/ci: enable CONFIG_INTERCONNECT_QCOM_SM8250 for arm64 config
>>        drm/ci: Add skips, fails and flakes for SM8250
>>
>>   drivers/gpu/drm/ci/arm64.config                 |  1 +
>>   drivers/gpu/drm/ci/build.sh                     |  1 +
>>   drivers/gpu/drm/ci/test.yml                     | 15 +++++++++++++
>>   drivers/gpu/drm/ci/xfails/msm-sm8250-fails.txt  | 29 
>> +++++++++++++++++++++++++
>>   drivers/gpu/drm/ci/xfails/msm-sm8250-flakes.txt |  3 +++
>>   drivers/gpu/drm/ci/xfails/msm-sm8250-skips.txt  |  8 +++++++
>>   6 files changed, 57 insertions(+)
>> ---
>> base-commit: dcd88f8c63341ed11a8c5019408f62202cd9d1f2
>> change-id: 20230919-rb5-runner-77ec32bd61e7
>>
>> Best regards,

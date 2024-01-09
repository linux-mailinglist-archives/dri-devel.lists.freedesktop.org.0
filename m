Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A97828AD6
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 18:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97B610E474;
	Tue,  9 Jan 2024 17:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F8D10E469;
 Tue,  9 Jan 2024 17:16:11 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 409GDcW8002997; Tue, 9 Jan 2024 17:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=3svU7b0tyFCpSBoa3yLQ52v339bU9u/QNEENmlt0W+E=; b=St
 DNcWHjRUH1bPF1HGvbVTXE2WRNLOnIK1GiYgNDsg9nNE3UDcgN+pQkgaE1FoSaJc
 jOsI06cu5WLQ29HaA8KUF7m+kevkxhliZpHI/pYzjdbKwYz7DuK4CCnEFuqkD40y
 qyTXegK4BtD+KW7JMxpNLAGtcnogXWCE+cYVdKQNg3FhEDoTF1z7w39xCnlt6iVs
 dYzZiP1j1XxqX/D8No95TjTGkYELKmarT1VWcIBstzVDp6nJjNuw6oA3mPVOzgQS
 VoukeDflxjqIykUBbiAuQ1JcDi4bh5KYwrg3oUadErPvRwCUpcp+tUhng5OeUhHj
 q357ovpM1sxOWoV0yB6Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vh9evr53b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 17:16:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 409HG2SF011247
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 Jan 2024 17:16:02 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 9 Jan
 2024 09:16:02 -0800
Message-ID: <865486be-df38-c732-b329-13b4cfdafe1c@quicinc.com>
Date: Tue, 9 Jan 2024 09:16:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/ci: Add msm tests
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20240108195016.156583-1-robdclark@gmail.com>
 <454873e5-1b5a-28d3-ffed-c1e502898d17@quicinc.com>
 <CAF6AEGuVk=a-SwHyVwqOew-+WAdH1Gt011H50kvkSBe1j5ri_A@mail.gmail.com>
 <CAF6AEGs7NxB2ox+JMW0tP_XOkFie=f=w1sWSQjTUM8AZQ0V3TQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAF6AEGs7NxB2ox+JMW0tP_XOkFie=f=w1sWSQjTUM8AZQ0V3TQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yA1HLDZbL39XdULj4kQn7-QSriDkRYc0
X-Proofpoint-ORIG-GUID: yA1HLDZbL39XdULj4kQn7-QSriDkRYc0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401090140
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Helen Koike <helen.koike@collabora.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/9/2024 7:31 AM, Rob Clark wrote:
> On Mon, Jan 8, 2024 at 6:13 PM Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Mon, Jan 8, 2024 at 2:58 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 1/8/2024 11:50 AM, Rob Clark wrote:
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> The msm tests should skip on non-msm hw, so I think it should be safe to
>>>> enable everywhere.
>>>>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---
>>>>    drivers/gpu/drm/ci/testlist.txt | 49 +++++++++++++++++++++++++++++++++
>>>>    1 file changed, 49 insertions(+)
>>>>
>>>
>>> I do see that all these tests use igt_msm_dev_open() to make sure it
>>> opens only the MSM card.
>>>
>>> But if igt_msm_dev_open() fails, I dont see a igt_require() on some of
>>> the tests to skip them. So how will it safely skip on non-msm HW?
>>>
>>> Unless i am missing something here ....
>>
>> hmm, at the time I added the initial msm tests, and
>> igt_msm_dev_open(), I verified that they skipped on intel.. but since
>> then I'd switched from intel to sc8280xp device for primary dev
>> device, so I'd need to re-test to remember how it works.  If these
>> aren't skipping on !msm, it is a bug
> 
> I double checked, these tests skip in drm_open_driver() with "No known
> gpu found for chipset flags 0x64 (msm)", so no problem to run them on
> all CI runners.
> 
> BR,
> -R
> 

Ack, thanks for checking


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> 
>> BR,
>> -R
>>
>>>> diff --git a/drivers/gpu/drm/ci/testlist.txt b/drivers/gpu/drm/ci/testlist.txt
>>>> index f82cd90372f4..eaeb751bb0ad 100644
>>>> --- a/drivers/gpu/drm/ci/testlist.txt
>>>> +++ b/drivers/gpu/drm/ci/testlist.txt
>>>> @@ -2910,3 +2910,52 @@ kms_writeback@writeback-invalid-parameters
>>>>    kms_writeback@writeback-fb-id
>>>>    kms_writeback@writeback-check-output
>>>>    prime_mmap_kms@buffer-sharing
>>>> +msm_shrink@copy-gpu-sanitycheck-8
>>>> +msm_shrink@copy-gpu-sanitycheck-32
>>>> +msm_shrink@copy-gpu-8
>>>> +msm_shrink@copy-gpu-32
>>>> +msm_shrink@copy-gpu-madvise-8
>>>> +msm_shrink@copy-gpu-madvise-32
>>>> +msm_shrink@copy-gpu-oom-8
>>>> +msm_shrink@copy-gpu-oom-32
>>>> +msm_shrink@copy-mmap-sanitycheck-8
>>>> +msm_shrink@copy-mmap-sanitycheck-32
>>>> +msm_shrink@copy-mmap-8
>>>> +msm_shrink@copy-mmap-32
>>>> +msm_shrink@copy-mmap-madvise-8
>>>> +msm_shrink@copy-mmap-madvise-32
>>>> +msm_shrink@copy-mmap-oom-8
>>>> +msm_shrink@copy-mmap-oom-32
>>>> +msm_shrink@copy-mmap-dmabuf-sanitycheck-8
>>>> +msm_shrink@copy-mmap-dmabuf-sanitycheck-32
>>>> +msm_shrink@copy-mmap-dmabuf-8
>>>> +msm_shrink@copy-mmap-dmabuf-32
>>>> +msm_shrink@copy-mmap-dmabuf-madvise-8
>>>> +msm_shrink@copy-mmap-dmabuf-madvise-32
>>>> +msm_shrink@copy-mmap-dmabuf-oom-8
>>>> +msm_shrink@copy-mmap-dmabuf-oom-32
>>>> +msm_mapping@ring
>>>> +msm_mapping@sqefw
>>>> +msm_mapping@shadow
>>>> +msm_submitoverhead@submitbench-10-bos
>>>> +msm_submitoverhead@submitbench-10-bos-no-implicit-sync
>>>> +msm_submitoverhead@submitbench-100-bos
>>>> +msm_submitoverhead@submitbench-100-bos-no-implicit-sync
>>>> +msm_submitoverhead@submitbench-250-bos
>>>> +msm_submitoverhead@submitbench-250-bos-no-implicit-sync
>>>> +msm_submitoverhead@submitbench-500-bos
>>>> +msm_submitoverhead@submitbench-500-bos-no-implicit-sync
>>>> +msm_submitoverhead@submitbench-1000-bos
>>>> +msm_submitoverhead@submitbench-1000-bos-no-implicit-sync
>>>> +msm_recovery@hangcheck
>>>> +msm_recovery@gpu-fault
>>>> +msm_recovery@gpu-fault-parallel
>>>> +msm_recovery@iova-fault
>>>> +msm_submit@empty-submit
>>>> +msm_submit@invalid-queue-submit
>>>> +msm_submit@invalid-flags-submit
>>>> +msm_submit@invalid-in-fence-submit
>>>> +msm_submit@invalid-duplicate-bo-submit
>>>> +msm_submit@invalid-cmd-idx-submit
>>>> +msm_submit@invalid-cmd-type-submit
>>>> +msm_submit@valid-submit

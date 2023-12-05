Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A44805B29
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 18:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F11710E5A8;
	Tue,  5 Dec 2023 17:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B2B10E5A8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 17:33:42 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B5Gj2N5002956; Tue, 5 Dec 2023 17:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Lg9rk2bBS3KEXt7PHC7hgvUmJGgcsxPJ/w2bepRjO7o=;
 b=osWCiv1KE1vnkovnGsKIylVtfwRdEppBifgnP5S38LPhvYAfBH7jGid3NpBvMA/NCWFm
 LCEmnNCHJ4LVKLE5W5eSGuCpYWgWHkgsompiOQVTf7HF7NoKMmChLQdllHJRwF+/uSQX
 LvNscZzjTIA17FgXJTIyT0hcIfTuOt9mC/kUffQ7RmR2PLtbIn+z8ySbBGCNCVF8NcjV
 wNsYG0WF48pPvKogY9mkGswXfyVjjeAkTRdzP4g58PBy6ZV7PCB/LZz9qtUNDYqTnTtT
 XvuKWW75cDq++0nJjr5xSTjcMd4P6ZkPtz8WGZ2YrG+Mc85apL/SDeV1HttsG+W2VuCZ vA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usmw02faf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Dec 2023 17:33:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B5HXWLg003747
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 5 Dec 2023 17:33:32 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Dec
 2023 09:33:29 -0800
Message-ID: <f59c5d45-a689-8a94-a2ae-d2ffa835eedf@quicinc.com>
Date: Tue, 5 Dec 2023 09:33:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Kunit drm_test_check_plane_state: EXPECTATION FAILED at
 drivers/gpu/drm/tests/drm_plane_helper_test.c:123
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>
References: <20231204173536.51003-1-naresh.kamboju@linaro.org>
 <rxv7jlfuwjib443pzdepbtgu454gdzemd3ojmmhbnhr4syneve@6me3bduyx2ee>
 <42d85b15-9ffd-4a08-b51e-a3367e57d128@suswa.mountain>
 <fgajgc7vp626nzeeqetkfbyadh53iti3mvoq4uck3zz3ysmvno@b3f7kxnwrwsd>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <fgajgc7vp626nzeeqetkfbyadh53iti3mvoq4uck3zz3ysmvno@b3f7kxnwrwsd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: D3PiGiOvbJnrwgPVR-o3XXv7mkveCrFd
X-Proofpoint-GUID: D3PiGiOvbJnrwgPVR-o3XXv7mkveCrFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_12,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=847 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312050138
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
Cc: regressions@lists.linux.dev, tzimmermann@suse.de,
 Naresh Kamboju <naresh.kamboju@linaro.org>, linux-kernel@vger.kernel.org,
 lkft-triage@lists.linaro.org, dri-devel@lists.freedesktop.org,
 davidgow@google.com, Jessica Zhang <quic_jesszhan@quicinc.com>, Linux Kernel
 Functional Testing <lkft@linaro.org>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/5/2023 3:46 AM, Maxime Ripard wrote:
> On Tue, Dec 05, 2023 at 12:05:02PM +0300, Dan Carpenter wrote:
>> On Tue, Dec 05, 2023 at 09:37:05AM +0100, Maxime Ripard wrote:
>>> Hi Naresh,
>>>
>>> Thanks for the report
>>>
>>> On Mon, Dec 04, 2023 at 11:05:36PM +0530, Naresh Kamboju wrote:
>>>> The Kunit drm_plane_helper failed on all devices running Linux next-20231204
>>>>
>>>> ## Test Regressions (compared to next-20231201)
>>>> * qemu-armv7, kunit and
>>>> * x86, kunit
>>>>    - drm_test_check_invalid_plane_state_downscaling_invalid
>>>>    - drm_test_check_invalid_plane_state_drm_plane_helper
>>>>    - drm_test_check_invalid_plane_state_drm_test_check_invalid_plane_state
>>>>    - drm_test_check_invalid_plane_state_positioning_invalid
>>>>    - drm_test_check_invalid_plane_state_upscaling_invalid
>>>>    - drm_test_check_plane_state_clipping_rotate_reflect
>>>>    - drm_test_check_plane_state_clipping_simple
>>>>    - drm_test_check_plane_state_downscaling
>>>>    - drm_test_check_plane_state_drm_test_check_plane_state
>>>>    - drm_test_check_plane_state_positioning_simple
>>>>    - drm_test_check_plane_state_rounding1
>>>>    - drm_test_check_plane_state_rounding2
>>>>    - drm_test_check_plane_state_rounding3
>>>>    - drm_test_check_plane_state_rounding4
>>>>    - drm_test_check_plane_state_upscaling
>>>
>>> I found the source of failure to be f1e75da5364e ("drm/atomic: Loosen FB
>>> atomic checks").
>>>
>>> Fortunately for us, it's already been reverted yesterday for some
>>> unrelated reason, so it should be fixed in next-20231205 onward.
>>
>> Sorry, that's a bummer that these patches were reverted.  :(  The whole
>> episode was a bit unfortunate...
>>
>> Qualcom has been working on those patches for a year.  They must not be
>> using kunit testing as part of their QC...  It's some kind of
>> communication failure on our part.
> 
> That's definitely a communication failure, but that's mostly on us :)
> 
> The reason these patches were reverted was completely unrelated to the
> kunit failures here: it failed the basic requirement we have on
> intel-gpu-tools tests and open-source userspace examples for new uAPIs.
> 
> So whether or not kunit tests would have passed, these patches were
> applied due to inattention and would have been reverted anyway
> 
> Maxime

The patches were reverted because the corresponding IGT/compositor 
changes were not posted yet. We will re-try applying once those are 
accepted.

Regarding KUnit tests, no we did not run this test and yes you are 
right, we were not running KUnit testing as the DRM CI mainly validates IGT.

We will certainly help to fix this failure. Most likely the KUnit tests 
need to be fixed to allow for a NULL FB.

If this is documented somewhere as a requirement, please share it and we 
should add KUnit testing to our DRM CI as well so that atleast this kind 
of failure will not repeat.

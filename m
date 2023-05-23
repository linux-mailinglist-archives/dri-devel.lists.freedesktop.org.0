Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CF170E54C
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 21:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DA310E4A6;
	Tue, 23 May 2023 19:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F389A10E4A6;
 Tue, 23 May 2023 19:23:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34NDsmwA032276; Tue, 23 May 2023 19:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=X4dOZT20dOqS0usZgo9QW+bAxHjpFuRs1ASLPZBhyvI=;
 b=MKCTUdSNq6Ap04GWW+n0jYEdbortfYUbFIKWs+fftOD+Mb/770hh+fbukjizbk2eCO4Z
 sVQ1+ivq4jJV+Tn18z+A3guboeIDrlJgf5pxEMTWoW94y8GjRJWulMhxsMosp6GO7lGb
 u8lProlvhh+qNbaiTkKvEYZHaPnfp++4t+HUUOwHUUcsUAOt9wu6nUpGPJcidk8p0zRb
 hKbKOCel8mKurvdIWExSe0Vf8Hhv+Br1gTuKnWRL7IBZJpYEdP0UhrZgv+Ik+k9GrVqF
 lPesL5FVZYH7QAjQvAoEzZcJQNtYOgFynjG6vkhN0ixk1Bixuts1KPY7m1BoOENV1jFN zg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qr6h0v5sj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 19:23:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34NJN6Kc028839
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 19:23:07 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 23 May
 2023 12:23:05 -0700
Message-ID: <f530691b-989d-b059-6b06-e66abb740bdb@quicinc.com>
Date: Tue, 23 May 2023 12:23:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dp: add module parameter for PSR
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230427232848.5200-1-quic_abhinavk@quicinc.com>
 <053819bd-b3c4-a72c-9316-85d974082ad6@linaro.org>
 <ZGzalLjTvUfzEADU@hovoldconsulting.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZGzalLjTvUfzEADU@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RLVmB3q_iuB8PXhW-xmEok0S0tp12gQd
X-Proofpoint-ORIG-GUID: RLVmB3q_iuB8PXhW-xmEok0S0tp12gQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_12,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230157
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
Cc: freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 linux-arm-msm@vger.kernel.org, quic_jesszhan@quicinc.com, Sean
 Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/23/2023 8:24 AM, Johan Hovold wrote:
> On Fri, May 12, 2023 at 09:13:04PM +0300, Dmitry Baryshkov wrote:
>> On 28/04/2023 02:28, Abhinav Kumar wrote:
>>> On sc7280 where eDP is the primary display, PSR is causing
>>> IGT breakage even for basic test cases like kms_atomic and
>>> kms_atomic_transition. Most often the issue starts with below
>>> stack so providing that as reference
>>>
>>> Call trace:
>>>    dpu_encoder_assign_crtc+0x64/0x6c
>>>    dpu_crtc_enable+0x188/0x204
>>>    drm_atomic_helper_commit_modeset_enables+0xc0/0x274
>>>    msm_atomic_commit_tail+0x1a8/0x68c
>>>    commit_tail+0xb0/0x160
>>>    drm_atomic_helper_commit+0x11c/0x124
>>>    drm_atomic_commit+0xb0/0xdc
>>>    drm_atomic_connector_commit_dpms+0xf4/0x110
>>>    drm_mode_obj_set_property_ioctl+0x16c/0x3b0
>>>    drm_connector_property_set_ioctl+0x4c/0x74
>>>    drm_ioctl_kernel+0xec/0x15c
>>>    drm_ioctl+0x264/0x408
>>>    __arm64_sys_ioctl+0x9c/0xd4
>>>    invoke_syscall+0x4c/0x110
>>>    el0_svc_common+0x94/0xfc
>>>    do_el0_svc+0x3c/0xb0
>>>    el0_svc+0x2c/0x7c
>>>    el0t_64_sync_handler+0x48/0x114
>>>    el0t_64_sync+0x190/0x194
>>> ---[ end trace 0000000000000000 ]---
>>> [drm-dp] dp_ctrl_push_idle: PUSH_IDLE pattern timedout
>>>
>>> Other basic use-cases still seem to work fine hence add a
>>> a module parameter to allow toggling psr enable/disable till
>>> PSR related issues are hashed out with IGT.
>>
>> For the reference: Bjorn reported that he has issues with VT on a
>> PSR-enabled laptops. This patch fixes the issue for him
> 
> Module parameters are almost never warranted, and it is definitely not
> the right way to handle a broken implementation.
> 
> I've just sent a revert that unconditionally disables PSR support until
> the implementation has been fixed:
> 
> 	https://lore.kernel.org/lkml/20230523151646.28366-1-johan+linaro@kernel.org/
> 
> Johan

I dont completely agree with this. Even the virtual terminal case was 
reported to be fixed by one user but not the other. So it was probably 
something missed out either in validation or reproduction steps of the 
user who reported it to be fixed OR the user who reported it not fixed. 
That needs to be investigated now.

We should have ideally gone with the modparam with the feature patches 
itself knowing that it gets enabled for all sinks if PSR is supported.

I had discussed with Rob that till we have some more confidence with the 
reported issues we would go with the modparam so as to not do the full 
revert.

In this particular case, the one line revert is not really a deal 
breaker. In some other implementations, it might not really be so 
trivial to revert the feature with a one line change.

So I would like to understand what is the concern with the mod param if 
the maintainers are onboard with it.

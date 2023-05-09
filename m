Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0F96FCE5C
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 21:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF58610E3C5;
	Tue,  9 May 2023 19:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E6310E1B0;
 Tue,  9 May 2023 19:15:39 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349IGSXv016010; Tue, 9 May 2023 19:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NEwpD0MHi33YJ73MMvOp8SyW+BSA/M2HMWq8AH4/Gz4=;
 b=eNx2lY+nZyq47BdcsdSRKJ/X/hADn5p2WgusHUHpPCD+PserzeClowvDp6JFm1JBxj+u
 QVr+SDVLFGpgY2q4jYqp9aVr32zhxNguSqdRak0Q/r4+IRlqNacGwxIcYXVvUAOiGbPO
 ZUpZWopgjPy+InsKq7QtSaFsV4JAXTcvjD7BgMCYuOIaWEH2kHf0XnwVL28KGu7uyaZx
 A8uz5JH6ZpqJ+q6CKKYT/Tt8tCCjJIvfLm8GNK+oTJdFnVk7r5vQK2y6hcP3BN4n0Nal
 VrwtwOM6u29WZTMrmc7eYmargHSPRuzowMWkN5GDGzoqUSV82+X6tlnYuY7P4leWkn/1 3w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf77ktnyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 19:15:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 349JFITQ018728
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 May 2023 19:15:19 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 9 May 2023
 12:15:18 -0700
Message-ID: <1345a125-f745-4fe3-0f5e-bfe84225958d@quicinc.com>
Date: Tue, 9 May 2023 12:15:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] Revert "drm/msm/dp: Remove INIT_SETUP delay"
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Leonard Lausen
 <leonard@lausen.nl>, Bjorn Andersson <andersson@kernel.org>
References: <b0cc40d5-6de1-91cc-e2cd-f47cc53551e4@quicinc.com>
 <ebbcd56ac883d3c3d3024d368fab63d26e02637a@lausen.nl>
 <20230508021536.txtamifw2vkfncnx@ripper>
 <3802269cd54ce105ef6dece03b1b9af575b4fa06@lausen.nl>
 <ad351c02-1c29-3601-53e8-f8cdeca2ac63@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ad351c02-1c29-3601-53e8-f8cdeca2ac63@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CUQmunFR2A588q0l-jFDQdWMkkhVJJSt
X-Proofpoint-ORIG-GUID: CUQmunFR2A588q0l-jFDQdWMkkhVJJSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_12,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 adultscore=0 mlxlogscore=934 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090159
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, regressions@lists.linux.dev,
 Nikita Travkin <nikita@trvn.ru>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/8/2023 4:30 AM, Dmitry Baryshkov wrote:
> On 08/05/2023 14:02, Leonard Lausen wrote:
>> Abhinav Kumar <quic_abhinavk@quicinc.com> writes:
>>> On 5/7/2023 7:15 PM, Bjorn Andersson wrote:
>>>> When booting with the cable connected on my X13s, 100 is long enough 
>>>> for
>>>> my display to time out and require me to disconnect and reconnect the
>>>> cable again.
>>>>
>>>> Do we have any idea of why the reduction to 0 is causing an issue when
>>>> using the internal HPD?
>>>>
>>>> Regards,
>>>> Bjorn
>>> Yes, we do know why this is causing an issue. The cleaner patch for this
>>> will be posted this week.
>>
>> Great!
>>
>>> There is no need to add the 100ms delay back yet.
>>>
>>> thanks for posting this but NAK on this patch till we post the fix this
>>> week.
>>>
>>> Appreciate a bit of patience till then.
>>
>> This regression is already part of the 6.3 stable release series. Will
>> the new patch qualify for inclusion in 6.3.y? Or will it be part of 6.4
>> and this revert should go into 6.3.y?
> 
> This is a tough situation, as landing a revert will break x13s, as noted 
> by Bjorn. Given that the workaround is known at this moment, I would 
> like to wait for the patch from Abhinav to appear, then we can decide 
> which of the fixes should go to the stable kernel.
> 
>>
>> Even with this revert, there are additional regressions in 6.3 causing
>> dpu errors and blank external display upon suspending and resuming the
>> system while an external display is connected. Will your new patch also
>> fix these regressions?
>>
>> [  275.025497] [drm:dpu_encoder_phys_vid_wait_for_commit_done:488] 
>> [dpu error]vblank timeout
>> [  275.025514] [drm:dpu_kms_wait_for_commit_done:510] [dpu error]wait 
>> for commit done returned -110
>> [  275.064141] [drm:dpu_encoder_frame_done_timeout:2382] [dpu 
>> error]enc33 frame done timeout
>>
>> followed by a kernel panic if any modification to the display settings
>> is done, such as disabling the external display:
> 
> Interesting crash, thank you for the report.
> 

This is a different crash but the root-cause of both the issues is the 
bridge hpd_enable/disable series.

https://patchwork.freedesktop.org/patch/514414/

This is breaking the sequence and logic of internal hpd as per my 
discussion with kuogee.

We are analyzing the issue and the fix internally first and once we 
figure out all the details will post it.

>>
>> [  341.631287] Hardware name: Google Lazor (rev3 - 8) (DT)
>> [  341.631290] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS 
>> BTYPE=--)
>> [  341.631296] pc : do_raw_spin_unlock+0xb8/0xc4
>> [  341.631310] lr : do_raw_spin_unlock+0x78/0xc4
>> [  341.631315] sp : ffffffc01100b880
>> [  341.631317] x29: ffffffc01100b880 x28: 0000000000000028 x27: 
>> 0000000000000038
>> [  341.631326] x26: ffffff808c89e180 x25: ffffffef33e39920 x24: 
>> 0000000000000000
>> [  341.631333] x23: ffffffef33e3ca0c x22: 0000000000000002 x21: 
>> ffffff808345ded8
>> [  341.631339] x20: ffffff808345ded0 x19: 000000000000001e x18: 
>> 0000000000000000
>> [  341.631345] x17: 0048000000000460 x16: 0441043b04600438 x15: 
>> 04380000089807d0
>> [  341.631351] x14: 07b0089807800780 x13: 0000000000000068 x12: 
>> 0000000000000001
>> [  341.631357] x11: ffffffef3413bb76 x10: 0000000000000bb0 x9 : 
>> ffffffef33e3d6bc
>> [  341.631363] x8 : ffffff808c89ed90 x7 : ffffff80b1c9f738 x6 : 
>> 0000000000000001
>> [  341.631370] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 
>> ffffff808345def0
>> [  341.631375] x2 : 00000000dead4ead x1 : 0000000000000003 x0 : 
>> 0000000000000000
>> [  341.631383] Kernel panic - not syncing: Asynchronous SError Interrupt
>> [  341.631386] CPU: 3 PID: 1520 Comm: kwin_wayland Not tainted 
>> 6.3.0-stb-cbq+ #2
>> [  341.631390] Hardware name: Google Lazor (rev3 - 8) (DT)
>> [  341.631393] Call trace:
>> [  341.631395]  dump_backtrace+0xc8/0x104
>> [  341.631402]  show_stack+0x20/0x30
>> [  341.631407]  dump_stack_lvl+0x48/0x60
>> [  341.631414]  dump_stack+0x18/0x24
>> [  341.631419]  panic+0x130/0x2fc
>> [  341.631425]  nmi_panic+0x54/0x78
>> [  341.631428]  arm64_serror_panic+0x74/0x80
>> [  341.631434]  arm64_is_fatal_ras_serror+0x6c/0x8c
>> [  341.631439]  do_serror+0x48/0x60
>> [  341.631444]  el1h_64_error_handler+0x30/0x48
>> [  341.631450]  el1h_64_error+0x68/0x6c
>> [  341.631455]  do_raw_spin_unlock+0xb8/0xc4
>> [  341.631460]  _raw_spin_unlock_irq+0x18/0x38
>> [  341.631466]  __wait_for_common+0xb8/0x154
>> [  341.631472]  wait_for_completion_timeout+0x28/0x34
>> [  341.631477]  dp_ctrl_push_idle+0x3c/0x88
>> [  341.631483]  dp_bridge_disable+0x20/0x2c
>> [  341.631488]  drm_atomic_bridge_chain_disable+0x8c/0xb8
>> [  341.631495]  drm_atomic_helper_commit_modeset_disables+0x198/0x450
>> [  341.631501]  msm_atomic_commit_tail+0x1c8/0x36c
>> [  341.631507]  commit_tail+0x80/0x108
>> [  341.631512]  drm_atomic_helper_commit+0x114/0x118
>> [  341.631516]  drm_atomic_commit+0xb4/0xe0
>> [  341.631522]  drm_mode_atomic_ioctl+0x6b0/0x890
>> [  341.631527]  drm_ioctl_kernel+0xe4/0x164
>> [  341.631534]  drm_ioctl+0x35c/0x3bc
>> [  341.631539]  vfs_ioctl+0x30/0x50
>> [  341.631547]  __arm64_sys_ioctl+0x80/0xb4
>> [  341.631552]  invoke_syscall+0x84/0x11c
>> [  341.631558]  el0_svc_common.constprop.0+0xc0/0xec
>> [  341.631563]  do_el0_svc+0x94/0xa4
>> [  341.631567]  el0_svc+0x2c/0x54
>> [  341.631570]  el0t_64_sync_handler+0x94/0x100
>> [  341.631575]  el0t_64_sync+0x194/0x198
>> [  341.631580] SMP: stopping secondary CPUs
>> [  341.831615] Kernel Offset: 0x2f2b200000 from 0xffffffc008000000
>> [  341.831618] PHYS_OFFSET: 0x80000000
>> [  341.831620] CPU features: 0x400000,61500506,3200720b
>> [  341.831623] Memory Limit: none
> 

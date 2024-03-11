Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7948785BF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 17:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A2E112B82;
	Mon, 11 Mar 2024 16:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="poNd9bed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADFD112B82;
 Mon, 11 Mar 2024 16:51:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42B7t52a004010; Mon, 11 Mar 2024 16:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=DJsySqRf7nCURDT9iP0DaCaSIGev0XqvLhdnQhcBmAA=; b=po
 Nd9bedqRB5wiBWPwb4N3JgfTwG39s6itx+xi1A30yt9dxdTAklyYjhEZLAIY828T
 8ho/Wz9f1MN5mPPREkmNRauyGq8vq0mNacoHYSOFe8ryMRLHly5kW02Hr/3fW+NJ
 IRQrinl7FKvUIaJYWy/LW86Ehpi08OYxKYUoj6/HzfXmWy9B3gbUPHjK/F25UUKK
 FsYtsPWcBGLaNBI5sOTh4ZO0a2rrHcjYwnLCa+BBaoOrVISYZcV+X7ZMY7PDRr12
 ijSmnoKx8KIf3gzUcTidSzCilU9JFZ/2ZHD2ApV3SSTilxDBzT22jjBCIejkxTrP
 rW9aB827VWApoH6SRYFw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wswyj9g34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Mar 2024 16:51:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42BGpY7L018153
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Mar 2024 16:51:34 GMT
Received: from [10.110.79.125] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Mar
 2024 09:51:30 -0700
Message-ID: <b1ae6e39-10c3-0ee1-11f4-3436c3e4ec1a@quicinc.com>
Date: Mon, 11 Mar 2024 09:51:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drm/msm: DisplayPort hard-reset on hotplug regression in 6.8-rc1
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 "Daniel Thompson" <daniel.thompson@linaro.org>,
 Sean Paul <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson
 <quic_bjorande@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_sbillaka@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <regressions@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
References: <Zd3kvD02Qvsh2Sid@hovoldconsulting.com>
 <ZesH21DcfOldRD9g@hovoldconsulting.com>
 <56de6cfb-fe0f-de30-d4d0-03c0fbb0afbb@quicinc.com>
 <ZeyOmJLlBbwnmaJN@hovoldconsulting.com>
 <Ze8Ke_M2xHyPYCu-@hovoldconsulting.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <Ze8Ke_M2xHyPYCu-@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BX2bXjfYCQi2RS20pNe9if4sN1kzV9zE
X-Proofpoint-ORIG-GUID: BX2bXjfYCQi2RS20pNe9if4sN1kzV9zE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_10,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403110127
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



On 3/11/2024 6:43 AM, Johan Hovold wrote:
> On Sat, Mar 09, 2024 at 05:30:17PM +0100, Johan Hovold wrote:
>> On Fri, Mar 08, 2024 at 09:50:17AM -0800, Abhinav Kumar wrote:
>>> On 3/8/2024 4:43 AM, Johan Hovold wrote:
>>
>>> For this last remaining reset with the stacktrace you have mentioned
>>> below, I do not think this was introduced due to PM runtime series. We
>>> have had this report earlier with the same stacktrace as well in earlier
>>> kernels which didnt have PM runtime support:
>>
>>> But, it seems like there is another race condition in this code
>>> resulting in this issue again.
>>>
>>> I have posted my analysis with the patch here as a RFC y'day:
>>>
>>> https://patchwork.freedesktop.org/patch/581758/
>>>
>>> I missed CCing you and Bjorn on the RFC but when I post it as a patch
>>> either today/tomm, will CC you both.
>>
>> Ok, thanks. I'll take a closer look at that next week. It's not clear to
>> me what that race looks like after reading the commit message. It would
>> be good to have some more details in there (e.g. the sequence of events
>> that breaks the state machine) and some way to reproduce the issue
>> reliably.
> 
> I was able to reproduce the reset with some of my debug printks in place
> after reapplying the reverted hpd notify change so I have an explanation
> for (one of) the ways we can up in this state now.
> 
> This does not match description of the problem in the fix linked to
> above and I don't think that patch solves the underlying issue even if
> it may make the race window somewhat smaller. More details below.
>   

Its the same condition you described below that enable does not go 
through and we bail out as we are in ST_DISCONNECTED.

>>>> We now also have Bjorn's call trace from a different Qualcomm platform
>>>> triggering an unclocked access on disconnect, something which would
>>>> trigger a reset by the hypervisor on sc8280xp platforms like the X13s:
>>
>>>> [ 2030.379583] Kernel panic - not syncing: Asynchronous SError Interrupt
>>>> [ 2030.379586] CPU: 0 PID: 239 Comm: kworker/0:2 Not tainted 6.8.0-rc4-next-20240216-00015-gc937d3c43ffe-dirty #219
>>>> [ 2030.379590] Hardware name: Qualcomm Technologies, Inc. Robotics RB3gen2 (DT)
>>>> [ 2030.379592] Workqueue: events output_poll_execute [drm_kms_helper]
>>>> [ 2030.379642] Call trace:
>>
>>>> [ 2030.379722]  wait_for_completion_timeout+0x14/0x20
>>>> [ 2030.379727]  dp_ctrl_push_idle+0x34/0x8c [msm]
>>>> [ 2030.379844]  dp_bridge_atomic_disable+0x18/0x24 [msm]
>>>> [ 2030.379959]  drm_atomic_bridge_chain_disable+0x6c/0xb4 [drm]
>>>> [ 2030.380150]  drm_atomic_helper_commit_modeset_disables+0x174/0x57c [drm_kms_helper]
>>>> [ 2030.380200]  msm_atomic_commit_tail+0x1b4/0x474 [msm]
>>>> [ 2030.380316]  commit_tail+0xa4/0x158 [drm_kms_helper]
>>>> [ 2030.380369]  drm_atomic_helper_commit+0x24c/0x26c [drm_kms_helper]
>>>> [ 2030.380418]  drm_atomic_commit+0xa8/0xd4 [drm]
>>>> [ 2030.380529]  drm_client_modeset_commit_atomic+0x16c/0x244 [drm]
>>>> [ 2030.380641]  drm_client_modeset_commit_locked+0x50/0x168 [drm]
>>>> [ 2030.380753]  drm_client_modeset_commit+0x2c/0x54 [drm]
>>>> [ 2030.380865]  __drm_fb_helper_restore_fbdev_mode_unlocked+0x60/0xa4 [drm_kms_helper]
>>>> [ 2030.380915]  drm_fb_helper_hotplug_event+0xe0/0xf4 [drm_kms_helper]
>>>> [ 2030.380965]  msm_fbdev_client_hotplug+0x28/0xc8 [msm]
>>>> [ 2030.381081]  drm_client_dev_hotplug+0x94/0x118 [drm]
>>>> [ 2030.381192]  output_poll_execute+0x214/0x26c [drm_kms_helper]
>>>> [ 2030.381241]  process_scheduled_works+0x19c/0x2cc
>>>> [ 2030.381249]  worker_thread+0x290/0x3cc
>>>> [ 2030.381255]  kthread+0xfc/0x184
>>>> [ 2030.381260]  ret_from_fork+0x10/0x20
>>>>
>>>> The above could happen if the convoluted hotplug state machine breaks
>>>> down so that the device is runtime suspended before
>>>> dp_bridge_atomic_disable() is called.
>>
>>> Yes, state machine got broken and I have explained how in the commit
>>> text of the RFC. But its not necessarily due to PM runtime but a
>>> sequence of events happening from userspace exposing this breakage.
>>
>> After looking at this some more today, I agree with you. The
>> observations I've reported are consistent with what would happen if the
>> link clock is disabled when dp_bridge_atomic_disable() is called.
>>
>> That clock is disabled in dp_bridge_atomic_post_disable() before runtime
>> suspending, but perhaps there are some further paths that can end up
>> disabling it.
> 
> Turns out there are paths like that and we hit those more often before
> reverting e467e0bde881 ("drm/msm/dp: use drm_bridge_hpd_notify().
> 
> Specifically, when a previous connect attempt did not enable the bridge
> fully so that it is still in the ST_MAINLINK_READY when we receive a
> disconnect event, dp_hpd_unplug_handle() will turn of the link clock.
> 
> [  204.527625] msm-dp-display ae98000.displayport-controller: dp_bridge_hpd_notify - link_ready = 1, status = 2
> [  204.531553] msm-dp-display ae98000.displayport-controller: dp_hpd_unplug_handle
> [  204.533261] msm-dp-display ae98000.displayport-controller: dp_ctrl_off_link
> 
> A racing connect event, such as the one I described earlier, can then
> try to enable the bridge again but dp_bridge_atomic_enable() just bails
> out early (and leaks a rpm reference) because we're now in
> ST_DISCONNECTED:
> 
> [  204.535773] msm-dp-display ae98000.displayport-controller: dp_bridge_hpd_notify - link_ready = 1, status = 1
> [  204.536187] [CONNECTOR:35:DP-2] status updated from disconnected to connected
> [  204.536905] msm-dp-display ae98000.displayport-controller: dp_display_notify_disconnect - would clear link ready (1), state = 0
> [  204.537821] msm-dp-display ae98000.displayport-controller: dp_bridge_atomic_check - link_ready = 1
> [  204.538063] msm-dp-display ae98000.displayport-controller: dp_display_send_hpd_notification - hpd = 0, link_ready = 1
> [  204.542778] msm-dp-display ae98000.displayport-controller: dp_bridge_atomic_enable
> [  204.586547] msm-dp-display ae98000.displayport-controller: dp_bridge_atomic_enable - state = 0 (rpm leak?)
> 
> Clearing link_ready already in dp_display_notify_disconnect() would make
> the race window slightly smaller, but it would essentially just paper
> over the bug as the events are still not serialised. Notably, there is
> no user space interaction involved here and it's the spurious connect
> event that triggers the bridge enable.
> 

Yes, it only narrows down the race condition window. The issue can still 
happen if the commit / modeset was issued before we marked link_ready as 
false.

And yes, I was only targetting a short term fix till we rework the HPD. 
That will happen only incrementally as its a delicate piece of code.

> When the fbdev hotplug code later disables the never-enabled bridge,
> things go boom:
> 
> [  204.649072] msm-dp-display ae98000.displayport-controller: dp_bridge_hpd_notify - link_ready = 0, status = 2
> [  204.650378] [CONNECTOR:35:DP-2] status updated from connected to disconnected
> [  204.651111] msm-dp-display ae98000.displayport-controller: dp_bridge_atomic_disable
> 
> as the link clock has already been disabled when accessing the link
> registers.
> 
> The stack trace for the bridge enable above is:
> 
> [  204.553922]  dp_bridge_atomic_enable+0x40/0x2f0 [msm]
> [  204.555241]  drm_atomic_bridge_chain_enable+0x54/0xc8 [drm]
> [  204.556557]  drm_atomic_helper_commit_modeset_enables+0x194/0x26c [drm_kms_helper]
> [  204.557853]  msm_atomic_commit_tail+0x204/0x804 [msm]
> [  204.559173]  commit_tail+0xa4/0x18c [drm_kms_helper]
> [  204.560450]  drm_atomic_helper_commit+0x19c/0x1b0 [drm_kms_helper]
> [  204.561743]  drm_atomic_commit+0xa4/0xdc [drm]
> [  204.563065]  drm_client_modeset_commit_atomic+0x22c/0x298 [drm]
> [  204.564402]  drm_client_modeset_commit_locked+0x60/0x1c0 [drm]
> [  204.565733]  drm_client_modeset_commit+0x30/0x58 [drm]
> [  204.567055]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xbc/0xfc [drm_kms_helper]
> [  204.568381]  drm_fb_helper_hotplug_event.part.0+0xd4/0x110 [drm_kms_helper]
> [  204.569708]  drm_fb_helper_hotplug_event+0x38/0x44 [drm_kms_helper]
> [  204.571032]  msm_fbdev_client_hotplug+0x28/0xd4 [msm]
> [  204.572395]  drm_client_dev_hotplug+0xcc/0x130 [drm]
> [  204.573755]  drm_kms_helper_connector_hotplug_event+0x34/0x44 [drm_kms_helper]
> [  204.575114]  drm_bridge_connector_hpd_cb+0x90/0xa4 [drm_kms_helper]
> [  204.576465]  drm_bridge_hpd_notify+0x40/0x5c [drm]
> [  204.577842]  drm_aux_hpd_bridge_notify+0x18/0x28 [aux_hpd_bridge]
> [  204.579184]  pmic_glink_altmode_worker+0xc0/0x23c [pmic_glink_altmode]
> 
>>>> For some reason, possibly due to unrelated changes in timing, possibly
>>>> after the hotplug revert, I am no longer able to reproduce the reset
>>>> with 6.8-rc7 on the X13s.
>>
>>> I do not know how the hotplug revert fixed this stack because I think
>>> this can still happen.
> 
> So, while it may still be theoretically possible to hit the resets after
> the revert, the HPD notify revert effectively "fixed" the regression in
> 6.8-rc1 by removing the preconditions that now made us hit it (i.e. the
> half-initialised bridge).
> 

Not entirely. In the bug which was reported before the patch 
e467e0bde881 ("drm/msm/dp: use drm_bridge_hpd_notify() got landed, its a 
classic example of how this issue can happen with userspace involvement 
and not just fbdev client which was your case.

> It seems the hotplug state machine needs to be reworked completely, but
> at least we're roughly back where we were with 6.7 (including that the
> bus clocks will never be turned of because of the rpm leaks on
> disconnect).
> 

Yes, we already landed that revert but I am also planning to land the 
patch I had posted till we rework HPD.

> Johan

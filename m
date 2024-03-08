Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A45876A2F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 18:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D0310F4BC;
	Fri,  8 Mar 2024 17:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="AAu4KxEG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC4F10EEF2;
 Fri,  8 Mar 2024 17:50:30 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 428AqJLu008375; Fri, 8 Mar 2024 17:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=p21R8fG/zDwLD9ex80A7W0Xh5x+SPOx5G/U883UBTPQ=; b=AA
 u4KxEGEeO96H5mMbvkxPal8rHyxuWCSnoW8t1jqyridgIAhmP9BE75ZkdTcU6cw3
 vhdpaXza/Dgi02sWzxhzpM+JNJw75qzonRSomlQVVICuj/A930ZkQhRoTYsi49Yz
 YeoFLZ2pG17qAPD1LsPPzqgdmmsy9uGiFTzM85D8ZXJcJGIokfLLjNPRBNeIfMzm
 bSIL2NAFNdOzOKN22eCl8vgnu7/0DfZsisRxDItZ73QspbWOcduIwdkZCC10k6hq
 PYy/IWeWdDBf7BQZc+WYoLqY40q8UGQHFJ1p+r9uSsS/Nbcyun0VaffMDJrrb9wg
 h8F8mZjKprQpLLbKmaqQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wqyfss4cn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Mar 2024 17:50:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 428HoMqO026626
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Mar 2024 17:50:22 GMT
Received: from [10.110.79.125] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Mar
 2024 09:50:19 -0800
Message-ID: <56de6cfb-fe0f-de30-d4d0-03c0fbb0afbb@quicinc.com>
Date: Fri, 8 Mar 2024 09:50:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drm/msm: DisplayPort hard-reset on hotplug regression in 6.8-rc1
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>, Rob Clark <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
CC: Daniel Thompson <daniel.thompson@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson
 <quic_bjorande@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_sbillaka@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <regressions@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
References: <Zd3kvD02Qvsh2Sid@hovoldconsulting.com>
 <ZesH21DcfOldRD9g@hovoldconsulting.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZesH21DcfOldRD9g@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5hJw2ARPycLdgUkFdJGf6tuqV1Tm26qT
X-Proofpoint-ORIG-GUID: 5hJw2ARPycLdgUkFdJGf6tuqV1Tm26qT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080142
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

Hi Johan

On 3/8/2024 4:43 AM, Johan Hovold wrote:
> Hi Abhinav, Rob, Dmitry and Kuogee,
> 
> On Tue, Feb 27, 2024 at 02:33:48PM +0100, Johan Hovold wrote:
> 
>> Since 6.8-rc1 I have seen (and received reports) of hard resets of the
>> Lenovo ThinkPad X13s after connecting and disconnecting an external
>> display.
>>
>> I have triggered this on a simple disconnect while in a VT console, but
>> also when stopping Xorg after having repeatedly connected and
>> disconnected an external display and tried to enable it using xrandr.
>>
>> In the former case, the last (custom debug) messages printed over an SSH
>> session were once:
>>
>>      [  948.416358] usb 5-1: USB disconnect, device number 3
>>      [  948.443496] msm_dpu ae01000.display-controller: msm_fbdev_client_hotplug
>>      [  948.443723] msm-dp-display ae98000.displayport-controller: dp_power_clk_enable - type = 1, enable = 0
>>      [  948.443872] msm-dp-display ae98000.displayport-controller: dp_ctrl_phy_exit
>>      [  948.445117] msm-dp-display ae98000.displayport-controller: dp_ctrl_phy_exit - done
>>      
>> and then the hypervisor resets the machine.
> 
> Has there been any progress on tracking down the reset on disconnect
> issue? I was expecting you to share your findings here so that we can
> determine if the rest of the runtime PM series needs to be reverted or
> not before 6.8 is released (possibly on Sunday).
> 
> I really did not want to spend more on this driver than I already have
> this cycle, but the lack of (visible) progress has again forced me to do
> so.
> 
> It's quite likely that the resets are indeed a regression caused by the
> runtime PM series as the bus clocks were not disabled on disconnect
> before that one was merged in 6.8-rc1.
> 

For this last remaining reset with the stacktrace you have mentioned 
below, I do not think this was introduced due to PM runtime series. We 
have had this report earlier with the same stacktrace as well in earlier 
kernels which didnt have PM runtime support:

https://gitlab.freedesktop.org/drm/msm/-/issues/17

We had fixed the issue reported by the user that time with below patch 
which was confirmed by the user as fixed:

https://lore.kernel.org/all/1664408211-25314-1-git-send-email-quic_khsieh@quicinc.com/

But, it seems like there is another race condition in this code 
resulting in this issue again.

I have posted my analysis with the patch here as a RFC y'day:

https://patchwork.freedesktop.org/patch/581758/

I missed CCing you and Bjorn on the RFC but when I post it as a patch 
either today/tomm, will CC you both.

Sorry, much of the discussion of this issue was happening on #freedreno 
last few days.

> In a VT console, the device is now runtime suspended immediately on
> disconnect, while in X, it currently remains active until X is killed,
> which is consistent with what I reported above.
> 
> We now also have Bjorn's call trace from a different Qualcomm platform
> triggering an unclocked access on disconnect, something which would
> trigger a reset by the hypervisor on sc8280xp platforms like the X13s:
> 
> [ 2030.379417] SError Interrupt on CPU0, code 0x00000000be000000 -- SError
> [ 2030.379425] CPU: 0 PID: 239 Comm: kworker/0:2 Not tainted 6.8.0-rc4-next-20240216-00015-gc937d3c43ffe-dirty #219
> [ 2030.379430] Hardware name: Qualcomm Technologies, Inc. Robotics RB3gen2 (DT)
> [ 2030.379435] Workqueue: events output_poll_execute [drm_kms_helper]
> [ 2030.379495] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [ 2030.379501] pc : el1_interrupt+0x28/0xc0
> [ 2030.379514] lr : el1h_64_irq_handler+0x18/0x24
> [ 2030.379520] sp : ffff80008129b700
> [ 2030.379523] x29: ffff80008129b700 x28: ffff7a0a031aa200 x27: ffff7a0af768c3c0
> [ 2030.379530] x26: 0000000000000000 x25: ffff7a0a024bb568 x24: ffff7a0a031aa200
> [ 2030.379537] x23: 0000000060400005 x22: ffffd2a4a10c871c x21: ffff80008129b8a0
> [ 2030.379544] x20: ffffd2a4a00002f0 x19: ffff80008129b750 x18: 0000000000000000
> [ 2030.379549] x17: 0000000000000000 x16: ffffd2a4a10c21d4 x15: 0000000000000000
> [ 2030.379555] x14: 0000000000000000 x13: 000000000001acf6 x12: 0000000000000000
> [ 2030.379560] x11: 0000000000000001 x10: ffff7a0af623f680 x9 : 0000000100000001
> [ 2030.379565] x8 : 00000000000000c0 x7 : 0000000000000000 x6 : 000000000000003f
> [ 2030.379570] x5 : ffff7a0a003c6a70 x4 : 000000000000001f x3 : ffffd2a48d6722dc
> [ 2030.379576] x2 : 0000000000000002 x1 : ffffd2a4a00002f0 x0 : ffff80008129b750
> [ 2030.379583] Kernel panic - not syncing: Asynchronous SError Interrupt
> [ 2030.379586] CPU: 0 PID: 239 Comm: kworker/0:2 Not tainted 6.8.0-rc4-next-20240216-00015-gc937d3c43ffe-dirty #219
> [ 2030.379590] Hardware name: Qualcomm Technologies, Inc. Robotics RB3gen2 (DT)
> [ 2030.379592] Workqueue: events output_poll_execute [drm_kms_helper]
> [ 2030.379642] Call trace:
> [ 2030.379644]  dump_backtrace+0xec/0x108
> [ 2030.379654]  show_stack+0x18/0x24
> [ 2030.379659]  dump_stack_lvl+0x40/0x84
> [ 2030.379664]  dump_stack+0x18/0x24
> [ 2030.379668]  panic+0x130/0x34c
> [ 2030.379673]  nmi_panic+0x44/0x90
> [ 2030.379679]  arm64_serror_panic+0x68/0x74
> [ 2030.379683]  do_serror+0xc4/0xcc
> [ 2030.379686]  el1h_64_error_handler+0x34/0x4c
> [ 2030.379692]  el1h_64_error+0x64/0x68
> [ 2030.379696]  el1_interrupt+0x28/0xc0
> [ 2030.379700]  el1h_64_irq_handler+0x18/0x24
> [ 2030.379706]  el1h_64_irq+0x64/0x68
> [ 2030.379710]  _raw_spin_unlock_irq+0x20/0x48
> [ 2030.379718]  wait_for_common+0xb4/0x16c
> [ 2030.379722]  wait_for_completion_timeout+0x14/0x20
> [ 2030.379727]  dp_ctrl_push_idle+0x34/0x8c [msm]
> [ 2030.379844]  dp_bridge_atomic_disable+0x18/0x24 [msm]
> [ 2030.379959]  drm_atomic_bridge_chain_disable+0x6c/0xb4 [drm]
> [ 2030.380150]  drm_atomic_helper_commit_modeset_disables+0x174/0x57c [drm_kms_helper]
> [ 2030.380200]  msm_atomic_commit_tail+0x1b4/0x474 [msm]
> [ 2030.380316]  commit_tail+0xa4/0x158 [drm_kms_helper]
> [ 2030.380369]  drm_atomic_helper_commit+0x24c/0x26c [drm_kms_helper]
> [ 2030.380418]  drm_atomic_commit+0xa8/0xd4 [drm]
> [ 2030.380529]  drm_client_modeset_commit_atomic+0x16c/0x244 [drm]
> [ 2030.380641]  drm_client_modeset_commit_locked+0x50/0x168 [drm]
> [ 2030.380753]  drm_client_modeset_commit+0x2c/0x54 [drm]
> [ 2030.380865]  __drm_fb_helper_restore_fbdev_mode_unlocked+0x60/0xa4 [drm_kms_helper]
> [ 2030.380915]  drm_fb_helper_hotplug_event+0xe0/0xf4 [drm_kms_helper]
> [ 2030.380965]  msm_fbdev_client_hotplug+0x28/0xc8 [msm]
> [ 2030.381081]  drm_client_dev_hotplug+0x94/0x118 [drm]
> [ 2030.381192]  output_poll_execute+0x214/0x26c [drm_kms_helper]
> [ 2030.381241]  process_scheduled_works+0x19c/0x2cc
> [ 2030.381249]  worker_thread+0x290/0x3cc
> [ 2030.381255]  kthread+0xfc/0x184
> [ 2030.381260]  ret_from_fork+0x10/0x20
> 
> The above could happen if the convoluted hotplug state machine breaks
> down so that the device is runtime suspended before
> dp_bridge_atomic_disable() is called.
> 

Yes, state machine got broken and I have explained how in the commit 
text of the RFC. But its not necessarily due to PM runtime but a 
sequence of events happening from userspace exposing this breakage.

> For some reason, possibly due to unrelated changes in timing, possibly
> after the hotplug revert, I am no longer able to reproduce the reset
> with 6.8-rc7 on the X13s.
> 

I do not know how the hotplug revert fixed this stack because I think 
this can still happen.

> I am however able to get the hotplug state machine to leak
> runtime PM reference counts which prevents it from ever being suspended
> (e.g. by disconnecting slowly so that we get multiple connect and
> disconnect events). This can manifest itself as a hotplug event which is
> processed after disconnecting the display:
> 
> 	[drm:dp_panel_read_sink_caps [msm]] *ERROR* read dpcd failed -110
> 

hmm ... this is another new report. I was not aware of this till this 
instance. We would like to debug this issue too as we have also not seen 
this one before.

But, I am suspicious about how or why a refcount leak leads to a DPCD 
read failure.

> I would not be surprised at all if there's a sequence of events that
> leads to an unbalanced put instead (and the stack trace and observations
> above make this appear likely).
> 

Stacktrace has a different analysis.

> Were you able to determine what events lead to the premature disabling
> of the bus clocks on the RB3?
> 

Yes, please check my RFC . I am waiting for Kuogee to review it too and 
I shall post it formally as a patch.

> Have you got any reason to believe that the revert of the hotplug
> notification patch may in anyway prevent that? Or is it just papering
> over the issue?
> 

No, I do not think reverting the hotplug notification patch can fix that 
reset.

>> Hotplug in Xorg seems to work worse than it did with 6.7, which also had
>> some issues. Connecting a display once seems to work fine, but trying to
>> re-enable a reconnected display using xrandr sometimes does not work at
>> all, while with 6.7 it usually worked on the second xrandr execution.
>>
>> xrandr reports the reconnected display as disconnected:
> 
>> Running 'xrandr --output DP-2 --auto' 2-3 times makes xrandr report the
>> display as connected, but the display is still blank (unlike with 6.7).
> 
> As I mentioned elsewhere, the revert of e467e0bde881 ("drm/msm/dp: use
> drm_bridge_hpd_notify() to report HPD status changes") in rc7 does seem
> to help with the hotplug detect issues that I could reproduce (in VT
> console, X and wayland).
> 

Yes revert of e467e0bde881 ("drm/msm/dp: use
 > drm_bridge_hpd_notify() to report HPD status changes") affecting 
hotplug status and associated connection issues makes sense. But I think 
the reset with the above mentioned stacktrace can still happen.

> The question is whether we should revert the whole runtime PM series so
> that the bus clock is left on, which should prevent any resets on
> disconnect.
> 

At this point, I would say if the RFC resolves the reset for you and 
Bjorn with the above stack, that should be the way to go and not full 
revert.

Unless you are facing other issues other than this last reset crash.

> Without any analysis from you or reason to be believe the issue to have
> been resolved, I'm inclined to just go ahead and revert it. It clearly
> had not been tested enough before being merged and I'm quite frustrated
> with how this has been handled.
> 

I must admit that the number of issues reported on sc8280xp was 
surprising for us as well because the series was tested on both 
sc7180/sc7280 by us and other users but not on sc8280xp as we did not 
have access to this device that time.

sc7280 is the only other device we supported upstream which supported 
eDP natively before Qualcomm X1E80100 landed this cycle. Surprisingly 
enough, perhaps because it uses a chrome defconfig or chrome userspace, 
no issues were seen that time or even now for that matter.

To avoid the breakages on sc8280xp moving forward as it has more 
visibility, our team here has decided to setup sc8280xp devices to test 
out all msm display related changes especially eDP/DP as it shares the 
eDP/DP driver. We can also CC you on these, in case you want to test it 
out as well and give your Tested-by.

> Johan

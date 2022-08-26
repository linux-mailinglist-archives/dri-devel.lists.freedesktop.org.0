Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5D45A22D0
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 10:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD1C10E20E;
	Fri, 26 Aug 2022 08:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A32710E20E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 08:19:52 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id s8so884535ljj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 01:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=NwyaCFfEMgdgvoY41Arzh1xx+CoAI+pbpsz9rR9RZv0=;
 b=TmzUhFNgBDMPKhvHU8R2w4J91J4zP7ynPvouc6XI4eH8gywVjkg51E4cEFM1TgDXgK
 6++5o9rDdD0ZM0GANQ/GhvYbqFMXElfJOLoRsFvyGVnZgquXBcjeOmM5CtUxMyspUYqY
 G+2VViBc3Q67+lHYT//yYuZL7y1cDDngIJS/NitYCEDribRHwd8fUgS/xOoKnDifFwdn
 Vno6osTu85V7/JAFofswxhCMEL3EnebKtkvfWFBjyuS4ET2TkuNL09BhyuIdpaNfyT5o
 9q5/LW2P270XGTVrzhEP87NVMhaT7FSbkc7QIyCi8N854B1Uqcft5Ssd36tAhNoHBH1q
 qBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=NwyaCFfEMgdgvoY41Arzh1xx+CoAI+pbpsz9rR9RZv0=;
 b=zrGlegbXHPqr/iriAQqN1JJua0xLFOAaRx++Auiwa3/th1vYBtMVAKXjgSIiSYqVaY
 n7l24h9EgSf0QCEpESrC9bP2D4X2Ex3UjndECrw3UmVy+f62iZ8f0MTGEJvF6hQ+8q4s
 r1CISHWbk+UIuFBcXfCzrSgTz7VYxL0D3Z8b3ULOfQmmNJOGibWJ7vSOBiE+oc1+bCzC
 1hUtx1Ohmmim/VmvnU9T4ReuohBA0Rs3IoMUUDvhXKK2FsjM9XXfqZ14n4zIUWkMnBui
 ti4No9rrZBmcqKgoRu7lNnJeS89Wlyk+WEwTsd3R5XUz3gSEjcnn7XYME3kRNv8mVclB
 IuvQ==
X-Gm-Message-State: ACgBeo35kkQiAsaZj8yirMYyJG5cEeDFgjF7/frN9bDkSNI+CYLbSrkr
 +YFIdHBA4Kjafvj8eHeG0W1z0Q==
X-Google-Smtp-Source: AA6agR4hxgUo/5FnuISCYiG3akvQOsssa+7V2fP6LZNhWM4AK8KM+CWOwUszj+WPIItIQNk/XwqSdg==
X-Received: by 2002:a05:651c:238b:b0:261:ca71:5945 with SMTP id
 bk11-20020a05651c238b00b00261ca715945mr2017204ljb.253.1661501990732; 
 Fri, 26 Aug 2022 01:19:50 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a19ca0d000000b0048b045a5c3asm293092lfg.201.2022.08.26.01.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 01:19:50 -0700 (PDT)
Message-ID: <1f31afce-6807-5d33-15e2-78bc42894764@linaro.org>
Date: Fri, 26 Aug 2022 11:19:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/msm/dp: add atomic_check to bridge ops
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <1660759314-28088-1-git-send-email-quic_khsieh@quicinc.com>
 <f211520a-cb9c-1202-0752-7bb200726ae8@linaro.org>
 <d4b3c303-fc20-537d-0e69-6e19826b6e59@quicinc.com>
 <266c0531-344e-5589-2143-02ab1fe9b276@linaro.org>
 <724d695d-0293-db81-7014-57cb96bd6d4b@quicinc.com>
 <bb153360-6567-c4d5-dc23-8586549df8c8@linaro.org>
 <13509c06-cf2b-e37b-d8ec-b5cc5370f566@quicinc.com>
 <CAA8EJprzE_U0crAQxu5xvQxadu8jUovEXOWzV2cTc_BQeHjyow@mail.gmail.com>
 <16f2c33f-c91e-8b4a-f67a-81f13adb2eac@quicinc.com>
 <CAA8EJprhwnMDLnWyfy3+TXG4cfeCCGGaaLqBTPn+UFgm7en8Fg@mail.gmail.com>
 <35384419-0801-dabf-3481-1b5717bc11e9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <35384419-0801-dabf-3481-1b5717bc11e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 dianders@chromium.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, vkoul@kernel.org,
 agross@kernel.org, bjorn.andersson@linaro.org, quic_aravindh@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/08/2022 22:16, Abhinav Kumar wrote:
> 
> 
> On 8/24/2022 1:25 AM, Dmitry Baryshkov wrote:
>> On Wed, 24 Aug 2022 at 01:59, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 8/23/2022 3:41 PM, Dmitry Baryshkov wrote:
>>>> On Wed, 24 Aug 2022 at 01:07, Abhinav Kumar 
>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>> On 8/22/2022 11:33 AM, Dmitry Baryshkov wrote:
>>>>>> On 22/08/2022 20:32, Abhinav Kumar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 8/22/2022 9:49 AM, Dmitry Baryshkov wrote:
>>>>>>>> On 22/08/2022 19:38, Abhinav Kumar wrote:
>>>>>>>>> Hi Dmitry
>>>>>>>>>
>>>>>>>>> On 8/22/2022 9:18 AM, Dmitry Baryshkov wrote:
>>>>>>>>>> On 17/08/2022 21:01, Kuogee Hsieh wrote:
>>>>>>>>>>> DRM commit_tails() will disable downstream 
>>>>>>>>>>> crtc/encoder/bridge if
>>>>>>>>>>> both disable crtc is required and crtc->active is set before 
>>>>>>>>>>> pushing
>>>>>>>>>>> a new frame downstream.
>>>>>>>>>>>
>>>>>>>>>>> There is a rare case that user space display manager issue an 
>>>>>>>>>>> extra
>>>>>>>>>>> screen update immediately followed by close DRM device while 
>>>>>>>>>>> down
>>>>>>>>>>> stream display interface is disabled. This extra screen 
>>>>>>>>>>> update will
>>>>>>>>>>> timeout due to the downstream interface is disabled but will 
>>>>>>>>>>> cause
>>>>>>>>>>> crtc->active be set. Hence the followed commit_tails() called by
>>>>>>>>>>> drm_release() will pass the disable downstream 
>>>>>>>>>>> crtc/encoder/bridge
>>>>>>>>>>> conditions checking even downstream interface is disabled.
>>>>>>>>>>> This cause the crash to happen at dp_bridge_disable() due to it
>>>>>>>>>>> trying
>>>>>>>>>>> to access the main link register to push the idle pattern out
>>>>>>>>>>> while main
>>>>>>>>>>> link clocks is disabled.
>>>>>>>>>>>
>>>>>>>>>>> This patch adds atomic_check to prevent the extra frame will not
>>>>>>>>>>> be pushed down if display interface is down so that crtc->active
>>>>>>>>>>> will not be set neither. This will fail the conditions checking
>>>>>>>>>>> of disabling down stream crtc/encoder/bridge which prevent
>>>>>>>>>>> drm_release() from calling dp_bridge_disable() so that crash
>>>>>>>>>>> at dp_bridge_disable() prevented.
>>>>>>>>>>
>>>>>>>>>> I must admit I had troubles parsing this description. However 
>>>>>>>>>> if I
>>>>>>>>>> got you right, I think the check that the main link clock is
>>>>>>>>>> running in the dp_bridge_disable() or dp_ctrl_push_idle() 
>>>>>>>>>> would be
>>>>>>>>>> a better fix.
>>>>>>>>>
>>>>>>>>> Originally, thats what was posted
>>>>>>>>> https://patchwork.freedesktop.org/patch/496984/.
>>>>>>>>
>>>>>>>> This patch is also not so correct from my POV. It checks for the 
>>>>>>>> hpd
>>>>>>>> status, while in reality it should check for main link clocks being
>>>>>>>> enabled.
>>>>>>>>
>>>>>>>
>>>>>>> We can push another fix to check for the clk state instead of the 
>>>>>>> hpd
>>>>>>> status. But I must say we are again just masking something which the
>>>>>>> fwk should have avoided isnt it?
>>>>>>>
>>>>>>> As per the doc in the include/drm/drm_bridge.h it says,
>>>>>>>
>>>>>>> "*
>>>>>>>     * The bridge can assume that the display pipe (i.e. clocks 
>>>>>>> and timing
>>>>>>>     * signals) feeding it is still running when this callback is 
>>>>>>> called.
>>>>>>>     *"
>>>>>>
>>>>>> Yes, that's what I meant about this chunk begging to go to the 
>>>>>> core. In
>>>>>> my opinion, if we are talking about the disconnected sinks, it is the
>>>>>> framework who should disallow submitting the frames to the 
>>>>>> disconnected
>>>>>> sinks.
>>>>>>
>>>>>>>
>>>>>>> By adding an extra layers of protection in the driver, we are just
>>>>>>> avoiding another issue but the commit should not have been issued in
>>>>>>> the first place.
>>>>>>>
>>>>>>> So shouldnt we do both then? That is add protection to check if 
>>>>>>> clock
>>>>>>> is ON and also, reject commits when display is disconnected.
>>>>>>>
>>>>>>>>>
>>>>>>>>> Then it seemed like we were just protecting against an issue in 
>>>>>>>>> the
>>>>>>>>> framework which was allowing the frames to be pushed even after 
>>>>>>>>> the
>>>>>>>>> display was disconnected. The DP driver did send out the 
>>>>>>>>> disconnect
>>>>>>>>> event correctly and as per the logs, this frame came down after 
>>>>>>>>> that
>>>>>>>>> and the DRM fwk did allow it.
>>>>>>>>>
>>>>>>>>> So after discussing on IRC with Rob, we came up with this 
>>>>>>>>> approach that
>>>>>>>>> if the display is not connected, then atomic_check should fail. 
>>>>>>>>> That
>>>>>>>>> way the commit will not happen.
>>>>>>>>>
>>>>>>>>> Just seemed a bit cleaner instead of adding all our protections.
>>>>>>>>
>>>>>>>> The check to fail atomic_check if display is not connected seems 
>>>>>>>> out
>>>>>>>> of place. In its current way it begs go to the upper layer,
>>>>>>>> forbidding using disconnected sinks for all the drivers. There is
>>>>>>>> nothing special in the MSM DP driver with respect to the HPD events
>>>>>>>> processing and failing atomic_check() based on that.
>>>>>>>>
>>>>>>>
>>>>>>> Why all the drivers? This is only for MSM DP bridge.
>>>>>>
>>>>>> Yes, we change the MSM DRM driver. But the check is generic 
>>>>>> enough. I'm
>>>>>> not actually insisting on pushing the check to the core, just 
>>>>>> trying to
>>>>>> understand the real cause here.
>>>>>>
>>>>>>>
>>>>>
>>>>> I actually wanted to push this to the core and thats what I had
>>>>> originally asked on IRC because it does seem to be generic enough that
>>>>> it should belong to the core but after discussion with Rob on 
>>>>> freedreno,
>>>>> he felt this was a better approach because for some of the legacy
>>>>> connectors like VGA, this need not belong to the DRM core, hence we 
>>>>> went
>>>>> with this approach.
>>>>
>>>> It might be better to whitelist such connectors (S-VIDEO/composite
>>>> comes to my mind rather than VGA).
>>>
>>> I am fine with that approach, if Rob is onboard with that.
>>>
>>>>
>>>>>>>>>>> SError Interrupt on CPU7, code 0x00000000be000411 -- SError
>>>>>>>>>>> CPU: 7 PID: 3878 Comm: Xorg Not tainted 5.19.0-stb-cbq #19
>>>>>>>>>>> Hardware name: Google Lazor (rev3 - 8) (DT)
>>>>>>>>>>> pstate: a04000c9 (NzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>>>>>>>> pc : __cmpxchg_case_acq_32+0x14/0x2c
>>>>>>>>>>> lr : do_raw_spin_lock+0xa4/0xdc
>>>>>>>>>>> sp : ffffffc01092b6a0
>>>>>>>>>>> x29: ffffffc01092b6a0 x28: 0000000000000028 x27: 
>>>>>>>>>>> 0000000000000038
>>>>>>>>>>> x26: 0000000000000004 x25: ffffffd2973dce48 x24: 
>>>>>>>>>>> 0000000000000000
>>>>>>>>>>> x23: 00000000ffffffff x22: 00000000ffffffff x21: 
>>>>>>>>>>> ffffffd2978d0008
>>>>>>>>>>> x20: ffffffd2978d0008 x19: ffffff80ff759fc0 x18: 
>>>>>>>>>>> 0000000000000000
>>>>>>>>>>> x17: 004800a501260460 x16: 0441043b04600438 x15: 
>>>>>>>>>>> 04380000089807d0
>>>>>>>>>>> x14: 07b0089807800780 x13: 0000000000000000 x12: 
>>>>>>>>>>> 0000000000000000
>>>>>>>>>>> x11: 0000000000000438 x10: 00000000000007d0 x9 : 
>>>>>>>>>>> ffffffd2973e09e4
>>>>>>>>>>> x8 : ffffff8092d53300 x7 : ffffff808902e8b8 x6 : 
>>>>>>>>>>> 0000000000000001
>>>>>>>>>>> x5 : ffffff808902e880 x4 : 0000000000000000 x3 : 
>>>>>>>>>>> ffffff80ff759fc0
>>>>>>>>>>> x2 : 0000000000000001 x1 : 0000000000000000 x0 : 
>>>>>>>>>>> ffffff80ff759fc0
>>>>>>>>>>> Kernel panic - not syncing: Asynchronous SError Interrupt
>>>>>>>>>>> CPU: 7 PID: 3878 Comm: Xorg Not tainted 5.19.0-stb-cbq #19
>>>>>>>>>>> Hardware name: Google Lazor (rev3 - 8) (DT)
>>>>>>>>>>> Call trace:
>>>>>>>>>>>     dump_backtrace.part.0+0xbc/0xe4
>>>>>>>>>>>     show_stack+0x24/0x70
>>>>>>>>>>>     dump_stack_lvl+0x68/0x84
>>>>>>>>>>>     dump_stack+0x18/0x34
>>>>>>>>>>>     panic+0x14c/0x32c
>>>>>>>>>>>     nmi_panic+0x58/0x7c
>>>>>>>>>>>     arm64_serror_panic+0x78/0x84
>>>>>>>>>>>     do_serror+0x40/0x64
>>>>>>>>>>>     el1h_64_error_handler+0x30/0x48
>>>>>>>>>>>     el1h_64_error+0x68/0x6c
>>>>>>>>>>>     __cmpxchg_case_acq_32+0x14/0x2c
>>>>>>>>>>>     _raw_spin_lock_irqsave+0x38/0x4c
>>>>>>
>>>>>> You know, after re-reading the trace, I could not help but notice 
>>>>>> that
>>>>>> the issue seems to be related to completion/timer/spinlock memory
>>>>>> becoming unavailable rather than disabling the main link clock.
>>>>>> See, the SError comes in the spin_lock path, not during register 
>>>>>> read.
>>>>>>
>>>>>> Thus I think the commit message is a bit misleading.
>>>>>>
>>>>>
>>>>> No, this issue is due to unclocked access. Please check this part 
>>>>> of the
>>>>> stack:
>>>>
>>>> Well, if it were for the unlocked access, we would see SError on the
>>>> register access, wouldn't we? However in this case the SError comes
>>>> from the raw spinlock code.
>>>
>>> This is not uncommon. With unclocked access, we have seen in the past
>>> that sometimes the stack is off by one line. The fact that this issue
>>> got resolved even with the older version of the patch
>>> https://patchwork.freedesktop.org/patch/496984/ is pointing towards an
>>> unclocked access and not the dp/dp->ctrl memory pointers.
>>
>> As far as I understood, the bug is reproducible. Just to make me feel
>> safe, can we please:
>> -  either have a trace which shows when the clocks are disabled (or 
>> not enabled)
>> - or make sure that keeping the mainlink clock on would also mitigate 
>> the issue?
> 
> Yes, this trace is already available with all the drm_dbg_dp messages 
> enabled. Please refer to the attachment named 
> 2022-08-15-dmesg-drm-4K-crash.txt in the bug 
> https://gitlab.freedesktop.org/drm/msm/-/issues/17.
> 
> You can jump to this section of the log.
> 
> [   99.191216] msm_dpu ae01000.mdp: [drm:dp_display_host_phy_exit] 
> type=10 core_init=1 phy_init=1
> [   99.192354] [drm:dp_ctrl_phy_exit] phy=00000000b9b91350 init=0 
> power_on=0
> [   99.192369] msm_dpu ae01000.mdp: 
> [drm:dp_display_disable.constprop.0.isra.0] sink count: 1
> 
> Here is the dp_display_disable() you were looking for.
> 
> [   99.192378] msm_dpu ae01000.mdp: [drm:dp_bridge_post_disable] type=10 
> Done
> [   99.192389] msm_dpu ae01000.mdp: 
> [drm:drm_atomic_helper_commit_modeset_disables] disabling [CRTC:60:crtc-1]
> [   99.192561] [drm:dpu_crtc_disable] no frames pending
> [   99.192571] [drm:dpu_core_perf_crtc_update] crtc:60 stop_req:1 
> core_clk:200000000
> [   99.192581] [drm:dpu_core_perf_crtc_update] crtc=60 disable
> [   99.192588] [drm:_dpu_core_perf_crtc_update_bus] crtc=59 bw=0 paths:1
> [   99.192595] [drm:_dpu_core_perf_crtc_update_bus] crtc=60 bw=0 paths:1
> [   99.192700] [drm:dpu_core_perf_crtc_update] clk:200000000
> [   99.192714] [drm:dpu_core_perf_crtc_update] update clk rate = 
> 200000000 HZ
> [   99.192729] msm_dpu ae01000.mdp: 
> [drm:drm_atomic_helper_commit_modeset_disables] modeset on 
> [ENCODER:33:TMDS-33]
> [   99.192738] [drm:dpu_encoder_virt_atomic_mode_set] enc33
> [   99.192749] [drm:dpu_crtc_atomic_begin] crtc59
>>
>>>
>>>>
>>>>>    >>>>>>   wait_for_completion_timeout+0x2c/0x54
>>>>>    >>>>>>   dp_ctrl_push_idle+0x40/0x88
>>>>>    >>>>>>   dp_bridge_disable+0x24/0x30
>>>>>    >>>>>>   drm_atomic_bridge_chain_disable+0x90/0xbc
>>>>>    >>>>>>   drm_atomic_helper_commit_modeset_disables+0x198/0x444
>>>>>    >>>>>>   msm_atomic_commit_tail+0x1d0/0x374
>>>>>    >>>>>>   commit_tail+0x80/0x108
>>>>>    >>>>>>   drm_atomic_helper_commit+0x118/0x11c
>>>>>    >>>>>>   drm_atomic_commit+0xb4/0xe0
>>>>>    >>>>>>   drm_client_modeset_commit_atomic+0x184/0x224
>>>>>    >>>>>>   drm_client_modeset_commit_locked+0x58/0x160
>>>>>    >>>>>>   drm_client_modeset_commit+0x3c/0x64
>>>>>
>>>>>> Can we please get a trace checking which calls were actually made for
>>>>>> the dp bridge and if the dp/dp->ctrl memory pointers are correct?
>>>>>>
>>>>>> I do not see the dp_display_disable() being called. Maybe I just 
>>>>>> missed
>>>>>> the call.
>>>>>>
>>>>>
>>>>> Yes it is called, please refer to the above part of the stack that I
>>>>> have pasted.
>>>>
>>>> The stacktrace mentions dp_bridge_disable(), not dp_display_disable()
>>>> (which I asked for).
>>>>
>>>
>>> So whats happening here is the crash is happening in 
>>> dp_bridge_disable().
>>>
>>> dp_display_disable() is called from post_disable() thats why it doesnt
>>> show up in the stack.
>>>
>>
>> Yes. But the mainlink clocks are disabled in dp_display_disable()
>> that's why I'm asking if the function was called at all.
> 
> Now, I see why you were asking about dp_display_disable(). So basically 
> your question is that when did dp_display_disable() happen that disabled 
> the clocks causing this issue.
> 
> dp_display_disable() happened when the cable was disconnected as shown 
> in the above section of the logs.
> 
> We also sent the disconnected uevent to the usermode. But this commit is 
> happening from the drm_lastclose() context which doesnt check the 
> connection status.
> 
> This leads to a commit after the cable has been disconnected causing the 
> unclocked access.
> 
> You can refer this log and comment if something is still not clear to you.

I have spent some time comparing the log and the programming logic.

I found what I was looking for: a safeguard for not doing the disable 
twice. The disable_outputs() function, the one which calls 
drm_atomic_bridge_chain_disable() has a logical check which should have 
acted as a safety net here: it checks whether crtc_needs_disable().

Can you please doublecheck why doesn't it reflect the fact that CRTC 
doesn't need disabling as it has been already disabled. If I understand 
correctly this boils down to CRTC's old_state->active being set, while 
the CRTC has been effectively disabled.

-- 
With best wishes
Dmitry


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18F6886634
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 06:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC0F112455;
	Fri, 22 Mar 2024 05:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G7sYN2mG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8A8112455
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 05:32:13 +0000 (UTC)
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi
 [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7111E82A;
 Fri, 22 Mar 2024 06:31:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1711085503;
 bh=DW5KmQDBGnBwJIXf23BFxq2uHZInXX/7Bhjf2aKieMw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=G7sYN2mG/IEs+DBv/pwa+2WVgG8IME4PWKHnPp7q5tdafbGF8wUH2Ih9j9kfsNhSB
 zSA7F1VhPIqtmciZOvDspVnKc4R5Iv9oB0AaXJCVVcV2N3TGqDqslbKrYR1bIF7X8Z
 WWBlCzoIHtcgktCOqzc2kNvT7xiHKFSJKCo1u0XQ=
Message-ID: <d6a8bc5c-aed9-4ef4-adb2-dc171106b44b@ideasonboard.com>
Date: Fri, 22 Mar 2024 07:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] drm: zynqmp_dp: Don't retrain the link in our IRQ
Content-Language: en-US
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Michal Simek <michal.simek@amd.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20240319225122.3048400-1-sean.anderson@linux.dev>
 <20240319225122.3048400-6-sean.anderson@linux.dev>
 <ca4de45b-302c-4eea-bd6b-8c04e2ed89cb@ideasonboard.com>
 <53b2df23-d5ea-498b-a501-b64f753c0074@linux.dev>
 <0514ef71-5baa-4989-9b7d-8bd9526c4d8d@ideasonboard.com>
 <16ccf678-270c-4770-8cc9-f676b4fabf09@linux.dev>
 <1f27ce69-9ea6-4df4-9147-332d74febdf0@ideasonboard.com>
 <b2bef7f9-fe46-45d0-a09b-50777f71f43c@linux.dev>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <b2bef7f9-fe46-45d0-a09b-50777f71f43c@linux.dev>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/03/2024 21:17, Sean Anderson wrote:
> On 3/21/24 15:08, Tomi Valkeinen wrote:
>> On 21/03/2024 20:01, Sean Anderson wrote:
>>> On 3/21/24 13:25, Tomi Valkeinen wrote:
>>>> On 21/03/2024 17:52, Sean Anderson wrote:
>>>>> On 3/20/24 02:53, Tomi Valkeinen wrote:
>>>>>> On 20/03/2024 00:51, Sean Anderson wrote:
>>>>>>> Retraining the link can take a while, and might involve waiting for
>>>>>>> DPCD reads/writes to complete. This is inappropriate for an IRQ handler.
>>>>>>> Just schedule this work for later completion. This is racy, but will be
>>>>>>> fixed in the next commit.
>>>>>>
>>>>>> You should add the locks first, and use them here, rather than first
>>>>>> adding a buggy commit and fixing it in the next one.
>>>>>
>>>>> I didn't think I could add the locks first since I only noticed the IRQ
>>>>> was threaded right before sending out this series. So yeah, we could add
>>>>> locking, add the workqueue, and then unthread the IRQ.
>>>>>
>>>>>>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>>>>>>> ---
>>>>>>> Actually, on second look this IRQ is threaded. So why do we have a
>>>>>>> workqueue for HPD events? Maybe we should make it unthreaded?
>>>>>>
>>>>>> Indeed, there's not much work being done in the IRQ handler. I don't know why it's threaded.
>>>>>>
>>>>>> We could move the queued work to be inside the threaded irq handler,
>>>>>> but with a quick look, the HPD work has lines like "msleep(100)" (and
>>>>>> that's inside a for loop...), which is probably not a good thing to do
>>>>>> even in threaded irq handler.
>>>>>>
>>>>>> Although I'm not sure if that code is good to have anywhere. Why do we
>>>>>> even have such code in the HPD work path... We already got the HPD
>>>>>> interrupt. What does "It takes some delay (ex, 100 ~ 500 msec) to get
>>>>>> the HPD signal with some monitors" even mean...
>>>>>
>>>>> The documentation for this bit is
>>>>>
>>>>> | HPD_STATE    0    ro    0x0    Contains the raw state of the HPD pin on the DisplayPort connector.
>>>>>
>>>>> So I think the idea is to perform some debouncing.
>>>>
>>>> Hmm, it just looks a bit odd to me. It can sleep for a second. And the wording "It takes some delay (ex, 100 ~ 500 msec) to get the HPD signal with some monitors" makes it sound like some kind of a hack...
>>>>
>>>> The docs mention debounce once:
>>>>
>>>> https://docs.amd.com/r/en-US/pg299-v-dp-txss1/Hot-Plug-Detection
>>>
>>> Are you sure this is the right document? This seems to be documentation for [1]. Is that instantiated as a hard block on the ZynqMP?
>>>
>>> [1] https://www.xilinx.com/products/intellectual-property/ef-di-displayport.html
>>
>> You're right, wrong document. The registers and bitfield names I looked at just matched, so I didn't think it through...
>>
>> The right doc says even less:
>>
>> https://docs.amd.com/r/en-US/ug1085-zynq-ultrascale-trm/Upon-HPD-Assertion
>>
>>>> But it's not immediately obvious what the SW must do and what's done by the HW. Debounce is not mentioned later, e.g. in the HPD Event Handling. But if debounce is needed, wouldn't it be perhaps in a few milliseconds, instead of hundreds of milliseconds...
>>>
>>> Well, the DP spec says
>>>
>>> | If the HPD is the result of a new device being connected, either
>>> | directly to the Source device (signaled by a long HPD), –or– downstream
>>> | of a Branch device (indicated by incrementing the DFP_COUNT field value
>>> | in the DOWN_STREAM_PORT_COUNT register (DPCD 00007h[3:0]) and signaled
>>> | by an IRQ_HPD pulse), the Source device shall read the new DisplayID or
>>> | legacy EDID that has been made available to it to ensure that content
>>> | being transmitted over the link is able to be properly received and
>>> | rendered.
>>> |
>>> | Informative Note: If the HPD signal toggling (or bouncing) is the
>>> |                   result of the Hot Unplug followed by Hot Plug of a
>>> |                   cable-connector assembly, the HPD signal is likely
>>> |                   to remain unstable during the de-bouncing period,
>>> |                   which is in the order of tens of milliseconds. The
>>> |                   Source device may either check the HPD signal’s
>>> |                   stability before initiating an AUX read transaction,
>>> |                   –or– immediately initiate the AUX read transaction
>>> |                   after each HPD rising edge.
>>>
>>> So a 100 ms delay seems plausible for some monitors.
>>
>> I read the text above as "it may take tens of milliseconds for HPD to stabilize". So polling it for total of 100ms sounds fine, but we're polling it for 1000ms.
>>
>> And I think checking for stability is fine, but for detect() I think it goes overboard: if the cable is disconnected, every detect call spends a second checking for HPD, even if we haven't seen any sign of an HPD =).
>>
>> And if we're checking the HPD stability, wouldn't we, say, poll the HPD for some time, and see if it stays the same? At the moment the code proceeds right away if HPD is high, but keeps polling if HPD is low.
>>
>>> That said, maybe we can just skip this and always read the DPCD.
>>
>> If the HPD is bouncing, is the AUX line also unstable?
>>
>> I don't mind a HPD stability check, I think it makes sense as (I think) the HW doesn't handle de-bouncing here. I think think it could be much much shorter than what it is now, and that it would make sense to observe the HPD for a period, instead of just waiting for the HPD to go high.
>>
>> But this could also be left for later, I don't think it matters in the context of this series.
>>
>>>> zynqmp_dp_bridge_detect() is used for drm_bridge_funcs.detect(), and if the cable is not connected, it'll sleep for 1 second (probably more) until returning not connected. It just doesn't sound correct to me.
>>>>
>>>> Well, it's not part of this patch as such, but related to the amount of time we spend in the interrupt handler (and also the detect()).
>>>>
>>>>>> Would it be possible to clean up the work funcs a bit (I haven't
>>>>>> looked a the new work func yet), to remove the worst extra sleeps, and
>>>>>> just do all that inside the threaded irq handler?
>>>>>
>>>>> Probably not, since a HPD IRQ results in link retraining, which can take a while.
>>>>
>>>> But is it any different if you have a workqueue? Isn't a threaded interrupt handler basically the same thing?
>>>>
>>>> Probably at least the zynqmp_dp_hpd_work_func() could be done in the threaded irq just fine, if the insane 1s sleep can be dropped.
>>>
>>> Anything involving AUX shouldn't been in an IRQ, since
>>> zynqmp_dp_aux_transfer will retry for up to 50ms by default.
>>
>> Perhaps. I'm still not sure if that's a problem. If a threaded irq is essentially a workqueue dedicated for this device, and we don't need to handle other irqs while the work is being done, then... What's the difference with a threaded irq and a workqueue?
>>
>> Oh, but we do need to handle irqs, we have the vblank irq in there. We don't want the vblanks to stop if there's a HPD IRQ.
>>
>> Btw, looks like zynqmp_dpsub_drm_handle_vblank() can sleep, so we can't move to non-threaded irq.
> 
> I don't see that. We have
> 
> zynqmp_dpsub_drm_handle_vblank
>    drm_crtc_handle_vblank
>      drm_handle_vblank
>        spin_lock_irqsave(...)
>        ...
>        spin_lock_irqsave(...)
>        vblank_disable_fn(...)
>          spin_lock_irqsave(...)
>          ...
>          spin_lock_irqrestore(...)
> 
> so no sleeping AFAICT.

Sorry, I don't know what code-path I was following where I saw mutexes. 
I shouldn't look at code so late at night...

>>>>>> Do we need to handle interrupts while either delayed work is being done?
>>>>>
>>>>> Probably not.
>>>>>
>>>>>> If we do need a delayed work, would just one work be enough which
>>>>>> handles both HPD_EVENT and HPD_IRQ, instead of two?
>>>>>
>>>>> Maybe, but then we need to determine which pending events we need to
>>>>> handle. I think since we have only two events it will be easier to just
>>>>> have separate workqueues.
>>>>
>>>> The less concurrency, the better...Which is why it would be nice to do it all in the threaded irq.
>>>
>>> Yeah, but we can use a mutex for this which means there is not too much
>>> interesting going on.
>>
>> Ok. Yep, if we get (hopefully) a single mutex with clearly defined fields that it protects, I'm ok with workqueues.
>>
>> I'd still prefer just one workqueue, though...
> 
> Yeah, but then we need a spinlock or something to tell the workqueue what it should do.

Yep. We could also always look at the HPD (if we drop the big sleeps) in 
the wq, and have a flag for the HPD IRQ, which would reduce the state to 
a single bit.

  Tomi


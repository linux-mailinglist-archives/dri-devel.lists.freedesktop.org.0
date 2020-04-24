Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC31B6FB2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 10:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFA86EA8D;
	Fri, 24 Apr 2020 08:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B276EA8D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 08:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587716678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6i9rBPD0BiOTNPJWFr9rt+Eih/dVyMQhyMUgIAY/N54=;
 b=KpvnmfdvRau0j327uQ/GJaxDJSRxuKQh4izQF4GU7GjNQti9+OrMpmmmFwDyjzECfvsrwA
 CB0zO/oUwd/lRf0tZJGUXMdTG/DoUHR5fcF63SHMDOdi4/gLTOCuP7RugfdWvAGlNpGW77
 LIJqON8M0ravpM9u6aVs9vqYL1mOgHI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-sSpR1GGWPUKpLhzyniN52Q-1; Fri, 24 Apr 2020 04:24:35 -0400
X-MC-Unique: sSpR1GGWPUKpLhzyniN52Q-1
Received: by mail-wr1-f72.google.com with SMTP id r11so4397240wrx.21
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 01:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6i9rBPD0BiOTNPJWFr9rt+Eih/dVyMQhyMUgIAY/N54=;
 b=tUSXMDQReITkwZVtT00c9RnubiondO/gsO4hzmZwmRYxY2W5+XBDVhTDp39sc5LtYw
 4Oxcx+YN8xjh0CPRg0t+dRKVZZ4B0Hs3Bn/oltZ3C6N9NCEbm9p49rNMQRXgTlZXQyCp
 1VABxhHcHPDdRVD5GvBs6kQR2yEBivX2tiV8ZyyQdTHZqpVLlN10uRyr1Ti/dbV+GJUk
 E12VhU0Hgia0goQkBKkoAKyegvpKSI4t/zVXM2TgXltCUgeIHISN3cMZ74XsazoKvjIw
 GopVmH3xw2xk3CZXQa1msONSMFsmdkxsAELM3EYJ3mWp9Ck5naZenxvPbGOpZF191cWE
 SeDQ==
X-Gm-Message-State: AGi0PuY4+xa7QAmz58CT5fChnJM9us0aAxt7DiHolUmub9w4cjH1+8Yj
 1MAZxgnp3cFKSwSUOO9NNXlqjrVk3PXWRHAPE9ltaivoLlkbDwru9T9FpQpRQbQJK7VYAB7Yvxy
 SyhiMSjoDBs5X2d1oETOiDEgMn779
X-Received: by 2002:a05:6000:12c5:: with SMTP id
 l5mr9948884wrx.185.1587716673880; 
 Fri, 24 Apr 2020 01:24:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypIyIqivbWgamPFre+uJ6/bQbu2XPb201m0UImdS8x58S+WKeGhVkwDd77gj/J25CSchOljUrg==
X-Received: by 2002:a05:6000:12c5:: with SMTP id
 l5mr9948857wrx.185.1587716673526; 
 Fri, 24 Apr 2020 01:24:33 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id s14sm1910568wme.33.2020.04.24.01.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 01:24:32 -0700 (PDT)
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
To: Pekka Paalanen <ppaalanen@gmail.com>, Rajat Jain <rajatja@google.com>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com> <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain> <87k12e2uoa.fsf@intel.com>
 <e8da46f8-ebe4-aee4-31c8-229d06fa7430@redhat.com>
 <20200421174613.139991ed@eldfell.localdomain>
 <CACK8Z6Hwg132K3TwsX6Bjx-2KG0HywrP=PnMMegdp7jqeU__1A@mail.gmail.com>
 <20200424104024.4cdb0d40@eldfell.localdomain>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <caa677d0-bc43-5045-f4bb-1b762fafc870@redhat.com>
Date: Fri, 24 Apr 2020 10:24:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200424104024.4cdb0d40@eldfell.localdomain>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, Christian Kellner <ckellner@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Mark Pearson <mpearson@lenovo.com>, Benjamin Berg <bberg@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Pekka, Rajat,

Thank you for your input in this.

On 4/24/20 9:40 AM, Pekka Paalanen wrote:
> On Thu, 23 Apr 2020 11:21:47 -0700
> Rajat Jain <rajatja@google.com> wrote:
> 
>> On Tue, Apr 21, 2020 at 7:46 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>>
>>> On Tue, 21 Apr 2020 14:37:41 +0200
>>> Hans de Goede <hdegoede@redhat.com> wrote:
>>>   
>>>> TL;DR: Yes there will be races, because of both userspace +
>>>> the firmware having; and potentially using r/w access to
>>>> the privacy-screen state. But in practice I expect these
>>>> to not really be an issue. Important here is that userspace
>>>> only commits the property in a transaction to commit if
>>>> it actually intends to change the property so as to not
>>>> needlessly create a situation where we might hit the race.
>>>>
>>>> As for 1 vs 2 properties for this I guess that in preparation
>>>> for potential devices where the state is locked, having a
>>>> r/w sw-state + a ro hw-state property makes sense.
>>>>
>>>> So I suggest that we replace the current "privacy-screen" property
>>>> from Rajat's patch-set with 2 props named:
>>>>
>>>> "privacy-screen-sw-state" (r/w)
>>>> "privacy-screen-hw-state" (ro)
>>>>
>>>> Where for current gen hardware the privacy-screen-hw-state is
>>>> just a mirror of the sw-state.
>>
>> Just to make sure I understand the semantics correctly:
>>
>> - The  "privacy-screen-hw-state" shall be read-only, and can be modified by:
>>        - Hardware (e.g. HW kill switch).
>>        - Firmware.
>>        - (Potentially) needs a notification/irq to the kernel when this
>> changes (or may be kernel can read it only when userspace queries for
>> it).
>>
>> - The "privacy-screen-sw-state" shall be read-write, and can only be
>> modified by user space.
>>          - If user space toggles it, the kernel will attempt to
>> "request" the change to hardware.
>>          - Whether the request to hardware was successful or not, the
>> "privacy-screen-sw-state" will always reflect the latest value
>> userspace wrote.
>>          - If the request to hardware was successful, the
>> "privacy-screen-hw-state" will also change (probably via a separate
>> notification/irq from HW).
>>          - We expect the user space to write to
>> "privacy-screen-sw-state" only if it really wants to toggle the value.
> 
> Hi,
> 
> yes, to my understanding, that seems to be the correct idea from this
> thread. The hw-state property must reflect the actual hardware state at
> all times.

Agree on the hw-state prop reflecting the actual hardware state at
all times, that one is easy.

> However, when userspace sets "privacy-screen-sw-state", the driver
> should attempt to change hardware state regardless of whether the
> "privacy-screen-sw-state" value changes compared to its old value or
> not. Otherwise userspace cannot intentionally override a hardware
> hotkey setting if possible (or would need two atomic commits to do it).

Ack / agreed.

> Mind, the above paragraph is only what I interpreted from this email
> thread here. Previously I did not think that with atomic KMS, setting a
> property to a value it already has could trigger anything. But I guess
> it can?

In a way. My idea for the "privacy-screen-sw-state" is for it to reflect
the last requested value, where the request could come from either a
firmware controlled hotkey; or from userspace (this seems to be where
our ideas of how to handle this diverts).

So what can happen is (with both props being always in sync)
-userspace reads privacy screen being off
-user toggles privacy screen on through firmware controlled hotkey
-kernel gets notified about state toggle, updates both property
  states to on
-userspace commits its old knowledge of the property (off), thereby
  triggering the kernel to turn the privacy screen back off

So in this case from the kernel pov the property is actually set
to a new value, not to "a value it already has".

Note there can be races here of course, but lets ignore those (for now).
Both the hotkey event as well as userspace changing the setting will be
end-user triggered events and will not happen at high frequency.
Also I see no way to completely eliminate racing here. Luckily the side
effects of the race or pretty harmless (annoying maybe, but not causing
crashes, etc).

> This design is based on that it can.
> 
>> What is not clear to me is if any change to"privacy-screen-hw-state"
>> shall be propagated to "privacy-screen-sw-state"?
>>   - If yes, then I think we are not solving any problems of single property.
>>   - If no, then why do we require userspace to write to sw state only
>> if something has changed?
>
> No. As already written, the kernel must not change the value of
> "privacy-screen-sw-state", only userspace can.

So this is where out view of how to handle this differs, I do
not see the hotkey changing the state as different from userspace
changing it. The reason for me to have both a sw- and a hw-state
is in case there is a physical switch (typically a slider style
switch) which forces the state to on / off. In this case userspace
could still set the "privacy-screen-sw-state" prop and then
the 2 could differ.

Lets add one more complication to this, which I think helps.
Currently the thinkpad_acpi driver exports the privacy screen as:

/proc/acpi/ibm/lcdshadow

Userspace can write this and then change the privacy-screen
setting, this is in shipped kernels and cannot be dropped
because it is part if the kernel's uABI now.
This means that another userspace process can change the
property underneath a kms client. I do not see how this is
different from the firmware changing the setting based on
a hotkey press. Yet if we stick with your "only userspace can"
change the sw-state setting, then does this count as userspace,
or do you mean only a kms client can ?  And then how is
another kms-client changing the setting different ?

So to me to avoid confusion the only valid case where the
hw- and sw-state can differ is if userspace requests
say "off" as state while the privacy screen is forced on
by say a physical switch (or e.g. a BIOS option to lock it?).

Then we would remember the off in sw-state but hw-state would
still be on.

I guess that maybe for the enum of the hw-state we need 4 values
instead of 2:

Enabled
Disabled
Enabled, locked
Disabled, locked

To indicate to userspace that atm the state cannot be changed.

If userspace then still changes sw-state we cache it and apply
this if the privacy screen control gets unlocked.

On hardware where there is no "lock" the 2 properties will simply
always be the same.

> Let's assume that you have a firmware-implemented hardware hotkey for
> toggling the shield. The driver also successfully implements
> "privacy-screen-sw-state" meaning that writing to it will set the
> hardware shield state. If userspace was writing
> "privacy-screen-sw-state" even when it does not intend to change
> hardware state, it would almost immediately override any state set by
> the hardware hotkey, making the hardware hotkey (randomly) not work.

Right, this is why userspace should not set the property unless
it really means to change it, even then things could still race,
but as explained above that should normally never happen and luckily
the side-effects of hitting the race somehow are not that bad.

> This assumes that the hardware hotkey is a momentary switch that does
> not stop software from controlling the shield too.

This is correct for the Lenovo / thinkpad_acpi case.

> If the hardware hotkey can stop software from changing the shield
> state, then it might not be necessary for userspace to avoid unneeded
> setting of the property. But that depends on which way the hotkey works
> and which way users want to use it, so it's still best for userspace to
> not set the property unless it really intends to apply a change.

Ack.

> If possible, it would be good to make this case the prime example of
> how to correctly implement KMS properties for a hardware feature that
> can be controlled (and fought over) by both userspace and
> hardware/firmware. It seems like the same design can also work with
> hardware switches that force the hardware state to be one or the other,
> stopping userspace from changing it. Therefore I'd avoid incorporating
> any specific shield use cases in the design, e.g. "if hw switch is set
> to shield-on, userspace cannot turn shield off".

I agree that it would be good to make this the prime example of
how to deal with similar cases.

>> Also, it seems to me that in my current patchset, the property I have
>> already behaves like "privacy-screen-sw-state". Do I just need to
>> rename it?

Maybe, it looks like we first need to figure out the exact semantics
of all this.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

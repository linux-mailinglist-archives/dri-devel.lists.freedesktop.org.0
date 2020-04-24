Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7D71B7209
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 12:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F256E45F;
	Fri, 24 Apr 2020 10:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAC76E45F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 10:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587724334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=63fMUelIX+151+5WiyfiaSDv5vyP0+gAl9E7aAe+34A=;
 b=ShfGrRm3EgJqnldlvX/mFYNmLTdc5yzMMJmpHzWkw8KWlQdiFeyrl8+HdX2PYkKj9QF7DH
 7UH9VwaHf+NafXHX7lkuu1RYFdqbPLjVodyVmAdbfdsudALY8TndIvRI/f/pyPt71GdIbL
 y4Mf+4RZtj6H1Ys6qbYHw2e2nrrggzM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-mJjGPc9fMJKkbDvvIRJ5bg-1; Fri, 24 Apr 2020 06:32:12 -0400
X-MC-Unique: mJjGPc9fMJKkbDvvIRJ5bg-1
Received: by mail-wm1-f69.google.com with SMTP id d134so5221731wmd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 03:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=63fMUelIX+151+5WiyfiaSDv5vyP0+gAl9E7aAe+34A=;
 b=NrttEEloI6qY0IxdXJUw3XECVR1G+KGyOyijWanytJ2IJP493ObaHqQ5OnGWrsT7iU
 I7fqXGaiUe8hZ5gVPZTvsy8kJxpx7GKxnIYOfF/wJLMHFwRNDCM51JHl5DZyoVIhXtXA
 wwyRhG8kTaDfuofpUSGBfXIrjz8tDZZsup34vACXBSE7U5337OsHtcXUdGbCYQ0w0lSe
 qM00N+xVP2vRN9EFv6a4nZsRAfhyxW0S6HucrZLRBBoT8k0es5MyyP4Tzx4KPVPAL3W7
 Ed/j43hNVYnP/gywCT/mNn2A+SFX2KdeGHXh36B7eRkwpvFGneBRPD+p966MgFGkJkTE
 h+FA==
X-Gm-Message-State: AGi0PubcDJEcl6fa+iFZrhw500BeRAkaSNS8aTqoLtko38vom29ef1q8
 e7DonEguS76OwXpCfahVXBkbueUPGY7rHvhvkTAhcY6/3JgCpl/9XUzqHw1gN2qw0FEVAZ/MMMn
 TLW3nVQPpEnVAaWYQRg/l+pR9ahkH
X-Received: by 2002:adf:afe4:: with SMTP id y36mr10556703wrd.205.1587724331393; 
 Fri, 24 Apr 2020 03:32:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypI/Yft6igL05rG7UB4j0AaRcZ6zq+YQMfU0hNAKO1/vKcNQoPzL6PK/Dsl4hBge+s+HFCSt2Q==
X-Received: by 2002:adf:afe4:: with SMTP id y36mr10556668wrd.205.1587724331054; 
 Fri, 24 Apr 2020 03:32:11 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id q184sm2267241wma.25.2020.04.24.03.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 03:32:10 -0700 (PDT)
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com> <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain> <87k12e2uoa.fsf@intel.com>
 <e8da46f8-ebe4-aee4-31c8-229d06fa7430@redhat.com>
 <20200421174613.139991ed@eldfell.localdomain>
 <CACK8Z6Hwg132K3TwsX6Bjx-2KG0HywrP=PnMMegdp7jqeU__1A@mail.gmail.com>
 <20200424104024.4cdb0d40@eldfell.localdomain>
 <caa677d0-bc43-5045-f4bb-1b762fafc870@redhat.com>
 <20200424120802.35fbffb4@eldfell.localdomain>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c52be7da-f6e6-58de-bafe-7c5785def061@redhat.com>
Date: Fri, 24 Apr 2020 12:32:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200424120802.35fbffb4@eldfell.localdomain>
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
 Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>,
 Benjamin Berg <bberg@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On 4/24/20 11:08 AM, Pekka Paalanen wrote:
> On Fri, 24 Apr 2020 10:24:31 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:

<snip>

>> Agree on the hw-state prop reflecting the actual hardware state at
>> all times, that one is easy.
>>
>>> However, when userspace sets "privacy-screen-sw-state", the driver
>>> should attempt to change hardware state regardless of whether the
>>> "privacy-screen-sw-state" value changes compared to its old value or
>>> not. Otherwise userspace cannot intentionally override a hardware
>>> hotkey setting if possible (or would need two atomic commits to do it).
>>
>> Ack / agreed.
>>
>>> Mind, the above paragraph is only what I interpreted from this email
>>> thread here. Previously I did not think that with atomic KMS, setting a
>>> property to a value it already has could trigger anything. But I guess
>>> it can?
>>
>> In a way. My idea for the "privacy-screen-sw-state" is for it to reflect
>> the last requested value, where the request could come from either a
>> firmware controlled hotkey; or from userspace (this seems to be where
>> our ideas of how to handle this diverts).
>>
>> So what can happen is (with both props being always in sync)
>> -userspace reads privacy screen being off
>> -user toggles privacy screen on through firmware controlled hotkey
>> -kernel gets notified about state toggle, updates both property
>>    states to on
>> -userspace commits its old knowledge of the property (off), thereby
>>    triggering the kernel to turn the privacy screen back off
>>
>> So in this case from the kernel pov the property is actually set
>> to a new value, not to "a value it already has".
> 
> Hi,
> 
> that is an interesting point of view.
> 
> You are keeping the separation between "wanted" and "actual" state, but
> counting firmware/hardware hotkeys as "want" instead of letting them
> silently change hardware state.

Right, that seems more natural to me, as mentioned
already, this way the wanted and hw state only get out
of sync if the hw is locked to a certain state.

> That seems ok.
> 
>> Note there can be races here of course, but lets ignore those (for now).
>> Both the hotkey event as well as userspace changing the setting will be
>> end-user triggered events and will not happen at high frequency.
>> Also I see no way to completely eliminate racing here. Luckily the side
>> effects of the race or pretty harmless (annoying maybe, but not causing
>> crashes, etc).
>>
>>> This design is based on that it can.
>>>    
>>>> What is not clear to me is if any change to"privacy-screen-hw-state"
>>>> shall be propagated to "privacy-screen-sw-state"?
>>>>    - If yes, then I think we are not solving any problems of single property.
>>>>    - If no, then why do we require userspace to write to sw state only
>>>> if something has changed?
>>>
>>> No. As already written, the kernel must not change the value of
>>> "privacy-screen-sw-state", only userspace can.
>>
>> So this is where out view of how to handle this differs, I do
>> not see the hotkey changing the state as different from userspace
>> changing it. The reason for me to have both a sw- and a hw-state
>> is in case there is a physical switch (typically a slider style
>> switch) which forces the state to on / off. In this case userspace
>> could still set the "privacy-screen-sw-state" prop and then
>> the 2 could differ.
> 
> Yes, the locked switch case definitely makes sense to me.
> 
> If userspace has to avoid setting the sw property unless it actually
> intends to change it, then the sw property being controlled from
> multiple sources (firmware, hotkey, the /proc file below) could work.
> It would even tell the KMS client when someone else changed the
> "wanted" state.

Right, that is the idea and telling the KMS client definitely
is a feature we want, so that we can show an OSD notifcation
on the firmware handled hotkey presses, like we already do for volume
control/mute, (kbd) backlight changes, etc.

>> Lets add one more complication to this, which I think helps.
>> Currently the thinkpad_acpi driver exports the privacy screen as:
>>
>> /proc/acpi/ibm/lcdshadow
>>
>> Userspace can write this and then change the privacy-screen
>> setting, this is in shipped kernels and cannot be dropped
>> because it is part if the kernel's uABI now.
>> This means that another userspace process can change the
>> property underneath a kms client. I do not see how this is
>> different from the firmware changing the setting based on
>> a hotkey press. Yet if we stick with your "only userspace can"
>> change the sw-state setting, then does this count as userspace,
>> or do you mean only a kms client can ?  And then how is
>> another kms-client changing the setting different ?
> 
> To me that would be similar to firmware changing hardware state: it's
> not the KMS client (the display server) doing it, but something else
> behind its back while it thinks it's in full control.
> 
> Doing things behind the display server's back is what creates all the
> mess here.

Right, unfortunately this is not something which we can change.
I have asked Lenovo if it will be possible to just have the hotkey
send keypresses and let userspace deal with it. This might happen
on future hardware generations. But then again it might not and
for the current hardware gen. we are stuck with the firmware
handling it.

> Another KMS client cannot set the property behind the display server's
> back, because the display server is holding DRM master, and the
> property cannot be written without DRM master status. If the display
> server drops DRM master, it knows it probably lost all state.

True.

>> So to me to avoid confusion the only valid case where the
>> hw- and sw-state can differ is if userspace requests
>> say "off" as state while the privacy screen is forced on
>> by say a physical switch (or e.g. a BIOS option to lock it?).
>>
>> Then we would remember the off in sw-state but hw-state would
>> still be on.
>>
>> I guess that maybe for the enum of the hw-state we need 4 values
>> instead of 2:
>>
>> Enabled
>> Disabled
>> Enabled, locked
>> Disabled, locked
>>
>> To indicate to userspace that atm the state cannot be changed.
> 
> If userspace needs that information, sure.

Yes I believe that userspace will want to know when the state is locked.
Currently when wifi is disable through a hardware switch, like
the sliders on the side of (usually somewhat older) laptops, then e.g.
GNOME will show "Disabled in hardware" (the wording could do with
some work) at the place where you would normally run wifi on/off and
select the network to use.

> This makes me think that a driver needs to handle different types of
> switches/hotkeys through different properties:
> 
> - For a hardware latching switch that forces the shield state to be one
>    and not the other, it should change the hw-state but it does not seem
>    to have a reason to change the sw-state property: it's not a "want",
>    it's a hard setting. Changing sw-state would also lose the userspace
>    preference of the setting.

Yes, I completely agree.

> - For momentary button or a hotkey that is supposed to just toggle the
>    shield state, it would toggle sw-state property since it's a "want"
>    that can be overridden. Setting the property leads to changing the
>    hw-state as well (if not locked).

Also agreed, although in practice the firmware may actually change
the hw state itself (if not locked), but we would then update both the sw
and hw props to reflect this.

> Does that make sense?

Yes this makes sense to me. Now we just need to write it all down in
such a way so that other people will also understand it :)

> Maybe this is the best compromise given the display server cannot be in
> full control.

I agree that this seems to be the best compromise.

>> If userspace then still changes sw-state we cache it and apply
>> this if the privacy screen control gets unlocked.
> 
> Sounds good.
> 
>> On hardware where there is no "lock" the 2 properties will simply
>> always be the same.
> 
> Ok.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

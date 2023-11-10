Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EDB7E89D2
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 09:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766A910E251;
	Sat, 11 Nov 2023 08:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 46993 seconds by postgrey-1.36 at gabe;
 Fri, 10 Nov 2023 16:58:29 UTC
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E41310E125;
 Fri, 10 Nov 2023 16:58:29 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4SRlQ95myqz9spj;
 Fri, 10 Nov 2023 17:58:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001; 
 t=1699635505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xv0RmDooG3JgDJHA2SqaAIpBFKQ0UuIqzPA46XswMys=;
 b=0NFLEqpKQmJbLf7s0Gu6qlXSi//AhUQ95naoWkj4WMZu2Fq78Lrb32fYcpQCffzlf8RA0O
 Hc8Zj/uR3VEYWUO52IUz6PEZxdwn7pKAlS4oyVSQODoUo+0e40cwxCe5wXcLS6cFFbZxZP
 sRsYUfYj8b4g01I8bgO9sO+4pzx3+6W6oCBqwW7AaorjYgDhFRntPTKvKhvPvKveLBAMEf
 3qEHo/6UMMtETriDJfJfR1488Y2IGRoZGmpc9fviXWw5XaxCxjZLB/EtvYXGw9/X59bO29
 op1UQfJ+OV+1sNIKwHRbI5a/Y1UFO6bcyJbXhAcCgdpDAnZk1WUtjFLz0/CCeA==
Message-ID: <d1ac9c1e-f3fe-4d06-ba2e-2c049841d19b@owenh.net>
Date: Fri, 10 Nov 2023 10:58:07 -0600
MIME-Version: 1.0
From: "Owen T. Heisler" <writer@owenh.net>
Subject: Re: [REGRESSION]: acpi/nouveau: Hardware unavailable upon resume or
 suspend fails
To: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <9f36fb06-64c4-4264-aaeb-4e1289e764c4@owenh.net>
 <CAAd53p7BSesx=a1igTohoSkxrW+Hq8O7ArONFCK7uoDi12-T4A@mail.gmail.com>
 <a592ce0c-64f0-477d-80fa-8f5a52ba29ea@redhat.com>
 <CAAd53p608qmC3pvz=F+y2UZ9O39f2aq-pE-1_He1j8PGQmM=tg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAAd53p608qmC3pvz=F+y2UZ9O39f2aq-pE-1_He1j8PGQmM=tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4SRlQ95myqz9spj
X-Mailman-Approved-At: Sat, 11 Nov 2023 08:24:49 +0000
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
Cc: regressions@lists.linux.dev, Karol Herbst <kherbst@redhat.com>,
 nouveau@lists.freedesktop.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, stable@vger.kernel.org,
 linux-acpi@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

On 11/10/23 06:52, Kai-Heng Feng wrote:
> On Fri, Nov 10, 2023 at 2:19 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 11/10/23 07:09, Kai-Heng Feng wrote:
>>> On Fri, Nov 10, 2023 at 5:55 AM Owen T. Heisler <writer@owenh.net> wrote:
>>>> #regzbot introduced: 89c290ea758911e660878e26270e084d862c03b0
>>>> #regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/273
>>>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=218124
>>>
>>> Thanks for the bug report. Do you prefer to continue the discussion
>>> here, on gitlab or on bugzilla?

Kai-Heng, you're welcome and thank you too. By email is fine with me.

>> Owen, as Kai-Heng said thank you for reporting this.

Hans, you're welcome, and thanks for your help too.

>>>> ## Reproducing
>>>>
>>>> 1. Boot system to framebuffer console.
>>>> 2. Run `systemctl suspend`. If undocked without secondary display,
>>>> suspend fails. If docked with secondary display, suspend succeeds.
>>>> 3. Resume from suspend if applicable.
>>>> 4. System is now in a broken state.
>>>
>>> So I guess we need to put those devices to ACPI D3 for suspend. Let's
>>> discuss this on your preferred platform.
>>
>> Ok, so I was already sort of afraid we might see something like this
>> happening because of:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=89c290ea758911e660878e26270e084d862c03b0
>>
>> As I mentioned during the review of that, it might be better to
>> not touch the video-card ACPI power-state at all and instead
>> only do acpi_device_fix_up_power() on the child devices.
> 
> Or the child devices need to be put to D3 during suspend.
> 
>> Owen, attached are 2 patches which implement only
>> calling acpi_device_fix_up_power() on the child devices,
>> can you build a v6.6 kernel with these 2 patches added
>> on top please and see if that fixes things ?

Yes, with those patches v6.6 suspend works normally. That's great, thanks!

I tested with v6.6 with the 2 patches at 
<https://lore.kernel.org/regressions/a592ce0c-64f0-477d-80fa-8f5a52ba29ea@redhat.com/> 
using 
<https://gitlab.freedesktop.org/drm/nouveau/uploads/788d7faf22ba2884dcc09d7be931e813/v6.6-config1>. 
I tested both docked and un-docked, just in case.

Tested-by: Owen T. Heisler <writer@owenh.net>

>> Kai-Heng can you test that the issue on the HP ZBook Fury 16 G10
>> is still resolved after applying these patches ?
> 
> Yes. Thanks for the patch.
> 
> If this patch also fixes Owen's issue, then
> Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com

Please let me know if anything else is needed from me.

Many thanks,
Owen

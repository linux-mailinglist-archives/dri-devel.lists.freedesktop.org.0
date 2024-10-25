Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E149B0AED
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B3810EB4C;
	Fri, 25 Oct 2024 17:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="lFipAUF1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75CA10EB4F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1729876664; x=1730481464; i=wahrenst@gmx.net;
 bh=ixqvV0KbAiZT2Mfe+ksKXuMoFL/wJ5sUoOztTW1mNGQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lFipAUF1T9UIBxU5Eyd29pSyYle9p/N/XAodIFFyjS4EIJqRIiN81iXLrvSX7956
 AmAGYUCBbFjfSZDmjcmapAhnJJ3dpv1P72flZ0bZ0o3VyhT0rHXCr1z42K77OqNVn
 IrtmoNamgqM+giAj3WJe7jyTwDqgo0OYYmDlMsrtqIcxWz7G6+bdRSHOe309r2acE
 nuihlLkCLFFZCHWi2pc8dyUgG5A/IarvinZ3aEElpOE3MJxO95zDe80H01JNLJuGU
 UUa68CQljtp8HFr/eiYWGAZ+NGlZ0a+zFR4eSnu6KSJdaEtXA4m13+TQo6vPrb6MG
 qOhAI94w46l3rgstLw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm6F-1t5mky0tMB-006c2k; Fri, 25
 Oct 2024 19:12:19 +0200
Message-ID: <cdd3725f-91e2-435d-9334-705a02028b89@gmx.net>
Date: Fri, 25 Oct 2024 19:12:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, DRI Development <dri-devel@lists.freedesktop.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
 <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
 <20241014-warm-savvy-wrasse-ed984e@houat>
 <CAPY8ntAFzT4uBT47kDnDjEcSZXLonV-n_ixZ6L1_LAcfQPwS8Q@mail.gmail.com>
 <17f8f497-1238-4555-824b-b5a3fb699a98@gmx.net>
 <CAPY8ntBegA_L58s30F4FSO+=q78Xt5XA4kvYq38zAvsgR2DSrQ@mail.gmail.com>
 <6465bac6-9841-4f38-b9e1-48e236ada910@gmx.net>
 <CAPY8ntCzg-2vCuX0uaRD1kK5=qhH79hmtvQc=g44bD5iGwi7_w@mail.gmail.com>
 <20241017-kickass-agile-boa-dd5cd3@houat>
 <974f9525-76da-4b3a-ba94-6ac68fc542be@gmx.net>
 <20241017-icy-speedy-okapi-bebdfa@houat>
 <9957cd8b-cd6d-4fbd-a78f-d25814b68e1e@gmx.net>
 <CAPY8ntA+adGy3kkDnGUd1REpMc0f5zQD-9HPDTQfd6KUaUSfNw@mail.gmail.com>
 <5799c03b-19d6-4791-9fef-1538ecd9a4be@gmx.net>
 <CAPY8ntAxjGKBKPbpH0UzG1b4H478MNXAcgGi+F4c2f5zOzigxQ@mail.gmail.com>
 <0804b147-5048-4d2d-b1a2-0e5a7db2b892@gmx.net>
 <CAPY8ntBwWeTRmys_ZHTAtr4fNpf5hWhvWeM6uZH=H3udB+PCSw@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAPY8ntBwWeTRmys_ZHTAtr4fNpf5hWhvWeM6uZH=H3udB+PCSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pPdI6uKkHFOei6cELVhCV0U1ixAyscz+cAP+HFs8kzsT5yhe2mA
 U1+c5pMudfmf1eyff9SCn4tpgEyIVap6J5sshVzTgBmvLKUN203SJTYqaKM2jle8ttHZiYa
 813hXl4a3JYRxMAVzOn/5OHHJkni2bDwdpGWxM1W8wazSA7ZC85PIN2IEDjOOZ54YMttlzM
 Or3gmqmOmNosWwOdQioYw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ByYY0kpZGAs=;yDWBjTolUDC2KE7cKtIafPi4GLR
 uggXpo2fcgygeZZrkUyvj32gVhFfvKMoRfELql4woQvdQywqjC2g3mbNsVp6c6fgkXk69TGqn
 AdAhjFGGWNeSBYQ+FoM3alR9uPylc4vIptFYDVxinXQ4vJCqbQ8hUqduqUao42yujdwEnhWBT
 1euKyDb5XuCyLiL6XpdjeDx+6WoYPfOQaI/g3EMtPzbxO7vlmTXys3E0W3xsrq+u1Y6LjEV8P
 fog/McrWdBJxfjOqA8UlZIBovNKcVX05HNbSDrr6x7ABDI0GQ/yXjzB6L6G3noiV/TgncyPqK
 00m90emHmCb2FWaGl3gnVR9ohC8nbnFVklssq9HL0WoA7bBQH+2d0vdkgmeNuam+WaVk6QyJn
 EGv2i51uaS3vLpXisQSGAEZx0uRqNVh4jkLGuUFsy8+OI9l3IyojimkvKyGdiJgnPm4qVKN12
 +hkT0yNGuOqMNPqHs9yGvX2POG0GeUd3Q6mJzPA+0j+0vMVR/XAB49GtapSaesXo7kAWp33Wj
 I3gHKWTQ+8d9IypanZPyhfCNCzutxK0kty8YQY+Y5QufuBl+qphsIjxLpt2LuJ517cjMs6zmz
 W4mxRPNz01lqM/EltHyORJ0RVxKAPragKX+VKxNrOlxLavMz40MFyx5WrjxpCW+9d6nA6WNBM
 e2A5e2IXksRPRyt6cpzmYKbJ0N56fDu/UXkEzhD+1xBcc0r/NBwJXK2+kR9n70Yy8wAUK+e4s
 JFKWMEfP9HLwQxor8mYMl3i84Bybh3+28tsAFYsnAglhA6TqbeP/tAPB9OoxMV3MPdOxYmyaX
 DouzBz04+y3AVtL81aa4yMNoNvmAERUa92QYjrjU5LZF8=
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

Hi Dave,

Am 25.10.24 um 18:56 schrieb Dave Stevenson:
> On Fri, 25 Oct 2024 at 17:31, Stefan Wahren <wahrenst@gmx.net> wrote:
>> Hi Dave,
>>
>> Am 25.10.24 um 16:38 schrieb Dave Stevenson:
>>> Hi Stefan
>>>
>>> On Fri, 25 Oct 2024 at 14:36, Stefan Wahren <wahrenst@gmx.net> wrote:
>> ...
>>> Based on that log I think your force_turbo=3D1 is a red-herring, or at
>>> least needs further investigation.
>>>
>>> Is this on a 3B, or 3B+?
>> Definitely a 3B+ from the year 2017 (mainline devicetree)
>>> Snippets from your log as we resume:
>>>
>>> [  216.797764] PM: suspend exit
>>> [  216.800473] lan78xx 1-1.1.1:1.0 eth0: Link is Down
>> AFAIK only the 3B+ has a Microchip LAN7800
> Absolutely right. I was heading down the wrong track there.
>
>>> [  216.804503] vc4-drm soc:gpu:
>>> [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
>>> [  216.804584] vc4-drm soc:gpu:
>>> [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
>>> status updated from connected to disconnected
>>> [  216.804648] vc4-drm soc:gpu:
>>> [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
>>> disconnected
>>> - So hotplug has signalled disconnected
>>> ...
>>> [  216.816990] vc4-drm soc:gpu: [drm:drm_mode_setcrtc] [CONNECTOR:33:H=
DMI-A-1]
>>> [  216.817079] vc4-drm soc:gpu:
>>> [drm:drm_atomic_helper_connector_hdmi_check] Trying with a 8 bpc
>>> output
>>> [  216.817107] vc4-drm soc:gpu:
>>> [drm:drm_atomic_helper_connector_hdmi_check] Trying RGB output format
>>> [  216.817166] vc4-drm soc:gpu:
>>> [drm:drm_atomic_helper_connector_hdmi_check] RGB Format, checking the
>>> constraints.
>>> [  216.817186] vc4-drm soc:gpu: [drm] HDMI Sink doesn't support RGB,
>>> something's wrong.
>>> - This is correct as the output is disconnected
>>> ...
>>> [  227.075847] vc4-drm soc:gpu: [drm:update_display_info.part.0]
>>> [CONNECTOR:33:HDMI-A-1] HDMI: DVI dual 0, max TMDS clock 0 kHz
>>> [  227.075912] vc4-drm soc:gpu: [drm:update_display_info.part.0]
>>> [CONNECTOR:33:HDMI-A-1] ELD monitor HP ZR2440w
>>> [  227.075942] vc4-drm soc:gpu: [drm:update_display_info.part.0]
>>> [CONNECTOR:33:HDMI-A-1] HDMI: latency present 0 0, video latency 0 0,
>>> audio latency 0 0
>>> [  227.075971] vc4-drm soc:gpu: [drm:update_display_info.part.0]
>>> [CONNECTOR:33:HDMI-A-1] ELD size 36, SAD count 1
>>> [  227.076014] vc4-drm soc:gpu: [drm:output_poll_execute]
>>> [CONNECTOR:33:HDMI-A-1] status updated from disconnected to connected
>>> [  227.076040] vc4-drm soc:gpu: [drm:output_poll_execute]
>>> [CONNECTOR:33:HDMI-A-1] epoch counter 3 -> 4
>>> [  227.076072] vc4-drm soc:gpu: [drm:drm_sysfs_hotplug_event]
>>> generating hotplug event
>>> [  227.076170] vc4-drm soc:gpu: [drm:drm_client_dev_hotplug] fbdev: re=
t=3D0
>>> - We now get a connect again.
>>>
>>> The 10 second interval is why I'm suspecting you're on a 3B - we have
>>> no interrupts for the GPIO used there (expgpio 4), whereas we do on
>>> 3B+ (gpio 28). The poll period is 10seconds in the absence of
>>> interrupts.
>> gpiochip0 - 54 lines:
>>       line   0:     "ID_SDA"       unused   input  active-high
>>       line   1:     "ID_SCL"       unused   input  active-high
>>       line   2:       "SDA1"       unused   input  active-high
>>       line   3:       "SCL1"       unused   input  active-high
>> ...
>>       line  27:     "GPIO27"       unused   input  active-high
>>       line  28: "HDMI_HPD_N"        "hpd"   input   active-low [used]
>>       line  29: "STATUS_LED_G" "ACT" output active-high [used]
>>       line  30:       "CTS0"       unused   input  active-high
> In which case I'm totally bemused by the significant delay.
> I'm not aware of any path in the software that can create this effect,
> so it would point to the connected device (ie HDMI switch).
Another cause could be related to these messages from log:

[=C2=A0 167.371865] NOHZ tick-stop error: local softirq work is pending,
handler #08!!!

[=C2=A0 186.932178] NOHZ tick-stop error: local softirq work is pending,
handler #08!!!

Maybe this comes from the lan78xx driver? This messages doesn't occur in
the bad case.
>
>> Sorry, I missed a possible important information. The Raspberry Pi 3B+
>> is not directly connected to the display. There is a passive Logilink
>> HDMI switch in between.
> Is it truly passive? That's unusual for anything handling high
> bandwidth signals such as HDMI. Have you got a product link?
Maybe passive is the wrong wording here. I meant not powered by a power
supply.

http://www.logilink.de/media/datasheets/HD0006.pdf
> There is a low current 5V supply available from all HDMI sources
> (intended for the EDID EEPROM) which can power some of these devices.
>
> We have also seen KVM switches do odd things when they lose the input
> signal, as they try to find another active input.
>
>>> On that suspend you were suspended for 16 seconds. Previous suspends
>>> were for 9 and 12 seconds.
>> I waited 20 seconds multiple times with and without force_hdmi and
>> wasn't able to reproduce it more reliable. But I agree this not a prove=
.
>>
>> Maybe this is caused by the HDMI switch. At the end this is not
>> critical. My only concern was that this is an in suspend/resume handlin=
g.
>>
>> I will try need to investigate this ...Thanks for your help. Stefan
> No problem. I'm interested in solving this one too.
>
>    Dave


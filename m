Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1732A9A4CA6
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 11:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A2F10E273;
	Sat, 19 Oct 2024 09:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="kl3tZtHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C6010E273
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 09:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1729330470; x=1729935270; i=wahrenst@gmx.net;
 bh=t6BQMQY8tRi7ZDoUKbkTkpmxUcXEw461j/1kzC8K6Rw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kl3tZtHxwppKbEBkqEeP7W7wGrVX7u23ppylMKRaAx7hCkX/WMDJoGmMNmmg+t4+
 wuUzIaLdIG3YzLJMkyjk0AL2m+DiU4ouwQBToNIwr9/V9ugqkV7knsAb9vDtWHZjl
 ak+FAxN4HzUTsmXNbg1yy7k3CUyx6ww4afW+DK30OJ4iMRI1OaoNDKm4ygVmnRbu+
 w1P7seA+tZvM5neP5Jm1ccXO1o7o4CI4i3prW+cBd295d3hSCekgMDI4H/NZrmAat
 mFdfLla2XVExKL5EZ9O9CK2sJPZMkDzVVwKoFIcXv6qJn1s6opma8Wxythrxc8yv2
 SOIzySTmUtyLxhEbxg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJVDW-1tLob82LjU-00RxQw; Sat, 19
 Oct 2024 11:34:30 +0200
Message-ID: <9957cd8b-cd6d-4fbd-a78f-d25814b68e1e@gmx.net>
Date: Sat, 19 Oct 2024 11:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
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
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241017-icy-speedy-okapi-bebdfa@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4lZLsw2Sa+Ttlq8ObqQZQPMVqjYno0a9jtT1zEqS8R+yeadjNXV
 4Ug+SX/uEfM6QszDZ1InKLWJv+2+vqkb8fvFa5jzkYDyawCnO6n3En2rSXVA/XlTisd0jdI
 y2gUK1FvT+76yQ+f6ksS6w+Ytgz/Zjko4OhMO8qkcfiFrGgN8VVdZ3y3t6Fn9CkmyNoCLIA
 ZAFAK6N2e+KHFrJ2yrmUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VEjTmWgm7VI=;Phoahc5PfluuqD2U3wiYtvDILRx
 Wmsx4kNlFzFn5QLjKIR3zA22HWh5LzFG97i5+dUBi2U6SJU2AszWJofkLWaNas1tl3jAcWJu2
 DMwYbE1U9XAsDdvfH/vWUNtSmnp0T367BLzDasIyIEaojyuP7fYNqgEaWF2S2yucy1Pt+tDYG
 MITD5Y534narL5e4mM4F3cHj+NIbMxBA1duQztqdu/3ILWE0MHPWW064eNXBvvy90ceymzKHk
 rjJgNHO5LDQVwGt/1us0LerFWUYsJpBhUxDS2W9e2GC3YQaKeDWuq4RrrEFpeIwZj4OY2fPnT
 d/qPm7Chw2lHodFwE4K1mZfew5B9FO+ldNXZIunFEUu9c0HXL1vskArmMxdJl/QMrJiImLyiW
 RBM4CZwpPAg5vcyFUP7QKONwTH9LPcYOYfJ0zzQkx3TrdL819vfZnyZbkXQ1DLGh3O4JQW/JH
 AxPN+hYjFck+hjCeB9KlwECKsdx7vLgieML8Nqy1fHKZjbtWvZeiSgdef1Upd/32EojM9kGy8
 S46ADhDjJHWw0tt2IENuvWHjuBAAIdxl+ETzLhnyCgdQp/uRFC3/TVWr3JD0iq8zVuy4MAIBR
 h24Wc20bB1vYmtMytkJJ61tWtN8KRcPpgQMyHRCIzBM+A7q4uDIOVGE8hql44Ja1ptMaP1GOa
 +KRz0ZdpUdi9zj4Z871q0XvOi2tPwZOHFAQFTNBQhy3yFVoeJaUoLcMM3zQimwGqTn0LG1YIQ
 g2zvO6BN36VY4+ZmA7GMeV+2RRV4wFep34ly55wo91pa3sX3+5sJOigfewh0y5GeXFDDe3MtY
 T70S0v6lQtjlZMMDC2yW8xfA==
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

Hi,

Am 17.10.24 um 17:59 schrieb Maxime Ripard:
> On Thu, Oct 17, 2024 at 05:26:46PM GMT, Stefan Wahren wrote:
>> Am 17.10.24 um 16:27 schrieb Maxime Ripard:
>>> On Wed, Oct 16, 2024 at 07:16:43PM GMT, Dave Stevenson wrote:
>>>> Hi Stefan
>>>>
>>>> On Tue, 15 Oct 2024 at 22:13, Stefan Wahren <wahrenst@gmx.net> wrote:
>>>>> Hi Dave,
>> ...
>>>>> i prepared a branch for you, which contains the latest suspend2idle =
patches:
>>>>>
>>>>> https://github.com/lategoodbye/linux-dev/commits/v6.12-pm/
>>>>>
>>>>> Steps:
>>>>> 1. Flash latest Raspberry Pi OS (32 bit) on SD card
>>>>> 2. Build Kernel from repo above with arm/multi_v7_defconfig
>>>>> 3. Replace Kernel, modules + DTB on SD card with build ones
>>>>> 4. add the following to confix.txt
>>>>> device_tree=3Dbcm2837-rpi-3-b-plus.dtb
>>>>> enable_uart=3D1
>>>>> 5. change/add the following to cmdline.txt
>>>>> console=3DttyS1,115200
>>>>> no_console_suspend=3D1
>>>>> 6. connect the following devices to Raspberry Pi 3 B+ :
>>>>> USB mouse
>>>>> USB keyboard
>>>>> HDMI monitor
>>>>> Debug UART adapter (USB side to PC)
>>>>> 7. Power on board and boot into X11
>>>>> 8. Change to root
>>>>> 9. Enable wakeup for ttyS1
>>>> So I remember for next time
>>>> echo enabled > /sys/class/tty/ttyS1/power/wakeup
>>>>
>>>>> 10. Trigger suspend to idle via X11 (echo freeze > /sys/power/state)
>>>>> 11. Wakeup Raspberry Pi via Debug UART
>>>> I don't get the error you are seeing, but I also don't get the displa=
y resuming.
>>>> pm has obviously killed the power to the HDMI block, and it has the
>>>> reset values in as can be seen via /sys/kernel/debug/dri/0/hdmi_regs.
>>>> Nothing in the driver restores these registers, and I'm not sure if i=
t
>>>> is meant to do so.
>>>> Run kmstest or similar from this state and the change of mode
>>>> reprogrammes the blocks so we get the display back again.
>>>>
>>>> I've also enabled CONFIG_DRM_LOAD_EDID_FIRMWARE so that I can use you=
r
>>>> EDID, and get the same results.
>>>>
>>>> Knee-capping the HDMI block on suspend seems an unlikely mechanism to
>>>> work reliably. On the more recent Pis there is a need to be quite
>>>> careful in disabling the pipeline to avoid getting data stuck in
>>>> FIFOs.
>>>> I feel I must be missing something here.
>>> I think we're probably missing calls to drm_mode_config_helper_suspend=
 and
>>> drm_mode_config_helper_resume.
>> Okay, i tried this and it works better (HDMI resumes fast), but it also
>> triggers a lot of WARN
> vc4_plane_reset deviates from the helper there:
> https://elixir.bootlin.com/linux/v6.11.3/source/drivers/gpu/drm/drm_atom=
ic_state_helper.c#L326
>
> We should adjust it.
>
>> and the "doesn't support RGB ..." warnings are still there.
>>
>> I pushed my changes to the branch and attached the dmesg output.
> I can't help you there, it doesn't make sense to me. The EDID should be =
correct.
Maybe I should clarify that I provided the EDID from the X11 log during
normal boot (good case). I wasn't aware how to dump the EDID during the
suspend.

I tested with the new branch and these warning doesn't always occurs
during resume. So it seems to be timing related.

AFAIU the EDID is read via I2C DDC and the attached clock in this case
is VPU clock. Correct?

So I added the following to the config.txt

force_turbo=3D1

After that I wasn't able to reproduce these HDMI Sink warnings.

Is it possible that the I2C data get corrupted by VPU clock changes?

Regards
>
> Maxime


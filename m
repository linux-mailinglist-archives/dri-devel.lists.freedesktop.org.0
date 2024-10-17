Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBAC9A29D2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 18:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3331C10E339;
	Thu, 17 Oct 2024 16:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="UlgCXuu4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD2F10E339
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 16:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1729184334; x=1729789134; i=wahrenst@gmx.net;
 bh=0NVBrXHVxAK1PCE5nx82jVHQL0GBSqThdGlA9KVOqPk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=UlgCXuu4mGygDvkPqSteq8JjmBHpgmPJGAs38gESTyh/eHBjuX/8/C/fZl7GXSF5
 5sN+S5t6NKqSQPu22QvWxVKKDnlUeSRylrMEUwJepfWlZYk3SfBIlTU5HmN+WQE5f
 o1jDn1NXxOvO8DLX6j5m0e7dp5oSdI6hdtzH/rGKtkhLQZSjd8hDmwnplN8MgdA3q
 nublL+GWXB5GIFrkifgOP3jCpMV/ROifZOBE+jQUgTl90dKLTlTlWWgsDa9EwDMhS
 kr2f5vLFforQZ2YlecgwsAe8HNJD/j6sZn6CI3bDbo+HYAKLmTzvDnYxr7ESDbzBG
 OnTr4ayUyc1YGpAH5A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMobU-1tK7613z1g-00Inwb; Thu, 17
 Oct 2024 18:53:26 +0200
Message-ID: <719ffe90-bfd6-4a5a-8dd5-d6bb60d47a04@gmx.net>
Date: Thu, 17 Oct 2024 18:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>
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
 <CAPY8ntDoS4Vo1GUw7KB+QNRfdZrebYCJSw1sQPVHz=Tr6Lh49g@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAPY8ntDoS4Vo1GUw7KB+QNRfdZrebYCJSw1sQPVHz=Tr6Lh49g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qkDtoB1w24PlGJF4o7OwNvuAAhVho5EIQFapwKjJu//yBIL4ULq
 Pf5NTXJAa+jLznHrwzWyHss9j7Jps1vJeZ8UsSfhwOxOqsug9zwRCH3pnNf11S/4oQ8LzXh
 Q6FaSKhf6wu8BTjGga95LfAcKE3EhJQVxHXHH7NDbXGjc+p9CeZAh2zqLVJRtEJKpXa594S
 ys/k1Q2UK8H+ISWTEOJLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H822WaDNz6A=;TyV5BLFHcUM6dLPXE0sbc7QN6wN
 NKYzrgEf6fS2djdhCOGEWY0LMUA9GB5UyHYvhxl3Aommn9A5XZKkmW6tlEOF23/Vt7b7e8sZk
 WTUQlG7KgNNCPxSAiKmTfWPI7+iGWxHWjCFCy4ToWb9VCVWJX/To/H+XpL0kOG574QoEtGflc
 dmXe2hfzbfuakXnCf5tAraWeC2OwA8hHrq+zGAc+XeQTqd/xqiaAFwcPOrxklhmvHH8ym0mQ7
 V5iScniuCGCRhZ6MCTUeCS7hILI4I84uKoGaPGv2H2a670q/KPgufOdBVby10SYp3HnwXnI+v
 o0bIA7ldyk3S7GTfsV7pkAk9nR/5RAbKCx/MUAGBjxusZHZadrfEKjUd/l/ofAHLGmFgkKyxD
 USN6uoiTt6DaLnvc7J1DBMIBQco270VsmVQUObQh2fiLlXQ/PXI35ue/FxzcSMH/rOTInN0cR
 vUj7qdG0pLGQV5bx6/sGThAFyPA5MAemorgtn4TMRnQ2OHti7m4a+jXfSEKdEa1jigQUDuygT
 dlxsOeNp8dmVL5DD2Q39hD34v6zU3js0ByCJte5d3X/N4q8Ov7eHi6ZWA8EpDWY9baOMJV2dP
 8U13e7n0CwS5Y3mHcLFg/7VLANXA1EvyUfrVRiA6alsfvDI1n48qMRbMpl1kAwzDHrDc5f955
 OJy6bczPkae0SDelf4WKEBegKcQjCYVp1XOmt9zlqi70hMzvFLEshkbKXypMXGqILkhV9wkkW
 6WflllpWSCitK1Zi32ZqAsab/3nCYD7bVGbCvzOPRkIOuxu7dum61NaBrC/vkasOYY+WIEEkk
 AF3v99Kd772CO0xDaKQwXgUA==
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

Am 17.10.24 um 18:37 schrieb Dave Stevenson:
> On Thu, 17 Oct 2024 at 16:59, Maxime Ripard <mripard@kernel.org> wrote:
>> On Thu, Oct 17, 2024 at 05:26:46PM GMT, Stefan Wahren wrote:
>>> Am 17.10.24 um 16:27 schrieb Maxime Ripard:
>>>> On Wed, Oct 16, 2024 at 07:16:43PM GMT, Dave Stevenson wrote:
>>>>> Hi Stefan
>>>>>
>>>>> On Tue, 15 Oct 2024 at 22:13, Stefan Wahren <wahrenst@gmx.net> wrote=
:
>>>>>> Hi Dave,
>>> ...
>>>>>> i prepared a branch for you, which contains the latest suspend2idle=
 patches:
>>>>>>
>>>>>> https://github.com/lategoodbye/linux-dev/commits/v6.12-pm/
>>>>>>
>>>>>> Steps:
>>>>>> 1. Flash latest Raspberry Pi OS (32 bit) on SD card
>>>>>> 2. Build Kernel from repo above with arm/multi_v7_defconfig
>>>>>> 3. Replace Kernel, modules + DTB on SD card with build ones
>>>>>> 4. add the following to confix.txt
>>>>>> device_tree=3Dbcm2837-rpi-3-b-plus.dtb
>>>>>> enable_uart=3D1
>>>>>> 5. change/add the following to cmdline.txt
>>>>>> console=3DttyS1,115200
>>>>>> no_console_suspend=3D1
>>>>>> 6. connect the following devices to Raspberry Pi 3 B+ :
>>>>>> USB mouse
>>>>>> USB keyboard
>>>>>> HDMI monitor
>>>>>> Debug UART adapter (USB side to PC)
>>>>>> 7. Power on board and boot into X11
>>>>>> 8. Change to root
>>>>>> 9. Enable wakeup for ttyS1
>>>>> So I remember for next time
>>>>> echo enabled > /sys/class/tty/ttyS1/power/wakeup
>>>>>
>>>>>> 10. Trigger suspend to idle via X11 (echo freeze > /sys/power/state=
)
>>>>>> 11. Wakeup Raspberry Pi via Debug UART
>>>>> I don't get the error you are seeing, but I also don't get the displ=
ay resuming.
>>>>> pm has obviously killed the power to the HDMI block, and it has the
>>>>> reset values in as can be seen via /sys/kernel/debug/dri/0/hdmi_regs=
.
>>>>> Nothing in the driver restores these registers, and I'm not sure if =
it
>>>>> is meant to do so.
>>>>> Run kmstest or similar from this state and the change of mode
>>>>> reprogrammes the blocks so we get the display back again.
>>>>>
>>>>> I've also enabled CONFIG_DRM_LOAD_EDID_FIRMWARE so that I can use yo=
ur
>>>>> EDID, and get the same results.
>>>>>
>>>>> Knee-capping the HDMI block on suspend seems an unlikely mechanism t=
o
>>>>> work reliably. On the more recent Pis there is a need to be quite
>>>>> careful in disabling the pipeline to avoid getting data stuck in
>>>>> FIFOs.
>>>>> I feel I must be missing something here.
>>>> I think we're probably missing calls to drm_mode_config_helper_suspen=
d and
>>>> drm_mode_config_helper_resume.
>>> Okay, i tried this and it works better (HDMI resumes fast), but it als=
o
>>> triggers a lot of WARN
>> vc4_plane_reset deviates from the helper there:
>> https://elixir.bootlin.com/linux/v6.11.3/source/drivers/gpu/drm/drm_ato=
mic_state_helper.c#L326
>>
>> We should adjust it.
> Yes, it looks like that WARN is inappropriate, and we should be
> freeing the old state.
>
>>> and the "doesn't support RGB ..." warnings are still there.
>>>
>>> I pushed my changes to the branch and attached the dmesg output.
>> I can't help you there, it doesn't make sense to me. The EDID should be=
 correct.
> Nor can I. I've just taken the latest branch and HDMI does resume
> correctly after suspend now.
No problem. At the end I just wanted to know if the warning was related
to the problem that HDMI doesn't resume. Now it's clear these are not
related and I can investigate further.
> We have seen monitors that do weird things on HPD when they stop
> getting video and go into standby mode, so I wonder if that is the
> case with your monitor.
>
> I do wonder if the HDMI part of the display is the correct place to
> handle drm_mode_config_helper_[suspend|resume]. All other users seem
> to do it at the base DRM driver level, which would be vc4_drv.c.
> I've done that and pushed it to
> https://github.com/6by9/linux/tree/lategoodbye-suspend. That also
> works for me without your changes to the HDMI side. That branch also
> includes the above fix to vc4_plane_reset too.
Yes, that's a better place. Nice, thank you.
>
>    Dave


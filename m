Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023529B043A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 15:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3549810EAE9;
	Fri, 25 Oct 2024 13:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="swONQJqA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8F210EAE9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 13:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1729863377; x=1730468177; i=wahrenst@gmx.net;
 bh=AJrydCaB99f+grIRdU4DaIFxpu6SXn8XXWVpLV0NVao=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=swONQJqABszjn0Ct/9fTAxn72NG2GX6+XFOuswzIUS6tiBajjWMDCdfAh2ArQT1f
 /nqM1mlSlBfPBNWBJrSCQFbcVB+TSrn1+6g6wv4p1UGnNgnvAwoh70Q7zPwFwY/2g
 YktyriBRyvlidykmYY9TuqA0fELdqqdKrsk70UxWC3eBmY7TqvnlCUalR8igjkFqI
 ad1okDAUrSvQl6OXSNvsv/Pvf9+PYD+TkbsNHniuX3iTwz4YjaautMPqRDUY+rIyP
 ja+4SnGPEG4L8kgkXkNeEwfXarffSQa6W1kPYDjEqzH6jSC6zH+cuw+8JrbRN8zjB
 emYYk+ryUAUfW1Hw4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRMs-1tTiZg3mNo-00XK1k; Fri, 25
 Oct 2024 15:36:16 +0200
Message-ID: <5799c03b-19d6-4791-9fef-1538ecd9a4be@gmx.net>
Date: Fri, 25 Oct 2024 15:36:16 +0200
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
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAPY8ntA+adGy3kkDnGUd1REpMc0f5zQD-9HPDTQfd6KUaUSfNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:35g1nVYRP8+6ZbZZKe7A5ivJwgh/3iIPHEer+ARvxtU+QhJINIK
 VycNTR8ynRh3dANdE6fXJXuOzrWaHqcybtbOmLg6tHnzKJP+yV7QMQ6D0gNGeJiYyEVZI1m
 2RzO9YGRmrCLBt200XsSFdRUgUuNUtGUDa6xrMw4UtJmKgJDgZ84wlhogfomoWiwNaq1Msy
 fNZlL8BX00WvW0lP6eqbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XMqq020Mf9A=;87RDrzP3lkVpGfp7OITxsthVq7U
 iKwe0GJb+q5nQk1jvQbn0xpNUzqJD0c7jBgpAdFl213lvVpHIPIVdEhFq7PWpR/VK6Dn7AmBA
 p8J6YTUlS8LQb/pY/9Dr7aHvH60M75Umq5+eOQ/tXWJGiGXgpOEX2mwnBuLZ/z0Brx0Xi/qZz
 dIp9BpFfB0Yjl0NWItsNzjzbV8uDkMw/6Xzs89NjMCGCgKGjAIMzVjCXFLiCr5Iuk5i2gQw+5
 lIIMdyB+VqxCXwgMrwUiFA+Tud5ZeEn6CcYheYMAIJms4DXfWZcOUuc+ldwX+J58oFuEmUxcL
 PKZk4vr21cmwa3B9nqqh1D6q9S1GjMnAMKBNC1HtnWD1qFv/Xby280CGzzwvsh3GOPA9lbo5x
 elyGB454oobb00L/0RitWS501DdekN/X6PBud2S19CUWssMSz8lL61ApLndP+tedR2g4QvAEP
 Zt/2y3F6bNUomVsoBWbhgw7IX+8yhbiNx2FnkzxFUSRZ8MLqAlB1zBReQTMwP/7MxmA+CcsuR
 6+TeG/DgokTf8S6gmhg7hfNv+nJDIGcBtXFGpLo+ypbbPziHVDyIcmE16bwNlNsxja63WfstU
 9ExCooILF5kdjNlWSP0K7T8ageoypBtK9c9A+iXcG5LHmbphQErTVo4PMtxOmC+/Tl1OjJyqV
 A3NmqSg5PwU/MCncu/F3f+geYr7GX1nRKvaLDap2gvMtWC60DtvfBOBZsbPBvRxyRIY6g+dXT
 +41mnFBFgtZ/99FpxitZnx7RFIbiys7nZFoHfoXa4Gp5YfmTQDtM/RPdaM9MMAZxLkIgz8MHs
 FA+Y6F7duwes0VagfN807KqWGkx2GCWM9c1Sjfre0bILo=
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

Am 23.10.24 um 17:22 schrieb Dave Stevenson:
> On Sat, 19 Oct 2024 at 10:34, Stefan Wahren <wahrenst@gmx.net> wrote:
>> Hi,
>>
>> Am 17.10.24 um 17:59 schrieb Maxime Ripard:
>>> On Thu, Oct 17, 2024 at 05:26:46PM GMT, Stefan Wahren wrote:
>>>> Am 17.10.24 um 16:27 schrieb Maxime Ripard:
>>>>> On Wed, Oct 16, 2024 at 07:16:43PM GMT, Dave Stevenson wrote:
>>>>>> Hi Stefan
>>>>>>
>>>>>> On Tue, 15 Oct 2024 at 22:13, Stefan Wahren <wahrenst@gmx.net> wrot=
e:
>>>>>>> Hi Dave,
>>>> ...
>>>>>>> i prepared a branch for you, which contains the latest suspend2idl=
e patches:
>>>>>>>
>>>>>>> https://github.com/lategoodbye/linux-dev/commits/v6.12-pm/
>>>>>>>
>>>>>>> Steps:
>>>>>>> 1. Flash latest Raspberry Pi OS (32 bit) on SD card
>>>>>>> 2. Build Kernel from repo above with arm/multi_v7_defconfig
>>>>>>> 3. Replace Kernel, modules + DTB on SD card with build ones
>>>>>>> 4. add the following to confix.txt
>>>>>>> device_tree=3Dbcm2837-rpi-3-b-plus.dtb
>>>>>>> enable_uart=3D1
>>>>>>> 5. change/add the following to cmdline.txt
>>>>>>> console=3DttyS1,115200
>>>>>>> no_console_suspend=3D1
>>>>>>> 6. connect the following devices to Raspberry Pi 3 B+ :
>>>>>>> USB mouse
>>>>>>> USB keyboard
>>>>>>> HDMI monitor
>>>>>>> Debug UART adapter (USB side to PC)
>>>>>>> 7. Power on board and boot into X11
>>>>>>> 8. Change to root
>>>>>>> 9. Enable wakeup for ttyS1
>>>>>> So I remember for next time
>>>>>> echo enabled > /sys/class/tty/ttyS1/power/wakeup
>>>>>>
>>>>>>> 10. Trigger suspend to idle via X11 (echo freeze > /sys/power/stat=
e)
>>>>>>> 11. Wakeup Raspberry Pi via Debug UART
>>>>>> I don't get the error you are seeing, but I also don't get the disp=
lay resuming.
>>>>>> pm has obviously killed the power to the HDMI block, and it has the
>>>>>> reset values in as can be seen via /sys/kernel/debug/dri/0/hdmi_reg=
s.
>>>>>> Nothing in the driver restores these registers, and I'm not sure if=
 it
>>>>>> is meant to do so.
>>>>>> Run kmstest or similar from this state and the change of mode
>>>>>> reprogrammes the blocks so we get the display back again.
>>>>>>
>>>>>> I've also enabled CONFIG_DRM_LOAD_EDID_FIRMWARE so that I can use y=
our
>>>>>> EDID, and get the same results.
>>>>>>
>>>>>> Knee-capping the HDMI block on suspend seems an unlikely mechanism =
to
>>>>>> work reliably. On the more recent Pis there is a need to be quite
>>>>>> careful in disabling the pipeline to avoid getting data stuck in
>>>>>> FIFOs.
>>>>>> I feel I must be missing something here.
>>>>> I think we're probably missing calls to drm_mode_config_helper_suspe=
nd and
>>>>> drm_mode_config_helper_resume.
>>>> Okay, i tried this and it works better (HDMI resumes fast), but it al=
so
>>>> triggers a lot of WARN
>>> vc4_plane_reset deviates from the helper there:
>>> https://elixir.bootlin.com/linux/v6.11.3/source/drivers/gpu/drm/drm_at=
omic_state_helper.c#L326
>>>
>>> We should adjust it.
>>>
>>>> and the "doesn't support RGB ..." warnings are still there.
>>>>
>>>> I pushed my changes to the branch and attached the dmesg output.
>>> I can't help you there, it doesn't make sense to me. The EDID should b=
e correct.
>> Maybe I should clarify that I provided the EDID from the X11 log during
>> normal boot (good case). I wasn't aware how to dump the EDID during the
>> suspend.
>>
>> I tested with the new branch and these warning doesn't always occurs
>> during resume. So it seems to be timing related.
>>
>> AFAIU the EDID is read via I2C DDC and the attached clock in this case
>> is VPU clock. Correct?
> Yes. It's derived from the core clock, which is often referred to as
> the VPU clock.
>
>> So I added the following to the config.txt
>>
>> force_turbo=3D1
>>
>> After that I wasn't able to reproduce these HDMI Sink warnings.
>>
>> Is it possible that the I2C data get corrupted by VPU clock changes?
> It shouldn't, but that doesn't mean that the monitor doesn't like the
> clock change. It should never exceed the 100kHz rate that the HDMI/DVI
> spec states (HDMI v1.4 spec section 8.4.1).
>
> If you set drm module parameter "debug" to 0x04, then DRM should log
> the hotplug handling and EDID parsing in the kernel log.
> The HDMI spec does say that the HDMI sink (ie monitor) can clock
> stretch the DDC transaction. It doesn't state a maximum amount of time
> that it can stretch for, and most I2C drivers will time out
> transactions after some period. The DRM logging would probably show
> something under these conditions though.
I reproduced it with drm.debug=3D0x4 [1]. The issue occured 3 times after
216.395170.

Not sure this is helpful.

Best regards

[1] - https://pastebin.com/TCPqXmpa
>
>    Dave


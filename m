Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC46899F8C7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 23:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B811C10E60B;
	Tue, 15 Oct 2024 21:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Rp/1SS2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F4C10E60B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 21:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1729026796; x=1729631596; i=wahrenst@gmx.net;
 bh=/e74bZ/NlPCgkomGfxZLdtQsG1eKiA1eSre5e32sLhA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Rp/1SS2Jcs/2nnBzbdjJxh5tdPrP9AvPNLUzbf2WPS/f7coiMT9xNnczGRASrn4L
 5wrjuu4tMuXGJMlofSvngXuR/UAoQg/xBZXuRqnsHMm8RYKthos2jDF1dNHBwaQeh
 BqQWV084b6GSQ7ue3Xb/BX+X95gGr7r9h+oa7g1Yn9+yA+chJ3A5/dlZ3qsDZweuQ
 wv4DUKLowcoKkj3NlslYz20uNRxKkNhhktlX+zG57/flU7j+zkwZiBe5OyxHoEex/
 uGzO90xSFyGVNu4j/IzoMm5hj6taKb0+1GDmmuS+PL6PuznDECk1rkLmgt2HZXn65
 pB3bTuF2Y4XCmDGZuA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4QsY-1tyavy01WY-011SKh; Tue, 15
 Oct 2024 23:13:16 +0200
Message-ID: <6465bac6-9841-4f38-b9e1-48e236ada910@gmx.net>
Date: Tue, 15 Oct 2024 23:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, DRI Development <dri-devel@lists.freedesktop.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <c657d3e9-e4fb-4dac-a611-45655511e500@gmx.net>
 <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
 <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
 <20241014-warm-savvy-wrasse-ed984e@houat>
 <CAPY8ntAFzT4uBT47kDnDjEcSZXLonV-n_ixZ6L1_LAcfQPwS8Q@mail.gmail.com>
 <17f8f497-1238-4555-824b-b5a3fb699a98@gmx.net>
 <CAPY8ntBegA_L58s30F4FSO+=q78Xt5XA4kvYq38zAvsgR2DSrQ@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAPY8ntBegA_L58s30F4FSO+=q78Xt5XA4kvYq38zAvsgR2DSrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:8ArwsUbxE3ysiEQQ5Fck/7Qypw/+xCzR+HccvoebA2yFMLyWfIy
 LGAf6MeL2GcRTXA9I2tqZrFlU6KAnanx9BKwG0NmzyEvhLb5SR1GqZUrcehy/3eBm9/W8EP
 MQzd4SK5LTvdF1BT4i3ihF8ldArhAWS1KlOhXWdmi+0snmPsceaHJHFCHNIcFDaJSjBrm1s
 /+Nkd1OPc532RV8zO8HDw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:js8jyk8ql8k=;Mmeh+15nbErSWTKUooQPYoOkj3t
 zILXQqETYOLH7QkQVEhy6S9Eftezeb27e8cNokOpUz5D7AB2BGaE4BTrqwuXPCZreZaPrFMwR
 WTvKCXCSgmYqqtLpAnQCHGY4bY06hTswjVPwrVmo1UStkw51U8fnbI7Ty59oMp7KhVvoZCGlu
 0P2RPM+y/RhMDchchPI4trCu0zkEsRslq/VxjX5vc/cGetYwgaPNgUEMoFlj9kPI+X1g0wiS5
 BvdCHAfEVfKvKCzW1gt5ViVNvzkpn8tUsZrF3qHwup+9W9Jp3ti8/CX7dDhk/CCdeots0SuTM
 qET5T/pcpvb3n+d5EWW9+H/QW7+iQXh05GOSnhOGKMi4Il5o0Dx+lqzQFcmtNMPymepizvBWW
 BjmBOS8pRM1lYVwFjp+8jty4NGhoakK8VNMBZYcGHt2R4nqTTkLANs9awpNTL51pfQS3RQ2qC
 uy+s8vWlOkZemrOENsoJVy53dbPo+2Iu7+cqiG5qWJludLx4arMUvQcSvnBy+fnr8Z0ybcI2m
 lS6uTiY+5xNYRPcFQiPGJ3WjBqsuR4Lzt7IHSPZclUzTcTlVe/YkO1xBvBKMWUfaoOqPk98Ea
 Y9rdVa8W3xONT817JgkceJ2Y/3WM+cptPsK8EwXJlovaa0Fxp5TvksLN6N4vsoBZhoNSdxiiL
 9/4QsvQC7nUBjPc4KBpCMU06crYyZfln4+UlgJJ1O/DAGXdo87gM0DDuDGqeTzrVx18C1nx3B
 Oe3RrC5WZm4Wxxx/Vjg8WQ0DfSu5duTTP7mkYdI/tu8pq7tg697UxryjtA6s5NsNgtnx4GLH2
 cBu0C00PwiczLI0vjilOyTUw==
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

Am 15.10.24 um 11:32 schrieb Dave Stevenson:
> On Mon, 14 Oct 2024 at 22:16, Stefan Wahren <wahrenst@gmx.net> wrote:
>>
>> Am 14.10.24 um 12:54 schrieb Dave Stevenson:
>>> On Mon, 14 Oct 2024 at 10:04, Maxime Ripard <mripard@kernel.org> wrote:
>>>> Hi,
>>>>
>>>> On Sun, Oct 13, 2024 at 09:57:58PM GMT, Stefan Wahren wrote:
>>>>> Am 13.10.24 um 21:11 schrieb Dave Stevenson:
>>>>>> Hi Stefan.
>>>>>>
>>>>>> On Sun, 13 Oct 2024, 18:19 Stefan Wahren, <wahrenst@gmx.net> wrote:
>>>>>>
>>>>>>       Hi,
>>>>>>
>>>>>>       i recently switch for my suspend2idle tests from Raspberry Pi Bullseye
>>>>>>       to Bookworm. After that testing suspend2idle shows a new warning
>>>>>>       which i
>>>>>>       never saw before:
>>>>>>
>>>>>>       HDMI Sink doesn't support RGB, something's wrong.
>>>>>>
>>>>>>
>>>>>> Can you provide the edid of your display please?
>> ...
>>>>>
>>>>> The failure is coming from sink_supports_format_bpc()[1], but the flag
>>>>> for DRM_COLOR_FORMAT_RGB444 should have been set from
>>>>> update_display_info()[2] parsing the EDID.
>>>>>
>>>>> Loading that EDID in via drm.edid_firmware has given me a console at
>>>>> 1920x1200@60 without any issues, so I'm a little confused as to what
>>>>> is going on.
>> Since this warning only occurs on resume and not during normal boot, i
>> would assume there is no issue with EDID. Maybe the flag get lost. I
>> should have mention that X11 doesn't recover in this case and the
>> display stays black.
> Ah, I hadn't realised you meant it was only on resume that it didn't
> come back up.
>
> I suspect you're right that the state gets lost somehow. It may be
> triggered by the returning of connector_status_unknown on the
> connector, but haven't traced it back.
>
> If I pick up your patches, what do I need to add to replicate this?
i prepared a branch for you, which contains the latest suspend2idle patches:

https://github.com/lategoodbye/linux-dev/commits/v6.12-pm/

Steps:
1. Flash latest Raspberry Pi OS (32 bit) on SD card
2. Build Kernel from repo above with arm/multi_v7_defconfig
3. Replace Kernel, modules + DTB on SD card with build ones
4. add the following to confix.txt
device_tree=bcm2837-rpi-3-b-plus.dtb
enable_uart=1
5. change/add the following to cmdline.txt
console=ttyS1,115200
no_console_suspend=1
6. connect the following devices to Raspberry Pi 3 B+ :
USB mouse
USB keyboard
HDMI monitor
Debug UART adapter (USB side to PC)
7. Power on board and boot into X11
8. Change to root
9. Enable wakeup for ttyS1
10. Trigger suspend to idle via X11 (echo freeze > /sys/power/state)
11. Wakeup Raspberry Pi via Debug UART

Regards

>
>    Dave


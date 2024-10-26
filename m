Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F09B186B
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 15:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564A010E0ED;
	Sat, 26 Oct 2024 13:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="dGgFuuMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 71961 seconds by postgrey-1.36 at gabe;
 Sat, 26 Oct 2024 13:11:51 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9B310E0ED
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 13:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1729948299; x=1730553099; i=wahrenst@gmx.net;
 bh=+C0+DWgWHGo6MxZQ0NDRf+VMVtxv++sq+3dak5lj21o=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
 Cc:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dGgFuuMO1mXTUnlPmZszosh9F2FYEHdkP5xXgjan5d3fhMO/eu3ksdfoKV8TwVIh
 /dJ6zxDLMjWwKBKfiL+DHJkyRVQ+IBNhBBWRNYssibx2W5hSBDTKhh6Rzs73abB2G
 uVq4y69nik01iUbPqHYX1TzgJoQ2at3eTcotw2+HEY907dz3fOv5Pq88ev+HEFak7
 x4E/mq6/gOTK0GGAkCHAn9mMwbp6xg/liYwloscFK8gUz/JEkwL+xEf8sUpLtejUZ
 78Q3BsMThCgTk1uVJTOgxOLqIdr+EgkH5+EHYFJzHM65lz6aLKmnDtsHOP91UFb+W
 /WsiEemQtWXdztGxgg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3siG-1u42bj1H6m-00vfHF; Sat, 26
 Oct 2024 15:11:39 +0200
Message-ID: <4670e355-b07d-43b1-91b8-4e5a12c36b86@gmx.net>
Date: Sat, 26 Oct 2024 15:11:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Subject: [drm:vc4_hvs_irq_handler [vc4]] *ERROR* HVS underrun
To: Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:faxpEH+oay77q7bBbGR1AHvpGI3744F4IitaOq1lywSBISlloIb
 NmIXeVtLcJ4Ixcbz7p89wr54c2n95ZfQyqZpcbESyYB3KEgCzwKOa9S/z/SAkuyR/R1IMTD
 fCTzrxYnRMy5lq48nFSztx6rbOAWWgQEQbSkH5eO2nH3SzluxIoVsHtdgCrTLJbc7V5n578
 3FVzVAh7dtZuD0ZodC1yg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MFyRX5YpsPI=;NldsRXZqTR7r6Qz2I32aAF6ZJGG
 UYKcLdfd2YG05mvlL0eUo2AeG03srykbj9qjkcLFiZFh5rYvUmyIxFkakuHaXuzQvkIzB/FQM
 x7hoCttay5lLlZSSwKqjbogUu6UTjWX/9qQYUZqRPJttMQZHIUQM6CZSbLbpQKa0EmMWijIQr
 WOB+uaDryL1pLwonvCgbMvTdIjbSNt2/zsoQBNSdFEl7TVrANqjOsp7BqZp52v7aoXfCYmnah
 mjYkCu6HsQPL2w04SG44ROYDY4PouPzhXQ8Ggjdh8nOESDluhqzttDsqihp+4VZTOotadmlAY
 DJO6UrjqVIuUitUSQCeoDyBcXAAIk4VoEpEpRnkYq1Ty63a8qYIBpiMWRmXEiu4GQ0WaCEa9d
 Jy7YAoDsn3Lj7jU+LhlGIRn6QPIZ4uwDwCV7M9vyDYwB089k6qkDTwB7q+7M2Mogzk2lCJhGt
 aJOPe3DjdZ426KkEwF3RUnw4BYTSE9Ikwqd7P6dWTEMEeRiVKaAOc4LD5Qz0sXk7Z7StyTNU9
 BQR8gRtzkZdb2ozVOsn8KZWlGz73xVmhfXUzbZ48svQIAvJf/v7JHeQibSFtdcRabc6qqMKTg
 iDNV8GWegQ7scrQ8W0VJxi1IhUVpkokeikeHq6X8rcaddEy0hHhUiA8gpU3w8/lh5rwppsa7O
 pokIUUvic9jB8MZw8dt2ENqg5i04tBIrHzVmqRUVBQfYl4ZlTaTs6K7cvLoKh28jcjL94TjXQ
 C19VTjmNp/vvx3g76MccMGD0pzHdxcQw1WiC/uAuoQO9hsVgym37VnGAGfxGRCXbby+2yf+3A
 cMqwO1sMAIR67jjmHV8bNNEA==
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
during the investigations of the recent VC4 HDMI Sink issue [1], I was
able to reproduce another issue with vc4 after s2idle resume. Sometimes
( probability ~ 1 : 30 cases ) I'm able to trigger a HVS underrun and
it's impact is that the HDMI display stays black and unusable:

[ 1790.139465] PM: suspend exit
[ 1790.153998] lan78xx 1-1.1.1:1.0 eth0: Link is Down
[ 1790.548866] vc4-drm soc:gpu: [drm:vc4_hvs_irq_handler [vc4]] *ERROR*
HVS underrun
[ 1794.713952] net_ratelimit: 2 callbacks suppressed

So I need to use the Debug UART after that.

Scenario:

Steps:
1. Flash latest Raspberry Pi OS (32 bit) on SD card
2. Build Kernel from repo [2] which based on Linux 6.12-rc3 above with
arm/multi_v7_defconfig
3. Replace Kernel, modules + DTB on SD card with build ones
4. add the following to confix.txt
device_tree=3Dbcm2837-rpi-3-b-plus.dtb
enable_uart=3D1
5. change/add the following to cmdline.txt
console=3DttyS1,11520 no_console_suspend=3D1
6. connect the following devices to Raspberry Pi 3 B+ :
USB mouse
USB keyboard
Logilink HDMI switch + HDMI monitor
Debug UART adapter (USB side to PC)
7. Power on board and boot into X11
8. Change to root
9. Enable wakeup for ttyS1 ( echo enabled >
/sys/class/tty/ttyS1/power/wakeup )
10. Trigger suspend to idle via X11 (echo freeze > /sys/power/state) 11.
Wakeup Raspberry Pi via Debug UART Currently I don't see a relation to
the VC4 HDMI Sink issue, because this issue occur independently. Until
now i wasn't able to reproduce it without the HDMI Switch. Not sure this
is related but sometimes the cursor is also corrupted with noise after
resume. What can I do to investigate this further?
[1] -
https://lore.kernel.org/dri-devel/c657d3e9-e4fb-4dac-a611-45655511e500@gmx=
.net/
[2] - https://github.com/lategoodbye/linux-dev/commits/v6.12-pm_v2/



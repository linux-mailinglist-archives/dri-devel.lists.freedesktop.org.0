Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF569C252F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 19:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0E710EA29;
	Fri,  8 Nov 2024 18:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="W8I5yztC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A327110EA29
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 18:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1731092153; x=1731696953; i=wahrenst@gmx.net;
 bh=9/SLvWGAyxFC32/zVLdy6ljB+T2Vjo3xqffNXr6GlC0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=W8I5yztCfW8RqIH+38LMDZtXdTI2CROR73QKtfm6FtlOkH/Mbd7/DqAU+aj8dpvn
 Bzk4n3iPVs57aPOZ5+t0E762he2gMQizqUsPHSmSX+PLPpgKXhAI7xAm+wSZtPQL6
 aiVBjdHXsPb1+5o3dNnf4uFKiwMjRpnzfnAuSyCm+t1/SjDm44aq5Z/puAkrb5i1Q
 VO5CQ0AjI7+HCwks0dqzYY0YYwM/iES32ZCT0tRzJ5L2tz5UKbjjIE294KuktqMYo
 tb0bQYAQvQmeHswTzCFDr7n6T9Qof4LlaCE3CGYjEZ4retJuHp8MpoW0dlN1nQNHe
 9g5T1KiPiMM2QbOq5Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mel7v-1thzYK2lBl-00pbSe; Fri, 08
 Nov 2024 19:55:53 +0100
Message-ID: <5ce22452-a13b-4ed4-ae5c-b631c6271ed8@gmx.net>
Date: Fri, 8 Nov 2024 19:55:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [drm:vc4_hvs_irq_handler [vc4]] *ERROR* HVS underrun
From: Stefan Wahren <wahrenst@gmx.net>
To: Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
References: <4670e355-b07d-43b1-91b8-4e5a12c36b86@gmx.net>
Content-Language: en-US
In-Reply-To: <4670e355-b07d-43b1-91b8-4e5a12c36b86@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AWl4jBckiZI53xZ49W33Dqig/yYEZttU9YlusL4q6Y4mxTc/oaQ
 beZuvwZ8+YuHQ9sUsJiByoOZqKKnJqZNstA0fZWoHQI0vSap6VIm7nB2JogcXGivLh1iPWe
 xc1xpl7RRKnRk2Id+PVXBqeJaIPn4PTuWzGawvpFXtl6u/DRcimRgUM570zAgRVIEMR9hdl
 Kbjcviql3nhyXmE/3/blQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EJmnKe75Vq0=;pGtS+Aai/AgT+4zwa5aXZSzWUA7
 C5YxDKbC8gN7NmIO1++jK8ZpkVWGLminpKkQUt2CnXGZ63HPyy+en5xyuRbhcV6d9143F2/dR
 VNVEv1qZWAwHz9y4u3phcKreKbCeqsyOOfzkX/QSqWOX4uy5fA6qpLey0yv/tOMknqPB3oPnB
 weVMKnBqrBiI40s7FL9JVw6sJUAkp7izXkA+NO10lVSa87SixXoQnSR0pgomJPLROUQscz402
 NbWd7GCMoFdAHrPBD2KXjO2KCQhucmj/lPUBPGi2G36S4WWWNkoPRJzT8F+j0wOnGbQPG3t3k
 Qus9DhC1JgFWAwjPfacuDCug/TAcrYe9T7NOpIfHR5ek91VzZGBMWvijD1SEep04jyZc0gs7a
 EB6wqw8USsyIg/5u3vJMCsAdHdOzeK2f61W21rWlAuUA1csdvTrfUktKi46DXiCczGPa7dLG6
 rxzKO4W3bHFj44xJjNmFFT/i/A4vRLZgcl5k8qM6QVY1mIbxgyUuICh4ereeWQommPKbqb9Bm
 ooDkQMYhLrPRvolZvEjPvuteibRCwfu6vSWG03qxUuIK1B5xlZaHC0fT9NeUSyezoWdbwHQdQ
 djlqr2ufPF3NJfPvHla9RrxSd17cqkvdL1EoIATEBTD0Mpa1kNxC9Nlo0KsGulRqToUfOuh63
 cYR0MHKCxu6IBupCC3q2PLEJvOXQvCwVrlLZqpVm5z3c4Vydzf8nmicMqQMVk4p2Y6kKyZe3z
 imcEvKLYxAkZHtEMXUNAaT/PadwnVXu9PXA+R2Z6S942DkxxsAGulf8/CDSdpAW9mu67CCBEk
 oxjzoMaBiIpd2u2UaGTjmhmpHPliNYXyelKxTp0yqJu48RkSys8rHQc8tQyHcEAL7DWXzwz9U
 38Kd0FhDrkbd2reF19B9eQhrqB9dCAh39kP/0vYTNeh19EFD7u0RQ/rVC
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

Am 26.10.24 um 15:11 schrieb Stefan Wahren:
> Hi,
> during the investigations of the recent VC4 HDMI Sink issue [1], I was
> able to reproduce another issue with vc4 after s2idle resume.
> Sometimes ( probability ~ 1 : 30 cases ) I'm able to trigger a HVS
> underrun and it's impact is that the HDMI display stays black and
> unusable:
>
> [ 1790.139465] PM: suspend exit
> [ 1790.153998] lan78xx 1-1.1.1:1.0 eth0: Link is Down
> [ 1790.548866] vc4-drm soc:gpu: [drm:vc4_hvs_irq_handler [vc4]]
> *ERROR* HVS underrun
> [ 1794.713952] net_ratelimit: 2 callbacks suppressed
>
> So I need to use the Debug UART after that.
gentle ping ...
>
> Scenario:
>
> Steps:
> 1. Flash latest Raspberry Pi OS (32 bit) on SD card
> 2. Build Kernel from repo [2] which based on Linux 6.12-rc3 above with
> arm/multi_v7_defconfig
> 3. Replace Kernel, modules + DTB on SD card with build ones
> 4. add the following to confix.txt
> device_tree=3Dbcm2837-rpi-3-b-plus.dtb
> enable_uart=3D1
> 5. change/add the following to cmdline.txt
> console=3DttyS1,11520 no_console_suspend=3D1
> 6. connect the following devices to Raspberry Pi 3 B+ :
> USB mouse
> USB keyboard
> Logilink HDMI switch + HDMI monitor
> Debug UART adapter (USB side to PC)
> 7. Power on board and boot into X11
> 8. Change to root
> 9. Enable wakeup for ttyS1 ( echo enabled >
> /sys/class/tty/ttyS1/power/wakeup )
> 10. Trigger suspend to idle via X11 (echo freeze > /sys/power/state)
> 11. Wakeup Raspberry Pi via Debug UART Currently I don't see a
> relation to the VC4 HDMI Sink issue, because this issue occur
> independently. Until now i wasn't able to reproduce it without the
> HDMI Switch. Not sure this is related but sometimes the cursor is also
> corrupted with noise after resume. What can I do to investigate this
> further?
> [1] -
> https://lore.kernel.org/dri-devel/c657d3e9-e4fb-4dac-a611-45655511e500@g=
mx.net/
> [2] - https://github.com/lategoodbye/linux-dev/commits/v6.12-pm_v2/
>
>


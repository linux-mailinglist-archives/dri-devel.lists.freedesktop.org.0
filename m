Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374399BA84
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 19:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E910010E170;
	Sun, 13 Oct 2024 17:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="BZt1uDhg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8647110E170
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 17:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1728839974; x=1729444774; i=wahrenst@gmx.net;
 bh=6vAjGeEU5+46BUCaF/d178gV4XisoGEvU2GrBtOPnYo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
 Subject:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BZt1uDhg/sOQxvBMpOW/jBfdBx0+JTX0C/0GenK7tZzq6NL4etgy4F81Eb87Aqja
 QTIsDJ3DTPIrqEm9JwZ3RtP5t7tHnV3UtjtwyPkmF1IL0iwY0GAN2YezeQr1gZFPE
 /Dzn9PVrt3X4vWiz4wBbaSQAfHixXUDfWIMFGHKz4qHfARqYuE5VaBrl5Qd//rRhm
 4ANEGfnEdNNtlK5Ro6n7JI9it0fYJb2zc0qa0b9QwvEp0Q8sYUlt9QfqRRLtlRFHP
 p7tJAkjnMCwpDGPnsU+heTvn63grfSKOMKjLnnlyBITImXWBLIRgw5S5ppO8epBLR
 uc1Slt4iyqqweDLsVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuUnA-1trai40IpW-00vJhJ; Sun, 13
 Oct 2024 19:19:34 +0200
Message-ID: <c657d3e9-e4fb-4dac-a611-45655511e500@gmx.net>
Date: Sun, 13 Oct 2024 19:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 kernel-list@raspberrypi.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>
From: Stefan Wahren <wahrenst@gmx.net>
Subject: vc4: HDMI Sink doesn't support RGB, something's wrong.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nf4QyGlkqVZNJQmMdwnziBrvhD7f57r0EpN/TmDlSRjXKzVHCx1
 w+JIIGmfbMqMNUk5o4FI+1+8jOj/PIjXcjFq3VS9zj215c1rmjtwnhp8eIvwe7kRbyz1cmy
 Lfl25tectHTTAgREPiSnfwLdt1dD6GEqyWfPaBiiodf2PEAvlGSO6yPUw6lDC0VmgeBjb6N
 thiQQKBpplcPYQVxB6aMg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vZC3Demi7rw=;sG0ZlwO8/wnU/mMzDoVo8s0NbZR
 EBUOZd73gw1hEW9gwssv/5Xl9MgO0VkfIezntkporaXd2wkIYwUO8ErRTKLbMB6h8K4UA3ZKy
 tzNMb2L+H+M2B9rysUETzQC3Z+gJFTbWELHNZkxOcq5/GQ+dSJvsvNhY++dyC4+kBs2lPr5z8
 E4TGnkoy3uvuEKX5pnov9hxfU2+DD29DrDt4zkXgdO24DD18/cdfm7RNM8idmrAoNCCcINzkm
 t1j10KmhOas2QUZo1hiugmtdytuMD22CQUM6o6wr3EntmIhvJt6hl9wIvc+mAKW2hTq32MLa1
 Rnng4U2X+Mp2/EuRokE2e0YjvelqFaldiHdFE7UTHY4hF9IH2Kanz18ODbf8X//hEad0jggXY
 pbsgcDMA1Ny5RYXRtXUGHwtk5UwgSXE9B27ZfyJO+e/M7NXrmXVCyItt6q52k3jUnd3E4G2iv
 s93umKw8nS+Nhr0rDbdohGNrvR6ieoYB8Lm/i732siDfXUm8NaD7874unm6J8xCVoR2fhWy4K
 N+77EVzAI4SZQYSOfGe0+lSq/P0mkiJOA2jJHm/F0OJmVTMbsAH8EMF/Y6+Ix+x4ndSEEQ1MV
 CVkNVZpMYKS5I/9mUnXu/6YAM3INATIcXBlewS4LZzzbH4+1VLMIvDnvNELxyDlLuvuxfaEhp
 sWvBkKApjJ5UGV6gkm+WtqCMofZCAeYEVcrsrthxl8Xdoz95tJNjEaG4gNg5HYD/1jdnFvdhT
 3ZX3EqemF+15NAHnuLwGpjbhvnWQeZy1OzDkhSC2Cs7l60EJH6w4bi4/areDkX/Z/ClAw3Dwx
 byJh7NXzwgptLPIiT40jfwzA==
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

i recently switch for my suspend2idle tests from Raspberry Pi Bullseye
to Bookworm. After that testing suspend2idle shows a new warning which i
never saw before:

HDMI Sink doesn't support RGB, something's wrong.

Platform: Raspberry Pi 3 B+
Kernel: 6.12-rc1
Kernel config: arm/multi_v7_defconfig

I applied this downstream patch [1], but this doesn't help. Any ideas?


[1] -
https://github.com/raspberrypi/linux/commit/2559eae8cf2c060c7bb87320979207=
7f20414fac

[=C2=A0 272.263134] PM: suspend entry (s2idle)
[=C2=A0 272.983317] Filesystems sync: 0.720 seconds
[=C2=A0 273.248665] Freezing user space processes
[=C2=A0 273.250547] Freezing user space processes completed (elapsed 0.001
seconds)
[=C2=A0 273.250574] OOM killer disabled.
[=C2=A0 273.250579] Freezing remaining freezable tasks
[=C2=A0 273.251774] Freezing remaining freezable tasks completed (elapsed
0.001 seconds)
[=C2=A0 274.267355] ieee80211 phy0: brcmf_fil_cmd_data: bus is down. we ha=
ve
nothing to do.
[=C2=A0 274.267372] ieee80211 phy0: brcmf_cfg80211_get_tx_power: error (-5=
)
[=C2=A0 290.989948] brcmfmac: brcmf_fw_alloc_request: using
brcm/brcmfmac43455-sdio for chip BCM4345/6
[=C2=A0 291.127611] brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob
available (err=3D-2)
[=C2=A0 291.127974] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 w=
l0:
Apr 15 2021 03:03:20 version 7.45.234 (4ca95bb CY) FWID 01-996384e2
[=C2=A0 291.193655] OOM killer enabled.
[=C2=A0 291.193674] Restarting tasks ... done.
[=C2=A0 291.195010] random: crng reseeded on system resumption
[=C2=A0 291.203671] PM: suspend exit
[=C2=A0 291.209085] lan78xx 1-1.1.1:1.0 eth0: Link is Down
[=C2=A0 291.243499] vc4-drm soc:gpu: [drm] HDMI Sink doesn't support RGB,
something's wrong.
[=C2=A0 291.270561] vc4-drm soc:gpu: [drm] HDMI Sink doesn't support RGB,
something's wrong.
[=C2=A0 291.336887] vc4-drm soc:gpu: [drm] HDMI Sink doesn't support RGB,
something's wrong.
[=C2=A0 293.637295] lan78xx 1-1.1.1:1.0 eth0: Link is Up - 1Gbps/Full - fl=
ow
control rx/tx

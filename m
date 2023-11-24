Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D6F7F7714
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 16:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD54210E7FB;
	Fri, 24 Nov 2023 15:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 341 seconds by postgrey-1.36 at gabe;
 Fri, 24 Nov 2023 15:00:49 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B206D10E7FB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 15:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1700838047; x=1701442847; i=wahrenst@gmx.net;
 bh=MGJoLdIJ4b3gS02fNyae9jTdxCk07HvijAvt2pTRhQ4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=ZLh6xTZPzQGRNt6r3EfFNyi6xdXY08j1AgJ3OXPOsqWwWXoDgupuxPj4/TY7BuKA
 +Rk0cwYizzkwLV+C+UvjrdJ1G/gKK+oJl45psIby36RrFrT6AJhqgsMvg3L0hEf5f
 4MSP7IMPTtBhC/hh4I0q2izcKFFu5W7Ls6Xq8m80OaMYlNkK0WmjDsvOHyN4K7C+g
 s3tWt1LuVS/RwhMyJEa1mrwewN1HgIzsGExPIB6QNsghx5gXYGAPQri0PY0Xtr9Uy
 JLxjxyiPC625GKc72U6LV/TWqjKTZ9bks0UkLKP4V6Kd1YUyZIRW+kKKTtMWL7vWa
 R0QHqHeSTXv9ADQXFg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1ML9uU-1qpYxF1cyg-00IBn6; Fri, 24
 Nov 2023 15:54:35 +0100
Message-ID: <dab03c60-caa9-47e3-9dac-fa499227b67b@gmx.net>
Date: Fri, 24 Nov 2023 15:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Add waveshare 7inch touchscreen panel support
Content-Language: en-US
To: Shengyang Chen <shengyang.chen@starfivetech.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20231124104451.44271-1-shengyang.chen@starfivetech.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231124104451.44271-1-shengyang.chen@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XPJgdC3RB9K5a7xfMbmwhaguntSiG+JsdR8ThSlBVnEdHH7OlZ6
 GzgaDPFE6LuPGjCIfCnR7UC1WzYCxsice4aPbTwtl4G03axlVTqyJzMMi8gxsFKB93KKgOp
 RX3V7WhFXT1fnfBg/V8IOqPDWlcXnEbOQFOa2tNHhyyr6Za9Phr9eMsq8k7eBK1btzjz+Xb
 XG0HXHVFeOUMidjfTSswA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eug/djeD5wQ=;SXh/q49vW1tB753xmqPCwORTb36
 PVbSE61Rumwn5tB8QmhuFOCkPeVQUUfrCVt0AYtWPBA5GvftEiA53dShiCzeSNgNAavg0Qw4U
 j1B99Ha7ZiiUo1It6ecJ6wL/JyODIaxQ/Gtwcwy4ukh6Apt88BUvS+LOJc3KJkvW+5oAEHU76
 j7NOHxWBXAGxUy4+NG4hR4vra4hnJA8SEqxY9xvEbZ9WRdCWugdvBmsywT2cYNnsXL3obNaDI
 w7CfP+YrogXi4U78TINmtK3T1b4IDAzu/Rvsv7QlVTwAnrlEDq8H6vMXPwvRILhmN8zsZGh6B
 4tCVVBof9TaEUVmxUOa61GMCDDf1pBdDcmES1QK7KrVT46+iSbxc4ySRmnXLLHJG/OxPfaenc
 jhwHfxPezsw58zwDdFPv7meyvWEKuWgHNuLg2njyVoHdpYrbTqTheVwEZ+5dpz4mO4M8hwJ2p
 FhyOEuJiLrGdjz/DBlTQ/Scuur5xPsEc/ntR+b4ioC8p7cBtLBTob69xbP99s7dDlX4gfbfpM
 ZkOLngo9aK5J1MSXvnQj9D0w0bG/eZZl0bba23NnFX+vIajpukKH2l2io2EcLLWhwHhrn4Ctx
 NkbkDHB6/UEvACYcvxL73xHnY4OEKxOeP439T0REM4Aq08XTgNUHMdoKlVn+LXLL21attzzKV
 znhdrnr2ofh9kdBpU3+JtdlWUTD/j0xyizV1Y+eZpzLfdC7dRkWHy1oHE45A45DRsiSlbTIaf
 8w4NAMp0YcciE7fwmiLC0wLTyFxT5mU4Pfd0c30LSAjLXtFgTLKzYbz3CYKu7lXSj8avFatNW
 AvcFQ4HE2NfrFQu6q7DgcS3mWLALn33Sdh23ODdB/3+lMyr/srXBD7LWYr6NEpF/5F5xeLrt/
 fLq1Yf3Ym0ioXwE6/PNkS+rnkIn54+rlLa4rrWKj4kK3RueRiC2rY/PG0u/BIgg3SC6CAxg6a
 qsQWxxczkk40q7W5DdV0Dpz8FOE=
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
Cc: thierry.reding@gmail.com, neil.armstrong@linaro.org, conor+dt@kernel.org,
 keith.zhao@starfivetech.com, tzimmermann@suse.de,
 krzysztof.kozlowski+dt@linaro.org, emma@anholt.net, sam@ravnborg.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org, jack.zhu@starfivetech.com,
 robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, florian.fainelli@broadcom.com,
 quic_jesszhan@quicinc.com, changhuang.liang@starfivetech.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Shengyang,

[fix address of Emma]

Am 24.11.23 um 11:44 schrieb Shengyang Chen:
> This patchset adds waveshare 7inch touchscreen panel support
> for the StarFive JH7110 SoC.
>
> Patch 1 add new compatible for the raspberrypi panel driver and its dt-b=
inding.
> Patch 2 add new display mode and new probing process for raspberrypi pan=
el driver.
>
> Waveshare 7inch touchscreen panel is a kind of raspberrypi panel
> which can be drived by raspberrypi panel driver.
>
> The series has been tested on the VisionFive 2 board.
surprisingly i was recently working on the official Raspberry Pi
touchscreen and was able to get it running the new way.

What do i mean with the new way. There is almost nothing special to the
Raspberry Pi touchscreen, so we should try to use/extend existing
components like:

CONFIG_DRM_PANEL_SIMPLE
CONFIG_TOUCHSCREEN_EDT_FT5X06
CONFIG_DRM_TOSHIBA_TC358762

The only special part is the Attiny on the connector PCB which requires:

CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY

So the whole point is to avoid writing monolitic drivers for simple
panel like that.

There is a WIP branch based on top of Linux 6.7-rcX, which should
demonstrate this approach [1]. Unfortunately it is not ready for
upstreaming, but it has been tested on a Raspberry Pi 3 B Plus. Maybe
this is helpful for your case.

Actually i consider panel-raspberrypi-touchscreen.c as a dead end, which
shouldn't be extended.

Btw there are already DT overlays in mainline which seems to use the
Raspberry Pi 7inch panel (without touch function yet) [2].

[1] - https://github.com/lategoodbye/rpi-zero/commits/v6.7-7inch-ts
[2] -
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/ar=
ch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtso?h=3Dv6.6.2=
&id=3D6b4da1354fd81adace0cda448c77d8f2a47d8474

>
> Shengyang Chen (2):
>    dt-bindings: display: panel: raspberrypi: Add compatible property for
>      waveshare 7inch touchscreen panel
>    gpu: drm: panel: raspberrypi: add new display mode and new probing
>      process
>
>   .../panel/raspberrypi,7inch-touchscreen.yaml  |  4 +-
>   .../drm/panel/panel-raspberrypi-touchscreen.c | 99 ++++++++++++++++---
>   2 files changed, 91 insertions(+), 12 deletions(-)
>


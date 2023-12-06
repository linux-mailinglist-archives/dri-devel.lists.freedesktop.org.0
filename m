Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7681F806B1C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 10:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371A010E09B;
	Wed,  6 Dec 2023 09:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9314710E09B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 09:56:44 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id C6B9C24E2B7;
 Wed,  6 Dec 2023 17:56:36 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 6 Dec
 2023 17:56:36 +0800
Received: from [192.168.125.88] (183.27.97.199) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 6 Dec
 2023 17:56:35 +0800
Message-ID: <0447c983-ee90-475e-9356-ad451f32da1d@starfivetech.com>
Date: Wed, 6 Dec 2023 17:53:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Add waveshare 7inch touchscreen panel support
Content-Language: en-US
To: Stefan Wahren <wahrenst@gmx.net>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <20231124104451.44271-1-shengyang.chen@starfivetech.com>
 <dab03c60-caa9-47e3-9dac-fa499227b67b@gmx.net>
From: Shengyang Chen <shengyang.chen@starfivetech.com>
In-Reply-To: <dab03c60-caa9-47e3-9dac-fa499227b67b@gmx.net>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [183.27.97.199]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
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
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org, jack.zhu@starfivetech.com,
 robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, florian.fainelli@broadcom.com,
 quic_jesszhan@quicinc.com, changhuang.liang@starfivetech.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Stefan

Thanks for your comment and review

On 2023/11/24 22:54, Stefan Wahren wrote:
> Hi Shengyang,
>=20
> [fix address of Emma]
>=20
> Am 24.11.23 um 11:44 schrieb Shengyang Chen:
>> This patchset adds waveshare 7inch touchscreen panel support
>> for the StarFive JH7110 SoC.
>>
>> Patch 1 add new compatible for the raspberrypi panel driver and its dt=
-binding.
>> Patch 2 add new display mode and new probing process for raspberrypi p=
anel driver.
>>
>> Waveshare 7inch touchscreen panel is a kind of raspberrypi panel
>> which can be drived by raspberrypi panel driver.
>>
>> The series has been tested on the VisionFive 2 board.
> surprisingly i was recently working on the official Raspberry Pi
> touchscreen and was able to get it running the new way.
>=20
> What do i mean with the new way. There is almost nothing special to the
> Raspberry Pi touchscreen, so we should try to use/extend existing
> components like:
>=20
> CONFIG_DRM_PANEL_SIMPLE
> CONFIG_TOUCHSCREEN_EDT_FT5X06
> CONFIG_DRM_TOSHIBA_TC358762
>=20
> The only special part is the Attiny on the connector PCB which requires=
:
>=20
> CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
>=20
> So the whole point is to avoid writing monolitic drivers for simple
> panel like that.
>=20
> There is a WIP branch based on top of Linux 6.7-rcX, which should
> demonstrate this approach [1]. Unfortunately it is not ready for
> upstreaming, but it has been tested on a Raspberry Pi 3 B Plus. Maybe
> this is helpful for your case.
>=20
> Actually i consider panel-raspberrypi-touchscreen.c as a dead end, whic=
h
> shouldn't be extended.
>=20
> Btw there are already DT overlays in mainline which seems to use the
> Raspberry Pi 7inch panel (without touch function yet) [2].
>=20
> [1] - https://github.com/lategoodbye/rpi-zero/commits/v6.7-7inch-ts
> [2] -
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit=
/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtso?h=3Dv6=
.6.2&id=3D6b4da1354fd81adace0cda448c77d8f2a47d8474
>=20

Thank you very much for your advice. We will try this method before makin=
g new patch.
This method will be used if its verified in our soc.
If there is any problem, we may continue to contact. Thanks a lot.

>>
>> Shengyang Chen (2):
>> =C2=A0=C2=A0 dt-bindings: display: panel: raspberrypi: Add compatible =
property for
>> =C2=A0=C2=A0=C2=A0=C2=A0 waveshare 7inch touchscreen panel
>> =C2=A0=C2=A0 gpu: drm: panel: raspberrypi: add new display mode and ne=
w probing
>> =C2=A0=C2=A0=C2=A0=C2=A0 process
>>
>> =C2=A0 .../panel/raspberrypi,7inch-touchscreen.yaml=C2=A0 |=C2=A0 4 +-
>> =C2=A0 .../drm/panel/panel-raspberrypi-touchscreen.c | 99 ++++++++++++=
++++---
>> =C2=A0 2 files changed, 91 insertions(+), 12 deletions(-)
>>
>=20


thanks

Best Regards,
Shengyang

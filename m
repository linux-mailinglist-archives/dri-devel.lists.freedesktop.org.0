Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1F78A6302
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 07:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD8210EDFC;
	Tue, 16 Apr 2024 05:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="g435d0V+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0F110EDF7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1713245428; x=1713850228; i=wahrenst@gmx.net;
 bh=EDXIugkA5rb93ms1lq9drNqqXWqCjX2miFH7f9MlXqU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=g435d0V+u0Uf1wgd3gHF4oX+onUiAs2E5+5z5dTd5KKsOcobeUgjnpC9KLb2Sh/t
 hDTNFulwDXW8D5KhuhXIPo74Lgi1QfQBvHQbHgXxjLWHTGNMH+dvjmtQCvXcoPwUH
 L2N7PnZz9TGhwkcgid9MCpCay3T50Ys8GUlMvyDq501dxXq1oF9y2ZJqJlYWwjmHr
 Jn4VurOGdaVxsjjZp9pYxrDcko6NNuTxm/xc+2xk+VXRCgEea437mHpzRnZzXyaFZ
 hqpXBaHhncWdGfkUCKwVoSNYt8ATKV4m2f5l1CVG8bya5yqFqpGaeW5qqrsVhcYRl
 DjC9SUb6zULQw2tTHA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MaJ3n-1sHtOY3Ss9-00WGTr; Tue, 16
 Apr 2024 07:30:27 +0200
Message-ID: <41629496-9be6-470c-931b-146ca22cdd7e@gmx.net>
Date: Tue, 16 Apr 2024 07:30:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: bcm2835: Enable 3D rendering through V3D
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Romain Perier <romain.perier@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel-dev@igalia.com
References: <20240415160129.14149-2-mcanal@igalia.com>
 <20240415175433.6e63d40f@donnerap.manchester.arm.com>
 <dc9f2926-3a8f-4191-9319-3d7e78c6758b@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <dc9f2926-3a8f-4191-9319-3d7e78c6758b@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zOQqwLBGxtGpPb7AVAhIZzGWkFrM6PWXMZyI1vAUiLf55DeUovq
 IFfhm7XiYWJxFdB5x+fJQqOUXpSxILLEL4wcK9vGSG3FFXwDI1k2UOH75gFxXdyHl/64c0W
 lMVGfThZvy5wWqQ7CnQCwBYaSeBxJAJMorsCSnXDZGXhdbaN4oEyhncGPlyldTQ3RiFsODM
 Pw/pJSgi221cuSGSiXNhw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DC2dNHbruS8=;URRYaxfLaP1GouTQZKBL+hKeiLd
 7Fi+F9fdhkQsHQtbb4RPMPPsbOx7We+ET/KbGVHDRxmiZDJD9GoGH3uW2DdDLzEfthJeBSO1y
 /fSjc74tvYnvHiH/nEPwy0n4mJvYc06hBzv4fRt95B8o5fn/MWIdjny8HGXtcIOALZneO3nkb
 WV6/WIVkC8UYPTHTWn3Q/M7cJ+i+BJLu5LIViCQa/Tnb2hqYEf5j3SDETKKBKhZxNMGJCOH36
 AqBu6ig5rJQaxX1QuhKDsudA+/rG3X3R9fpveyKe7sV62STxT6dn/v/o+mZBlmlde7jjtdFzm
 oOjK6btI4vrIdi61GSNWUlcB/Hq2BPGec+XQz7RnJ1zQNzdzATSOSAPngR02JDZFwPgXTbW6C
 z5aT7wFylWHm0pN8z4GUkAjR+g/EWUTDx4zHU4SOhlRhT79tn1b+uHnqGQZDtkewdqc3nVpSG
 fci8p2xIIh4gHcMPlKU8IqdehDLmJwARuPscIwtiwF3E1uVIrvwCixmrI0iNkCacF/EVBTO/G
 Tt/EyzBjj3v16knW7gM3SVBgznLpBaq9dtulVNe0YYlQaJfwoqMdDvNXEVBIWYHZY3A8Z0zFO
 /4K5DL0N5k2816HKpK6Uqd8PbA1iNycUbLOeSgwgwebF/DPYnfyKTDW7XVBeS6ccRDW4HDcHH
 0wsuyGy2tECOfH9U055C+0tMWkcAnT3VWwwYrm5xilysQwseBzDbghzZzKH5RtCvgLQJKq8w+
 Z0JZnseBYV+HjwO981cTUKo2Vor1X0KhjHHdO+PJ2/eOYXWXjRTHuGBSBkHjOuZFOOt/ZFmg2
 X1CYMjwHmtMIzhVp1tb8mubEq9kXZaiVNtuHfxF8DIkhQ=
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

Hi Ma=C3=ADra,

Am 16.04.24 um 03:02 schrieb Ma=C3=ADra Canal:
> On 4/15/24 13:54, Andre Przywara wrote:
>> On Mon, 15 Apr 2024 13:00:39 -0300
>> Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>>
>> Hi,
>>
>>> RPi 0-3 is packed with a GPU that provides 3D rendering capabilities t=
o
>>> the RPi. Currently, the downstream kernel uses an overlay to enable th=
e
>>> GPU and use GPU hardware acceleration. When deploying a mainline kerne=
l
>>> to the RPi 0-3, we end up without any GPU hardware acceleration
>>> (essentially, we can't use the OpenGL driver).
>>>
>>> Therefore, enable the V3D core for the RPi 0-3 in the mainline kernel.
>>
>> So I think Krzysztof's initial comment still stands: What does that
>> patch
>> actually change? If I build those DTBs as of now, none of them has a
>> status property in the v3d node. Which means it's enabled:
>> https://github.com/devicetree-org/devicetree-specification/blob/main/so=
urce/chapter2-devicetree-basics.rst#status
>>
>> So adding an explicit 'status =3D "okay";' doesn't make a difference.
>>
>> What do I miss here?
>
> As mentioned by Stefan in the last version, in Raspberry Pi OS, there is
> a systemd script which is trying to check for the V3D driver (/usr/lib
> /systemd/scripts/gldriver_test.sh). Within the first check, "raspi-
> config nonint is_kms" is called, which always seems to fail. What
> "raspi-config" does is check if
> /proc/device-tree/soc/v3d@7ec00000/status is equal to "okay". As
> /proc/device-tree/soc/v3d@7ec00000/status doesn't exists, it returns
> false.
yes, but i also mention that the V3D driver starts without this patch.
The commit message of this patch suggests this is a DT issue, which is not=
.

I hadn't the time to update my SD card to Bookworm yet. Does the issue
still exists with this version?
>
> I'll send if I can improve the userspace tool by just checking if the
> folder /proc/device-tree/soc/v3d@7ec00000/ exists.
>
> Thanks for the explanation!
>
> Best Regards,
> - Ma=C3=ADra
>
>>
>> Cheers,
>> Andre
>>
>>> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>>> ---
>>>
>>> v1 -> v2:
>>> https://lore.kernel.org/dri-devel/41694292-af1f-4760-a7b6-101ed5dd6f9d=
@gmx.net/T/
>>>
>>> * As mentioned by Krzysztof, enabling should be done in last place of
>>> =C2=A0=C2=A0=C2=A0=C2=A0override/extend. Therefore, I'm disabling V3D =
in the common dtsi
>>> =C2=A0=C2=A0=C2=A0=C2=A0and enabling in the last place of extend, i.e.=
 the RPi DTS files.
>>>
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 1 +
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2835-rpi-a-plus.dts=C2=A0=C2=A0 |=
 4 ++++
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2835-rpi-a.dts=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++++
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2835-rpi-b-plus.dts=C2=A0=C2=A0 |=
 4 ++++
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2835-rpi-b-rev2.dts=C2=A0=C2=A0 |=
 4 ++++
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++++
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1-io1.dts=C2=A0 | 4 ++=
++
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero-w.dts=C2=A0=C2=A0 |=
 4 ++++
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts=C2=A0=C2=A0=C2=
=A0=C2=A0 | 4 ++++
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2836-rpi-2-b.dts=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 4 ++++
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts | 4 ++++
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dts | 4 ++++
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b.dts=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 4 ++++
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts=C2=A0 | 4 ++=
++
>>> =C2=A0 arch/arm/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts | 4 ++++
>>> =C2=A0 15 files changed, 57 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
>>> b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
>>> index 9261b67dbee1..69e34831de51 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
>>> @@ -139,6 +139,7 @@ v3d: v3d@7ec00000 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 compatible =3D "brcm,bcm2835-v3d";
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 reg =3D <0x7ec00000 0x1000>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 interrupts =3D <1 10>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
atus =3D "disabled";
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vc4: gpu=
 {
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-a-plus.dts
>>> b/arch/arm/boot/dts/broadcom/bcm2835-rpi-a-plus.dts
>>> index 069b48272aa5..495ab1dfd2ce 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-a-plus.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-a-plus.dts
>>> @@ -128,3 +128,7 @@ &uart0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&uart0_gpio14>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> =C2=A0 };
>>> +
>>> +&v3d {
>>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +};
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-a.dts
>>> b/arch/arm/boot/dts/broadcom/bcm2835-rpi-a.dts
>>> index 2726c00431e8..4634d88ce3af 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-a.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-a.dts
>>> @@ -121,3 +121,7 @@ &uart0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&uart0_gpio14>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> =C2=A0 };
>>> +
>>> +&v3d {
>>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +};
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-plus.dts
>>> b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-plus.dts
>>> index c57b999a4520..45fa0f6851fc 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-plus.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-plus.dts
>>> @@ -130,3 +130,7 @@ &uart0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&uart0_gpio14>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> =C2=A0 };
>>> +
>>> +&v3d {
>>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +};
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-rev2.dts
>>> b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-rev2.dts
>>> index ae6d3a9586ab..c1dac5d704aa 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-rev2.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-rev2.dts
>>> @@ -121,3 +121,7 @@ &uart0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&uart0_gpio14>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> =C2=A0 };
>>> +
>>> +&v3d {
>>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +};
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
>>> b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
>>> index 72764be75a79..72ca31f2a7d6 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
>>> @@ -115,3 +115,7 @@ &uart0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&uart0_gpio14>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> =C2=A0 };
>>> +
>>> +&v3d {
>>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +};
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1-io1.dts
>>> b/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1-io1.dts
>>> index 3f9d198ac3ab..881a07d2f28f 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1-io1.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1-io1.dts
>>> @@ -95,3 +95,7 @@ &uart0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&uart0_gpio14>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> =C2=A0 };
>>> +
>>> +&v3d {
>>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +};
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero-w.dts
>>> b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero-w.dts
>>> index 1f0b163e400c..1c7324067442 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero-w.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero-w.dts
>>> @@ -134,6 +134,10 @@ &uart1 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> =C2=A0 };
>>> =C2=A0 +&v3d {
>>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +};
>>> +
>>> =C2=A0 &wifi_pwrseq {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-gpios =3D <&gpio 41 GPIO_ACTIVE_L=
OW>;
>>> =C2=A0 };
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
>>> b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
>>> index 539c19c10946..1568ddc78f22 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
>>> @@ -117,3 +117,7 @@ &uart0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&uart0_gpio14>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> =C2=A0 };
>>> +
>>> +&v3d {
>>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +};
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2836-rpi-2-b.dts
>>> b/arch/arm/boot/dts/broadcom/bcm2836-rpi-2-b.dts
>>> index 79918033750e..8fab6293d1c7 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2836-rpi-2-b.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2836-rpi-2-b.dts
>>> @@ -129,3 +129,7 @@ &uart0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&uart0_gpio14>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> =C2=A0 };
>>> +
>>> +&v3d {
>>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +};
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts
>>> b/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts
>>> index 3548306dfbcb..dc45b56054c7 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts
>>> @@ -156,3 +156,7 @@ &uart1 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&uart1_gpio14>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> =C2=A0 };
>>> +
>>> +&v3d {
>>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +};
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dts
>>> b/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dts
>>> index 2f1800cbc522..ce3a9f7ff529 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dts
>>> @@ -161,3 +161,7 @@ &uart1 {
>>> =C2=A0 &wifi_pwrseq {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-gpios =3D <&expgpio 1 GPIO_ACTIVE=
_LOW>;
>>> =C2=A0 };
>>> +
>>> +&v3d {
>>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +};
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b.dts
>>> b/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b.dts
>>> index 61270340075c..e398546d105b 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b.dts
>>> @@ -149,6 +149,10 @@ &sdhost {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bus-width =3D <4>;
>>> =C2=A0 };
>>> =C2=A0 +&v3d {
>>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +};
>>> +
>>> =C2=A0 &wifi_pwrseq {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-gpios =3D <&expgpio 1 GPIO_ACTIVE=
_LOW>;
>>> =C2=A0 };
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts
>>> b/arch/arm/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts
>>> index 72d26d130efa..50471ada79b3 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts
>>> @@ -94,3 +94,7 @@ &uart0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&uart0_gpio14>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> =C2=A0 };
>>> +
>>> +&v3d {
>>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +};
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts
>>> b/arch/arm/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts
>>> index 85cf594724ef..876f697e7300 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts
>>> @@ -132,6 +132,10 @@ &uart1 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> =C2=A0 };
>>> =C2=A0 +&v3d {
>>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +};
>>> +
>>> =C2=A0 &wifi_pwrseq {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-gpios =3D <&gpio 41 GPIO_ACTIVE_L=
OW>;
>>> =C2=A0 };
>>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE008A34A6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 19:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AD810F0A0;
	Fri, 12 Apr 2024 17:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="QgywdGWg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0890B10F0A0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 17:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1712942626; x=1713547426; i=wahrenst@gmx.net;
 bh=2P7U8Lr3rT/SEdzRkxr8KToUpRcgIP2da99T3eJ4GuM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=QgywdGWgynk3SsmQwXyaO5AMNf37K4iTQYWb7raI2IhMbuzT//V53y5QHdiVNQZa
 j7Wm0VVOE/0PeZrQft6UFWdnflrWNLKxjYkeVmAmy0vpX7ASZ/6tMX/aslugf1F3l
 vosIfh54CwVMjqeKN1OKIg/8Hq4gFET7GonsT6UXF3kYCWNP7rEj7zUi7kup8WKMP
 7haeaa0rZMUEfTDjmDF2pdyofLGkQRqYrZ6tV/92Y4qMuU1R9GYrcmYKQa469vTjM
 UWGII4FTAb6nrYZ3QYHmoiHce3/7AveNCdRQco8AJzU6PEUqC8UBH0R3dOScpUuBV
 h50Lr3yz1drMwvhSoQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTABT-1sKn5y1Off-00UZRf; Fri, 12
 Apr 2024 19:17:45 +0200
Message-ID: <41694292-af1f-4760-a7b6-101ed5dd6f9d@gmx.net>
Date: Fri, 12 Apr 2024 19:17:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: bcm2835: Enable 3D rendering through V3D
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Romain Perier <romain.perier@gmail.com>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
References: <20240412132559.2365947-1-mcanal@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240412132559.2365947-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GRDPBx4CDHZqEG72k3y4Xh+do0qOh477K8lZaUHwGA6wtP7+AWh
 lmcwIf0s2edQokAAvZaviyELcgW4bdhIT+k1qon+3gAazdyC3r/tO8O1g/b2V/tC9A/r2Nm
 0LqPCJfYswOxwSYe9vAVJN/wGkRp5BYT5q4n2t8qDqeioMqSHLNZ32v4DUn7RpQAcRIUjeH
 7817FaSqkK6EAkAsUi9FA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Au780FEldAQ=;Cs4gGOAU8asdOwd9uFHCVKIs3Ar
 KjsQKRaHDFHv+Itkw0+PluTFTZdSzid582wwqr7Lwu7yE15+DJ0BYAqXiu64tJlooMJlLgY+s
 dzG10fKuYM2U8nNp0Mfqjts2t1a+Tx8aUiN1dyIrReOhY61PrI8b6li73wSTR2g8Sqa1YzENS
 ySIHNkvZCirhMuAlT0pcZOs7WbaVohwLI8dqg2e7Tw2APzzrYqKstLRJVvwPJqx+lZTDAwNZ7
 gPL7IFBc4idm+aWCSbMN3Ct4lPvaIDpNtjGhaiCtDX79tGlGP2pEjAHYr/C405bJXSA63dIuo
 v5565NJMkGwhwKUDehzjITtYeDPj2AVdX2JnwuxgWcE0opomnIC2S2IerjYxgXEEnzmWhqJzr
 7JO4KfzexXkbeeSYJ4LXSyCmy8pa06WO0YdID3gXEp4YyBZlr2huRVC1bP+0qpVC7P8phJ4MX
 YEDEss3P/eUl5nQZFaiQ23GOt5yEzqNgFpgJO/m/SOj16Ip4d+LNywZ+sZMhk3JH/g0Mq5Iba
 rbdhr1DRdeQLJu8JGdKylidLBHdig/KwvbKp0YNMrhef3Yk0it6Wi/hnyZFy5yBQpLsV4xBJl
 1z4LKp4tZ39u5jBiSMPJwfHYxLWZZpgMVwK/V6OccpBVqD8AQro6z/juBeGwhhwNpKz+2X6+7
 Cjprf5miWDUYoStWT5RVaDxC0uYei72thzX1AYgspjJFXGq7JiixIrTnDFrIwhPKhuS0oAubt
 R0JOh1ViXElpjcOK9ayyClvu07N9R7PvyoZCUJIe73DulhuIUJjNHJC8A4QoKoTZXUiTsyomn
 2qJXjPs29ayBtEUQxSR0ELiatYJ10Qi2p3YgSn/0wHgMw=
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

[add Phil & Dave]

Am 12.04.24 um 15:25 schrieb Ma=C3=ADra Canal:
> RPi 0-3 is packed with a GPU that provides 3D rendering capabilities to
> the RPi. Currently, the downstream kernel uses an overlay to enable the
> GPU and use GPU hardware acceleration. When deploying a mainline kernel
> to the RPi 0-3, we end up without any GPU hardware acceleration
> (essentially, we can't use the OpenGL driver).
>
> Therefore, enable the V3D core for the RPi 0-3 in the mainline kernel.
thanks for trying to improve the combination Raspberry Pi OS + Mainline
Kernel. I think i'm able to reproduce the issue with Raspberry Pi 3 B +
on Buster. From the kernel side everything looks good:

[=C2=A0=C2=A0 11.054833] vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdm=
i_ops [vc4])
[=C2=A0=C2=A0 11.055118] vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_=
ops [vc4])
[=C2=A0=C2=A0 11.055340] vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_=
ops [vc4])
[=C2=A0=C2=A0 11.055521] vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops
vc4_crtc_ops [vc4])
[=C2=A0=C2=A0 11.055695] vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops
vc4_crtc_ops [vc4])
[=C2=A0=C2=A0 11.055874] vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops
vc4_crtc_ops [vc4])
[=C2=A0=C2=A0 11.056020] vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_=
ops [vc4])
[=C2=A0=C2=A0 11.063277] Bluetooth: hci0: BCM4345C0
'brcm/BCM4345C0.raspberrypi,3-model-b-plus.hcd' Patch
[=C2=A0=C2=A0 11.070466] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu =
on minor 0
[=C2=A0=C2=A0 11.174803] Console: switching to colour frame buffer device =
240x75
[=C2=A0=C2=A0 11.205125] vc4-drm soc:gpu: [drm] fb0: vc4drmfb frame buffer=
 device

But in Raspberry Pi OS there is a systemd script which is trying to
check for the V3D driver /usr/lib/systemd/scripts/gldriver_test.sh
Within the first check "raspi-config nonint is_kms" is called, which
always seems to fail. If i run strace on this command it seems to check
for /proc/device-tree/soc/v3d@7ec00000/status which doesn't exists in
the Mainline device tree.

Maybe there is a chance to improve the userspace tool?

>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>
> I decided to add the status property to the `bcm2835-common.dtsi`, but
> there are two other options:
>
> 1. To add the status property to the `bcm2835-rpi-common.dtsi` file
> 2. To add the status property to each individual RPi model, e.g.
> `bcm2837-rpi-3-b.dts`.
>
> Let me know which option is more suitable, and if `bcm2835-common.dtsi`
> is not the best option, I can send a v2.
>
> Best Regards,
> - Ma=C3=ADra
>
>   arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/b=
oot/dts/broadcom/bcm2835-common.dtsi
> index 9261b67dbee1..851a6bce1939 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> @@ -139,6 +139,7 @@ v3d: v3d@7ec00000 {
>   			compatible =3D "brcm,bcm2835-v3d";
>   			reg =3D <0x7ec00000 0x1000>;
>   			interrupts =3D <1 10>;
> +			status =3D "okay";
>   		};
>
>   		vc4: gpu {


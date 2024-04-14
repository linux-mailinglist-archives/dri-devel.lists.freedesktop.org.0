Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C55E8A44CD
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 21:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1861B11231E;
	Sun, 14 Apr 2024 19:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="qlzYw5c9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0FE11231E
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 19:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1713121264; x=1713726064; i=wahrenst@gmx.net;
 bh=h08o5WswVR3W4zkPDDMbBD0eYmz1w0cjBrKgKtgUhA8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=qlzYw5c90y+XKe5UdcPbGOmMKpjI+yONeq1hrpS8sHCJ5VDl8deruyAtLNR3/B3K
 3YMX6HlH5gNG1RSFy2U6i3mg9RzwZoZB98KfcU2ZssLROF8aS2BKTd/80zGiARtQL
 Wsy8woQEkQ2j+qI3Zd7B9Jb0/SG6RdEntNiPNbshE/efvt/62bSy7D0tvRoRKgmod
 UFOO4jWWBhPzUswNbNhsxK13BDW+9U3zucsYZCb9+TdTF9SmOMulL6QNPDkNvpx93
 +85zmnpbl8lgyiG8zlmdwhYrlLSnRpKFjFPXYfla3hAx1mw6B09eEKaywnqIaWSaM
 8OPzCPv7RJHASBSH0A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mplbx-1sWmHR3Vcb-00qDK0; Sun, 14
 Apr 2024 20:55:00 +0200
Message-ID: <74d2e385-6923-419b-a536-806b50c9d5e0@gmx.net>
Date: Sun, 14 Apr 2024 20:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: bcm2835: Enable 3D rendering through V3D
To: Phil Elwell <phil@raspberrypi.com>
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Romain Perier <romain.perier@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
References: <20240412132559.2365947-1-mcanal@igalia.com>
 <41694292-af1f-4760-a7b6-101ed5dd6f9d@gmx.net>
 <CAMEGJJ2mkuBZjo+OAnkVCEi=73zMpXNUwzRqsAOckMhUeN_WJw@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAMEGJJ2mkuBZjo+OAnkVCEi=73zMpXNUwzRqsAOckMhUeN_WJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yMtb4e0zQYUGQFzh32be+eqXmXdu4XVowazd/HbI9TOvzQsUqak
 nUDjM+076pQv3n0ft7I3iql+uz6up47vXBPK93744jPVHo17vYMmeCB0pSAbHrStS3FRXNw
 HHb4c9eWyr77yFMChyKk/dLZ1UVC2HZogbUd8hXDQVlhc7qUB6v6X/X5B8gKhVlhz9nKSik
 LV4uCa/Jgsn975MkofB1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bxxZ4h7nEy8=;uQhN0xB7Rf/hNg7dx/+LwqG3s2j
 qdiC9AnfYi0wCQnjwRfM9fFKwVoLJOxqun0vuUd/44KsUvIDHD4KFFJUsMyiwt7JFZ8taC4AF
 nMBi2SzCXjg/GBY1UX0IHbZcG+MSuHTJJnHm+yxNZdGnoGt/hVUFaZpowqNWVeo3HUJWxfCBU
 GpNP/qARE++nVoNZ9v8eue6CelT1qkq1jsnSKHPjKGCZXiWBwrBR/SKD1Hu1ImrjDtT3sBxzG
 6ARDwkns06wecezh8Ke50+58R5GSTeit7DEZQfkqgND9rsp/wD/aD7xOKY2JUUyvQH5EYRJtO
 rsHvtqKz/kDRZZVOOv0Sujn9yp1/6e6LY6+ha+W3HcbGpPCa1AR0szFCPU3fsaauou6UJ0Gya
 8nSYwo8se7kz2dv78PZE+/A/nSA3PBOLrHX8YjOTrTWF2yl16opxwTimOe+1SUC2iKVvSXqKT
 49JCX3akbS7w07zZXiO9diEMcvQ3YIpvMcfBONaybzoXoZEELHvk5EgdpakJ04ZytNuWnonWN
 +2wjHYtE427/MV0y/r5yHpkZzrFZm9m51enjO6EsxMJlhBdaUk+09zaWeI/t99Tu2MsZZ1MAB
 EVZAnok++zY2FVeUz2q9Z949WMbKgWjIL4GOimijlxCsNmKhoanWiLZHSsU6KDxmwX48QGkCe
 x/GjWStt0tuTceUf4V8dmm3a0s5omos8DB80MKWwuh2taVCvHCYumkZKIAVkqdGgMUYsvi9CF
 avx8Ct1JuM5ULazcLmJzlp0utlEQkUZ9F/qOgwc5z8fvAPkO+OhS/sb1o+5Twy6f/tZQld/Kv
 lf0++mqhQ77JoiLc2kTCoQDGpxCXTLKBZRfOeZqQjmPIE=
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

Hi Phil,

Am 14.04.24 um 20:43 schrieb Phil Elwell:
> Hello all,
>
> On Fri, 12 Apr 2024 at 18:17, Stefan Wahren <wahrenst@gmx.net> wrote:
>> Hi Ma=C3=ADra,
>>
>> [add Phil & Dave]
>>
>> Am 12.04.24 um 15:25 schrieb Ma=C3=ADra Canal:
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
>> thanks for trying to improve the combination Raspberry Pi OS + Mainline
>> Kernel. I think i'm able to reproduce the issue with Raspberry Pi 3 B +
>> on Buster.
> Buster? We launched Buster with 4.19 and ended on 5.10. We've moved
> onto Bookworm now. A lot has changed in that time...
Sorry, i meant Bullseye but yes it's not up to date. Anyway i cannot see
a problem with the devicetree.

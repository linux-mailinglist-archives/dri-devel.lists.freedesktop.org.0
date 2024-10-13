Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3C299BB52
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 21:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9FC10E081;
	Sun, 13 Oct 2024 19:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="k8Ebw6M1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA6310E081
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 19:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1728849479; x=1729454279; i=wahrenst@gmx.net;
 bh=ZrdbaJ5I1PTLbLhXDgRCXIzWkg9IFj2PsG5BfwQz9f4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=k8Ebw6M1OBMxgwa3j8QkhIk/sRFSWfKfwLzT0KJ5eqvPphC1kBU6cdHUT6zMgrPF
 QXFyb57Ft6qutXrz8b337vYkJVpLhMR1JG4nOvk5I2UKSeOgK+z7ut6XHLLy11liZ
 VILOcemzHk9fkTrReMPrdUMqAUKUfghv0dqd4ey6B9s/FACvv/GsxXn3n594hb9ET
 AaedDWSdAijcrvsfdoIXseNic30WjkxvykA/rL3/ngBe5XwiAgJhNy2QT5V4wOLfg
 JqshJCxVYLp2rkyD+hmzCU1fFHqNEGAMVddrnsskK2GMTHrm0XWIP23VyUc5ENWNp
 pO+kWLhjl0z192C2eg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9X9-1t97Ha274T-00Cjeb; Sun, 13
 Oct 2024 21:57:59 +0200
Message-ID: <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
Date: Sun, 13 Oct 2024 21:57:58 +0200
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
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rEnG7YTgt0moIgYwCvsXY/DexQe3mV3GqhoFvR0hpJshu0XauXP
 S4Y5YgbtFl9X9fXoXvnlYj0R8A2RCLgB8YTEeGK4JH3XX9w6DvZ2z0vuIzZq/M5NzHfRenQ
 /qpW9xBf3anxPsv14ynAjWErr47ee/SfVHdVMGyHtb7ebaWLSGvbt4SAwQXbkWakNQixKht
 d2QD1VJgIEiexHoyyCnQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ayjPrdnJwLg=;fagS3B9M7ALWLgOs8MJnn6e2rBC
 TdVXt43yG3Vq3cxqyWXBcCA6qLdWnCrLzK+5aH5Qk0IRyz1TiruIYC95jrSKuNWdf2oG9VgSA
 6yfM6Iqb4eF9WB94bnZ4UXz/OcweetOU+9vMkUNf1cnsQwOoWSMNEhQp1n94RNBi57kPbI6dA
 dYvMDe8YRtOyp22EhqJO0cBzSfy3wBaZXy+hXcBHLjltlB5lRjmBWRwzX57dV//QSPFJ9rABD
 k156ssTiS4fcotcPfRcyOrASUCbp9H9O27gw34VFJsZHNmV734Co4tCzb6j6XyQa/11WWC3Ci
 8RQEFF10PvniXyd92B3SQCsyIYqIzE6Yvy++iRCQMYzbSzXN388vJIiJIsXEn1VPu6JBo9j2O
 UyHgUG50OO9naDG4wIrRwozUbvfT9XJoZ9ruDC7PPXZYH0/ShHV3oDOR3mxaZn/ccjJUBz24P
 1pBMOESGwPFEk/fN5QO0sqTCqs0DyS7pVQTsURY+ynDKkoWFmJcCogVeLDxDpR3aW61D+MKiy
 haSAdcCNRKrL3E5awYXziHLHZvzS+HizcNNWWoRy+0P5kr2iaEv4PnFkmGPpXJnBRJ3iHhA5N
 vwyvnI3GGEeKws9OuL++j16pXn5IAovE0kBrsK7RanwSiP9xFQf3aSJ/LzgMFAS7BzYScNGjl
 40Q23yZd++43aTQZshVy+js1Jyk/6EogbSzXD8GVc3xRPkikhy9lDZhxwuw3wWa3Hxt/J8ftx
 MfM+c8SvJpbi29f7pyQUafhWQ29IpSstFnYFd1fWrVoAUdSmaqv7tZR3xmzu+xiWUnS0Kp57n
 5pMpn0Zv2MdxyIXNjUjITu9Q==
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

Am 13.10.24 um 21:11 schrieb Dave Stevenson:
> Hi Stefan.
>
> On Sun, 13 Oct 2024, 18:19 Stefan Wahren, <wahrenst@gmx.net> wrote:
>
>     Hi,
>
>     i recently switch for my suspend2idle tests from Raspberry Pi Bullse=
ye
>     to Bookworm. After that testing suspend2idle shows a new warning
>     which i
>     never saw before:
>
>     HDMI Sink doesn't support RGB, something's wrong.
>
>
> Can you provide the edid of your display please?

Sure

[=C2=A0=C2=A0=C2=A0 27.145] (II) modeset(0): Monitor name: HP ZR2440w
[=C2=A0=C2=A0=C2=A0 27.145] (II) modeset(0): Serial No: CN423402RL

...

[=C2=A0=C2=A0=C2=A0 27.146] (II) modeset(0): EDID (in hex):
[=C2=A0=C2=A0=C2=A0 27.146] (II) modeset(0): =C2=A0=C2=A0=C2=A0 00ffffffff=
ffff0022f0562901010101
[=C2=A0=C2=A0=C2=A0 27.146] (II) modeset(0): =C2=A0=C2=A0=C2=A0 2216010380=
3420782afc81a4554d9d25
[=C2=A0=C2=A0=C2=A0 27.146] (II) modeset(0): =C2=A0=C2=A0=C2=A0 1250542108=
00d1c081c0814081809500
[=C2=A0=C2=A0=C2=A0 27.146] (II) modeset(0): =C2=A0=C2=A0=C2=A0 a940b30001=
01283c80a070b023403020
[=C2=A0=C2=A0=C2=A0 27.146] (II) modeset(0): =C2=A0=C2=A0=C2=A0 3600064421=
00001a000000fd00183c18
[=C2=A0=C2=A0=C2=A0 27.146] (II) modeset(0): =C2=A0=C2=A0=C2=A0 5011000a20=
2020202020000000fc0048
[=C2=A0=C2=A0=C2=A0 27.146] (II) modeset(0): =C2=A0=C2=A0=C2=A0 50205a5232=
343430770a2020000000ff
[=C2=A0=C2=A0=C2=A0 27.146] (II) modeset(0): =C2=A0=C2=A0=C2=A0 00434e3432=
33343032524c0a2020015b
[=C2=A0=C2=A0=C2=A0 27.146] (II) modeset(0): =C2=A0=C2=A0=C2=A0 02031ff14c=
901f051404130302070612
[=C2=A0=C2=A0=C2=A0 27.147] (II) modeset(0): =C2=A0=C2=A0=C2=A0 0165030c00=
1000230907078301000002
[=C2=A0=C2=A0=C2=A0 27.147] (II) modeset(0): =C2=A0=C2=A0=C2=A0 3a80187138=
2d40582c45000644210000
[=C2=A0=C2=A0=C2=A0 27.147] (II) modeset(0): =C2=A0=C2=A0=C2=A0 1e023a80d0=
72382d40102c4580064421
[=C2=A0=C2=A0=C2=A0 27.147] (II) modeset(0): =C2=A0=C2=A0=C2=A0 00001e011d=
007251d01e206e28550006
[=C2=A0=C2=A0=C2=A0 27.147] (II) modeset(0): =C2=A0=C2=A0=C2=A0 442100001e=
011d00bc52d01e20b82855
[=C2=A0=C2=A0=C2=A0 27.147] (II) modeset(0): =C2=A0=C2=A0=C2=A0 4006442100=
001e8c0ad08a20e02d1010
[=C2=A0=C2=A0=C2=A0 27.147] (II) modeset(0): =C2=A0=C2=A0=C2=A0 3e96000644=
21000018000000000000c1
>
> The last time I saw this type of error was when using the now removed
> built in edids that were declaring the display as analog rgb. That
> dropped out part way through the edid parsing and didn't set the flag
> for rgb support.
>
> =C2=A0 Dave
>

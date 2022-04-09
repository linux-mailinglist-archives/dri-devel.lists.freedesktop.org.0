Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7169A4FAC75
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 08:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32D910E342;
	Sun, 10 Apr 2022 06:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D4E10EC8E
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 20:04:02 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id j204so5785514vkj.8
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Apr 2022 13:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QQ8bV6xRS+yTnm7M0AULmumP6ttT2Y13YFgcz7NKRdA=;
 b=Sgg7sKrQtk22B/m9khWEBjoDhNEZc357yR1DlKIOcX7u9R0Jxm33M6Sy5GZkZJgDNj
 sXZjT9R51S3XhJFJyBs/FtDGVQAP4sngLbyQjTBzgZpqYFHjUI773D0rZqacPuZ3FzXH
 5k6zq+Z8BhsOfeZxCZ8hBf2h+R9FhMEEOnI/2MDTOBSMmhOR+NuaahF0+9KNgVSrRYRJ
 S1zVdtEofFi7G0RM6MArMd8OP2SFhtA63/xf8XrYg1kBegV+t9iR8fbiXU282jswLD8M
 8icK6fUfSr1IjzeVdP6u56Fl3KDrsHgIL1TAL3qBRqlTesWbnMl+dVRO22DPgmUi91co
 rOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QQ8bV6xRS+yTnm7M0AULmumP6ttT2Y13YFgcz7NKRdA=;
 b=5HXIZf0H1Q8Enx9sphzou6jJOk69PXUsSJbNcolVmACa8zEMOdshPef/DpdM6AfalV
 lLdhnW4sSMLsny+CXzyvVUYcGV7T4tLrHHxpLN+lf4YNY4IHezfpbJxZwI1dU07fgW8n
 dObZQ6LcxNn/vT30bEU5pksV8aFag8mSjKXDDNc+Gmw/Tg8y+8cuSxFVumpKYnwxtLfX
 Rq1UxnE4bMHGL99zXnn3rxVtXe+vimxWSlKui/l8zEjJWzb0YM6WMHg+Fw82seZ34yNh
 qzj+MMzidRrRQpFN1586IlTttcTKJqc9noV15zb4Zgv6viwHhmxC9clbU9pdrD8tv+EI
 6jRA==
X-Gm-Message-State: AOAM533q6BxLhqb75Mrh1cK0DuEIMW21yMCGo3P3Wah4faQQ/gd121nd
 m1er5apnUwecJD500wEM97ZjqAVFmpAcHrM5MoJ1gg==
X-Google-Smtp-Source: ABdhPJzpLmT42f9tCqfp4pxG7nMJvi1iDSWKEHU7vOW9p9MAu5qVgqq5+lse2nDuz/6XOJG95gJrHaXTjtknX9cO0oo=
X-Received: by 2002:a1f:5c14:0:b0:345:4167:8e24 with SMTP id
 q20-20020a1f5c14000000b0034541678e24mr2243491vkb.0.1649534641602; Sat, 09 Apr
 2022 13:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <69c4f25d-7b48-081b-f609-8e1fd5f950cb@i2se.com>
 <df9d739d-7dff-4e2b-d1cd-66a5c5887cab@i2se.com>
In-Reply-To: <df9d739d-7dff-4e2b-d1cd-66a5c5887cab@i2se.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Sat, 9 Apr 2022 21:03:51 +0100
Message-ID: <CAMEGJJ39JcDxNbdv7RqakoR7AVxC_kBPaNv0fSugRaGRSFPkzA@mail.gmail.com>
Subject: Re: vc4: Couldn't stop firmware display driver during boot
To: Stefan Wahren <stefan.wahren@i2se.com>
Content-Type: multipart/alternative; boundary="0000000000005b995705dc3e36fe"
X-Mailman-Approved-At: Sun, 10 Apr 2022 06:52:55 +0000
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000005b995705dc3e36fe
Content-Type: text/plain; charset="UTF-8"

You know the drill, Stefan - what's in your config.txt?

Phil

On Sat, 9 Apr 2022, 20:26 Stefan Wahren, <stefan.wahren@i2se.com> wrote:

> Hi,
>
> today i tested Linux 5.18-rc1 on my Raspberry Pi 400 connected to my
> HDMI display (multi_v7_defconfig + CONFIG_ARM_LPAE, firmware:
> 2021-01-08T14:31:16) and i'm getting these strange errors from
> raspberrypi-firmware driver / vc4 during boot:
>
> [   13.094733] fb0: switching to vc4 from simple
> [   13.110759] Console: switching to colour dummy device 80x30
> [   13.120691] raspberrypi-firmware soc:firmware: Request 0x00030066
> returned status 0x80000001
> [   13.120715] vc4-drm gpu: [drm] Couldn't stop firmware display driver:
> -22
> [   13.120839] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> [   13.121213] Bluetooth: Core ver 2.22
> [   13.121266] NET: Registered PF_BLUETOOTH protocol family
> [   13.121270] Bluetooth: HCI device and connection manager initialized
> [   13.121281] Bluetooth: HCI socket layer initialized
> [   13.121286] Bluetooth: L2CAP socket layer initialized
> [   13.121297] Bluetooth: SCO socket layer initialized
> [   13.132879] cfg80211: Loading compiled-in X.509 certificates for
> regulatory database
> [   13.164278] Bluetooth: HCI UART driver ver 2.3
> [   13.164293] Bluetooth: HCI UART protocol H4 registered
> [   13.166608] raspberrypi-firmware soc:firmware: Request 0x00030066
> returned status 0x80000001
> [   13.166633] vc4-drm gpu: [drm] Couldn't stop firmware display driver:
> -22
> [   13.166717] vc4-drm gpu: bound fe400000.hvs (ops vc4_drm_unregister
> [vc4])
> [   13.176173] Bluetooth: HCI UART protocol Broadcom registered
> [   13.182365] hci_uart_bcm serial0-0: supply vbat not found, using
> dummy regulator
> [   13.182505] hci_uart_bcm serial0-0: supply vddio not found, using
> dummy regulator
> [   13.300636] uart-pl011 fe201000.serial: no DMA platform data
> [   13.422683] raspberrypi-firmware soc:firmware: Request 0x00030066
> returned status 0x80000001
> [   13.422700] vc4-drm gpu: [drm] Couldn't stop firmware display driver:
> -22
> [   13.422788] vc4-drm gpu: bound fe400000.hvs (ops vc4_drm_unregister
> [vc4])
> [   13.458620] bcmgenet fd580000.ethernet: GENET 5.0 EPHY: 0x0000
> [   13.461925] raspberrypi-firmware soc:firmware: Request 0x00030066
> returned status 0x80000001
> [   13.461941] vc4-drm gpu: [drm] Couldn't stop firmware display driver:
> -22
> [   13.462006] vc4-drm gpu: bound fe400000.hvs (ops vc4_drm_unregister
> [vc4])
> [   13.469287] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [   13.507497] vc4-drm gpu: bound fef00700.hdmi (ops vc4_drm_unregister
> [vc4])
> [   13.521840] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43456-sdio for chip BCM4345/9
> [   13.522128] brcmfmac mmc0:0001:1: Direct firmware load for
> brcm/brcmfmac43456-sdio.raspberrypi,400.bin failed with error -2
> [   13.535444] brcmfmac mmc0:0001:1: Direct firmware load for
> brcm/brcmfmac43456-sdio.raspberrypi,400.txt failed with error -2
> [   13.564153] Bluetooth: hci0: BCM: chip id 130
> [   13.564675] Bluetooth: hci0: BCM: features 0x0f
> [   13.566157] Bluetooth: hci0: BCM4345C5
> [   13.566164] Bluetooth: hci0: BCM4345C5 (003.006.006) build 0000
> [   13.568434] Bluetooth: hci0: BCM4345C5 'brcm/BCM4345C5.hcd' Patch
> [   13.570485] unimac-mdio unimac-mdio.-19: Broadcom UniMAC MDIO bus
> [   13.576820] vc4-drm gpu: bound fef05700.hdmi (ops vc4_drm_unregister
> [vc4])
> [   13.576967] vc4-drm gpu: bound fe004000.txp (ops vc4_drm_unregister
> [vc4])
> [   13.577044] vc4-drm gpu: bound fe206000.pixelvalve (ops
> vc4_drm_unregister [vc4])
> [   13.577118] vc4-drm gpu: bound fe207000.pixelvalve (ops
> vc4_drm_unregister [vc4])
> [   13.577185] vc4-drm gpu: bound fe20a000.pixelvalve (ops
> vc4_drm_unregister [vc4])
> [   13.577237] vc4-drm gpu: bound fe216000.pixelvalve (ops
> vc4_drm_unregister [vc4])
> [   13.613504] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
>
> Best regards
>
>

--0000000000005b995705dc3e36fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">You know the drill, Stefan - what&#39;s in your config.tx=
t?<div dir=3D"auto"><br></div><div dir=3D"auto">Phil</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 9 Apr 202=
2, 20:26 Stefan Wahren, &lt;<a href=3D"mailto:stefan.wahren@i2se.com">stefa=
n.wahren@i2se.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi=
,<br>
<br>
today i tested Linux 5.18-rc1 on my Raspberry Pi 400 connected to my <br>
HDMI display (multi_v7_defconfig + CONFIG_ARM_LPAE, firmware: <br>
2021-01-08T14:31:16) and i&#39;m getting these strange errors from <br>
raspberrypi-firmware driver / vc4 during boot:<br>
<br>
[=C2=A0=C2=A0 13.094733] fb0: switching to vc4 from simple<br>
[=C2=A0=C2=A0 13.110759] Console: switching to colour dummy device 80x30<br=
>
[=C2=A0=C2=A0 13.120691] raspberrypi-firmware soc:firmware: Request 0x00030=
066 <br>
returned status 0x80000001<br>
[=C2=A0=C2=A0 13.120715] vc4-drm gpu: [drm] Couldn&#39;t stop firmware disp=
lay driver: -22<br>
[=C2=A0=C2=A0 13.120839] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [=
vc4])<br>
[=C2=A0=C2=A0 13.121213] Bluetooth: Core ver 2.22<br>
[=C2=A0=C2=A0 13.121266] NET: Registered PF_BLUETOOTH protocol family<br>
[=C2=A0=C2=A0 13.121270] Bluetooth: HCI device and connection manager initi=
alized<br>
[=C2=A0=C2=A0 13.121281] Bluetooth: HCI socket layer initialized<br>
[=C2=A0=C2=A0 13.121286] Bluetooth: L2CAP socket layer initialized<br>
[=C2=A0=C2=A0 13.121297] Bluetooth: SCO socket layer initialized<br>
[=C2=A0=C2=A0 13.132879] cfg80211: Loading compiled-in X.509 certificates f=
or <br>
regulatory database<br>
[=C2=A0=C2=A0 13.164278] Bluetooth: HCI UART driver ver 2.3<br>
[=C2=A0=C2=A0 13.164293] Bluetooth: HCI UART protocol H4 registered<br>
[=C2=A0=C2=A0 13.166608] raspberrypi-firmware soc:firmware: Request 0x00030=
066 <br>
returned status 0x80000001<br>
[=C2=A0=C2=A0 13.166633] vc4-drm gpu: [drm] Couldn&#39;t stop firmware disp=
lay driver: -22<br>
[=C2=A0=C2=A0 13.166717] vc4-drm gpu: bound fe400000.hvs (ops vc4_drm_unreg=
ister <br>
[vc4])<br>
[=C2=A0=C2=A0 13.176173] Bluetooth: HCI UART protocol Broadcom registered<b=
r>
[=C2=A0=C2=A0 13.182365] hci_uart_bcm serial0-0: supply vbat not found, usi=
ng <br>
dummy regulator<br>
[=C2=A0=C2=A0 13.182505] hci_uart_bcm serial0-0: supply vddio not found, us=
ing <br>
dummy regulator<br>
[=C2=A0=C2=A0 13.300636] uart-pl011 fe201000.serial: no DMA platform data<b=
r>
[=C2=A0=C2=A0 13.422683] raspberrypi-firmware soc:firmware: Request 0x00030=
066 <br>
returned status 0x80000001<br>
[=C2=A0=C2=A0 13.422700] vc4-drm gpu: [drm] Couldn&#39;t stop firmware disp=
lay driver: -22<br>
[=C2=A0=C2=A0 13.422788] vc4-drm gpu: bound fe400000.hvs (ops vc4_drm_unreg=
ister <br>
[vc4])<br>
[=C2=A0=C2=A0 13.458620] bcmgenet fd580000.ethernet: GENET 5.0 EPHY: 0x0000=
<br>
[=C2=A0=C2=A0 13.461925] raspberrypi-firmware soc:firmware: Request 0x00030=
066 <br>
returned status 0x80000001<br>
[=C2=A0=C2=A0 13.461941] vc4-drm gpu: [drm] Couldn&#39;t stop firmware disp=
lay driver: -22<br>
[=C2=A0=C2=A0 13.462006] vc4-drm gpu: bound fe400000.hvs (ops vc4_drm_unreg=
ister <br>
[vc4])<br>
[=C2=A0=C2=A0 13.469287] cfg80211: Loaded X.509 cert &#39;sforshee: 00b28dd=
f47aef9cea7&#39;<br>
[=C2=A0=C2=A0 13.507497] vc4-drm gpu: bound fef00700.hdmi (ops vc4_drm_unre=
gister <br>
[vc4])<br>
[=C2=A0=C2=A0 13.521840] brcmfmac: brcmf_fw_alloc_request: using <br>
brcm/brcmfmac43456-sdio for chip BCM4345/9<br>
[=C2=A0=C2=A0 13.522128] brcmfmac mmc0:0001:1: Direct firmware load for <br=
>
brcm/brcmfmac43456-sdio.raspberrypi,400.bin failed with error -2<br>
[=C2=A0=C2=A0 13.535444] brcmfmac mmc0:0001:1: Direct firmware load for <br=
>
brcm/brcmfmac43456-sdio.raspberrypi,400.txt failed with error -2<br>
[=C2=A0=C2=A0 13.564153] Bluetooth: hci0: BCM: chip id 130<br>
[=C2=A0=C2=A0 13.564675] Bluetooth: hci0: BCM: features 0x0f<br>
[=C2=A0=C2=A0 13.566157] Bluetooth: hci0: BCM4345C5<br>
[=C2=A0=C2=A0 13.566164] Bluetooth: hci0: BCM4345C5 (003.006.006) build 000=
0<br>
[=C2=A0=C2=A0 13.568434] Bluetooth: hci0: BCM4345C5 &#39;brcm/BCM4345C5.hcd=
&#39; Patch<br>
[=C2=A0=C2=A0 13.570485] unimac-mdio unimac-mdio.-19: Broadcom UniMAC MDIO =
bus<br>
[=C2=A0=C2=A0 13.576820] vc4-drm gpu: bound fef05700.hdmi (ops vc4_drm_unre=
gister <br>
[vc4])<br>
[=C2=A0=C2=A0 13.576967] vc4-drm gpu: bound fe004000.txp (ops vc4_drm_unreg=
ister <br>
[vc4])<br>
[=C2=A0=C2=A0 13.577044] vc4-drm gpu: bound fe206000.pixelvalve (ops <br>
vc4_drm_unregister [vc4])<br>
[=C2=A0=C2=A0 13.577118] vc4-drm gpu: bound fe207000.pixelvalve (ops <br>
vc4_drm_unregister [vc4])<br>
[=C2=A0=C2=A0 13.577185] vc4-drm gpu: bound fe20a000.pixelvalve (ops <br>
vc4_drm_unregister [vc4])<br>
[=C2=A0=C2=A0 13.577237] vc4-drm gpu: bound fe216000.pixelvalve (ops <br>
vc4_drm_unregister [vc4])<br>
[=C2=A0=C2=A0 13.613504] [drm] Initialized vc4 0.0.0 20140616 for gpu on mi=
nor 0<br>
<br>
Best regards<br>
<br>
</blockquote></div>

--0000000000005b995705dc3e36fe--

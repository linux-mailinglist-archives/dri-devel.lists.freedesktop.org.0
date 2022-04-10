Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31A34FAB31
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 02:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E5110E123;
	Sun, 10 Apr 2022 00:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBB610E123
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 00:32:16 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.94]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mo6zF-1oIzvB0WHT-00pbrz; Sun, 10 Apr 2022 02:32:06 +0200
Message-ID: <42f24a68-391a-e6c8-25a7-511e91a5c7f9@i2se.com>
Date: Sun, 10 Apr 2022 02:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: vc4: Couldn't stop firmware display driver during boot
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Maxime Ripard <maxime@cerno.tech>
References: <69c4f25d-7b48-081b-f609-8e1fd5f950cb@i2se.com>
 <df9d739d-7dff-4e2b-d1cd-66a5c5887cab@i2se.com>
In-Reply-To: <df9d739d-7dff-4e2b-d1cd-66a5c5887cab@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9mm4jMgUDfJxfbUhwwZEmZqAa6U5EkWiBsKFWugkKDJ5G3Ki5Mk
 a8iBdb8WLhw7eZU9eedUQ/ElXS9gzTrHWhlowKl6A/eZEz873W0TsaagsQk+EuLb0yvUQxN
 JTYuPrDhwiTZJC3okr4mhicSDPVw5/v3U3cb2umSOPf92SlO8dOYvAC9KSSuSQcBYc7c6wB
 NSrVPAHbwQs/1KIZL0T7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u2WN6oC0iGs=:BVjx8C7TeGR4PZlqnyVUG6
 2eL+CdBeijvENFzhQ5rmVxZ2gF0F0BVoCe58qExQB1jpDKgxbexLOS5If5G3BaTIxWVB6MPuz
 0Cweuv+YNiycdMDgICswMaatKIaJBcSRrIcfAcrmuyfW65tPX1a0uCdiO2iC2AGBSSbJPZSds
 Z/LuSgY4QnusH/S98+/zxy9/QY2uPe3xoohk69pabO6YhzpzKqd4GkAbNysx7sitSzse87+TP
 rdiptOOs0nONrNoy/T0qL4ZO0haHx208sfGbv/Rk8L98YMDtEk2V8nGYJXEnRxSvE+Ob1E6Y+
 1LIYGkQnVOB8Nf++VgspgAc3+7xQAuYsZqL+x6yEl2EJK/dwdpPDY7vjsg13yM2Xh05TTYJbp
 KCDFsMx57VU8B0KAcF1xc+qrqhlXYiSPkLWjYUXjU0OdQV9vISi5zP/HDkuEv+zPHmaZGqbyr
 n+CnRlMdzNuI5l47r7F7ha71o0uGzzMhYq9gPOTsffz0OtVl9O4Y36YY+1MubZ19Ulum0wwlU
 f0zlHNy9rvzg8ScxcsQPF0K44OLuUQ9RMfHAVsepE1G8LbgbTABjDswhkjihQRLfotpFCNJBN
 ZubfQ7m868HSIDykFemBcfzqCPZWxLfumXyetDT/dA/+Eh8E88oancBgR9/NVik+F7lqYPeOf
 qthIdxCM8MGMBJfjUOgs9mqWx1ol67Ve4bD71Hnmla8U5rbxOsRfZqoywwm8HaLWoixm9feU8
 5V50r1QBUGfIann8
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.04.22 um 21:25 schrieb Stefan Wahren:
> Hi,
>
> today i tested Linux 5.18-rc1 on my Raspberry Pi 400 connected to my 
> HDMI display (multi_v7_defconfig + CONFIG_ARM_LPAE, firmware: 
> 2021-01-08T14:31:16) and i'm getting these strange errors from 
> raspberrypi-firmware driver / vc4 during boot:
>
> [   13.094733] fb0: switching to vc4 from simple
> [   13.110759] Console: switching to colour dummy device 80x30
> [   13.120691] raspberrypi-firmware soc:firmware: Request 0x00030066 
> returned status 0x80000001
> [   13.120715] vc4-drm gpu: [drm] Couldn't stop firmware display 
> driver: -22
This is a new error which was introduced with Linux 5.18-rc1 
(c406ad5e4a85 "drm/vc4: Notify the firmware when DRM is in charge"). 
0x00030066 stands for the new firmware property 
RPI_FIRMWARE_NOTIFY_DISPLAY_DONE. And i guess the firmware from January 
2021 doesn't support it?
> [ 13.120839] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> [   13.121213] Bluetooth: Core ver 2.22
> [   13.121266] NET: Registered PF_BLUETOOTH protocol family
> [   13.121270] Bluetooth: HCI device and connection manager initialized
> [   13.121281] Bluetooth: HCI socket layer initialized
> [   13.121286] Bluetooth: L2CAP socket layer initialized
> [   13.121297] Bluetooth: SCO socket layer initialized
> [   13.132879] cfg80211: Loading compiled-in X.509 certificates for 
> regulatory database
> [   13.164278] Bluetooth: HCI UART driver ver 2.3
> [   13.164293] Bluetooth: HCI UART protocol H4 registered
> [   13.166608] raspberrypi-firmware soc:firmware: Request 0x00030066 
> returned status 0x80000001
> [   13.166633] vc4-drm gpu: [drm] Couldn't stop firmware display 
> driver: -22
> [   13.166717] vc4-drm gpu: bound fe400000.hvs (ops vc4_drm_unregister 
> [vc4])
> [   13.176173] Bluetooth: HCI UART protocol Broadcom registered
> [   13.182365] hci_uart_bcm serial0-0: supply vbat not found, using 
> dummy regulator
> [   13.182505] hci_uart_bcm serial0-0: supply vddio not found, using 
> dummy regulator
> [   13.300636] uart-pl011 fe201000.serial: no DMA platform data
> [   13.422683] raspberrypi-firmware soc:firmware: Request 0x00030066 
> returned status 0x80000001
> [   13.422700] vc4-drm gpu: [drm] Couldn't stop firmware display 
> driver: -22
> [   13.422788] vc4-drm gpu: bound fe400000.hvs (ops vc4_drm_unregister 
> [vc4])
> [   13.458620] bcmgenet fd580000.ethernet: GENET 5.0 EPHY: 0x0000
> [   13.461925] raspberrypi-firmware soc:firmware: Request 0x00030066 
> returned status 0x80000001
> [   13.461941] vc4-drm gpu: [drm] Couldn't stop firmware display 
> driver: -22
> [   13.462006] vc4-drm gpu: bound fe400000.hvs (ops vc4_drm_unregister 
> [vc4])
> [   13.469287] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [   13.507497] vc4-drm gpu: bound fef00700.hdmi (ops 
> vc4_drm_unregister [vc4])
> [   13.521840] brcmfmac: brcmf_fw_alloc_request: using 
> brcm/brcmfmac43456-sdio for chip BCM4345/9
> [   13.522128] brcmfmac mmc0:0001:1: Direct firmware load for 
> brcm/brcmfmac43456-sdio.raspberrypi,400.bin failed with error -2
> [   13.535444] brcmfmac mmc0:0001:1: Direct firmware load for 
> brcm/brcmfmac43456-sdio.raspberrypi,400.txt failed with error -2
> [   13.564153] Bluetooth: hci0: BCM: chip id 130
> [   13.564675] Bluetooth: hci0: BCM: features 0x0f
> [   13.566157] Bluetooth: hci0: BCM4345C5
> [   13.566164] Bluetooth: hci0: BCM4345C5 (003.006.006) build 0000
> [   13.568434] Bluetooth: hci0: BCM4345C5 'brcm/BCM4345C5.hcd' Patch
> [   13.570485] unimac-mdio unimac-mdio.-19: Broadcom UniMAC MDIO bus
> [   13.576820] vc4-drm gpu: bound fef05700.hdmi (ops 
> vc4_drm_unregister [vc4])
> [   13.576967] vc4-drm gpu: bound fe004000.txp (ops vc4_drm_unregister 
> [vc4])
> [   13.577044] vc4-drm gpu: bound fe206000.pixelvalve (ops 
> vc4_drm_unregister [vc4])
> [   13.577118] vc4-drm gpu: bound fe207000.pixelvalve (ops 
> vc4_drm_unregister [vc4])
> [   13.577185] vc4-drm gpu: bound fe20a000.pixelvalve (ops 
> vc4_drm_unregister [vc4])
> [   13.577237] vc4-drm gpu: bound fe216000.pixelvalve (ops 
> vc4_drm_unregister [vc4])
> [   13.613504] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
>
> Best regards
>

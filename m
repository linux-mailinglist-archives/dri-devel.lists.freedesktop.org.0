Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74494FAAAF
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 22:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF5B10E51B;
	Sat,  9 Apr 2022 20:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2933 seconds by postgrey-1.36 at gabe;
 Sat, 09 Apr 2022 20:20:12 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4E010E341
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 20:20:12 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.94]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N8GAQ-1nz3d01vP6-014GJp; Sat, 09 Apr 2022 22:20:06 +0200
Message-ID: <82f3be35-a522-30c7-2606-428212814b5a@i2se.com>
Date: Sat, 9 Apr 2022 22:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: vc4: Couldn't stop firmware display driver during boot
Content-Language: en-US
To: Phil Elwell <phil@raspberrypi.com>
References: <69c4f25d-7b48-081b-f609-8e1fd5f950cb@i2se.com>
 <df9d739d-7dff-4e2b-d1cd-66a5c5887cab@i2se.com>
 <CAMEGJJ39JcDxNbdv7RqakoR7AVxC_kBPaNv0fSugRaGRSFPkzA@mail.gmail.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <CAMEGJJ39JcDxNbdv7RqakoR7AVxC_kBPaNv0fSugRaGRSFPkzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MpOzR1WSiIofxiWcJ7mLf8YRMFnYRI4esBgeCpJYvJGXKmaq6Le
 yJo6qmGTOvO4lc+cwSAbDXPa+7kUwAcMGqEVJ4ByQPMjMRfzwucyaNeL0WjBXesDGIL/9XN
 14VAuHb91wVdLne9tPPqNn75b1pHzflICSKcFySAobrRCUpYkV2vU2y3GU5nfLO791ssMs7
 T1VKuuz9pbBXRSmRjChAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4kv17qaEInk=:q03oH1wfi8E4O7VWOFN+Fs
 nSLj94rS2sZ3UDY0gm6QPkxck2e/4Vvp79X4YQQRE61pWMz7P+AbYMtfaY8uiS3gyvibn5kaX
 3+KrI2GWDWpWaa4dKRnJERuMZ4Bon6Ug2Ri0cGz0mT19TqYufSxYPI4iijLSmv8cqqRg2HOv0
 TW7t7BcuaEsyM12Qjxt4KmK+evECVD7QKgi4NFstVpPKur3Ib7yV3r+hqJSPFHi4UyKkcGYYK
 wg4ZLNzjLO3REI/5jUprOlpmp9ZHUwcvGXP/YJr2nKQeS/3eAgFDuiY303DujdM9Z92E4xBva
 Nl2U7k+QAhdW4Bn0OBRU/ROTBSp+LJKrSmafoqAkZT7wmFQuIifiOLeD6gWcINPPGcd+/iFU6
 dFQl1A+oSLjk2zpgGXd+aM593ut6IDLciq1TYnx4qTj3nZlolTbDLMzWgOgFpF5bVLRHKUDlA
 OZS1rld7wUwWridFzY8qXl7kmbvmoRTSvjeNt3czseZmsMXCsvSJmN5RdSLNGwkoiM8Aef246
 jYd/Vx1dDGS+RDep2d/lG4elcbzhXxFWuB9TrkuI/F6JoBdjmo21tbxby+pn1yfSMGNPq51uz
 fMC2KDf8JncybAM7gpkLNnfQeyteC59WZstsqgvWMdW5RjwYTOsgA9StNPd8fGRkUXjrJFjfZ
 4gEyDSmDgWhCTKa+d7oPtvqTneBu7HkzxBqO8WKA2QG2+b98kTTaNURbjT4/aotPlze5xjN3t
 LcIgvbuY2usEaWFE
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

Hi Phil,

Am 09.04.22 um 22:03 schrieb Phil Elwell:
> You know the drill, Stefan - what's in your config.txt?

sure. Everything commented out.

Regards

>
> Phil
>
> On Sat, 9 Apr 2022, 20:26 Stefan Wahren, <stefan.wahren@i2se.com> wrote:
>
>     Hi,
>
>     today i tested Linux 5.18-rc1 on my Raspberry Pi 400 connected to my
>     HDMI display (multi_v7_defconfig + CONFIG_ARM_LPAE, firmware:
>     2021-01-08T14:31:16) and i'm getting these strange errors from
>     raspberrypi-firmware driver / vc4 during boot:
>
>     [   13.094733] fb0: switching to vc4 from simple
>     [   13.110759] Console: switching to colour dummy device 80x30
>     [   13.120691] raspberrypi-firmware soc:firmware: Request 0x00030066
>     returned status 0x80000001
>     [   13.120715] vc4-drm gpu: [drm] Couldn't stop firmware display
>     driver: -22
>     [   13.120839] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>     [   13.121213] Bluetooth: Core ver 2.22
>     [   13.121266] NET: Registered PF_BLUETOOTH protocol family
>     [   13.121270] Bluetooth: HCI device and connection manager
>     initialized
>     [   13.121281] Bluetooth: HCI socket layer initialized
>     [   13.121286] Bluetooth: L2CAP socket layer initialized
>     [   13.121297] Bluetooth: SCO socket layer initialized
>     [   13.132879] cfg80211: Loading compiled-in X.509 certificates for
>     regulatory database
>     [   13.164278] Bluetooth: HCI UART driver ver 2.3
>     [   13.164293] Bluetooth: HCI UART protocol H4 registered
>     [   13.166608] raspberrypi-firmware soc:firmware: Request 0x00030066
>     returned status 0x80000001
>     [   13.166633] vc4-drm gpu: [drm] Couldn't stop firmware display
>     driver: -22
>     [   13.166717] vc4-drm gpu: bound fe400000.hvs (ops
>     vc4_drm_unregister
>     [vc4])
>     [   13.176173] Bluetooth: HCI UART protocol Broadcom registered
>     [   13.182365] hci_uart_bcm serial0-0: supply vbat not found, using
>     dummy regulator
>     [   13.182505] hci_uart_bcm serial0-0: supply vddio not found, using
>     dummy regulator
>     [   13.300636] uart-pl011 fe201000.serial: no DMA platform data
>     [   13.422683] raspberrypi-firmware soc:firmware: Request 0x00030066
>     returned status 0x80000001
>     [   13.422700] vc4-drm gpu: [drm] Couldn't stop firmware display
>     driver: -22
>     [   13.422788] vc4-drm gpu: bound fe400000.hvs (ops
>     vc4_drm_unregister
>     [vc4])
>     [   13.458620] bcmgenet fd580000.ethernet: GENET 5.0 EPHY: 0x0000
>     [   13.461925] raspberrypi-firmware soc:firmware: Request 0x00030066
>     returned status 0x80000001
>     [   13.461941] vc4-drm gpu: [drm] Couldn't stop firmware display
>     driver: -22
>     [   13.462006] vc4-drm gpu: bound fe400000.hvs (ops
>     vc4_drm_unregister
>     [vc4])
>     [   13.469287] cfg80211: Loaded X.509 cert 'sforshee:
>     00b28ddf47aef9cea7'
>     [   13.507497] vc4-drm gpu: bound fef00700.hdmi (ops
>     vc4_drm_unregister
>     [vc4])
>     [   13.521840] brcmfmac: brcmf_fw_alloc_request: using
>     brcm/brcmfmac43456-sdio for chip BCM4345/9
>     [   13.522128] brcmfmac mmc0:0001:1: Direct firmware load for
>     brcm/brcmfmac43456-sdio.raspberrypi,400.bin failed with error -2
>     [   13.535444] brcmfmac mmc0:0001:1: Direct firmware load for
>     brcm/brcmfmac43456-sdio.raspberrypi,400.txt failed with error -2
>     [   13.564153] Bluetooth: hci0: BCM: chip id 130
>     [   13.564675] Bluetooth: hci0: BCM: features 0x0f
>     [   13.566157] Bluetooth: hci0: BCM4345C5
>     [   13.566164] Bluetooth: hci0: BCM4345C5 (003.006.006) build 0000
>     [   13.568434] Bluetooth: hci0: BCM4345C5 'brcm/BCM4345C5.hcd' Patch
>     [   13.570485] unimac-mdio unimac-mdio.-19: Broadcom UniMAC MDIO bus
>     [   13.576820] vc4-drm gpu: bound fef05700.hdmi (ops
>     vc4_drm_unregister
>     [vc4])
>     [   13.576967] vc4-drm gpu: bound fe004000.txp (ops
>     vc4_drm_unregister
>     [vc4])
>     [   13.577044] vc4-drm gpu: bound fe206000.pixelvalve (ops
>     vc4_drm_unregister [vc4])
>     [   13.577118] vc4-drm gpu: bound fe207000.pixelvalve (ops
>     vc4_drm_unregister [vc4])
>     [   13.577185] vc4-drm gpu: bound fe20a000.pixelvalve (ops
>     vc4_drm_unregister [vc4])
>     [   13.577237] vc4-drm gpu: bound fe216000.pixelvalve (ops
>     vc4_drm_unregister [vc4])
>     [   13.613504] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
>
>     Best regards
>

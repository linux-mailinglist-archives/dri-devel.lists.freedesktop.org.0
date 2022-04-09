Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 338704FAA81
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 21:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D603E10E3E1;
	Sat,  9 Apr 2022 19:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 775 seconds by postgrey-1.36 at gabe;
 Sat, 09 Apr 2022 19:39:02 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7180E10E3E1
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 19:39:02 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.94]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MGygv-1nhxh72dNL-00E5Rf; Sat, 09 Apr 2022 21:25:58 +0200
Message-ID: <df9d739d-7dff-4e2b-d1cd-66a5c5887cab@i2se.com>
Date: Sat, 9 Apr 2022 21:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: vc4: Couldn't stop firmware display driver during boot
To: Maxime Ripard <maxime@cerno.tech>
References: <69c4f25d-7b48-081b-f609-8e1fd5f950cb@i2se.com>
Content-Language: en-US
In-Reply-To: <69c4f25d-7b48-081b-f609-8e1fd5f950cb@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:T5Cgns/zLpsR+OIQyY452nUddm3xQ6DhuqGI0Smf25OmVSmu0sC
 YzTKSgUMWVphDo0zW1qFB4WRjJzepW3OL+f00G4Y7l8JpibrU464rZCueU7nvV6ZTLg/eGv
 Xoz1gEz33qX7n0Z2g1QjjxKhYjndOUQ94NX4JOdw20Mz2jOvR+NJ29BaM21G1/5ItmwHdFr
 hhmIycasS5OEStKrUkSBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eGYuNNPxV+k=:BdiVuWEnY/OhnkfaaOiLy6
 u7UBmqvpOCMCQCCXXMRiuHMsUI8izqKwAB1OOu1fNnTaT26xgroVvvOJpyEXBnMDmWkXbk90h
 y/sYUXxEMbmmSK/WQYfzEmzx7DbGSDeqH/kP5Nq790IQPLX/Sh+/ph+ZckPzLlkZGSMFQUgKo
 iv8LZFfPiQrFCmaEaWeRFodU1WKycIm0UOePON9R9PzwYYe8QOtqOa2cAads8DXqwZAw+WaD7
 bXAe4u0K0dSt4GQIZ8X8jA4wTWX3vb3ODlZEUKyi+kLIQ9sfHvdlPXjGfxMQrFIKj6LOI9OhH
 7iQKO6Aa4Ia7877RvUhL7oJlZSYuKK7Z2VID6Z9Xdas8aFjp4t9HuXYIFsciCMrixx4SBZOD6
 7Md3cb/DALY+dIEHd65JqYZK76tj5hJ/N27RGVshQLyFNV6D0cDee6RXhddMgiZyI89VFxwEX
 Uj1MaQ7WN0D4BS3gpcm5zYnf3LSSKjg42hwZk8iZynq6hpq/4APED5HnWil6yks9iiJ+NWA8K
 plvvgneKCyzkghu3Fo/MjEI+vEde9+UcGQMINHBCr9FlS5f//gO9BiDUcBPd4c/IA4mLi1iIP
 vmRCQxIXs5hUk2ebRb2UPrwELPWAaPbl7WcOXABWC4cczVarxb208dVZBpVtQvTobPnChMjw8
 F4lTg4UT6/4LH+uIOy8sRcrj/Rw6fyBA1tvfyeRTy+jCzAywMTt1JKHPF8S3XlYNEuc53QW2m
 TALLUMclLoELW97k
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
 Phil Elwell <phil@raspberrypi.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

today i tested Linux 5.18-rc1 on my Raspberry Pi 400 connected to my 
HDMI display (multi_v7_defconfig + CONFIG_ARM_LPAE, firmware: 
2021-01-08T14:31:16) and i'm getting these strange errors from 
raspberrypi-firmware driver / vc4 during boot:

[   13.094733] fb0: switching to vc4 from simple
[   13.110759] Console: switching to colour dummy device 80x30
[   13.120691] raspberrypi-firmware soc:firmware: Request 0x00030066 
returned status 0x80000001
[   13.120715] vc4-drm gpu: [drm] Couldn't stop firmware display driver: -22
[   13.120839] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
[   13.121213] Bluetooth: Core ver 2.22
[   13.121266] NET: Registered PF_BLUETOOTH protocol family
[   13.121270] Bluetooth: HCI device and connection manager initialized
[   13.121281] Bluetooth: HCI socket layer initialized
[   13.121286] Bluetooth: L2CAP socket layer initialized
[   13.121297] Bluetooth: SCO socket layer initialized
[   13.132879] cfg80211: Loading compiled-in X.509 certificates for 
regulatory database
[   13.164278] Bluetooth: HCI UART driver ver 2.3
[   13.164293] Bluetooth: HCI UART protocol H4 registered
[   13.166608] raspberrypi-firmware soc:firmware: Request 0x00030066 
returned status 0x80000001
[   13.166633] vc4-drm gpu: [drm] Couldn't stop firmware display driver: -22
[   13.166717] vc4-drm gpu: bound fe400000.hvs (ops vc4_drm_unregister 
[vc4])
[   13.176173] Bluetooth: HCI UART protocol Broadcom registered
[   13.182365] hci_uart_bcm serial0-0: supply vbat not found, using 
dummy regulator
[   13.182505] hci_uart_bcm serial0-0: supply vddio not found, using 
dummy regulator
[   13.300636] uart-pl011 fe201000.serial: no DMA platform data
[   13.422683] raspberrypi-firmware soc:firmware: Request 0x00030066 
returned status 0x80000001
[   13.422700] vc4-drm gpu: [drm] Couldn't stop firmware display driver: -22
[   13.422788] vc4-drm gpu: bound fe400000.hvs (ops vc4_drm_unregister 
[vc4])
[   13.458620] bcmgenet fd580000.ethernet: GENET 5.0 EPHY: 0x0000
[   13.461925] raspberrypi-firmware soc:firmware: Request 0x00030066 
returned status 0x80000001
[   13.461941] vc4-drm gpu: [drm] Couldn't stop firmware display driver: -22
[   13.462006] vc4-drm gpu: bound fe400000.hvs (ops vc4_drm_unregister 
[vc4])
[   13.469287] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   13.507497] vc4-drm gpu: bound fef00700.hdmi (ops vc4_drm_unregister 
[vc4])
[   13.521840] brcmfmac: brcmf_fw_alloc_request: using 
brcm/brcmfmac43456-sdio for chip BCM4345/9
[   13.522128] brcmfmac mmc0:0001:1: Direct firmware load for 
brcm/brcmfmac43456-sdio.raspberrypi,400.bin failed with error -2
[   13.535444] brcmfmac mmc0:0001:1: Direct firmware load for 
brcm/brcmfmac43456-sdio.raspberrypi,400.txt failed with error -2
[   13.564153] Bluetooth: hci0: BCM: chip id 130
[   13.564675] Bluetooth: hci0: BCM: features 0x0f
[   13.566157] Bluetooth: hci0: BCM4345C5
[   13.566164] Bluetooth: hci0: BCM4345C5 (003.006.006) build 0000
[   13.568434] Bluetooth: hci0: BCM4345C5 'brcm/BCM4345C5.hcd' Patch
[   13.570485] unimac-mdio unimac-mdio.-19: Broadcom UniMAC MDIO bus
[   13.576820] vc4-drm gpu: bound fef05700.hdmi (ops vc4_drm_unregister 
[vc4])
[   13.576967] vc4-drm gpu: bound fe004000.txp (ops vc4_drm_unregister 
[vc4])
[   13.577044] vc4-drm gpu: bound fe206000.pixelvalve (ops 
vc4_drm_unregister [vc4])
[   13.577118] vc4-drm gpu: bound fe207000.pixelvalve (ops 
vc4_drm_unregister [vc4])
[   13.577185] vc4-drm gpu: bound fe20a000.pixelvalve (ops 
vc4_drm_unregister [vc4])
[   13.577237] vc4-drm gpu: bound fe216000.pixelvalve (ops 
vc4_drm_unregister [vc4])
[   13.613504] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0

Best regards


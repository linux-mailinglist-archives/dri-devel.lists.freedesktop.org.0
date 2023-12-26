Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DA681E79F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 14:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A4F10E057;
	Tue, 26 Dec 2023 13:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com
 [91.218.175.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520CF10E057
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 13:32:45 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1703597563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ku35WW1EA9BdBudQjC59w9ui3r1wOFBpgsP/3VnOfA=;
 b=yEe2C7ttyb3kCGqY8DWko+qxmO8hau2Ppq+yqcWod8fjtkTQqGmArtJGT5mkj7YQkyn1ew
 wmwFXsvVf1Ic8NbhYcjOn6IxMGpBymIOihJ1dqvDT6PzN74kvduulwhx/O9PBNpOIV6GnP
 V5oA2oj78Lpxm+r4rCpUMsFFDTiSt5h5z80IbFLrYOtFHswwQYdFcGX1G1BoKkPnKKoSuW
 /K5hFhO451UpEsb4Etc/k9DYdGhyyPCqJjENyqeSqZc0a1U1nfeqceeOMcyQfM7FBCzu5P
 LGnjLPKAkl8FDcJ9E1HXz5s5o25i3HiylZb1Fhjaqloerbk4HSX7ww32Re1BnA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>,
 Danct12 <danct12@riseup.net>, Manuel Traut <manut@mecka.net>
Subject: Re: [PATCH v2 0/4] arm64: rockchip: Pine64 pinetab2 support
Date: Tue, 26 Dec 2023 14:32:32 +0100
Message-ID: <2905432.tPBmtbmofK@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20231223-pinetab2-v2-0-ec1856d0030e@mecka.net>
References: <20231223-pinetab2-v2-0-ec1856d0030e@mecka.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1781507.039SJ5k1sN";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT
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
Cc: devicetree@vger.kernel.org, Manuel Traut <manut@mecka.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart1781507.039SJ5k1sN
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v2 0/4] arm64: rockchip: Pine64 pinetab2 support
Date: Tue, 26 Dec 2023 14:32:32 +0100
Message-ID: <2905432.tPBmtbmofK@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20231223-pinetab2-v2-0-ec1856d0030e@mecka.net>
References: <20231223-pinetab2-v2-0-ec1856d0030e@mecka.net>
MIME-Version: 1.0

On Saturday, 23 December 2023 16:20:14 CET Manuel Traut wrote:
> This adds support for the BOE TH101MB31IG002 LCD Panel used in Pinetab2 [1]
> and Pinetab-V [2] as well as the devictrees for the Pinetab2 v0.1 and v2.0.

I have a PineTab2 4GB/64GB model and I run a Debian Trixie system
*from an SDcard* (danctnix system is on eMMC). On it, I have a 6.6
kernel with my own patch set and a 6.7-rc7 kernel with this patch set.

Everything seems to work properly. I've now also tested the HDMI output
connector and that worked too :) So based on that, you can add my
Tested-By: Diederik de Haas <didi.debian@cknow.org>

I do see an error in dmesg wrt mmc. I had one with my own patch set
too, but a different one and it seems the mainline patch set fixes that,
but then runs into another issue: 
[    5.570059] dwmmc_rockchip fe2c0000.mmc: could not set regulator OCR (-22)
[    5.570835] dwmmc_rockchip fe2c0000.mmc: failed to enable vmmc regulator
[    5.616373] dwmmc_rockchip fe2c0000.mmc: could not set regulator OCR (-22)
[    5.621903] dwmmc_rockchip fe2c0000.mmc: failed to enable vmmc regulator

Both also have an error wrt `goodix_911_cfg.bin` firmware, but the error
could be because Debian kernel 'upgraded' a warning to an error.
I've searched online for that filename, but haven't found anything.
The touchscreen works, so I guess that one can be ignored.

kernel 6.7-rc7 + mainline patch set:
===========================================================
# uname -a
Linux pinetab2 6.7-rc7+unreleased-arm64 #1 SMP Debian 6.7~rc7-1~pine64 (2023-12-24) aarch64 GNU/Linux
# dmesg --level emerg,alert,crit
# dmesg --level emerg,alert,crit,err
[    5.570059] dwmmc_rockchip fe2c0000.mmc: could not set regulator OCR (-22)
[    5.570835] dwmmc_rockchip fe2c0000.mmc: failed to enable vmmc regulator
[    5.616373] dwmmc_rockchip fe2c0000.mmc: could not set regulator OCR (-22)
[    5.621903] dwmmc_rockchip fe2c0000.mmc: failed to enable vmmc regulator
[   19.569452] Goodix-TS 1-005d: firmware: failed to load goodix_911_cfg.bin (-2)
[   19.575504] firmware_class: See https://wiki.debian.org/Firmware for information about missing firmware
[   19.613497] Goodix-TS 1-005d: firmware: failed to load goodix_911_cfg.bin (-2)
# dmesg | grep mmc
[    3.782844] dwmmc_rockchip fe2c0000.mmc: IDMAC supports 32-bit address mode.
[    3.783027] dwmmc_rockchip fe2c0000.mmc: Using internal DMA controller.
[    3.783132] dwmmc_rockchip fe2c0000.mmc: Version ID is 270a
[    3.783314] dwmmc_rockchip fe2c0000.mmc: DW MMC controller at irq 24,32 bit host data width,256 deep fifo
[    3.853034] dwmmc_rockchip fe2b0000.mmc: IDMAC supports 32-bit address mode.
[    3.853859] dwmmc_rockchip fe2b0000.mmc: Using internal DMA controller.
[    3.854492] dwmmc_rockchip fe2b0000.mmc: Version ID is 270a
[    3.856863] dwmmc_rockchip fe2b0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[    3.861731] dwmmc_rockchip fe2c0000.mmc: IDMAC supports 32-bit address mode.
[    3.862459] dwmmc_rockchip fe2c0000.mmc: Using internal DMA controller.
[    3.863088] dwmmc_rockchip fe2c0000.mmc: Version ID is 270a
[    3.863656] dwmmc_rockchip fe2c0000.mmc: DW MMC controller at irq 24,32 bit host data width,256 deep fifo
[    3.870506] dwmmc_rockchip fe2c0000.mmc: Failed getting OCR mask: -22
[    4.015316] dwmmc_rockchip fe2b0000.mmc: IDMAC supports 32-bit address mode.
[    4.016042] dwmmc_rockchip fe2b0000.mmc: Using internal DMA controller.
[    4.016660] dwmmc_rockchip fe2b0000.mmc: Version ID is 270a
[    4.017223] dwmmc_rockchip fe2b0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[    4.034954] dwmmc_rockchip fe2c0000.mmc: IDMAC supports 32-bit address mode.
[    4.035772] dwmmc_rockchip fe2c0000.mmc: Using internal DMA controller.
[    4.037119] dwmmc_rockchip fe2c0000.mmc: Version ID is 270a
[    4.039868] dwmmc_rockchip fe2c0000.mmc: DW MMC controller at irq 24,32 bit host data width,256 deep fifo
[    4.041248] dwmmc_rockchip fe2c0000.mmc: Failed getting OCR mask: -22
[    5.172937] dwmmc_rockchip fe2b0000.mmc: IDMAC supports 32-bit address mode.
[    5.175108] dwmmc_rockchip fe2b0000.mmc: Using internal DMA controller.
[    5.175750] dwmmc_rockchip fe2b0000.mmc: Version ID is 270a
[    5.176311] dwmmc_rockchip fe2b0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[    5.179484] dwmmc_rockchip fe2b0000.mmc: Got CD GPIO
[    5.193439] mmc_host mmc0: Bus speed (slot 0) = 375000Hz (slot req 400000Hz, actual 375000HZ div = 0)
[    5.259322] mmc_host mmc0: Bus speed (slot 0) = 150000000Hz (slot req 150000000Hz, actual 150000000HZ div = 0)
[    5.332873] dwmmc_rockchip fe2b0000.mmc: Successfully tuned phase to 254
[    5.332922] mmc0: new ultra high speed SDR104 SDHC card at address 59b4
[    5.335025] mmcblk0: mmc0:59b4 00000 14.9 GiB
[    5.345735]  mmcblk0: p1 p2
[    5.563710] dwmmc_rockchip fe2c0000.mmc: IDMAC supports 32-bit address mode.
[    5.564608] dwmmc_rockchip fe2c0000.mmc: Using internal DMA controller.
[    5.565399] dwmmc_rockchip fe2c0000.mmc: Version ID is 270a
[    5.566101] dwmmc_rockchip fe2c0000.mmc: DW MMC controller at irq 24,32 bit host data width,256 deep fifo
[    5.568350] dwmmc_rockchip fe2c0000.mmc: Failed getting OCR mask: -22
[    5.569190] mmc_host mmc2: card is non-removable.
[    5.570059] dwmmc_rockchip fe2c0000.mmc: could not set regulator OCR (-22)
[    5.570835] dwmmc_rockchip fe2c0000.mmc: failed to enable vmmc regulator
[    5.585194] mmc_host mmc2: Bus speed (slot 0) = 375000Hz (slot req 400000Hz, actual 375000HZ div = 0)
[    5.616373] dwmmc_rockchip fe2c0000.mmc: could not set regulator OCR (-22)
[    5.621903] dwmmc_rockchip fe2c0000.mmc: failed to enable vmmc regulator
[    5.635189] mmc_host mmc2: Bus speed (slot 0) = 375000Hz (slot req 375000Hz, actual 375000HZ div = 0)
[    5.670372] mmc2: Failed to initialize a non-removable card
[    6.080928] EXT4-fs (mmcblk0p2): mounted filesystem 9aca1904-b511-411f-bb28-4ecfbf1b4061 ro with ordered data mode. Quota mode: none.
[    9.969704] EXT4-fs (mmcblk0p2): re-mounted 9aca1904-b511-411f-bb28-4ecfbf1b4061 r/w. Quota mode: none.
[   11.095737] EXT4-fs (mmcblk0p2): resizing filesystem from 3903227 to 3903227 blocks
[   19.432869] mmc1: SDHCI controller on fe310000.mmc [fe310000.mmc] using ADMA
[   19.569396] mmc1: new HS200 MMC card at address 0001
[   19.574273] mmcblk1: mmc1:0001 SPeMMC 58.2 GiB
[   19.737723]  mmcblk1: p1 p2
[   19.744563] mmcblk1boot0: mmc1:0001 SPeMMC 4.00 MiB
[   19.757787] mmcblk1boot1: mmc1:0001 SPeMMC 4.00 MiB
[   19.833373] mmcblk1rpmb: mmc1:0001 SPeMMC 4.00 MiB, chardev (240:0)
===========================================================
kernel 6.6 + my patch set:
===========================================================
# uname -a
Linux pinetab2 6.6.0-0-pine64-arm64 #1 SMP Debian 6.6-1~pine64 (2023-11-04) aarch64
# dmesg --level emerg,alert,crit
# dmesg --level emerg,alert,crit,err
[    5.632076] mmc0: tuning execution failed: -5
[    5.632089] mmc0: error -5 whilst initialising SD card
[    5.712059] mmc0: tuning execution failed: -5
[   21.192647] Goodix-TS 1-005d: firmware: failed to load goodix_911_cfg.bin (-2)
[   21.196489] firmware_class: See https://wiki.debian.org/Firmware for information about missing firmware
[   21.212984] Goodix-TS 1-005d: firmware: failed to load goodix_911_cfg.bin (-2)
[   21.632392] ov5648 2-0036: failed to find 168000000 clk rate in endpoint link-frequencies
# dmesg | grep mmc
[    4.184334] dwmmc_rockchip fe2b0000.mmc: IDMAC supports 32-bit address mode.
[    4.185120] dwmmc_rockchip fe2b0000.mmc: Using internal DMA controller.
[    4.185745] dwmmc_rockchip fe2b0000.mmc: Version ID is 270a
[    4.186375] dwmmc_rockchip fe2b0000.mmc: DW MMC controller at irq 30,32 bit host data width,256 deep fifo
[    4.186549] dwmmc_rockchip fe2c0000.mmc: IDMAC supports 32-bit address mode.
[    4.188064] dwmmc_rockchip fe2c0000.mmc: Using internal DMA controller.
[    4.188702] dwmmc_rockchip fe2c0000.mmc: Version ID is 270a
[    4.189380] dwmmc_rockchip fe2c0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[    4.235598] dwmmc_rockchip fe2b0000.mmc: IDMAC supports 32-bit address mode.
[    4.236317] dwmmc_rockchip fe2b0000.mmc: Using internal DMA controller.
[    4.236988] dwmmc_rockchip fe2b0000.mmc: Version ID is 270a
[    4.237594] dwmmc_rockchip fe2b0000.mmc: DW MMC controller at irq 30,32 bit host data width,256 deep fifo
[    4.245532] dwmmc_rockchip fe2c0000.mmc: IDMAC supports 32-bit address mode.
[    4.246253] dwmmc_rockchip fe2c0000.mmc: Using internal DMA controller.
[    4.246861] dwmmc_rockchip fe2c0000.mmc: Version ID is 270a
[    4.247415] dwmmc_rockchip fe2c0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[    4.368444] dwmmc_rockchip fe2b0000.mmc: IDMAC supports 32-bit address mode.
[    4.370700] dwmmc_rockchip fe2b0000.mmc: Using internal DMA controller.
[    4.371345] dwmmc_rockchip fe2b0000.mmc: Version ID is 270a
[    4.371969] dwmmc_rockchip fe2b0000.mmc: DW MMC controller at irq 30,32 bit host data width,256 deep fifo
[    4.374128] dwmmc_rockchip fe2c0000.mmc: IDMAC supports 32-bit address mode.
[    4.375122] dwmmc_rockchip fe2c0000.mmc: Using internal DMA controller.
[    4.375752] dwmmc_rockchip fe2c0000.mmc: Version ID is 270a
[    4.377884] dwmmc_rockchip fe2c0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[    5.542858] dwmmc_rockchip fe2b0000.mmc: IDMAC supports 32-bit address mode.
[    5.543575] dwmmc_rockchip fe2b0000.mmc: Using internal DMA controller.
[    5.543970] dwmmc_rockchip fe2c0000.mmc: IDMAC supports 32-bit address mode.
[    5.544176] dwmmc_rockchip fe2b0000.mmc: Version ID is 270a
[    5.544894] dwmmc_rockchip fe2c0000.mmc: Using internal DMA controller.
[    5.545867] dwmmc_rockchip fe2b0000.mmc: DW MMC controller at irq 30,32 bit host data width,256 deep fifo
[    5.546117] dwmmc_rockchip fe2c0000.mmc: Version ID is 270a
[    5.548155] dwmmc_rockchip fe2c0000.mmc: DW MMC controller at irq 31,32 bit host data width,256 deep fifo
[    5.549753] dwmmc_rockchip fe2b0000.mmc: Got CD GPIO
[    5.550997] dwmmc_rockchip fe2c0000.mmc: allocated mmc-pwrseq
[    5.551557] mmc_host mmc2: card is non-removable.
[    5.563821] mmc_host mmc0: Bus speed (slot 0) = 375000Hz (slot req 400000Hz, actual 375000HZ div = 0)
[    5.630780] mmc_host mmc0: Bus speed (slot 0) = 150000000Hz (slot req 150000000Hz, actual 150000000HZ div = 0)
[    5.632066] dwmmc_rockchip fe2b0000.mmc: All phases bad!
[    5.632076] mmc0: tuning execution failed: -5
[    5.632089] mmc0: error -5 whilst initialising SD card
[    5.646986] mmc_host mmc0: Bus speed (slot 0) = 375000Hz (slot req 375000Hz, actual 375000HZ div = 0)
[    5.710777] mmc_host mmc0: Bus speed (slot 0) = 150000000Hz (slot req 150000000Hz, actual 150000000HZ div = 0)
[    5.712050] dwmmc_rockchip fe2b0000.mmc: All phases bad!
[    5.712059] mmc0: tuning execution failed: -5
[    5.728169] mmc_host mmc0: Bus speed (slot 0) = 375000Hz (slot req 375000Hz, actual 375000HZ div = 0)
[    5.768379] mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 50000000Hz, actual 50000000HZ div = 0)
[    5.768503] mmc0: new high speed SDHC card at address 59b4
[    5.770692] mmcblk0: mmc0:59b4 00000 14.9 GiB
[    5.772990] mmc_host mmc2: Bus speed (slot 0) = 375000Hz (slot req 400000Hz, actual 375000HZ div = 0)
[    5.791753]  mmcblk0: p1 p2
[    6.962745] EXT4-fs (mmcblk0p2): mounted filesystem 9aca1904-b511-411f-bb28-4ecfbf1b4061 ro with ordered data mode. Quota mode: none.
[    8.264296] mmc2: Skipping voltage switch
[    8.280973] mmc_host mmc2: Bus speed (slot 0) = 50000000Hz (slot req 50000000Hz, actual 50000000HZ div = 0)
[    8.293741] mmc2: new high speed SDIO card at address 0001
[   11.101267] EXT4-fs (mmcblk0p2): re-mounted 9aca1904-b511-411f-bb28-4ecfbf1b4061 r/w. Quota mode: none.
[   12.839514] EXT4-fs (mmcblk0p2): resizing filesystem from 3903227 to 3903227 blocks
[   21.248940] mmc1: SDHCI controller on fe310000.mmc [fe310000.mmc] using ADMA
[   21.345979] mmc1: new HS200 MMC card at address 0001
[   21.357326] mmcblk1: mmc1:0001 SPeMMC 58.2 GiB
[   21.462230]  mmcblk1: p1 p2
[   21.466068] mmcblk1boot0: mmc1:0001 SPeMMC 4.00 MiB
[   21.478585] mmcblk1boot1: mmc1:0001 SPeMMC 4.00 MiB
[   21.516472] mmcblk1rpmb: mmc1:0001 SPeMMC 4.00 MiB, chardev (240:0)
===========================================================

Cheers,
  Diederik
--nextPart1781507.039SJ5k1sN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZYrV8AAKCRDXblvOeH7b
bhFQAQDJNk7n8SiLB0L7vkRNoQpBtdtNMQYY87Zt8wJhnYrEcgD/a00CnD0kuSxD
JXrz3wGAyA10JRu8wKpOPzm8fAEzqwU=
=F1jR
-----END PGP SIGNATURE-----

--nextPart1781507.039SJ5k1sN--




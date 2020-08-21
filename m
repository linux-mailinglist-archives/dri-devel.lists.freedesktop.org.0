Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C687D24E68C
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD1A6E44B;
	Sat, 22 Aug 2020 09:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 714 seconds by postgrey-1.36 at gabe;
 Fri, 21 Aug 2020 13:37:38 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91776E14D;
 Fri, 21 Aug 2020 13:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1598017057;
 s=strato-dkim-0002; d=jm0.eu;
 h=Date:Message-ID:Subject:From:Cc:To:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=FCKIKARwVIetWFi6dyG9xjFIq5g1aahe66mLyLrDFeI=;
 b=j4wlabap6hbfOU4shS9gqTaM8FX/r0y/wGxpel8soEz+J/NZFRjJsluwHXpr4gCuu/
 SMNovi2bV+J9qWFUf+JNeNFvkLAC/cZRKz1NVkrzeRztQA/EwCj+WcLxSmEwQoMkTxyg
 1EiREA5wjwNFfxrfubfidVUKKtv9LkgL7MIxRfgJCqNavFxhSv6WvwfyWV7QKJwu4Bz+
 AUYrojdxzO7V4H26cCn6VywA+jFli0OCM8i+pBZPNFF409x8BtvmsX56W0vvTFy2VEEz
 0Bo0OMhVEE+vY3fRcQZo9aCLW4vB/dH0wf5CeI+X3eIYDKlJH/d8jTk5iSofb4jly5Po
 DPcg==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPXvQCbXgI7t69COvnl6LERsNcX+38fzXJ1XO/JvLGWj59ag=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.10.7 AUTH)
 with ESMTPSA id e0624aw7LDPaCvu
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 21 Aug 2020 15:25:36 +0200 (CEST)
To: l.stach@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 christian.gmeiner@gmail.com
From: "Ing. Josua Mayer" <josua.mayer@jm0.eu>
Subject: etnaviv crashes on dove cubox since 5.7.0 with external abort on
 non-linefetch (0x1808) at 0xf09c8000
Autocrypt: addr=josua.mayer@jm0.eu; prefer-encrypt=mutual; keydata=
 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
 Si21CLNeIbliI0CNR5kPUY1ntw1JCOmOjKZm
Message-ID: <a26c4ca5-483d-2244-976e-505e2ac28df0@jm0.eu>
Date: Fri, 21 Aug 2020 15:25:36 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------21B561964634FDB81ED01857"
Content-Language: en-US
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------21B561964634FDB81ED01857
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Dear Maintainers, readers ...

While updating the solidrun cubox (dove) running debian from 5.6 to 5.7
I came across a new crash in etnaviv that did not occur before - and is
also present in 5.8.0:

[   33.042453] etnaviv etnaviv: bound f1840000.gpu (ops gpu_ops [etnaviv])
[   33.049195] etnaviv-gpu f1840000.gpu: model: GC600, revision: 19
[   33.055216] 8<--- cut here ---
[   33.058257] Unhandled fault: external abort on non-linefetch (0x1808)
at 0xf09c8000
[   33.065878] pgd = 3adc9ddb
[   33.068570] [f09c8000] *pgd=2e83f811, *pte=f1840653, *ppte=f1840453
[   33.074825] Internal error: : 1808 [#1] SMP ARM
... full logfile attached

A lengthy git bisect revealed:
815e45bbd4d3b00ddb2af017fbdab25110ed13a4 is the first bad commit
commit 815e45bbd4d3b00ddb2af017fbdab25110ed13a4
Author: Christian Gmeiner <christian.gmeiner@gmail.com>
Date:   Mon Jan 6 16:16:47 2020 +0100

    drm/etnaviv: determine product, customer and eco id

    They will be used for extended HWDB support.

    Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
    Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 11 ++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  6 +++---
 2 files changed, 13 insertions(+), 4 deletions(-)

Since I understand neither the crash nor the patch that triggers it, I
am posting this here in front of more trained eyes ;)

Yours sincerely
Josua Mayer

--------------21B561964634FDB81ED01857
Content-Type: text/x-log; charset=UTF-8;
 name="dove-etnaviv-dmesg.log"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="dove-etnaviv-dmesg.log"

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.6.0-rc1-josua+ (josua@localhost.localdomain) (gcc version 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4] (Linaro GCC 7.4-2019.02)) #12 SMP Fri Aug 21 14:59:26 CEST 2020
[    0.000000] CPU: ARMv7 Processor [560f5815] revision 5 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
[    0.000000] OF: fdt: Machine model: SolidRun CuBox
[    0.000000] Memory policy: Data cache writeback
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 16 MiB at 0x3f000000
[    0.000000] CPU: All CPU(s) started in SVC mode.
[    0.000000] percpu: Embedded 21 pages/cpu s53452 r8192 d24372 u86016
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 259840
[    0.000000] Kernel command line: console=ttyS0,115200 useNandHal=single ip=dhcp nfsroot=192.168.2.165:/srv/nfs/ root=/dev/nfs rw
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 995580K/1048576K available (10240K kernel code, 1247K rwdata, 3116K rodata, 2048K init, 331K bss, 36612K reserved, 16384K cma-reserved, 245760K highmem)
[    0.000000] random: get_random_u32 called from __kmem_cache_create+0x44/0x534 with crng_init=0
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] ftrace: allocating 35926 entries in 71 pages
[    0.000000] ftrace: allocated 71 pages with 4 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=1.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] clocksource: orion_clocksource: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 11467562657 ns
[    0.000008] sched_clock: 32 bits at 166MHz, resolution 6ns, wraps every 12884901885ns
[    0.000050] Switching to timer-based delay loop, resolution 6ns
[    0.002014] Console: colour dummy device 80x30
[    0.002074] Calibrating delay loop (skipped), value calculated using timer frequency.. 333.33 BogoMIPS (lpj=666666)
[    0.002095] pid_max: default: 32768 minimum: 301
[    0.002518] LSM: Security Framework initializing
[    0.002663] Yama: becoming mindful.
[    0.002855] AppArmor: AppArmor initialized
[    0.002876] TOMOYO Linux initialized
[    0.003008] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.003035] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.004666] CPU: Testing write buffer coherency: ok
[    0.005167] CPU0: thread -1, cpu 0, socket -1, mpidr 0
[    0.006577] Setting up static identity map for 0x300000 - 0x3000ac
[    0.007717] rcu: Hierarchical SRCU implementation.
[    0.011181] EFI services will not be available.
[    0.011794] smp: Bringing up secondary CPUs ...
[    0.011813] smp: Brought up 1 node, 1 CPU
[    0.011825] SMP: Total of 1 processors activated (333.33 BogoMIPS).
[    0.011833] CPU: All CPU(s) started in SVC mode.
[    0.012738] devtmpfs: initialized
[    0.019257] VFP support v0.3: implementor 56 architecture 2 part 20 variant 9 rev 5
[    0.019880] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.019913] futex hash table entries: 256 (order: 2, 16384 bytes, linear)
[    0.022142] pinctrl core: initialized pinctrl subsystem
[    0.023682] thermal_sys: Registered thermal governor 'fair_share'
[    0.023690] thermal_sys: Registered thermal governor 'step_wise'
[    0.023916] DMI not present or invalid.
[    0.024628] NET: Registered protocol family 16
[    0.027814] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.028608] audit: initializing netlink subsys (disabled)
[    0.030931] Dove 88AP510 SoC
[    0.030958] Tauros2: Disabling L2 prefetch.
[    0.030967] Tauros2: Disabling burst8 line fill.
[    0.030975] Tauros2: Enabling L2 cache.
[    0.030982] Tauros2: L2 cache support initialised in ARMv7 mode.
[    0.031516] No ATAGs?
[    0.031524] hw-breakpoint: debug architecture 0x4 unsupported.
[    0.032141] audit: type=2000 audit(0.028:1): state=initialized audit_enabled=0 res=1
[    0.032654] Serial: AMBA PL011 UART driver
[    1.024055] random: fast init done
[    5.857910] iommu: Default domain type: Translated 
[    5.858735] vgaarb: loaded
[    5.859661] mc: Linux media interface: v0.10
[    5.859721] videodev: Linux video capture interface: v2.00
[    5.859787] pps_core: LinuxPPS API ver. 1 registered
[    5.859796] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    5.859821] PTP clock support registered
[    5.861582] NetLabel: Initializing
[    5.861594] NetLabel:  domain hash size = 128
[    5.861601] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    5.861705] NetLabel:  unlabeled traffic allowed by default
[    5.862145] clocksource: Switched to clocksource orion_clocksource
[    5.962414] VFS: Disk quotas dquot_6.6.0
[    5.962524] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    5.963365] AppArmor: AppArmor Filesystem Enabled
[    5.975665] NET: Registered protocol family 2
[    5.976505] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 6144 bytes, linear)
[    5.976546] TCP established hash table entries: 8192 (order: 3, 32768 bytes, linear)
[    5.976625] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    5.976727] TCP: Hash tables configured (established 8192 bind 8192)
[    5.976864] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    5.976903] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
[    5.977123] NET: Registered protocol family 1
[    5.977156] NET: Registered protocol family 44
[    5.977172] PCI: CLS 0 bytes, default 64
[    5.977580] Trying to unpack rootfs image as initramfs...
[    6.325837] Freeing initrd memory: 5400K
[    6.328415] workingset: timestamp_bits=14 max_order=18 bucket_order=4
[    6.339888] zbud: loaded
[    6.341024] Key type asymmetric registered
[    6.341037] Asymmetric key parser 'x509' registered
[    6.341131] bounce: pool size: 64 pages
[    6.341198] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    6.341444] io scheduler mq-deadline registered
[    6.345306] dove-pinctrl f10d0200.pin-ctrl: falling back to hardcoded PMU resource
[    6.345568] dove-pinctrl f10d0200.pin-ctrl: [Firmware Bug]: Missing pinctrl regs in DTB. Please update your firmware.
[    6.346577] dove-pinctrl f10d0200.pin-ctrl: registered pinctrl driver
[    6.350538] mvebu-gpio f10d0420.gpio-ctrl: IRQ index 1 not found
[    6.350559] mvebu-gpio f10d0420.gpio-ctrl: IRQ index 2 not found
[    6.350576] mvebu-gpio f10d0420.gpio-ctrl: IRQ index 3 not found
[    6.356012] mv_xor f1060800.dma-engine: Marvell shared XOR driver
[    6.391619] mv_xor f1060800.dma-engine: Marvell XOR (Registers Mode): ( xor cpy intr )
[    6.391639] mv_xor f1060800.dma-engine: WARN: Device release is not defined so it is not safe to unbind this driver while in use
[    6.391938] mv_xor f1060900.dma-engine: Marvell shared XOR driver
[    6.427596] mv_xor f1060900.dma-engine: Marvell XOR (Registers Mode): ( xor cpy intr )
[    6.427615] mv_xor f1060900.dma-engine: WARN: Device release is not defined so it is not safe to unbind this driver while in use
[    6.431057] Serial: 8250/16550 driver, 5 ports, IRQ sharing disabled
[    6.434326] printk: console [ttyS0] disabled
[    6.434437] f1012000.serial: ttyS0 at MMIO 0xf1012000 (irq = 21, base_baud = 10416666) is a 16550A
[    7.138285] printk: console [ttyS0] enabled
[    7.143296] Serial: AMBA driver
[    7.147891] STM32 USART driver initialized
[    7.154906] libphy: Fixed MDIO Bus: probed
[    7.159665] mousedev: PS/2 mouse device common for all mice
[    7.167090] rtc-mv f10d8500.real-time-clock: registered as rtc0
[    7.177114] ledtrig-cpu: registered to indicate activity on CPUs
[    7.184041] drop_monitor: Initializing network drop monitor service
[    7.191445] NET: Registered protocol family 10
[    7.293559] Segment Routing with IPv6
[    7.297427] mip6: Mobile IPv6
[    7.300450] NET: Registered protocol family 17
[    7.305235] mpls_gso: MPLS GSO support
[    7.309217] ThumbEE CPU extension supported.
[    7.313532] Registering SWP/SWPB emulation handler
[    7.318344] PJ4 iWMMXt v2 coprocessor enabled.
[    7.323257] registered taskstats version 1
[    7.327467] zswap: loaded using pool lzo/zbud
[    7.332584] Key type ._fscrypt registered
[    7.336635] Key type .fscrypt registered
[    7.340565] Key type fscrypt-provisioning registered
[    7.345610] AppArmor: AppArmor sha1 policy hashing enabled
[    7.355411] rtc-mv f10d8500.real-time-clock: setting system clock to 2020-08-21T13:04:59 UTC (1598015099)
[    7.375929] Freeing unused kernel memory: 2048K
[    7.383086] Checked W+X mappings: passed, no W+X pages found
[    7.388746] Run /init as init process
Loading, please wait...
Starting version 246.2-1
[    8.447605] Registered IR keymap rc-empty
[    8.478436] rc rc0: gpio_ir_recv as /devices/platform/ir-receiver/rc/rc0
[    8.491822] i2c i2c-0: Added multiplexed i2c bus 1
[    8.504527] i2c i2c-0: Added multiplexed i2c bus 2
[    8.513268] watchdog: f1020300.watchdog: driver supplied timeout (4294967295) out of range
[    8.521605] watchdog: f1020300.watchdog: falling back to default timeout (25)
[    8.529038] i2c i2c-0: Added multiplexed i2c bus 3
[    8.626430] rc rc0: lirc_dev: driver gpio_ir_recv registered at minor = 0, raw IR receiver, no transmitter
[    8.707239] mv643xx_eth: MV-643xx 10/100/1000 ethernet driver version 1.4
[    8.721793] libphy: orion_mdio_bus: probed
[    8.725992] [Firmware Warn]: /mbus/internal-regs/mdio-bus@72004/ethernet-phy: Whitelisted compatible string. Please remove
[    8.862562] input: gpio_ir_recv as /devices/platform/ir-receiver/rc/rc0/input0
[    8.888840] sdhci: Secure Digital Host Controller Interface driver
[    8.895093] sdhci: Copyright(c) Pierre Ossman
[    8.992529] usbcore: registered new interface driver usbfs
[    9.014619] orion_wdt: Initial timeout 25 sec
[    9.053619] usbcore: registered new interface driver hub
[    9.157675] sdhci-pltfm: SDHCI platform and OF driver helper
[    9.196983] SCSI subsystem initialized
[    9.214707] usbcore: registered new device driver usb
[    9.309074] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    9.329328] mmc0 bounce up to 128 segments into one, max segment size 65536 bytes
[    9.455493] ehci-orion: EHCI orion driver
[    9.494504] orion-ehci f1050000.usb-host: EHCI Host Controller
[    9.550293] mmc0: SDHCI controller on f1092000.sdio-host [f1092000.sdio-host] using DMA
[    9.647708] orion-ehci f1050000.usb-host: new USB bus registered, assigned bus number 1
[    9.710062] sata_mv f10a0000.sata-host: slots 32 ports 1
[    9.787208] marvell-cesa f1030000.crypto-engine: CESA device successfully registered
[    9.837874] mv643xx_eth_port mv643xx_eth_port.0 eth0: port 0 with MAC address d0:63:b4:00:04:5e
[    9.856980] orion-ehci f1050000.usb-host: irq 25, io mem 0xf1050000
[    9.873940] scsi host0: sata_mv
[    9.878878] ata1: SATA max UDMA/133 irq 30
[    9.902332] orion-ehci f1050000.usb-host: USB 2.0 started, EHCI 1.00
[    9.924236] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.06
[    9.932549] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    9.939781] usb usb1: Product: EHCI Host Controller
[    9.944668] usb usb1: Manufacturer: Linux 5.6.0-rc1-josua+ ehci_hcd
[    9.950935] usb usb1: SerialNumber: f1050000.usb-host
[    9.995946] mmc0: new high speed SDHC card at address aaaa
[   10.007373] mmcblk0: mmc0:aaaa SL08G 7.40 GiB 
[   10.024046] spi-nor spi0.0: w25q32 (4096 Kbytes)
[   10.033053]  mmcblk0: p1 p2
[   10.175831] hub 1-0:1.0: USB hub found
[   10.246048] hub 1-0:1.0: 1 port detected
[   10.263146] orion-ehci f1051000.usb-host: EHCI Host Controller
[   10.292352] orion-ehci f1051000.usb-host: new USB bus registered, assigned bus number 2
[   10.326740] orion-ehci f1051000.usb-host: irq 26, io mem 0xf1051000
[   10.366479] orion-ehci f1051000.usb-host: USB 2.0 started, EHCI 1.00
[   10.373795] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.06
[   10.382108] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   10.389330] usb usb2: Product: EHCI Host Controller
[   10.394216] usb usb2: Manufacturer: Linux 5.6.0-rc1-josua+ ehci_hcd
[   10.400478] usb usb2: SerialNumber: f1051000.usb-host
[   10.405797] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl F300)
[   10.412560] ata1.00: ATA-10: INTENSO, S9FM02.6, max UDMA/133
[   10.418252] ata1.00: 250069680 sectors, multi 16: LBA48 NCQ (depth 31/32)
[   10.425522] ata1.00: configured for UDMA/133
[   10.430434] scsi 0:0:0:0: Direct-Access     ATA      INTENSO          02.6 PQ: 0 ANSI: 5
[   10.512473] hub 2-0:1.0: USB hub found
[   10.531267] hub 2-0:1.0: 1 port detected
[   10.680925] sd 0:0:0:0: [sda] 250069680 512-byte logical blocks: (128 GB/119 GiB)
[   10.699693] sd 0:0:0:0: [sda] Write Protect is off
[   10.711989] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   10.738344]  sda: sda1 sda2
[   10.805223] sd 0:0:0:0: [sda] Attached SCSI disk
[   10.998227] usb 1-1: new low-speed USB device number 2 using orion-ehci
Begin: Loading essential drivers ... [   11.106695] sd 0:0:0:0: Attached scsi generic sg0 type 0
[   11.167853] usb 2-1: new full-speed USB device number 2 using orion-ehci
[   11.209990] usb 1-1: New USB device found, idVendor=0603, idProduct=00f2, bcdDevice= 1.12
[   11.218218] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   11.225373] usb 1-1: Product: USB Keyboard
[   11.229477] usb 1-1: Manufacturer: NOVATEK
[   11.290529] hid: raw HID events driver (C) Jiri Kosina
[   11.385071] usbcore: registered new interface driver usbhid
[   11.390746] usbhid: USB HID core driver
[   11.451759] usb 2-1: New USB device found, idVendor=045e, idProduct=07b2, bcdDevice= 7.44
[   11.459997] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   11.467132] usb 2-1: Product: Microsoft® Nano Transceiver v1.0
[   11.473051] usb 2-1: Manufacturer: Microsoft
[   11.540216] input: NOVATEK USB Keyboard as /devices/platform/mbus/mbus:internal-regs/f1050000.usb-host/usb1/1-1/1-1:1.0/0003:0603:00F2.0001/input/input1
[   11.554497] input: Microsoft Microsoft® Nano Transceiver v1.0 as /devices/platform/mbus/mbus:internal-regs/f1051000.usb-host/usb2/2-1/2-1:1.0/0003:045E:07B2.0003/input/input2
[   11.642761] hid-generic 0003:045E:07B2.0003: input,hidraw0: USB HID v1.11 Keyboard [Microsoft Microsoft® Nano Transceiver v1.0] on usb-f1051000.usb-host-1/input0
[   11.735642] hid-generic 0003:0603:00F2.0001: input,hidraw1: USB HID v1.10 Keyboard [NOVATEK USB Keyboard] on usb-f1050000.usb-host-1/input0
[   11.757028] input: Microsoft Microsoft® Nano Transceiver v1.0 Mouse as /devices/platform/mbus/mbus:internal-regs/f1051000.usb-host/usb2/2-1/2-1:1.1/0003:045E:07B2.0004/input/input3
[   11.794264] input: NOVATEK USB Keyboard System Control as /devices/platform/mbus/mbus:internal-regs/f1050000.usb-host/usb1/1-1/1-1:1.1/0003:0603:00F2.0002/input/input5
[   11.814579] input: Microsoft Microsoft® Nano Transceiver v1.0 Consumer Control as /devices/platform/mbus/mbus:internal-regs/f1051000.usb-host/usb2/2-1/2-1:1.1/0003:045E:07B2.0004/input/input4
[   11.904359] input: NOVATEK USB Keyboard Consumer Control as /devices/platform/mbus/mbus:internal-regs/f1050000.usb-host/usb1/1-1/1-1:1.1/0003:0603:00F2.0002/input/input6
[   11.919786] hid-generic 0003:045E:07B2.0004: input,hidraw2: USB HID v1.11 Mouse [Microsoft Microsoft® Nano Transceiver v1.0] on usb-f1051000.usb-host-1/input1
[   11.965429] input: Microsoft Microsoft® Nano Transceiver v1.0 Consumer Control as /devices/platform/mbus/mbus:internal-regs/f1051000.usb-host/usb2/2-1/2-1:1.2/0003:045E:07B2.0005/input/input8
[   11.986279] input: NOVATEK USB Keyboard as /devices/platform/mbus/mbus:internal-regs/f1050000.usb-host/usb1/1-1/1-1:1.1/0003:0603:00F2.0002/input/input7
[   12.084211] input: Microsoft Microsoft® Nano Transceiver v1.0 System Control as /devices/platform/mbus/mbus:internal-regs/f1051000.usb-host/usb2/2-1/2-1:1.2/0003:045E:07B2.0005/input/input10
[   12.104274] hid-generic 0003:0603:00F2.0002: input,hiddev0,hidraw3: USB HID v1.10 Device [NOVATEK USB Keyboard] on usb-f1050000.usb-host-1/input1
[   12.138020] hid-generic 0003:045E:07B2.0005: input,hiddev1,hidraw4: USB HID v1.11 Device [Microsoft Microsoft® Nano Transceiver v1.0] on usb-f1051000.usb-host-1/input2
[   12.153396] FS-Cache: Loaded
[   12.315102] RPC: Registered named UNIX socket transport module.
[   12.321078] RPC: Registered udp transport module.
[   12.325786] RPC: Registered tcp transport module.
[   12.330491] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   12.665932] FS-Cache: Netfs 'nfs' registered for caching
done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/nfs-top ... done.
Begin: Running /scripts/nfs-premount ... done.
[   13.422000] process '/usr/bin/ipconfig' started with executable stack
IP-Config: eth0 hardware address d0:63:b4:00:04:5e mtu 1500 DHCP
IP-Config: no response after 2 secs - giving up
IP-Config: eth0 hardware address d0:63:b4:00:04:5e mtu 1500 DHCP
[   16.707556] mv643xx_eth_port mv643xx_eth_port.0 eth0: link up, 1000 Mb/s, full duplex, flow control disabled
[   16.717399] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
IP-Config: eth0 complete (dhcp from 192.168.2.1):
 address: 192.168.2.189    broadcast: 192.168.2.255    netmask: 255.255.255.0   
 gateway: 192.168.2.1      dns0     : 192.168.2.1      dns1   : 0.0.0.0         
 domain : lan                                                             
 rootserver: 192.168.2.1 rootpath: 
 filename  : 
done.
Begin: Running /scripts/nfs-bottom ... done.
Begin: Running /scripts/init-bottom ... done.
[   17.231481] Not activating Mandatory Access Control as /sbin/tomoyo-init does not exist.
[   17.677790] systemd[1]: systemd 246.2-1 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid)
[   17.700812] systemd[1]: Detected architecture arm.

Welcome to Debian GNU/Linux bullseye/sid!

[   17.736325] systemd[1]: Set hostname to <dove>.
[   19.680560] systemd[1]: Queued start job for default target Multi-User System.
[   19.690032] random: systemd: uninitialized urandom read (16 bytes read)
[   19.703095] systemd[1]: Created slice system-getty.slice.
[  OK  ] Created slice system-getty.slice.
[   19.726456] random: systemd: uninitialized urandom read (16 bytes read)
[   19.735410] systemd[1]: Created slice system-modprobe.slice.
[  OK  ] Created slice system-modprobe.slice.
[   19.758407] random: systemd: uninitialized urandom read (16 bytes read)
[   19.767250] systemd[1]: Created slice system-serial\x2dgetty.slice.
[  OK  ] Created slice system-serial\x2dgetty.slice.
[   19.792757] systemd[1]: Created slice User and Session Slice.
[  OK  ] Created slice User and Session Slice.
[   19.814866] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[  OK  ] Started Dispatch Password …ts to Console Directory Watch.
[   19.838766] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[  OK  ] Started Forward Password R…uests to Wall Directory Watch.
[   19.863879] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[  OK  ] Set up automount Arbitrary…s File System Automount Point.
[   19.890639] systemd[1]: Reached target Local Encrypted Volumes.
[  OK  ] Reached target Local Encrypted Volumes.
[   19.914823] systemd[1]: Reached target Paths.
[  OK  ] Reached target Paths.
[   19.934805] systemd[1]: Reached target Slices.
[  OK  ] Reached target Slices.
[   19.954616] systemd[1]: Reached target Swap.
[  OK  ] Reached target Swap.
[   20.008889] systemd[1]: Listening on RPCbind Server Activation Socket.
[  OK  ] Listening on RPCbind Server Activation Socket.
[   20.032732] systemd[1]: Listening on Syslog Socket.
[  OK  ] Listening on Syslog Socket.
[   20.050950] systemd[1]: Listening on initctl Compatibility Named Pipe.
[  OK  ] Listening on initctl Compatibility Named Pipe.
[   20.076723] systemd[1]: Listening on Journal Audit Socket.
[  OK  ] Listening on Journal Audit Socket.
[   20.099302] systemd[1]: Listening on Journal Socket (/dev/log).
[  OK  ] Listening on Journal Socket (/dev/log).
[   20.123533] systemd[1]: Listening on Journal Socket.
[  OK  ] Listening on Journal Socket.
[   20.145807] systemd[1]: Listening on udev Control Socket.
[  OK  ] Listening on udev Control Socket.
[   20.168012] systemd[1]: Listening on udev Kernel Socket.
[  OK  ] Listening on udev Kernel Socket.
[   20.191687] systemd[1]: Condition check resulted in Huge Pages File System being skipped.
[   20.207947] systemd[1]: Mounting POSIX Message Queue File System...
         Mounting POSIX Message Queue File System...
[   20.247173] systemd[1]: Mounting RPC Pipe File System...
         Mounting RPC Pipe File System...
[   20.301868] systemd[1]: Mounting Kernel Debug File System...
         Mounting Kernel Debug File System...
[   20.348229] systemd[1]: Mounting Kernel Trace File System...
         Mounting Kernel Trace File System...
[   20.383494] systemd[1]: Condition check resulted in Kernel Module supporting RPCSEC_GSS being skipped.
[   20.407553] systemd[1]: Starting Create list of static device nodes for the current kernel...
         Starting Create list of st…odes for the current kernel...
[   20.442671] systemd[1]: Condition check resulted in Load Kernel Module drm being skipped.
[   20.466271] systemd[1]: Condition check resulted in Set Up Additional Binary Formats being skipped.
[   20.489435] systemd[1]: Starting Journal Service...
         Starting Journal Service...
[   20.539584] systemd[1]: Starting Load Kernel Modules...
         Starting Load Kernel Modules...
[   20.598432] systemd[1]: Starting Remount Root and Kernel File Systems...
         Starting Remount Root and Kernel File Systems...
[   20.693094] systemd[1]: Starting Coldplug All udev Devices...
         Starting Coldplug All udev Devices...
[   20.780424] systemd[1]: Mounted POSIX Message Queue File System.
[  OK  ] Mounted POSIX Message Queue File System.
[   20.841009] systemd[1]: Mounted RPC Pipe File System.
[  OK  ] Mounted RPC Pipe File System.
[   20.871689] systemd[1]: Mounted Kernel Debug File System.
[  OK  ] Mounted Kernel Debug File System.
[   20.928467] systemd[1]: Mounted Kernel Trace File System.
[  OK  ] Mounted Kernel Trace File System.
[   20.988087] systemd[1]: Finished Create list of static device nodes for the current kernel.
[  OK  ] Finished Create list of st… nodes for the current kernel.
[   21.054377] systemd[1]: Finished Load Kernel Modules.
[  OK  ] Finished Load Kernel Modules.
[   21.096903] systemd[1]: Condition check resulted in FUSE Control File System being skipped.
[   21.143343] systemd[1]: Condition check resulted in Kernel Configuration File System being skipped.
[   21.189540] nfs: Deprecated parameter 'intr'
[   21.220284] systemd[1]: Starting Apply Kernel Variables...
         Starting Apply Kernel Variables...
[   21.301537] systemd[1]: Finished Remount Root and Kernel File Systems.
[  OK  ] Finished Remount Root and Kernel File Systems.
[   21.360936] systemd[1]: Condition check resulted in Rebuild Hardware Database being skipped.
[   21.398955] systemd[1]: Condition check resulted in Platform Persistent Storage Archival being skipped.
[   21.467782] systemd[1]: Starting Load/Save Random Seed...
         Starting Load/Save Random Seed...
[   21.568945] systemd[1]: Starting Create System Users...
         Starting Create System Users...
[   21.659432] systemd[1]: Finished Apply Kernel Variables.
[  OK  ] Finished Apply Kernel Variables.
[   21.982745] systemd[1]: Finished Create System Users.
[  OK  ] Finished Create System Users.
[   22.035747] systemd[1]: Starting Create Static Device Nodes in /dev...
         Starting Create Static Device Nodes in /dev...
[   22.426727] systemd[1]: Finished Create Static Device Nodes in /dev.
[  OK  ] Finished Create Static Device Nodes in /dev.
[   22.467580] systemd[1]: Reached target Local File Systems (Pre).
[  OK  ] Reached target Local File Systems (Pre).
[   22.502620] systemd[1]: Reached target Local File Systems.
[  OK  ] Reached target Local File Systems.
[   22.551750] systemd[1]: Starting Load AppArmor profiles...
         Starting Load AppArmor profiles...
[   22.637302] systemd[1]: Starting Preprocess NFS configuration...
[   22.677019] random: crng init done
[   22.680418] random: 7 urandom warning(s) missed due to ratelimiting
         Starting Preprocess NFS configuration...
[   22.702807] systemd[1]: Condition check resulted in Commit a transient machine-id on disk being skipped.
[   22.827902] systemd[1]: Starting Rule-based Manager for Device Events and Files...
         Starting Rule-based Manage…for Device Events and Files...
[   22.906378] systemd[1]: Finished Load/Save Random Seed.
[  OK  ] Finished Load/Save Random Seed.
[   22.949118] systemd[1]: nfs-config.service: Succeeded.
[   22.998453] systemd[1]: Finished Preprocess NFS configuration.
[  OK  ] Finished Preprocess NFS configuration.
[   23.048127] systemd[1]: Condition check resulted in RPC security service for NFS client and server being skipped.
[   23.100002] systemd[1]: Condition check resulted in RPC security service for NFS server being skipped.
[   23.145805] systemd[1]: Reached target NFS client services.
[  OK  ] Reached target NFS client services.
[   23.194637] systemd[1]: Condition check resulted in Store a System Token in an EFI Variable being skipped.
[   23.254438] systemd[1]: Finished Coldplug All udev Devices.
[  OK  ] Finished Coldplug All udev Devices.
[   23.370871] systemd[1]: Starting Helper to synchronize boot up for ifupdown...
         Starting Helper to synchronize boot up for ifupdown...
[   23.463939] audit: type=1400 audit(1598015115.604:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=308 comm="apparmor_parser"
[   23.539227] systemd[1]: Finished Helper to synchronize boot up for ifupdown.
[  OK  ] Finished Helper to synchronize boot up for ifupdown.
[   23.615436] audit: type=1400 audit(1598015115.756:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=311 comm="apparmor_parser"
[   23.653802] systemd[1]: Finished Load AppArmor profiles.
[  OK  ] Finished    23.677359] audit: type=1400 audit(1598015115.756:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=311 comm="apparmor_parser"
1;39mLoad AppArmor profiles.
[   23.707743] systemd[1]: Started Rule-based Manager for Device Events and Files.
[  OK  ] Started Rule-based Manager for Device Events and Files.
[   23.761951] systemd[1]: Starting Raise network interfaces...
         Starting Raise network interfaces...
[   23.835030] systemd[1]: Started Journal Service.
[  OK  ] Started Journal Service.
         Starting Flush Journal to Persistent Storage...
[  OK  ] Finished Raise network interfaces.
[  OK  ] Reached target Network.
[  OK  ] Finished Flush Journal to Persistent Storage.
         Starting Create Volatile Files and Directories...
[  OK  ] Found device /dev/ttyS0.
[  OK  ] Finished Create Volatile Files and Directories.
         Starting RPC bind portmap service...
         Starting Network Time Synchronization...
         Starting Update UTMP about System Boot/Shutdown...
[  OK  ] Started RPC bind portmap service.
[  OK  ] Reached target Remote File Systems (Pre).
[  OK  ] Reached target Remote File Systems.
[  OK  ] Reached target RPC Port Mapper.
[  OK  ] Finished Update UTMP about System Boot/Shutdown.
[  OK  ] Started Network Time Synchronization.
[  OK  ] Reached target System Initialization.
[  OK  ] Started Daily Cleanup of Temporary Directories.
[  OK  ] Reached target System Time Set.
[  OK  ] Reached target System Time Synchronized.
[  OK  ] Started Daily apt download activities.
[  OK  ] Started Daily apt upgrade and clean activities.
[  OK  ] Started Periodic ext4 Onli…ata Check for All Filesystems.
[  OK  ] Started Discard unused blocks once a week.
[  OK  ] Started Daily rotation of log files.
[  OK  ] Reached target Timers.
[  OK  ] Listening on D-Bus System Message Bus Socket.
[  OK  ] Reached target Sockets.
[  OK  ] Reached target Basic System.
[  OK  ] Started Regular background program processing daemon.
[  OK  ] Started D-Bus System Message Bus.
         Starting Remove Stale Onli…t4 Metadata Check Snapshots...
         Starting System Logging Service...
         Starting Execute Run-Once Apps...
         Starting OpenBSD Secure Shell server...
         Starting User Login Management...
         Starting Permit User Sessions...
[   33.042453] etnaviv etnaviv: bound f1840000.gpu (ops gpu_ops [etnaviv])
[   33.049195] etnaviv-gpu f1840000.gpu: model: GC600, revision: 19
[   33.055216] 8<--- cut here ---
[   33.058257] Unhandled fault: external abort on non-linefetch (0x1808) at 0xf09c8000
[   33.065878] pgd = 3adc9ddb
[   33.068570] [f09c8000] *pgd=2e83f811, *pte=f1840653, *ppte=f1840453
[   33.074825] Internal error: : 1808 [#1] SMP ARM
[   33.079337] Modules linked in: snd_soc_core(+) etnaviv(+) snd_pcm_dmaengine snd_pcm gpu_sched snd_timer snd soundcore joydev evdev nfsv3 nfs_acl nfs lockd grace sunrpc fscache autofs4 ip_tables x_tables drm hid_generic usbhid hid sg sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_common ofpart clk_si5351 spi_nor sata_mv libata ehci_orion sdhci_dove ehci_hcd marvell sdhci_pltfm scsi_mod dove_thermal sdhci usbcore mvmdio mv643xx_eth marvell_cesa libdes orion_wdt i2c_mv64xxx spi_orion gpio_ir_recv leds_gpio i2c_mux_pinctrl rc_core
[   33.126396] CPU: 0 PID: 326 Comm: systemd-udevd Not tainted 5.6.0-rc1-josua+ #12
[   33.133750] Hardware name: Marvell Dove
[   33.137621] PC is at etnaviv_hw_reset+0x78/0x204 [etnaviv]
[   33.143119] LR is at etnaviv_hw_reset+0x74/0x204 [etnaviv]
[   33.148578] pc : [<bf3bc820>]    lr : [<bf3bc81c>]    psr: 600f0113
[   33.154816] sp : e0313a68  ip : e0313a68  fp : e0313aa4
[   33.160017] r10: e04b4840  r9 : 00000100  r8 : bf3c31b4
[   33.165219] r7 : 00000001  r6 : fffefc49  r5 : c1304d00  r4 : 00000300
[   33.171716] r3 : 00000000  r2 : 00000100  r1 : f09c8000  r0 : e04b4840
[   33.178216] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[   33.185316] Control: 10c5387d  Table: 20388019  DAC: 00000051
[   33.191035] Process systemd-udevd (pid: 326, stack limit = 0x9c9c1b68)
[   33.197534] Stack: (0xe0313a68 to 0xe0314000)
[   33.201875] 3a60:                   e0313a98 e0313a78 bf3c31a4 c08ca97c e0313aa0 e04b4840
[   33.210014] 3a80: e0636d00 e0636d10 00000001 e0636d1c 00000000 c13f0c14 e0313ac4 e0313aa8
[   33.218154] 3aa0: bf3bd258 bf3bc7b4 e0636d00 e04b4c00 e0636d10 e04b5c10 e0313aec e0313ac8
[   33.226301] 3ac0: bf3b8648 bf3bcf10 e0645a00 e06456c0 00000018 e0645dc0 00000001 e0531840
[   33.234440] 3ae0: e0313b34 e0313af0 c08c569c bf3b8578 00000000 c13f0bf8 c0f4f80c 00000000
[   33.242588] 3b00: c13f0bf8 c0f4f7f0 c13f0bf8 e0645dc0 c13f0bf8 c13f0c0c c13f0c0c bf3b7cc4
[   33.250735] 3b20: 00000028 00000000 e0313b5c e0313b38 c08c5c4c c08c54a0 c0dc184c e04b5c10
[   33.258874] 3b40: 00000000 e04b5c10 bf3c2ae8 c130600c e0313b94 e0313b60 bf3b8794 c08c5b68
[   33.267013] 3b60: c0619570 da62adfc e0531840 da62adfc e04b5c10 e04b5c10 00000000 bf3c516c
[   33.275160] 3b80: 00000000 bf3c516c e0313bb4 e0313b98 c08cffe8 bf3b8714 c1484180 e04b5c10
[   33.283299] 3ba0: c1484184 00000000 e0313bec e0313bb8 c08cd628 c08cff9c 00000000 e04b5c10
[   33.291438] 3bc0: e0313bec e04b5c10 bf3c516c e0313c7c e04b5c10 00000001 c13f0bc8 c13f0bc8
[   33.299586] 3be0: e0313c24 e0313bf0 c08cdb0c c08cd360 bf3c516c bf3c516c e0313c7c e04b5c10
[   33.307734] 3c00: 00000001 bf3c516c e0313c7c e04b5c10 00000001 c13f0bc8 e0313c44 e0313c28
[   33.315881] 3c20: c08cdcf4 c08cd97c 00000000 e0313c7c c08cdc58 c130600c e0313c74 e0313c48
[   33.324029] 3c40: c08cb1a0 c08cdc64 e0313c74 ee83e16c e0531338 da62adfc e04b5c10 c130600c
[   33.332176] 3c60: e04b5c54 c130600c e0313cac e0313c78 c08cd2a8 c08cb144 e0313ccc e04b5c10
[   33.340324] 3c80: 00000001 da62adfc 00000cc0 e04b5c10 c13f10f8 e04b5c10 c130600c c13f0c30
[   33.348470] 3ca0: e0313cbc e0313cb0 c08cdd70 c08cd1d4 e0313cdc e0313cc0 c08cc2fc c08cdd60
[   33.356610] 3cc0: e04b5c10 c13f0f10 00000000 c130600c e0313d2c e0313ce0 c08c804c c08cc274
[   33.364757] 3ce0: c0c09b70 c13f0c1c c130600c 00000000 e04b5c00 c0402530 e0313d20 da62adfc
[   33.372905] 3d00: c08c6698 e04b5c00 00000000 e04b5c00 c0402530 ffffffff e04b5c10 c130600c
[   33.381052] 3d20: e0313d5c e0313d30 c08cfd4c c08c79d0 da62adfc e04b5c00 00000000 ef3f8308
[   33.389199] 3d40: c0402530 ffffffff 000000ff c130600c e0313d84 e0313d60 bf3cb124 c08cfc34
[   33.397338] 3d60: bf3c53c0 c130600c bf3cb04c c0402530 00000000 e0313f30 e0313dfc e0313d88
[   33.405478] 3d80: c0303914 bf3cb058 c0c1f0bc c0c1e4bc 00000001 e0645040 e0313dbc e0313da8
[   33.413625] 3da0: c0c1f124 c0c1f0ac 00000cc0 c054c268 e0313dfc e0313dc0 c054c268 c05596f8
[   33.421764] 3dc0: c0527800 c054a968 00000000 e06457c0 f0a97000 da62adfc e0645040 bf3c53c0
[   33.429902] 3de0: e0645040 e06457c0 c0402530 e0645064 e0313e24 e0313e00 c0408d74 c03038d0
[   33.438041] 3e00: e0313e24 e0313e10 c0527974 00000001 e0645040 00000001 e0313f0c e0313e28
[   33.446181] 3e20: c0407cd4 c0408d10 bf3c53cc 00007fff bf3c53c0 c0403c64 c130600c c0ec4ff8
[   33.454329] 3e40: c0ec500c c0ec4fec bf3d33b2 c0d082d4 bf3c53cc c0ec50d0 bf3c54d4 bf3c53c4
[   33.462476] 3e60: bf3c55b4 b6f6fe74 bf3c5408 bf3c53c0 00000000 c0fd7538 e0313f28 e0313ea0
[   33.470623] 3e80: e0313edc e0313e90 00000000 00000000 00000000 00000000 00000000 00000000
[   33.478770] 3ea0: 6e72656b 00006c65 00000000 00000000 00000000 00000000 00000000 00000000
[   33.486909] 3ec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 da62adfc
[   33.495048] 3ee0: 7fffffff c130600c 00000000 0000000f b6f6fe74 c0301204 e0312000 0000017b
[   33.503188] 3f00: e0313fa4 e0313f10 c0408464 c040584c 7fffffff 00000000 00000003 00000000
[   33.511334] 3f20: b6f71298 f0a97000 002d29d0 00000000 f0aa4910 f0aa8200 f0a97000 002d29d0
[   33.519473] 3f40: f0d690e8 f0d68ee4 f0cc7a68 00012000 00012d50 0000813c 00013cf1 bf3c52f0
[   33.527612] 3f60: 00000006 00000000 0000812c 00000036 00000037 00000020 00000015 00000011
[   33.535751] 3f80: 00000000 da62adfc b6f71298 00000000 67905800 0000017b 00000000 e0313fa8
[   33.543890] 3fa0: c03011e4 c04083b0 b6f71298 00000000 0000000f b6f6fe74 00000000 b6f70cdc
[   33.552030] 3fc0: b6f71298 00000000 67905800 0000017b 02297700 005213db 022ba378 bee447e0
[   33.560176] 3fe0: bee44710 bee44700 b6f69b89 b6e56ce2 400f0030 0000000f 00000000 00000000
[   33.568307] Backtrace: 
[   33.570819] [<bf3bc7a8>] (etnaviv_hw_reset [etnaviv]) from [<bf3bd258>] (etnaviv_gpu_init+0x354/0x894 [etnaviv])
[   33.580948]  r10:c13f0c14 r9:00000000 r8:e0636d1c r7:00000001 r6:e0636d10 r5:e0636d00
[   33.588741]  r4:e04b4840
[   33.591331] [<bf3bcf04>] (etnaviv_gpu_init [etnaviv]) from [<bf3b8648>] (etnaviv_bind+0xdc/0x168 [etnaviv])
[   33.601023]  r7:e04b5c10 r6:e0636d10 r5:e04b4c00 r4:e0636d00
[   33.606700] [<bf3b856c>] (etnaviv_bind [etnaviv]) from [<c08c569c>] (try_to_bring_up_master+0x208/0x2b4)
[   33.616138]  r9:e0531840 r8:00000001 r7:e0645dc0 r6:00000018 r5:e06456c0 r4:e0645a00
[   33.623857] [<c08c5494>] (try_to_bring_up_master) from [<c08c5c4c>] (component_master_add_with_match+0xf0/0x124)
[   33.633988]  r10:00000000 r9:00000028 r8:bf3b7cc4 r7:c13f0c0c r6:c13f0c0c r5:c13f0bf8
[   33.641774]  r4:e0645dc0
[   33.644338] [<c08c5b5c>] (component_master_add_with_match) from [<bf3b8794>] (etnaviv_pdev_probe+0x8c/0x114 [etnaviv])
[   33.654981]  r7:c130600c r6:bf3c2ae8 r5:e04b5c10 r4:00000000
[   33.660655] [<bf3b8708>] (etnaviv_pdev_probe [etnaviv]) from [<c08cffe8>] (platform_drv_probe+0x58/0xa8)
[   33.670094]  r8:bf3c516c r7:00000000 r6:bf3c516c r5:00000000 r4:e04b5c10
[   33.676766] [<c08cff90>] (platform_drv_probe) from [<c08cd628>] (really_probe+0x2d4/0x468)
[   33.684996]  r7:00000000 r6:c1484184 r5:e04b5c10 r4:c1484180
[   33.690632] [<c08cd354>] (really_probe) from [<c08cdb0c>] (driver_probe_device+0x19c/0x1d8)
[   33.698953]  r10:c13f0bc8 r9:c13f0bc8 r8:00000001 r7:e04b5c10 r6:e0313c7c r5:bf3c516c
[   33.706747]  r4:e04b5c10
[   33.709277] [<c08cd970>] (driver_probe_device) from [<c08cdcf4>] (__device_attach_driver+0x9c/0xfc)
[   33.718288]  r9:c13f0bc8 r8:00000001 r7:e04b5c10 r6:e0313c7c r5:bf3c516c r4:00000001
[   33.725995] [<c08cdc58>] (__device_attach_driver) from [<c08cb1a0>] (bus_for_each_drv+0x68/0xc8)
[   33.734736]  r7:c130600c r6:c08cdc58 r5:e0313c7c r4:00000000
[   33.740372] [<c08cb138>] (bus_for_each_drv) from [<c08cd2a8>] (__device_attach+0xe0/0x16c)
[   33.748595]  r7:c130600c r6:e04b5c54 r5:c130600c r4:e04b5c10
[   33.754231] [<c08cd1c8>] (__device_attach) from [<c08cdd70>] (device_initial_probe+0x1c/0x20)
[   33.762723]  r8:c13f0c30 r7:c130600c r6:e04b5c10 r5:c13f10f8 r4:e04b5c10
[   33.769395] [<c08cdd54>] (device_initial_probe) from [<c08cc2fc>] (bus_probe_device+0x94/0x9c)
[   33.777972] [<c08cc268>] (bus_probe_device) from [<c08c804c>] (device_add+0x688/0x76c)
[   33.785851]  r7:c130600c r6:00000000 r5:c13f0f10 r4:e04b5c10
[   33.791486] [<c08c79c4>] (device_add) from [<c08cfd4c>] (platform_device_add+0x124/0x254)
[   33.799625]  r10:c130600c r9:e04b5c10 r8:ffffffff r7:c0402530 r6:e04b5c00 r5:00000000
[   33.807412]  r4:e04b5c00
[   33.809976] [<c08cfc28>] (platform_device_add) from [<bf3cb124>] (etnaviv_init+0xd8/0xfb4 [etnaviv])
[   33.819075]  r10:c130600c r9:000000ff r8:ffffffff r7:c0402530 r6:ef3f8308 r5:00000000
[   33.826871]  r4:e04b5c00 r3:da62adfc
[   33.830471] [<bf3cb04c>] (etnaviv_init [etnaviv]) from [<c0303914>] (do_one_initcall+0x50/0x264)
[   33.839222]  r9:e0313f30 r8:00000000 r7:c0402530 r6:bf3cb04c r5:c130600c r4:bf3c53c0
[   33.846930] [<c03038c4>] (do_one_initcall) from [<c0408d74>] (do_init_module+0x70/0x250)
[   33.854990]  r8:e0645064 r7:c0402530 r6:e06457c0 r5:e0645040 r4:bf3c53c0
[   33.861667] [<c0408d04>] (do_init_module) from [<c0407cd4>] (load_module+0x2494/0x2978)
[   33.869631]  r6:00000001 r5:e0645040 r4:00000001
[   33.874232] [<c0405840>] (load_module) from [<c0408464>] (sys_finit_module+0xc0/0x110)
[   33.882111]  r10:0000017b r9:e0312000 r8:c0301204 r7:b6f6fe74 r6:0000000f r5:00000000
[   33.889897]  r4:c130600c
[   33.892426] [<c04083a4>] (sys_finit_module) from [<c03011e4>] (__sys_trace_return+0x0/0x1c)
[   33.900732] Exception stack(0xe0313fa8 to 0xe0313ff0)
[   33.905766] 3fa0:                   b6f71298 00000000 0000000f b6f6fe74 00000000 b6f70cdc
[   33.913907] 3fc0: b6f71298 00000000 67905800 0000017b 02297700 005213db 022ba378 bee447e0
[   33.922050] 3fe0: bee44710 bee44700 b6f69b89 b6e56ce2
[   33.927080]  r7:0000017b r6:67905800 r5:00000000 r4:b6f71298
[   33.932715] Code: e3894c02 f57ff04e eb3d8a43 e59a1384 (e5814000) 
[   33.938779] ---[ end trace 296da370ff6cfae6 ]---
[  OK  ] Started System Logging Service.
[   34.543959] mvebu-audio f10b4000.audio-controller: found external clock
[  OK  ] Finished Remove Stale Onli…ext4 Metadata Check Snapshots.
[  OK  ] Finished Execute Run-Once Apps.
[  OK  ] Finished Permit User Sessions.
[  OK  ] Started Getty on tty1.
[  OK  ] Started Serial Getty on ttyS0.
[  OK  ] Reached target Login Prompts.
[  OK  ] Started User Login Management.
[  OK  ] Started OpenBSD Secure Shell server.
[  OK  ] Reached target Multi-User System.
         Starting Update UTMP about System Runlevel Changes...
[  OK  ] Finished Update UTMP about System Runlevel Changes.

Debian GNU/Linux bullseye/sid dove ttyS0

--------------21B561964634FDB81ED01857
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------21B561964634FDB81ED01857--

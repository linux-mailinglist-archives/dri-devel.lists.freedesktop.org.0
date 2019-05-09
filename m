Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E85D18608
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470D389B05;
	Thu,  9 May 2019 07:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC7B899B3;
 Thu,  9 May 2019 02:06:37 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 4C2D63E93E;
 Thu,  9 May 2019 02:06:36 +0000 (UTC)
Date: Wed, 8 May 2019 22:06:35 -0400
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, jonathan@marek.ca, robh@kernel.org
Subject: Re: [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display support
Message-ID: <20190509020635.GA25884@basecamp>
References: <20190509020352.14282-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190509020352.14282-1-masneyb@onstation.org>
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1557367596;
 bh=MLB5xAp/wnMbBnVQNZV3VUpH2N4kXo3AjbG6Bf5jR6w=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=OwbTHk4V0c7ODB3IbxBXcRbs8izo0bTWkirVaXoLZfURk+cTckWxhvXTydVZ23DOY
 ntcQYHvyMBBjtTBuSdkxLaJVk5GjUmEh/S0UCcI6HpHI9T/KrL+F2h9C04+8apNsAL
 BhaSRyqOuj4BI+TABDzkdI8DvO88TVQ+USjzzt8M=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 08, 2019 at 10:03:46PM -0400, Brian Masney wrote:
> Here is a patch series that adds initial display support for the LG
> Nexus 5 (hammerhead) phone. It's not fully working so that's why some
> of these patches are RFC until we can get it fully working.
> 
> The phones boots into terminal mode, however there is a several second
> (or more) delay when writing to tty1 compared to when the changes are
> actually shown on the screen. The following errors are in dmesg:

I attached the full dmesg output with this patch series applied. I
enabled debugging messages for just the DRM subsystem.

Brian

--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="dmesg.txt"
Content-Transfer-Encoding: 8bit

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.1.0-rc6-next-20190426-00009-g75891c3edac4-dirty (masneyb@ins7386) (gcc version 8.1.1 20180626 (Red Hat Cross 8.1.1-3) (GCC)) #303 SMP PREEMPT Wed May 8 21:59:17 EDT 2019
[    0.000000] CPU: ARMv7 Processor [512f06f0] revision 0 (ARMv7), cr=10c5787d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
[    0.000000] OF: fdt: Machine model: LGE MSM 8974 HAMMERHEAD
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Reserved 256 MiB at 0x20000000
[    0.000000] On node 0 totalpages: 491776
[    0.000000]   Normal zone: 1536 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 164096 pages, LIFO batch:31
[    0.000000]   HighMem zone: 327680 pages, LIFO batch:63
[    0.000000] percpu: Embedded 17 pages/cpu s39756 r8192 d21684 u69632
[    0.000000] pcpu-alloc: s39756 r8192 d21684 u69632 alloc=17*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 490240
[    0.000000] Kernel command line: console=tty0 console=ttyMSM0,115200,n8 rootwait androidboot.hardware=hammerhead user_debug=31 maxcpus=2 msm_watchdog_v2.enable=1 PMOS_NO_OUTPUT_REDIRECT=1 uart_console=enable gpt=enable lge.kcal=0|0|0|x lge.rev=rev_11 androidboot.laf androidboot.emmc=true fastboot=true androidboot.serialno=019eef1708e40fd2 androidboot.bootloader=HHZ20h androidboot.baseband=msm androidboot.hardware.sku=D820 androidboot.hardware.ddr=hynix androidboot.hardware.display=orise androidboot.revision=11
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Memory: 1633208K/1967104K available (8192K kernel code, 834K rwdata, 3436K rodata, 1024K init, 266K bss, 71752K reserved, 262144K cma-reserved, 1310720K highmem)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] 	Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] random: get_random_bytes called from start_kernel+0x300/0x490 with crng_init=0
[    0.000000] arch_timer: cp15 and mmio timer(s) running at 19.20MHz (virt/virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000005] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.000017] Switching to timer-based delay loop, resolution 52ns
[    0.000410] Console: colour dummy device 80x30
[    0.000785] printk: console [tty0] enabled
[    0.000823] Calibrating delay loop (skipped), value calculated using timer frequency.. 38.40 BogoMIPS (lpj=192000)
[    0.000854] pid_max: default: 32768 minimum: 301
[    0.000984] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.001014] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.001504] *** VALIDATE proc ***
[    0.001629] *** VALIDATE cgroup1 ***
[    0.001651] *** VALIDATE cgroup2 ***
[    0.001676] CPU: Testing write buffer coherency: ok
[    0.001939] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.059943] Setting up static identity map for 0x300000 - 0x300060
[    0.079942] rcu: Hierarchical SRCU implementation.
[    0.120017] smp: Bringing up secondary CPUs ...
[    0.200453] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.200671] smp: Brought up 1 node, 2 CPUs
[    0.200705] SMP: Total of 2 processors activated (76.80 BogoMIPS).
[    0.200725] CPU: All CPU(s) started in SVC mode.
[    0.202148] devtmpfs: initialized
[    0.211750] VFP support v0.3: implementor 51 architecture 64 part 6f variant 2 rev 0
[    0.212072] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.212111] futex hash table entries: 1024 (order: 4, 65536 bytes)
[    0.221586] pinctrl core: initialized pinctrl subsystem
[    0.222779] NET: Registered protocol family 16
[    0.224668] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.225901] cpuidle: using governor menu
[    0.226527] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4 watchpoint registers.
[    0.226553] hw-breakpoint: maximum watchpoint size is 8 bytes.
[    0.268095] vgaarb: loaded
[    0.268597] SCSI subsystem initialized
[    0.268816] libata version 3.00 loaded.
[    0.269096] usbcore: registered new interface driver usbfs
[    0.269185] usbcore: registered new interface driver hub
[    0.269290] usbcore: registered new device driver usb
[    0.270505] Advanced Linux Sound Architecture Driver Initialized.
[    0.271640] clocksource: Switched to clocksource arch_sys_counter
[    0.624778] NET: Registered protocol family 2
[    0.625271] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 6144 bytes)
[    0.625313] TCP established hash table entries: 8192 (order: 3, 32768 bytes)
[    0.625381] TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
[    0.625472] TCP: Hash tables configured (established 8192 bind 8192)
[    0.625571] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    0.625610] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    0.625774] NET: Registered protocol family 1
[    0.626294] RPC: Registered named UNIX socket transport module.
[    0.626319] RPC: Registered udp transport module.
[    0.626341] RPC: Registered tcp transport module.
[    0.626363] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.626390] PCI: CLS 0 bytes, default 64
[    0.626644] Trying to unpack rootfs image as initramfs...
[    0.830413] Freeing initrd memory: 40224K
[    0.831171] hw perfevents: enabled with armv7_krait PMU driver, 5 counters available
[    0.833228] Initialise system trusted keyrings
[    0.833427] workingset: timestamp_bits=30 max_order=19 bucket_order=0
[    0.840496] NFS: Registering the id_resolver key type
[    0.840532] Key type id_resolver registered
[    0.840554] Key type id_legacy registered
[    0.841204] jffs2: version 2.2. (NAND) © 2001-2006 Red Hat, Inc.
[    0.841533] fuse: init (API version 7.30)
[    0.841996] Key type asymmetric registered
[    0.842019] Asymmetric key parser 'x509' registered
[    0.842090] bounce: pool size: 64 pages
[    0.842145] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[    0.842172] io scheduler mq-deadline registered
[    0.842195] io scheduler kyber registered
[    0.865206] msm_serial f991d000.serial: msm_serial: detected port #0
[    0.865268] msm_serial f991d000.serial: uartclk = 7372800
[    0.865339] f991d000.serial: ttyMSM0 at MMIO 0xf991d000 (irq = 27, base_baud = 460800) is a MSM
[    0.865386] msm_serial: console setup on port #0
[    1.437147] printk: console [ttyMSM0] enabled
[    1.442335] msm_serial: driver initialized
[    1.446406] [drm:drm_core_init] Initialized
[    1.450208] [drm:msm_drm_register] init
[    1.454316] [drm:msm_mdp_register] 
[    1.458422] [drm:msm_dsi_register] 
[    1.461972] [drm:msm_edp_register] 
[    1.466480] [drm:mdp5_dev_probe] 
[    1.469612] msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR* dsi_phy_regulator_init: failed to init regulator, ret=-517
[    1.472059] msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR* dsi_phy_driver_probe: failed to init regulator
[    1.495818] brd: module loaded
[    1.505768] loop: module loaded
[    1.506371] SCSI Media Changer driver v0.25 
[    1.508855] spmi spmi-0: PMIC arbiter version v1 (0x20000002)
[    1.521054] GPIO line 360 (otg-gpio) hogged as output/high
[    1.526208] s1: supplied by regulator-dummy
[    1.526582] s2: supplied by regulator-dummy
[    1.529836] s3: supplied by regulator-dummy
[    1.534087] s4: Bringing 5100000uV into 5000000-5000000uV
[    1.538148] l1: supplied by regulator-dummy
[    1.543792] l2: supplied by regulator-dummy
[    1.547731] l3: supplied by regulator-dummy
[    1.551921] l4: supplied by regulator-dummy
[    1.556056] l5: supplied by regulator-dummy
[    1.560244] l6: supplied by regulator-dummy
[    1.564423] l7: supplied by regulator-dummy
[    1.568574] l8: supplied by regulator-dummy
[    1.572765] l9: supplied by regulator-dummy
[    1.576904] l10: supplied by regulator-dummy
[    1.581084] l11: supplied by regulator-dummy
[    1.585616] l12: supplied by regulator-dummy
[    1.589867] l13: supplied by regulator-dummy
[    1.594118] l14: supplied by regulator-dummy
[    1.598358] l15: supplied by regulator-dummy
[    1.602654] l16: supplied by regulator-dummy
[    1.606863] l17: supplied by regulator-dummy
[    1.611131] l18: supplied by regulator-dummy
[    1.615392] l19: supplied by regulator-dummy
[    1.619644] l20: supplied by regulator-dummy
[    1.623921] l21: supplied by regulator-dummy
[    1.628145] l22: supplied by regulator-dummy
[    1.632434] l23: supplied by regulator-dummy
[    1.636651] l24: supplied by regulator-dummy
[    1.640922] lvs1: supplied by regulator-dummy
[    1.645125] lvs2: supplied by regulator-dummy
[    1.649354] lvs3: supplied by regulator-dummy
[    1.653899] 5vs1: supplied by s4
[    1.658101] 5vs2: supplied by s4
[    1.662570] libphy: Fixed MDIO Bus: probed
[    1.664506] SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=256) (6 bit encapsulation enabled).
[    1.668154] CSLIP: code copyright 1989 Regents of the University of California.
[    1.677881] usbcore: registered new interface driver ax88179_178a
[    1.685059] usbcore: registered new interface driver cdc_ether
[    1.691285] usbcore: registered new interface driver net1080
[    1.697033] usbcore: registered new interface driver cdc_subset
[    1.702884] usbcore: registered new interface driver cdc_ncm
[    1.708638] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.714366] ehci-pci: EHCI PCI platform driver
[    1.720772] usbcore: registered new interface driver cdc_acm
[    1.725110] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
[    1.746239] rtc-pm8xxx fc4cf000.spmi:pm8941@0:rtc@6000: registered as rtc0
[    1.746476] i2c /dev entries driver
[    1.752325] i2c_qup f9923000.i2c: 
                tx channel not available
[    1.756240] i2c_qup f9925000.i2c: 
                tx channel not available
[    1.770247] lm3630a_bl 2-0038: LM3630A backlight register OK.
[    1.770594] i2c_qup f9968000.i2c: 
                tx channel not available
[    1.776699] qcom-smbb fc4cf000.spmi:pm8941@0:charger@1000: Initializing SMBB rev 3
[    1.786344] otg-vbus: supplied by 5vs1
[    1.790745] qcom-tsens fc4a9000.thermal-sensor: tsens calibration failed
[    1.794029] cpuidle: enable-method property 'qcom,kpss-acc-v2' found operations
[    1.800615] cpuidle: enable-method property 'qcom,kpss-acc-v2' found operations
[    1.807900] cpuidle: enable-method property 'qcom,kpss-acc-v2' found operations
[    1.814941] cpuidle: enable-method property 'qcom,kpss-acc-v2' found operations
[    1.822673] sdhci: Secure Digital Host Controller Interface driver
[    1.829350] sdhci: Copyright(c) Pierre Ossman
[    1.835628] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.842527] usbcore: registered new interface driver usbhid
[    1.845757] usbhid: USB HID core driver
[    1.854207] oprofile: using timer interrupt.
[    1.855073] NET: Registered protocol family 17
[    1.859449] Key type dns_resolver registered
[    1.864071] Registering SWP/SWPB emulation handler
[    1.868651] Loading compiled-in X.509 certificates
[    1.903305] msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR* dsi_phy_regulator_init: failed to init regulator, ret=-517
[    1.903386] msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR* dsi_phy_driver_probe: failed to init regulator
[    1.931752] msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR* dsi_phy_regulator_init: failed to init regulator, ret=-517
[    1.931862] msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR* dsi_phy_driver_probe: failed to init regulator
[    1.954303] s1: supplied by regulator-dummy
[    1.954396] s1: Bringing 0uV into 675000-675000uV
[    1.961140] msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR* dsi_phy_regulator_init: failed to init regulator, ret=-517
[    1.962969] msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR* dsi_phy_driver_probe: failed to init regulator
[    1.974984] s2: supplied by regulator-dummy
[    1.986512] s2: Bringing 0uV into 500000-500000uV
[    1.990426] s3: supplied by regulator-dummy
[    1.995072] s3: Bringing 0uV into 1050000-1050000uV
[    1.999485] s4: supplied by regulator-dummy
[    2.003931] s4: Bringing 0uV into 815000-815000uV
[    2.008301] s5: supplied by regulator-dummy
[    2.013266] s6: supplied by regulator-dummy
[    2.017204] s7: supplied by regulator-dummy
[    2.021371] s8: supplied by regulator-dummy
[    2.025952] s1: supplied by regulator-dummy
[    2.029413] s1: Bringing 0uV into 1300000-1300000uV
[    2.036531] msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR* dsi_phy_regulator_init: failed to init regulator, ret=-517
[    2.038422] msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR* dsi_phy_driver_probe: failed to init regulator
[    2.050730] s2: supplied by regulator-dummy
[    2.062206] s2: Bringing 0uV into 2150000-2150000uV
[    2.066310] s3: supplied by regulator-dummy
[    2.070734] s3: Bringing 0uV into 1800000-1800000uV
[    2.076623] input: soc:gpio-keys as /devices/platform/soc/soc:gpio-keys/input/input0
[    2.080214] rtc-pm8xxx fc4cf000.spmi:pm8941@0:rtc@6000: setting system clock to 1970-01-25T07:16:55 UTC (2099815)
[    2.089736] wl-reg: disabling
[    2.090219] l1: supplied by s1
[    2.098016] ALSA device list:
[    2.100860] l1: Bringing 0uV into 1225000-1225000uV
[    2.103779]   No soundcards found.
[    2.107214] l2: supplied by s3
[    2.115377] l2: Bringing 0uV into 1200000-1200000uV
[    2.115928] l3: supplied by s1
[    2.116580] Freeing unused kernel memory: 1024K
[    2.119130] l3: Bringing 0uV into 1225000-1225000uV
[    2.126986] l4: supplied by s1
[    2.134682] l4: Bringing 0uV into 1225000-1225000uV
[    2.137938] l5: supplied by s2
[    2.142596] l5: Bringing 0uV into 1800000-1800000uV
[    2.145923] l6: supplied by s2
[    2.150452] l6: Bringing 0uV into 1800000-1800000uV
[    2.154552] l7: supplied by s2
[    2.158357] l7: Bringing 0uV into 1800000-1800000uV
[    2.161841] l8: supplied by vph-pwr
[    2.166248] l8: Bringing 0uV into 1800000-1800000uV
[    2.170238] l9: supplied by vreg-boost
[    2.174715] Run /init as init process
[    2.174780] l9: Bringing 0uV into 1800000-1800000uV
[    2.182142] mmc0: SDHCI controller on f98a4900.sdhci [f98a4900.sdhci] using ADMA
[    2.187703] msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR* dsi_phy_regulator_init: failed to init regulator, ret=-517
[    2.194818] l10: supplied by vreg-boost
[    2.206363] msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR* dsi_phy_driver_probe: failed to init regulator
[    2.210753] l10: Bringing 0uV into 1800000-1800000uV
[    2.221617] l11: supplied by s1
[    2.230312] l11: Bringing 0uV into 1300000-1300000uV
[    2.235025] l12: supplied by s2
[    2.239432] l12: Bringing 0uV into 1800000-1800000uV
[    2.242907] l13: supplied by vreg-boost
[    2.247724] l13: Bringing 0uV into 1800000-1800000uV
[    2.251575] l14: supplied by s2
[    2.256385] l14: Bringing 0uV into 1800000-1800000uV
[    2.259634] l15: supplied by s2
[    2.264420] l15: Bringing 0uV into 2050000-2050000uV
[    2.267535] l16: supplied by vph-pwr
[    2.272518] l16: Bringing 0uV into 2700000-2700000uV
[    2.276242] l17: supplied by vreg-boost
[    2.280917] l17: Bringing 0uV into 2850000-2850000uV
[    2.284949] l18: supplied by vph-pwr
[    2.289734] l18: Bringing 0uV into 2850000-2850000uV
[    2.293620] l19: supplied by vph-pwr
[    2.298259] l19: Bringing 0uV into 3000000-3000000uV
[    2.302203] l20: supplied by vreg-boost
[    2.306749] l20: Bringing 0uV into 2950000-2950000uV
[    2.310787] l21: supplied by vreg-boost
[    2.315548] l21: Bringing 0uV into 2950000-2950000uV
[    2.319567] l22: supplied by vreg-boost
[    2.324319] l22: Bringing 0uV into 3000000-3000000uV
[    2.328183] l23: supplied by vreg-boost
[    2.333080] l23: Bringing 0uV into 3000000-3000000uV
[    2.336953] l24: supplied by vreg-boost
[    2.341876] l24: Bringing 0uV into 3075000-3075000uV
[    2.346008] lvs1: supplied by s3
[    2.350968] lvs2: supplied by s3
[    2.354222] lvs3: supplied by s3
[    2.357474] 5vs1: supplied by regulator-dummy
[    2.360653] 5vs2: supplied by regulator-dummy
[    2.367752] random: fast init done
[    2.371038] mmc0: new ultra high speed SDR104 SDIO card at address 0001
[    2.373113] [drm:pll_28nm_register] 0
[    2.378626] [drm:dsi_pll_28nm_clk_recalc_rate] sdm_dc_off = 9
[    2.382375] [drm:dsi_pll_28nm_clk_recalc_rate] sdm_freq_seed = 31289
[    2.388077] [drm:dsi_pll_28nm_clk_recalc_rate] vco rate = 402333398
[    2.394525] [drm:dsi_pll_28nm_clk_recalc_rate] returning vco rate = 402333398
[    2.401711] [drm:msm_dsi_pll_init] DSI:0 PLL registered
[    2.448289] mmc1: SDHCI controller on f9824900.sdhci [f9824900.sdhci] using ADMA
[    2.448730] [drm:mdp5_mdss_init] 
[    2.455563] [drm:mdp5_bind] 
[    2.458257] [drm:get_clk] skipping lut
[    2.461016] [drm:msm_runtime_resume] 
[    2.464538] [drm:mdp5_mdss_enable] 
[    2.468324] [drm:mdp5_runtime_resume] 
[    2.471553] [drm:mdp5_enable] 
[    2.475559] [drm:mdp5_runtime_suspend] 
[    2.478538] [drm:mdp5_disable] 
[    2.482321] msm_mdp fd900100.mdp: [drm:mdp5_bind] MDP5 version v1.2
[    2.485404] [drm:mdp5_cfg_init] MDP5: msm8x74 hw config selected
[    2.491686] [drm:mdp5_ctlm_init] Pool of 5 CTLs created.
[    2.497932] msm fd900000.mdss: bound fd900100.mdp (ops mdp5_ops)
[    2.503229] [drm:dsi_bind] 
[    2.509184] [drm:dsi_bind] dsi probed=(ptrval)
[    2.511936] msm_dsi fd922800.dsi: fd922800.dsi supply gdsc not found, using dummy regulator
[    2.516320] [drm:msm_dsi_host_init] dsi_get_config: Version 3:10010000

[    2.524587] msm_dsi fd922800.dsi: fd922800.dsi supply gdsc not found, using dummy regulator
[    2.532920] [drm:msm_dsi_host_init] Dsi Host 0 initialized
[    2.540829] [drm:msm_dsi_runtime_resume] id=0
[    2.546386] panel-simple-dsi fd922800.dsi.0: fd922800.dsi.0 supply power not found, using dummy regulator
[    2.550819] [drm:dsi_host_attach] id=0
[    2.560278] msm fd900000.mdss: bound fd922800.dsi (ops dsi_ops)
[    2.563869] [drm] using 16m VRAM carveout
[    2.569691] [drm:msm_dsi_runtime_suspend] 
[    2.579129] msm fd900000.mdss: [drm:msm_drm_bind] VRAM: 20100000->21100000
[    2.579284] [drm:mdp5_runtime_resume] 
[    2.584944] [drm:mdp5_enable] 
[    2.595290] mmc1: new HS200 MMC card at address 0001
[    2.596083] mmcblk1: mmc1:0001 SEM16G 14.7 GiB 
[    2.599616] mmcblk1boot0: mmc1:0001 SEM16G partition 1 4.00 MiB
[    2.611955] mmcblk1boot1: mmc1:0001 SEM16G partition 2 4.00 MiB
[    2.612178] mmcblk1rpmb: mmc1:0001 SEM16G partition 3 4.00 MiB, chardev (247:0)
[    2.617161] msm_mdp fd900100.mdp: [drm:mdp5_kms_init] no iommu, fallback to phys contig buffers for scanout
[    2.624150] [drm:mdp5_runtime_suspend] 
[    2.633911] [drm:mdp5_disable] 
[    2.637722] msm fd900000.mdss: fall back to the other CTL category for INTF 1!
[    2.640653] [drm:mdp5_ctlm_request] CTL 0 allocated
[    2.648547] [drm:mdp5_runtime_resume] 
[    2.653040]  mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29
[    2.659516] [drm:mdp5_enable] 
[    2.672935] [drm:mdp5_runtime_suspend] 
[    2.672969] [drm:mdp5_disable] 
[    2.675763] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    2.678704] [drm] Driver supports precise vblank timestamp query.
[    2.685346] [drm:drm_irq_install] irq=78
[    2.691558] [drm:mdp5_runtime_resume] 
[    2.695572] [drm:mdp5_enable] 
[    2.699132] [drm:mdp5_runtime_suspend] 
[    2.702167] [drm:mdp5_disable] 
[    2.705932] [drm:mdp5_runtime_resume] 
[    2.708996] [drm:mdp5_enable] 
[    2.712878] [drm:mdp5_runtime_suspend] 
[    2.715855] [drm:mdp5_disable] 
[    2.719602] [drm:drm_minor_register] 
[    2.723028] [drm:drm_minor_register] new minor registered 128
[    2.726537] [drm:drm_minor_register] 
[    2.732556] [drm:drm_minor_register] new minor registered 0
[    2.736029] [drm:drm_sysfs_connector_add] adding "DSI-1" to sysfs
[    2.741296] [drm:drm_sysfs_hotplug_event] generating hotplug event
[    2.747642] [drm] Initialized msm 1.5.0 20130625 for fd900000.mdss on minor 0
[    2.753657] [drm:drm_mode_object_get] OBJ ID: 31 (2)
[    2.760825] [drm:drm_setup_crtcs] 
[    2.765883] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:31:DSI-1]
[    2.769079] [drm:dsi_mgr_connector_detect] id=0
[    2.776303] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:31:DSI-1] status updated from unknown to connected
[    2.780725] [drm:dsi_mgr_connector_mode_valid] 
[    2.791490] [drm:dsi_mgr_connector_mode_valid] requested=150000000, actual=150000000
[    2.796056] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:31:DSI-1] probed modes :
[    2.804007] [drm:drm_mode_debug_printmodeline] Modeline "1080x1920": 60 150000 1080 1082 1084 1086 1920 1922 1924 1926 0x48 0x0
[    2.812427] [drm:drm_setup_crtcs] connector 31 enabled? yes
[    2.823697] [drm:drm_setup_crtcs] Not using firmware configuration
[    2.829233] [drm:drm_setup_crtcs] looking for cmdline mode on connector 31
[    2.835510] [drm:drm_setup_crtcs] looking for preferred mode on connector 31 0
[    2.842363] [drm:drm_setup_crtcs] found mode 1080x1920
[    2.849539] [drm:drm_setup_crtcs] picking CRTCs for 65535x65535 config
[    2.854690] [drm:drm_setup_crtcs] desired mode 1080x1920 set on crtc 49 (0,0)
[    2.861197] [drm:drm_mode_object_get] OBJ ID: 31 (2)
[    2.868418] [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 0 primary plane
[    2.873457] [drm:msm_fbdev_create] create fbdev: 1080x1920@32 (1080x1920)
[    2.881142] [drm:msm_alloc_stolen_fb] allocating 8355840 bytes for fb 0
[    2.888552] [drm:msm_framebuffer_init] create framebuffer: dev=(ptrval), mode_cmd=(ptrval) (1080x1920@XR24)
[    2.894379] [drm:msm_framebuffer_init] create: FB ID: 50 ((ptrval))
[    2.904088] [drm:msm_fbdev_create] fbi=(ptrval), dev=(ptrval)
[    2.910401] [drm:msm_fbdev_create] par=(ptrval), 1080x1920
[    2.916232] [drm:msm_fbdev_create] allocated 1080x1920 fb
[    2.922042] [drm:drm_atomic_state_init] Allocated atomic state (ptrval)
[    2.922064] [drm:drm_atomic_get_plane_state] Added [PLANE:32:plane-0] (ptrval) state to (ptrval)
[    2.922081] [drm:drm_atomic_get_plane_state] Added [PLANE:35:plane-1] (ptrval) state to (ptrval)
[    2.922095] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:35:plane-1] state (ptrval)
[    2.922112] [drm:drm_atomic_get_plane_state] Added [PLANE:37:plane-2] (ptrval) state to (ptrval)
[    2.922125] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:37:plane-2] state (ptrval)
[    2.922142] [drm:drm_atomic_get_plane_state] Added [PLANE:39:plane-3] (ptrval) state to (ptrval)
[    2.922154] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:39:plane-3] state (ptrval)
[    2.922170] [drm:drm_atomic_get_plane_state] Added [PLANE:41:plane-4] (ptrval) state to (ptrval)
[    2.922183] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:41:plane-4] state (ptrval)
[    2.922199] [drm:drm_atomic_get_plane_state] Added [PLANE:43:plane-5] (ptrval) state to (ptrval)
[    2.922212] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:43:plane-5] state (ptrval)
[    2.922228] [drm:drm_atomic_get_plane_state] Added [PLANE:45:plane-6] (ptrval) state to (ptrval)
[    2.922241] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:45:plane-6] state (ptrval)
[    2.922257] [drm:drm_atomic_get_plane_state] Added [PLANE:47:plane-7] (ptrval) state to (ptrval)
[    2.922270] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:47:plane-7] state (ptrval)
[    2.922288] [drm:drm_atomic_get_crtc_state] Added [CRTC:49:crtc-0] (ptrval) state to (ptrval)
[    2.922308] [drm:drm_atomic_set_mode_for_crtc] Set [MODE:1080x1920] for [CRTC:49:crtc-0] state (ptrval)
[    2.922325] [drm:drm_atomic_set_crtc_for_plane] Link [PLANE:32:plane-0] state (ptrval) to [CRTC:49:crtc-0]
[    2.922339] [drm:drm_atomic_set_fb_for_plane] Set [FB:50] for [PLANE:32:plane-0] state (ptrval)
[    2.922350] [drm:drm_mode_object_get] OBJ ID: 50 (1)
[    2.922368] [drm:drm_atomic_add_affected_connectors] Adding all current connectors for [CRTC:49:crtc-0] to (ptrval)
[    2.922384] [drm:drm_mode_object_get] OBJ ID: 31 (3)
[    2.922399] [drm:drm_atomic_get_connector_state] Added [CONNECTOR:31:DSI-1] (ptrval) state to (ptrval)
[    2.922410] [drm:drm_mode_object_get] OBJ ID: 31 (4)
[    2.922427] [drm:drm_atomic_set_crtc_for_connector] Link [CONNECTOR:31:DSI-1] state (ptrval) to [CRTC:49:crtc-0]
[    2.922439] [drm:drm_atomic_check_only] checking (ptrval)
[    2.922460] [drm:drm_atomic_helper_check_modeset] [CRTC:49:crtc-0] mode changed
[    2.922473] [drm:drm_atomic_helper_check_modeset] [CRTC:49:crtc-0] enable changed
[    2.922486] [drm:drm_atomic_helper_check_modeset] [CRTC:49:crtc-0] active changed
[    2.922497] [drm:dsi_mgr_connector_best_encoder] 
[    2.922513] [drm:drm_atomic_helper_check_modeset] Updating routing for [CONNECTOR:31:DSI-1]
[    2.922523] [drm:dsi_mgr_connector_best_encoder] 
[    2.922544] [drm:drm_atomic_helper_check_modeset] [CONNECTOR:31:DSI-1] using [ENCODER:30:DSI-30] on [CRTC:49:crtc-0]
[    2.922559] [drm:drm_atomic_helper_check_modeset] [CRTC:49:crtc-0] needs all connectors, enable: y, active: y
[    2.922575] [drm:drm_atomic_add_affected_connectors] Adding all current connectors for [CRTC:49:crtc-0] to (ptrval)
[    2.922593] [drm:drm_atomic_add_affected_planes] Adding all current planes for [CRTC:49:crtc-0] to (ptrval)
[    2.922610] [drm:drm_atomic_normalize_zpos] [CRTC:49:crtc-0] calculating normalized zpos values
[    2.922625] [drm:drm_atomic_normalize_zpos] [PLANE:32:plane-0] processing zpos value 0
[    2.922639] [drm:drm_atomic_normalize_zpos] [PLANE:32:plane-0] normalized zpos value 0
[    2.922654] [drm:mdp5_plane_atomic_check] plane-0: check (0 -> 0)
[    2.922678] [drm:drm_atomic_get_private_obj_state] Added new private object (ptrval) state (ptrval) to (ptrval)
[    2.922694] [drm:mdp5_pipe_assign] DMA0: alloc SMP blocks
[    2.922708] [drm:mdp5_smp_assign] DMA0[0]: request 3 SMP blocks
[    2.922724] [drm:mdp5_pipe_assign] DMA0: assign to plane plane-0 for caps 0
[    2.922740] [drm:mdp5_crtc_atomic_check] crtc-0: check
[    2.922755] [drm:mdp5_mixer_assign] assigning Layer Mixer 0 to crtc crtc-0
[    2.922772] [drm:mdp5_crtc_atomic_check] crtc-0: assign pipe plane-0 on stage=1
[    2.922785] [drm:drm_atomic_commit] committing (ptrval)
[    2.922806] [drm:msm_framebuffer_prepare] FB[50]: iova[0]: 20101000 (0)
[    2.922828] [drm:mdp5_runtime_resume] 
[    2.922839] [drm:mdp5_enable] 
[    2.922884] [drm:mdp5_smp_prepare_commit] assign DMA0:0, 3 blks
[    2.922896] [drm:mdp5_smp_prepare_commit] assign DMA0:1, 3 blks
[    2.922908] [drm:mdp5_smp_prepare_commit] assign DMA0:2, 3 blks
[    2.922951] [drm:drm_calc_timestamping_constants] crtc 49: hwmode: htotal 1086, vtotal 1926, vdisplay 1920
[    2.922964] [drm:drm_calc_timestamping_constants] crtc 49: clock 150000 kHz framedur 13944240 linedur 7240
[    2.922980] [drm:drm_atomic_helper_commit_modeset_disables] modeset on [CRTC:49:crtc-0]
[    2.923000] [drm:mdp5_crtc_mode_set_nofb] crtc-0: set mode: "1080x1920": 60 150000 1080 1082 1084 1086 1920 1922 1924 1926 0x48 0x0
[    2.923018] [drm:drm_atomic_helper_commit_modeset_disables] modeset on [ENCODER:30:DSI-30]
[    2.923036] [drm:dsi_mgr_bridge_mode_set] set mode: "1080x1920": 60 150000 1080 1082 1084 1086 1920 1922 1924 1926 0x48 0x0
[    2.923050] [drm:drm_atomic_helper_commit_planes] crtc-0: begin
[    2.923062] [drm:mdp5_plane_atomic_update] plane-0: update
[    2.923078] [drm:mdp5_plane_mode_set] plane-0: FB[50] 0,0,1080,1920 -> CRTC[49] 0,0,1080,1920
[    2.923090] [drm:mdp5_plane_mode_set] scale config = 0
[    2.923117] [drm:mdp5_crtc_atomic_flush] crtc-0: event: (ptrval)
[    2.923146] [drm:mdp5_ctl_blend] lm0: blend config = 0x00040000. ext_cfg = 0x00000000
[    2.923161] [drm:crtc_flush] crtc-0: flush=00000840
[    2.923179] [drm:drm_atomic_helper_commit_modeset_enables] enabling [CRTC:49:crtc-0]
[    2.923192] [drm:mdp5_crtc_atomic_enable] crtc-0
[    2.923210] [drm:drm_crtc_vblank_on] crtc 0, vblank enabled 0, inmodeset 0
[    2.923238] [drm:mdp5_crtc_mode_set_nofb] crtc-0: set mode: "1080x1920": 60 150000 1080 1082 1084 1086 1920 1922 1924 1926 0x48 0x0
[    2.923260] [drm:drm_atomic_helper_commit_modeset_enables] enabling [ENCODER:30:DSI-30]
[    2.923272] [drm:dsi_mgr_bridge_pre_enable] id=0
[    2.923282] [drm:msm_dsi_host_reset_phy] 
[    2.927146] [drm:dsi_calc_clk_rate_6g] pclk=150000000, bclk=112500000
[    2.927161] [drm:msm_dsi_phy_enable] 
[    2.927366] [drm:dsi_28nm_phy_enable] 
[    2.927384] [drm:msm_dsi_dphy_timing_calc] PHY timings: 44, 2, 0, 238, 56, 38, 106, 108, 44, 60, 44
[    2.927428] [drm:msm_dsi_host_power_on] 
[    2.928075] [drm:msm_dsi_runtime_resume] id=0
[    2.928101] [drm:dsi_link_clk_enable_6g] Set clk rates: pclk=150000, byteclk=112500000
[    2.928170] [drm:dsi_pll_28nm_clk_set_rate] refclk_cfg = 1
[    2.928182] [drm:dsi_pll_28nm_clk_set_rate] div_fb = 11718
[    2.928193] [drm:dsi_pll_28nm_clk_set_rate] frac_n_value = 47054
[    2.928204] [drm:dsi_pll_28nm_clk_set_rate] Generated VCO Clock: 449971200
[    2.928215] [drm:dsi_pll_28nm_clk_set_rate] sdm_cfg0=0
[    2.928226] [drm:dsi_pll_28nm_clk_set_rate] sdm_cfg1=74
[    2.928237] [drm:dsi_pll_28nm_clk_set_rate] sdm_cfg2=206
[    2.928248] [drm:dsi_pll_28nm_clk_set_rate] sdm_cfg3=183
[    2.928260] [drm:dsi_pll_28nm_clk_set_rate] cal_cfg10=193, cal_cfg11=1
[    2.928285] [drm:dsi_pll_28nm_clk_recalc_rate] sdm_dc_off = 10
[    2.928297] [drm:dsi_pll_28nm_clk_recalc_rate] sdm_freq_seed = 47054
[    2.928308] [drm:dsi_pll_28nm_clk_recalc_rate] vco rate = 449970703
[    2.928320] [drm:dsi_pll_28nm_clk_recalc_rate] returning vco rate = 449970703
[    2.928394] [drm:dsi_pll_28nm_enable_seq_hpm] id=0
[    2.930017] [drm:pll_28nm_poll_for_ready] DSI PLL is locked
[    2.930027] [drm:dsi_pll_28nm_enable_seq_hpm] DSI PLL Lock success
[    2.930040] [drm:msm_dsi_pll_helper_clk_prepare] DSI PLL locked after sequence #1
[    2.930061] [drm:msm_dsi_host_power_on] 
[    2.930078] [drm:dsi_intr_ctrl] intr=2000000 enable=1
[    2.930090] [drm:msm_dsi_host_power_on] lane number=4
[    2.930107] [drm:dsi_intr_ctrl] intr=2000200 enable=1
[    2.930126] [drm:mdp5_cmd_encoder_mode_set] set mode: "1080x1920": 60 150000 1080 1082 1084 1086 1920 1922 1924 1926 0x48 0x0
[    2.930157] [drm:mdp5_crtc_vblank_irq] crtc-0: send event: (ptrval)
[    2.930199] [drm:mdp5_ctl_set_encoder_state] intf_1: on
[    2.930214] [drm:drm_bridge_enable] 
[    2.930227] [drm:msm_enable_vblank] dev=(ptrval), crtc=0
[    2.930247] [drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
[    2.930266] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=1, diff=0, hw=0 hw_last=0
[    2.981842] msm fd900000.mdss: pp done time out, lm=0
[    3.041732] ------------[ cut here ]------------
[    3.041751] WARNING: CPU: 0 PID: 100 at drivers/gpu/drm/drm_atomic_helper.c:1429 drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290
[    3.041759] [CRTC:49:crtc-0] vblank wait timed out
[    3.041764] Modules linked in:
[    3.041784] CPU: 0 PID: 100 Comm: kworker/0:2 Not tainted 5.1.0-rc6-next-20190426-00009-g75891c3edac4-dirty #303
[    3.041792] Hardware name: Generic DT based system
[    3.041812] Workqueue: events deferred_probe_work_func
[    3.041839] [<c031229c>] (unwind_backtrace) from [<c030d5ac>] (show_stack+0x10/0x14)
[    3.041853] [<c030d5ac>] (show_stack) from [<c0ac152c>] (dump_stack+0x78/0x8c)
[    3.041871] [<c0ac152c>] (dump_stack) from [<c0321660>] (__warn.part.3+0xb8/0xd4)
[    3.041884] [<c0321660>] (__warn.part.3) from [<c03216e0>] (warn_slowpath_fmt+0x64/0x88)
[    3.041899] [<c03216e0>] (warn_slowpath_fmt) from [<c0761ca4>] (drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290)
[    3.041916] [<c0761ca4>] (drm_atomic_helper_wait_for_vblanks.part.1) from [<c07b0d50>] (mdp5_complete_commit+0x14/0x40)
[    3.041937] [<c07b0d50>] (mdp5_complete_commit) from [<c07ddd68>] (msm_atomic_commit_tail+0xa8/0x140)
[    3.041952] [<c07ddd68>] (msm_atomic_commit_tail) from [<c076359c>] (commit_tail+0x40/0x6c)
[    3.041963] [<c076359c>] (commit_tail) from [<c076368c>] (drm_atomic_helper_commit+0xbc/0x128)
[    3.041973] [<c076368c>] (drm_atomic_helper_commit) from [<c0766a88>] (restore_fbdev_mode_atomic+0x168/0x1d4)
[    3.041985] [<c0766a88>] (restore_fbdev_mode_atomic) from [<c076a7d0>] (drm_fb_helper_restore_fbdev_mode_unlocked+0x54/0xa4)
[    3.041996] [<c076a7d0>] (drm_fb_helper_restore_fbdev_mode_unlocked) from [<c076a850>] (drm_fb_helper_set_par+0x30/0x54)
[    3.042007] [<c076a850>] (drm_fb_helper_set_par) from [<c06ef4c8>] (fbcon_init+0x4b4/0x5d4)
[    3.042019] [<c06ef4c8>] (fbcon_init) from [<c073bf88>] (visual_init+0xbc/0x104)
[    3.042030] [<c073bf88>] (visual_init) from [<c073dea8>] (do_bind_con_driver+0x1ec/0x3c4)
[    3.042040] [<c073dea8>] (do_bind_con_driver) from [<c073e44c>] (do_take_over_console+0x150/0x1f0)
[    3.042050] [<c073e44c>] (do_take_over_console) from [<c06ef97c>] (do_fbcon_takeover+0x78/0xd8)
[    3.042066] [<c06ef97c>] (do_fbcon_takeover) from [<c0343b04>] (notifier_call_chain+0x48/0x80)
[    3.042078] [<c0343b04>] (notifier_call_chain) from [<c03442b8>] (blocking_notifier_call_chain+0x50/0x68)
[    3.042094] [<c03442b8>] (blocking_notifier_call_chain) from [<c06e9794>] (register_framebuffer+0x224/0x304)
[    3.042106] [<c06e9794>] (register_framebuffer) from [<c076a45c>] (__drm_fb_helper_initial_config_and_unlock+0x2f0/0x53c)
[    3.042120] [<c076a45c>] (__drm_fb_helper_initial_config_and_unlock) from [<c07e9b18>] (msm_fbdev_init+0x74/0xbc)
[    3.042131] [<c07e9b18>] (msm_fbdev_init) from [<c07df768>] (msm_drm_bind+0x560/0x634)
[    3.042146] [<c07df768>] (msm_drm_bind) from [<c07fbb18>] (try_to_bring_up_master+0x1f8/0x2b4)
[    3.042160] [<c07fbb18>] (try_to_bring_up_master) from [<c07fbc84>] (__component_add+0xb0/0x174)
[    3.042175] [<c07fbc84>] (__component_add) from [<c08043d4>] (platform_drv_probe+0x48/0x98)
[    3.042188] [<c08043d4>] (platform_drv_probe) from [<c0802068>] (really_probe+0x248/0x40c)
[    3.042200] [<c0802068>] (really_probe) from [<c08023dc>] (driver_probe_device+0x74/0x1c0)
[    3.042211] [<c08023dc>] (driver_probe_device) from [<c08001d0>] (bus_for_each_drv+0x80/0xc4)
[    3.042222] [<c08001d0>] (bus_for_each_drv) from [<c0801d80>] (__device_attach+0xd0/0x168)
[    3.042232] [<c0801d80>] (__device_attach) from [<c0800f94>] (bus_probe_device+0x84/0x8c)
[    3.042243] [<c0800f94>] (bus_probe_device) from [<c08014dc>] (deferred_probe_work_func+0x84/0xc4)
[    3.042259] [<c08014dc>] (deferred_probe_work_func) from [<c033c4b0>] (process_one_work+0x1fc/0x564)
[    3.042273] [<c033c4b0>] (process_one_work) from [<c033d108>] (worker_thread+0x44/0x584)
[    3.042285] [<c033d108>] (worker_thread) from [<c034247c>] (kthread+0x148/0x150)
[    3.042297] [<c034247c>] (kthread) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
[    3.042306] Exception stack(0xc4e09fb0 to 0xc4e09ff8)
[    3.042325] 9fa0:                                     00000000 00000000 00000000 00000000
[    3.042350] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.042371] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    3.042380] ---[ end trace d4b922f6bb6a2602 ]---
[    3.042416] [drm:drm_atomic_state_default_clear] Clearing atomic state (ptrval)
[    3.042430] [drm:drm_mode_object_put.part.0] OBJ ID: 31 (5)
[    3.042451] [drm:__drm_atomic_state_free] Freeing atomic state (ptrval)
[    3.042514] [drm:drm_atomic_state_init] Allocated atomic state (ptrval)
[    3.042528] [drm:drm_mode_object_get] OBJ ID: 50 (2)
[    3.042543] [drm:drm_atomic_get_plane_state] Added [PLANE:32:plane-0] (ptrval) state to (ptrval)
[    3.042556] [drm:drm_mode_object_get] OBJ ID: 51 (1)
[    3.042571] [drm:drm_atomic_get_crtc_state] Added [CRTC:49:crtc-0] (ptrval) state to (ptrval)
[    3.042588] [drm:drm_atomic_get_plane_state] Added [PLANE:35:plane-1] (ptrval) state to (ptrval)
[    3.042601] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:35:plane-1] state (ptrval)
[    3.042617] [drm:drm_atomic_get_plane_state] Added [PLANE:37:plane-2] (ptrval) state to (ptrval)
[    3.042630] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:37:plane-2] state (ptrval)
[    3.042646] [drm:drm_atomic_get_plane_state] Added [PLANE:39:plane-3] (ptrval) state to (ptrval)
[    3.042659] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:39:plane-3] state (ptrval)
[    3.042675] [drm:drm_atomic_get_plane_state] Added [PLANE:41:plane-4] (ptrval) state to (ptrval)
[    3.042687] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:41:plane-4] state (ptrval)
[    3.042703] [drm:drm_atomic_get_plane_state] Added [PLANE:43:plane-5] (ptrval) state to (ptrval)
[    3.042716] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:43:plane-5] state (ptrval)
[    3.042732] [drm:drm_atomic_get_plane_state] Added [PLANE:45:plane-6] (ptrval) state to (ptrval)
[    3.042745] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:45:plane-6] state (ptrval)
[    3.042761] [drm:drm_atomic_get_plane_state] Added [PLANE:47:plane-7] (ptrval) state to (ptrval)
[    3.042774] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:47:plane-7] state (ptrval)
[    3.042789] [drm:drm_atomic_set_fb_for_plane] Set [FB:50] for [PLANE:32:plane-0] state (ptrval)
[    3.042800] [drm:drm_mode_object_get] OBJ ID: 50 (3)
[    3.042812] [drm:drm_mode_object_put.part.0] OBJ ID: 50 (4)
[    3.042828] [drm:drm_atomic_add_affected_connectors] Adding all current connectors for [CRTC:49:crtc-0] to (ptrval)
[    3.042843] [drm:drm_mode_object_get] OBJ ID: 31 (5)
[    3.042854] [drm:drm_mode_object_get] OBJ ID: 31 (6)
[    3.042869] [drm:drm_atomic_get_connector_state] Added [CONNECTOR:31:DSI-1] (ptrval) state to (ptrval)
[    3.042882] [drm:drm_mode_object_put.part.0] OBJ ID: 31 (6)
[    3.042896] [drm:drm_atomic_set_crtc_for_connector] Link [CONNECTOR:31:DSI-1] state (ptrval) to [NOCRTC]
[    3.042907] [drm:drm_mode_object_get] OBJ ID: 31 (5)
[    3.042924] [drm:drm_atomic_set_crtc_for_connector] Link [CONNECTOR:31:DSI-1] state (ptrval) to [CRTC:49:crtc-0]
[    3.042936] [drm:drm_atomic_check_only] checking (ptrval)
[    3.042949] [drm:dsi_mgr_connector_best_encoder] 
[    3.042967] [drm:drm_atomic_helper_check_modeset] Updating routing for [CONNECTOR:31:DSI-1]
[    3.042976] [drm:dsi_mgr_connector_best_encoder] 
[    3.042996] [drm:drm_atomic_helper_check_modeset] [CONNECTOR:31:DSI-1] keeps [ENCODER:30:DSI-30], now on [CRTC:49:crtc-0]
[    3.043012] [drm:mdp5_plane_atomic_check] plane-0: check (1 -> 1)
[    3.043031] [drm:mdp5_crtc_atomic_check] crtc-0: check
[    3.043047] [drm:mdp5_crtc_atomic_check] crtc-0: assign pipe plane-0 on stage=1
[    3.043060] [drm:drm_atomic_commit] committing (ptrval)
[    3.043078] [drm:msm_framebuffer_prepare] FB[50]: iova[0]: 20101000 (0)
[    3.043135] [drm:drm_calc_timestamping_constants] crtc 49: hwmode: htotal 1086, vtotal 1926, vdisplay 1920
[    3.043148] [drm:drm_calc_timestamping_constants] crtc 49: clock 150000 kHz framedur 13944240 linedur 7240
[    3.043162] [drm:drm_atomic_helper_commit_planes] crtc-0: begin
[    3.043173] [drm:mdp5_plane_atomic_update] plane-0: update
[    3.043188] [drm:mdp5_plane_mode_set] plane-0: FB[50] 0,0,1080,1920 -> CRTC[49] 0,0,1080,1920
[    3.043199] [drm:mdp5_plane_mode_set] scale config = 0
[    3.043223] [drm:mdp5_crtc_atomic_flush] crtc-0: event: (ptrval)
[    3.043249] [drm:mdp5_ctl_blend] lm0: blend config = 0x00040000. ext_cfg = 0x00000000
[    3.043263] [drm:crtc_flush] crtc-0: flush=00000840
[    3.043304] [drm:drm_atomic_state_init] Allocated atomic state (ptrval)
[    3.101745] msm fd900000.mdss: pp done time out, lm=0
[    3.161729] ------------[ cut here ]------------
[    3.161746] WARNING: CPU: 0 PID: 100 at drivers/gpu/drm/drm_atomic_helper.c:1429 drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290
[    3.161754] [CRTC:49:crtc-0] vblank wait timed out
[    3.161758] Modules linked in:
[    3.161778] CPU: 0 PID: 100 Comm: kworker/0:2 Tainted: G        W         5.1.0-rc6-next-20190426-00009-g75891c3edac4-dirty #303
[    3.161786] Hardware name: Generic DT based system
[    3.161803] Workqueue: events deferred_probe_work_func
[    3.161820] [<c031229c>] (unwind_backtrace) from [<c030d5ac>] (show_stack+0x10/0x14)
[    3.161831] [<c030d5ac>] (show_stack) from [<c0ac152c>] (dump_stack+0x78/0x8c)
[    3.161844] [<c0ac152c>] (dump_stack) from [<c0321660>] (__warn.part.3+0xb8/0xd4)
[    3.161856] [<c0321660>] (__warn.part.3) from [<c03216e0>] (warn_slowpath_fmt+0x64/0x88)
[    3.161870] [<c03216e0>] (warn_slowpath_fmt) from [<c0761ca4>] (drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290)
[    3.161885] [<c0761ca4>] (drm_atomic_helper_wait_for_vblanks.part.1) from [<c07b0d50>] (mdp5_complete_commit+0x14/0x40)
[    3.161900] [<c07b0d50>] (mdp5_complete_commit) from [<c07ddd68>] (msm_atomic_commit_tail+0xa8/0x140)
[    3.161914] [<c07ddd68>] (msm_atomic_commit_tail) from [<c076359c>] (commit_tail+0x40/0x6c)
[    3.161926] [<c076359c>] (commit_tail) from [<c076368c>] (drm_atomic_helper_commit+0xbc/0x128)
[    3.161936] [<c076368c>] (drm_atomic_helper_commit) from [<c0766a88>] (restore_fbdev_mode_atomic+0x168/0x1d4)
[    3.161945] [<c0766a88>] (restore_fbdev_mode_atomic) from [<c0766c48>] (drm_fb_helper_pan_display+0xc4/0x1d8)
[    3.161957] [<c0766c48>] (drm_fb_helper_pan_display) from [<c06e7c38>] (fb_pan_display+0x9c/0x110)
[    3.161969] [<c06e7c38>] (fb_pan_display) from [<c06f3528>] (bit_update_start+0x14/0x30)
[    3.161979] [<c06f3528>] (bit_update_start) from [<c06f215c>] (fbcon_switch+0x390/0x514)
[    3.161989] [<c06f215c>] (fbcon_switch) from [<c073d5d4>] (redraw_screen+0x13c/0x244)
[    3.161999] [<c073d5d4>] (redraw_screen) from [<c06eef84>] (fbcon_prepare_logo+0x378/0x408)
[    3.162007] [<c06eef84>] (fbcon_prepare_logo) from [<c06ef438>] (fbcon_init+0x424/0x5d4)
[    3.162016] [<c06ef438>] (fbcon_init) from [<c073bf88>] (visual_init+0xbc/0x104)
[    3.162025] [<c073bf88>] (visual_init) from [<c073dea8>] (do_bind_con_driver+0x1ec/0x3c4)
[    3.162035] [<c073dea8>] (do_bind_con_driver) from [<c073e44c>] (do_take_over_console+0x150/0x1f0)
[    3.162044] [<c073e44c>] (do_take_over_console) from [<c06ef97c>] (do_fbcon_takeover+0x78/0xd8)
[    3.162057] [<c06ef97c>] (do_fbcon_takeover) from [<c0343b04>] (notifier_call_chain+0x48/0x80)
[    3.162067] [<c0343b04>] (notifier_call_chain) from [<c03442b8>] (blocking_notifier_call_chain+0x50/0x68)
[    3.162079] [<c03442b8>] (blocking_notifier_call_chain) from [<c06e9794>] (register_framebuffer+0x224/0x304)
[    3.162091] [<c06e9794>] (register_framebuffer) from [<c076a45c>] (__drm_fb_helper_initial_config_and_unlock+0x2f0/0x53c)
[    3.162105] [<c076a45c>] (__drm_fb_helper_initial_config_and_unlock) from [<c07e9b18>] (msm_fbdev_init+0x74/0xbc)
[    3.162116] [<c07e9b18>] (msm_fbdev_init) from [<c07df768>] (msm_drm_bind+0x560/0x634)
[    3.162129] [<c07df768>] (msm_drm_bind) from [<c07fbb18>] (try_to_bring_up_master+0x1f8/0x2b4)
[    3.162142] [<c07fbb18>] (try_to_bring_up_master) from [<c07fbc84>] (__component_add+0xb0/0x174)
[    3.162155] [<c07fbc84>] (__component_add) from [<c08043d4>] (platform_drv_probe+0x48/0x98)
[    3.162167] [<c08043d4>] (platform_drv_probe) from [<c0802068>] (really_probe+0x248/0x40c)
[    3.162178] [<c0802068>] (really_probe) from [<c08023dc>] (driver_probe_device+0x74/0x1c0)
[    3.162189] [<c08023dc>] (driver_probe_device) from [<c08001d0>] (bus_for_each_drv+0x80/0xc4)
[    3.162199] [<c08001d0>] (bus_for_each_drv) from [<c0801d80>] (__device_attach+0xd0/0x168)
[    3.162210] [<c0801d80>] (__device_attach) from [<c0800f94>] (bus_probe_device+0x84/0x8c)
[    3.162220] [<c0800f94>] (bus_probe_device) from [<c08014dc>] (deferred_probe_work_func+0x84/0xc4)
[    3.162233] [<c08014dc>] (deferred_probe_work_func) from [<c033c4b0>] (process_one_work+0x1fc/0x564)
[    3.162246] [<c033c4b0>] (process_one_work) from [<c033d108>] (worker_thread+0x44/0x584)
[    3.162258] [<c033d108>] (worker_thread) from [<c034247c>] (kthread+0x148/0x150)
[    3.162268] [<c034247c>] (kthread) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
[    3.162277] Exception stack(0xc4e09fb0 to 0xc4e09ff8)
[    3.162295] 9fa0:                                     00000000 00000000 00000000 00000000
[    3.162319] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.162340] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    3.162349] ---[ end trace d4b922f6bb6a2603 ]---
[    3.162379] [drm:mdp5_plane_cleanup_fb] plane-0: cleanup: FB[50]
[    3.162397] [drm:drm_atomic_state_default_clear] Clearing atomic state (ptrval)
[    3.162409] [drm:drm_mode_object_put.part.0] OBJ ID: 31 (6)
[    3.162421] [drm:drm_mode_object_put.part.0] OBJ ID: 31 (5)
[    3.162433] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[    3.162446] [drm:drm_mode_object_put.part.0] OBJ ID: 50 (3)
[    3.162461] [drm:__drm_atomic_state_free] Freeing atomic state (ptrval)
[    3.162491] [drm:drm_mode_object_get] OBJ ID: 50 (2)
[    3.162507] [drm:drm_atomic_get_plane_state] Added [PLANE:32:plane-0] (ptrval) state to (ptrval)
[    3.162519] [drm:drm_mode_object_get] OBJ ID: 51 (1)
[    3.162535] [drm:drm_atomic_get_crtc_state] Added [CRTC:49:crtc-0] (ptrval) state to (ptrval)
[    3.162545] [drm:drm_mode_object_get] OBJ ID: 52 (1)
[    3.162558] [drm:drm_atomic_check_only] checking (ptrval)
[    3.162575] [drm:mdp5_plane_atomic_check] plane-0: check (1 -> 1)
[    3.162592] [drm:mdp5_crtc_atomic_check] crtc-0: check
[    3.162609] [drm:mdp5_crtc_atomic_check] crtc-0: assign pipe plane-0 on stage=1
[    3.162622] [drm:drm_atomic_commit] committing (ptrval)
[    3.162638] [drm:msm_framebuffer_prepare] FB[50]: iova[0]: 20101000 (0)
[    3.581980] device-mapper: ioctl: 4.40.0-ioctl (2019-01-18) initialised: dm-devel@redhat.com
[    4.109986] EXT4-fs (dm-0): mounted filesystem without journal. Opts: (null)
[    4.618939] [drm:mdp5_crtc_vblank_irq] crtc-0: send event: (ptrval)
[    4.618983] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=1, diff=0, hw=0 hw_last=0
[    4.618998] [drm:vblank_disable_fn] disabling vblank on crtc 0
[    4.619016] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=1, diff=0, hw=0 hw_last=0
[    4.619029] [drm:msm_disable_vblank] dev=(ptrval), crtc=0
[    4.619112] [drm:drm_calc_timestamping_constants] crtc 49: hwmode: htotal 1086, vtotal 1926, vdisplay 1920
[    4.619126] [drm:drm_calc_timestamping_constants] crtc 49: clock 150000 kHz framedur 13944240 linedur 7240
[    4.619142] [drm:drm_atomic_helper_commit_planes] crtc-0: begin
[    4.619156] [drm:mdp5_plane_atomic_update] plane-0: update
[    4.619173] [drm:mdp5_plane_mode_set] plane-0: FB[50] 0,0,1080,1920 -> CRTC[49] 0,0,1080,1920
[    4.619185] [drm:mdp5_plane_mode_set] scale config = 0
[    4.619212] [drm:mdp5_crtc_atomic_flush] crtc-0: event: (ptrval)
[    4.619243] [drm:mdp5_ctl_blend] lm0: blend config = 0x00040000. ext_cfg = 0x00000000
[    4.619257] [drm:crtc_flush] crtc-0: flush=00000840
[    4.619277] [drm:msm_enable_vblank] dev=(ptrval), crtc=0
[    4.619293] [drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
[    4.619311] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=1, diff=0, hw=0 hw_last=0
[    4.620660] [drm:dsi_host_irq] isr=0x2000700, id=0
[    4.671711] msm fd900000.mdss: pp done time out, lm=0
[    4.731689] ------------[ cut here ]------------
[    4.731716] WARNING: CPU: 0 PID: 20 at drivers/gpu/drm/drm_atomic_helper.c:1429 drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290
[    4.731724] [CRTC:49:crtc-0] vblank wait timed out
[    4.731729] Modules linked in: dm_mod
[    4.731757] CPU: 0 PID: 20 Comm: kworker/0:1 Tainted: G        W         5.1.0-rc6-next-20190426-00009-g75891c3edac4-dirty #303
[    4.731765] Hardware name: Generic DT based system
[    4.731782] Workqueue: events drm_fb_helper_dirty_work
[    4.731806] [<c031229c>] (unwind_backtrace) from [<c030d5ac>] (show_stack+0x10/0x14)
[    4.731820] [<c030d5ac>] (show_stack) from [<c0ac152c>] (dump_stack+0x78/0x8c)
[    4.731837] [<c0ac152c>] (dump_stack) from [<c0321660>] (__warn.part.3+0xb8/0xd4)
[    4.731849] [<c0321660>] (__warn.part.3) from [<c03216e0>] (warn_slowpath_fmt+0x64/0x88)
[    4.731864] [<c03216e0>] (warn_slowpath_fmt) from [<c0761ca4>] (drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290)
[    4.731885] [<c0761ca4>] (drm_atomic_helper_wait_for_vblanks.part.1) from [<c07b0d50>] (mdp5_complete_commit+0x14/0x40)
[    4.731906] [<c07b0d50>] (mdp5_complete_commit) from [<c07ddd68>] (msm_atomic_commit_tail+0xa8/0x140)
[    4.731921] [<c07ddd68>] (msm_atomic_commit_tail) from [<c076359c>] (commit_tail+0x40/0x6c)
[    4.731933] [<c076359c>] (commit_tail) from [<c076368c>] (drm_atomic_helper_commit+0xbc/0x128)
[    4.731948] [<c076368c>] (drm_atomic_helper_commit) from [<c0765800>] (drm_atomic_helper_dirtyfb+0x158/0x204)
[    4.731960] [<c0765800>] (drm_atomic_helper_dirtyfb) from [<c076711c>] (drm_fb_helper_dirty_work+0x15c/0x164)
[    4.731975] [<c076711c>] (drm_fb_helper_dirty_work) from [<c033c4b0>] (process_one_work+0x1fc/0x564)
[    4.731989] [<c033c4b0>] (process_one_work) from [<c033d108>] (worker_thread+0x44/0x584)
[    4.732002] [<c033d108>] (worker_thread) from [<c034247c>] (kthread+0x148/0x150)
[    4.732014] [<c034247c>] (kthread) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
[    4.732023] Exception stack(0xde965fb0 to 0xde965ff8)
[    4.732042] 5fa0:                                     00000000 00000000 00000000 00000000
[    4.732067] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    4.732088] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    4.732106] ---[ end trace d4b922f6bb6a2604 ]---
[    4.732142] [drm:mdp5_plane_cleanup_fb] plane-0: cleanup: FB[50]
[    4.732160] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (2)
[    4.732179] [drm:drm_atomic_state_default_clear] Clearing atomic state (ptrval)
[    4.732192] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[    4.732207] [drm:drm_mode_object_put.part.0] OBJ ID: 50 (3)
[    4.732222] [drm:__drm_atomic_state_free] Freeing atomic state (ptrval)
[    4.758491] Console: switching to colour frame buffer device 135x120
[    4.758533] [drm:drm_atomic_state_init] Allocated atomic state (ptrval)
[    4.758548] [drm:drm_mode_object_get] OBJ ID: 50 (2)
[    4.758564] [drm:drm_atomic_get_plane_state] Added [PLANE:32:plane-0] (ptrval) state to (ptrval)
[    4.758578] [drm:drm_mode_object_get] OBJ ID: 51 (1)
[    4.758594] [drm:drm_atomic_get_crtc_state] Added [CRTC:49:crtc-0] (ptrval) state to (ptrval)
[    4.758612] [drm:drm_atomic_get_plane_state] Added [PLANE:35:plane-1] (ptrval) state to (ptrval)
[    4.758626] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:35:plane-1] state (ptrval)
[    4.758643] [drm:drm_atomic_get_plane_state] Added [PLANE:37:plane-2] (ptrval) state to (ptrval)
[    4.758656] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:37:plane-2] state (ptrval)
[    4.758673] [drm:drm_atomic_get_plane_state] Added [PLANE:39:plane-3] (ptrval) state to (ptrval)
[    4.758686] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:39:plane-3] state (ptrval)
[    4.758703] [drm:drm_atomic_get_plane_state] Added [PLANE:41:plane-4] (ptrval) state to (ptrval)
[    4.758716] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:41:plane-4] state (ptrval)
[    4.758733] [drm:drm_atomic_get_plane_state] Added [PLANE:43:plane-5] (ptrval) state to (ptrval)
[    4.758746] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:43:plane-5] state (ptrval)
[    4.758763] [drm:drm_atomic_get_plane_state] Added [PLANE:45:plane-6] (ptrval) state to (ptrval)
[    4.758776] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:45:plane-6] state (ptrval)
[    4.759026] [drm:drm_atomic_get_plane_state] Added [PLANE:47:plane-7] (ptrval) state to (ptrval)
[    4.759040] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for [PLANE:47:plane-7] state (ptrval)
[    4.759057] [drm:drm_atomic_set_fb_for_plane] Set [FB:50] for [PLANE:32:plane-0] state (ptrval)
[    4.759069] [drm:drm_mode_object_get] OBJ ID: 50 (3)
[    4.759080] [drm:drm_mode_object_put.part.0] OBJ ID: 50 (4)
[    4.759097] [drm:drm_atomic_add_affected_connectors] Adding all current connectors for [CRTC:49:crtc-0] to (ptrval)
[    4.759114] [drm:drm_mode_object_get] OBJ ID: 31 (5)
[    4.759125] [drm:drm_mode_object_get] OBJ ID: 31 (6)
[    4.759140] [drm:drm_atomic_get_connector_state] Added [CONNECTOR:31:DSI-1] (ptrval) state to (ptrval)
[    4.759153] [drm:drm_mode_object_put.part.0] OBJ ID: 31 (6)
[    4.759168] [drm:drm_atomic_set_crtc_for_connector] Link [CONNECTOR:31:DSI-1] state (ptrval) to [NOCRTC]
[    4.759180] [drm:drm_mode_object_get] OBJ ID: 31 (5)
[    4.759196] [drm:drm_atomic_set_crtc_for_connector] Link [CONNECTOR:31:DSI-1] state (ptrval) to [CRTC:49:crtc-0]
[    4.759209] [drm:drm_atomic_check_only] checking (ptrval)
[    4.759224] [drm:dsi_mgr_connector_best_encoder] 
[    4.759244] [drm:drm_atomic_helper_check_modeset] Updating routing for [CONNECTOR:31:DSI-1]
[    4.759254] [drm:dsi_mgr_connector_best_encoder] 
[    4.759275] [drm:drm_atomic_helper_check_modeset] [CONNECTOR:31:DSI-1] keeps [ENCODER:30:DSI-30], now on [CRTC:49:crtc-0]
[    4.759293] [drm:mdp5_plane_atomic_check] plane-0: check (1 -> 1)
[    4.759316] [drm:mdp5_crtc_atomic_check] crtc-0: check
[    4.759333] [drm:mdp5_crtc_atomic_check] crtc-0: assign pipe plane-0 on stage=1
[    4.759347] [drm:drm_atomic_commit] committing (ptrval)
[    4.759369] [drm:msm_framebuffer_prepare] FB[50]: iova[0]: 20101000 (0)
[    4.759413] [drm:drm_atomic_state_init] Allocated atomic state (ptrval)
[    5.840800] EXT4-fs (dm-1): mounted filesystem with ordered data mode. Opts: (null)
[    8.871442] udevd[752]: starting version 3.2.7
[    8.876350] random: udevd: uninitialized urandom read (16 bytes read)
[    8.877358] random: udevd: uninitialized urandom read (16 bytes read)
[    8.877459] random: udevd: uninitialized urandom read (16 bytes read)
[    8.908690] udevd[753]: starting eudev-3.2.7
[    9.563857] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    9.588748] inv-mpu6050-i2c 3-0068: mounting matrix not found: using identity...
[    9.606791] input: pm8941_pwrkey as /devices/platform/soc/fc4cf000.spmi/spmi-0/0-00/fc4cf000.spmi:pm8941@0:pwrkey@800/input/input1
[    9.679456] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    9.680082] platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
[    9.680093] cfg80211: failed to load regulatory.db
[    9.797045] ak8975 4-000f: mounting matrix not found: using identity...
[    9.825968] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4339-sdio for chip BCM4339/2
[    9.835347] brcmfmac mmc0:0001:1: Direct firmware load for brcm/brcmfmac4339-sdio.lge,hammerhead.txt failed with error -2
[   10.163863] i2c i2c-3: Added multiplexed i2c bus 4
[   12.344803] e cgroup1: Need name or subsystem set
[   12.682849] urandom_read: 2 callbacks suppressed
[   12.682860] random: mktemp: uninitialized urandom read (10 bytes read)
[   15.201752] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:49:crtc-0] flip_done timed out
[   18.574025] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   19.368235] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   19.522781] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   19.955263] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   20.160328] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   20.395962] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   23.364779] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   24.303460] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   24.390171] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   25.441747] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:32:plane-0] flip_done timed out
[   25.441806] [drm:drm_calc_timestamping_constants] crtc 49: hwmode: htotal 1086, vtotal 1926, vdisplay 1920
[   25.441820] [drm:drm_calc_timestamping_constants] crtc 49: clock 150000 kHz framedur 13944240 linedur 7240
[   25.441835] [drm:drm_atomic_helper_commit_planes] crtc-0: begin
[   25.441848] [drm:mdp5_plane_atomic_update] plane-0: update
[   25.441865] [drm:mdp5_plane_mode_set] plane-0: FB[50] 0,0,1080,1920 -> CRTC[49] 0,0,1080,1920
[   25.441877] [drm:mdp5_plane_mode_set] scale config = 0
[   25.441909] [drm:mdp5_crtc_atomic_flush] crtc-0: event: (ptrval)
[   25.441914] ------------[ cut here ]------------
[   25.441928] WARNING: CPU: 0 PID: 100 at drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c:709 mdp5_crtc_atomic_flush+0x174/0x190
[   25.441933] Modules linked in: brcmfmac brcmutil qcom_spmi_vadc qcom_vadc_common pm8941_pwrkey qcom_spmi_iadc inv_mpu6050_i2c inv_mpu6050 tsl2772 bq24190_charger cfg80211 dm_mod
[   25.442026] CPU: 0 PID: 100 Comm: kworker/0:2 Tainted: G        W         5.1.0-rc6-next-20190426-00009-g75891c3edac4-dirty #303
[   25.442035] Hardware name: Generic DT based system
[   25.442054] Workqueue: events deferred_probe_work_func
[   25.442079] [<c031229c>] (unwind_backtrace) from [<c030d5ac>] (show_stack+0x10/0x14)
[   25.442094] [<c030d5ac>] (show_stack) from [<c0ac152c>] (dump_stack+0x78/0x8c)
[   25.442110] [<c0ac152c>] (dump_stack) from [<c0321660>] (__warn.part.3+0xb8/0xd4)
[   25.442124] [<c0321660>] (__warn.part.3) from [<c03217d8>] (warn_slowpath_null+0x44/0x4c)
[   25.442137] [<c03217d8>] (warn_slowpath_null) from [<c07ad97c>] (mdp5_crtc_atomic_flush+0x174/0x190)
[   25.442152] [<c07ad97c>] (mdp5_crtc_atomic_flush) from [<c075f5e0>] (drm_atomic_helper_commit_planes+0x1fc/0x270)
[   25.442172] [<c075f5e0>] (drm_atomic_helper_commit_planes) from [<c07ddd04>] (msm_atomic_commit_tail+0x44/0x140)
[   25.442187] [<c07ddd04>] (msm_atomic_commit_tail) from [<c076359c>] (commit_tail+0x40/0x6c)
[   25.442198] [<c076359c>] (commit_tail) from [<c076368c>] (drm_atomic_helper_commit+0xbc/0x128)
[   25.442210] [<c076368c>] (drm_atomic_helper_commit) from [<c0766a88>] (restore_fbdev_mode_atomic+0x168/0x1d4)
[   25.442219] [<c0766a88>] (restore_fbdev_mode_atomic) from [<c0766c48>] (drm_fb_helper_pan_display+0xc4/0x1d8)
[   25.442234] [<c0766c48>] (drm_fb_helper_pan_display) from [<c06e7c38>] (fb_pan_display+0x9c/0x110)
[   25.442247] [<c06e7c38>] (fb_pan_display) from [<c06f3528>] (bit_update_start+0x14/0x30)
[   25.442257] [<c06f3528>] (bit_update_start) from [<c06f215c>] (fbcon_switch+0x390/0x514)
[   25.442269] [<c06f215c>] (fbcon_switch) from [<c073d5d4>] (redraw_screen+0x13c/0x244)
[   25.442280] [<c073d5d4>] (redraw_screen) from [<c073e010>] (do_bind_con_driver+0x354/0x3c4)
[   25.442291] [<c073e010>] (do_bind_con_driver) from [<c073e44c>] (do_take_over_console+0x150/0x1f0)
[   25.442300] [<c073e44c>] (do_take_over_console) from [<c06ef97c>] (do_fbcon_takeover+0x78/0xd8)
[   25.442317] [<c06ef97c>] (do_fbcon_takeover) from [<c0343b04>] (notifier_call_chain+0x48/0x80)
[   25.442329] [<c0343b04>] (notifier_call_chain) from [<c03442b8>] (blocking_notifier_call_chain+0x50/0x68)
[   25.442341] [<c03442b8>] (blocking_notifier_call_chain) from [<c06e9794>] (register_framebuffer+0x224/0x304)
[   25.442354] [<c06e9794>] (register_framebuffer) from [<c076a45c>] (__drm_fb_helper_initial_config_and_unlock+0x2f0/0x53c)
[   25.442371] [<c076a45c>] (__drm_fb_helper_initial_config_and_unlock) from [<c07e9b18>] (msm_fbdev_init+0x74/0xbc)
[   25.442383] [<c07e9b18>] (msm_fbdev_init) from [<c07df768>] (msm_drm_bind+0x560/0x634)
[   25.442399] [<c07df768>] (msm_drm_bind) from [<c07fbb18>] (try_to_bring_up_master+0x1f8/0x2b4)
[   25.442412] [<c07fbb18>] (try_to_bring_up_master) from [<c07fbc84>] (__component_add+0xb0/0x174)
[   25.442427] [<c07fbc84>] (__component_add) from [<c08043d4>] (platform_drv_probe+0x48/0x98)
[   25.442441] [<c08043d4>] (platform_drv_probe) from [<c0802068>] (really_probe+0x248/0x40c)
[   25.442452] [<c0802068>] (really_probe) from [<c08023dc>] (driver_probe_device+0x74/0x1c0)
[   25.442463] [<c08023dc>] (driver_probe_device) from [<c08001d0>] (bus_for_each_drv+0x80/0xc4)
[   25.442474] [<c08001d0>] (bus_for_each_drv) from [<c0801d80>] (__device_attach+0xd0/0x168)
[   25.442484] [<c0801d80>] (__device_attach) from [<c0800f94>] (bus_probe_device+0x84/0x8c)
[   25.442494] [<c0800f94>] (bus_probe_device) from [<c08014dc>] (deferred_probe_work_func+0x84/0xc4)
[   25.442510] [<c08014dc>] (deferred_probe_work_func) from [<c033c4b0>] (process_one_work+0x1fc/0x564)
[   25.442524] [<c033c4b0>] (process_one_work) from [<c033d108>] (worker_thread+0x44/0x584)
[   25.442537] [<c033d108>] (worker_thread) from [<c034247c>] (kthread+0x148/0x150)
[   25.442548] [<c034247c>] (kthread) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
[   25.442558] Exception stack(0xc4e09fb0 to 0xc4e09ff8)
[   25.442577] 9fa0:                                     00000000 00000000 00000000 00000000
[   25.442601] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   25.442623] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   25.442632] ---[ end trace d4b922f6bb6a2605 ]---
[   25.442663] [drm:mdp5_ctl_blend] lm0: blend config = 0x00040000. ext_cfg = 0x00000000
[   25.442677] [drm:crtc_flush] crtc-0: flush=00000840
[   25.501752] msm fd900000.mdss: pp done time out, lm=0
[   25.561740] ------------[ cut here ]------------
[   25.561758] WARNING: CPU: 0 PID: 100 at drivers/gpu/drm/drm_atomic_helper.c:1429 drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290
[   25.561766] [CRTC:49:crtc-0] vblank wait timed out
[   25.561770] Modules linked in: brcmfmac brcmutil qcom_spmi_vadc qcom_vadc_common pm8941_pwrkey qcom_spmi_iadc inv_mpu6050_i2c inv_mpu6050 tsl2772 bq24190_charger cfg80211 dm_mod
[   25.561854] CPU: 0 PID: 100 Comm: kworker/0:2 Tainted: G        W         5.1.0-rc6-next-20190426-00009-g75891c3edac4-dirty #303
[   25.561863] Hardware name: Generic DT based system
[   25.561879] Workqueue: events deferred_probe_work_func
[   25.561897] [<c031229c>] (unwind_backtrace) from [<c030d5ac>] (show_stack+0x10/0x14)
[   25.561908] [<c030d5ac>] (show_stack) from [<c0ac152c>] (dump_stack+0x78/0x8c)
[   25.561921] [<c0ac152c>] (dump_stack) from [<c0321660>] (__warn.part.3+0xb8/0xd4)
[   25.561933] [<c0321660>] (__warn.part.3) from [<c03216e0>] (warn_slowpath_fmt+0x64/0x88)
[   25.561947] [<c03216e0>] (warn_slowpath_fmt) from [<c0761ca4>] (drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290)
[   25.561963] [<c0761ca4>] (drm_atomic_helper_wait_for_vblanks.part.1) from [<c07b0d50>] (mdp5_complete_commit+0x14/0x40)
[   25.561980] [<c07b0d50>] (mdp5_complete_commit) from [<c07ddd68>] (msm_atomic_commit_tail+0xa8/0x140)
[   25.561993] [<c07ddd68>] (msm_atomic_commit_tail) from [<c076359c>] (commit_tail+0x40/0x6c)
[   25.562005] [<c076359c>] (commit_tail) from [<c076368c>] (drm_atomic_helper_commit+0xbc/0x128)
[   25.562015] [<c076368c>] (drm_atomic_helper_commit) from [<c0766a88>] (restore_fbdev_mode_atomic+0x168/0x1d4)
[   25.562024] [<c0766a88>] (restore_fbdev_mode_atomic) from [<c0766c48>] (drm_fb_helper_pan_display+0xc4/0x1d8)
[   25.562036] [<c0766c48>] (drm_fb_helper_pan_display) from [<c06e7c38>] (fb_pan_display+0x9c/0x110)
[   25.562047] [<c06e7c38>] (fb_pan_display) from [<c06f3528>] (bit_update_start+0x14/0x30)
[   25.562056] [<c06f3528>] (bit_update_start) from [<c06f215c>] (fbcon_switch+0x390/0x514)
[   25.562066] [<c06f215c>] (fbcon_switch) from [<c073d5d4>] (redraw_screen+0x13c/0x244)
[   25.562076] [<c073d5d4>] (redraw_screen) from [<c073e010>] (do_bind_con_driver+0x354/0x3c4)
[   25.562085] [<c073e010>] (do_bind_con_driver) from [<c073e44c>] (do_take_over_console+0x150/0x1f0)
[   25.562095] [<c073e44c>] (do_take_over_console) from [<c06ef97c>] (do_fbcon_takeover+0x78/0xd8)
[   25.562107] [<c06ef97c>] (do_fbcon_takeover) from [<c0343b04>] (notifier_call_chain+0x48/0x80)
[   25.562118] [<c0343b04>] (notifier_call_chain) from [<c03442b8>] (blocking_notifier_call_chain+0x50/0x68)
[   25.562129] [<c03442b8>] (blocking_notifier_call_chain) from [<c06e9794>] (register_framebuffer+0x224/0x304)
[   25.562142] [<c06e9794>] (register_framebuffer) from [<c076a45c>] (__drm_fb_helper_initial_config_and_unlock+0x2f0/0x53c)
[   25.562156] [<c076a45c>] (__drm_fb_helper_initial_config_and_unlock) from [<c07e9b18>] (msm_fbdev_init+0x74/0xbc)
[   25.562166] [<c07e9b18>] (msm_fbdev_init) from [<c07df768>] (msm_drm_bind+0x560/0x634)
[   25.562179] [<c07df768>] (msm_drm_bind) from [<c07fbb18>] (try_to_bring_up_master+0x1f8/0x2b4)
[   25.562192] [<c07fbb18>] (try_to_bring_up_master) from [<c07fbc84>] (__component_add+0xb0/0x174)
[   25.562206] [<c07fbc84>] (__component_add) from [<c08043d4>] (platform_drv_probe+0x48/0x98)
[   25.562218] [<c08043d4>] (platform_drv_probe) from [<c0802068>] (really_probe+0x248/0x40c)
[   25.562229] [<c0802068>] (really_probe) from [<c08023dc>] (driver_probe_device+0x74/0x1c0)
[   25.562239] [<c08023dc>] (driver_probe_device) from [<c08001d0>] (bus_for_each_drv+0x80/0xc4)
[   25.562250] [<c08001d0>] (bus_for_each_drv) from [<c0801d80>] (__device_attach+0xd0/0x168)
[   25.562260] [<c0801d80>] (__device_attach) from [<c0800f94>] (bus_probe_device+0x84/0x8c)
[   25.562271] [<c0800f94>] (bus_probe_device) from [<c08014dc>] (deferred_probe_work_func+0x84/0xc4)
[   25.562284] [<c08014dc>] (deferred_probe_work_func) from [<c033c4b0>] (process_one_work+0x1fc/0x564)
[   25.562297] [<c033c4b0>] (process_one_work) from [<c033d108>] (worker_thread+0x44/0x584)
[   25.562309] [<c033d108>] (worker_thread) from [<c034247c>] (kthread+0x148/0x150)
[   25.562319] [<c034247c>] (kthread) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
[   25.562328] Exception stack(0xc4e09fb0 to 0xc4e09ff8)
[   25.562345] 9fa0:                                     00000000 00000000 00000000 00000000
[   25.562370] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   25.562391] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   25.562399] ---[ end trace d4b922f6bb6a2606 ]---
[   25.562431] [drm:mdp5_plane_cleanup_fb] plane-0: cleanup: FB[50]
[   25.562453] [drm:drm_atomic_state_default_clear] Clearing atomic state (ptrval)
[   25.562467] [drm:drm_mode_object_put.part.0] OBJ ID: 31 (6)
[   25.562480] [drm:drm_mode_object_put.part.0] OBJ ID: 31 (5)
[   25.562493] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   25.562507] [drm:drm_mode_object_put.part.0] OBJ ID: 50 (3)
[   25.562526] [drm:__drm_atomic_state_free] Freeing atomic state (ptrval)
[   25.571673] [drm:drm_mode_object_get] OBJ ID: 50 (2)
[   25.571690] [drm:drm_atomic_get_plane_state] Added [PLANE:32:plane-0] (ptrval) state to (ptrval)
[   25.571705] [drm:drm_mode_object_get] OBJ ID: 51 (1)
[   25.571720] [drm:drm_atomic_get_crtc_state] Added [CRTC:49:crtc-0] (ptrval) state to (ptrval)
[   25.571732] [drm:drm_mode_object_get] OBJ ID: 53 (1)
[   25.571745] [drm:drm_atomic_check_only] checking (ptrval)
[   25.571767] [drm:mdp5_plane_atomic_check] plane-0: check (1 -> 1)
[   25.571787] [drm:mdp5_crtc_atomic_check] crtc-0: check
[   25.571804] [drm:mdp5_crtc_atomic_check] crtc-0: assign pipe plane-0 on stage=1
[   25.571817] [drm:drm_atomic_commit] committing (ptrval)
[   25.571836] [drm:msm_framebuffer_prepare] FB[50]: iova[0]: 20101000 (0)
[   26.223530] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   35.681745] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:49:crtc-0] flip_done timed out
[   40.478585] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   40.531284] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   40.593999] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   40.916158] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   43.157049] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   45.172624] sysrq: HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p) show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) show-blocked-tasks(w) dump-ftrace-buffer(z) 
[   45.921742] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:32:plane-0] flip_done timed out
[   45.921787] [drm:drm_calc_timestamping_constants] crtc 49: hwmode: htotal 1086, vtotal 1926, vdisplay 1920
[   45.921801] [drm:drm_calc_timestamping_constants] crtc 49: clock 150000 kHz framedur 13944240 linedur 7240
[   45.921814] [drm:drm_atomic_helper_commit_planes] crtc-0: begin
[   45.921827] [drm:mdp5_plane_atomic_update] plane-0: update
[   45.921842] [drm:mdp5_plane_mode_set] plane-0: FB[50] 0,0,1080,1920 -> CRTC[49] 0,0,1080,1920
[   45.921854] [drm:mdp5_plane_mode_set] scale config = 0
[   45.921879] [drm:mdp5_crtc_atomic_flush] crtc-0: event: (ptrval)
[   45.921884] ------------[ cut here ]------------
[   45.921898] WARNING: CPU: 0 PID: 20 at drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c:709 mdp5_crtc_atomic_flush+0x174/0x190
[   45.921902] Modules linked in: brcmfmac brcmutil qcom_spmi_vadc qcom_vadc_common pm8941_pwrkey qcom_spmi_iadc inv_mpu6050_i2c inv_mpu6050 tsl2772 bq24190_charger cfg80211 dm_mod
[   45.921990] CPU: 0 PID: 20 Comm: kworker/0:1 Tainted: G        W         5.1.0-rc6-next-20190426-00009-g75891c3edac4-dirty #303
[   45.921998] Hardware name: Generic DT based system
[   45.922014] Workqueue: events drm_fb_helper_dirty_work
[   45.922034] [<c031229c>] (unwind_backtrace) from [<c030d5ac>] (show_stack+0x10/0x14)
[   45.922046] [<c030d5ac>] (show_stack) from [<c0ac152c>] (dump_stack+0x78/0x8c)
[   45.922061] [<c0ac152c>] (dump_stack) from [<c0321660>] (__warn.part.3+0xb8/0xd4)
[   45.922073] [<c0321660>] (__warn.part.3) from [<c03217d8>] (warn_slowpath_null+0x44/0x4c)
[   45.922086] [<c03217d8>] (warn_slowpath_null) from [<c07ad97c>] (mdp5_crtc_atomic_flush+0x174/0x190)
[   45.922099] [<c07ad97c>] (mdp5_crtc_atomic_flush) from [<c075f5e0>] (drm_atomic_helper_commit_planes+0x1fc/0x270)
[   45.922115] [<c075f5e0>] (drm_atomic_helper_commit_planes) from [<c07ddd04>] (msm_atomic_commit_tail+0x44/0x140)
[   45.922129] [<c07ddd04>] (msm_atomic_commit_tail) from [<c076359c>] (commit_tail+0x40/0x6c)
[   45.922141] [<c076359c>] (commit_tail) from [<c076368c>] (drm_atomic_helper_commit+0xbc/0x128)
[   45.922156] [<c076368c>] (drm_atomic_helper_commit) from [<c0765800>] (drm_atomic_helper_dirtyfb+0x158/0x204)
[   45.922169] [<c0765800>] (drm_atomic_helper_dirtyfb) from [<c076711c>] (drm_fb_helper_dirty_work+0x15c/0x164)
[   45.922182] [<c076711c>] (drm_fb_helper_dirty_work) from [<c033c4b0>] (process_one_work+0x1fc/0x564)
[   45.922195] [<c033c4b0>] (process_one_work) from [<c033d108>] (worker_thread+0x44/0x584)
[   45.922208] [<c033d108>] (worker_thread) from [<c034247c>] (kthread+0x148/0x150)
[   45.922219] [<c034247c>] (kthread) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
[   45.922228] Exception stack(0xde965fb0 to 0xde965ff8)
[   45.922246] 5fa0:                                     00000000 00000000 00000000 00000000
[   45.922271] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   45.922291] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   45.922299] ---[ end trace d4b922f6bb6a2607 ]---
[   45.922328] [drm:mdp5_ctl_blend] lm0: blend config = 0x00040000. ext_cfg = 0x00000000
[   45.922343] [drm:crtc_flush] crtc-0: flush=00000840
[   45.981760] msm fd900000.mdss: pp done time out, lm=0
[   46.041730] ------------[ cut here ]------------
[   46.041748] WARNING: CPU: 0 PID: 20 at drivers/gpu/drm/drm_atomic_helper.c:1429 drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290
[   46.041756] [CRTC:49:crtc-0] vblank wait timed out
[   46.041760] Modules linked in: brcmfmac brcmutil qcom_spmi_vadc qcom_vadc_common pm8941_pwrkey qcom_spmi_iadc inv_mpu6050_i2c inv_mpu6050 tsl2772 bq24190_charger cfg80211 dm_mod
[   46.041843] CPU: 0 PID: 20 Comm: kworker/0:1 Tainted: G        W         5.1.0-rc6-next-20190426-00009-g75891c3edac4-dirty #303
[   46.041851] Hardware name: Generic DT based system
[   46.041866] Workqueue: events drm_fb_helper_dirty_work
[   46.041884] [<c031229c>] (unwind_backtrace) from [<c030d5ac>] (show_stack+0x10/0x14)
[   46.041895] [<c030d5ac>] (show_stack) from [<c0ac152c>] (dump_stack+0x78/0x8c)
[   46.041907] [<c0ac152c>] (dump_stack) from [<c0321660>] (__warn.part.3+0xb8/0xd4)
[   46.041919] [<c0321660>] (__warn.part.3) from [<c03216e0>] (warn_slowpath_fmt+0x64/0x88)
[   46.041933] [<c03216e0>] (warn_slowpath_fmt) from [<c0761ca4>] (drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290)
[   46.041948] [<c0761ca4>] (drm_atomic_helper_wait_for_vblanks.part.1) from [<c07b0d50>] (mdp5_complete_commit+0x14/0x40)
[   46.041964] [<c07b0d50>] (mdp5_complete_commit) from [<c07ddd68>] (msm_atomic_commit_tail+0xa8/0x140)
[   46.041978] [<c07ddd68>] (msm_atomic_commit_tail) from [<c076359c>] (commit_tail+0x40/0x6c)
[   46.041990] [<c076359c>] (commit_tail) from [<c076368c>] (drm_atomic_helper_commit+0xbc/0x128)
[   46.042003] [<c076368c>] (drm_atomic_helper_commit) from [<c0765800>] (drm_atomic_helper_dirtyfb+0x158/0x204)
[   46.042014] [<c0765800>] (drm_atomic_helper_dirtyfb) from [<c076711c>] (drm_fb_helper_dirty_work+0x15c/0x164)
[   46.042026] [<c076711c>] (drm_fb_helper_dirty_work) from [<c033c4b0>] (process_one_work+0x1fc/0x564)
[   46.042039] [<c033c4b0>] (process_one_work) from [<c033d108>] (worker_thread+0x44/0x584)
[   46.042051] [<c033d108>] (worker_thread) from [<c034247c>] (kthread+0x148/0x150)
[   46.042061] [<c034247c>] (kthread) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
[   46.042070] Exception stack(0xde965fb0 to 0xde965ff8)
[   46.042087] 5fa0:                                     00000000 00000000 00000000 00000000
[   46.042112] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   46.042134] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   46.042141] ---[ end trace d4b922f6bb6a2608 ]---
[   46.042171] [drm:mdp5_plane_cleanup_fb] plane-0: cleanup: FB[50]
[   46.042187] [drm:drm_mode_object_put.part.0] OBJ ID: 53 (2)
[   46.042204] [drm:drm_atomic_state_default_clear] Clearing atomic state (ptrval)
[   46.042215] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   46.042230] [drm:drm_mode_object_put.part.0] OBJ ID: 50 (3)
[   46.042244] [drm:__drm_atomic_state_free] Freeing atomic state (ptrval)
[   46.042273] [drm:drm_atomic_state_init] Allocated atomic state (ptrval)
[   46.042291] [drm:drm_mode_object_get] OBJ ID: 50 (2)
[   46.042306] [drm:drm_atomic_get_plane_state] Added [PLANE:32:plane-0] (ptrval) state to (ptrval)
[   46.042320] [drm:drm_mode_object_get] OBJ ID: 51 (1)
[   46.042335] [drm:drm_atomic_get_crtc_state] Added [CRTC:49:crtc-0] (ptrval) state to (ptrval)
[   46.042346] [drm:drm_mode_object_get] OBJ ID: 54 (1)
[   46.042359] [drm:drm_atomic_check_only] checking (ptrval)
[   46.042376] [drm:mdp5_plane_atomic_check] plane-0: check (1 -> 1)
[   46.042395] [drm:mdp5_crtc_atomic_check] crtc-0: check
[   46.042411] [drm:mdp5_crtc_atomic_check] crtc-0: assign pipe plane-0 on stage=1
[   46.042423] [drm:drm_atomic_commit] committing (ptrval)
[   46.042440] [drm:msm_framebuffer_prepare] FB[50]: iova[0]: 20101000 (0)
[   56.161749] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:49:crtc-0] flip_done timed out
[   59.666659] [drm:dsi_host_irq] isr=0x2000700, id=0
[   61.315067] [drm:mdp5_crtc_vblank_irq] crtc-0: send event: (ptrval)
[   61.315103] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=1, diff=0, hw=0 hw_last=0
[   61.315117] [drm:vblank_disable_fn] disabling vblank on crtc 0
[   61.315136] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=1, diff=0, hw=0 hw_last=0
[   61.315147] [drm:msm_disable_vblank] dev=(ptrval), crtc=0
[   61.315220] [drm:drm_calc_timestamping_constants] crtc 49: hwmode: htotal 1086, vtotal 1926, vdisplay 1920
[   61.315234] [drm:drm_calc_timestamping_constants] crtc 49: clock 150000 kHz framedur 13944240 linedur 7240
[   61.315247] [drm:drm_atomic_helper_commit_planes] crtc-0: begin
[   61.315260] [drm:mdp5_plane_atomic_update] plane-0: update
[   61.315275] [drm:mdp5_plane_mode_set] plane-0: FB[50] 0,0,1080,1920 -> CRTC[49] 0,0,1080,1920
[   61.315286] [drm:mdp5_plane_mode_set] scale config = 0
[   61.315311] [drm:mdp5_crtc_atomic_flush] crtc-0: event: (ptrval)
[   61.315337] [drm:mdp5_ctl_blend] lm0: blend config = 0x00040000. ext_cfg = 0x00000000
[   61.315351] [drm:crtc_flush] crtc-0: flush=00000840
[   61.315369] [drm:msm_enable_vblank] dev=(ptrval), crtc=0
[   61.315388] [drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
[   61.315406] [drm:drm_update_vblank_count] updating vblank count on crtc 0: current=1, diff=0, hw=0 hw_last=0
[   61.318527] [drm:dsi_host_irq] isr=0x2000700, id=0
[   61.371744] msm fd900000.mdss: pp done time out, lm=0
[   61.431730] ------------[ cut here ]------------
[   61.431747] WARNING: CPU: 0 PID: 20 at drivers/gpu/drm/drm_atomic_helper.c:1429 drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290
[   61.431754] [CRTC:49:crtc-0] vblank wait timed out
[   61.431758] Modules linked in: brcmfmac brcmutil qcom_spmi_vadc qcom_vadc_common pm8941_pwrkey qcom_spmi_iadc inv_mpu6050_i2c inv_mpu6050 tsl2772 bq24190_charger cfg80211 dm_mod
[   61.431843] CPU: 0 PID: 20 Comm: kworker/0:1 Tainted: G        W         5.1.0-rc6-next-20190426-00009-g75891c3edac4-dirty #303
[   61.431851] Hardware name: Generic DT based system
[   61.431866] Workqueue: events drm_fb_helper_dirty_work
[   61.431885] [<c031229c>] (unwind_backtrace) from [<c030d5ac>] (show_stack+0x10/0x14)
[   61.431896] [<c030d5ac>] (show_stack) from [<c0ac152c>] (dump_stack+0x78/0x8c)
[   61.431909] [<c0ac152c>] (dump_stack) from [<c0321660>] (__warn.part.3+0xb8/0xd4)
[   61.431922] [<c0321660>] (__warn.part.3) from [<c03216e0>] (warn_slowpath_fmt+0x64/0x88)
[   61.431936] [<c03216e0>] (warn_slowpath_fmt) from [<c0761ca4>] (drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290)
[   61.431952] [<c0761ca4>] (drm_atomic_helper_wait_for_vblanks.part.1) from [<c07b0d50>] (mdp5_complete_commit+0x14/0x40)
[   61.431968] [<c07b0d50>] (mdp5_complete_commit) from [<c07ddd68>] (msm_atomic_commit_tail+0xa8/0x140)
[   61.431981] [<c07ddd68>] (msm_atomic_commit_tail) from [<c076359c>] (commit_tail+0x40/0x6c)
[   61.431993] [<c076359c>] (commit_tail) from [<c076368c>] (drm_atomic_helper_commit+0xbc/0x128)
[   61.432006] [<c076368c>] (drm_atomic_helper_commit) from [<c0765800>] (drm_atomic_helper_dirtyfb+0x158/0x204)
[   61.432017] [<c0765800>] (drm_atomic_helper_dirtyfb) from [<c076711c>] (drm_fb_helper_dirty_work+0x15c/0x164)
[   61.432031] [<c076711c>] (drm_fb_helper_dirty_work) from [<c033c4b0>] (process_one_work+0x1fc/0x564)
[   61.432043] [<c033c4b0>] (process_one_work) from [<c033d384>] (worker_thread+0x2c0/0x584)
[   61.432055] [<c033d384>] (worker_thread) from [<c034247c>] (kthread+0x148/0x150)
[   61.432066] [<c034247c>] (kthread) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
[   61.432075] Exception stack(0xde965fb0 to 0xde965ff8)
[   61.432092] 5fa0:                                     00000000 00000000 00000000 00000000
[   61.432117] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   61.432138] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   61.432147] ---[ end trace d4b922f6bb6a2609 ]---
[   61.432176] [drm:mdp5_plane_cleanup_fb] plane-0: cleanup: FB[50]
[   61.432192] [drm:drm_mode_object_put.part.0] OBJ ID: 54 (2)
[   61.432207] [drm:drm_atomic_state_default_clear] Clearing atomic state (ptrval)
[   61.432219] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (2)
[   61.432232] [drm:drm_mode_object_put.part.0] OBJ ID: 50 (3)
[   61.432245] [drm:__drm_atomic_state_free] Freeing atomic state (ptrval)
[   61.432373] msm fd900000.mdss: fb0: msmdrmfb frame buffer device
[   61.432405] [drm:drm_atomic_state_init] Allocated atomic state (ptrval)
[   61.432423] [drm:drm_mode_object_get] OBJ ID: 50 (2)
[   61.432438] [drm:drm_atomic_get_plane_state] Added [PLANE:32:plane-0] (ptrval) state to (ptrval)
[   61.432452] [drm:drm_mode_object_get] OBJ ID: 51 (1)
[   61.432470] [drm:drm_atomic_get_crtc_state] Added [CRTC:49:crtc-0] (ptrval) state to (ptrval)
[   61.432482] [drm:drm_mode_object_get] OBJ ID: 55 (1)
[   61.432496] [drm:drm_atomic_check_only] checking (ptrval)
[   61.432515] [drm:mdp5_plane_atomic_check] plane-0: check (1 -> 1)
[   61.432534] [drm:mdp5_crtc_atomic_check] crtc-0: check
[   61.432552] [drm:mdp5_crtc_atomic_check] crtc-0: assign pipe plane-0 on stage=1
[   61.432566] [drm:drm_atomic_commit] committing (ptrval)
[   61.432583] [drm:msm_framebuffer_prepare] FB[50]: iova[0]: 20101000 (0)
[   62.481750] [drm:drm_sysfs_hotplug_event] generating hotplug event

--0F1p//8PRICkK4MW
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--0F1p//8PRICkK4MW--

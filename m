Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5E32F9B3D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 09:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B0C6E1B8;
	Mon, 18 Jan 2021 08:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5AF6E0A6
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jan 2021 12:49:09 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id c6so5411453ede.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jan 2021 04:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=EgAMHIo5P8WtoStq1lgTXu3k8raMeCu+ey+ZUJBoJ68=;
 b=d0utUClkbmQmP4lCtqyCSYWnYkFSnbZPAxELqXBalqjKg6cGB7k0wBNKIdL/k0wJSK
 K1E0V87GKFkwxg8gZJU49rzykyrVoum1mMU4R8JJlsHaif31y7opB7OvXKNpYQR/DTbP
 /8U6boVmHBYUCvKheWhoqF1WW9as0Vbzju5BmUwyjgygRLmOwqQ+Bi8ADeSBqZ95u/86
 j+cCjTQAhbAD7i0elOzKcLI+mgDRuUPeaBBG9+/GZA9Wotv0kf/RrRWIYRuw2z5XjYnR
 uFmBlw2v7Rl3uvigXniYd1brp/NMDC1ZrablYnBXTQvQ1kRZPIBXAlX3RYA+bG5SiDJv
 rnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=EgAMHIo5P8WtoStq1lgTXu3k8raMeCu+ey+ZUJBoJ68=;
 b=jVTTxG62OEoTn5vA/JiG0fGLLQT1Bn0KqQM9/Wo9bmT0Pu6TKa+CwyKaNMIVVywIES
 H9aX3+1F0MwEbqw/1XtfBARsuHO+eDJ8S+/ZCq8eNIq6bC5V8cRuUk8YMT5fQv+FOGfF
 Vt3D/QxGZC4yn4dPwM9wWZ/8f+Zzstv1MEo/zCwqCemE9UE3Dvdp1KAvsaZWD+kGsjSd
 hgPzW9PKrOGyjfvDMyury5FCTLK0NaS7nmzahRQvY2TIHZMgaCsm/U5ALl6uZqNtboOM
 bD7+s239bUMP7MHP3nBYoDzkOxbLHKNAj/ZjJEuRtreD8/EzFbHeRLx923DKUjn0NE25
 lLHA==
X-Gm-Message-State: AOAM5317Ro6QC3P7rBAyEhjAcu59XRxUhmIzgg04AZHAzj8Q1BJ7/mwh
 szXmmRIW8KT1saqozOc7AfI=
X-Google-Smtp-Source: ABdhPJx9cAo7drlCTRsrfP40Qt9H93Xx/VeJWK44aLeXHoduiXjO582jT+sJsXkQuwkq6BGkG2ixpQ==
X-Received: by 2002:aa7:dcc9:: with SMTP id w9mr12782833edu.22.1610801347419; 
 Sat, 16 Jan 2021 04:49:07 -0800 (PST)
Received: from localhost (124-155-N1.p43.customer.vsm.sh. [91.106.155.124])
 by smtp.gmail.com with ESMTPSA id cw21sm793699edb.85.2021.01.16.04.49.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 16 Jan 2021 04:49:06 -0800 (PST)
Date: Sat, 16 Jan 2021 13:48:56 +0100
From: Oliver Graute <oliver.graute@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1] drm/panel: simple: add SGD GKTW70SDAD1SD
Message-ID: <20210116124856.GA3406@portage>
References: <1608381853-18582-1-git-send-email-oliver.graute@gmail.com>
 <20210108214313.GA7979@ripley>
 <CAOMZO5AXgeGYt4+4NMBRL1Hm-9M4X2DngdEBsJEAHq8+MRhQgQ@mail.gmail.com>
 <20210110153532.GA7264@ripley>
 <CAOMZO5C_hDWeVrCh7k+3OiA0jhQfawhGWE6hxnnFn=wA+dkTGQ@mail.gmail.com>
 <20210110200606.GD7264@ripley>
 <CAOMZO5DJUm4zutTB1oi5M0zj4_PFZEAbGzX6_LUAkX_dvEz=Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5DJUm4zutTB1oi5M0zj4_PFZEAbGzX6_LUAkX_dvEz=Qg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 18 Jan 2021 08:25:29 +0000
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
Cc: David Airlie <airlied@linux.ie>, Marco Felsch <m.felsch@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/01/21, Fabio Estevam wrote:
> On Sun, Jan 10, 2021 at 5:09 PM Oliver Graute <oliver.graute@gmail.com> w=
rote:
> =

> > here the schematics and my dts. The board is using a LVDS connector for
> > the display.
> =

> The schematics shows the GKTW70SDAD1SD panel in the J4 connector, not
> the LVDS J7 connector.

yes you are right. But how to I map this fact correctly in my dts?

> > https://www.variscite.de/wp-content/uploads/2017/12/VAR-6ULCustomboard-=
Schematics.pdf
> > https://lore.kernel.org/linux-arm-kernel/1610144511-19018-3-git-send-em=
ail-oliver.graute@gmail.com/
> =

> As I mentioned earlier you should remove the display timings from the
> dts when using the compatible string for the panel.

I got this and removed the display timings.

> =

> power-supply =3D <&reg_touch_3v3> is not correct, as the reg_touch_3v3
> does not power the LCD.

yes, but how is the LCD correctly powered then? =


> =

> Another hint is to use the PLL5_VIDEO as the clock source for the
> lcdif controller as done in the imx6ul evk dtsi.

I already figured it out and tried it. But because of the faults above
it didn't make any difference.  =


> =

> It would also help if you could share the complete boot log.

here is the boot log


Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.10.0-test-00006-gc24ef7716d4b (oliver@ripley=
) (arm-linux-gnueabihf-gcc (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.9) 5.4.0 201=
60609, GNU ld (GNU Binutils for Ubuntu) 2.26.1) #1 SMP Sat Jan 16 13:28:37 =
CET 2021
[    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=3D10c=
5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instr=
uction cache
[    0.000000] OF: fdt: Machine model: Variscite i.MX6 UltraLite Carrier-bo=
ard
[    0.000000] earlycon: ec_imx6q0 at MMIO 0x02020000 (options '')
[    0.000000] printk: bootconsole [ec_imx6q0] enabled
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Reserved 64 MiB at 0x9c000000
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000080000000-0x000000009fffffff]
[    0.000000]   HighMem  empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x000000009fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x000000009ffff=
fff]
[    0.000000] percpu: Embedded 18 pages/cpu s51692 r0 d22036 u73728
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 130048
[    0.000000] Kernel command line: console=3Dttymxc0,115200,115200 root=3D=
/dev/nfs ip=3Ddhcp nfsroot=3D192.168.3.13:/volume1/nfs/rootfs/,v3,tcp rw ea=
rlycon
[    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 byt=
es, linear)
[    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 byte=
s, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 422620K/524288K available (16384K kernel code, 2090K=
 rwdata, 4636K rodata, 1024K init, 6680K bss, 36132K reserved, 65536K cma-r=
eserved, 0K highmem)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1
[    0.000000] Running RCU self tests
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU lockdep checking is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D4 to nr_cpu_ids=3D=
1.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 1=
0 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D1
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] random: get_random_bytes called from start_kernel+0x350/0x57=
0 with crng_init=3D0
[    0.000000] Switching to timer-based delay loop, resolution 41ns
[    0.000023] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every =
89478484971ns
[    0.007847] clocksource: mxc_timer1: mask: 0xffffffff max_cycles: 0xffff=
ffff, max_idle_ns: 79635851949 ns
[    0.021360] Console: colour dummy device 80x30
[    0.023088] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc.,=
 Ingo Molnar
[    0.031763] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.034908] ... MAX_LOCK_DEPTH:          48
[    0.039082] ... MAX_LOCKDEP_KEYS:        8192
[    0.043532] ... CLASSHASH_SIZE:          4096
[    0.047784] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.052216] ... MAX_LOCKDEP_CHAINS:      65536
[    0.056739] ... CHAINHASH_SIZE:          32768
[    0.061095]  memory used by lock dependency info: 4061 kB
[    0.066484]  memory used for stack traces: 2112 kB
[    0.071350]  per task-struct memory footprint: 1536 bytes
[    0.076832] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 48.00 BogoMIPS (lpj=3D240000)
[    0.087133] pid_max: default: 32768 minimum: 301
[    0.092643] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, =
linear)
[    0.099090] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 by=
tes, linear)
[    0.116687] CPU: Testing write buffer coherency: ok
[    0.121675] CPU0: update cpu_capacity 1024
[    0.123195] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.137375] Setting up static identity map for 0x80100000 - 0x80100078
[    0.143540] rcu: Hierarchical SRCU implementation.
[    0.151036] smp: Bringing up secondary CPUs ...
[    0.153042] smp: Brought up 1 node, 1 CPU
[    0.156812] SMP: Total of 1 processors activated (48.00 BogoMIPS).
[    0.163139] CPU: All CPU(s) started in SVC mode.
[    0.175033] devtmpfs: initialized
[    0.261435] VFP support v0.3: implementor 41 architecture 2 part 30 vari=
ant 7 rev 5
[    0.270309] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 19112604462750000 ns
[    0.277744] futex hash table entries: 256 (order: 2, 16384 bytes, linear)
[    0.291069] pinctrl core: initialized pinctrl subsystem
[    0.311238] NET: Registered protocol family 16
[    0.403814] DMA: preallocated 256 KiB pool for atomic coherent allocatio=
ns
[    0.425861] thermal_sys: Registered thermal governor 'step_wise'
[    0.426475] cpuidle: using governor menu
[    1.392555] vdd3p0: supplied by regulator-dummy
[    1.449176] cpu: supplied by regulator-dummy
[    1.505982] vddsoc: supplied by regulator-dummy
[    2.650693] random: fast init done
[    2.847428] No ATAGs?
[    2.848468] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4 watchp=
oint registers.
[    2.855189] hw-breakpoint: maximum watchpoint size is 8 bytes.
[    2.879973] imx6ul-pinctrl 20e0000.pinctrl: initialized IMX pinctrl driv=
er
[    3.354311] mxs-dma 1804000.dma-apbh: initialized
[    3.383607] vgaarb: loaded
[    3.390804] SCSI subsystem initialized
[    3.397679] usbcore: registered new interface driver usbfs
[    3.401103] usbcore: registered new interface driver hub
[    3.406748] usbcore: registered new device driver usb
[    3.423207] i2c i2c-0: IMX I2C adapter registered
[    3.442071] i2c i2c-1: IMX I2C adapter registered
[    3.447952] mc: Linux media interface: v0.10
[    3.449908] videodev: Linux video capture interface: v2.00
[    3.456756] pps_core: LinuxPPS API ver. 1 registered
[    3.460340] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    3.469854] PTP clock support registered
[    3.479174] Advanced Linux Sound Architecture Driver Initialized.
[    3.494302] Bluetooth: Core ver 2.22
[    3.495526] NET: Registered protocol family 31
[    3.499561] Bluetooth: HCI device and connection manager initialized
[    3.506443] Bluetooth: HCI socket layer initialized
[    3.510845] Bluetooth: L2CAP socket layer initialized
[    3.516540] Bluetooth: SCO socket layer initialized
[    3.529473] clocksource: Switched to clocksource mxc_timer1
[    7.164127] VFS: Disk quotas dquot_6.6.0
[    7.165818] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 byt=
es)
[    7.287891] NET: Registered protocol family 2
[    7.296268] tcp_listen_portaddr_hash hash table entries: 256 (order: 1, =
11264 bytes, linear)
[    7.302390] TCP established hash table entries: 4096 (order: 2, 16384 by=
tes, linear)
[    7.310128] TCP bind hash table entries: 4096 (order: 5, 163840 bytes, l=
inear)
[    7.318099] TCP: Hash tables configured (established 4096 bind 4096)
[    7.325842] UDP hash table entries: 256 (order: 2, 24576 bytes, linear)
[    7.330778] UDP-Lite hash table entries: 256 (order: 2, 24576 bytes, lin=
ear)
[    7.338423] NET: Registered protocol family 1
[    7.350914] RPC: Registered named UNIX socket transport module.
[    7.354304] RPC: Registered udp transport module.
[    7.358969] RPC: Registered tcp transport module.
[    7.363933] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    7.375508] PCI: CLS 0 bytes, default 64
[    7.386725] hw perfevents: enabled with armv7_cortex_a7 PMU driver, 5 co=
unters available
[    7.411999] Initialise system trusted keyrings
[    7.416009] workingset: timestamp_bits=3D30 max_order=3D17 bucket_order=
=3D0
[    7.507155] NFS: Registering the id_resolver key type
[    7.510409] Key type id_resolver registered
[    7.513667] Key type id_legacy registered
[    7.518795] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    7.524853] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Regist=
ering...
[    7.532837] jffs2: version 2.2. (NAND) =A9 2001-2006 Red Hat, Inc.
[    7.544270] fuse: init (API version 7.32)
[    7.755072] Key type asymmetric registered
[    7.756777] Asymmetric key parser 'x509' registered
[    7.762464] io scheduler mq-deadline registered
[    7.765824] io scheduler kyber registered
[    7.795980] pwm-backlight backlight: supply power not found, using dummy=
 regulator
[    7.804436] OF: /backlight: #pwm-cells =3D 3 found -1
[    7.806563] of_pwm_get(): can't parse "pwms" property
[    7.812026] pwm-backlight backlight: unable to request PWM
[    7.822929] pwm-backlight: probe of backlight failed with error -22
[    7.876831] imx-sdma 20ec000.sdma: Direct firmware load for imx/sdma/sdm=
a-imx6q.bin failed with error -2
[    7.884231] imx-sdma 20ec000.sdma: Falling back to sysfs fallback for: i=
mx/sdma/sdma-imx6q.bin
[    7.916013] printk: console [ttymxc0] enabled
[    7.916013] printk: console [ttymxc0] enabled
[    7.922351] printk: bootconsole [ec_imx6q0] disabled
[    7.922351] printk: bootconsole [ec_imx6q0] disabled
[    7.952397] 21e8000.serial: ttymxc1 at MMIO 0x21e8000 (irq =3D 68, base_=
baud =3D 5000000) is a IMX
[    7.970794] 21ec000.serial: ttymxc2 at MMIO 0x21ec000 (irq =3D 69, base_=
baud =3D 5000000) is a IMX
[    8.033015] ------------[ cut here ]------------
[    8.037826] WARNING: CPU: 0 PID: 1 at ../drivers/gpu/drm/panel/panel-sim=
ple.c:577 panel_simple_probe+0x5dc/0x6b8
[    8.048370] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.0-test-00006-=
gc24ef7716d4b #1
[    8.056554] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[    8.062858] [<c011055c>] (unwind_backtrace) from [<c010b9fc>] (show_stac=
k+0x10/0x14)
[    8.070708] [<c010b9fc>] (show_stack) from [<c101851c>] (dump_stack+0xdc=
/0x104)
[    8.078120] [<c101851c>] (dump_stack) from [<c0124778>] (__warn+0x100/0x=
114)
[    8.085265] [<c0124778>] (__warn) from [<c0124830>] (warn_slowpath_fmt+0=
xa4/0xb4)
[    8.092843] [<c0124830>] (warn_slowpath_fmt) from [<c0790904>] (panel_si=
mple_probe+0x5dc/0x6b8)
[    8.101639] [<c0790904>] (panel_simple_probe) from [<c07bc1e0>] (platfor=
m_drv_probe+0x6c/0xa4)
[    8.110352] [<c07bc1e0>] (platform_drv_probe) from [<c07ba158>] (really_=
probe+0x200/0x3a8)
[    8.118712] [<c07ba158>] (really_probe) from [<c07ba708>] (driver_probe_=
device+0x58/0xb4)
[    8.126989] [<c07ba708>] (driver_probe_device) from [<c07ba90c>] (device=
_driver_attach+0x58/0x60)
[    8.135949] [<c07ba90c>] (device_driver_attach) from [<c07ba970>] (__dri=
ver_attach+0x5c/0xd4)
[    8.144567] [<c07ba970>] (__driver_attach) from [<c07b860c>] (bus_for_ea=
ch_dev+0x64/0xb4)
[    8.152843] [<c07b860c>] (bus_for_each_dev) from [<c07b8ed0>] (bus_add_d=
river+0x130/0x1d8)
[    8.161201] [<c07b8ed0>] (bus_add_driver) from [<c07bb7a4>] (driver_regi=
ster+0x78/0x110)
[    8.169382] [<c07bb7a4>] (driver_register) from [<c164bfb4>] (panel_simp=
le_init+0x10/0x34)
[    8.177740] [<c164bfb4>] (panel_simple_init) from [<c1601148>] (do_one_i=
nitcall+0x154/0x390)
[    8.186271] [<c1601148>] (do_one_initcall) from [<c160152c>] (kernel_ini=
t_freeable+0x154/0x1d4)
[    8.195061] [<c160152c>] (kernel_init_freeable) from [<c1019e44>] (kerne=
l_init+0x8/0x120)
[    8.203334] [<c1019e44>] (kernel_init) from [<c0100134>] (ret_from_fork+=
0x14/0x20)
[    8.210990] Exception stack(0xc40dbfb0 to 0xc40dbff8)
[    8.216129] bfa0:                                     00000000 00000000 =
00000000 00000000
[    8.224395] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    8.232654] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    8.239774] irq event stamp: 621541
[    8.243390] hardirqs last  enabled at (621549): [<c0194220>] console_unl=
ock+0x4b8/0x61c
[    8.251707] hardirqs last disabled at (621558): [<c0194204>] console_unl=
ock+0x49c/0x61c
[    8.260131] softirqs last  enabled at (621576): [<c0101754>] __do_softir=
q+0x474/0x5c4
[    8.268068] softirqs last disabled at (621567): [<c012d81c>] irq_exit+0x=
1a4/0x1e4
[    8.275888] ---[ end trace e465f1043b41b1a4 ]---
[    8.280787] ------------[ cut here ]------------
[    8.285519] WARNING: CPU: 0 PID: 1 at ../drivers/gpu/drm/panel/panel-sim=
ple.c:580 panel_simple_probe+0x5c0/0x6b8
[    8.295981] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.=
10.0-test-00006-gc24ef7716d4b #1
[    8.305543] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[    8.311831] [<c011055c>] (unwind_backtrace) from [<c010b9fc>] (show_stac=
k+0x10/0x14)
[    8.319679] [<c010b9fc>] (show_stack) from [<c101851c>] (dump_stack+0xdc=
/0x104)
[    8.327086] [<c101851c>] (dump_stack) from [<c0124778>] (__warn+0x100/0x=
114)
[    8.334227] [<c0124778>] (__warn) from [<c0124830>] (warn_slowpath_fmt+0=
xa4/0xb4)
[    8.341805] [<c0124830>] (warn_slowpath_fmt) from [<c07908e8>] (panel_si=
mple_probe+0x5c0/0x6b8)
[    8.350599] [<c07908e8>] (panel_simple_probe) from [<c07bc1e0>] (platfor=
m_drv_probe+0x6c/0xa4)
[    8.359307] [<c07bc1e0>] (platform_drv_probe) from [<c07ba158>] (really_=
probe+0x200/0x3a8)
[    8.367669] [<c07ba158>] (really_probe) from [<c07ba708>] (driver_probe_=
device+0x58/0xb4)
[    8.375936] [<c07ba708>] (driver_probe_device) from [<c07ba90c>] (device=
_driver_attach+0x58/0x60)
[    8.384899] [<c07ba90c>] (device_driver_attach) from [<c07ba970>] (__dri=
ver_attach+0x5c/0xd4)
[    8.393517] [<c07ba970>] (__driver_attach) from [<c07b860c>] (bus_for_ea=
ch_dev+0x64/0xb4)
[    8.401787] [<c07b860c>] (bus_for_each_dev) from [<c07b8ed0>] (bus_add_d=
river+0x130/0x1d8)
[    8.410142] [<c07b8ed0>] (bus_add_driver) from [<c07bb7a4>] (driver_regi=
ster+0x78/0x110)
[    8.418323] [<c07bb7a4>] (driver_register) from [<c164bfb4>] (panel_simp=
le_init+0x10/0x34)
[    8.426678] [<c164bfb4>] (panel_simple_init) from [<c1601148>] (do_one_i=
nitcall+0x154/0x390)
[    8.435207] [<c1601148>] (do_one_initcall) from [<c160152c>] (kernel_ini=
t_freeable+0x154/0x1d4)
[    8.443996] [<c160152c>] (kernel_init_freeable) from [<c1019e44>] (kerne=
l_init+0x8/0x120)
[    8.452265] [<c1019e44>] (kernel_init) from [<c0100134>] (ret_from_fork+=
0x14/0x20)
[    8.459917] Exception stack(0xc40dbfb0 to 0xc40dbff8)
[    8.465051] bfa0:                                     00000000 00000000 =
00000000 00000000
[    8.473318] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    8.481577] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    8.488470] irq event stamp: 621633
[    8.492258] hardirqs last  enabled at (621643): [<c0194220>] console_unl=
ock+0x4b8/0x61c
[    8.500548] hardirqs last disabled at (621652): [<c0194204>] console_unl=
ock+0x49c/0x61c
[    8.508658] softirqs last  enabled at (621576): [<c0101754>] __do_softir=
q+0x474/0x5c4
[    8.516772] softirqs last disabled at (621567): [<c012d81c>] irq_exit+0x=
1a4/0x1e4
[    8.524521] ---[ end trace e465f1043b41b1a5 ]---
[    8.555193] mxsfb 21c8000.lcdif: Cannot connect bridge: -517
[    8.706637] brd: module loaded
[    8.825662] loop: module loaded
[    8.846104] imx6ul-pinctrl 20e0000.pinctrl: pin MX6UL_PAD_NAND_CE0_B alr=
eady requested by regulator-gpio; cannot claim for 1806000.nand-controller
[    8.859641] imx6ul-pinctrl 20e0000.pinctrl: pin-107 (1806000.nand-contro=
ller) status -22
[    8.867851] imx6ul-pinctrl 20e0000.pinctrl: could not request pin 107 (M=
X6UL_PAD_NAND_CE0_B) from group gpminandgrp  on device 20e0000.pinctrl
[    8.880930] gpmi-nand 1806000.nand-controller: Error applying setting, r=
everse things back
[    8.889726] gpmi-nand: probe of 1806000.nand-controller failed with erro=
r -22
[    8.917681] libphy: Fixed MDIO Bus: probed
[    8.928368] CAN device driver interface
[    8.962525] pps pps0: new PPS source ptp0
[    9.026335] libphy: fec_enet_mii_bus: probed
[    9.036164] fec 20b4000.ethernet eth0: registered PHC device 0
[    9.051151] pps pps1: new PPS source ptp1
[    9.068656] libphy: fec_enet_mii_bus: probed
[    9.089867] fec 2188000.ethernet eth1: registered PHC device 1
[    9.109051] pegasus: v0.9.3 (2013/04/25), Pegasus/Pegasus II USB Etherne=
t driver
[    9.117210] usbcore: registered new interface driver pegasus
[    9.123968] usbcore: registered new interface driver rtl8150
[    9.130333] usbcore: registered new interface driver r8152
[    9.136273] usbcore: registered new interface driver lan78xx
[    9.142645] usbcore: registered new interface driver asix
[    9.148502] usbcore: registered new interface driver ax88179_178a
[    9.155443] usbcore: registered new interface driver cdc_ether
[    9.162529] usbcore: registered new interface driver cdc_eem
[    9.168667] usbcore: registered new interface driver smsc95xx
[    9.175103] usbcore: registered new interface driver net1080
[    9.181434] usbcore: registered new interface driver cdc_subset
[    9.187846] usbcore: registered new interface driver zaurus
[    9.194079] usbcore: registered new interface driver MOSCHIP usb-etherne=
t driver
[    9.202160] usbcore: registered new interface driver cdc_ncm
[    9.207918] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    9.214727] ehci-pci: EHCI PCI platform driver
[    9.220259] ehci-mxc: Freescale On-Chip EHCI Host driver
[    9.228695] usbcore: registered new interface driver cdc_acm
[    9.234708] cdc_acm: USB Abstract Control Model driver for USB modems an=
d ISDN adapters
[    9.243445] usbcore: registered new interface driver usb-storage
[    9.250559] usbcore: registered new interface driver usbserial_generic
[    9.258331] usbserial: USB Serial support registered for generic
[    9.265294] usbcore: registered new interface driver ftdi_sio
[    9.271636] usbserial: USB Serial support registered for FTDI USB Serial=
 Device
[    9.279599] usbcore: registered new interface driver option
[    9.285539] usbserial: USB Serial support registered for GSM modem (1-po=
rt)
[    9.293196] usbcore: registered new interface driver usbtest
[    9.299564] usbcore: registered new interface driver usb_ehset_test
[    9.325952] udc-core: couldn't find an available UDC - added [zero] to l=
ist of pending drivers
[    9.335587] udc-core: couldn't find an available UDC - added [g_audio] t=
o list of pending drivers
[    9.344884] udc-core: couldn't find an available UDC - added [g_ether] t=
o list of pending drivers
[    9.354088] gadgetfs: USB Gadget filesystem, version 24 Aug 2004
[    9.361116] file system registered
[    9.364948] udc-core: couldn't find an available UDC - added [g_mass_sto=
rage] to list of pending drivers
[    9.374795] udc-core: couldn't find an available UDC - added [g_serial] =
to list of pending drivers
[    9.384064] udc-core: couldn't find an available UDC - added [g_ncm] to =
list of pending drivers
[    9.416809] edt_ft5x06 1-0038: supply vcc not found, using dummy regulat=
or
[    9.495351] rtc-ds1307 1-0068: registered as rtc0
[    9.505051] input: generic ft5x06 (79) as /devices/platform/soc/2100000.=
bus/21a4000.i2c/i2c-1/1-0038/input/input0
[    9.521207] rtc-ds1307 1-0068: setting system clock to 2021-01-16T12:30:=
39 UTC (1610800239)
[    9.551561] i2c /dev entries driver
[    9.589585] usbcore: registered new interface driver uvcvideo
[    9.595449] USB Video Class driver (1.1.1)
[    9.599834] gspca_main: v2.14.0 registered
[    9.635967] Bluetooth: HCI UART driver ver 2.3
[    9.640803] Bluetooth: HCI UART protocol H4 registered
[    9.646340] Bluetooth: HCI UART protocol LL registered
[    9.662712] sdhci: Secure Digital Host Controller Interface driver
[    9.669009] sdhci: Copyright(c) Pierre Ossman
[    9.673868] sdhci-pltfm: SDHCI platform and OF driver helper
[    9.722618] caam 2140000.crypto: Entropy delay =3D 3200
[    9.788611] caam 2140000.crypto: Instantiated RNG4 SH0
[    9.849356] caam 2140000.crypto: Instantiated RNG4 SH1
[    9.855265] caam 2140000.crypto: device ID =3D 0x0a16030000000000 (Era 8)
[    9.862294] caam 2140000.crypto: job rings =3D 3, qi =3D 0
[    9.903916] mmc0: SDHCI controller on 2190000.mmc [2190000.mmc] using AD=
MA
[    9.967220] mmc0: host does not support reading read-only switch, assumi=
ng write-enable
[    9.991438] mmc0: new high speed SDHC card at address aaaa
[   10.023447] mmcblk0: mmc0:aaaa SC16G 14.8 GiB =

[   10.083463] caam algorithms registered in /proc/crypto
[   10.132831] caam 2140000.crypto: caam pkc algorithms registered in /proc=
/crypto
[   10.141949] caam 2140000.crypto: registering rng-caam
[   10.168853] usbcore: registered new interface driver usbhid
[   10.175089] usbhid: USB HID core driver
[   10.237153] usbcore: registered new interface driver snd-usb-audio
[   10.260575] asoc-simple-card: probe of sound failed with error -22
[   10.316426] NET: Registered protocol family 10
[   10.332689] random: crng init done
[   10.341742] Segment Routing with IPv6
[   10.345950] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[   10.360866] NET: Registered protocol family 17
[   10.365577] can: controller area network core
[   10.371385] NET: Registered protocol family 29
[   10.375981] can: raw protocol
[   10.379843] can: broadcast manager protocol
[   10.384472] can: netlink gateway - max_hops=3D1
[   10.390383] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   10.396279] Bluetooth: BNEP socket layer initialized
[   10.402164] Key type dns_resolver registered
[   10.445667] Registering SWP/SWPB emulation handler
[   10.452270] Loading compiled-in X.509 certificates
[   10.812158] ------------[ cut here ]------------
[   10.817337] WARNING: CPU: 0 PID: 58 at ../drivers/gpu/drm/panel/panel-si=
mple.c:577 panel_simple_probe+0x5dc/0x6b8
[   10.827903] CPU: 0 PID: 58 Comm: kworker/0:2 Tainted: G        W        =
 5.10.0-test-00006-gc24ef7716d4b #1
[   10.837712] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[   10.843970] Workqueue: events deferred_probe_work_func
[   10.849237] [<c011055c>] (unwind_backtrace) from [<c010b9fc>] (show_stac=
k+0x10/0x14)
[   10.857062] [<c010b9fc>] (show_stack) from [<c101851c>] (dump_stack+0xdc=
/0x104)
[   10.864448] [<c101851c>] (dump_stack) from [<c0124778>] (__warn+0x100/0x=
114)
[   10.871568] [<c0124778>] (__warn) from [<c0124830>] (warn_slowpath_fmt+0=
xa4/0xb4)
[   10.879126] [<c0124830>] (warn_slowpath_fmt) from [<c0790904>] (panel_si=
mple_probe+0x5dc/0x6b8)
[   10.887895] [<c0790904>] (panel_simple_probe) from [<c07bc1e0>] (platfor=
m_drv_probe+0x6c/0xa4)
[   10.896582] [<c07bc1e0>] (platform_drv_probe) from [<c07ba158>] (really_=
probe+0x200/0x3a8)
[   10.904922] [<c07ba158>] (really_probe) from [<c07ba708>] (driver_probe_=
device+0x58/0xb4)
[   10.913175] [<c07ba708>] (driver_probe_device) from [<c07b8ac4>] (bus_fo=
r_each_drv+0x70/0xb8)
[   10.921774] [<c07b8ac4>] (bus_for_each_drv) from [<c07ba500>] (__device_=
attach+0xdc/0x150)
[   10.930110] [<c07ba500>] (__device_attach) from [<c07b8c9c>] (bus_probe_=
device+0x88/0x90)
[   10.938357] [<c07b8c9c>] (bus_probe_device) from [<c07b98e0>] (deferred_=
probe_work_func+0x68/0x98)
[   10.947392] [<c07b98e0>] (deferred_probe_work_func) from [<c0145b84>] (p=
rocess_one_work+0x21c/0x7f8)
[   10.956600] [<c0145b84>] (process_one_work) from [<c0146194>] (worker_th=
read+0x34/0x568)
[   10.964762] [<c0146194>] (worker_thread) from [<c014d738>] (kthread+0x12=
4/0x160)
[   10.972231] [<c014d738>] (kthread) from [<c0100134>] (ret_from_fork+0x14=
/0x20)
[   10.979512] Exception stack(0xc447bfb0 to 0xc447bff8)
[   10.984629] bfa0:                                     00000000 00000000 =
00000000 00000000
[   10.992875] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   11.001121] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   11.008062] irq event stamp: 3805
[   11.011633] hardirqs last  enabled at (3815): [<c0194220>] console_unloc=
k+0x4b8/0x61c
[   11.019694] hardirqs last disabled at (3824): [<c0194204>] console_unloc=
k+0x49c/0x61c
[   11.027616] softirqs last  enabled at (3804): [<c0101754>] __do_softirq+=
0x474/0x5c4
[   11.035508] softirqs last disabled at (3793): [<c012d81c>] irq_exit+0x1a=
4/0x1e4
[   11.043042] ---[ end trace e465f1043b41b1a7 ]---
[   11.047731] ------------[ cut here ]------------
[   11.052585] WARNING: CPU: 0 PID: 58 at ../drivers/gpu/drm/panel/panel-si=
mple.c:580 panel_simple_probe+0x5c0/0x6b8
[   11.063070] CPU: 0 PID: 58 Comm: kworker/0:2 Tainted: G        W        =
 5.10.0-test-00006-gc24ef7716d4b #1
[   11.072872] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[   11.079129] Workqueue: events deferred_probe_work_func
[   11.084389] [<c011055c>] (unwind_backtrace) from [<c010b9fc>] (show_stac=
k+0x10/0x14)
[   11.092212] [<c010b9fc>] (show_stack) from [<c101851c>] (dump_stack+0xdc=
/0x104)
[   11.099596] [<c101851c>] (dump_stack) from [<c0124778>] (__warn+0x100/0x=
114)
[   11.106716] [<c0124778>] (__warn) from [<c0124830>] (warn_slowpath_fmt+0=
xa4/0xb4)
[   11.114268] [<c0124830>] (warn_slowpath_fmt) from [<c07908e8>] (panel_si=
mple_probe+0x5c0/0x6b8)
[   11.123040] [<c07908e8>] (panel_simple_probe) from [<c07bc1e0>] (platfor=
m_drv_probe+0x6c/0xa4)
[   11.131724] [<c07bc1e0>] (platform_drv_probe) from [<c07ba158>] (really_=
probe+0x200/0x3a8)
[   11.140059] [<c07ba158>] (really_probe) from [<c07ba708>] (driver_probe_=
device+0x58/0xb4)
[   11.148310] [<c07ba708>] (driver_probe_device) from [<c07b8ac4>] (bus_fo=
r_each_drv+0x70/0xb8)
[   11.156911] [<c07b8ac4>] (bus_for_each_drv) from [<c07ba500>] (__device_=
attach+0xdc/0x150)
[   11.165248] [<c07ba500>] (__device_attach) from [<c07b8c9c>] (bus_probe_=
device+0x88/0x90)
[   11.173500] [<c07b8c9c>] (bus_probe_device) from [<c07b98e0>] (deferred_=
probe_work_func+0x68/0x98)
[   11.182534] [<c07b98e0>] (deferred_probe_work_func) from [<c0145b84>] (p=
rocess_one_work+0x21c/0x7f8)
[   11.191742] [<c0145b84>] (process_one_work) from [<c0146194>] (worker_th=
read+0x34/0x568)
[   11.199905] [<c0146194>] (worker_thread) from [<c014d738>] (kthread+0x12=
4/0x160)
[   11.207368] [<c014d738>] (kthread) from [<c0100134>] (ret_from_fork+0x14=
/0x20)
[   11.214650] Exception stack(0xc447bfb0 to 0xc447bff8)
[   11.219765] bfa0:                                     00000000 00000000 =
00000000 00000000
[   11.228007] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   11.236247] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   11.243904] irq event stamp: 3907
[   11.247341] hardirqs last  enabled at (3915): [<c0194220>] console_unloc=
k+0x4b8/0x61c
[   11.255474] hardirqs last disabled at (3924): [<c0194204>] console_unloc=
k+0x49c/0x61c
[   11.263560] softirqs last  enabled at (3906): [<c0101754>] __do_softirq+=
0x474/0x5c4
[   11.271460] softirqs last disabled at (3885): [<c012d81c>] irq_exit+0x1a=
4/0x1e4
[   11.278844] ---[ end trace e465f1043b41b1a8 ]---
[   11.302291] mxsfb 21c8000.lcdif: Cannot connect bridge: -517
[   11.326811] ci_hdrc ci_hdrc.0: EHCI Host Controller
[   11.334665] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus numb=
er 1
[   11.374141] ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
[   11.390686] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.10
[   11.400588] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[   11.408402] usb usb1: Product: EHCI Host Controller
[   11.413953] usb usb1: Manufacturer: Linux 5.10.0-test-00006-gc24ef7716d4=
b ehci_hcd
[   11.422140] usb usb1: SerialNumber: ci_hdrc.0
[   11.457684] hub 1-0:1.0: USB hub found
[   11.464445] hub 1-0:1.0: 1 port detected
[   11.528228] ci_hdrc ci_hdrc.1: EHCI Host Controller
[   11.533665] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus numb=
er 2
[   11.574798] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[   11.585841] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.10
[   11.596217] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[   11.604190] usb usb2: Product: EHCI Host Controller
[   11.609675] usb usb2: Manufacturer: Linux 5.10.0-test-00006-gc24ef7716d4=
b ehci_hcd
[   11.617474] usb usb2: SerialNumber: ci_hdrc.1
[   11.637873] hub 2-0:1.0: USB hub found
[   11.643943] hub 2-0:1.0: 1 port detected
[   11.692929] imx_thermal 20c8000.anatop:tempmon: Industrial CPU temperatu=
re grade - max:105C critical:100C passive:95C
[   11.724794] ------------[ cut here ]------------
[   11.729848] WARNING: CPU: 0 PID: 58 at ../drivers/gpu/drm/panel/panel-si=
mple.c:577 panel_simple_probe+0x5dc/0x6b8
[   11.740382] CPU: 0 PID: 58 Comm: kworker/0:2 Tainted: G        W        =
 5.10.0-test-00006-gc24ef7716d4b #1
[   11.750191] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[   11.756449] Workqueue: events deferred_probe_work_func
[   11.761722] [<c011055c>] (unwind_backtrace) from [<c010b9fc>] (show_stac=
k+0x10/0x14)
[   11.769549] [<c010b9fc>] (show_stack) from [<c101851c>] (dump_stack+0xdc=
/0x104)
[   11.776938] [<c101851c>] (dump_stack) from [<c0124778>] (__warn+0x100/0x=
114)
[   11.784060] [<c0124778>] (__warn) from [<c0124830>] (warn_slowpath_fmt+0=
xa4/0xb4)
[   11.791612] [<c0124830>] (warn_slowpath_fmt) from [<c0790904>] (panel_si=
mple_probe+0x5dc/0x6b8)
[   11.800384] [<c0790904>] (panel_simple_probe) from [<c07bc1e0>] (platfor=
m_drv_probe+0x6c/0xa4)
[   11.809070] [<c07bc1e0>] (platform_drv_probe) from [<c07ba158>] (really_=
probe+0x200/0x3a8)
[   11.817410] [<c07ba158>] (really_probe) from [<c07ba708>] (driver_probe_=
device+0x58/0xb4)
[   11.825658] [<c07ba708>] (driver_probe_device) from [<c07b8ac4>] (bus_fo=
r_each_drv+0x70/0xb8)
[   11.834256] [<c07b8ac4>] (bus_for_each_drv) from [<c07ba500>] (__device_=
attach+0xdc/0x150)
[   11.842592] [<c07ba500>] (__device_attach) from [<c07b8c9c>] (bus_probe_=
device+0x88/0x90)
[   11.850843] [<c07b8c9c>] (bus_probe_device) from [<c07b98e0>] (deferred_=
probe_work_func+0x68/0x98)
[   11.859876] [<c07b98e0>] (deferred_probe_work_func) from [<c0145b84>] (p=
rocess_one_work+0x21c/0x7f8)
[   11.869085] [<c0145b84>] (process_one_work) from [<c0146194>] (worker_th=
read+0x34/0x568)
[   11.877249] [<c0146194>] (worker_thread) from [<c014d738>] (kthread+0x12=
4/0x160)
[   11.884718] [<c014d738>] (kthread) from [<c0100134>] (ret_from_fork+0x14=
/0x20)
[   11.892002] Exception stack(0xc447bfb0 to 0xc447bff8)
[   11.897117] bfa0:                                     00000000 00000000 =
00000000 00000000
[   11.905360] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   11.913602] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   11.920591] irq event stamp: 11963
[   11.924100] hardirqs last  enabled at (11971): [<c0194220>] console_unlo=
ck+0x4b8/0x61c
[   11.932274] hardirqs last disabled at (11980): [<c0194204>] console_unlo=
ck+0x49c/0x61c
[   11.940425] softirqs last  enabled at (11962): [<c0101754>] __do_softirq=
+0x474/0x5c4
[   11.948256] softirqs last disabled at (11953): [<c012d81c>] irq_exit+0x1=
a4/0x1e4
[   11.955880] ---[ end trace e465f1043b41b1a9 ]---
[   11.960703] ------------[ cut here ]------------
[   11.965405] WARNING: CPU: 0 PID: 58 at ../drivers/gpu/drm/panel/panel-si=
mple.c:580 panel_simple_probe+0x5c0/0x6b8
[   11.975892] CPU: 0 PID: 58 Comm: kworker/0:2 Tainted: G        W        =
 5.10.0-test-00006-gc24ef7716d4b #1
[   11.985693] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[   11.991948] Workqueue: events deferred_probe_work_func
[   11.997207] [<c011055c>] (unwind_backtrace) from [<c010b9fc>] (show_stac=
k+0x10/0x14)
[   12.005030] [<c010b9fc>] (show_stack) from [<c101851c>] (dump_stack+0xdc=
/0x104)
[   12.012415] [<c101851c>] (dump_stack) from [<c0124778>] (__warn+0x100/0x=
114)
[   12.019535] [<c0124778>] (__warn) from [<c0124830>] (warn_slowpath_fmt+0=
xa4/0xb4)
[   12.027089] [<c0124830>] (warn_slowpath_fmt) from [<c07908e8>] (panel_si=
mple_probe+0x5c0/0x6b8)
[   12.035858] [<c07908e8>] (panel_simple_probe) from [<c07bc1e0>] (platfor=
m_drv_probe+0x6c/0xa4)
[   12.044544] [<c07bc1e0>] (platform_drv_probe) from [<c07ba158>] (really_=
probe+0x200/0x3a8)
[   12.052886] [<c07ba158>] (really_probe) from [<c07ba708>] (driver_probe_=
device+0x58/0xb4)
[   12.061136] [<c07ba708>] (driver_probe_device) from [<c07b8ac4>] (bus_fo=
r_each_drv+0x70/0xb8)
[   12.069732] [<c07b8ac4>] (bus_for_each_drv) from [<c07ba500>] (__device_=
attach+0xdc/0x150)
[   12.078067] [<c07ba500>] (__device_attach) from [<c07b8c9c>] (bus_probe_=
device+0x88/0x90)
[   12.086320] [<c07b8c9c>] (bus_probe_device) from [<c07b98e0>] (deferred_=
probe_work_func+0x68/0x98)
[   12.095352] [<c07b98e0>] (deferred_probe_work_func) from [<c0145b84>] (p=
rocess_one_work+0x21c/0x7f8)
[   12.104557] [<c0145b84>] (process_one_work) from [<c0146194>] (worker_th=
read+0x34/0x568)
[   12.112719] [<c0146194>] (worker_thread) from [<c014d738>] (kthread+0x12=
4/0x160)
[   12.120184] [<c014d738>] (kthread) from [<c0100134>] (ret_from_fork+0x14=
/0x20)
[   12.127465] Exception stack(0xc447bfb0 to 0xc447bff8)
[   12.132579] bfa0:                                     00000000 00000000 =
00000000 00000000
[   12.140821] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   12.149061] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   12.155901] irq event stamp: 12041
[   12.159533] hardirqs last  enabled at (12051): [<c0194220>] console_unlo=
ck+0x4b8/0x61c
[   12.167536] hardirqs last disabled at (12058): [<c0194204>] console_unlo=
ck+0x49c/0x61c
[   12.175682] softirqs last  enabled at (11962): [<c0101754>] __do_softirq=
+0x474/0x5c4
[   12.183652] softirqs last disabled at (11953): [<c012d81c>] irq_exit+0x1=
a4/0x1e4
[   12.191263] ---[ end trace e465f1043b41b1aa ]---
[   12.215142] mxsfb 21c8000.lcdif: Cannot connect bridge: -517
[   12.231222] ------------[ cut here ]------------
[   12.235967] WARNING: CPU: 0 PID: 58 at ../drivers/gpu/drm/panel/panel-si=
mple.c:577 panel_simple_probe+0x5dc/0x6b8
[   12.246650] CPU: 0 PID: 58 Comm: kworker/0:2 Tainted: G        W        =
 5.10.0-test-00006-gc24ef7716d4b #1
[   12.256462] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[   12.262719] Workqueue: events deferred_probe_work_func
[   12.267997] [<c011055c>] (unwind_backtrace) from [<c010b9fc>] (show_stac=
k+0x10/0x14)
[   12.275822] [<c010b9fc>] (show_stack) from [<c101851c>] (dump_stack+0xdc=
/0x104)
[   12.283211] [<c101851c>] (dump_stack) from [<c0124778>] (__warn+0x100/0x=
114)
[   12.290333] [<c0124778>] (__warn) from [<c0124830>] (warn_slowpath_fmt+0=
xa4/0xb4)
[   12.297890] [<c0124830>] (warn_slowpath_fmt) from [<c0790904>] (panel_si=
mple_probe+0x5dc/0x6b8)
[   12.306663] [<c0790904>] (panel_simple_probe) from [<c07bc1e0>] (platfor=
m_drv_probe+0x6c/0xa4)
[   12.315350] [<c07bc1e0>] (platform_drv_probe) from [<c07ba158>] (really_=
probe+0x200/0x3a8)
[   12.323691] [<c07ba158>] (really_probe) from [<c07ba708>] (driver_probe_=
device+0x58/0xb4)
[   12.331948] [<c07ba708>] (driver_probe_device) from [<c07b8ac4>] (bus_fo=
r_each_drv+0x70/0xb8)
[   12.340549] [<c07b8ac4>] (bus_for_each_drv) from [<c07ba500>] (__device_=
attach+0xdc/0x150)
[   12.348885] [<c07ba500>] (__device_attach) from [<c07b8c9c>] (bus_probe_=
device+0x88/0x90)
[   12.357138] [<c07b8c9c>] (bus_probe_device) from [<c07b98e0>] (deferred_=
probe_work_func+0x68/0x98)
[   12.366170] [<c07b98e0>] (deferred_probe_work_func) from [<c0145b84>] (p=
rocess_one_work+0x21c/0x7f8)
[   12.375381] [<c0145b84>] (process_one_work) from [<c01463c8>] (worker_th=
read+0x268/0x568)
[   12.383629] [<c01463c8>] (worker_thread) from [<c014d738>] (kthread+0x12=
4/0x160)
[   12.391097] [<c014d738>] (kthread) from [<c0100134>] (ret_from_fork+0x14=
/0x20)
[   12.398379] Exception stack(0xc447bfb0 to 0xc447bff8)
[   12.403498] bfa0:                                     00000000 00000000 =
00000000 00000000
[   12.411744] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   12.419984] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   12.427042] irq event stamp: 14841
[   12.430698] hardirqs last  enabled at (14851): [<c0194220>] console_unlo=
ck+0x4b8/0x61c
[   12.438702] hardirqs last disabled at (14858): [<c0194204>] console_unlo=
ck+0x49c/0x61c
[   12.446867] softirqs last  enabled at (14840): [<c0101754>] __do_softirq=
+0x474/0x5c4
[   12.454849] softirqs last disabled at (14825): [<c012d81c>] irq_exit+0x1=
a4/0x1e4
[   12.462464] ---[ end trace e465f1043b41b1ab ]---
[   12.467153] ------------[ cut here ]------------
[   12.471998] WARNING: CPU: 0 PID: 58 at ../drivers/gpu/drm/panel/panel-si=
mple.c:580 panel_simple_probe+0x5c0/0x6b8
[   12.482490] CPU: 0 PID: 58 Comm: kworker/0:2 Tainted: G        W        =
 5.10.0-test-00006-gc24ef7716d4b #1
[   12.492292] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[   12.498546] Workqueue: events deferred_probe_work_func
[   12.503809] [<c011055c>] (unwind_backtrace) from [<c010b9fc>] (show_stac=
k+0x10/0x14)
[   12.511633] [<c010b9fc>] (show_stack) from [<c101851c>] (dump_stack+0xdc=
/0x104)
[   12.519017] [<c101851c>] (dump_stack) from [<c0124778>] (__warn+0x100/0x=
114)
[   12.526138] [<c0124778>] (__warn) from [<c0124830>] (warn_slowpath_fmt+0=
xa4/0xb4)
[   12.533693] [<c0124830>] (warn_slowpath_fmt) from [<c07908e8>] (panel_si=
mple_probe+0x5c0/0x6b8)
[   12.542462] [<c07908e8>] (panel_simple_probe) from [<c07bc1e0>] (platfor=
m_drv_probe+0x6c/0xa4)
[   12.551146] [<c07bc1e0>] (platform_drv_probe) from [<c07ba158>] (really_=
probe+0x200/0x3a8)
[   12.559481] [<c07ba158>] (really_probe) from [<c07ba708>] (driver_probe_=
device+0x58/0xb4)
[   12.567730] [<c07ba708>] (driver_probe_device) from [<c07b8ac4>] (bus_fo=
r_each_drv+0x70/0xb8)
[   12.576330] [<c07b8ac4>] (bus_for_each_drv) from [<c07ba500>] (__device_=
attach+0xdc/0x150)
[   12.584666] [<c07ba500>] (__device_attach) from [<c07b8c9c>] (bus_probe_=
device+0x88/0x90)
[   12.592914] [<c07b8c9c>] (bus_probe_device) from [<c07b98e0>] (deferred_=
probe_work_func+0x68/0x98)
[   12.601948] [<c07b98e0>] (deferred_probe_work_func) from [<c0145b84>] (p=
rocess_one_work+0x21c/0x7f8)
[   12.611155] [<c0145b84>] (process_one_work) from [<c01463c8>] (worker_th=
read+0x268/0x568)
[   12.619405] [<c01463c8>] (worker_thread) from [<c014d738>] (kthread+0x12=
4/0x160)
[   12.626872] [<c014d738>] (kthread) from [<c0100134>] (ret_from_fork+0x14=
/0x20)
[   12.634153] Exception stack(0xc447bfb0 to 0xc447bff8)
[   12.639268] bfa0:                                     00000000 00000000 =
00000000 00000000
[   12.647509] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   12.655749] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   12.662714] irq event stamp: 14933
[   12.666213] hardirqs last  enabled at (14941): [<c0194220>] console_unlo=
ck+0x4b8/0x61c
[   12.674380] hardirqs last disabled at (14950): [<c0194204>] console_unlo=
ck+0x49c/0x61c
[   12.682539] softirqs last  enabled at (14932): [<c0101754>] __do_softirq=
+0x474/0x5c4
[   12.690504] softirqs last disabled at (14921): [<c012d81c>] irq_exit+0x1=
a4/0x1e4
[   12.697971] ---[ end trace e465f1043b41b1ac ]---
[   12.715359] mxsfb 21c8000.lcdif: Cannot connect bridge: -517
[   12.733465] input: gpio-keys as /devices/platform/gpio-keys/input/input1
[   12.752300] ------------[ cut here ]------------
[   12.757039] WARNING: CPU: 0 PID: 58 at ../drivers/gpu/drm/panel/panel-si=
mple.c:577 panel_simple_probe+0x5dc/0x6b8
[   12.767865] CPU: 0 PID: 58 Comm: kworker/0:2 Tainted: G        W        =
 5.10.0-test-00006-gc24ef7716d4b #1
[   12.777677] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[   12.783938] Workqueue: events deferred_probe_work_func
[   12.789215] [<c011055c>] (unwind_backtrace) from [<c010b9fc>] (show_stac=
k+0x10/0x14)
[   12.797045] [<c010b9fc>] (show_stack) from [<c101851c>] (dump_stack+0xdc=
/0x104)
[   12.804434] [<c101851c>] (dump_stack) from [<c0124778>] (__warn+0x100/0x=
114)
[   12.811558] [<c0124778>] (__warn) from [<c0124830>] (warn_slowpath_fmt+0=
xa4/0xb4)
[   12.819115] [<c0124830>] (warn_slowpath_fmt) from [<c0790904>] (panel_si=
mple_probe+0x5dc/0x6b8)
[   12.827891] [<c0790904>] (panel_simple_probe) from [<c07bc1e0>] (platfor=
m_drv_probe+0x6c/0xa4)
[   12.836578] [<c07bc1e0>] (platform_drv_probe) from [<c07ba158>] (really_=
probe+0x200/0x3a8)
[   12.844916] [<c07ba158>] (really_probe) from [<c07ba708>] (driver_probe_=
device+0x58/0xb4)
[   12.853168] [<c07ba708>] (driver_probe_device) from [<c07b8ac4>] (bus_fo=
r_each_drv+0x70/0xb8)
[   12.861766] [<c07b8ac4>] (bus_for_each_drv) from [<c07ba500>] (__device_=
attach+0xdc/0x150)
[   12.870104] [<c07ba500>] (__device_attach) from [<c07b8c9c>] (bus_probe_=
device+0x88/0x90)
[   12.878353] [<c07b8c9c>] (bus_probe_device) from [<c07b98e0>] (deferred_=
probe_work_func+0x68/0x98)
[   12.887385] [<c07b98e0>] (deferred_probe_work_func) from [<c0145b84>] (p=
rocess_one_work+0x21c/0x7f8)
[   12.896593] [<c0145b84>] (process_one_work) from [<c0146194>] (worker_th=
read+0x34/0x568)
[   12.904757] [<c0146194>] (worker_thread) from [<c014d738>] (kthread+0x12=
4/0x160)
[   12.912225] [<c014d738>] (kthread) from [<c0100134>] (ret_from_fork+0x14=
/0x20)
[   12.919509] Exception stack(0xc447bfb0 to 0xc447bff8)
[   12.924624] bfa0:                                     00000000 00000000 =
00000000 00000000
[   12.932871] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   12.941112] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   12.948065] irq event stamp: 17823
[   12.951732] hardirqs last  enabled at (17833): [<c0194220>] console_unlo=
ck+0x4b8/0x61c
[   12.959887] hardirqs last disabled at (17842): [<c0194204>] console_unlo=
ck+0x49c/0x61c
[   12.967890] softirqs last  enabled at (17822): [<c0101754>] __do_softirq=
+0x474/0x5c4
[   12.975868] softirqs last disabled at (17811): [<c012d81c>] irq_exit+0x1=
a4/0x1e4
[   12.983491] ---[ end trace e465f1043b41b1ad ]---
[   12.988186] ------------[ cut here ]------------
[   12.993034] WARNING: CPU: 0 PID: 58 at ../drivers/gpu/drm/panel/panel-si=
mple.c:580 panel_simple_probe+0x5c0/0x6b8
[   13.003529] CPU: 0 PID: 58 Comm: kworker/0:2 Tainted: G        W        =
 5.10.0-test-00006-gc24ef7716d4b #1
[   13.013333] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[   13.019586] Workqueue: events deferred_probe_work_func
[   13.024845] [<c011055c>] (unwind_backtrace) from [<c010b9fc>] (show_stac=
k+0x10/0x14)
[   13.032666] [<c010b9fc>] (show_stack) from [<c101851c>] (dump_stack+0xdc=
/0x104)
[   13.040052] [<c101851c>] (dump_stack) from [<c0124778>] (__warn+0x100/0x=
114)
[   13.047173] [<c0124778>] (__warn) from [<c0124830>] (warn_slowpath_fmt+0=
xa4/0xb4)
[   13.054726] [<c0124830>] (warn_slowpath_fmt) from [<c07908e8>] (panel_si=
mple_probe+0x5c0/0x6b8)
[   13.063495] [<c07908e8>] (panel_simple_probe) from [<c07bc1e0>] (platfor=
m_drv_probe+0x6c/0xa4)
[   13.072183] [<c07bc1e0>] (platform_drv_probe) from [<c07ba158>] (really_=
probe+0x200/0x3a8)
[   13.080519] [<c07ba158>] (really_probe) from [<c07ba708>] (driver_probe_=
device+0x58/0xb4)
[   13.088769] [<c07ba708>] (driver_probe_device) from [<c07b8ac4>] (bus_fo=
r_each_drv+0x70/0xb8)
[   13.097365] [<c07b8ac4>] (bus_for_each_drv) from [<c07ba500>] (__device_=
attach+0xdc/0x150)
[   13.105701] [<c07ba500>] (__device_attach) from [<c07b8c9c>] (bus_probe_=
device+0x88/0x90)
[   13.113953] [<c07b8c9c>] (bus_probe_device) from [<c07b98e0>] (deferred_=
probe_work_func+0x68/0x98)
[   13.122984] [<c07b98e0>] (deferred_probe_work_func) from [<c0145b84>] (p=
rocess_one_work+0x21c/0x7f8)
[   13.132192] [<c0145b84>] (process_one_work) from [<c0146194>] (worker_th=
read+0x34/0x568)
[   13.140351] [<c0146194>] (worker_thread) from [<c014d738>] (kthread+0x12=
4/0x160)
[   13.147817] [<c014d738>] (kthread) from [<c0100134>] (ret_from_fork+0x14=
/0x20)
[   13.155098] Exception stack(0xc447bfb0 to 0xc447bff8)
[   13.160213] bfa0:                                     00000000 00000000 =
00000000 00000000
[   13.168455] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   13.176696] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   13.183610] irq event stamp: 17915
[   13.187115] hardirqs last  enabled at (17923): [<c0194220>] console_unlo=
ck+0x4b8/0x61c
[   13.195284] hardirqs last disabled at (17932): [<c0194204>] console_unlo=
ck+0x49c/0x61c
[   13.203437] softirqs last  enabled at (17914): [<c0101754>] __do_softirq=
+0x474/0x5c4
[   13.211515] softirqs last disabled at (17951): [<c012d81c>] irq_exit+0x1=
a4/0x1e4
[   13.218991] ---[ end trace e465f1043b41b1ae ]---
[   13.236504] mxsfb 21c8000.lcdif: Cannot connect bridge: -517
[   13.270448] Generic PHY 20b4000.ethernet-1:00: attached PHY driver [Gene=
ric PHY] (mii_bus:phy_addr=3D20b4000.ethernet-1:00, irq=3DPOLL)
[   13.284390] ------------[ cut here ]------------
[   13.289387] WARNING: CPU: 0 PID: 58 at ../drivers/gpu/drm/panel/panel-si=
mple.c:577 panel_simple_probe+0x5dc/0x6b8
[   13.299918] CPU: 0 PID: 58 Comm: kworker/0:2 Tainted: G        W        =
 5.10.0-test-00006-gc24ef7716d4b #1
[   13.309728] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[   13.315987] Workqueue: events deferred_probe_work_func
[   13.321257] [<c011055c>] (unwind_backtrace) from [<c010b9fc>] (show_stac=
k+0x10/0x14)
[   13.329081] [<c010b9fc>] (show_stack) from [<c101851c>] (dump_stack+0xdc=
/0x104)
[   13.336463] [<c101851c>] (dump_stack) from [<c0124778>] (__warn+0x100/0x=
114)
[   13.343583] [<c0124778>] (__warn) from [<c0124830>] (warn_slowpath_fmt+0=
xa4/0xb4)
[   13.351136] [<c0124830>] (warn_slowpath_fmt) from [<c0790904>] (panel_si=
mple_probe+0x5dc/0x6b8)
[   13.359908] [<c0790904>] (panel_simple_probe) from [<c07bc1e0>] (platfor=
m_drv_probe+0x6c/0xa4)
[   13.368594] [<c07bc1e0>] (platform_drv_probe) from [<c07ba158>] (really_=
probe+0x200/0x3a8)
[   13.376938] [<c07ba158>] (really_probe) from [<c07ba708>] (driver_probe_=
device+0x58/0xb4)
[   13.385190] [<c07ba708>] (driver_probe_device) from [<c07b8ac4>] (bus_fo=
r_each_drv+0x70/0xb8)
[   13.393791] [<c07b8ac4>] (bus_for_each_drv) from [<c07ba500>] (__device_=
attach+0xdc/0x150)
[   13.402129] [<c07ba500>] (__device_attach) from [<c07b8c9c>] (bus_probe_=
device+0x88/0x90)
[   13.410376] [<c07b8c9c>] (bus_probe_device) from [<c07b98e0>] (deferred_=
probe_work_func+0x68/0x98)
[   13.419408] [<c07b98e0>] (deferred_probe_work_func) from [<c0145b84>] (p=
rocess_one_work+0x21c/0x7f8)
[   13.428618] [<c0145b84>] (process_one_work) from [<c0146194>] (worker_th=
read+0x34/0x568)
[   13.436781] [<c0146194>] (worker_thread) from [<c014d738>] (kthread+0x12=
4/0x160)
[   13.444250] [<c014d738>] (kthread) from [<c0100134>] (ret_from_fork+0x14=
/0x20)
[   13.451535] Exception stack(0xc447bfb0 to 0xc447bff8)
[   13.456650] bfa0:                                     00000000 00000000 =
00000000 00000000
[   13.464892] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   13.473132] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   13.480001] irq event stamp: 20721
[   13.483509] hardirqs last  enabled at (20729): [<c0194220>] console_unlo=
ck+0x4b8/0x61c
[   13.491673] hardirqs last disabled at (20738): [<c0194204>] console_unlo=
ck+0x49c/0x61c
[   13.499810] softirqs last  enabled at (20704): [<c0101754>] __do_softirq=
+0x474/0x5c4
[   13.507640] softirqs last disabled at (20689): [<c012d81c>] irq_exit+0x1=
a4/0x1e4
[   13.515249] ---[ end trace e465f1043b41b1af ]---
[   13.520076] ------------[ cut here ]------------
[   13.524782] WARNING: CPU: 0 PID: 58 at ../drivers/gpu/drm/panel/panel-si=
mple.c:580 panel_simple_probe+0x5c0/0x6b8
[   13.535270] CPU: 0 PID: 58 Comm: kworker/0:2 Tainted: G        W        =
 5.10.0-test-00006-gc24ef7716d4b #1
[   13.545074] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[   13.551326] Workqueue: events deferred_probe_work_func
[   13.556590] [<c011055c>] (unwind_backtrace) from [<c010b9fc>] (show_stac=
k+0x10/0x14)
[   13.564411] [<c010b9fc>] (show_stack) from [<c101851c>] (dump_stack+0xdc=
/0x104)
[   13.571795] [<c101851c>] (dump_stack) from [<c0124778>] (__warn+0x100/0x=
114)
[   13.578920] [<c0124778>] (__warn) from [<c0124830>] (warn_slowpath_fmt+0=
xa4/0xb4)
[   13.586476] [<c0124830>] (warn_slowpath_fmt) from [<c07908e8>] (panel_si=
mple_probe+0x5c0/0x6b8)
[   13.595251] [<c07908e8>] (panel_simple_probe) from [<c07bc1e0>] (platfor=
m_drv_probe+0x6c/0xa4)
[   13.603942] [<c07bc1e0>] (platform_drv_probe) from [<c07ba158>] (really_=
probe+0x200/0x3a8)
[   13.612279] [<c07ba158>] (really_probe) from [<c07ba708>] (driver_probe_=
device+0x58/0xb4)
[   13.620529] [<c07ba708>] (driver_probe_device) from [<c07b8ac4>] (bus_fo=
r_each_drv+0x70/0xb8)
[   13.629127] [<c07b8ac4>] (bus_for_each_drv) from [<c07ba500>] (__device_=
attach+0xdc/0x150)
[   13.637463] [<c07ba500>] (__device_attach) from [<c07b8c9c>] (bus_probe_=
device+0x88/0x90)
[   13.645720] [<c07b8c9c>] (bus_probe_device) from [<c07b98e0>] (deferred_=
probe_work_func+0x68/0x98)
[   13.654755] [<c07b98e0>] (deferred_probe_work_func) from [<c0145b84>] (p=
rocess_one_work+0x21c/0x7f8)
[   13.663965] [<c0145b84>] (process_one_work) from [<c0146194>] (worker_th=
read+0x34/0x568)
[   13.672130] [<c0146194>] (worker_thread) from [<c014d738>] (kthread+0x12=
4/0x160)
[   13.679598] [<c014d738>] (kthread) from [<c0100134>] (ret_from_fork+0x14=
/0x20)
[   13.686880] Exception stack(0xc447bfb0 to 0xc447bff8)
[   13.691996] bfa0:                                     00000000 00000000 =
00000000 00000000
[   13.700237] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[   13.708477] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   13.715378] irq event stamp: 20799
[   13.718874] hardirqs last  enabled at (20807): [<c0194220>] console_unlo=
ck+0x4b8/0x61c
[   13.727680] hardirqs last disabled at (20822): [<c0194204>] console_unlo=
ck+0x49c/0x61c
[   13.736030] softirqs last  enabled at (20840): [<c0101754>] __do_softirq=
+0x474/0x5c4
[   13.744038] softirqs last disabled at (20831): [<c012d81c>] irq_exit+0x1=
a4/0x1e4
[   13.751662] ---[ end trace e465f1043b41b1b0 ]---
[   13.769791] Micrel KSZ8081 or KSZ8091 2188000.ethernet-2:01: attached PH=
Y driver [Micrel KSZ8081 or KSZ8091] (mii_bus:phy_addr=3D2188000.ethernet-2=
:01, irq=3DPOLL)
[   13.797274] mxsfb 21c8000.lcdif: Cannot connect bridge: -517
[   16.927255] fec 2188000.ethernet eth1: Link is Up - 100Mbps/Full - flow =
control rx/tx
[   16.952235] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
[   16.981953] Sending DHCP requests ., OK
[   17.166963] IP-Config: Got DHCP answer from 192.168.3.1, my address is 1=
92.168.3.21
[   17.175519] IP-Config: Complete:
[   17.178960]      device=3Deth1, hwaddr=3Df8:dc:7a:09:11:68, ipaddr=3D192=
.168.3.21, mask=3D255.255.255.0, gw=3D192.168.3.1
[   17.189598]      host=3D192.168.3.21, domain=3D, nis-domain=3D(none)
[   17.195617]      bootserver=3D0.0.0.0, rootserver=3D192.168.3.13, rootpa=
th=3D
[   17.195716]      nameserver0=3D192.168.3.1
[   17.206918] =

[   17.234781] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[   17.251161] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   17.262826] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2
[   17.271933] platform regulatory.0: Falling back to sysfs fallback for: r=
egulatory.db
[   17.280225] ALSA device list:
[   17.283656]   No soundcards found.
[   17.408810] VFS: Mounted root (nfs filesystem) on device 0:15.
[   17.428166] devtmpfs: mounted
[   17.436700] Freeing unused kernel memory: 1024K
[   17.452975] Run /sbin/init as init process

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CAA3BD7AB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 15:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44296E49B;
	Tue,  6 Jul 2021 13:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7727E6E49B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 13:21:39 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 2EA765C00A6;
 Tue,  6 Jul 2021 09:21:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 06 Jul 2021 09:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=QqDKmGo9iQJ98u1BqHHQOG3Vzlv
 Q8zfqS1NQK3ie1Gs=; b=FfW1P94jQZmY6UhEbM7SxZGzLu8Ew5c6yxmkwEaHrbH
 xIvhMN9VdwT5efW0ecMnFVPztxL/iAQsMI13YJFANIcXnytk6lWUtidIQHJ9MZ2w
 FNEHanKuZSpzif6zzGFe1HJChno4/altqMU4DDSE3Omzw1b/jGSu4qq+OZ8KrUaX
 w+BYKVcTWx648z9hy4t6rTN8zLwLqNqkLmdwkjxBX/YrkJEJgY1cHL9etc59k1ZJ
 KAzAK2LlfM5LVRrZHKQgwUI7nkk+DjabmknRZKRD3ZbqsoFLVeUltZZDiI5AhJNS
 YPSp6pyrwyiAjw86rHqim/gNvEpCCFznAkdXsIDfCDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QqDKmG
 o9iQJ98u1BqHHQOG3VzlvQ8zfqS1NQK3ie1Gs=; b=p8B+lSzW+kA0lBdGxvTK6J
 YInmXLQPVDxwlrFmEmdnJr1EjdqRBm1DVFE7ueofls3o4iKi0HyOxd9ETHSzK6Hb
 xLxlrRJ+wGs7tuLTPpOKl6Ra8v3w12A9RnS2df0albVMHqAq4W49ecE+op0jK/t3
 f+ZGyHZdZJgeOp622deVsp8tlXF+s3s2BcBmlKGJQn+bzoYRKCzpnqyC4AVwy3rC
 tQGwpmpzPb88JWjISIDdaAu2jCHPdMvxAW2Gg9UMLx1860czWL327Ho6sJZppZFC
 qwUnbUV31jyyu4//wnahbWWAQNStElY3U5xZO/6t0iFFcP7X2crshVBKOG2Jya/Q
 ==
X-ME-Sender: <xms:31jkYLBS8J9BFC6TP6cLMjdrs8-WlBdAe8NyKpMWSDfqt0_ncyZ0Yw>
 <xme:31jkYBhx0yVZ7Y3thh2jdh-Njv3l33JN2G3YZmPwg3emBRouGxoVhohML13zgWbPJ
 yTr32nMh2RJ_EsJZwU>
X-ME-Received: <xmr:31jkYGkPIxzFOo-Psz-Fp1iwN7lJDwffcQl8OIhiOBQrPd22ImFnxPAXBvF44wDcdJMB0dfiQzanl8sytpiZ8zPfjik-2nbVQwdE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddtgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:31jkYNxRdQI6HwkPnQKhOqvUAHyGtc5hZfgWVyfFp4z2NNLf9W28rQ>
 <xmx:31jkYARHk-7lmcZSJuPsVtmuM_YxFs7X2KbrgOmdGwEzBjJyXDWFAQ>
 <xmx:31jkYAZxGVcALySfnEe_DUcUbgn5XcIPM050mwmx4iGHTYEwwwrh5g>
 <xmx:4FjkYPHD1594xvPNDu3s5pkZ4HW8yQLbPrDdqfC4AZZ3VhR90S3KKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 09:21:34 -0400 (EDT)
Date: Tue, 6 Jul 2021 15:21:31 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Fix connector detect logic
Message-ID: <20210706132131.4bylrs5u2xmypjcy@gilmour>
References: <1625520994-11065-1-git-send-email-stefan.wahren@i2se.com>
 <20210706095807.abx3v4wkc7ymwhjx@gilmour>
 <1ecde64b-3c91-dac6-e8e2-64a45022a40e@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ytfqgqoas3eqfxnn"
Content-Disposition: inline
In-Reply-To: <1ecde64b-3c91-dac6-e8e2-64a45022a40e@i2se.com>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ytfqgqoas3eqfxnn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Tue, Jul 06, 2021 at 12:48:05PM +0200, Stefan Wahren wrote:
> Am 06.07.21 um 11:58 schrieb Maxime Ripard:
> > Hi,
> >
> > On Mon, Jul 05, 2021 at 11:36:34PM +0200, Stefan Wahren wrote:
> >> Commit "drm/vc4: hdmi: Convert to gpiod" changes the behavior of
> >> vc4_hdmi_connector_detect() which results into CPU hangs in case there
> >> is no HDMI connected. Let's restore the old behavior.
> >>
> >> Reported-by: Nathan Chancellor <nathan@kernel.org>
> >> Reported-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> >> Fixes: 6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod")
> >> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > I already sent this patch last week:
> >
> > https://lore.kernel.org/dri-devel/20210628124257.140453-3-maxime@cerno.=
tech/
> oops, i only looked in the July archive.
>
> > I'm not entirely sure how this could create a CPU hang though. Withouth
> > this patch, if the HPD GPIO is low, we would first try to retrieve the
> > EDID, and then if it doesn't we would read the hotplug register.
> Yes, the real issue has been revealed by the original change and this
> patch only "hides" it again.
> > The first is using a separate i2c controller (and even if it was in the
> > same power domain, we have the pm_runtime_resume call), and the register
> > read should be fine too?
>=20
> Sorry, i don't have a clue and time for further investigations.
>=20
> Does it mean, you are not able to reproduce this issue?

On next-20210706 at least it works fine for me without an HDMI monitor
connected, yes:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.13.0-next-20210706-v7l (max@gilmour) (arm-li=
nux-gnu-gcc (GCC) 10.2.1 20200826 (Red Hat Cross 10.2.1-3), GNU ld version =
2.35.1-5.fc34) #329 SMP Tue Jul 6 14:42:41 CEST 2021
[    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), cr=3D30c=
5383d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instr=
uction cache
[    0.000000] OF: fdt: Machine model: Raspberry Pi 3 Model B Plus Rev 1.3
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] Ignoring RAM at 0x0000000030000000-0x0000000038000000
[    0.000000] Consider using a HIGHMEM enabled kernel.
[    0.000000] Reserved memory: bypass linux,cma node, using cmdline CMA pa=
rams instead
[    0.000000] OF: reserved mem: node linux,cma compatible matching fail
[    0.000000] cma: Reserved 512 MiB at 0x000000000ec00000
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x000000002fffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000002fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000002ffff=
fff]
[    0.000000] percpu: Embedded 1040 pages/cpu s4230284 r8192 d21364 u42598=
40
[    0.000000] pcpu-alloc: s4230284 r8192 d21364 u4259840 alloc=3D1040*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3=20
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 194880
[    0.000000] Kernel command line: video=3DHDMI-A-1:640x480M@60 dma.dmacha=
ns=3D0x7f35 bcm2709.boardrev=3D0xa020d3 bcm2709.serial=3D0xa5669abe bcm2709=
=2Euart_clock=3D48000000 bcm2709.disk_led_gpio=3D29 bcm2709.disk_led_active=
_low=3D0 vc_mem.mem_base=3D0x3ec00000 vc_mem.mem_size=3D0x40000000  console=
=3DttyS0,115200 root=3D/dev/nfs nfsroot=3D192.168.3.21:/srv/nfs/rpi/raspbia=
n rw ip=3Ddhcp rootwait cma=3D512M
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 by=
tes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 byte=
s, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 77316K/786432K available (12288K kernel code, 103370=
K rwdata, 3380K rodata, 6144K init, 33450K bss, 184828K reserved, 524288K c=
ma-reserved)
[    0.000000] ftrace: allocating 34375 entries in 101 pages
[    0.000000] ftrace: allocated 101 pages with 4 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 1=
0 jiffies.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] [Firmware Bug]: Bootloader left irq enabled: bank 1 irq 9
[    0.000000] random: get_random_bytes called from start_kernel+0x854/0xa3=
4 with crng_init=3D0
[    0.000002] sched_clock: 32 bits at 1000kHz, resolution 1000ns, wraps ev=
ery 2147483647500ns
[    0.000036] clocksource: timer: mask: 0xffffffff max_cycles: 0xffffffff,=
 max_idle_ns: 1911260446275 ns
[    0.000102] bcm2835: system timer (irq =3D 60)
[    0.000586] arch_timer: cp15 timer(s) running at 19.20MHz (phys).
[    0.000612] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cy=
cles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000637] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every =
4398046511078ns
[    0.000659] Switching to timer-based delay loop, resolution 52ns
[    0.002278] Console: colour dummy device 80x30
[    0.002356] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 38.40 BogoMIPS (lpj=3D192000)
[    0.002392] pid_max: default: 32768 minimum: 301
[    0.008533] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, =
linear)
[    0.008593] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 by=
tes, linear)
[    0.010791] CPU: Testing write buffer coherency: ok
[    0.011349] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.012866] Setting up static identity map for 0x200000 - 0x20003c
[    0.013106] rcu: Hierarchical SRCU implementation.
[    0.014484] smp: Bringing up secondary CPUs ...
[    0.016723] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.018995] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.021242] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
[    0.021394] smp: Brought up 1 node, 4 CPUs
[    0.021440] SMP: Total of 4 processors activated (153.60 BogoMIPS).
[    0.021462] CPU: All CPU(s) started in HYP mode.
[    0.021478] CPU: Virtualization extensions available.
[    0.022580] devtmpfs: initialized
[    0.042479] VFP support v0.3: implementor 41 architecture 3 part 40 vari=
ant 3 rev 4
[    0.042836] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 19112604462750000 ns
[    0.042876] futex hash table entries: 1024 (order: 4, 65536 bytes, linea=
r)
[    0.070352] pinctrl core: initialized pinctrl subsystem
[    0.072424] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.076209] DMA: preallocated 256 KiB pool for atomic coherent allocatio=
ns
[    0.083372] thermal_sys: Registered thermal governor 'step_wise'
[    0.084048] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4 watchp=
oint registers.
[    0.084080] hw-breakpoint: maximum watchpoint size is 8 bytes.
[    0.084446] Serial: AMBA PL011 UART driver
[    0.134684] Kprobes globally optimized
[    0.139699] vgaarb: loaded
[    0.140676] SCSI subsystem initialized
[    0.141141] usbcore: registered new interface driver usbfs
[    0.141260] usbcore: registered new interface driver hub
[    0.141400] usbcore: registered new device driver usb
[    0.141892] usb_phy_generic phy: supply vcc not found, using dummy regul=
ator
[    0.143169] Advanced Linux Sound Architecture Driver Initialized.
[    0.144991] clocksource: Switched to clocksource arch_sys_counter
[    0.246109] VFS: Disk quotas dquot_6.6.0
[    0.246313] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 byt=
es)
[    0.246696] FS-Cache: Loaded
[    0.247040] CacheFiles: Loaded
[    0.262951] NET: Registered PF_INET protocol family
[    0.263263] IP idents hash table entries: 16384 (order: 5, 131072 bytes,=
 linear)
[    0.264926] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, =
6144 bytes, linear)
[    0.265014] TCP established hash table entries: 8192 (order: 3, 32768 by=
tes, linear)
[    0.265144] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, li=
near)
[    0.265345] TCP: Hash tables configured (established 8192 bind 8192)
[    0.265559] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.265628] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, lin=
ear)
[    0.266349] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.276322] RPC: Registered named UNIX socket transport module.
[    0.276344] RPC: Registered udp transport module.
[    0.276361] RPC: Registered tcp transport module.
[    0.276378] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.276403] PCI: CLS 0 bytes, default 64
[    1.889804] Initialise system trusted keyrings
[    1.890178] workingset: timestamp_bits=3D14 max_order=3D18 bucket_order=
=3D4
[    1.892377] FS-Cache: Netfs 'nfs' registered for caching
[    1.893112] NFS: Registering the id_resolver key type
[    1.893179] Key type id_resolver registered
[    1.893198] Key type id_legacy registered
[    1.893230] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    1.893250] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Regist=
ering...
[    1.894766] Key type asymmetric registered
[    1.894788] Asymmetric key parser 'x509' registered
[    1.894870] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 250)
[    1.895185] io scheduler mq-deadline registered
[    1.895218] io scheduler kyber registered
[    1.908714] Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled
[    1.910464] printk: console [ttyS0] disabled
[    1.910660] 3f215040.serial: ttyS0 at MMIO 0x3f215040 (irq =3D 86, base_=
baud =3D 31250000) is a 16550
[    2.635497] printk: console [ttyS0] enabled
[    2.642296] bcm2835-rng 3f104000.rng: hwrng registered
[    2.680335] brd: module loaded
[    2.709631] loop: module loaded
[    2.714089] bcm2835-power bcm2835-power: Broadcom BCM2835 power domains =
driver
[    2.721800] Loading iSCSI transport class v2.0-870.
[    2.730956] libphy: Fixed MDIO Bus: probed
[    2.736321] usbcore: registered new interface driver r8152
[    2.741968] usbcore: registered new interface driver lan78xx
[    2.747837] usbcore: registered new interface driver smsc75xx
[    2.753762] usbcore: registered new interface driver smsc95xx
[    2.761074] usbcore: registered new interface driver uas
[    2.766610] usbcore: registered new interface driver usb-storage
[    2.773025] mousedev: PS/2 mouse device common for all mice
[    2.778712] i2c /dev entries driver
[    2.784908] i2c-bcm2835 3f805000.i2c: Could not read clock-frequency pro=
perty
[    2.794748] bcm2835-wdt bcm2835-wdt: Broadcom BCM2835 watchdog timer
[    2.802175] sdhci: Secure Digital Host Controller Interface driver
[    2.808468] sdhci: Copyright(c) Pierre Ossman
[    2.813153] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.820377] ledtrig-cpu: registered to indicate activity on CPUs
[    2.826870] hid: raw HID events driver (C) Jiri Kosina
[    2.832536] usbcore: registered new interface driver usbhid
[    2.838217] usbhid: USB HID core driver
[    2.843092] bcm2835-mbox 3f00b880.mailbox: mailbox enabled
[    2.850455] Initializing XFRM netlink socket
[    2.854827] NET: Registered PF_PACKET protocol family
[    2.860175] Key type dns_resolver registered
[    2.864668] Registering SWP/SWPB emulation handler
[    2.870514] registered taskstats version 1
[    2.874709] Loading compiled-in X.509 certificates
[    2.892551] 3f201000.serial: ttyAMA0 at MMIO 0x3f201000 (irq =3D 114, ba=
se_baud =3D 0) is a PL011 rev2
[    2.906745] raspberrypi-firmware soc:firmware: Attached to firmware from=
 2020-04-15T11:43:08
[    2.910656] sdhost-bcm2835 3f202000.mmc: loaded - DMA enabled (>1)
[    3.055481] dwc2 3f980000.usb: supply vusb_d not found, using dummy regu=
lator
[    3.063053] dwc2 3f980000.usb: supply vusb_a not found, using dummy regu=
lator
[    3.122075] dwc2 3f980000.usb: DWC OTG Controller
[    3.126936] dwc2 3f980000.usb: new USB bus registered, assigned bus numb=
er 1
[    3.134143] dwc2 3f980000.usb: irq 66, io mem 0x3f980000
[    3.140048] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.13
[    3.148466] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    3.155825] usb usb1: Product: DWC OTG Controller
[    3.160608] usb usb1: Manufacturer: Linux 5.13.0-next-20210706-v7l dwc2_=
hsotg
[    3.167873] usb usb1: SerialNumber: 3f980000.usb
[    3.173581] hub 1-0:1.0: USB hub found
[    3.177489] hub 1-0:1.0: 1 port detected
[    3.215472] sdhci-iproc 3f300000.mmc: allocated mmc-pwrseq
[    3.254154] mmc1: SDHCI controller on 3f300000.mmc [3f300000.mmc] using =
PIO
[    3.277835] mmc1: queuing unknown CIS tuple 0x80 (2 bytes)
[    3.285199] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
[    3.292556] mmc1: queuing unknown CIS tuple 0x80 (3 bytes)
[    3.301324] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)
[    3.364820] random: fast init done
[    3.380119] mmc1: new high speed SDIO card at address 0001
[    3.525019] usb 1-1: new high-speed USB device number 2 using dwc2
[    3.775356] usb 1-1: New USB device found, idVendor=3D0424, idProduct=3D=
2514, bcdDevice=3D b.b3
[    3.783673] usb 1-1: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D0
[    3.791866] hub 1-1:1.0: USB hub found
[    3.795836] hub 1-1:1.0: 4 ports detected
[    4.115020] usb 1-1.1: new high-speed USB device number 3 using dwc2
[    4.245462] usb 1-1.1: New USB device found, idVendor=3D0424, idProduct=
=3D2514, bcdDevice=3D b.b3
[    4.253953] usb 1-1.1: New USB device strings: Mfr=3D0, Product=3D0, Ser=
ialNumber=3D0
[    4.262423] hub 1-1.1:1.0: USB hub found
[    4.266572] hub 1-1.1:1.0: 3 ports detected
[    5.045034] usb 1-1.1.1: new high-speed USB device number 4 using dwc2
[    5.175708] usb 1-1.1.1: New USB device found, idVendor=3D0424, idProduc=
t=3D7800, bcdDevice=3D 3.00
[    5.184386] usb 1-1.1.1: New USB device strings: Mfr=3D0, Product=3D0, S=
erialNumber=3D0
[    5.459454] lan78xx 1-1.1.1:1.0 (unnamed net_device) (uninitialized): No=
 External EEPROM. Setting MAC Speed
[    5.471946] libphy: lan78xx-mdiobus: probed
[    5.587085] random: crng init done
[    7.855008] Sending DHCP requests ., OK
[    7.899003] IP-Config: Got DHCP answer from 192.168.3.254, my address is=
 192.168.3.77
[    7.906990] IP-Config: Complete:
[    7.910271]      device=3Deth0, hwaddr=3Db8:27:eb:66:9a:be, ipaddr=3D192=
=2E168.3.77, mask=3D255.255.255.0, gw=3D192.168.3.254
[    7.920721]      host=3D192.168.3.77, domain=3Dlan, nis-domain=3D(none)
[    7.926923]      bootserver=3D192.168.3.254, rootserver=3D192.168.3.21, =
rootpath=3D
[    7.926940]      nameserver0=3D1.1.1.1
[    7.948448] ALSA device list:
[    7.951468]   No soundcards found.
[    7.967337] VFS: Mounted root (nfs filesystem) on device 0:15.
[    7.973938] devtmpfs: mounted
[    7.999153] Freeing unused kernel image (initmem) memory: 6144K
[    8.045659] Run /sbin/init as init process
[    8.049824]   with arguments:
[    8.049835]     /sbin/init
[    8.049847]   with environment:
[    8.049857]     HOME=3D/
[    8.049868]     TERM=3Dlinux
[    8.605849] systemd[1]: System time before build time, advancing clock.
[    8.732583] NET: Registered PF_INET6 protocol family
[    8.740903] Segment Routing with IPv6
[    8.841895] systemd[1]: systemd 241 running in system mode. (+PAM +AUDIT=
 +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNU=
TLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN2 +IDN -PCRE2 default=
-hierarchy=3Dhybrid)
[    8.865535] systemd[1]: Detected architecture arm.
[    8.976749] systemd[1]: Set hostname to <raspberrypi>.
[   10.302081] systemd[1]: Condition check resulted in Journal Audit Socket=
 being skipped.
[   10.311035] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[   10.365266] systemd[1]: Reached target Swap.
[   10.397365] systemd[1]: Listening on Syslog Socket.
[   10.436723] systemd[1]: Listening on udev Kernel Socket.
[   10.485690] systemd[1]: Created slice system-getty.slice.
[   10.528802] systemd[1]: Created slice system-serial\x2dgetty.slice.
[   12.177636] systemd-journald[119]: Received request to flush runtime jou=
rnal from PID 1
[   13.810728] snd_bcm2835: module is from the staging directory, the quali=
ty is unknown, you have been warned.
[   13.853684] mc: Linux media interface: v0.10
[   13.947159] bcm2835_audio bcm2835_audio: card created with 8 channels
[   13.985444] videodev: Linux video capture interface: v2.00
[   14.432430] bcm2835_v4l2: module is from the staging directory, the qual=
ity is unknown, you have been warned.
[   15.083811] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[   15.159342] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
[   15.182681] debugfs: Directory '3f902000.hdmi' with parent 'vc4-hdmi' al=
ready present!
[   15.211008] vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc4])
[   15.214764] vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops [vc4])
[   15.215857] vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4])
[   15.216392] vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops vc4_crtc_ops=
 [vc4])
[   15.216855] vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops vc4_crtc_ops=
 [vc4])
[   15.217315] vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops vc4_crtc_ops=
 [vc4])
[   15.217710] vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops [vc4])
[   15.256447] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
[   15.321317] Console: switching to colour frame buffer device 90x30
[   15.330456] vc4-drm soc:gpu: [drm] fb0: vc4 frame buffer device
[   15.530230] Adding 102396k swap on /var/swap.  Priority:-2 extents:1 acr=
oss:102396k FS
[   15.552819] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   15.649196] brcmfmac: F1 signature read @0x18000000=3D0x15264345
[   15.696912] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43455-s=
dio for chip BCM4345/6
[   15.710077] usbcore: registered new interface driver brcmfmac
[   15.752286] brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac=
43455-sdio.raspberrypi,3-model-b-plus.txt failed with error -2
[   15.977214] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43455-s=
dio for chip BCM4345/6
[   15.990975] 8021q: 802.1Q VLAN Support v1.8
[   15.991042] 8021q: adding VLAN 0 to HW filter on device eth0
[   15.997628] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 wl0: Ma=
r 23 2020 02:19:54 version 7.45.206 (r725000 CY) FWID 01-88ee44ea


Maxime

--ytfqgqoas3eqfxnn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYORY2wAKCRDj7w1vZxhR
xaroAPoCRYPQLF46E6gviSQoNehqI2H+Psmm2yX5OiPt1D5pMAEAgQhUqfg6Grl2
bMNaey/cvjNqNaPau+1JydsboXYtigM=
=lmf5
-----END PGP SIGNATURE-----

--ytfqgqoas3eqfxnn--

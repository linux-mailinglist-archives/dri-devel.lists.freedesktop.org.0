Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0A576F3D0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 22:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B4C10E117;
	Thu,  3 Aug 2023 20:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308F810E0E8;
 Thu,  3 Aug 2023 20:04:38 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-791c27bb91dso918776241.0; 
 Thu, 03 Aug 2023 13:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691093077; x=1691697877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ApfWi0t4jty7JeS4yL2vS1J6JB48ODRK1f0RMIx0PtQ=;
 b=fZDqaXw6QplzIVfcMJM6ZOYKZfo4O++l29jDpsXiJsS0y790Tw6n7qRql8UNHGW5hu
 hIMAITgcVSxhks3eH/31jsAnUui224j7BDqiqIpHzBTTt3KihnW/a0FMsqfQnqCy0x+M
 ZnM1Og7oklXOoZY4wxH7G/Wcu0xQTZPMMls699505L9X2Kd7nmNE1nuTN2zISxY9J6QX
 rG86BEnpVrAIv0s/ycU+mXFW2z35Qs4faUru1UqWdjS9/pbNAb3lyHSoJZQ+T81H/P3n
 /ghlJoYE2jbO98sraCbBi6MPQAOLAQQil4W6x7LWf3Iygf7g49Sp1/HEjjmJgPgLsZv7
 YkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691093077; x=1691697877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ApfWi0t4jty7JeS4yL2vS1J6JB48ODRK1f0RMIx0PtQ=;
 b=O/7K52kyHC/ptyUJs2au/Mjfwk11/9VG1QlbIYjkE+aJqfsQGONq5Z5FG9XE7kgfvm
 kxpfwbCpYNpDLyWFFea/X4oKtsmJm9/yoSnslAMs4nH60xWKNweGWV1ppoK21/6qDhc1
 +Mr/9ZLkD/4SGpmQJFdix2Jq796kTo9vFIBtQcZrFAHfz7lUSun+/s67RLX9AOvDrbYQ
 bZv7avGKQfgt5Jv/pHg2m8SPXtCClPgflvBVAgwp/bFAoiJG3RVsn5WvJY5pUQROLM6e
 qX8bR26+U1c+FR6POjjXa0C9MMrXKi3yD1bxhImjvecgzYjL7Fd4TJRUHhBL6XVAAinJ
 yqiA==
X-Gm-Message-State: ABy/qLaWQLVybURPZJjjaUP1r8jtJHRw8uteyZ7yyna/sHOB+hGos5yb
 N5BgAa6B5gfY06pVSCAR/Rq84QEcrn68eKr1kbQ=
X-Google-Smtp-Source: APBJJlGD7rFuynuZ0oNK7SxxdLxXgaUuaS7EyHYFHk2sJVKXReQv79vIo32qBP4WKum2zu+eK6p/UeNQxnqRpXmktKM=
X-Received: by 2002:a05:6102:33d3:b0:443:8053:f969 with SMTP id
 w19-20020a05610233d300b004438053f969mr4001661vsh.17.1691093077007; Thu, 03
 Aug 2023 13:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230801170255.163237-21-jim.cromie@gmail.com>
 <202308031432.fcb4197-oliver.sang@intel.com>
In-Reply-To: <202308031432.fcb4197-oliver.sang@intel.com>
From: jim.cromie@gmail.com
Date: Thu, 3 Aug 2023 14:04:10 -0600
Message-ID: <CAJfuBxz1RT-U_Pphz11CPv4u+SOioBTkOYOVmDvscZJ-jM7Wng@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v5 19/22] drm: restore
 CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
To: kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: lkp@intel.com, jani.nikula@intel.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, joe@perches.com,
 jbaron@akamai.com, seanpaul@chromium.org, amd-gfx@lists.freedesktop.org,
 gregkh@linuxfoundation.org, oe-lkp@lists.linux.dev,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 3, 2023 at 1:14=E2=80=AFAM kernel test robot <oliver.sang@intel=
.com> wrote:
>
>
> hi, Jim Cromie,
>
> we send this report to you to consult that if there is any limitation to =
use
> this CONFIG_DRM_USE_DYNAMIC_DEBUG?
> attached config is a randconfig which has CONFIG_DRM_USE_DYNAMIC_DEBUG, t=
he
> kernel built with it failed to boot in our tests, but we also tested with=
 some
> other config then the issue cannot reproduce.
>
> below full report FYI.
>



> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-6.5.0-rc2-00390-gfb82a8bb4e30 .config
>         make HOSTCC=3Dgcc-12 CC=3Dgcc-12 ARCH=3Dx86_64 olddefconfig prepa=
re modules_prepare bzImage modules
>         make HOSTCC=3Dgcc-12 CC=3Dgcc-12 ARCH=3Dx86_64 INSTALL_MOD_PATH=
=3D<mod-install-dir> modules_install
>         cd <mod-install-dir>
>         find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>

I have recapitulated this, except I used make.cross , and the gcc I
had that was close.
If I can get the test to run, maybe I can get the same error.
If I run to completion, I'll return to get a closer match on gcc version.

Ive gotten to qemu, but its failing on "initrd is too large"

[jimc@frodo lkp-tests]$ bin/lkp qemu -k
/home/jimc/projects/lx/wk-suren/builds/8-3-lkp/./arch/x86_64/boot/bzImage
-m /home/jimc/projects/lx/wk-suren/builds/8-3-lkp/Imods/modules.cgz
~/Downloads/job-script
try-run: /home/jimc/projects/lkp-tests/bin/qemu
try-run: /home/jimc/projects/lkp-tests/sbin/qemu
try-run: /home/jimc/projects/lkp-tests/tools/qemu
try-run: /home/jimc/projects/lkp-tests/lkp-exec/qemu
~/projects/lkp-tests/pkg/lkp-src ~/projects/lkp-tests
x86_64
=3D=3D> Making package: lkp-src 0-1 (Thu Aug  3 01:37:51 PM MDT 2023)
=3D=3D> Checking runtime dependencies...
=3D=3D> Checking buildtime dependencies...
=3D=3D> WARNING: Using existing $srcdir/ tree
=3D=3D> Removing existing $pkgdir/ directory...
=3D=3D> Starting build()...
make: Entering directory '/home/jimc/projects/lkp-tests/bin/event'
gcc  -D_FORTIFY_SOURCE=3D2  -c -o wakeup.o wakeup.c
In file included from /usr/include/sys/types.h:25,
                 from wakeup.c:1:
/usr/include/features.h:413:4: warning: #warning _FORTIFY_SOURCE
requires compiling with optimization (-O) [-Wcpp]
  413 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O=
)
      |    ^~~~~~~
gcc  -Wl,-O1,--sort-common,--as-needed,-z,relro -static -o wakeup wakeup.o
rm -f wakeup.o
strip wakeup
make: Leaving directory '/home/jimc/projects/lkp-tests/bin/event'
=3D=3D> Entering fakeroot environment...
x86_64
=3D=3D> Starting package()...
=3D=3D> Creating package "lkp-src"...
14610330 blocks
renamed '/home/jimc/.lkp/cache/lkp-x86_64.cgz.tmp' ->
'/home/jimc/.lkp/cache/lkp-x86_64.cgz'
=3D=3D> Leaving fakeroot environment.
=3D=3D> Finished making: lkp-src 0-1 (Thu Aug  3 01:42:18 PM MDT 2023)
~/projects/lkp-tests
result_root: /home/jimc/.lkp//result/boot/1/vm-snb/yocto-i386-minimal-20190=
520.cgz/x86_64-randconfig-x015-20230731/gcc-12/fb82a8bb4e30dcf042c48563987a=
d3a24a416f5d/8
downloading initrds ...
use local modules: /home/jimc/.lkp/cache/modules.cgz
skip downloading
/home/jimc/.lkp/cache/osimage/yocto/yocto-i386-minimal-20190520.cgz
17916 blocks
exec command: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -m 8G
-fsdev local,id=3Dtest_dev,path=3D/home/jimc/.lkp//result/boot/1/vm-snb/yoc=
to-i386-minimal-20190520.cgz/x86_64-randconfig-x015-20230731/gcc-12/fb82a8b=
b4e30dcf042c48563987ad3a24a416f5d/8,security_model=3Dnone
-device virtio-9p-pci,fsdev=3Dtest_dev,mount_tag=3D9p/virtfs_mount -kernel
/home/jimc/projects/lx/wk-suren/builds/8-3-lkp/./arch/x86_64/boot/bzImage
-append root=3D/dev/ram0
RESULT_ROOT=3D/result/boot/1/vm-snb/yocto-i386-minimal-20190520.cgz/x86_64-=
randconfig-x015-20230731/gcc-12/fb82a8bb4e30dcf042c48563987ad3a24a416f5d/3
BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-x015-20230731/gcc-12/fb82a8bb4e30=
dcf042c48563987ad3a24a416f5d/vmlinuz-6.5.0-rc2-00390-gfb82a8bb4e30
branch=3Dlinux-review/Jim-Cromie/drm-use-correct-ccflags-y-syntax/20230802-=
010749
job=3D/lkp/jobs/scheduled/vm-meta-58/boot-1-yocto-i386-minimal-20190520.cgz=
-x86_64-randconfig-x015-20230731-fb82a8bb4e30-20230803-93950-6g16ti-3.yaml
user=3Dlkp ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-x015-20230731
commit=3Dfb82a8bb4e30dcf042c48563987ad3a24a416f5d nmi_watchdog=3D0
vmalloc=3D256M initramfs_async=3D0 page_owner=3Don max_uptime=3D600
LKP_LOCAL_RUN=3D1 selinux=3D0 debug apic=3Ddebug sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don
panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic
load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8
systemd.log_level=3Derr ignore_loglevel console=3Dtty0
earlyprintk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw  ip=3Ddhc=
p
result_service=3D9p/virtfs_mount -initrd
/home/jimc/.lkp/cache/final_initrd -smp 2 -m 1312M -no-reboot -device
i6300esb -rtc base=3Dlocaltime -device e1000,netdev=3Dnet0 -netdev
user,id=3Dnet0 -display none -monitor null -serial stdio
qemu: initrd is too large, cannot support.(max: 1375567871, need 6117354712=
)


looking at qemu.git src  (Im probly running fedora's version) but its
gotta be close..

[jimc@frodo qemu]$ ack -B3 -A3 'initrd is too large'
hw/i386/x86.c
878-                initrd_size =3D g_mapped_file_get_length(mapped_file);
879-                initrd_max =3D x86ms->below_4g_mem_size - acpi_data_siz=
e - 1;
880-                if (initrd_size >=3D initrd_max) {
881:                    fprintf(stderr, "qemu: initrd is too large,
cannot support."
882-                            "(max: %"PRIu32", need %"PRId64")\n",
883-                            initrd_max, (uint64_t)initrd_size);
884-                    exit(1);
--
1023-        initrd_data =3D g_mapped_file_get_contents(mapped_file);
1024-        initrd_size =3D g_mapped_file_get_length(mapped_file);
1025-        if (initrd_size >=3D initrd_max) {
1026:            fprintf(stderr, "qemu: initrd is too large, cannot support=
."
1027-                    "(max: %"PRIu32", need %"PRId64")\n",
1028-                    initrd_max, (uint64_t)initrd_size);
1029-            exit(1);


This doesnt seem like this is a limitation I can just hack around.

why is it in i386 anyway ?

Im surprised JUMP_LABEL is supported on i386





>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>

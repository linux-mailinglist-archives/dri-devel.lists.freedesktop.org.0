Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F57210595
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2286E05F;
	Wed,  1 Jul 2020 07:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00F16E05F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:59:06 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id m26so13024733lfo.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nKqfzJ7kql1XC+OA5EjXTayMwBhOfE0sYMwUHBKlbzY=;
 b=mBsq4BQzU+JeA9HcZrm6vGHX5+4yJW4RvkP96M+GR1KlLs5kmIB67Ayxize6Xni/sR
 23P1G3QfvoptCtf/pt8L6WjyqUBu1kSyFZSahhFJKC0ExA+UxR7+zNjRA+thC66uQ8m7
 40p66rS+ujI3Tob7aUriJbudWimA9i7AY9kMmf0jmMIWBhv80J1EypGqSLvrh7DtaAPk
 3FDMOvvC/4Wa9Ofp9jSVrC7S868LoOBSzXRKcxGnPxLtAidu2MzKlTwmbU5EuCZc7c/K
 SNzk9tOJY0BEUBdaN3M01YRkmCPaYzHEH+JO3Bz6nbj6CMIZPuwR5JdoFd2IlE7deR0o
 sX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nKqfzJ7kql1XC+OA5EjXTayMwBhOfE0sYMwUHBKlbzY=;
 b=lr8OtUVfbPqvmJw4y/S5wkCxdFKKIQ9+RjKyAt78b3muj97lPo7JvRvJ+kH6wsoCAI
 DVD+GCmnP4p0uTG2DSX5dJ+8jtlDbHJpcdJVFZ5OYWm3TIgH78JQpRFu327/Y7wvjbBd
 IVxLeVlnWpsGzkfMRSDfiG7TMHXx+5TX9UQPcf7ir9utiY3yHuHrXNBnAC53AAAdwKB3
 KyRIswilJE55F4igI12cXaKH6YJeDMelE2CwqYzFvCy2Hjm5WK6wxYiodkfj8aPH7Giy
 fW9Kknhfj+NCiWu66L8Ri2y4hD8yctoSS/xF7YnlbpZpP95h5ugZLAI2woyUniY+1V4P
 G2gg==
X-Gm-Message-State: AOAM5319whN7+sytjbqo/lfyCmpsDvlkVOsEjqpPifHbNv0smcC88pNW
 KFwQ9K6HDy5YVWLf5UNvd+A51g==
X-Google-Smtp-Source: ABdhPJxeQRLHZcMHW/NCbd5wgZjZsS3uM0SZ4vXhqvfcN5sXlVLlJw3Qn4ZivNyoRh2WgL5zqR2gVQ==
X-Received: by 2002:a19:c78d:: with SMTP id x135mr14300719lff.82.1593590345244; 
 Wed, 01 Jul 2020 00:59:05 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id x64sm1755387lff.14.2020.07.01.00.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 00:59:04 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 78DDF101196; Wed,  1 Jul 2020 10:59:02 +0300 (+03)
Date: Wed, 1 Jul 2020 10:59:02 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: James Jones <jajones@nvidia.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200701075902.hhmaskxtjsm4bcx7@box>
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
 <20200701075719.p7h5zypdtlhqxtgv@box>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="rpljboisfrorpli6"
Content-Disposition: inline
In-Reply-To: <20200701075719.p7h5zypdtlhqxtgv@box>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rpljboisfrorpli6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2020 at 10:57:19AM +0300, Kirill A. Shutemov wrote:
> On Tue, Jun 30, 2020 at 09:40:19PM -0700, James Jones wrote:
> > This implies something is trying to use one of the old
> > DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK format modifiers with DRM-KMS without
> > first checking whether it is supported by the kernel.  I had tried to force
> > an Xorg+Mesa stack without my userspace patches to hit this error when
> > testing, but must have missed some permutation.  If the stalled Mesa patches
> > go in, this would stop happening of course, but those were held up for a
> > long time in review, and are now waiting on me to make some modifications.
> > 
> > Are you using the modesetting driver in X? If so, with glamor I presume?
> 
> Yes and yes. I attached Xorg.log.

Attached now.
-- 
 Kirill A. Shutemov

--rpljboisfrorpli6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="Xorg.0.log"

[    42.835] 
X.Org X Server 1.20.8
X Protocol Version 11, Revision 0
[    42.835] Build Operating System: Linux 5.7.0-00002-g7fe3a385103d x86_64 Gentoo
[    42.835] Current Operating System: Linux box 5.7.0-rc2-01340-gfa4f4c213f5f #49 SMP PREEMPT Wed Jul 1 10:44:16 +03 2020 x86_64
[    42.835] Kernel command line: root=/dev/mapper/box-root dolvm rw rootfstype=ext4 drm.debug=0xf
[    42.836] Build Date: 16 June 2020  09:51:54PM
[    42.836]  
[    42.836] Current version of pixman: 0.40.0
[    42.836] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[    42.836] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    42.837] (==) Log file: "/var/log/Xorg.0.log", Time: Wed Jul  1 10:46:48 2020
[    42.840] (==) Using config directory: "/etc/X11/xorg.conf.d"
[    42.840] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    42.841] (==) No Layout section.  Using the first Screen section.
[    42.841] (==) No screen section available. Using defaults.
[    42.841] (**) |-->Screen "Default Screen Section" (0)
[    42.841] (**) |   |-->Monitor "<default monitor>"
[    42.842] (==) No device specified for screen "Default Screen Section".
	Using the first device section listed.
[    42.842] (**) |   |-->Device "Device0"
[    42.842] (==) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
[    42.842] (==) Automatically adding devices
[    42.842] (==) Automatically enabling devices
[    42.842] (==) Automatically adding GPU devices
[    42.842] (==) Max clients allowed: 256, resource mask: 0x1fffff
[    42.842] (WW) The directory "/usr/share/fonts/misc/" does not exist.
[    42.842] 	Entry deleted from font path.
[    42.842] (WW) The directory "/usr/share/fonts/TTF/" does not exist.
[    42.842] 	Entry deleted from font path.
[    42.842] (WW) The directory "/usr/share/fonts/OTF/" does not exist.
[    42.842] 	Entry deleted from font path.
[    42.842] (WW) The directory "/usr/share/fonts/Type1/" does not exist.
[    42.842] 	Entry deleted from font path.
[    42.842] (WW) The directory "/usr/share/fonts/100dpi/" does not exist.
[    42.842] 	Entry deleted from font path.
[    42.842] (WW) The directory "/usr/share/fonts/75dpi/" does not exist.
[    42.842] 	Entry deleted from font path.
[    42.842] (==) FontPath set to:
	
[    42.842] (==) ModulePath set to "/usr/lib64/xorg/modules"
[    42.842] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[    42.842] (II) Loader magic: 0x563dfdb59c40
[    42.842] (II) Module ABI versions:
[    42.842] 	X.Org ANSI C Emulation: 0.4
[    42.842] 	X.Org Video Driver: 24.1
[    42.842] 	X.Org XInput driver : 24.1
[    42.843] 	X.Org Server Extension : 10.0
[    42.843] (II) xfree86: Adding drm device (/dev/dri/card0)
[    42.899] (--) PCI:*(101@0:0:0) 10de:1b80:1458:3730 rev 161, Mem @ 0xd7000000/16777216, 0xc0000000/268435456, 0xd0000000/33554432, I/O @ 0x0000b000/128, BIOS @ 0x????????/131072
[    42.899] (II) LoadModule: "glx"
[    42.903] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[    42.913] (II) Module glx: vendor="X.Org Foundation"
[    42.913] 	compiled for 1.20.8, module version = 1.0.0
[    42.913] 	ABI class: X.Org Server Extension, version 10.0
[    42.913] (II) LoadModule: "modesetting"
[    42.914] (II) Loading /usr/lib64/xorg/modules/drivers/modesetting_drv.so
[    42.915] (II) Module modesetting: vendor="X.Org Foundation"
[    42.915] 	compiled for 1.20.8, module version = 1.20.8
[    42.915] 	Module class: X.Org Video Driver
[    42.915] 	ABI class: X.Org Video Driver, version 24.1
[    42.915] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[    42.916] (--) using VT number 7

[    42.921] (II) modeset(0): using drv /dev/dri/card0
[    42.922] (II) modeset(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
[    42.922] (==) modeset(0): Depth 24, (==) framebuffer bpp 32
[    42.922] (==) modeset(0): RGB weight 888
[    42.922] (==) modeset(0): Default visual is TrueColor
[    42.922] (II) Loading sub module "glamoregl"
[    42.922] (II) LoadModule: "glamoregl"
[    42.925] (II) Loading /usr/lib64/xorg/modules/libglamoregl.so
[    42.942] (II) Module glamoregl: vendor="X.Org Foundation"
[    42.942] 	compiled for 1.20.8, module version = 1.0.1
[    42.942] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    43.263] (II) modeset(0): glamor X acceleration enabled on NV134
[    43.263] (II) modeset(0): glamor initialized
[    43.265] (II) modeset(0): Output DVI-D-1 has no monitor section
[    43.317] (II) modeset(0): Output DP-1 has no monitor section
[    43.370] (II) modeset(0): Output DP-2 has no monitor section
[    43.372] (II) modeset(0): Output HDMI-1 has no monitor section
[    43.373] (II) modeset(0): Output DP-3 has no monitor section
[    43.373] (II) modeset(0): Output DP-3-8 has no monitor section
[    43.374] (II) modeset(0): Output DP-3-9 has no monitor section
[    43.375] (II) modeset(0): EDID for output DVI-D-1
[    43.427] (II) modeset(0): EDID for output DP-1
[    43.480] (II) modeset(0): EDID for output DP-2
[    43.482] (II) modeset(0): EDID for output HDMI-1
[    43.483] (II) modeset(0): EDID for output DP-3
[    43.483] (II) modeset(0): EDID for output DP-3-8
[    43.483] (II) modeset(0): Manufacturer: DEL  Model: 409c  Serial#: 808857676
[    43.483] (II) modeset(0): Year: 2014  Week: 12
[    43.483] (II) modeset(0): EDID Version: 1.4
[    43.483] (II) modeset(0): Digital Display Input
[    43.483] (II) modeset(0): 10 bits per channel
[    43.483] (II) modeset(0): Digital interface is DisplayPort
[    43.483] (II) modeset(0): Max Image Size [cm]: horiz.: 53  vert.: 30
[    43.483] (II) modeset(0): Gamma: 2.20
[    43.483] (II) modeset(0): DPMS capabilities: Off
[    43.483] (II) modeset(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 YCrCb 4:2:2
[    43.483] (II) modeset(0): First detailed timing is preferred mode
[    43.483] (II) modeset(0): Preferred mode is native pixel format and refresh rate
[    43.483] (II) modeset(0): redX: 0.680 redY: 0.310   greenX: 0.210 greenY: 0.700
[    43.483] (II) modeset(0): blueX: 0.147 blueY: 0.054   whiteX: 0.313 whiteY: 0.329
[    43.483] (II) modeset(0): Manufacturer's mask: 0
[    43.483] (II) modeset(0): Supported detailed timing:
[    43.483] (II) modeset(0): clock: 277.2 MHz   Image Size:  527 x 296 mm
[    43.483] (II) modeset(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end 2080 h_border: 0
[    43.483] (II) modeset(0): v_active: 2160  v_sync: 2163  v_sync_end 2173 v_blanking: 2222 v_border: 0
[    43.483] (II) modeset(0): Serial No: WWRHC43M060L
[    43.483] (II) modeset(0): Monitor name: DELL UP2414Q
[    43.483] (II) modeset(0): Ranges: V min: 29 V max: 75 Hz, H min: 31 H max: 140 kHz, PixClock max 305 MHz
[    43.483] (II) modeset(0): Number of EDID sections to follow: 1
[    43.483] (II) modeset(0): EDID (in hex):
[    43.483] (II) modeset(0): 	00ffffffffffff0010ac9c404c303630
[    43.483] (II) modeset(0): 	0c180104b5351e783a1df5ae4f35b325
[    43.483] (II) modeset(0): 	0d505400000001010101010101010101
[    43.483] (II) modeset(0): 	0101010101014d6c80a070703e803020
[    43.483] (II) modeset(0): 	3a000f282100001a000000ff00575752
[    43.483] (II) modeset(0): 	484334334d3036304c0a000000fc0044
[    43.483] (II) modeset(0): 	454c4c20555032343134510a000000fd
[    43.483] (II) modeset(0): 	001d4b1f8c1e000a202020202020012e
[    43.483] (II) modeset(0): 	7012790000120016821010007f076f08
[    43.483] (II) modeset(0): 	000000000044454c9c404c3036300000
[    43.483] (II) modeset(0): 	00000000000000000000000000000000
[    43.483] (II) modeset(0): 	00000000000000000000000000000000
[    43.483] (II) modeset(0): 	00000000000000000000000000000000
[    43.483] (II) modeset(0): 	00000000000000000000000000000000
[    43.483] (II) modeset(0): 	00000000000000000000000000000000
[    43.483] (II) modeset(0): 	00000000000000000000000000001b90
[    43.483] (II) modeset(0): Not using default mode "1920x1080" (bad mode clock/interlace/doublescan)
[    43.483] (II) modeset(0): Not using default mode "2048x1152" (bad mode clock/interlace/doublescan)
[    43.483] (II) modeset(0): Printing probed modes for output DP-3-8
[    43.483] (II) modeset(0): Modeline "1920x2160"x60.0  277.25  1920 1968 2000 2080  2160 2163 2173 2222 +hsync -vsync (133.3 kHz eP)
[    43.483] (II) modeset(0): Modeline "2048x1536"x60.0  266.95  2048 2200 2424 2800  1536 1537 1540 1589 -hsync +vsync (95.3 kHz d)
[    43.483] (II) modeset(0): Modeline "1920x1440"x60.0  234.00  1920 2048 2256 2600  1440 1441 1444 1500 -hsync +vsync (90.0 kHz d)
[    43.483] (II) modeset(0): Modeline "1856x1392"x60.0  218.30  1856 1952 2176 2528  1392 1393 1396 1439 -hsync +vsync (86.4 kHz d)
[    43.483] (II) modeset(0): Modeline "1792x1344"x60.0  204.80  1792 1920 2120 2448  1344 1345 1348 1394 -hsync +vsync (83.7 kHz d)
[    43.483] (II) modeset(0): Modeline "2048x1152"x60.0  302.50  2048 2072 2088 2128  1152 1153 1156 1185 doublescan +hsync -vsync (142.2 kHz d)
[    43.483] (II) modeset(0): Modeline "2048x1152"x59.9  197.00  2048 2184 2400 2752  1152 1155 1160 1195 -hsync +vsync (71.6 kHz d)
[    43.483] (II) modeset(0): Modeline "2048x1152"x59.9  156.75  2048 2096 2128 2208  1152 1155 1160 1185 +hsync -vsync (71.0 kHz d)
[    43.483] (II) modeset(0): Modeline "1920x1200"x59.9  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync (74.6 kHz d)
[    43.483] (II) modeset(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz d)
[    43.483] (II) modeset(0): Modeline "1920x1080"x60.0  266.50  1920 1944 1960 2000  1080 1081 1084 1111 doublescan +hsync -vsync (133.2 kHz d)
[    43.483] (II) modeset(0): Modeline "1920x1080"x60.0  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync (67.2 kHz d)
[    43.483] (II) modeset(0): Modeline "1920x1080"x59.9  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz d)
[    43.483] (II) modeset(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz d)
[    43.483] (II) modeset(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz d)
[    43.483] (II) modeset(0): Modeline "1680x1050"x59.9  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz d)
[    43.483] (II) modeset(0): Modeline "1400x1050"x60.0  122.00  1400 1488 1640 1880  1050 1052 1064 1082 +hsync +vsync (64.9 kHz d)
[    43.483] (II) modeset(0): Modeline "1600x900"x60.0  246.00  1600 1728 1900 2200  900 901 904 932 doublescan -hsync +vsync (111.8 kHz d)
[    43.483] (II) modeset(0): Modeline "1600x900"x59.9  186.50  1600 1624 1640 1680  900 901 904 926 doublescan +hsync -vsync (111.0 kHz d)
[    43.483] (II) modeset(0): Modeline "1600x900"x59.9  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync (56.0 kHz d)
[    43.483] (II) modeset(0): Modeline "1600x900"x59.8   97.50  1600 1648 1680 1760  900 903 908 926 +hsync -vsync (55.4 kHz d)
[    43.483] (II) modeset(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz d)
[    43.483] (II) modeset(0): Modeline "1400x900"x60.0  103.50  1400 1480 1624 1848  900 903 913 934 -hsync +vsync (56.0 kHz d)
[    43.483] (II) modeset(0): Modeline "1400x900"x59.9   86.50  1400 1448 1480 1560  900 903 913 926 +hsync -vsync (55.4 kHz d)
[    43.483] (II) modeset(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz d)
[    43.483] (II) modeset(0): Modeline "1440x810"x60.0  198.12  1440 1548 1704 1968  810 811 814 839 doublescan -hsync +vsync (100.7 kHz d)
[    43.483] (II) modeset(0): Modeline "1440x810"x60.0  151.88  1440 1464 1480 1520  810 811 814 833 doublescan +hsync -vsync (99.9 kHz d)
[    43.483] (II) modeset(0): Modeline "1368x768"x59.9   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync (47.8 kHz d)
[    43.483] (II) modeset(0): Modeline "1368x768"x59.9   72.25  1368 1416 1448 1528  768 771 781 790 +hsync -vsync (47.3 kHz d)
[    43.484] (II) modeset(0): Modeline "1280x800"x60.0  174.25  1280 1380 1516 1752  800 801 804 829 doublescan -hsync +vsync (99.5 kHz d)
[    43.484] (II) modeset(0): Modeline "1280x800"x60.0  134.25  1280 1304 1320 1360  800 801 804 823 doublescan +hsync -vsync (98.7 kHz d)
[    43.484] (II) modeset(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803 809 831 -hsync +vsync (49.7 kHz d)
[    43.484] (II) modeset(0): Modeline "1280x800"x59.9   71.00  1280 1328 1360 1440  800 803 809 823 +hsync -vsync (49.3 kHz d)
[    43.484] (II) modeset(0): Modeline "1280x720"x60.0  156.12  1280 1376 1512 1744  720 721 724 746 doublescan -hsync +vsync (89.5 kHz d)
[    43.484] (II) modeset(0): Modeline "1280x720"x60.0  120.75  1280 1304 1320 1360  720 721 724 740 doublescan +hsync -vsync (88.8 kHz d)
[    43.484] (II) modeset(0): Modeline "1280x720"x59.9   74.50  1280 1344 1472 1664  720 723 728 748 -hsync +vsync (44.8 kHz d)
[    43.484] (II) modeset(0): Modeline "1280x720"x59.7   63.75  1280 1328 1360 1440  720 723 728 741 +hsync -vsync (44.3 kHz d)
[    43.484] (II) modeset(0): Modeline "1024x768"x60.0  133.47  1024 1100 1212 1400  768 768 770 794 doublescan -hsync +vsync (95.3 kHz d)
[    43.484] (II) modeset(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz d)
[    43.484] (II) modeset(0): Modeline "960x720"x60.0  117.00  960 1024 1128 1300  720 720 722 750 doublescan -hsync +vsync (90.0 kHz d)
[    43.484] (II) modeset(0): Modeline "928x696"x60.1  109.15  928 976 1088 1264  696 696 698 719 doublescan -hsync +vsync (86.4 kHz d)
[    43.484] (II) modeset(0): Modeline "896x672"x60.0  102.40  896 960 1060 1224  672 672 674 697 doublescan -hsync +vsync (83.7 kHz d)
[    43.484] (II) modeset(0): Modeline "1024x576"x60.0   98.50  1024 1092 1200 1376  576 577 580 597 doublescan -hsync +vsync (71.6 kHz d)
[    43.484] (II) modeset(0): Modeline "1024x576"x60.0   78.38  1024 1048 1064 1104  576 577 580 592 doublescan +hsync -vsync (71.0 kHz d)
[    43.484] (II) modeset(0): Modeline "1024x576"x59.9   46.50  1024 1064 1160 1296  576 579 584 599 -hsync +vsync (35.9 kHz d)
[    43.484] (II) modeset(0): Modeline "1024x576"x59.8   42.00  1024 1072 1104 1184  576 579 584 593 +hsync -vsync (35.5 kHz d)
[    43.484] (II) modeset(0): Modeline "960x600"x59.9   96.62  960 1028 1128 1296  600 601 604 622 doublescan -hsync +vsync (74.6 kHz d)
[    43.484] (II) modeset(0): Modeline "960x600"x60.0   77.00  960 984 1000 1040  600 601 604 617 doublescan +hsync -vsync (74.0 kHz d)
[    43.484] (II) modeset(0): Modeline "960x540"x60.0   86.50  960 1024 1124 1288  540 541 544 560 doublescan -hsync +vsync (67.2 kHz d)
[    43.484] (II) modeset(0): Modeline "960x540"x60.0   69.25  960 984 1000 1040  540 541 544 555 doublescan +hsync -vsync (66.6 kHz d)
[    43.484] (II) modeset(0): Modeline "960x540"x59.6   40.75  960 992 1088 1216  540 543 548 562 -hsync +vsync (33.5 kHz d)
[    43.484] (II) modeset(0): Modeline "960x540"x59.8   37.25  960 1008 1040 1120  540 543 548 556 +hsync -vsync (33.3 kHz d)
[    43.484] (II) modeset(0): Modeline "800x600"x60.0   81.00  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (75.0 kHz d)
[    43.484] (II) modeset(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz d)
[    43.484] (II) modeset(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz d)
[    43.484] (II) modeset(0): Modeline "840x525"x60.0   73.12  840 892 980 1120  525 526 529 544 doublescan -hsync +vsync (65.3 kHz d)
[    43.484] (II) modeset(0): Modeline "840x525"x59.9   59.50  840 864 880 920  525 526 529 540 doublescan +hsync -vsync (64.7 kHz d)
[    43.484] (II) modeset(0): Modeline "864x486"x59.9   32.50  864 888 968 1072  486 489 494 506 -hsync +vsync (30.3 kHz d)
[    43.484] (II) modeset(0): Modeline "864x486"x59.6   30.50  864 912 944 1024  486 489 494 500 +hsync -vsync (29.8 kHz d)
[    43.484] (II) modeset(0): Modeline "700x525"x60.0   61.00  700 744 820 940  525 526 532 541 doublescan +hsync +vsync (64.9 kHz d)
[    43.484] (II) modeset(0): Modeline "800x450"x59.9   59.12  800 848 928 1056  450 451 454 467 doublescan -hsync +vsync (56.0 kHz d)
[    43.484] (II) modeset(0): Modeline "800x450"x59.8   48.75  800 824 840 880  450 451 454 463 doublescan +hsync -vsync (55.4 kHz d)
[    43.484] (II) modeset(0): Modeline "640x512"x60.0   54.00  640 664 720 844  512 512 514 533 doublescan +hsync +vsync (64.0 kHz d)
[    43.484] (II) modeset(0): Modeline "700x450"x60.0   51.75  700 740 812 924  450 451 456 467 doublescan -hsync +vsync (56.0 kHz d)
[    43.484] (II) modeset(0): Modeline "700x450"x59.9   43.25  700 724 740 780  450 451 456 463 doublescan +hsync -vsync (55.4 kHz d)
[    43.484] (II) modeset(0): Modeline "640x480"x60.0   54.00  640 688 744 900  480 480 482 500 doublescan +hsync +vsync (60.0 kHz d)
[    43.484] (II) modeset(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz d)
[    43.484] (II) modeset(0): Modeline "720x405"x59.5   22.50  720 744 808 896  405 408 413 422 -hsync +vsync (25.1 kHz d)
[    43.484] (II) modeset(0): Modeline "720x405"x59.0   21.75  720 768 800 880  405 408 413 419 +hsync -vsync (24.7 kHz d)
[    43.484] (II) modeset(0): Modeline "684x384"x59.9   42.62  684 720 788 892  384 385 390 399 doublescan -hsync +vsync (47.8 kHz d)
[    43.484] (II) modeset(0): Modeline "684x384"x59.9   36.12  684 708 724 764  384 385 390 395 doublescan +hsync -vsync (47.3 kHz d)
[    43.484] (II) modeset(0): Modeline "640x400"x59.9   41.75  640 676 740 840  400 401 404 415 doublescan -hsync +vsync (49.7 kHz d)
[    43.484] (II) modeset(0): Modeline "640x400"x60.0   35.50  640 664 680 720  400 401 404 411 doublescan +hsync -vsync (49.3 kHz d)
[    43.484] (II) modeset(0): Modeline "640x360"x59.9   37.25  640 672 736 832  360 361 364 374 doublescan -hsync +vsync (44.8 kHz d)
[    43.484] (II) modeset(0): Modeline "640x360"x59.8   31.88  640 664 680 720  360 361 364 370 doublescan +hsync -vsync (44.3 kHz d)
[    43.484] (II) modeset(0): Modeline "640x360"x59.8   18.00  640 664 720 800  360 363 368 376 -hsync +vsync (22.5 kHz d)
[    43.484] (II) modeset(0): Modeline "640x360"x59.3   17.75  640 688 720 800  360 363 368 374 +hsync -vsync (22.2 kHz d)
[    43.484] (II) modeset(0): Modeline "512x384"x60.0   32.50  512 524 592 672  384 385 388 403 doublescan -hsync -vsync (48.4 kHz d)
[    43.484] (II) modeset(0): Modeline "512x288"x60.0   23.25  512 532 580 648  288 289 292 299 doublescan -hsync +vsync (35.9 kHz d)
[    43.484] (II) modeset(0): Modeline "512x288"x59.9   21.00  512 536 552 592  288 289 292 296 doublescan +hsync -vsync (35.5 kHz d)
[    43.484] (II) modeset(0): Modeline "480x270"x59.6   20.38  480 496 544 608  270 271 274 281 doublescan -hsync +vsync (33.5 kHz d)
[    43.484] (II) modeset(0): Modeline "480x270"x59.8   18.62  480 504 520 560  270 271 274 278 doublescan +hsync -vsync (33.3 kHz d)
[    43.484] (II) modeset(0): Modeline "400x300"x60.3   20.00  400 420 484 528  300 300 302 314 doublescan +hsync +vsync (37.9 kHz d)
[    43.484] (II) modeset(0): Modeline "400x300"x56.3   18.00  400 412 448 512  300 300 301 312 doublescan +hsync +vsync (35.2 kHz d)
[    43.484] (II) modeset(0): Modeline "432x243"x59.9   16.25  432 444 484 536  243 244 247 253 doublescan -hsync +vsync (30.3 kHz d)
[    43.484] (II) modeset(0): Modeline "432x243"x59.6   15.25  432 456 472 512  243 244 247 250 doublescan +hsync -vsync (29.8 kHz d)
[    43.484] (II) modeset(0): Modeline "320x240"x60.1   12.59  320 328 376 400  240 245 246 262 doublescan -hsync -vsync (31.5 kHz d)
[    43.484] (II) modeset(0): Modeline "360x202"x59.5   11.25  360 372 404 448  202 204 206 211 doublescan -hsync +vsync (25.1 kHz d)
[    43.484] (II) modeset(0): Modeline "360x202"x59.1   10.88  360 384 400 440  202 204 206 209 doublescan +hsync -vsync (24.7 kHz d)
[    43.484] (II) modeset(0): Modeline "320x180"x59.8    9.00  320 332 360 400  180 181 184 188 doublescan -hsync +vsync (22.5 kHz d)
[    43.484] (II) modeset(0): Modeline "320x180"x59.3    8.88  320 344 360 400  180 181 184 187 doublescan +hsync -vsync (22.2 kHz d)
[    43.484] (II) modeset(0): EDID for output DP-3-9
[    43.484] (II) modeset(0): Manufacturer: DEL  Model: 409c  Serial#: 808857676
[    43.484] (II) modeset(0): Year: 2014  Week: 12
[    43.484] (II) modeset(0): EDID Version: 1.4
[    43.484] (II) modeset(0): Digital Display Input
[    43.484] (II) modeset(0): 10 bits per channel
[    43.484] (II) modeset(0): Digital interface is DisplayPort
[    43.484] (II) modeset(0): Max Image Size [cm]: horiz.: 53  vert.: 30
[    43.484] (II) modeset(0): Gamma: 2.20
[    43.484] (II) modeset(0): DPMS capabilities: Off
[    43.484] (II) modeset(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 YCrCb 4:2:2
[    43.484] (II) modeset(0): First detailed timing is preferred mode
[    43.485] (II) modeset(0): Preferred mode is native pixel format and refresh rate
[    43.485] (II) modeset(0): redX: 0.680 redY: 0.310   greenX: 0.210 greenY: 0.700
[    43.485] (II) modeset(0): blueX: 0.147 blueY: 0.054   whiteX: 0.313 whiteY: 0.329
[    43.485] (II) modeset(0): Supported established timings:
[    43.485] (II) modeset(0): 720x400@70Hz
[    43.485] (II) modeset(0): 640x480@60Hz
[    43.485] (II) modeset(0): 640x480@75Hz
[    43.485] (II) modeset(0): 800x600@60Hz
[    43.485] (II) modeset(0): 800x600@75Hz
[    43.485] (II) modeset(0): 1024x768@60Hz
[    43.485] (II) modeset(0): 1024x768@75Hz
[    43.485] (II) modeset(0): 1280x1024@75Hz
[    43.485] (II) modeset(0): Manufacturer's mask: 0
[    43.485] (II) modeset(0): Supported standard timings:
[    43.485] (II) modeset(0): #0: hsize: 1280  vsize 800  refresh: 60  vid: 129
[    43.485] (II) modeset(0): #1: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[    43.485] (II) modeset(0): #2: hsize: 1920  vsize 1200  refresh: 60  vid: 209
[    43.485] (II) modeset(0): #3: hsize: 1152  vsize 864  refresh: 75  vid: 20337
[    43.485] (II) modeset(0): #4: hsize: 1600  vsize 1200  refresh: 60  vid: 16553
[    43.485] (II) modeset(0): #5: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
[    43.485] (II) modeset(0): #6: hsize: 1920  vsize 1080  refresh: 60  vid: 49361
[    43.485] (II) modeset(0): Supported detailed timing:
[    43.485] (II) modeset(0): clock: 277.2 MHz   Image Size:  527 x 296 mm
[    43.485] (II) modeset(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end 2080 h_border: 0
[    43.485] (II) modeset(0): v_active: 2160  v_sync: 2163  v_sync_end 2173 v_blanking: 2222 v_border: 0
[    43.485] (II) modeset(0): Serial No: WWRHC43M060L
[    43.485] (II) modeset(0): Monitor name: DELL UP2414Q
[    43.485] (II) modeset(0): Ranges: V min: 29 V max: 75 Hz, H min: 31 H max: 140 kHz, PixClock max 305 MHz
[    43.485] (II) modeset(0): Number of EDID sections to follow: 1
[    43.485] (II) modeset(0): EDID (in hex):
[    43.485] (II) modeset(0): 	00ffffffffffff0010ac9c404c303630
[    43.485] (II) modeset(0): 	0c180104b5351e783a1df5ae4f35b325
[    43.485] (II) modeset(0): 	0d5054a54b008100b300d100714fa940
[    43.485] (II) modeset(0): 	8180d1c001014d6c80a070703e803020
[    43.485] (II) modeset(0): 	3a000f282100001a000000ff00575752
[    43.485] (II) modeset(0): 	484334334d3036304c0a000000fc0044
[    43.485] (II) modeset(0): 	454c4c20555032343134510a000000fd
[    43.485] (II) modeset(0): 	001d4b1f8c1e000a202020202020010c
[    43.485] (II) modeset(0): 	7012790000120016821000007f076f08
[    43.485] (II) modeset(0): 	000000000044454c9c404c3036300000
[    43.485] (II) modeset(0): 	00000000000000000000000000000000
[    43.485] (II) modeset(0): 	00000000000000000000000000000000
[    43.485] (II) modeset(0): 	00000000000000000000000000000000
[    43.485] (II) modeset(0): 	00000000000000000000000000000000
[    43.485] (II) modeset(0): 	00000000000000000000000000000000
[    43.485] (II) modeset(0): 	00000000000000000000000000002b90
[    43.485] (II) modeset(0): Not using default mode "2048x1536" (bad mode clock/interlace/doublescan)
[    43.485] (II) modeset(0): Not using default mode "1920x1080" (bad mode clock/interlace/doublescan)
[    43.485] (II) modeset(0): Not using default mode "2048x1152" (bad mode clock/interlace/doublescan)
[    43.485] (II) modeset(0): Printing probed modes for output DP-3-9
[    43.485] (II) modeset(0): Modeline "1920x2160"x60.0  277.25  1920 1968 2000 2080  2160 2163 2173 2222 +hsync -vsync (133.3 kHz eP)
[    43.485] (II) modeset(0): Modeline "2048x1536"x60.0  266.95  2048 2200 2424 2800  1536 1537 1540 1589 -hsync +vsync (95.3 kHz d)
[    43.485] (II) modeset(0): Modeline "1920x1440"x75.0  297.00  1920 2064 2288 2640  1440 1441 1444 1500 -hsync +vsync (112.5 kHz d)
[    43.485] (II) modeset(0): Modeline "1920x1440"x60.0  234.00  1920 2048 2256 2600  1440 1441 1444 1500 -hsync +vsync (90.0 kHz d)
[    43.485] (II) modeset(0): Modeline "1856x1392"x75.0  288.00  1856 1984 2208 2560  1392 1393 1396 1500 -hsync +vsync (112.5 kHz d)
[    43.485] (II) modeset(0): Modeline "1856x1392"x60.0  218.30  1856 1952 2176 2528  1392 1393 1396 1439 -hsync +vsync (86.4 kHz d)
[    43.485] (II) modeset(0): Modeline "1792x1344"x75.0  261.00  1792 1888 2104 2456  1344 1345 1348 1417 -hsync +vsync (106.3 kHz d)
[    43.485] (II) modeset(0): Modeline "1792x1344"x60.0  204.80  1792 1920 2120 2448  1344 1345 1348 1394 -hsync +vsync (83.7 kHz d)
[    43.485] (II) modeset(0): Modeline "2048x1152"x60.0  302.50  2048 2072 2088 2128  1152 1153 1156 1185 doublescan +hsync -vsync (142.2 kHz d)
[    43.485] (II) modeset(0): Modeline "2048x1152"x59.9  197.00  2048 2184 2400 2752  1152 1155 1160 1195 -hsync +vsync (71.6 kHz d)
[    43.485] (II) modeset(0): Modeline "2048x1152"x59.9  156.75  2048 2096 2128 2208  1152 1155 1160 1185 +hsync -vsync (71.0 kHz d)
[    43.485] (II) modeset(0): Modeline "1920x1200"x59.9  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync (74.6 kHz e)
[    43.485] (II) modeset(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz d)
[    43.485] (II) modeset(0): Modeline "1920x1080"x60.0  266.50  1920 1944 1960 2000  1080 1081 1084 1111 doublescan +hsync -vsync (133.2 kHz d)
[    43.485] (II) modeset(0): Modeline "1920x1080"x60.0  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync (67.2 kHz d)
[    43.485] (II) modeset(0): Modeline "1920x1080"x60.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 -hsync -vsync (67.5 kHz e)
[    43.485] (II) modeset(0): Modeline "1920x1080"x59.9  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz d)
[    43.485] (II) modeset(0): Modeline "1600x1200"x75.0  202.50  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (93.8 kHz d)
[    43.485] (II) modeset(0): Modeline "1600x1200"x70.0  189.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (87.5 kHz d)
[    43.485] (II) modeset(0): Modeline "1600x1200"x65.0  175.50  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (81.2 kHz d)
[    43.485] (II) modeset(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    43.485] (II) modeset(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz e)
[    43.485] (II) modeset(0): Modeline "1680x1050"x59.9  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz d)
[    43.485] (II) modeset(0): Modeline "1400x1050"x74.8  155.80  1400 1464 1784 1912  1050 1052 1064 1090 +hsync +vsync (81.5 kHz d)
[    43.485] (II) modeset(0): Modeline "1400x1050"x60.0  122.00  1400 1488 1640 1880  1050 1052 1064 1082 +hsync +vsync (64.9 kHz d)
[    43.485] (II) modeset(0): Modeline "1600x900"x60.0  246.00  1600 1728 1900 2200  900 901 904 932 doublescan -hsync +vsync (111.8 kHz d)
[    43.485] (II) modeset(0): Modeline "1600x900"x59.9  186.50  1600 1624 1640 1680  900 901 904 926 doublescan +hsync -vsync (111.0 kHz d)
[    43.485] (II) modeset(0): Modeline "1600x900"x59.9  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync (56.0 kHz d)
[    43.485] (II) modeset(0): Modeline "1600x900"x59.8   97.50  1600 1648 1680 1760  900 903 908 926 +hsync -vsync (55.4 kHz d)
[    43.485] (II) modeset(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    43.485] (II) modeset(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    43.485] (II) modeset(0): Modeline "1400x900"x60.0  103.50  1400 1480 1624 1848  900 903 913 934 -hsync +vsync (56.0 kHz d)
[    43.486] (II) modeset(0): Modeline "1400x900"x59.9   86.50  1400 1448 1480 1560  900 903 913 926 +hsync -vsync (55.4 kHz d)
[    43.486] (II) modeset(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz d)
[    43.486] (II) modeset(0): Modeline "1440x810"x60.0  198.12  1440 1548 1704 1968  810 811 814 839 doublescan -hsync +vsync (100.7 kHz d)
[    43.486] (II) modeset(0): Modeline "1440x810"x60.0  151.88  1440 1464 1480 1520  810 811 814 833 doublescan +hsync -vsync (99.9 kHz d)
[    43.486] (II) modeset(0): Modeline "1368x768"x59.9   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync (47.8 kHz d)
[    43.486] (II) modeset(0): Modeline "1368x768"x59.9   72.25  1368 1416 1448 1528  768 771 781 790 +hsync -vsync (47.3 kHz d)
[    43.486] (II) modeset(0): Modeline "1280x800"x60.0  174.25  1280 1380 1516 1752  800 801 804 829 doublescan -hsync +vsync (99.5 kHz d)
[    43.486] (II) modeset(0): Modeline "1280x800"x60.0  134.25  1280 1304 1320 1360  800 801 804 823 doublescan +hsync -vsync (98.7 kHz d)
[    43.486] (II) modeset(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803 809 831 -hsync +vsync (49.7 kHz e)
[    43.486] (II) modeset(0): Modeline "1280x800"x59.9   71.00  1280 1328 1360 1440  800 803 809 823 +hsync -vsync (49.3 kHz d)
[    43.486] (II) modeset(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    43.486] (II) modeset(0): Modeline "1280x720"x60.0  156.12  1280 1376 1512 1744  720 721 724 746 doublescan -hsync +vsync (89.5 kHz d)
[    43.486] (II) modeset(0): Modeline "1280x720"x60.0  120.75  1280 1304 1320 1360  720 721 724 740 doublescan +hsync -vsync (88.8 kHz d)
[    43.486] (II) modeset(0): Modeline "1280x720"x59.9   74.50  1280 1344 1472 1664  720 723 728 748 -hsync +vsync (44.8 kHz d)
[    43.486] (II) modeset(0): Modeline "1280x720"x59.7   63.75  1280 1328 1360 1440  720 723 728 741 +hsync -vsync (44.3 kHz d)
[    43.486] (II) modeset(0): Modeline "1024x768"x75.0  170.24  1024 1108 1220 1416  768 768 770 801 doublescan -hsync +vsync (120.2 kHz d)
[    43.486] (II) modeset(0): Modeline "1024x768"x60.0  133.47  1024 1100 1212 1400  768 768 770 794 doublescan -hsync +vsync (95.3 kHz d)
[    43.486] (II) modeset(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    43.486] (II) modeset(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz d)
[    43.486] (II) modeset(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    43.486] (II) modeset(0): Modeline "960x720"x75.0  148.50  960 1032 1144 1320  720 720 722 750 doublescan -hsync +vsync (112.5 kHz d)
[    43.486] (II) modeset(0): Modeline "960x720"x60.0  117.00  960 1024 1128 1300  720 720 722 750 doublescan -hsync +vsync (90.0 kHz d)
[    43.486] (II) modeset(0): Modeline "928x696"x75.0  144.00  928 992 1104 1280  696 696 698 750 doublescan -hsync +vsync (112.5 kHz d)
[    43.486] (II) modeset(0): Modeline "928x696"x60.1  109.15  928 976 1088 1264  696 696 698 719 doublescan -hsync +vsync (86.4 kHz d)
[    43.486] (II) modeset(0): Modeline "896x672"x75.0  130.50  896 944 1052 1228  672 672 674 708 doublescan -hsync +vsync (106.3 kHz d)
[    43.486] (II) modeset(0): Modeline "896x672"x60.0  102.40  896 960 1060 1224  672 672 674 697 doublescan -hsync +vsync (83.7 kHz d)
[    43.486] (II) modeset(0): Modeline "1024x576"x60.0   98.50  1024 1092 1200 1376  576 577 580 597 doublescan -hsync +vsync (71.6 kHz d)
[    43.486] (II) modeset(0): Modeline "1024x576"x60.0   78.38  1024 1048 1064 1104  576 577 580 592 doublescan +hsync -vsync (71.0 kHz d)
[    43.486] (II) modeset(0): Modeline "1024x576"x59.9   46.50  1024 1064 1160 1296  576 579 584 599 -hsync +vsync (35.9 kHz d)
[    43.486] (II) modeset(0): Modeline "1024x576"x59.8   42.00  1024 1072 1104 1184  576 579 584 593 +hsync -vsync (35.5 kHz d)
[    43.486] (II) modeset(0): Modeline "960x600"x59.9   96.62  960 1028 1128 1296  600 601 604 622 doublescan -hsync +vsync (74.6 kHz d)
[    43.486] (II) modeset(0): Modeline "960x600"x60.0   77.00  960 984 1000 1040  600 601 604 617 doublescan +hsync -vsync (74.0 kHz d)
[    43.486] (II) modeset(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz d)
[    43.486] (II) modeset(0): Modeline "960x540"x60.0   86.50  960 1024 1124 1288  540 541 544 560 doublescan -hsync +vsync (67.2 kHz d)
[    43.486] (II) modeset(0): Modeline "960x540"x60.0   69.25  960 984 1000 1040  540 541 544 555 doublescan +hsync -vsync (66.6 kHz d)
[    43.486] (II) modeset(0): Modeline "960x540"x59.6   40.75  960 992 1088 1216  540 543 548 562 -hsync +vsync (33.5 kHz d)
[    43.486] (II) modeset(0): Modeline "960x540"x59.8   37.25  960 1008 1040 1120  540 543 548 556 +hsync -vsync (33.3 kHz d)
[    43.486] (II) modeset(0): Modeline "800x600"x75.0  101.25  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (93.8 kHz d)
[    43.486] (II) modeset(0): Modeline "800x600"x70.0   94.50  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (87.5 kHz d)
[    43.486] (II) modeset(0): Modeline "800x600"x65.0   87.75  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (81.2 kHz d)
[    43.486] (II) modeset(0): Modeline "800x600"x60.0   81.00  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (75.0 kHz d)
[    43.486] (II) modeset(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz d)
[    43.486] (II) modeset(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    43.486] (II) modeset(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    43.486] (II) modeset(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz d)
[    43.486] (II) modeset(0): Modeline "840x525"x60.0   73.12  840 892 980 1120  525 526 529 544 doublescan -hsync +vsync (65.3 kHz d)
[    43.486] (II) modeset(0): Modeline "840x525"x59.9   59.50  840 864 880 920  525 526 529 540 doublescan +hsync -vsync (64.7 kHz d)
[    43.486] (II) modeset(0): Modeline "864x486"x59.9   32.50  864 888 968 1072  486 489 494 506 -hsync +vsync (30.3 kHz d)
[    43.486] (II) modeset(0): Modeline "864x486"x59.6   30.50  864 912 944 1024  486 489 494 500 +hsync -vsync (29.8 kHz d)
[    43.486] (II) modeset(0): Modeline "700x525"x74.8   77.90  700 732 892 956  525 526 532 545 doublescan +hsync +vsync (81.5 kHz d)
[    43.486] (II) modeset(0): Modeline "700x525"x60.0   61.00  700 744 820 940  525 526 532 541 doublescan +hsync +vsync (64.9 kHz d)
[    43.486] (II) modeset(0): Modeline "800x450"x59.9   59.12  800 848 928 1056  450 451 454 467 doublescan -hsync +vsync (56.0 kHz d)
[    43.486] (II) modeset(0): Modeline "800x450"x59.8   48.75  800 824 840 880  450 451 454 463 doublescan +hsync -vsync (55.4 kHz d)
[    43.486] (II) modeset(0): Modeline "640x512"x75.0   67.50  640 648 720 844  512 512 514 533 doublescan +hsync +vsync (80.0 kHz d)
[    43.486] (II) modeset(0): Modeline "640x512"x60.0   54.00  640 664 720 844  512 512 514 533 doublescan +hsync +vsync (64.0 kHz d)
[    43.486] (II) modeset(0): Modeline "700x450"x60.0   51.75  700 740 812 924  450 451 456 467 doublescan -hsync +vsync (56.0 kHz d)
[    43.486] (II) modeset(0): Modeline "700x450"x59.9   43.25  700 724 740 780  450 451 456 463 doublescan +hsync -vsync (55.4 kHz d)
[    43.486] (II) modeset(0): Modeline "640x480"x60.0   54.00  640 688 744 900  480 480 482 500 doublescan +hsync +vsync (60.0 kHz d)
[    43.486] (II) modeset(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[    43.486] (II) modeset(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz d)
[    43.486] (II) modeset(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz d)
[    43.486] (II) modeset(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    43.486] (II) modeset(0): Modeline "720x405"x59.5   22.50  720 744 808 896  405 408 413 422 -hsync +vsync (25.1 kHz d)
[    43.486] (II) modeset(0): Modeline "720x405"x59.0   21.75  720 768 800 880  405 408 413 419 +hsync -vsync (24.7 kHz d)
[    43.486] (II) modeset(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[    43.486] (II) modeset(0): Modeline "684x384"x59.9   42.62  684 720 788 892  384 385 390 399 doublescan -hsync +vsync (47.8 kHz d)
[    43.486] (II) modeset(0): Modeline "684x384"x59.9   36.12  684 708 724 764  384 385 390 395 doublescan +hsync -vsync (47.3 kHz d)
[    43.486] (II) modeset(0): Modeline "640x400"x59.9   41.75  640 676 740 840  400 401 404 415 doublescan -hsync +vsync (49.7 kHz d)
[    43.486] (II) modeset(0): Modeline "640x400"x60.0   35.50  640 664 680 720  400 401 404 411 doublescan +hsync -vsync (49.3 kHz d)
[    43.486] (II) modeset(0): Modeline "576x432"x75.0   54.00  576 608 672 800  432 432 434 450 doublescan +hsync +vsync (67.5 kHz d)
[    43.486] (II) modeset(0): Modeline "640x360"x59.9   37.25  640 672 736 832  360 361 364 374 doublescan -hsync +vsync (44.8 kHz d)
[    43.486] (II) modeset(0): Modeline "640x360"x59.8   31.88  640 664 680 720  360 361 364 370 doublescan +hsync -vsync (44.3 kHz d)
[    43.486] (II) modeset(0): Modeline "640x360"x59.8   18.00  640 664 720 800  360 363 368 376 -hsync +vsync (22.5 kHz d)
[    43.486] (II) modeset(0): Modeline "640x360"x59.3   17.75  640 688 720 800  360 363 368 374 +hsync -vsync (22.2 kHz d)
[    43.486] (II) modeset(0): Modeline "512x384"x75.0   39.38  512 520 568 656  384 384 386 400 doublescan +hsync +vsync (60.0 kHz d)
[    43.486] (II) modeset(0): Modeline "512x384"x70.1   37.50  512 524 592 664  384 385 388 403 doublescan -hsync -vsync (56.5 kHz d)
[    43.486] (II) modeset(0): Modeline "512x384"x60.0   32.50  512 524 592 672  384 385 388 403 doublescan -hsync -vsync (48.4 kHz d)
[    43.486] (II) modeset(0): Modeline "512x288"x60.0   23.25  512 532 580 648  288 289 292 299 doublescan -hsync +vsync (35.9 kHz d)
[    43.486] (II) modeset(0): Modeline "512x288"x59.9   21.00  512 536 552 592  288 289 292 296 doublescan +hsync -vsync (35.5 kHz d)
[    43.486] (II) modeset(0): Modeline "416x312"x74.7   28.64  416 432 464 576  312 312 314 333 doublescan -hsync -vsync (49.7 kHz d)
[    43.486] (II) modeset(0): Modeline "480x270"x59.6   20.38  480 496 544 608  270 271 274 281 doublescan -hsync +vsync (33.5 kHz d)
[    43.486] (II) modeset(0): Modeline "480x270"x59.8   18.62  480 504 520 560  270 271 274 278 doublescan +hsync -vsync (33.3 kHz d)
[    43.486] (II) modeset(0): Modeline "400x300"x72.2   25.00  400 428 488 520  300 318 321 333 doublescan +hsync +vsync (48.1 kHz d)
[    43.486] (II) modeset(0): Modeline "400x300"x75.1   24.75  400 408 448 528  300 300 302 312 doublescan +hsync +vsync (46.9 kHz d)
[    43.486] (II) modeset(0): Modeline "400x300"x60.3   20.00  400 420 484 528  300 300 302 314 doublescan +hsync +vsync (37.9 kHz d)
[    43.486] (II) modeset(0): Modeline "400x300"x56.3   18.00  400 412 448 512  300 300 301 312 doublescan +hsync +vsync (35.2 kHz d)
[    43.486] (II) modeset(0): Modeline "432x243"x59.9   16.25  432 444 484 536  243 244 247 253 doublescan -hsync +vsync (30.3 kHz d)
[    43.486] (II) modeset(0): Modeline "432x243"x59.6   15.25  432 456 472 512  243 244 247 250 doublescan +hsync -vsync (29.8 kHz d)
[    43.486] (II) modeset(0): Modeline "320x240"x72.8   15.75  320 332 352 416  240 244 246 260 doublescan -hsync -vsync (37.9 kHz d)
[    43.486] (II) modeset(0): Modeline "320x240"x75.0   15.75  320 328 360 420  240 240 242 250 doublescan -hsync -vsync (37.5 kHz d)
[    43.486] (II) modeset(0): Modeline "320x240"x60.1   12.59  320 328 376 400  240 245 246 262 doublescan -hsync -vsync (31.5 kHz d)
[    43.486] (II) modeset(0): Modeline "360x202"x59.5   11.25  360 372 404 448  202 204 206 211 doublescan -hsync +vsync (25.1 kHz d)
[    43.486] (II) modeset(0): Modeline "360x202"x59.1   10.88  360 384 400 440  202 204 206 209 doublescan +hsync -vsync (24.7 kHz d)
[    43.486] (II) modeset(0): Modeline "320x180"x59.8    9.00  320 332 360 400  180 181 184 188 doublescan -hsync +vsync (22.5 kHz d)
[    43.486] (II) modeset(0): Modeline "320x180"x59.3    8.88  320 344 360 400  180 181 184 187 doublescan +hsync -vsync (22.2 kHz d)
[    43.486] (II) modeset(0): Output DVI-D-1 disconnected
[    43.486] (II) modeset(0): Output DP-1 disconnected
[    43.486] (II) modeset(0): Output DP-2 disconnected
[    43.486] (II) modeset(0): Output HDMI-1 disconnected
[    43.486] (II) modeset(0): Output DP-3 disconnected
[    43.487] (II) modeset(0): Output DP-3-8 connected
[    43.487] (II) modeset(0): Output DP-3-9 connected
[    43.487] (II) modeset(0): Using spanning desktop for initial modes
[    43.487] (II) modeset(0): Output DP-3-8 using initial mode 1920x2160 +1920+0
[    43.487] (II) modeset(0): Output DP-3-9 using initial mode 1920x2160 +0+0
[    43.487] (==) modeset(0): Using gamma correction (1.0, 1.0, 1.0)
[    43.487] (==) modeset(0): DPI set to (96, 96)
[    43.487] (II) Loading sub module "fb"
[    43.487] (II) LoadModule: "fb"
[    43.487] (II) Loading /usr/lib64/xorg/modules/libfb.so
[    43.489] (II) Module fb: vendor="X.Org Foundation"
[    43.489] 	compiled for 1.20.8, module version = 1.0.0
[    43.489] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    43.552] (==) modeset(0): Backing store enabled
[    43.552] (==) modeset(0): Silken mouse enabled
[    43.577] (II) modeset(0): Initializing kms color map for depth 24, 8 bpc.
[    43.577] (==) modeset(0): DPMS enabled
[    43.577] (II) modeset(0): [DRI2] Setup complete
[    43.577] (II) modeset(0): [DRI2]   DRI driver: nouveau
[    43.577] (II) modeset(0): [DRI2]   VDPAU driver: nouveau
[    43.577] (II) Initializing extension Generic Event Extension
[    43.577] (II) Initializing extension SHAPE
[    43.577] (II) Initializing extension MIT-SHM
[    43.577] (II) Initializing extension XInputExtension
[    43.578] (II) Initializing extension XTEST
[    43.578] (II) Initializing extension BIG-REQUESTS
[    43.578] (II) Initializing extension SYNC
[    43.578] (II) Initializing extension XKEYBOARD
[    43.578] (II) Initializing extension XC-MISC
[    43.578] (II) Initializing extension XFIXES
[    43.578] (II) Initializing extension RENDER
[    43.578] (II) Initializing extension RANDR
[    43.578] (II) Initializing extension COMPOSITE
[    43.578] (II) Initializing extension DAMAGE
[    43.578] (II) Initializing extension MIT-SCREEN-SAVER
[    43.578] (II) Initializing extension DOUBLE-BUFFER
[    43.578] (II) Initializing extension RECORD
[    43.578] (II) Initializing extension DPMS
[    43.578] (II) Initializing extension Present
[    43.578] (II) Initializing extension DRI3
[    43.578] (II) Initializing extension X-Resource
[    43.578] (II) Initializing extension XVideo
[    43.578] (II) Initializing extension XVideo-MotionCompensation
[    43.578] (II) Initializing extension GLX
[    43.582] (II) AIGLX: Loaded and initialized nouveau
[    43.582] (II) GLX: Initialized DRI2 GL provider for screen 0
[    43.582] (II) Initializing extension XFree86-VidModeExtension
[    43.582] (II) Initializing extension XFree86-DGA
[    43.582] (II) Initializing extension XFree86-DRI
[    43.582] (II) Initializing extension DRI2
[    43.583] (II) modeset(0): Damage tracking initialized
[    43.583] (II) modeset(0): Setting screen physical size to 1016 x 571
[    43.627] (II) config/udev: Adding input device Power Button (/dev/input/event2)
[    43.627] (**) Power Button: Applying InputClass "libinput keyboard catchall"
[    43.627] (II) LoadModule: "libinput"
[    43.628] (II) Loading /usr/lib64/xorg/modules/input/libinput_drv.so
[    43.633] (II) Module libinput: vendor="X.Org Foundation"
[    43.633] 	compiled for 1.20.8, module version = 0.30.0
[    43.633] 	Module class: X.Org XInput Driver
[    43.633] 	ABI class: X.Org XInput driver, version 24.1
[    43.633] (II) Using input driver 'libinput' for 'Power Button'
[    43.633] (**) Power Button: always reports core events
[    43.633] (**) Option "Device" "/dev/input/event2"
[    43.633] (**) Option "_source" "server/udev"
[    43.642] (II) event2  - Power Button: is tagged by udev as: Keyboard
[    43.642] (II) event2  - Power Button: device is a keyboard
[    43.642] (II) event2  - Power Button: device removed
[    43.687] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input2/event2"
[    43.687] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 6)
[    43.689] (II) event2  - Power Button: is tagged by udev as: Keyboard
[    43.689] (II) event2  - Power Button: device is a keyboard
[    43.691] (II) config/udev: Adding input device Power Button (/dev/input/event1)
[    43.691] (**) Power Button: Applying InputClass "libinput keyboard catchall"
[    43.691] (II) Using input driver 'libinput' for 'Power Button'
[    43.691] (**) Power Button: always reports core events
[    43.691] (**) Option "Device" "/dev/input/event1"
[    43.691] (**) Option "_source" "server/udev"
[    43.692] (II) event1  - Power Button: is tagged by udev as: Keyboard
[    43.693] (II) event1  - Power Button: device is a keyboard
[    43.693] (II) event1  - Power Button: device removed
[    43.737] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1/event1"
[    43.737] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 7)
[    43.739] (II) event1  - Power Button: is tagged by udev as: Keyboard
[    43.739] (II) event1  - Power Button: device is a keyboard
[    43.741] (II) config/udev: Adding input device Sleep Button (/dev/input/event0)
[    43.741] (**) Sleep Button: Applying InputClass "libinput keyboard catchall"
[    43.741] (II) Using input driver 'libinput' for 'Sleep Button'
[    43.741] (**) Sleep Button: always reports core events
[    43.741] (**) Option "Device" "/dev/input/event0"
[    43.741] (**) Option "_source" "server/udev"
[    43.743] (II) event0  - Sleep Button: is tagged by udev as: Keyboard
[    43.743] (II) event0  - Sleep Button: device is a keyboard
[    43.743] (II) event0  - Sleep Button: device removed
[    43.787] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input0/event0"
[    43.787] (II) XINPUT: Adding extended input device "Sleep Button" (type: KEYBOARD, id 8)
[    43.789] (II) event0  - Sleep Button: is tagged by udev as: Keyboard
[    43.789] (II) event0  - Sleep Button: device is a keyboard
[    43.791] (II) config/udev: Adding input device TrulyErgonomic.com Truly Ergonomic Computer Keyboard (/dev/input/event19)
[    43.791] (**) TrulyErgonomic.com Truly Ergonomic Computer Keyboard: Applying InputClass "libinput keyboard catchall"
[    43.791] (II) Using input driver 'libinput' for 'TrulyErgonomic.com Truly Ergonomic Computer Keyboard'
[    43.791] (**) TrulyErgonomic.com Truly Ergonomic Computer Keyboard: always reports core events
[    43.792] (**) Option "Device" "/dev/input/event19"
[    43.792] (**) Option "_source" "server/udev"
[    43.794] (II) event19 - TrulyErgonomic.com Truly Ergonomic Computer Keyboard: is tagged by udev as: Keyboard
[    43.795] (II) event19 - TrulyErgonomic.com Truly Ergonomic Computer Keyboard: device is a keyboard
[    43.795] (II) event19 - TrulyErgonomic.com Truly Ergonomic Computer Keyboard: device removed
[    43.837] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.1/1-1.1:1.0/0003:0E6A:030C.0001/input/input19/event19"
[    43.837] (II) XINPUT: Adding extended input device "TrulyErgonomic.com Truly Ergonomic Computer Keyboard" (type: KEYBOARD, id 9)
[    43.840] (II) event19 - TrulyErgonomic.com Truly Ergonomic Computer Keyboard: is tagged by udev as: Keyboard
[    43.841] (II) event19 - TrulyErgonomic.com Truly Ergonomic Computer Keyboard: device is a keyboard
[    43.843] (II) config/udev: Adding input device TrulyErgonomic.com Truly Ergonomic Computer Keyboard (/dev/input/event20)
[    43.843] (**) TrulyErgonomic.com Truly Ergonomic Computer Keyboard: Applying InputClass "libinput keyboard catchall"
[    43.843] (II) Using input driver 'libinput' for 'TrulyErgonomic.com Truly Ergonomic Computer Keyboard'
[    43.843] (**) TrulyErgonomic.com Truly Ergonomic Computer Keyboard: always reports core events
[    43.843] (**) Option "Device" "/dev/input/event20"
[    43.843] (**) Option "_source" "server/udev"
[    43.846] (II) event20 - TrulyErgonomic.com Truly Ergonomic Computer Keyboard: is tagged by udev as: Keyboard
[    43.846] (II) event20 - TrulyErgonomic.com Truly Ergonomic Computer Keyboard: device is a keyboard
[    43.846] (II) event20 - TrulyErgonomic.com Truly Ergonomic Computer Keyboard: device removed
[    43.887] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.1/1-1.1:1.1/0003:0E6A:030C.0002/input/input20/event20"
[    43.887] (II) XINPUT: Adding extended input device "TrulyErgonomic.com Truly Ergonomic Computer Keyboard" (type: KEYBOARD, id 10)
[    43.890] (II) event20 - TrulyErgonomic.com Truly Ergonomic Computer Keyboard: is tagged by udev as: Keyboard
[    43.891] (II) event20 - TrulyErgonomic.com Truly Ergonomic Computer Keyboard: device is a keyboard
[    43.893] (II) config/udev: Adding input device Logitech Performance MX (/dev/input/event24)
[    43.893] (**) Logitech Performance MX: Applying InputClass "libinput pointer catchall"
[    43.893] (II) Using input driver 'libinput' for 'Logitech Performance MX'
[    43.893] (**) Logitech Performance MX: always reports core events
[    43.893] (**) Option "Device" "/dev/input/event24"
[    43.893] (**) Option "_source" "server/udev"
[    43.896] (II) event24 - Logitech Performance MX: is tagged by udev as: Mouse
[    43.896] (II) event24 - Logitech Performance MX: device set to 1000 DPI
[    43.897] (II) event24 - Logitech Performance MX: device is a pointer
[    43.897] (II) event24 - Logitech Performance MX: device removed
[    43.937] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.2/1-1.2.2/1-1.2.2:1.2/0003:046D:C52B.0008/0003:046D:101A.0009/input/input24/event24"
[    43.937] (II) XINPUT: Adding extended input device "Logitech Performance MX" (type: MOUSE, id 11)
[    43.938] (**) Option "AccelerationScheme" "none"
[    43.938] (**) Logitech Performance MX: (accel) selected scheme none/0
[    43.938] (**) Logitech Performance MX: (accel) acceleration factor: 2.000
[    43.938] (**) Logitech Performance MX: (accel) acceleration threshold: 4
[    43.941] (II) event24 - Logitech Performance MX: is tagged by udev as: Mouse
[    43.941] (II) event24 - Logitech Performance MX: device set to 1000 DPI
[    43.941] (II) event24 - Logitech Performance MX: device is a pointer
[    43.943] (II) config/udev: Adding input device Logitech Performance MX (/dev/input/mouse0)
[    43.943] (II) No input driver specified, ignoring this device.
[    43.943] (II) This device may have been added with another device file.
[    43.945] (II) config/udev: Adding input device Logitech MX Master 2S (/dev/input/event25)
[    43.946] (**) Logitech MX Master 2S: Applying InputClass "libinput pointer catchall"
[    43.946] (**) Logitech MX Master 2S: Applying InputClass "libinput keyboard catchall"
[    43.946] (II) Using input driver 'libinput' for 'Logitech MX Master 2S'
[    43.946] (**) Logitech MX Master 2S: always reports core events
[    43.946] (**) Option "Device" "/dev/input/event25"
[    43.946] (**) Option "_source" "server/udev"
[    43.949] (II) event25 - Logitech MX Master 2S: is tagged by udev as: Keyboard Mouse
[    43.949] (II) event25 - Logitech MX Master 2S: device is a pointer
[    43.949] (II) event25 - Logitech MX Master 2S: device is a keyboard
[    43.949] (II) event25 - Logitech MX Master 2S: device removed
[    43.987] (II) libinput: Logitech MX Master 2S: needs a virtual subdevice
[    43.987] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.2/1-1.2.2/1-1.2.2:1.2/0003:046D:C52B.0008/0003:046D:4069.000A/input/input25/event25"
[    43.987] (II) XINPUT: Adding extended input device "Logitech MX Master 2S" (type: MOUSE, id 12)
[    43.988] (**) Option "AccelerationScheme" "none"
[    43.988] (**) Logitech MX Master 2S: (accel) selected scheme none/0
[    43.988] (**) Logitech MX Master 2S: (accel) acceleration factor: 2.000
[    43.988] (**) Logitech MX Master 2S: (accel) acceleration threshold: 4
[    43.991] (II) event25 - Logitech MX Master 2S: is tagged by udev as: Keyboard Mouse
[    43.991] (II) event25 - Logitech MX Master 2S: device is a pointer
[    43.991] (II) event25 - Logitech MX Master 2S: device is a keyboard
[    43.993] (II) config/udev: Adding input device Logitech MX Master 2S (/dev/input/mouse1)
[    43.994] (II) No input driver specified, ignoring this device.
[    43.994] (II) This device may have been added with another device file.
[    43.996] (II) config/udev: Adding input device Logitech MX Vertical (/dev/input/event26)
[    43.996] (**) Logitech MX Vertical: Applying InputClass "libinput pointer catchall"
[    43.996] (**) Logitech MX Vertical: Applying InputClass "libinput keyboard catchall"
[    43.996] (II) Using input driver 'libinput' for 'Logitech MX Vertical'
[    43.996] (**) Logitech MX Vertical: always reports core events
[    43.996] (**) Option "Device" "/dev/input/event26"
[    43.996] (**) Option "_source" "server/udev"
[    43.999] (II) event26 - Logitech MX Vertical: is tagged by udev as: Keyboard Mouse
[    43.999] (II) event26 - Logitech MX Vertical: device is a pointer
[    43.999] (II) event26 - Logitech MX Vertical: device is a keyboard
[    43.999] (II) event26 - Logitech MX Vertical: device removed
[    44.037] (II) libinput: Logitech MX Vertical: needs a virtual subdevice
[    44.037] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.2/1-1.2.2/1-1.2.2:1.2/0003:046D:C52B.0008/0003:046D:407B.000B/input/input26/event26"
[    44.037] (II) XINPUT: Adding extended input device "Logitech MX Vertical" (type: MOUSE, id 13)
[    44.037] (**) Option "AccelerationScheme" "none"
[    44.038] (**) Logitech MX Vertical: (accel) selected scheme none/0
[    44.038] (**) Logitech MX Vertical: (accel) acceleration factor: 2.000
[    44.038] (**) Logitech MX Vertical: (accel) acceleration threshold: 4
[    44.041] (II) event26 - Logitech MX Vertical: is tagged by udev as: Keyboard Mouse
[    44.041] (II) event26 - Logitech MX Vertical: device is a pointer
[    44.041] (II) event26 - Logitech MX Vertical: device is a keyboard
[    44.043] (II) config/udev: Adding input device Logitech MX Vertical (/dev/input/mouse2)
[    44.043] (II) No input driver specified, ignoring this device.
[    44.043] (II) This device may have been added with another device file.
[    44.045] (II) config/udev: Adding input device REIYIN Bluetooth Audio WT04 Consumer Control (/dev/input/event22)
[    44.045] (**) REIYIN Bluetooth Audio WT04 Consumer Control: Applying InputClass "libinput keyboard catchall"
[    44.045] (II) Using input driver 'libinput' for 'REIYIN Bluetooth Audio WT04 Consumer Control'
[    44.045] (**) REIYIN Bluetooth Audio WT04 Consumer Control: always reports core events
[    44.045] (**) Option "Device" "/dev/input/event22"
[    44.045] (**) Option "_source" "server/udev"
[    44.048] (II) event22 - REIYIN Bluetooth Audio WT04 Consumer Control: is tagged by udev as: Keyboard
[    44.048] (II) event22 - REIYIN Bluetooth Audio WT04 Consumer Control: device is a keyboard
[    44.048] (II) event22 - REIYIN Bluetooth Audio WT04 Consumer Control: device removed
[    44.087] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-10/1-10:1.3/0003:0A12:E243.0005/input/input22/event22"
[    44.087] (II) XINPUT: Adding extended input device "REIYIN Bluetooth Audio WT04 Consumer Control" (type: KEYBOARD, id 14)
[    44.090] (II) event22 - REIYIN Bluetooth Audio WT04 Consumer Control: is tagged by udev as: Keyboard
[    44.090] (II) event22 - REIYIN Bluetooth Audio WT04 Consumer Control: device is a keyboard
[    44.092] (II) config/udev: Adding input device REIYIN Bluetooth Audio WT04 (/dev/input/event23)
[    44.092] (II) No input driver specified, ignoring this device.
[    44.092] (II) This device may have been added with another device file.
[    44.094] (II) config/udev: Adding input device Yubico Yubikey NEO OTP+U2F (/dev/input/event21)
[    44.094] (**) Yubico Yubikey NEO OTP+U2F: Applying InputClass "libinput keyboard catchall"
[    44.094] (II) Using input driver 'libinput' for 'Yubico Yubikey NEO OTP+U2F'
[    44.094] (**) Yubico Yubikey NEO OTP+U2F: always reports core events
[    44.094] (**) Option "Device" "/dev/input/event21"
[    44.094] (**) Option "_source" "server/udev"
[    44.096] (II) event21 - Yubico Yubikey NEO OTP+U2F: is tagged by udev as: Keyboard
[    44.096] (II) event21 - Yubico Yubikey NEO OTP+U2F: device is a keyboard
[    44.097] (II) event21 - Yubico Yubikey NEO OTP+U2F: device removed
[    44.137] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-9/1-9:1.0/0003:1050:0114.0003/input/input21/event21"
[    44.137] (II) XINPUT: Adding extended input device "Yubico Yubikey NEO OTP+U2F" (type: KEYBOARD, id 15)
[    44.140] (II) event21 - Yubico Yubikey NEO OTP+U2F: is tagged by udev as: Keyboard
[    44.140] (II) event21 - Yubico Yubikey NEO OTP+U2F: device is a keyboard
[    44.141] (II) config/udev: Adding input device HDA Intel PCH Front Mic (/dev/input/event11)
[    44.142] (II) No input driver specified, ignoring this device.
[    44.142] (II) This device may have been added with another device file.
[    44.142] (II) config/udev: Adding input device HDA Intel PCH Rear Mic (/dev/input/event12)
[    44.142] (II) No input driver specified, ignoring this device.
[    44.142] (II) This device may have been added with another device file.
[    44.143] (II) config/udev: Adding input device HDA Intel PCH Line (/dev/input/event13)
[    44.143] (II) No input driver specified, ignoring this device.
[    44.143] (II) This device may have been added with another device file.
[    44.144] (II) config/udev: Adding input device HDA Intel PCH Line Out Front (/dev/input/event14)
[    44.144] (II) No input driver specified, ignoring this device.
[    44.144] (II) This device may have been added with another device file.
[    44.145] (II) config/udev: Adding input device HDA Intel PCH Line Out Surround (/dev/input/event15)
[    44.145] (II) No input driver specified, ignoring this device.
[    44.145] (II) This device may have been added with another device file.
[    44.146] (II) config/udev: Adding input device HDA Intel PCH Line Out CLFE (/dev/input/event16)
[    44.146] (II) No input driver specified, ignoring this device.
[    44.146] (II) This device may have been added with another device file.
[    44.147] (II) config/udev: Adding input device HDA Intel PCH Line Out Side (/dev/input/event17)
[    44.147] (II) No input driver specified, ignoring this device.
[    44.147] (II) This device may have been added with another device file.
[    44.148] (II) config/udev: Adding input device HDA Intel PCH Front Headphone (/dev/input/event18)
[    44.148] (II) No input driver specified, ignoring this device.
[    44.148] (II) This device may have been added with another device file.
[    44.150] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=12 (/dev/input/event10)
[    44.150] (II) No input driver specified, ignoring this device.
[    44.151] (II) This device may have been added with another device file.
[    44.151] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=3 (/dev/input/event4)
[    44.151] (II) No input driver specified, ignoring this device.
[    44.152] (II) This device may have been added with another device file.
[    44.152] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=7 (/dev/input/event5)
[    44.152] (II) No input driver specified, ignoring this device.
[    44.152] (II) This device may have been added with another device file.
[    44.153] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=8 (/dev/input/event6)
[    44.153] (II) No input driver specified, ignoring this device.
[    44.153] (II) This device may have been added with another device file.
[    44.153] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=9 (/dev/input/event7)
[    44.153] (II) No input driver specified, ignoring this device.
[    44.153] (II) This device may have been added with another device file.
[    44.154] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=10 (/dev/input/event8)
[    44.154] (II) No input driver specified, ignoring this device.
[    44.154] (II) This device may have been added with another device file.
[    44.155] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=11 (/dev/input/event9)
[    44.155] (II) No input driver specified, ignoring this device.
[    44.155] (II) This device may have been added with another device file.
[    44.155] (II) config/udev: Adding input device PC Speaker (/dev/input/event3)
[    44.155] (II) No input driver specified, ignoring this device.
[    44.155] (II) This device may have been added with another device file.
[    44.163] (**) Logitech MX Master 2S: Applying InputClass "libinput pointer catchall"
[    44.163] (**) Logitech MX Master 2S: Applying InputClass "libinput keyboard catchall"
[    44.163] (II) Using input driver 'libinput' for 'Logitech MX Master 2S'
[    44.163] (**) Logitech MX Master 2S: always reports core events
[    44.163] (**) Option "Device" "/dev/input/event25"
[    44.163] (**) Option "_source" "_driver/libinput"
[    44.163] (II) libinput: Logitech MX Master 2S: is a virtual subdevice
[    44.163] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.2/1-1.2.2/1-1.2.2:1.2/0003:046D:C52B.0008/0003:046D:4069.000A/input/input25/event25"
[    44.163] (II) XINPUT: Adding extended input device "Logitech MX Master 2S" (type: KEYBOARD, id 16)
[    44.163] (**) Logitech MX Vertical: Applying InputClass "libinput pointer catchall"
[    44.163] (**) Logitech MX Vertical: Applying InputClass "libinput keyboard catchall"
[    44.163] (II) Using input driver 'libinput' for 'Logitech MX Vertical'
[    44.163] (**) Logitech MX Vertical: always reports core events
[    44.163] (**) Option "Device" "/dev/input/event26"
[    44.163] (**) Option "_source" "_driver/libinput"
[    44.163] (II) libinput: Logitech MX Vertical: is a virtual subdevice
[    44.163] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.2/1-1.2.2/1-1.2.2:1.2/0003:046D:C52B.0008/0003:046D:407B.000B/input/input26/event26"
[    44.163] (II) XINPUT: Adding extended input device "Logitech MX Vertical" (type: KEYBOARD, id 17)
[    44.177] failed to add fb -22
[    44.177] (EE) modeset(0): failed to set mode: Invalid argument
[    46.645] (II) Server zapped. Shutting down.
[    46.647] (II) event2  - Power Button: device removed
[    46.701] (II) event1  - Power Button: device removed
[    46.754] (II) event0  - Sleep Button: device removed
[    46.794] (II) event19 - TrulyErgonomic.com Truly Ergonomic Computer Keyboard: device removed
[    46.834] (II) event20 - TrulyErgonomic.com Truly Ergonomic Computer Keyboard: device removed
[    46.874] (II) event24 - Logitech Performance MX: device removed
[    46.914] (II) event22 - REIYIN Bluetooth Audio WT04 Consumer Control: device removed
[    46.964] (II) event21 - Yubico Yubikey NEO OTP+U2F: device removed
[    47.014] (II) event25 - Logitech MX Master 2S: device removed
[    47.064] (II) event26 - Logitech MX Vertical: device removed
[    47.107] (II) UnloadModule: "libinput"
[    47.107] (II) UnloadModule: "libinput"
[    47.108] (II) UnloadModule: "libinput"
[    47.108] (II) UnloadModule: "libinput"
[    47.108] (II) UnloadModule: "libinput"
[    47.108] (II) UnloadModule: "libinput"
[    47.108] (II) UnloadModule: "libinput"
[    47.108] (II) UnloadModule: "libinput"
[    47.108] (II) UnloadModule: "libinput"
[    47.108] (II) UnloadModule: "libinput"
[    47.108] (II) UnloadModule: "libinput"
[    47.109] (II) UnloadModule: "libinput"
[    47.120] (II) Server terminated successfully (0). Closing log file.

--rpljboisfrorpli6
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--rpljboisfrorpli6--

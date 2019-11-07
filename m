Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C43AF2EEF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 14:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4336F693;
	Thu,  7 Nov 2019 13:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5616F68E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:13:00 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA7D949m143959;
 Thu, 7 Nov 2019 13:13:00 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2w41w0wyqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Nov 2019 13:12:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA7D8uN8190904;
 Thu, 7 Nov 2019 13:12:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2w41wh5e92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Nov 2019 13:12:58 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xA7DCvML025219;
 Thu, 7 Nov 2019 13:12:57 GMT
Received: from dhcp-10-154-154-96.vpn.oracle.com (/10.154.154.96)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Nov 2019 05:12:57 -0800
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_05610C4C-1533-4AC5-9465-EBD037426277"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Drm: mgag200. Video adapter issue with 5.4.0-rc3 ; no graphics 
From: John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <f7bb9241-d9c6-c4ef-a03f-7aa0d18ea30e@suse.de>
Date: Thu, 7 Nov 2019 07:12:56 -0600
Message-Id: <BBD8E679-435B-45A3-AC2E-495329A1BC87@oracle.com>
References: <162E0991-F617-4AA3-8C98-A6F0B0F681B1@oracle.com>
 <f7bb9241-d9c6-c4ef-a03f-7aa0d18ea30e@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9433
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911070133
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9433
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911070133
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc : message-id :
 references : to; s=corp-2019-08-05;
 bh=OIzqEnxd1LqmMGoJGj+5zOQnoefncY6vLOpTouxUrwg=;
 b=lJM5Qtu8i6WBTXLcbbgkFhpgGY96sbdsnKAneSUlKxhQG3hguVxLxjRg3ohZneadHNI+
 6InZPcNKLphKoyzIk0lfP/j6IvRhMbqB+3v4GBg9phXqk2zKehYCYsk78bFMAbSmHLvX
 gHLABzgKFc4RNic3XB1MzNqsrlfx/VgiPAUhGj+eE2yAfSprh88jjFZJ974nJy1cADUb
 HwLpiITjsqWqRYC6oxxID0Wk3lPdG9s8zs42O3dHCzDTtmGFphiwdyrFewIsjqyN4qP5
 oL3fRNr1E2bl2Xq7sNC88aAL9Gq2/GO7GvYg7nnB70WUSSDG8WRC6mlYESyF/yWc0A44 iQ== 
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
Cc: dri-devel@lists.freedesktop.org, allen <allen.pais@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Apple-Mail=_05610C4C-1533-4AC5-9465-EBD037426277
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi  Thomas ;  Thank you for reaching out.=20

 See inline:=20

> On Nov 7, 2019, at 1:54 AM, Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>=20
> Hi John,
>=20
> apparently the vgaarb was not the problem.
>=20
> Am 07.11.19 um 03:29 schrieb John Donnelly:
>> Hi,
>>=20
>> I am investigating an issue where we lose video activity when the =
display is switched from from =E2=80=9Ctext mode=E2=80=9D to =E2=80=9Cgrap=
hic mode=E2=80=9D=20
>> on a number of  servers using this driver.    Specifically  starting =
the GNOME desktop.=20
>=20
> When you say "text mode", do you mean VGA text mode or the graphical
> console that emulates text mode?
>=20
       =20

 I call =E2=80=9Ctext mode=E2=80=9D the 24x80  ascii mode ;  - NOT =
GRAPHICS .       Ie : run-level 3;  So I  guess your term for it is VGA.=20=

     =20

> When you enable graphics mode, does it set the correct resolution? A =
lot
> of work went into memory management recently. I could imagine that the
> driver sets the correct resolution, but then fails to display the
> correct framebuffer.

    There is no display at all ;  so there is no resolution  to mention. =
  =20


   =20
>=20
> If possible, could you try to update to the latest drm-tip and attach
> the output of
>=20
>  /sys/kernel/debug/dri/0/vram-mm

I don=E2=80=99t see that file ;   Is there something else I need to do ?=20=


I=E2=80=99ve attached : var/lib/gdm/.local/share/xorg/Xorg.0.log. ;   =
instead ;=20=

--Apple-Mail=_05610C4C-1533-4AC5-9465-EBD037426277
Content-Disposition: attachment;
	filename=Xorg.0.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="Xorg.0.log"
Content-Transfer-Encoding: 7bit

[   237.684] (--) Log file renamed from "/var/lib/gdm/.local/share/xorg/Xorg.pid-2344.log" to "/var/lib/gdm/.local/share/xorg/Xorg.0.log"
[   237.684] 
X.Org X Server 1.20.3
X Protocol Version 11, Revision 0
[   237.684] Build Operating System:  4.18.0-32.el8.x86_64 
[   237.684] Current Operating System: Linux ca-dev55 5.3.0+ #4 SMP Wed Nov 6 19:07:28 PST 2019 x86_64
[   237.684] Kernel command line: BOOT_IMAGE=(hd0,msdos1)/vmlinuz-5.3.0+ root=/dev/mapper/ol_ca--dev55-root ro crashkernel=auto resume=/dev/mapper/ol_ca--dev55-swap rd.lvm.lv=ol_ca-dev55/root rd.lvm.lv=ol_ca-dev55/swap console=ttyS0,9600,8,n,1 drm.debug=0xff
[   237.685] Build Date: 19 July 2019  09:31:20PM
[   237.685] Build ID: xorg-x11-server 1.20.3-5.2.el8_0 
[   237.685] Current version of pixman: 0.36.0
[   237.685] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[   237.685] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[   237.685] (==) Log file: "/var/lib/gdm/.local/share/xorg/Xorg.0.log", Time: Thu Nov  7 04:45:23 2019
[   237.686] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[   237.686] (==) No Layout section.  Using the first Screen section.
[   237.686] (==) No screen section available. Using defaults.
[   237.686] (**) |-->Screen "Default Screen Section" (0)
[   237.686] (**) |   |-->Monitor "<default monitor>"
[   237.686] (==) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
[   237.686] (==) Automatically adding devices
[   237.686] (==) Automatically enabling devices
[   237.686] (==) Automatically adding GPU devices
[   237.686] (==) Automatically binding GPU devices
[   237.686] (==) Max clients allowed: 256, resource mask: 0x1fffff
[   237.686] (==) FontPath set to:
	catalogue:/etc/X11/fontpath.d,
	built-ins
[   237.686] (==) ModulePath set to "/usr/lib64/xorg/modules"
[   237.686] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[   237.686] (II) Loader magic: 0x557906a4e020
[   237.686] (II) Module ABI versions:
[   237.686] 	X.Org ANSI C Emulation: 0.4
[   237.686] 	X.Org Video Driver: 24.0
[   237.686] 	X.Org XInput driver : 24.1
[   237.686] 	X.Org Server Extension : 10.0
[   237.687] (++) using VT number 1

[   237.688] (II) systemd-logind: took control of session /org/freedesktop/login1/session/c1
[   237.688] (II) xfree86: Adding drm device (/dev/dri/card0)
[   237.689] (II) Platform probe for /sys/devices/pci0000:00/0000:00:1c.7/0000:3d:00.0/drm/card0
[   237.689] (II) systemd-logind: got fd for /dev/dri/card0 226:0 fd 12 paused 0
[   237.702] (--) PCI:*(61@0:0:0) 102b:0522:108e:4852 rev 5, Mem @ 0xc5000000/16777216, 0xc6810000/16384, 0xc6000000/8388608, BIOS @ 0x????????/65536
[   237.702] (II) LoadModule: "glx"
[   237.703] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[   237.709] (II) Module glx: vendor="X.Org Foundation"
[   237.709] 	compiled for 1.20.3, module version = 1.0.0
[   237.709] 	ABI class: X.Org Server Extension, version 10.0
[   237.709] (==) Matched modesetting as autoconfigured driver 0
[   237.709] (==) Matched fbdev as autoconfigured driver 1
[   237.709] (==) Matched vesa as autoconfigured driver 2
[   237.709] (==) Assigned the driver to the xf86ConfigLayout
[   237.709] (II) LoadModule: "modesetting"
[   237.709] (II) Loading /usr/lib64/xorg/modules/drivers/modesetting_drv.so
[   237.710] (II) Module modesetting: vendor="X.Org Foundation"
[   237.710] 	compiled for 1.20.3, module version = 1.20.3
[   237.710] 	Module class: X.Org Video Driver
[   237.710] 	ABI class: X.Org Video Driver, version 24.0
[   237.710] (II) LoadModule: "fbdev"
[   237.710] (II) Loading /usr/lib64/xorg/modules/drivers/fbdev_drv.so
[   237.710] (II) Module fbdev: vendor="X.Org Foundation"
[   237.710] 	compiled for 1.20.2, module version = 0.5.0
[   237.710] 	Module class: X.Org Video Driver
[   237.710] 	ABI class: X.Org Video Driver, version 24.0
[   237.710] (II) LoadModule: "vesa"
[   237.710] (II) Loading /usr/lib64/xorg/modules/drivers/vesa_drv.so
[   237.712] (II) Module vesa: vendor="X.Org Foundation"
[   237.712] 	compiled for 1.20.2, module version = 2.4.0
[   237.712] 	Module class: X.Org Video Driver
[   237.712] 	ABI class: X.Org Video Driver, version 24.0
[   237.712] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[   237.712] (II) FBDEV: driver for framebuffer: fbdev
[   237.712] (II) VESA: driver for VESA chipsets: vesa
[   237.712] xf86EnableIOPorts: failed to set IOPL for I/O (Operation not permitted)
[   237.712] (II) modeset(0): using drv /dev/dri/card0
[   237.712] (WW) Falling back to old probe method for fbdev
[   237.712] (II) Loading sub module "fbdevhw"
[   237.712] (II) LoadModule: "fbdevhw"
[   237.712] (II) Loading /usr/lib64/xorg/modules/libfbdevhw.so
[   237.712] (II) Module fbdevhw: vendor="X.Org Foundation"
[   237.712] 	compiled for 1.20.3, module version = 0.0.2
[   237.712] 	ABI class: X.Org Video Driver, version 24.0
[   237.712] (EE) open /dev/fb0: Permission denied
[   237.712] (WW) VGA arbiter: cannot open kernel arbiter, no multi-card support
[   237.712] (II) modeset(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
[   237.712] (==) modeset(0): Depth 24, (==) framebuffer bpp 32
[   237.712] (==) modeset(0): RGB weight 888
[   237.712] (==) modeset(0): Default visual is TrueColor
[   237.712] (II) Loading sub module "glamoregl"
[   237.712] (II) LoadModule: "glamoregl"
[   237.712] (II) Loading /usr/lib64/xorg/modules/libglamoregl.so
[   237.715] (II) Module glamoregl: vendor="X.Org Foundation"
[   237.715] 	compiled for 1.20.3, module version = 1.0.1
[   237.715] 	ABI class: X.Org ANSI C Emulation, version 0.4
[   237.858] (II) modeset(0): Refusing to try glamor on llvmpipe
[   237.859] (EE) modeset(0): glamor initialization failed
[   237.859] (II) modeset(0): ShadowFB: preferred YES, enabled YES
[   237.859] (II) modeset(0): Double-buffered shadow updates: on
[   237.861] (II) modeset(0): Output VGA-1 has no monitor section
[   237.862] (II) modeset(0): EDID for output VGA-1
[   237.863] (II) modeset(0): Printing probed modes for output VGA-1
[   237.863] (II) modeset(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   237.863] (II) modeset(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[   237.863] (II) modeset(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz e)
[   237.863] (II) modeset(0): Modeline "848x480"x60.0   33.75  848 864 976 1088  480 486 494 517 +hsync +vsync (31.0 kHz e)
[   237.863] (II) modeset(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[   237.863] (II) modeset(0): Output VGA-1 connected
[   237.863] (II) modeset(0): Using exact sizes for initial modes
[   237.863] (II) modeset(0): Output VGA-1 using initial mode 1024x768 +0+0
[   237.863] (==) modeset(0): Using gamma correction (1.0, 1.0, 1.0)
[   237.863] (==) modeset(0): DPI set to (96, 96)
[   237.863] (II) Loading sub module "fb"
[   237.863] (II) LoadModule: "fb"
[   237.863] (II) Loading /usr/lib64/xorg/modules/libfb.so
[   237.863] (II) Module fb: vendor="X.Org Foundation"
[   237.863] 	compiled for 1.20.3, module version = 1.0.0
[   237.863] 	ABI class: X.Org ANSI C Emulation, version 0.4
[   237.863] (II) Loading sub module "shadow"
[   237.863] (II) LoadModule: "shadow"
[   237.863] (II) Loading /usr/lib64/xorg/modules/libshadow.so
[   237.863] (II) Module shadow: vendor="X.Org Foundation"
[   237.863] 	compiled for 1.20.3, module version = 1.1.0
[   237.863] 	ABI class: X.Org ANSI C Emulation, version 0.4
[   237.863] (II) UnloadModule: "fbdev"
[   237.863] (II) Unloading fbdev
[   237.863] (II) UnloadSubModule: "fbdevhw"
[   237.863] (II) Unloading fbdevhw
[   237.863] (II) UnloadModule: "vesa"
[   237.863] (II) Unloading vesa
[   237.863] (==) modeset(0): Backing store enabled
[   237.863] (==) modeset(0): Silken mouse enabled
[   237.864] (II) modeset(0): Initializing kms color map for depth 24, 8 bpc.
[   237.864] (==) modeset(0): DPMS enabled
[   237.864] (II) Initializing extension Generic Event Extension
[   237.864] (II) Initializing extension SHAPE
[   237.864] (II) Initializing extension MIT-SHM
[   237.864] (II) Initializing extension XInputExtension
[   237.864] (II) Initializing extension XTEST
[   237.864] (II) Initializing extension BIG-REQUESTS
[   237.864] (II) Initializing extension SYNC
[   237.864] (II) Initializing extension XKEYBOARD
[   237.865] (II) Initializing extension XC-MISC
[   237.865] (II) Initializing extension XFIXES
[   237.865] (II) Initializing extension RENDER
[   237.865] (II) Initializing extension RANDR
[   237.865] (II) Initializing extension COMPOSITE
[   237.865] (II) Initializing extension DAMAGE
[   237.865] (II) Initializing extension MIT-SCREEN-SAVER
[   237.865] (II) Initializing extension DOUBLE-BUFFER
[   237.865] (II) Initializing extension RECORD
[   237.865] (II) Initializing extension DPMS
[   237.865] (II) Initializing extension Present
[   237.865] (II) Initializing extension DRI3
[   237.865] (II) Initializing extension X-Resource
[   237.866] (II) Initializing extension XVideo
[   237.866] (II) Initializing extension XVideo-MotionCompensation
[   237.866] (II) Initializing extension SELinux
[   237.866] (II) SELinux: Disabled on system
[   237.866] (II) Initializing extension GLX
[   237.866] (II) AIGLX: Screen 0 is not DRI2 capable
[   237.869] (II) IGLX: Loaded and initialized swrast
[   237.869] (II) GLX: Initialized DRISWRAST GL provider for screen 0
[   237.869] (II) Initializing extension XFree86-VidModeExtension
[   237.869] (II) Initializing extension XFree86-DGA
[   237.869] (II) Initializing extension XFree86-DRI
[   237.869] (II) Initializing extension DRI2
[   237.870] (II) modeset(0): Damage tracking initialized
[   237.870] (II) modeset(0): Setting screen physical size to 270 x 203
[   237.904] (II) config/udev: Adding input device Power Button (/dev/input/event1)
[   237.904] (**) Power Button: Applying InputClass "libinput keyboard catchall"
[   237.904] (II) LoadModule: "libinput"
[   237.904] (II) Loading /usr/lib64/xorg/modules/input/libinput_drv.so
[   237.908] (II) Module libinput: vendor="X.Org Foundation"
[   237.908] 	compiled for 1.20.2, module version = 0.28.0
[   237.908] 	Module class: X.Org XInput Driver
[   237.908] 	ABI class: X.Org XInput driver, version 24.1
[   237.908] (II) Using input driver 'libinput' for 'Power Button'
[   237.909] (II) systemd-logind: got fd for /dev/input/event1 13:65 fd 20 paused 0
[   237.909] (**) Power Button: always reports core events
[   237.909] (**) Option "Device" "/dev/input/event1"
[   237.909] (**) Option "_source" "server/udev"
[   237.913] (II) event1  - Power Button: is tagged by udev as: Keyboard
[   237.913] (II) event1  - Power Button: device is a keyboard
[   237.913] (II) event1  - Power Button: device removed
[   237.913] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1/event1"
[   237.913] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 6)
[   237.914] (II) event1  - Power Button: is tagged by udev as: Keyboard
[   237.914] (II) event1  - Power Button: device is a keyboard
[   237.914] (II) config/udev: Adding input device Power Button (/dev/input/event0)
[   237.914] (**) Power Button: Applying InputClass "libinput keyboard catchall"
[   237.914] (II) Using input driver 'libinput' for 'Power Button'
[   237.915] (II) systemd-logind: got fd for /dev/input/event0 13:64 fd 23 paused 0
[   237.915] (**) Power Button: always reports core events
[   237.915] (**) Option "Device" "/dev/input/event0"
[   237.915] (**) Option "_source" "server/udev"
[   237.915] (II) event0  - Power Button: is tagged by udev as: Keyboard
[   237.915] (II) event0  - Power Button: device is a keyboard
[   237.915] (II) event0  - Power Button: device removed
[   237.915] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0/event0"
[   237.915] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 7)
[   237.916] (II) event0  - Power Button: is tagged by udev as: Keyboard
[   237.916] (II) event0  - Power Button: device is a keyboard
[   237.916] (II) config/udev: Adding input device Oracle P3rKM  (/dev/input/event3)
[   237.916] (**) Oracle P3rKM : Applying InputClass "libinput keyboard catchall"
[   237.916] (II) Using input driver 'libinput' for 'Oracle P3rKM '
[   237.917] (II) systemd-logind: got fd for /dev/input/event3 13:67 fd 24 paused 0
[   237.917] (**) Oracle P3rKM : always reports core events
[   237.917] (**) Option "Device" "/dev/input/event3"
[   237.917] (**) Option "_source" "server/udev"
[   237.918] (II) event3  - Oracle P3rKM : is tagged by udev as: Keyboard
[   237.918] (II) event3  - Oracle P3rKM : device is a keyboard
[   237.918] (II) event3  - Oracle P3rKM : device removed
[   237.918] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7/2-1.7:1.0/0003:0430:A101.0001/input/input3/event3"
[   237.918] (II) XINPUT: Adding extended input device "Oracle P3rKM " (type: KEYBOARD, id 8)
[   237.919] (II) event3  - Oracle P3rKM : is tagged by udev as: Keyboard
[   237.919] (II) event3  - Oracle P3rKM : device is a keyboard
[   237.919] (II) config/udev: Adding input device Oracle P3rKM  (/dev/input/event4)
[   237.919] (**) Oracle P3rKM : Applying InputClass "libinput pointer catchall"
[   237.919] (II) Using input driver 'libinput' for 'Oracle P3rKM '
[   237.972] (II) systemd-logind: got fd for /dev/input/event4 13:68 fd 25 paused 0
[   237.972] (**) Oracle P3rKM : always reports core events
[   237.972] (**) Option "Device" "/dev/input/event4"
[   237.972] (**) Option "_source" "server/udev"
[   237.973] (II) event4  - Oracle P3rKM : is tagged by udev as: Mouse
[   237.973] (II) event4  - Oracle P3rKM : device is a pointer
[   237.973] (II) event4  - Oracle P3rKM : device removed
[   237.973] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7/2-1.7:1.1/0003:0430:A101.0002/input/input4/event4"
[   237.973] (II) XINPUT: Adding extended input device "Oracle P3rKM " (type: MOUSE, id 9)
[   237.973] (**) Option "AccelerationScheme" "none"
[   237.973] (**) Oracle P3rKM : (accel) selected scheme none/0
[   237.973] (**) Oracle P3rKM : (accel) acceleration factor: 2.000
[   237.973] (**) Oracle P3rKM : (accel) acceleration threshold: 4
[   237.974] (II) event4  - Oracle P3rKM : is tagged by udev as: Mouse
[   237.974] (II) event4  - Oracle P3rKM : device is a pointer
[   237.974] (II) config/udev: Adding input device Oracle P3rKM  (/dev/input/mouse0)
[   237.974] (II) No input driver specified, ignoring this device.
[   237.974] (II) This device may have been added with another device file.
[   237.975] (II) config/udev: Adding input device PC Speaker (/dev/input/event2)
[   237.975] (II) No input driver specified, ignoring this device.
[   237.975] (II) This device may have been added with another device file.
[   239.880] (II) modeset(0): Disabling kernel dirty updates, not required.
[   260.158] (**) Option "fd" "20"
[   260.158] (II) event1  - Power Button: device removed
[   260.158] (**) Option "fd" "23"
[   260.158] (II) event0  - Power Button: device removed
[   260.158] (**) Option "fd" "24"
[   260.158] (II) event3  - Oracle P3rKM : device removed
[   260.158] (**) Option "fd" "25"
[   260.158] (II) event4  - Oracle P3rKM : device removed
[   260.159] (II) UnloadModule: "libinput"
[   260.159] (II) systemd-logind: releasing fd for 13:68
[   260.174] (II) UnloadModule: "libinput"
[   260.174] (II) systemd-logind: releasing fd for 13:67
[   260.230] (II) UnloadModule: "libinput"
[   260.230] (II) systemd-logind: releasing fd for 13:64
[   260.241] (II) UnloadModule: "libinput"
[   260.241] (II) systemd-logind: releasing fd for 13:65
[   260.532] (II) Server terminated successfully (0). Closing log file.

--Apple-Mail=_05610C4C-1533-4AC5-9465-EBD037426277
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



 Here is my cmdline  -  I just tested 5.3.0 and it fails too  ( my last =
test was 5.3.8 and it failed also ) .=20

# cat /proc/cmdline=20
BOOT_IMAGE=3D(hd0,msdos1)/vmlinuz-5.3.0+ =
root=3D/dev/mapper/ol_ca--dev55-root ro crashkernel=3Dauto =
resume=3D/dev/mapper/ol_ca--dev55-swap rd.lvm.lv=3Dol_ca-dev55/root =
rd.lvm.lv=3Dol_ca-dev55/swap console=3DttyS0,9600,8,n,1 drm.debug=3D0xff

When you say =E2=80=9Ctip=E2=80=9D. - Are you referring to a specific =
kernel  ?  I can build a  5.4.0.rc6  ;   The problem appears to have =
been introduced around 5.3 time frame.=20


>=20
> before and after switching to graphics mode. The file lists the
> allocated regions of the VRAM.
>=20
>>=20
>> This adapter is  Server Engines  Integrated Remote Video Acceleration =
Subsystem (RVAS)  and is used as remote console in iLO/DRAC =
environments. =20
>>=20
>> I don=E2=80=99t see any specific errors in the gdm logs or message =
file other than this:
>=20
> You can boot with drm.debug=3D0xff on the kernel command line to =
enable
> more warnings.
>=20
>=20
> Could you please attach the output of lspci -v for the VGA adapter?
>=20


Here is the output from the current machine; The previous addresses were =
from another model using the same SE device:


Nov  7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0: =
remove_conflicting_pci_framebuffers: bar 0: 0xc5000000 -> 0xc5ffffff
Nov  7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0: =
remove_conflicting_pci_framebuffers: bar 1: 0xc6810000 -> 0xc6813fff
Nov  7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0: =
remove_conflicting_pci_framebuffers: bar 2: 0xc6000000 -> 0xc67fffff
Nov  7 04:42:50 ca-dev55 kernel: mgag200 0000:3d:00.0: vgaarb: =
deactivate vga console


lspci -s 3d:00.0 -vvv -k=20
3d:00.0 VGA compatible controller: Matrox Electronics Systems Ltd. MGA =
G200e [Pilot] ServerEngines (SEP1) (rev 05) (prog-if 00 [VGA =
controller])
	Subsystem: Oracle/SUN Device 4852
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- =
ParErr+ Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- =
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 16
	NUMA node: 0
	Region 0: Memory at c5000000 (32-bit, non-prefetchable) =
[size=3D16M]
	Region 1: Memory at c6810000 (32-bit, non-prefetchable) =
[size=3D16K]
	Region 2: Memory at c6000000 (32-bit, non-prefetchable) =
[size=3D8M]
	Expansion ROM at 000c0000 [disabled] [size=3D128K]
	Capabilities: [dc] Power Management version 2
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=3D0mA =
PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 =
PME-
	Capabilities: [e4] Express (v1) Legacy Endpoint, MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s =
<64ns, L1 <1us
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
		DevCtl:	Report errors: Correctable+ Non-Fatal+ Fatal+ =
Unsupported-
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr- =
TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s, Exit =
Latency L0s <64ns
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ =
DLActive- BWMgmt- ABWMgmt-
	Capabilities: [54] MSI: Enable- Count=3D1/1 Maskable- 64bit-
		Address: 00000000  Data: 0000
	Kernel driver in use: mgag200
	Kernel modules: mgag200


> Best regards
> Thomas
>=20
>>=20
>> fb0: switching to mgag200drmfb from EFI VGA=20
>> mgag200 0000:04:00.0: vgaarb: deactivate vga console=20
>> fbcon: mgag200drmfb (fb0) is primary device=20
>> mgag200 0000:04:00.0: fb0: mgag200drmfb frame buffer device=20
>> [drm] Initialized mgag200 1.0.0 20110418 for 0000:04:00.0 on minor 0
>>=20
>> The systems worked fine with  4.18  kernels  and a recent Linux  =
5.2.18 ;  The symptom first appears in 5.3.6. and onward.=20
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>=20
>=20
> --=20
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>=20


--Apple-Mail=_05610C4C-1533-4AC5-9465-EBD037426277
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--Apple-Mail=_05610C4C-1533-4AC5-9465-EBD037426277--

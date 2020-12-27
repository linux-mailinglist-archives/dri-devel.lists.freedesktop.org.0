Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561482E32AD
	for <lists+dri-devel@lfdr.de>; Sun, 27 Dec 2020 21:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF368947A;
	Sun, 27 Dec 2020 20:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369968947A
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Dec 2020 20:17:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 981202255F
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Dec 2020 20:17:00 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 8BD1481F1E; Sun, 27 Dec 2020 20:17:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210321] /display/dc/dcn20/dcn20_resource.c:3240
 dcn20_validate_bandwidth_fp+0x8b/0xd0 [amdgpu]
Date: Sun, 27 Dec 2020 20:17:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: florian-evers@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210321-2300-PUlQNkzVqN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210321-2300@https.bugzilla.kernel.org/>
References: <bug-210321-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=210321

Florian Evers (florian-evers@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |florian-evers@gmx.de

--- Comment #1 from Florian Evers (florian-evers@gmx.de) ---
Similar issue un my box. Today I updated from kernel 5.9.16 to kernel 5.10.3
and found this in the dmesg log:


[So Dez 27 19:12:10 2020] ------------[ cut here ]------------
[So Dez 27 19:12:10 2020] WARNING: CPU: 16 PID: 4138 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:3240
dcn20_validate_bandwidth_fp+0x8b/0xd0
[So Dez 27 19:12:10 2020] CPU: 16 PID: 4138 Comm: X Tainted: G                T
5.10.3-gentoo #1
[So Dez 27 19:12:10 2020] Hardware name: Gigabyte Technology Co., Ltd. X570
AORUS MASTER/X570 AORUS MASTER, BIOS F30 09/07/2020
[So Dez 27 19:12:10 2020] RIP: 0010:dcn20_validate_bandwidth_fp+0x8b/0xd0
[So Dez 27 19:12:10 2020] Code: 01 7b 2b 22 85 0c 1f 00 00 75 25 31 d2 f2 0f 11
85 50 26 00 00 48 89 ee 4c 89 e7 e8 cf f5 ff ff 89 c2 22 95 0c 1f 00 00 75 32
<0f> 0b eb 02 75 d3 f2 0f 10 14 24 f2 0f 11 95 50 26 00 00 48 83 c4
[So Dez 27 19:12:10 2020] RSP: 0018:ffff9af6c5203b50 EFLAGS: 00010246
[So Dez 27 19:12:10 2020] RAX: 0000000000000001 RBX: 0000000000000000 RCX:
0000000000077770
[So Dez 27 19:12:10 2020] RDX: 0000000000000000 RSI: 1f37e77bc0bcc6d8 RDI:
000000000002adc0
[So Dez 27 19:12:10 2020] RBP: ffff8bceb4de0000 R08: 0000000000000006 R09:
0000000000000000
[So Dez 27 19:12:10 2020] R10: ffff8bcd43600000 R11: 0000000100000001 R12:
ffff8bcd43600000
[So Dez 27 19:12:10 2020] R13: ffff8bcd43600000 R14: ffff8bcd40ca4c90 R15:
ffff8bcd42ee0308
[So Dez 27 19:12:10 2020] FS:  00007fb79eed18c0(0000) GS:ffff8bdc3f000000(0000)
knlGS:0000000000000000
[So Dez 27 19:12:10 2020] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[So Dez 27 19:12:10 2020] CR2: 00005613b60d8608 CR3: 000000011a3a8000 CR4:
0000000000350ee0
[So Dez 27 19:12:10 2020] Call Trace:
[So Dez 27 19:12:10 2020]  dcn20_validate_bandwidth+0x1f/0x30
[So Dez 27 19:12:10 2020]  dc_validate_global_state+0x22f/0x2a0
[So Dez 27 19:12:10 2020]  amdgpu_dm_atomic_check+0xb02/0xbe0
[So Dez 27 19:12:10 2020]  drm_atomic_check_only+0x584/0x800
[So Dez 27 19:12:10 2020]  ? _raw_spin_unlock_irqrestore+0xf/0x30
[So Dez 27 19:12:10 2020]  drm_atomic_commit+0xe/0x50
[So Dez 27 19:12:10 2020]  drm_atomic_connector_commit_dpms+0xd2/0xf0
[So Dez 27 19:12:10 2020]  drm_mode_obj_set_property_ioctl+0x193/0x3d0
[So Dez 27 19:12:10 2020]  ? drm_connector_set_obj_prop+0x80/0x80
[So Dez 27 19:12:10 2020]  drm_connector_property_set_ioctl+0x3c/0x60
[So Dez 27 19:12:10 2020]  drm_ioctl_kernel+0xad/0xf0
[So Dez 27 19:12:10 2020]  drm_ioctl+0x215/0x390
[So Dez 27 19:12:10 2020]  ? drm_connector_set_obj_prop+0x80/0x80
[So Dez 27 19:12:10 2020]  amdgpu_drm_ioctl+0x44/0x80
[So Dez 27 19:12:10 2020]  __x64_sys_ioctl+0x7e/0xb0
[So Dez 27 19:12:10 2020]  do_syscall_64+0x33/0x80
[So Dez 27 19:12:10 2020]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[So Dez 27 19:12:10 2020] RIP: 0033:0x7fb79f103d77
[So Dez 27 19:12:10 2020] Code: 01 75 a5 49 8d 3c 1c e8 f7 fe ff ff 85 c0 78 a6
5b 4c 89 e0 5d 41 5c c3 66 2e 0f 1f 84 00 00 00 00 00 90 b8 10 00 00 00 0f 05
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c1 70 0c 00 f7 d8 64 89 01 48
[So Dez 27 19:12:10 2020] RSP: 002b:00007ffddf8e14d8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[So Dez 27 19:12:10 2020] RAX: ffffffffffffffda RBX: 00007ffddf8e1510 RCX:
00007fb79f103d77
[So Dez 27 19:12:10 2020] RDX: 00007ffddf8e1510 RSI: 00000000c01064ab RDI:
000000000000000c
[So Dez 27 19:12:10 2020] RBP: 00000000c01064ab R08: 0000000000000000 R09:
00007fb79f7d1d10
[So Dez 27 19:12:10 2020] R10: 00007fb79f7d1d20 R11: 0000000000000246 R12:
00005613b703c390
[So Dez 27 19:12:10 2020] R13: 000000000000000c R14: 0000000000000000 R15:
00005613b6113e00
[So Dez 27 19:12:10 2020] ---[ end trace 4936e0098b209a6c ]---


waterstation ~ # emerge --info
Portage 3.0.9 (python 3.8.6-final-0, default/linux/amd64/17.1/desktop/plasma,
gcc-9.3.0, glibc-2.32-r3, 5.10.3-gentoo x86_64)
=================================================================
System uname:
Linux-5.10.3-gentoo-x86_64-AMD_Ryzen_9_3900X_12-Core_Processor-with-glibc2.2.5
KiB Mem:    65794276 total,  56616072 free
KiB Swap:   16864252 total,  16864252 free
Timestamp of repository gentoo: Sun, 27 Dec 2020 15:00:01 +0000
Head commit of repository gentoo: 465bb6880edff24a20d24e074a4da935c3be4123
sh bash 5.0_p18
ld GNU ld (Gentoo 2.34 p6) 2.34.0
app-shells/bash:          5.0_p18::gentoo
dev-java/java-config:     2.3.1::gentoo
dev-lang/perl:            5.30.3::gentoo
dev-lang/python:          2.7.18-r4::gentoo, 3.7.9::gentoo, 3.8.6::gentoo,
3.9.0::gentoo
dev-util/cmake:           3.17.4-r1::gentoo
dev-util/pkgconfig:       0.29.2::gentoo
sys-apps/baselayout:      2.7::gentoo
sys-apps/openrc:          0.42.1::gentoo
sys-apps/sandbox:         2.20::gentoo
sys-devel/autoconf:       2.13-r1::gentoo, 2.69-r5::gentoo
sys-devel/automake:       1.16.2-r1::gentoo
sys-devel/binutils:       2.34-r2::gentoo
sys-devel/gcc:            9.3.0-r2::gentoo
sys-devel/gcc-config:     2.3.2-r1::gentoo
sys-devel/libtool:        2.4.6-r6::gentoo
sys-devel/make:           4.3::gentoo
sys-kernel/linux-headers: 5.10::gentoo (virtual/os-headers)
sys-libs/glibc:           2.32-r3::gentoo
Repositories:

gentoo
    location: /var/db/repos/gentoo
    sync-type: rsync
    sync-uri: rsync://rsync.gentoo.org/gentoo-portage
    priority: -1000
    sync-rsync-verify-max-age: 24
    sync-rsync-verify-metamanifest: yes
    sync-rsync-verify-jobs: 1
    sync-rsync-extra-opts: 

localrepo
    location: /usr/local/portage
    masters: gentoo

kde
    location: /var/lib/layman/kde
    masters: gentoo
    priority: 50

steam-overlay
    location: /var/lib/layman/steam-overlay
    masters: gentoo
    priority: 50

ACCEPT_KEYWORDS="amd64"
ACCEPT_LICENSE="*"
CBUILD="x86_64-pc-linux-gnu"
CFLAGS="-O2 -march=native -pipe"
CHOST="x86_64-pc-linux-gnu"
CONFIG_PROTECT="/etc /usr/lib64/libreoffice/program/sofficerc /usr/share/config
/usr/share/gnupg/qualified.txt /var/lib/unifi"
CONFIG_PROTECT_MASK="/etc/ca-certificates.conf /etc/dconf /etc/env.d
/etc/fonts/fonts.conf /etc/gconf /etc/gentoo-release /etc/revdep-rebuild
/etc/sandbox.d /etc/terminfo /etc/texmf/language.dat.d
/etc/texmf/language.def.d /etc/texmf/updmap.d /etc/texmf/web2c"
CXXFLAGS="-O2 -march=native -pipe"
DISTDIR="/var/cache/distfiles"
ENV_UNSET="CARGO_HOME DBUS_SESSION_BUS_ADDRESS DISPLAY GOBIN GOPATH PERL5LIB
PERL5OPT PERLPREFIX PERL_CORE PERL_MB_OPT PERL_MM_OPT XAUTHORITY XDG_CACHE_HOME
XDG_CONFIG_HOME XDG_DATA_HOME XDG_RUNTIME_DIR"
FCFLAGS="-O2 -pipe"
FEATURES="assume-digests binpkg-docompress binpkg-dostrip binpkg-logs
config-protect-if-modified distlocks ebuild-locks fixlafiles ipc-sandbox
merge-sync multilib-strict network-sandbox news parallel-fetch pid-sandbox
preserve-libs protect-owned qa-unresolved-soname-deps sandbox sfperms strict
unknown-features-warn unmerge-logs unmerge-orphans userfetch userpriv
usersandbox usersync xattr"
FFLAGS="-O2 -pipe"
GENTOO_MIRRORS="http://distfiles.gentoo.org"
LANG="de_DE.utf8"
LDFLAGS="-Wl,-O1 -Wl,--as-needed"
LINGUAS="de en ru"
MAKEOPTS="-j20"
PKGDIR="/var/cache/binpkgs"
PORTAGE_CONFIGROOT="/"
PORTAGE_RSYNC_OPTS="--recursive --links --safe-links --perms --times
--omit-dir-times --compress --force --whole-file --delete --stats
--human-readable --timeout=180 --exclude=/distfiles --exclude=/local
--exclude=/packages --exclude=/.git"
PORTAGE_TMPDIR="/var/tmp"
USE="X a52 aac acl acpi activities alsa amd64 bash-completion berkdb bluetooth
branding browserplugin bzip2 cairo caps cdda cddb cdr cli crypt cups dbus
declarative dri dts dvd dvdr elogind emboss encode epub exif farstream
fbcondecor flac fortran g3dvl gbm gdbm gif git gpg gphoto2 gpm gui iconv icq
icu inotify ipod ipv6 jabber jingle jpeg kde kipi kolab kpathsea kwallet latex
lcms lensfun libglvnd libnotify libtirpc mad mercurial mikmod mmx mmxext mng
mod mp3 mp4 mpeg multilib mythtv ncurses netlink nls nptl nsplugin ogg opengl
openmp opus oscar otr pam pango pch pcre pdf phonon plasma png policykit ppds
pulseaudio qml qt5 raw rdesktop rdp readline rss scanner sdl seccomp
semantic-desktop sip skype spell split-usr sse sse2 sse3 sse4_1 ssl ssse3
startup-notification svg taglib tcpd theora thumbnail tiff truetype udev udisks
unicode upower usb v4l v4l2 vaapi video vlc vnc vorbis vulkan widgets wxwidgets
x264 xattr xcb xcomposite xml xmpp xv xvid zip zlib" ABI_X86="64"
ADA_TARGET="gnat_2018" ALSA_CARDS="ali5451 als4000 atiixp atiixp-modem bt87x
ca0106 cmipci emu10k1x ens1370 ens1371 es1938 es1968 fm801 hda-intel intel8x0
intel8x0m maestro3 trident usb-audio via82xx via82xx-modem ymfpci"
APACHE2_MODULES="authn_core authz_core socache_shmcb unixd actions alias
auth_basic authn_alias authn_anon authn_dbm authn_default authn_file authz_dbm
authz_default authz_groupfile authz_host authz_owner authz_user autoindex cache
cgi cgid dav dav_fs dav_lock deflate dir disk_cache env expires ext_filter
file_cache filter headers include info log_config logio mem_cache mime
mime_magic negotiation rewrite setenvif speling status unique_id userdir
usertrack vhost_alias" CALLIGRA_FEATURES="karbon sheets words" CAMERAS="canon
ptp2" COLLECTD_PLUGINS="df interface irq load memory rrdtool swap syslog"
CPU_FLAGS_X86="aes avx avx2 f16c fma3 mmx mmxext pclmul popcnt sha sse sse2
sse3 sse4_1 sse4_2 sse4a ssse3" ELIBC="glibc" GPSD_PROTOCOLS="ashtech aivdm
earthmate evermore fv18 garmin garmintxt gpsclock greis isync itrax mtk3301
nmea ntrip navcom oceanserver oldstyle oncore rtcm104v2 rtcm104v3 sirf skytraq
superstar2 timing tsip tripmate tnt ublox ubx" GRUB_PLATFORMS="efi-64"
INPUT_DEVICES="libinput" KERNEL="linux" L10N="de en ru" LCD_DEVICES="bayrad
cfontz cfontz633 glk hd44780 lb216 lcdm001 mtxorb ncurses text"
LIBREOFFICE_EXTENSIONS="presenter-console presenter-minimizer"
LUA_SINGLE_TARGET="lua5-1" LUA_TARGETS="lua5-1"
OFFICE_IMPLEMENTATION="libreoffice" PHP_TARGETS="php7-2 php7-3 php7-4"
POSTGRES_TARGETS="postgres10 postgres11" PYTHON_SINGLE_TARGET="python3_8"
PYTHON_TARGETS="python2_7 python3_8" RUBY_TARGETS="ruby25 ruby26"
SANE_BACKENDS="epson epson2" USERLAND="GNU" VIDEO_CARDS="amdgpu radeonsi
radeon" XTABLES_ADDONS="quota2 psd pknock lscan length2 ipv4options ipset ipp2p
iface geoip fuzzy condition tee tarpit sysrq steal rawnat logmark ipmark
dhcpmac delude chaos account"
Unset:  CC, CPPFLAGS, CTARGET, CXX, EMERGE_DEFAULT_OPTS, INSTALL_MASK, LC_ALL,
PORTAGE_BINHOST, PORTAGE_BUNZIP2_COMMAND, PORTAGE_COMPRESS,
PORTAGE_COMPRESS_FLAGS, PORTAGE_RSYNC_EXTRA_OPTS

waterstation ~ # 

Regards,
Florian

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

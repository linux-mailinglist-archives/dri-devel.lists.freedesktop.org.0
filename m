Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C586585B65
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 19:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D799B10E4A1;
	Sat, 30 Jul 2022 17:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383C210E0CF
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659202000;
 bh=NHO94zdmagMHUsaDXQDJxauKZL4m2T37y8DaXk+oiBc=;
 h=X-UI-Sender-Class:Date:To:References:From:Subject:In-Reply-To;
 b=jFgm+bEdqMuhl1Zs4lJl96dRyYIWLgx8CrqS5eLJz2HK0s9qX6lIbxcinXUIWEqIR
 1py8f8ma80kYmdqKFDYB0Z/WD4cN8mkE707PLR2o7+xLXItZoi7lxYgGIH5Lt31IMI
 ohJQuq1cvd1pxgbTiFqqTkQCnFFs00Wusdz6lr4o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.141.10]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MryT9-1nczZt1jbJ-00nx62; Sat, 30
 Jul 2022 19:26:40 +0200
Message-ID: <eb4a26aa-da30-ceee-7d27-c1e902dd4218@gmx.de>
Date: Sat, 30 Jul 2022 19:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Khalid Masum <khalid.masum.92@gmail.com>,
 syzbot <syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <000000000000bbdd0405d120c155@google.com>
 <20220729065139.6529-1-khalid.masum.92@gmail.com>
From: Helge Deller <deller@gmx.de>
Subject: Re: [syzbot] KASAN: vmalloc-out-of-bounds Write in imageblit (2)
In-Reply-To: <20220729065139.6529-1-khalid.masum.92@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HGCv5+J9ExWMCvImsXbvpBDgH9cpBuokI7iRcT+dOsw/ko38cY9
 SauhNpWSWmZzKrt5xX6ITQ6sb6lWTkFiwQkvO+yzGOoyFWlfWy5XlbDyvOeWq3nRlFjpdhC
 ESNk6veDYuTCjd9wePfrPwAswVRaA/seIpRF4xZ9WqT1fmWSQNO4t/7TcxhDz534AcuoNsU
 3BCm6PoXilYYBfZBeBmcA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aDU7BcE4hgI=:qfxsIq0NSZeQZEe8pA7/w/
 T9ytiztTMBThUU3DgPT2KMg59zNcAhp8y+rs58ym4kr7mtXkGKYoZYyk0jWElG+BeLDplwVmJ
 5uR+kvfOLYY0AWSXRcAecWIBMaH6C/TQl4VRi5KDEdp1iHRFfc5g/YeI4Zj0rQJer0xWbJA4g
 u2D39D6T16h9KygS25A65lT9m3gzwVCufr/3+7bz2BYpsKr7+dZNXYs3InVQFzYvRfks9LQ8a
 /hTC7rRCIQK7Qqq9HtlTlQ2D1MuYV9ii9Rux/v3ZQJ7d4SDDy9OhiVzDbsAqBR/mgjLdk+5jp
 fnDX2WuIUeCJOzeCJsl+qgzk4jz6VV6qQnJLTnsRbMCuc18vsLk9DTpd5hDJ2Sb+Vi55s3dZZ
 qBhFt1GCWYbxLFcPfMvXdPuoDtz0GZdHUVtpv4/8DsGFZoxtUgZLiV0etVcVxN8cY4DWsP7kX
 1dB4fsdz3Q8lPc8SHlhXZ5PnDtTCRH9YnSV7LkHuaYYykw+mqgBgR9O5u0q2rlGKWJ5Z0Nouq
 nh+mEMtci2A5RBspbkQlc5UaboG2VkapLP8dc69Cm3jgBmNtP5CE1+KPuOjiQlhHKaOSED39P
 6JaNez5IL592syxGuOD/xSg/K98O5H9nfhcLKzwv+eQvLDFHIGU8v/3/sKh0q0VG5pTve7vJ0
 8F3+eXCwtYq3BpHzuxF8e2uIrUt6N2UG3V5/zfvLgwWdwXJaO/McZLSVst/fNUUg2rHZj6U8E
 FTiFGC1qSJcoJjw2R7p0VwdUTsSetequo8Mf8DEIVRwVWSMwt7dMSfxLe7+8dfAzmSFzxjuYq
 HvEwqKgoBpIY//3HyNpZgGHm3Q2Xe5YDW/EMlxcojuXJvhBqcGDkWUdRy2FgSCE6/sArrHVG+
 rREMgRnFY5pk8VyqstwVQZLAlmjBvWvmi9sZytyAyfynlimkhEqf6kOXi/C+HI9x8uXRBsEmb
 AXanJSjg8+kT/wagQLnFCObzCAEHmVFYKWyPjGB5k7LGlvcuRw9Zonbaue4ed0fzvQ4hNzDOl
 fbHMdkjqfolBATOcmK8anKplX3YKSGHooQ0oXSLA1I8mmHf6T7fuliI5zisbaWInhKfxvLziZ
 +B9ED5iiXFCSfP53TMra3nbk2xR+0QnpMsnioh/G1h8AAk8LtG+pKuZ+A==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/29/22 08:51, Khalid Masum wrote:
> Here is a simplified reproducer for the issue:
>
> https://gist.githubusercontent.com/Labnann/923d6b9b3a19848fc129637b839b8=
a55/raw/a68271fcc724569735fe27f80817e561b3ff629a/reproducer.c

The reproducer does this:
ioctl(3, TIOCLINUX, TIOCL_SETSEL, selection: xs:3  ys:0  xe:0 ye:0 mode:0)=
  =3D 0
-> sets the text selection area
ioctl(4, KDFONTOP)  with op=3D0 (con_font_set), charcount=3D512  width=3D8=
  height=3D32, 0x20000000) =3D 0
-> changes the font size.

It does not crash with current Linus' head (v5.19-rc8).
Kernel v5.16, which was used by this KASAN report, hasn't received backpor=
ts
since months, so I tried stable kernel v5.15.58 instead, and this
kernel crashed with the reproducer.

The reproducer brings up two issues with current code:
1. The reproducer uses ioctl(TIOCLINUX, TIOCL_SETSEL) and hands over (inva=
lid)
zero-values for ys and ye for the starting lines.
This is wrong, since the API seems to expect a "1" as the very first line =
for the selection.
This can be easily fixed by adding checks for zero-values and return -EINV=
AL if found.

But this bug isn't critical itself and is not the reason for the kernel cr=
ash.
Without the checks, the ioctl handler simply wraps the coordinate values a=
nd converts them
from:
input selection: xs:3  ys:0  xe:0   ye:0  mode:0    to the new:
vc_selection =3D   xs:2  ys:23 xe:127 ye:23 mode:0
which is the current maximum coordinates for the screen.

Those higher values now trigger issue #2:
After the TIOCL_SETSEL the last line on the screen is now selected. The KD=
FONTOP ioctl
then sets a 8x32 console font, and replaces the former 8x16 console font.
With the bigger font the current screen selection is now outside the visib=
le screen
and this finally triggeres this backtrace, because vc_do_resize() calls cl=
ear_selection()
to unhighlight the selection (which starts to render chars outside of the =
screen):

 drm_fb_helper_sys_imageblit drivers/gpu/drm/drm_fb_helper.c:794 [inline]
 drm_fbdev_fb_imageblit+0x15c/0x350 drivers/gpu/drm/drm_fb_helper.c:2288
 bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:124 [inline]
 bit_putcs+0x6e1/0xd20 drivers/video/fbdev/core/bitblit.c:173
 fbcon_putcs+0x353/0x440 drivers/video/fbdev/core/fbcon.c:1277
 do_update_region+0x399/0x630 drivers/tty/vt/vt.c:676
 invert_screen+0x1d4/0x600 drivers/tty/vt/vt.c:800
 highlight drivers/tty/vt/selection.c:57 [inline]
 clear_selection drivers/tty/vt/selection.c:84 [inline]
 clear_selection+0x55/0x70 drivers/tty/vt/selection.c:80
 vc_do_resize+0xe6e/0x1180 drivers/tty/vt/vt.c:1257

IMHO the easiest way to prevent this crash is to simply clear the
selection before the various con_font_set() console handlers are called.
Otherwise every console driver needs to add checks and verify if the curre=
nt
selection still fits with the selected font, which gets tricky because som=
e
of those drivers fiddle with the screen width&height before calling vc_do_=
resize().

I'll follow up to this mail with patches for both issues shortly.

Helge

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 099197DC306
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 00:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A5D10E3AA;
	Mon, 30 Oct 2023 23:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC8F10E3A7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 23:04:08 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5437269a661so39503a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 16:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698707046; x=1699311846; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SGcZEnfSFmwJr08khAOFTxASILzTa9mwym6iyelmTPo=;
 b=HwdZ0NtSUxDURbHVUqP2n51wZWF5gPEP9JsQg1LpRC1uz6Hs99uXFVygDguYuEpzkW
 lKkpWedzZ6PrPUen3GyEXO0jGr7VuG4MtToCS99LTCma2WwtgxxDjDif/eKzSv+YX8jO
 kXNZn5WxSDEgldciLsumFBGN0ykiFvHX6xOtGLYZHXe7lTQIPHrvhF8T/0wlIpcOl5zS
 1JTiWTxGnEefJDgZ8q+sbUoEmVz7JMLi2qFPxitwaA5Cj+BZcncPo+vhWscBYSmYk0+I
 Jng0XsPHbS2u978L8SIPRfNCLawL/pBJegiNYdEQnryU2F+4sZpnPyuNS3Oug0y5KPMt
 wb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698707046; x=1699311846;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SGcZEnfSFmwJr08khAOFTxASILzTa9mwym6iyelmTPo=;
 b=qZq275UGVhRNdO/yJn62yPdTXVHOeeTVxFRSzZEvQ600Hso7nWNnhTokQ2KlfzhAQI
 CdIZBklzfBbbygQQVf9b/U1zInOeY4MPWBNpdDH8GnH3ui9iswlHCNkQBoHzho7VafGc
 nx+rOKqnbta3cEqDdqB4meOQDHtpJHFgvYmsNINfbzw5ftgGcB9FABFhfKhJh5v2gAUB
 6ElXjZAxmRb8EljPLfIEznAbU9GRL/2MlQe5C2FPaGV8t/4a36xpbCHdIJ8zxsZpZZBS
 6tR1al729L9r2Eih6uWiXSEJBYmZrf73dz3ZhfUDXo68gx2pwstLKksCYxzIcIdA32jx
 Fqsg==
X-Gm-Message-State: AOJu0YxkVNIu1WGvciBV26cCna94XNeaOgy+PVnjeNNpg6fKvwXab6Rx
 EaAaKbQfXONRDIeqdKb8Pik6v8wVZ37EOcE8N0E=
X-Google-Smtp-Source: AGHT+IFR0jtuMJZL0DuZ/XUOO8dVCYXYsHnqJUhlahm+7303SDYakhtm9MSbLHaC0AVgLWpQRAfCw/g6YGVoLFfANtQ=
X-Received: by 2002:a17:906:bcd7:b0:9ad:8641:e91b with SMTP id
 lw23-20020a170906bcd700b009ad8641e91bmr869023ejb.11.1698707046119; Mon, 30
 Oct 2023 16:04:06 -0700 (PDT)
MIME-Version: 1.0
From: Mario Marietto <marietto2008@gmail.com>
Date: Tue, 31 Oct 2023 00:03:29 +0100
Message-ID: <CA+1FSign611=47=xLRucFhDjvs7A_TeFE9b8qO63WXDU8Pnkjg@mail.gmail.com>
Subject: exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma] *ERROR*
 Device 14450000.mixer lacks support for IOMMU
To: "linux-phy@lists.infradead.org Cc: Marek Szyprowski"
 <m.szyprowski@samsung.com>, Sylwester Nawrocki <snawrocki@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Content-Type: multipart/alternative; boundary="0000000000000fbe6f0608f70e4e"
X-Mailman-Approved-At: Mon, 30 Oct 2023 23:15:56 +0000
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

--0000000000000fbe6f0608f70e4e
Content-Type: text/plain; charset="UTF-8"

Hello,

We are a team of linux enthusiasts who are trying to boot Xen on a
Samsung XE303C12 Chromebook aka "snow"
following the suggestions in the slide show presentation here:
https://www.slideshare.net/xen_com_mgr/xpds16-porting-xen-on-arm-to-a-new-soc-julien-grall-arm

This device uses an exynos5250 SOC dual core 1.7 GHz with 2 MB RAM, it is
a Samsung armv7 chip with virtualization extensions.

In particular, we have it working fairly well both on the bare metal with
a recent 6.1.59 Linux LTS kernel and also with a recent 5.4.257 LTS
kernel with KVM, the older LTS kernel version is used to test KVM because
support for KVM on arm v7 was removed from Linux around kernel version
5.7. So we know we have the hypervisor mode enabled because we were able
to use it with KVM.

For Xen, we are using the latest Debian build of Xen 4.17 for the Debian
armhf architecture:

(XEN) Xen version 4.17.2-pre (Debian 4.17.1+2-gb773c48e36-1)
(pkg-xen-devel@xxxxxxxxxxxxxxxxxxxxxxx) (arm-linux-gnueabihf-gcc (Debian
12.2.0-14) 12.2.0) debug=n Thu May 18 19:26:30 UTC 2023

The Linux kernel is a custom build that adds the Xen config kernel
options (CONFIG_XEN_DOM0, etc) on top of a kernel that works well on the
same Chromebook model on the bare metal. I can provide the config options
of the kernel that was used if that is helpful.

Our method of booting is to have u-boot boot the Xen hypervisor and load
the device tree after adding the dom0 to the otherwise unaltered device
tree from the Linux kernel using u-boot fdt commands to add a /chosen
node, as described on the Xen wiki and in the pages linked from there. We
have also tried adding and loading an initrd.img using the device tree
/chosen node but that made no difference in our tests.

We actually have the Linux LTS kernel version 6.1.59 working as dom0 with
Xen using the same version of u-boot that we used for KVM, but with a big
problem.

The problem we see is that when booting the 6.1.59 kernel version as dom0
with Xen, the screen is totally dark and the only way to access the
system is remotely through ssh. Logs indicate most everything else is
working, such as the wifi card so we can access it remotely via ssh and a
USB optical mouse lights up when connected so USB is also working.
Obviously, the disk is also working. The Chromebook is configured to boot
from the device's SD card slot by turning on Chrome OS developer mode
options to enable booting from the SD card slot.

The mystery is that when booting the exact same 6.1.59 kernel on the bare
metal instead of booting it as dom0 on Xen, it boots up with full access
to the screen and we can interact with the system using the X.org windows
system. But booting as dom0 with Xen, the screen is totally dark and the
only access we have to the system is through the network via ssh. Also,
when booting the 5.4.257 kernel with KVM in hypervisor mode, the screen
works and we can interact with the system through the X.org windows
system.
Exploring the log file,we have seen the errors below :


With Xen (or in bare metal):

devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for DMA
mapping operations
devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops
0xc0d96354)
devuan-bunsen kernel: exynos-drm exynos-drm: bound 14450000.mixer (ops
0xc0d97554)
devuan-bunsen kernel: exynos-drm exynos-drm: bound 145b0000.dp-controller
(ops 0xc0d97278)
devuan-bunsen kernel: exynos-drm exynos-drm: bound 14530000.hdmi (ops
0xc0d97bd0)
...
devuan-bunsen kernel: Console: switching to colour frame buffer device
170x48
devuan-bunsen kernel: exynos-drm exynos-drm: [drm] fb0: exynosdrmfb frame
buffer device
devuan-bunsen kernel: [drm] Initialized exynos 1.1.0 20180330 for
exynos-drm on minor 0

In this case,the kernel is able to use the exynos-drm kernel to start the
fb0 device. But with Xen we get this error with exynos-drm:

devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for DMA
mapping operations
devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops
0xc0d96354)
devuan-bunsen kernel: exynos-mixer 14450000.mixer:
[drm:exynos_drm_register_dma] *ERROR* Device 14450000.mixer lacks support
for IOMMU
devuan-bunsen kernel: exynos-drm exynos-drm: failed to bind 14450000.mixer
(ops 0xc0d97554): -22
devuan-bunsen kernel: exynos-drm exynos-drm: adev bind failed: -22
devuan-bunsen kernel: exynos-dp: probe of 145b0000.dp-controller failed
with error -22

I'm trying to find for a solution and I've googled a little bit and I
found this web site :

https://lore.kernel.org/linux-arm-kernel/20220208171823.226211-8-krzysztof.kozlowski@canonical.com/

with your email address and I tried to ask for some help for fixing the bug.

Any ideas why booting the same Linux kernel that results in a working
X.org display on the bare metal instead as dom0 on Xen would cause the
display to remain dark, but most other basic functions would work, such
as network, disk, and USB ? thanks.


-- 
Mario.

--0000000000000fbe6f0608f70e4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre><font size=3D"4">Hello,

We are a team of linux enthusiasts who are trying to boot Xen on a Samsung =
XE303C12 Chromebook aka &quot;snow&quot; <br>following the suggestions in t=
he slide show presentation here:

<a rel=3D"nofollow" href=3D"https://www.slideshare.net/xen_com_mgr/xpds16-p=
orting-xen-on-arm-to-a-new-soc-julien-grall-arm" target=3D"_blank">https://=
www.slideshare.net/xen_com_mgr/xpds16-porting-xen-on-arm-to-a-new-soc-julie=
n-grall-arm</a>

This device uses an exynos5250 SOC dual core 1.7 GHz with 2 MB RAM, it is
a Samsung armv7 chip with virtualization extensions.

In particular, we have it working fairly well both on the bare metal with
a recent 6.1.59 Linux LTS kernel and also with a recent 5.4.257 LTS
kernel with KVM, the older LTS kernel version is used to test KVM because
support for KVM on arm v7 was removed from Linux around kernel version
5.7. So we know we have the hypervisor mode enabled because we were able
to use it with KVM.

For Xen, we are using the latest Debian build of Xen 4.17 for the Debian
armhf architecture:

(XEN) Xen version 4.17.2-pre (Debian 4.17.1+2-gb773c48e36-1)=20
(pkg-xen-devel@xxxxxxxxxxxxxxxxxxxxxxx) (arm-linux-gnueabihf-gcc (Debian=20
12.2.0-14) 12.2.0) debug=3Dn Thu May 18 19:26:30 UTC 2023

The Linux kernel is a custom build that adds the Xen config kernel
options (CONFIG_XEN_DOM0, etc) on top of a kernel that works well on the
same Chromebook model on the bare metal. I can provide the config options
of the kernel that was used if that is helpful.

Our method of booting is to have u-boot boot the Xen hypervisor and load
the device tree after adding the dom0 to the otherwise unaltered device
tree from the Linux kernel using u-boot fdt commands to add a /chosen
node, as described on the Xen wiki and in the pages linked from there. We
have also tried adding and loading an initrd.img using the device tree
/chosen node but that made no difference in our tests.

We actually have the Linux LTS kernel version 6.1.59 working as dom0 with
Xen using the same version of u-boot that we used for KVM, but with a big
problem.

The problem we see is that when booting the 6.1.59 kernel version as dom0
with Xen, the screen is totally dark and the only way to access the
system is remotely through ssh. Logs indicate most everything else is
working, such as the wifi card so we can access it remotely via ssh and a
USB optical mouse lights up when connected so USB is also working.
Obviously, the disk is also working. The Chromebook is configured to boot
from the device&#39;s SD card slot by turning on Chrome OS developer mode
options to enable booting from the SD card slot.

The mystery is that when booting the exact same 6.1.59 kernel on the bare
metal instead of booting it as dom0 on Xen, it boots up with full access
to the screen and we can interact with the system using the X.org windows
system. But booting as dom0 with Xen, the screen is totally dark and the
only access we have to the system is through the network via ssh. Also,
when booting the 5.4.257 kernel with KVM in hypervisor mode, the screen
works and we can interact with the system through the X.org windows
system.

</font><font size=3D"4">Exploring the log file,we have seen the errors belo=
w :</font></pre><div><font size=3D"4"><br></font></div><font size=3D"4">Wit=
h Xen (or in bare metal):<br></font><div><font size=3D"4"><br></font></div>=
<div><font size=3D"4">devuan-bunsen kernel: [drm] Exynos DRM: using 1440000=
0.fimd device for DMA mapping operations</font></div><div><div id=3D"m_6495=
910167566835569m_-5219382395617375173m_4661702087819206082m_472047512059706=
3903m_-672681071931209790m_7898463182782513534:uo"><font size=3D"4">devuan-=
bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops 0xc0d96354)<=
/font><font size=3D"4">=C2=A0</font></div><div><font size=3D"4">devuan-buns=
en kernel: exynos-drm exynos-drm: bound 14450000.mixer (ops 0xc0d97554)<br>=
</font><font size=3D"4">devuan-bunsen kernel: exynos-drm exynos-drm: bound =
145b0000.dp-controller (ops 0xc0d97278)<br></font><font size=3D"4">devuan-b=
unsen kernel: exynos-drm exynos-drm: bound 14530000.hdmi (ops 0xc0d97bd0)<b=
r>
...<br></font></div><div><font size=3D"4">devuan-bunsen kernel: Console: sw=
itching to colour frame buffer device 170x48<br></font></div><div><font siz=
e=3D"4">devuan-bunsen kernel: exynos-drm exynos-drm: [drm] fb0: exynosdrmfb=
 frame buffer device<br></font></div><div><font size=3D"4">devuan-bunsen ke=
rnel: [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0<br>=
</font>
</div><div><font size=3D"4"></font></div><div><font size=3D"4"><br>
In this case,the kernel is able to use the exynos-drm kernel=20
to start the fb0 device. But with Xen we get this error with exynos-drm:<br=
></font>
</div><div><font size=3D"4"></font></div><div><font size=3D"4"><br></font><=
font size=3D"4">devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd=
 device for DMA mapping operations<br></font><font size=3D"4">devuan-bunsen=
 kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops 0xc0d96354)<br></f=
ont><font size=3D"4">devuan-bunsen kernel: exynos-mixer 14450000.mixer: [dr=
m:exynos_drm_register_dma]=20
*ERROR* Device 14450000.mixer lacks support for IOMMU<br></font><font size=
=3D"4">devuan-bunsen kernel: exynos-drm exynos-drm: failed to bind 14450000=
.mixer (ops 0xc0d97554): -22<br></font><font size=3D"4">devuan-bunsen kerne=
l: exynos-drm exynos-drm: adev bind failed: -22<br></font>
</div><div><font size=3D"4">devuan-bunsen kernel: exynos-dp: probe of 145b0=
000.dp-controller failed with error -22</font><br>
</div><div><br></div></div><pre><font size=3D"4">I&#39;m trying to find for=
 a solution and I&#39;ve googled a little bit and I found this web site :<b=
r> <br><a href=3D"https://lore.kernel.org/linux-arm-kernel/20220208171823.2=
26211-8-krzysztof.kozlowski@canonical.com/">https://lore.kernel.org/linux-a=
rm-kernel/20220208171823.226211-8-krzysztof.kozlowski@canonical.com/</a><br=
><br>with your email address and I tried to ask for some help for fixing th=
e bug.<br><br>Any ideas why booting the same Linux kernel that results in a=
 working
X.org display on the bare metal instead as dom0 on Xen would cause the
display to remain dark, but most other basic functions would work, such
as network, disk, and USB ? thanks.<font color=3D"#888888"><br></font></fon=
t></pre><br><span class=3D"gmail_signature_prefix">-- </span><br><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Mario=
.<br></div></div>

--0000000000000fbe6f0608f70e4e--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5A458086E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C190A10F4C8;
	Mon, 25 Jul 2022 23:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0900110F4AF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793136;
 bh=04URxhWWC1wUKBFcpHcfMB5qOIgg0QS9AKuynTCcNv4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=JPVCMvdP7QKNzDYFKoXziRIlFIJB4PUNAxBEGAIcawtoimFge0LjmZ/rhDY9lG9Sw
 VSoOpHtmBxW+EHMRV8Yt9WZK1gTeNS/hWYMcyYecCn9DgE2j/fHomDdqnIV574sXdt
 gUtby0wznDY+jXlSlG7KNBqFrlZRRORzJLz20He0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MfpOd-1naCTl41Vp-00gHsn; Tue, 26 Jul 2022 01:52:16 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/32] OpenChrome DRM for Linux 5.20
Date: Mon, 25 Jul 2022 16:50:55 -0700
Message-Id: <20220725235127.20433-1-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iUh/FawBBDJZG9dUwK3NwI3FU6su36FW6gK3qklYj0lBgfKsHlB
 A3ahE8c1sjSJdyC3aciNktIJrIcQeK81VrKQOlQ93Mz5YMOOSewYK3nH6mDcKVEv2m3lkky
 tE4Om3Lvn4TH9lnLW3UrRJ0FMbkRY5moVk9sWPok+RkiwH18ytgOLZvUiJIwucqmSScU254
 V3YtLvLIZDXlApFSw7otw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UpK7zsZmqW0=:1jgJ3jVaFxJxaPf5ro6YEU
 IiGLb2fZtPPC7dhz2j2R0wn28b9Doq9yVb5hYt3mjYITRN5jnty+4+1e7ZhO4VwF2ZSwVELIS
 bEnACCIhIcf8g15bDzz0Jv5AQNqO0/bxCrpzGayAGTcvOhR9SGDLUD5lGBokhOxm67BKnu8Zu
 7dnQAjf2W85hyPWink+51VYqVBE656vQI3K5ZWkdhUHbUEkc9NhQt1dL1/OowYnyGDj/bEdj7
 YO82UGtEr6WC7N4j055og6M7HF9qcPmKBwr6zmqzMwnlDrcA9B5j9LIDwNBUQliJMf0KOUW8x
 Vio3EWFLvxR9rAKnEE7R235rcQj+BufYwmm3TlYogG7t1Vf7PoWoq0KB4H88l8U9CRZkQnpMG
 T6yLM0jwGUwXwH3YtHNQX9xzE9MidDG/UDfJApAj2uy5ABnpNP+Gn23YGaNPMTKnM8p2JWGix
 FANeR6gQhV+7ztzxoAcxJwk2MhgAHhKJ29YI0NGBc3/RKOnJrcTMG2Y/0TibsJpN9L+EZpmIV
 WYr47DoTgFNHMNKUDhKptxOag1yHqhDTe94PayHN8DF4C9DMJfClyKwmswg67DzNVkjMhoVnO
 PtAE0LQW5uNSbpkrUib5ecRYTMcu1PQq5+JVrJjZSd50nVPQvcllXLamEuL1JY/oPtyxM8dYU
 sq8m7dHLTbG3tW1zHYJJ2O5wrS+z0Dsvf0ei/uYrPFHQ/+22dmSWEC8ITOKAvQw+gvn/SoztT
 rzs0YILmxgYVm/AOQl+5m5GlBNd/QkCWljI/4d/JCb0kVT3ReNm4oIKDwIzdC9/Be2hK5HSTk
 UalUTFKUpFfI12IlRi7bsGzqkfT1011YkEiPc3AKZXwvZrNJ7dDYkwaAW8bU8PlC0P1q6dvdA
 Gf6IHt3WGGCTfKAjfOOkqdrfchsCjwd3UQeIeYklkfbZvV2zTteAkwiF7gt+1aybvh34b9Ea6
 cQ06xxSe0FrrpQ1qO9rkl46Zh6PAt783X79Ug+locdGkiadwgeWk3oGXrmO8myJ6VBgYEpEqL
 Av+so2eA29Xr9Ez7hWW30115QtwoNu1uuOVlLKTX1JTqhpd6KsdGzcmcEfYvsIUwKxvEWjTWA
 IcOGO9EMUxG39EDiKekG69O6nHPjNxlxsgUY44Sejw9mq+RlZ0VUN7q2w==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Hi,

This is my first attempt (this is not a RFC posting) in trying to get
OpenChrome DRM pulled in for Linux 5.20.
I started to work on this seriously around the summer of 2017, so it has
been a long journey.
I know that the code is not quite perfect, but I have done as much work
as I can do on my own, and I now think that I should post the code on
dri-devel mailing list for other people to take a look at it.
Whether or not the code itself works or not, no, OpenChrome DRM is not
some vaporware, and the code reliability is comparable to the existing
OpenChrome DDX UMS code path.
The code reliability is more than good enough to the point where I utilize
the module almost every time I work on developing the code.
I am aware that the hardware (silicon) is quite old by today's standards,
so not too many people "still" (the word one open source software focused
journalist often uses to describe greater than 5 year old computer
hardware) own the VIA silicon hardware to actually test the code
themselves.
The current code is developed against drm-next branch
drm-next-2022-06-03-1 tag.
The current iteration of the code has no support for acceleration.
It is currently a mode setting only DRM module.
Even if the code is pulled into the Linux kernel tree, I will consider
the code experimental until at least 2D acceleration is implemented for
all supported devices.
Because of this, the DRM module requires via.modeset=3D1 to be added to
Linux kernel boot option line for it to function, and I intend to keep
this arrangement in place until at least 2D acceleration is fully
supported.
As a result, I think the code is fairly low risk to be pulled into the
Linux kernel tree.
The current module version is 3.5.7, but when the code is about to
be pulled into the kernel tree, I will like to up the version to 4.0.0.
This is because James Simmons era OpenChrome DRM used version number
3.0.x, but the current OpenChrome DRM uAPI implementation is different
from his implementation, so I will like to assign a new major version
(i.e., 4) so that DDX can distinguish the old and new OpenChrome DRM.
The current uAPI has no backward compatibility with the older DRI1 based
implementation, although some remnants of old DRI1 based uAPI still needs
to be there inside via_drm.h for XvMC based libraries on the DDX side to
properly compile.
It is my intention to replace the old DRI1 based VIA DRM located at
drivers/gpu/drm/via/ with OpenChrome DRM at the same location.
As I indicated previously, I do not wish to get pulled into the staging
area of the kernel tree.
I personally will like to have the option of porting the code to
BSD someday, however, the I2C bus access module (via_i2c.c) is GPL
based, so the DRM module license type is GPL (everything else is MIT
license based), for now.
I hope to replace this module someday with equivalent functionality
code that will be MIT license based.
I hope the uAPI variable types are compatible with BSD (please give
me advise on this since I do not know too much about this) since James
Simmons brought this up back in 2013 when he posted the code as RFC.

https://lists.freedesktop.org/archives/dri-devel/2013-June/039594.html
https://lists.freedesktop.org/archives/dri-devel/2013-June/040811.html


Features:

- Supports 12 different generations of VIA Technologies Chrome based
integrated graphics (CLE266 / KM400 / K8M800 / P4M800 Pro / PM800 /
P4M890 / K8M890 / P4M900 / CX700 / VX800 / VX855 / VX900 chipset) and
their variants
- Support for DAC (VGA), LVDS flat panel, DVI (CX700 / VX800 chipset
integrated, VX900 chipset integrated, and Silicon Image SiI164 /
VIA Technologies VT1632(A) DVI transmitter), and HDMI (VX900H chipset
integrated)
- Support for standby resume (ACPI S3 State)
- Support for dual head operation
- Supports atomic mode setting (implementation might still be incomplete
especially around gamma correction / palette initialization)
- Utilizes GEM / TTM for memory management
- Utilizes DRM FB Helper for FBDEV emulation


Known issues:

- Gamma correction / palette initialization code is still legacy KMS
based (Daniel, how do I convert it for atomic mode setting?)
- uAPI might not be quite right (Do I need something like
DRM_IOCTL_VIA_GEM_DESTROY or DRM_IOCTL_VIA_GEM_FREE call to pair it
against DRM_IOCTL_VIA_GEM_CREATE?)


Code repository:
https://cgit.freedesktop.org/openchrome/drm-openchrome/

Current bleeding edge branch (drm-next-5.20 branch):
https://cgit.freedesktop.org/openchrome/drm-openchrome/?h=3Ddrm-next-5.20

Current bleeding edge branch (drm-next-5.20 branch) code location:
https://cgit.freedesktop.org/openchrome/drm-openchrome/tree/drivers/gpu/dr=
m/via?h=3Ddrm-next-5.20
https://cgit.freedesktop.org/openchrome/drm-openchrome/tree/include/uapi/d=
rm?h=3Ddrm-next-5.20

Obviously, I do not expect to get the code pulled in on my first try,
but if other people can point out what I need to improve, I will try to
improve the code so that I can get the code pulled in as soon as possible.
Personally, I will like the code to be pulled in for Linux 5.20, but I
sort of expect the next release after 5.20 is more likely.

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab.com

v2: Deletes include/uapi/drm/via_drm.h.  Deletes VIA DRM from
drivers/gpu/drm/Kconfig before restoring it in a later patch.  Adds releva=
nt
VIA Technologies PCI IDs to include/drm/drm_pciids.h and
include/linux/pci_ids.h.  No changes to its module functionality.  Thanks
to Sam Ravnborg and Peter Robinson for pointing out the issues.

v3: Added CLE266 chipset external DVI transmitter support.  Fix for DVI on
AGP based UniChrome (Pro) graphics.  White space fixes.  Elimination of
compile time warnings.  IOCTL functions are now registered inside via_drv.=
c.
uAPI header include/uapi/drm/via_drm.h is now overlayed over the old file =
per
Sam Ravnborg's suggestion.  Module version is 3.5.7.

=2D--
Kevin Brace (32):
  drm/via: Delete VIA DRM code
  drm/via: Add via_3d_reg.h
  drm/via: Add via_crtc_hw.h
  drm/via: Add via_disp_reg.h
  drm/via: Add via_drv.h
  drm/via: Add via_regs.h
  drm/via: Add via_crtc.c
  drm/via: Add via_crtc_hw.c
  drm/via: Add via_cursor.c
  drm/via: Add via_dac.c
  drm/via: Add via_display.c
  drm/via: Add via_drv.c
  drm/via: Add via_encoder.c
  drm/via: Add via_hdmi.c
  drm/via: Add via_i2c.c
  drm/via: Add via_init.c
  drm/via: Add via_ioctl.c
  drm/via: Add via_lvds.c
  drm/via: Add via_object.c
  drm/via: Add via_pll.c
  drm/via: Add via_pm.c
  drm/via: Add via_sii164.c
  drm/via: Add via_tmds.c
  drm/via: Add via_ttm.c
  drm/via: Add via_vt1632.c
  drm/via: Add via_drm.h
  drm/via: Add new VIA Technologies Chrome supporting PCI IDs to DRM
  drm/via: Zero out chip type field
  drm/via: Add new VIA Technologies PCI device IDs related to graphics
  drm/via: Add Kconfig
  drm/via: Add Makefile
  drm/via: Modify DRM core to be able to build OpenChrome DRM

 drivers/gpu/drm/Kconfig            |    9 +-
 drivers/gpu/drm/Makefile           |    2 +-
 drivers/gpu/drm/via/Kconfig        |    9 +
 drivers/gpu/drm/via/Makefile       |   24 +-
 drivers/gpu/drm/via/via_3d_reg.h   |  395 +++--
 drivers/gpu/drm/via/via_crtc.c     | 2333 ++++++++++++++++++++++++++++
 drivers/gpu/drm/via/via_crtc_hw.c  |   91 ++
 drivers/gpu/drm/via/via_crtc_hw.h  | 1190 ++++++++++++++
 drivers/gpu/drm/via/via_cursor.c   |  419 +++++
 drivers/gpu/drm/via/via_dac.c      |  504 ++++++
 drivers/gpu/drm/via/via_disp_reg.h |  513 ++++++
 drivers/gpu/drm/via/via_display.c  |  125 ++
 drivers/gpu/drm/via/via_dma.c      |  744 ---------
 drivers/gpu/drm/via/via_dmablit.c  |  807 ----------
 drivers/gpu/drm/via/via_dmablit.h  |  140 --
 drivers/gpu/drm/via/via_drv.c      |  320 +++-
 drivers/gpu/drm/via/via_drv.h      |  584 ++++---
 drivers/gpu/drm/via/via_encoder.c  |  224 +++
 drivers/gpu/drm/via/via_hdmi.c     |  661 ++++++++
 drivers/gpu/drm/via/via_i2c.c      |  209 +++
 drivers/gpu/drm/via/via_init.c     | 1300 ++++++++++++++++
 drivers/gpu/drm/via/via_ioctl.c    |  109 ++
 drivers/gpu/drm/via/via_irq.c      |  388 -----
 drivers/gpu/drm/via/via_lvds.c     | 1233 +++++++++++++++
 drivers/gpu/drm/via/via_map.c      |  132 --
 drivers/gpu/drm/via/via_mm.c       |  241 ---
 drivers/gpu/drm/via/via_object.c   |  324 ++++
 drivers/gpu/drm/via/via_pll.c      |  255 +++
 drivers/gpu/drm/via/via_pm.c       |  187 +++
 drivers/gpu/drm/via/via_regs.h     |  296 ++++
 drivers/gpu/drm/via/via_sii164.c   |  578 +++++++
 drivers/gpu/drm/via/via_tmds.c     |  712 +++++++++
 drivers/gpu/drm/via/via_ttm.c      |  168 ++
 drivers/gpu/drm/via/via_verifier.c | 1110 -------------
 drivers/gpu/drm/via/via_verifier.h |   62 -
 drivers/gpu/drm/via/via_video.c    |   94 --
 drivers/gpu/drm/via/via_vt1632.c   |  598 +++++++
 include/drm/drm_pciids.h           |   10 +-
 include/linux/pci_ids.h            |   15 +
 include/uapi/drm/via_drm.h         |   35 +-
 40 files changed, 13079 insertions(+), 4071 deletions(-)
 create mode 100644 drivers/gpu/drm/via/Kconfig
 create mode 100644 drivers/gpu/drm/via/via_crtc.c
 create mode 100644 drivers/gpu/drm/via/via_crtc_hw.c
 create mode 100644 drivers/gpu/drm/via/via_crtc_hw.h
 create mode 100644 drivers/gpu/drm/via/via_cursor.c
 create mode 100644 drivers/gpu/drm/via/via_dac.c
 create mode 100644 drivers/gpu/drm/via/via_disp_reg.h
 create mode 100644 drivers/gpu/drm/via/via_display.c
 delete mode 100644 drivers/gpu/drm/via/via_dma.c
 delete mode 100644 drivers/gpu/drm/via/via_dmablit.c
 delete mode 100644 drivers/gpu/drm/via/via_dmablit.h
 create mode 100644 drivers/gpu/drm/via/via_encoder.c
 create mode 100644 drivers/gpu/drm/via/via_hdmi.c
 create mode 100644 drivers/gpu/drm/via/via_i2c.c
 create mode 100644 drivers/gpu/drm/via/via_init.c
 create mode 100644 drivers/gpu/drm/via/via_ioctl.c
 delete mode 100644 drivers/gpu/drm/via/via_irq.c
 create mode 100644 drivers/gpu/drm/via/via_lvds.c
 delete mode 100644 drivers/gpu/drm/via/via_map.c
 delete mode 100644 drivers/gpu/drm/via/via_mm.c
 create mode 100644 drivers/gpu/drm/via/via_object.c
 create mode 100644 drivers/gpu/drm/via/via_pll.c
 create mode 100644 drivers/gpu/drm/via/via_pm.c
 create mode 100644 drivers/gpu/drm/via/via_regs.h
 create mode 100644 drivers/gpu/drm/via/via_sii164.c
 create mode 100644 drivers/gpu/drm/via/via_tmds.c
 create mode 100644 drivers/gpu/drm/via/via_ttm.c
 delete mode 100644 drivers/gpu/drm/via/via_verifier.c
 delete mode 100644 drivers/gpu/drm/via/via_verifier.h
 delete mode 100644 drivers/gpu/drm/via/via_video.c
 create mode 100644 drivers/gpu/drm/via/via_vt1632.c

=2D-
2.35.1


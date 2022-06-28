Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562FB55F090
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECD51132F7;
	Tue, 28 Jun 2022 21:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFE91132F7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453182;
 bh=u07AZIntwJSH2NbIs6QkH+yKVzZumns0FwJEp0oLYyM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Rz/7Dn7IN+H5Da++5i103iSJ3VNlcxZCOsBOlgUolK0L+KX7MhsWFjAQinc0Pqz6j
 UvxggSn9VqPdVtDmlGgEZuQCQELO8ORtwK9NWBlWi1Xh4dUytiyekPFJgVQ33rAC5H
 zVn8LO6/Tlkdh0UH9kyQFDHC2Ordu8FWAw/idhJ0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.5]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Ml6qM-1nNJGj1tO8-00lVr2; Tue, 28
 Jun 2022 23:53:02 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/32] OpenChrome DRM for Linux 5.20
Date: Tue, 28 Jun 2022 16:52:14 -0500
Message-Id: <20220628215246.19706-1-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jOENM5qhm5+I/TUXnvhPTzRZxfMkvwL6MAjuVeWTqu2i0mk0xQ6
 P7NyoVPSDaX4uJgVo18pxTtfI83eRoKRc8EsIUDUwWubJ0Zethh0wt9ZC+UKVKishyAkobS
 PZnulvd9DBW4Fno7/zeiEBGdJsKFowAMRE4Q9ta5ER8VaPxdntk6XvdvgDrYr9anYxTGqa1
 G0q2YpP1RfwvwL+TDOo0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Iy2ScOOabY0=:3u0YuLH2zcNoGrdq0lz7Vd
 +MNlpu5mxHkfAiTZ67lmVBhLuQaNBsPnBxDrM5MCEslS3Cf0qcUbhCgOdWP1UEhV0RadKpwpz
 Los4bctXwV8aGlgJX1/6FIr7itXbh0C/vXIe2hldSLHCwJesnH2lG4khYXwaaLfhyvRvDvYBy
 KAktXtT6iwIZ4HMeifL6jU6TX5sTk8lxJBKHUnf+I5CA+XsS6LgDc8itTe9v2h7wt5J/wWXmG
 pDSiUVubyvjbbmw8HRNVtDkSSFI1pbmMtLgEwbKBRScvuu6JtUB1APvxtrYO4NpW8T0HGsHol
 +fTb2658ku3HBoquw9zGmyY7RJ8IZaTpb1m4+HIoRJMJ/6jmUU8lZSoR0z3OdjjC98ZwUcZPH
 Cu4OzI42F3rseKLjYnMqMYkv14SF8TkGIOxqZ9kNYRiZgcinq+HHeHaA87BNEr5AvQSISid5B
 6q+TpIfOZuCcq9F/Q9tiVv4UZq7iPj+qJUl2lu2/0bDFphJ/qCUdgdsIj2WaMIma//+uTNfBP
 myIZtZ87GSzpmLMQ5C+TJhdL7Zw8kFbAqC1g42v4SUKx73wpjeVFHlgOx0Ql76a5AVn0f+XWJ
 FJMUpERqJgwJg2HJY85nRpKEc4d6Atsr2qJYeSn4UeB65E9uznQgLFwRlhR46WbFKgt7eSYx9
 SYz428TI2Cjp6JTYl8bEQL4dlOazViomM66pvUwimY8Wo0sVQo/zPvTwscUvvJGG5OHe5n8Qz
 +HpJyvFs79ZrkkRJ9oIfyhehXnP22bnQxGITcHY4rG5gIyTB3FZYd6ubZAeGFu9JD39IkYLRQ
 lbQJwWgma3MTmKeYQd1Xij7BApoUuCn0xR3rONhHo1GODuqS87GsIVk8GKylHGOYtGA3O7laj
 5ul9VGnaA1crKk6ZQUQy51e04n/7peUhJi4MhMlWb3Uvu+ZiAu5P+J9YWr1Sn3D7sKpd856PN
 KEWEqsp78T1EkRwN4fbk+AvEtfKi4mC9GbVu20w5USXjmhRw6VY1RQzfQRq505IqSiycrGA3v
 df2JS6sAuHfo5LCR4COAZpJAIeX05EWjfsTf0634jBfsXPUdtuumlAyc7XLfQnPgyo+z7t/fO
 67pYlOVRH/tqlaGYA78K605YjsLQnG91ybDqp4FCNCDeaKV1S4+av+EIw==
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

OpenChrome DRM for Linux 5.20

Hi Dave and Daniel,

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
The current module version is 3.5.2, but when the code is about to
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

- via_lvds.c gives out 3 unused function warnings (willing to delete
the offending functions since they are not used)
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
 drivers/gpu/drm/via/Kconfig        |   10 +
 drivers/gpu/drm/via/Makefile       |   24 +-
 drivers/gpu/drm/via/via_3d_reg.h   |  395 +++--
 drivers/gpu/drm/via/via_crtc.c     | 2324 ++++++++++++++++++++++++++++
 drivers/gpu/drm/via/via_crtc_hw.c  |   91 ++
 drivers/gpu/drm/via/via_crtc_hw.h  | 1048 +++++++++++++
 drivers/gpu/drm/via/via_cursor.c   |  419 +++++
 drivers/gpu/drm/via/via_dac.c      |  504 ++++++
 drivers/gpu/drm/via/via_disp_reg.h |  513 ++++++
 drivers/gpu/drm/via/via_display.c  |  125 ++
 drivers/gpu/drm/via/via_dma.c      |  744 ---------
 drivers/gpu/drm/via/via_dmablit.c  |  807 ----------
 drivers/gpu/drm/via/via_dmablit.h  |  140 --
 drivers/gpu/drm/via/via_drv.c      |  291 +++-
 drivers/gpu/drm/via/via_drv.h      |  588 ++++---
 drivers/gpu/drm/via/via_encoder.c  |  173 +++
 drivers/gpu/drm/via/via_hdmi.c     |  719 +++++++++
 drivers/gpu/drm/via/via_i2c.c      |  209 +++
 drivers/gpu/drm/via/via_init.c     | 1300 ++++++++++++++++
 drivers/gpu/drm/via/via_ioctl.c    |  122 ++
 drivers/gpu/drm/via/via_irq.c      |  388 -----
 drivers/gpu/drm/via/via_lvds.c     | 1420 +++++++++++++++++
 drivers/gpu/drm/via/via_map.c      |  132 --
 drivers/gpu/drm/via/via_mm.c       |  241 ---
 drivers/gpu/drm/via/via_object.c   |  324 ++++
 drivers/gpu/drm/via/via_pll.c      |  263 ++++
 drivers/gpu/drm/via/via_pm.c       |  187 +++
 drivers/gpu/drm/via/via_regs.h     |  296 ++++
 drivers/gpu/drm/via/via_sii164.c   |  563 +++++++
 drivers/gpu/drm/via/via_tmds.c     |  714 +++++++++
 drivers/gpu/drm/via/via_ttm.c      |  168 ++
 drivers/gpu/drm/via/via_verifier.c | 1110 -------------
 drivers/gpu/drm/via/via_verifier.h |   62 -
 drivers/gpu/drm/via/via_video.c    |   94 --
 drivers/gpu/drm/via/via_vt1632.c   |  583 +++++++
 include/drm/drm_pciids.h           |   10 +-
 include/linux/pci_ids.h            |   15 +
 include/uapi/drm/via_drm.h         |   35 +-
 40 files changed, 13094 insertions(+), 4068 deletions(-)
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


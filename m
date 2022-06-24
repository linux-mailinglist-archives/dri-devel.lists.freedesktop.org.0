Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE8E55A2A3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9E510EE93;
	Fri, 24 Jun 2022 20:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A59E10EE93
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102720;
 bh=al1k/2CYUrkn6aMs0X++R4yNGW0zMcb7ecjiujk9ZCU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=jDgQPWnGmnoev2mHxprlmfpU93lsSmSXJVLIBEo3PAOjNR2y8FolTMDqH5lSvuF+t
 MWf9E9IeiyEoXENE8NSKXEvNc8EnMpkeFAdFIKAjJN7KX3eqVXovLv1nL3/2+EPvgc
 NWZvlg5IqLfNYcKVdrLdsF4MMfmnsrk9AqZt5R+E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1M59C2-1o3jQW2n5Q-0018AQ; Fri, 24 Jun 2022 22:26:55 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/28] OpenChrome DRM for Linux 5.20
Date: Fri, 24 Jun 2022 15:26:05 -0500
Message-Id: <20220624202633.3978-1-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ok4HAQJwc70+cf/K09TvYXHyLBqd7CTDwws9MZ5/ydHD6wFey9N
 3lLEPGiwQX4TdOzLvJU59zCVLrKLHFr6X5HOZNwzXdZ3P2TdMe9HMUNOu25xGBoEVV1CZgg
 uj5ye8RsvNQycE05dn0a534r8T/+0lJmvyaWmuTWL+8ISZ6518N5FMMlFpFCNqihpJHj/RI
 EfsBP6NY12+LPp8QEsYZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2FlCrt6sXUg=:Q5X+EDzD4/GRiQZ5b56nFq
 2aMhUx2I23LRemiCEmKiC34B4LWESmqHmZ7msbh90wEcSfvSsSxOb+DGPOJ+VKkWuD3HqqUTi
 T4yG7qV5Gj+miqiPrBoqR4f5RdW1CWjDmpzbl62rIfkLkI9QBPiooMJM5YCYzzORP1quwKlDd
 n91aSK/hjwtUWYrAPtvCGNXB+PXHgeaZcjj1N3BJHiECWvcyxeCKNZ6e26bkmiuoEbyidq0r+
 e6IzsvuTegvOArHwexDoLxjxY3wR30nEUFnbUskuXZ8mgjTyvP3+ZsaEpq8KaQ96+/kwgIp41
 aS2pUlLny1zENbfDBH4MeF47OSK2Owj+P++T6Wf9ADMrit/mkMe1z8wjrVt19mwWBiz2oHRuD
 6KLlzEBpOQmIHp4arz2gGhmS0enhamk5xoFjbQnFL19K68YZtavIdBE5j99WAK9qudgwcx18b
 TLii9t4vdBAERfydcRuMTV5+NGHvl1mU4b8SQxdtYfclS1jMbCTc3wG8cTtBozOZYylLvFvNS
 S7Lu+qwtQ40GOABagX/16ix6POL/JNf/TkRrsy8N8vIEIFF6dG5t7ZD29LZTgbkznnDub9A/f
 EBtRzk5FqQ89u7W44mWPMRv0E1nveIL+0vOI/EAg+yo1eO0SaNqH58m5/swv0lphdUs/vw51x
 FzCaf6/c+ddCNsW4ZE23jW39ACe6jUPKfbx+17Vb4Vo36KiQ7Jt67YmO0OzZGrY/4Kl+thIMm
 fMq25tJVUyWF1G/T8N6SUgU1zRq8HsNnXCxsz+K07dEaA1dejxtLlAV1h9jHivDAgxnyZ8L4u
 F2c9DTbxplkxOZJeOdQqOuO98QQPKmuyzbtoTp4oV6ZpgpoMqQk+kFUIgdYlnKR5Nm6Qx7xzp
 Lta5fJQ12H4qEK5czEdykhS6bU+jkTdbbzZdvvNj74bzOl6tGxqsAzf9+lgcNP0jaX4y3XDLw
 QHQkngVjnZ1bOTvZvWiOF8ewKNtEgDNjMIIPnFKqVegm5Yj847Ez7ZoazJ9L2YWb7/E+YTlZj
 chAIX4IY/BFKrlZChJDSrSzYa4ay9G2FO+gL5MyQbZXMG4/f1oBearWFiIUDEDsfMLCrnnqU0
 kDC5wxFMxedFOvRJfaWNBlLaaJyYTs3N8TzKdIMvA/FhCU3ALd6ojKGfw==
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


=2D--
Kevin Brace (28):
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
  drm/via: Add Kconfig
  drm/via: Add Makefile
  drm/via: Modify DRM main Makefile to be able to build OpenChrome DRM

 drivers/gpu/drm/Makefile           |    1 +
 drivers/gpu/drm/via/Kconfig        |   10 +
 drivers/gpu/drm/via/Makefile       |   26 +
 drivers/gpu/drm/via/via_3d_reg.h   | 1863 ++++++++++++++++++++++
 drivers/gpu/drm/via/via_crtc.c     | 2324 ++++++++++++++++++++++++++++
 drivers/gpu/drm/via/via_crtc_hw.c  |   91 ++
 drivers/gpu/drm/via/via_crtc_hw.h  | 1048 +++++++++++++
 drivers/gpu/drm/via/via_cursor.c   |  419 +++++
 drivers/gpu/drm/via/via_dac.c      |  504 ++++++
 drivers/gpu/drm/via/via_disp_reg.h |  513 ++++++
 drivers/gpu/drm/via/via_display.c  |  125 ++
 drivers/gpu/drm/via/via_drv.c      |  313 ++++
 drivers/gpu/drm/via/via_drv.h      |  437 ++++++
 drivers/gpu/drm/via/via_encoder.c  |  173 +++
 drivers/gpu/drm/via/via_hdmi.c     |  719 +++++++++
 drivers/gpu/drm/via/via_i2c.c      |  209 +++
 drivers/gpu/drm/via/via_init.c     | 1300 ++++++++++++++++
 drivers/gpu/drm/via/via_ioctl.c    |  122 ++
 drivers/gpu/drm/via/via_lvds.c     | 1420 +++++++++++++++++
 drivers/gpu/drm/via/via_object.c   |  324 ++++
 drivers/gpu/drm/via/via_pll.c      |  263 ++++
 drivers/gpu/drm/via/via_pm.c       |  187 +++
 drivers/gpu/drm/via/via_regs.h     |  296 ++++
 drivers/gpu/drm/via/via_sii164.c   |  563 +++++++
 drivers/gpu/drm/via/via_tmds.c     |  714 +++++++++
 drivers/gpu/drm/via/via_ttm.c      |  168 ++
 drivers/gpu/drm/via/via_vt1632.c   |  583 +++++++
 include/uapi/drm/via_drm.h         |  309 ++++
 28 files changed, 15024 insertions(+)
 create mode 100644 drivers/gpu/drm/via/Kconfig
 create mode 100644 drivers/gpu/drm/via/Makefile
 create mode 100644 drivers/gpu/drm/via/via_3d_reg.h
 create mode 100644 drivers/gpu/drm/via/via_crtc.c
 create mode 100644 drivers/gpu/drm/via/via_crtc_hw.c
 create mode 100644 drivers/gpu/drm/via/via_crtc_hw.h
 create mode 100644 drivers/gpu/drm/via/via_cursor.c
 create mode 100644 drivers/gpu/drm/via/via_dac.c
 create mode 100644 drivers/gpu/drm/via/via_disp_reg.h
 create mode 100644 drivers/gpu/drm/via/via_display.c
 create mode 100644 drivers/gpu/drm/via/via_drv.c
 create mode 100644 drivers/gpu/drm/via/via_drv.h
 create mode 100644 drivers/gpu/drm/via/via_encoder.c
 create mode 100644 drivers/gpu/drm/via/via_hdmi.c
 create mode 100644 drivers/gpu/drm/via/via_i2c.c
 create mode 100644 drivers/gpu/drm/via/via_init.c
 create mode 100644 drivers/gpu/drm/via/via_ioctl.c
 create mode 100644 drivers/gpu/drm/via/via_lvds.c
 create mode 100644 drivers/gpu/drm/via/via_object.c
 create mode 100644 drivers/gpu/drm/via/via_pll.c
 create mode 100644 drivers/gpu/drm/via/via_pm.c
 create mode 100644 drivers/gpu/drm/via/via_regs.h
 create mode 100644 drivers/gpu/drm/via/via_sii164.c
 create mode 100644 drivers/gpu/drm/via/via_tmds.c
 create mode 100644 drivers/gpu/drm/via/via_ttm.c
 create mode 100644 drivers/gpu/drm/via/via_vt1632.c
 create mode 100644 include/uapi/drm/via_drm.h

=2D-
2.35.1


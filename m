Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421EB493DE9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 17:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1D710E280;
	Wed, 19 Jan 2022 16:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D1010E251
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642608154;
 bh=JEMjXleBru/gLCy/oOLYjEj9hZH6cOzwnx1wA8kkjSc=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=CDHzUakxxcAdHOyEkKCyU3lT7nfJ2tsFe1GWUX8TnNoSc7fSEQnoWmBOrwmz5hV53
 nLeqceRQ2VB1p3f81HibXEsUCWqyroyJaMBX4Tjq2Nb6ybqXYnF2yzem3LO3gXcPbI
 QviPoyHGYs/O+ynvL21lXmVMNcpqXmuKmvKFlPx8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.183.52]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Msq24-1mHR0D3cYC-00tC0V; Wed, 19
 Jan 2022 17:02:33 +0100
Date: Wed, 19 Jan 2022 17:01:26 +0100
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev updates & fixes for v5.17-rc1
Message-ID: <Yeg11pHSqx29yg/T@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5O4+rNi6WJzQVMB+rTkMWYPHXQd1MKtr9EcwARWkfS6QfG+7GT9
 044Q6svnW1H9NthTjUk5BvGtYbh90Ql+LLim33SoXHyM9L1nAi1wNiQVSClob0fZ+AKvpYy
 L+0y9SxutqityVLXJEiD2krOQqlMDSXKTtRxUJRAywiBSi3XFn5cy13Oeck+mKZx0Lv43TZ
 7yoOr9kSnGdUfkgG9/pYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mGsiSMYeQpU=:tQdMhoIcPsY/hgXhctthf7
 icNGYjXoR9CsRRO2QZRSkZfVAmMZwbu5hvLkdnCJX/sGYW46uQbKknOhl8FHz5jiA89LKB/h0
 ZsMa7aWQw7XgQP0sVX5uP4E68YZkAPUUX3L0iK1jHuSXLIhHWjbPnaTHsIc9KO4MWnDD9ner+
 zAgYbtayKkFNbS6bdBeOaonU8BGpMCokqAI8TcQChSwO7wKfKxvgEXiq1bM74IJJ6I1z+MZao
 RJ58jegStheKNcs0/txV0WAYAMj2HquikR5POBsPdUo6QBz1byXAg6KqacKKjQbJzhhz41mAW
 /QfxXlDWrnpOXfBV7XmuMJqXb3r2mGpV4H5nhnm+ej3agaRc4CA+ZX8oMLiPAXuD1L9XqGewf
 ItZTsfFi1vbGrIsPbK8yavPrNV79CUrU9fiBU2AZJQljWO3omJBXz21likrb6ocXIxNL9CYlm
 x/YmZaesD7I3SGSJfz8TzA+jIhtGVeK5RuBMrnmO6uPtzoV3yC2hT2NOc+0B34uxJdwt6mZSf
 nvSNzvMIuQKHhafHrLgL0vSS4fzm9EAkmuQMqkM34rbV3x2VP302stxOYgShQYqO6h9evQu6N
 +IFQ/G+LiEYhjSBqhSlICXoBO0ilnf2nY7bFA5ITEJXtEXjfKCm4sphxnfF99l0GTj6HZtVqd
 4WXB4QjfcDsiPfz0y9H6DKAQydJkk+E1ncYM2K2tb20ilScpNN/cNpYc3Sv3DJOyfkOyTXePJ
 h5lzeXDF1ZjUv85YGSPqtzG1h4/SaQ5APBT5oUBcb0AYfECwlJGMAV3DdWxEXSQVHvvv4tS0+
 LBOK/mMIkXL0SzvSiSSdoEF09cMkenMi/reehn85rfJAnZ0mmfJakpr1OlGhvs7c47xnR8rIC
 ZN5HVSjN0Ah03Qcda7azy8nNTqi2y9LM4kGLawABZnV2rOoJS/wlhBoTmJxnav+1cksFmJxgU
 qJJtZ1KxROwdwati8LNPOXLUW8Xszotn+JpSvdnKh4uYd2ABP1YlaTC/axpGnjH8Pp8J9+nAo
 e6aQlXi2WehVgOCExPZ6BAXf7drIr84Vwv5vcmq59Z/ATlsw7lW4EyJHumoxZMfLMWJs8qW70
 2E0omya9j3bWnU=
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

The following changes since commit 0c947b893d69231a9add855939da7c66237ab44=
f:

  Merge tag '5.17-rc-part1-smb3-fixes' of git://git.samba.org/sfrench/cifs=
-2.6 (2022-01-17 09:53:21 +0200)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git ta=
gs/fbdev-5.17-2

for you to fetch changes up to 842086bc7262a36f002e0361f9dc351556cae3f3:

  video: fbdev: controlfb: Fix COMPILE_TEST build (2022-01-17 22:39:37 +01=
00)

=2D---------------------------------------------------------------
fbdev updates for v5.17-rc1

A first bunch of updates and fixes for the following fbdev & backlight dri=
vers:
ocfb, aty128fb, mb862xx, omapfb, qcom-wled, dt-bindings, hyperv_fb,
lm3630a_bl, omap2, controlfb, matroxfb

Nothing really important, mostly cleanups, const conversions, added null
pointer/boundary checks and build fixes.

Signed-off-by: Helge Deller <deller@gmx.de>

=2D---------------------------------------------------------------
Chunyang Zhong (1):
      video: ocfb: add const to of_device_id=A0

Colin Ian King (2):
      fbdev: aty128fb: make some arrays static const
      video: fbdev: mb862xx: remove redundant assignment to pointer ptr

Greg Kroah-Hartman (1):
      omapfb: use default_groups in kobj_type

Jiasheng Jiang (1):
      video: fbdev: Check for null res pointer

Luca Weiss (2):
      backlight: qcom-wled: Add PM6150L compatible
      dt-bindings: simple-framebuffer: allow standalone compatible

Michael Kelley (1):
      video: hyperv_fb: Fix validation of screen resolution

Minghao Chi (1):
      drivers/video: remove redundant res variable

Xu Wang (2):
      backlight: lm3630a_bl: Remove redundant 'flush_workqueue()' calls
      fbdev: omap2: omapfb: Remove redundant 'flush_workqueue()' calls

Yang Guang (1):
      video: fbdev: use swap() to make code cleaner

YueHaibing (1):
      video: fbdev: controlfb: Fix COMPILE_TEST build

Z. Liu (1):
      matroxfb: set maxvram of vbG200eW to the same as vbG200 to avoid bla=
ck screen

 .../devicetree/bindings/display/simple-framebuffer.yaml  | 12 +++++++----=
-
 drivers/video/backlight/lm3630a_bl.c                     |  1 -
 drivers/video/backlight/qcom-wled.c                      |  1 +
 drivers/video/fbdev/aty/aty128fb.c                       | 10 ++++++----
 drivers/video/fbdev/aty/mach64_ct.c                      |  4 +---
 drivers/video/fbdev/controlfb.c                          |  2 ++
 drivers/video/fbdev/hyperv_fb.c                          | 16 +++--------=
-----
 drivers/video/fbdev/imxfb.c                              |  2 ++
 drivers/video/fbdev/matrox/matroxfb_base.c               |  2 +-
 drivers/video/fbdev/mb862xx/mb862xxfb_accel.c            |  2 +-
 drivers/video/fbdev/ocfb.c                               |  2 +-
 drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c     |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c     |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c     |  3 ++-
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c           |  1 -
 drivers/video/fbdev/sis/sis_main.c                       |  2 +-
 16 files changed, 32 insertions(+), 34 deletions(-)

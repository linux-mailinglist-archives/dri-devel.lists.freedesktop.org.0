Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 835804A6465
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 20:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB82310E50C;
	Tue,  1 Feb 2022 19:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6218510E4D9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 19:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643741996;
 bh=d2IztvFiozX9ikhPD2+aEcoaHd/2PejNuetOnFWjSAc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=JXbdahizytzLhrg4cTc6zH+bWwVy6d0whn8StbX2ptCJBrUsuFjAxvrHOUGDaDYdL
 oaEQ8UUbgZN139YUMpBRr2j4fXounTHzCUyeTIxBAE8iDuRgWi3CRqJQsQf+FZHsCs
 st9vIhFZQ3tDspClJFUjOYgpkFnO92A6xposou7U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.146.124]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M59C8-1nG4qG0UIm-001EP7; Tue, 01
 Feb 2022 19:59:56 +0100
From: Helge Deller <deller@gmx.de>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 0/3] Fix regression introduced by disabling accelerated
 scrolling in fbcon
Date: Tue,  1 Feb 2022 19:59:51 +0100
Message-Id: <20220201185954.169768-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qPvm+cPnCkp5vT9++/v4GQfSPVJnSRf0zFa4GEm8zKIGhM5meJk
 tAHuvYDRhc5aCbrPQGeToT/eOSt1j7jiHwhO3T5X6m9Agbsyt23eBJZlguNxg6m2r3lI5ES
 z3UqZ3XvN7Fdwn2LrQiZwedJmN7q65YYE/GPqV+aABLeg2CIKOfuo+6xAJJ7L8pLZTa0ovn
 M7wAfJmIqeZ1OC4ejY0rA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:955qTNaf9as=:+DzSxYCUeiqpBth/q0SAxK
 ZE8bOby63cYfSf8PWUVom5/cen/frCfUIoP77fPwQQJuFGjxYCaEANUl+AgsCS2NFkw8Li1t8
 AmiYTGXhllCFeHmWui74HoCkIPGgnMsvSv6bTrP+aVE2kip62/Ljz6oLnOKyiEmjUZMBixs1r
 hwf/pFUObC6SuXY6Ss+m/ld3lCCGY6RllJV6XyTU6D57IMqIZJbW7CvU7YyZ98UnoxpORH2CL
 L3FNdpHGW7vfOLIBHIHZktRB7u3jFsx8IeGNuyLUMlRnI0r1006gKik0E5CI3VRNbiIL0Wd5i
 UQgGSgYBf4LolVxLpnofTK+BcnTaZtiO/VGb0kXHo+ElR2sYZHZzncoO+r8Y3XSyi+vZKfFh5
 TAlF1iIAyxE7jNPfl8XzB2eeCVsyQx087XB+XOnsx2ct/RPqA7c8CG1HIcoXzTY0PZukqmeP6
 uCEAnwFt/ymxP/dJn5oo22M0s8emXxzKwDabaUt4WbLwwZUSjRi9ex8zlsiVIA0zOoTCR3CwS
 iWTP7XmcfxJflmi6WewA+3iIw+BE0OzkZiva5FfXXmlJouQutpkKtl87ou4iUQmCECIIUNO4g
 PrglTU+Z8XgqXhSd+OFwODGQWQdYbeYHXtoiBjYAZXAXQzvxadh5MhHPbjYev1IgAQdv8z8Lo
 UtLr3FgDCpbv6mboUV/3T726yUNhMk0xOfBKgCrsThMna/Wu3a1IHGiTrqzaAWXwUHeZiPKjp
 dHy6thkqHzHeyD1ooypfuAqKqyuzndO9M4VbAAaIRPU2g+J7i8OhlMYj/dpR5kTO/rN/IOtuJ
 iO8NlqfjiAo8d9F8M/X61z5Dudw+gXmvzwlOS+IMa6N0zWsVIPq2S23CQUCdff3QWUl0k5fyb
 RnoH0BJR+za7CNCZ7uaCBCUIHvnZgpz+yaTi9wAUSTbjKTNktFDFXZvxLH+GgOU+Vg5VdANDf
 IbygF2r92zaYxf4w1VGW0UQ9Zbw9+wt4UchULCIZ1qWbMsPvRLz49ekNY26rQhFt2nn80FEoe
 Pt0Nxxi2BXcyWdTKrMl+Oi4xtH8M1K40FwHQerCavsF+uzIR3h8tPPGSLGcdjRoylnNgHJkoj
 kWaPUpHzcZMYwE=
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
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
 John David Anglin <dave.anglin@bell.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series reverts two patches which disabled scrolling acceleration in=0D
fbcon/fbdev. Those patches introduced a regression for fbdev-supported grap=
hic=0D
cards because of the performance penalty by doing screen scrolling by softw=
are=0D
instead of using existing 2D hardware acceleration.=0D
=0D
The third patch introduces a new config option=0D
CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION, which -if enabled- switches=
=0D
fbcon to utilize the bitblt and fillrect hardware acceleration in the=0D
framebuffer console. If disabled, such acceleration will not be used, even =
if=0D
it is supported by the graphics hardware driver.=0D
=0D
This series is being discussed on linux-fbdev and dri-devel mailing lists.=
=0D
=0D
Helge=0D
=0D
Helge Deller (3):=0D
  Revert "fbdev: Garbage collect fbdev scrolling acceleration, part 1=0D
    (from TODO list)"=0D
  Revert "fbcon: Disable accelerated scrolling"=0D
  fbcon: Add option to enable legacy hardware acceleration=0D
=0D
 Documentation/gpu/todo.rst              |  24 -=0D
 drivers/video/console/Kconfig           |  11 +=0D
 drivers/video/fbdev/core/bitblit.c      |  16 +=0D
 drivers/video/fbdev/core/fbcon.c        | 557 +++++++++++++++++++++++-=0D
 drivers/video/fbdev/core/fbcon.h        |  72 +++=0D
 drivers/video/fbdev/core/fbcon_ccw.c    |  28 +-=0D
 drivers/video/fbdev/core/fbcon_cw.c     |  28 +-=0D
 drivers/video/fbdev/core/fbcon_rotate.h |   9 +=0D
 drivers/video/fbdev/core/fbcon_ud.c     |  37 +-=0D
 drivers/video/fbdev/core/tileblit.c     |  16 +=0D
 drivers/video/fbdev/skeletonfb.c        |  12 +-=0D
 include/linux/fb.h                      |   2 +-=0D
 12 files changed, 744 insertions(+), 68 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C24356B3AD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 09:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9954510F5C8;
	Fri,  8 Jul 2022 07:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6AC10F5C3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 07:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1657265917;
 bh=D7qLA/iJlSBt219O7ShLPD2VmW/Mh0zlsFCsD09xipk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=CNCBPo5cFJy9jTNXF0KEQHs1ciAH0UaM4mMuy5Sr9/a9yB1b01LJRJKnUqnxhAgME
 qiH3wBZR5JueKcqlyb/qE5Kudl6MyQ4imPppThKoXp1EyZ53Ey6BsEEAacofFwhq70
 lpKvaN1dbHJtbdTyGgbREzMBWp0CpQWcohWEMhUc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.171.120]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTRMi-1o1yF641y0-00ToJk; Fri, 08
 Jul 2022 09:38:37 +0200
Date: Fri, 8 Jul 2022 09:38:00 +0200
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev updates & fixes for v5.19-rc6
Message-ID: <Ysfe2JUDCg/S1ArT@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:nJ3VXKnb6rO003B31GtKc9A3gfM+urPI3N8+onViOP6BaLUD24d
 2ixfeMSDhOccbMHOD5J1cPmkRe0gOdse1ZwSTa3M1+7sJrfIMvSYCj+gGgQWaDjJEnc5pH2
 wsl1TVjIHvPzPcbPzROATlYC0jngHn4XL76TOlU0eqsw3aO8KLprl4ok8qmWFlN031usWa4
 UWfc2Zg3jlh8ahRpwGR4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bctC6tNHHYw=:DMLVXF6SgA58MF5C6Rp9eL
 O3hvCLUDxLfhGI8uzTGN0irrzFmFpU44k/Ei9yZnkql6mqmhO6yDH9xuYkx2RwTM9/SOAPyM/
 SQD/kR/9A0/PbanpF435xVXCI2UPUPaElxQ+rnZqKz2P5ncJg5qIICRNb6ntx12JKEmsO2QF1
 NMZLn/AOUkc3WTVE53XLIIYZ3dXtH82iFVnncG3COC6CT87Y5um1wTeKbIFKRROYNjvfKwcio
 mb/76c156+VLcdkY7A8PXwwkbYw/ti+u8Nw6K5ekKkcLfjNHQEKM4OBwbfiTKRdERi1KjnJxM
 qPme1thlSWDAgb9X83p4sjxrZlaDpcgpUmwbsbCanLRuD+ZWqokDlPhfUaCeLWXHQYB3Dp2kh
 5fGbYXy9nsgWBcpIh2JcGSS7KJ5vygN/p3arF4I4i3+qa/wBKd02FiXf/4Eg8NzsWAOVii78p
 vxr9tjlF3eCa3/u5XQ/g0QZWFm9gZK/PavwvLdLAlzHFua++a6fq9uKt96mehnZRRMidnPmo8
 D5RihhD5JCcMqH8C581EcRw5T9OU+wzVMFUScgFJyKuC859cG5ba/dv098kTuxIBuGAPzntZy
 fq2KaU/DKrRNA1FccNKPiGY7CLNnSrT54UTqMz250X07p4jfcHXIpxfeXkbYnZKqIlyK9+/Fx
 4LHPm4NRujw0ppVY7jS/MQ4fAJP/0cjcvWs/dLdsAtldrj8un+nmXhNeiHuQKC2ua3g3Srv/q
 d1NZ0sDNwOO6zSbhdeLBJkBYlpsSEcDI70THMDW+kr0RreQ3KqVTM8QgtxYJyHgAz488IDrl8
 vLImIdcwCfBZcSZ5QonXRxzi3RjFHFljRM1KVsWfXQY7MvvHrvN61XePuYGnWDkqABsTVkLat
 m7lz9R4qKOM2dkRAoedVrtqfBKKGY0bTDPYpDRHMKdu80Z5m3ey8k7qynw3b2ZiGGKBt+++bs
 N6XkCyswklQImhmNj2E8LqcruhajlQnSKsbA2T5fpOpCwMa9NIjQ9ZcorCc3iDvZxBkizCVTb
 kofwxdK8ikOGvCH9i1RdB/4+A1yMGhFLej3KqocCtsnwmQIiZxMmpUf/4mrKXdbaGIsPav+ky
 QCOwHoXEb77ub4c8+4bbZbRF0MQQusi0Y9R7+zekbFnkWVRLdzvX3mifg==
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
Cc: Guiling Deng <greens9@163.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following changes since commit 88084a3df1672e131ddc1b4e39eeacfd39864acf:

  Linux 5.19-rc5 (2022-07-03 15:39:28 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/for-5.19/fbdev-3

for you to fetch changes up to 53a6e66b1b4fea4b52f8bc62e5f9530af9061027:

  fbcon: Use fbcon_info_from_console() in fbcon_modechange_possible() (2022-07-07 10:52:35 +0200)

----------------------------------------------------------------
fbdev fixes and updates for kernel v5.19-rc6:

fbcon now prevents switching to screen resolutions which are smaller
than the font size, and prevents enabling a font which is bigger than
the current screen resolution. This fixes vmalloc-out-of-bounds accesses
found by KASAN.

Guiling Deng fixed a bug where the centered fbdev logo wasn't displayed
correctly if the screen size matched the logo size.

Hsin-Yi Wang provided a patch to include errno.h to fix build when
CONFIG_OF isn't enabled.

----------------------------------------------------------------
Guiling Deng (1):
      fbdev: fbmem: Fix logo center image dx issue

Helge Deller (4):
      fbcon: Disallow setting font bigger than screen size
      fbcon: Prevent that screen size is smaller than font size
      fbmem: Check virtual screen sizes in fb_set_var()
      fbcon: Use fbcon_info_from_console() in fbcon_modechange_possible()

Hsin-Yi Wang (1):
      video: of_display_timing.h: include errno.h

 drivers/video/fbdev/core/fbcon.c  | 33 +++++++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c  | 16 ++++++++++++++--
 include/linux/fbcon.h             |  4 ++++
 include/video/of_display_timing.h |  2 ++
 4 files changed, 53 insertions(+), 2 deletions(-)

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF13FAD969C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 22:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B2610E2A9;
	Fri, 13 Jun 2025 20:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TGKb58ml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297C410E2A9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 20:42:59 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-adeaa4f3d07so467378766b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 13:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749847377; x=1750452177; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4hL3bPOZiCumThELDqvwKH3aWWnHVUJPiuyMpNFx7dA=;
 b=TGKb58mlCnvGYBnLQFk/5PfIuM2xJRlieHrNzWBlnk+FOQXQTyhdNIsCxfSjQ/ew1R
 9bA+jfLRshpHAlpLFal9exEN5gXIveKzB/N2Uzh2VgdAaK287+MKqmlpXOzCDZd7FXBa
 s/vKtwvnMrtgZq17m8LyoZDoMZgE0agGIcqypqMyxV2zkgP15IM05q+Aunm7zRtiw0iw
 UB0UEHBzs5NzSe4QVhhS1tNn227bXe7XU+l/FGfU3RlIKuDDzTmU6IDVcP2Qi72AngKF
 jHWZcvdPeSmIHOaS9xXyf9bkjfCd6Jb7RX9lwvDlDCqrryR5wQW3gpwU3MpRCoHd+MBc
 AQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749847377; x=1750452177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4hL3bPOZiCumThELDqvwKH3aWWnHVUJPiuyMpNFx7dA=;
 b=gpu3NEpVVUrfNz6YJKFywoKB8409ExnGN0Ep223gcEDY0nXghoJ6Z0y9mULe2grnD1
 /8ubEvzbggs9KT9IAHO/xfUv5oJeskIgmpThWIrtYFFG0VVAWIhZIR72V8R2zyp05sGR
 U2dtggRgW0OazIojYLH1xBYjl0jxnB4WfhU4kDBpDKlCtwogIzbB3wOpdjYoTHJaVF7n
 rIpWEdrbxDbiSxZEEEwj1myuZ0okyqjojoR15dF6l9IhxTDvpuCMVxgL4AWYsGl9QHOT
 5e7zd0467r4PTGP1KYbKhe4o8WkR8K7JI5dIUvEDyvyhsdoAG6GK/OjzqK3BcoyfheZz
 7cHQ==
X-Gm-Message-State: AOJu0YyHuR40bEJtUOn/vmcVVnlkE8aCHjnpo/ZyXCaAJAzCMTgkSJn8
 VnLGuLsRelLPV8UvzYENL/tKBx2rso3r4r8+XKKuIAV+raUU/DI7awZrlYT1Jzr42m7+KLO/WHf
 Vc8EtR69LVrhMgiyV9vpu7IhhLM19AP0=
X-Gm-Gg: ASbGnct7CgNip2qSavoSa3sBMRiEemGjMAmiQo3MPoZEPfGoLIj9+55Ikb9zUv5l+f7
 m77YKO6WAXsR/0HJeatMQUjm4zEYTuaiWIwGB88i6nc9fcuMvs8ubEv/vrMZDZWMxO8g46Vg2rD
 x0BZLg6TM1A2JiY6MwqhMjwmTHZBL8bMOJNTTzmdcRwg==
X-Google-Smtp-Source: AGHT+IHs1rFLtd5Dyf296bDQtnWpyPbmXlE6lQX0psbVbCQn+LYSDEDdvBqxQCr3f3jMNK4CbR7c5otykkAdap5nzIc=
X-Received: by 2002:a17:907:962a:b0:adb:7f8:9ec2 with SMTP id
 a640c23a62f3a-adfad682f5fmr50158466b.53.1749847377370; Fri, 13 Jun 2025
 13:42:57 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 14 Jun 2025 06:42:46 +1000
X-Gm-Features: AX0GCFvBYudheTPQsPErwJpRx7FcK8QPcnYVNFFml7BF63WDlP4W812XArPXbDU
Message-ID: <CAPM=9twFdWPhCA7-6yY27xkdnecxRJXOF5Ni8iDc9Oa5QOtukw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.16-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Linus,

Quiet week, only two PRs came my way, xe has a couple of fixes and
then a bunch of fixes across the board, vc4 probably fixes the biggest
problem,

Regards,
Dave.

drm-fixes-2025-06-14:
drm fixes for 6.16-rc2

vc4:
- Fix infinite EPROBE_DEFER loop in vc4 probing.

amdxdna:
- Fix amdxdna firmware size.

meson:
- modesetting fixes

sitronix:
- Kconfig fix for st7171-i2c.

dma-buf:
- Fix -EBUSY WARN_ON_ONCE in dma-buf

udmabuf:
- Use dma_sync_sgtable_for_cpu in udmabuf.

xe:
- Fix regression disallowing 64K SVM migration
- Use a bounce buffer for WA BB
The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494=
:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-14

for you to fetch changes up to 1364af9cb2c5716f1905113cc84ff77ddf16a22e:

  Merge tag 'drm-misc-fixes-2025-06-12' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2025-06-13 14:57:09 +1000)

----------------------------------------------------------------
drm fixes for 6.16-rc2

vc4:
- Fix infinite EPROBE_DEFER loop in vc4 probing.

amdxdna:
- Fix amdxdna firmware size.

meson:
- modesetting fixes

sitronix:
- Kconfig fix for st7171-i2c.

dma-buf:
- Fix -EBUSY WARN_ON_ONCE in dma-buf

udmabuf:
- Use dma_sync_sgtable_for_cpu in udmabuf.

xe:
- Fix regression disallowing 64K SVM migration
- Use a bounce buffer for WA BB

----------------------------------------------------------------
Christian K=C3=B6nig (1):
      dma-buf: fix compare in WARN_ON_ONCE

Dave Airlie (2):
      Merge tag 'drm-xe-fixes-2025-06-12' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-06-12' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Gabriel Dalimonte (1):
      drm/vc4: fix infinite EPROBE_DEFER loop

Lizhi Hou (1):
      accel/amdxdna: Fix incorrect PSP firmware size

Lucas De Marchi (1):
      drm/xe/lrc: Use a temporary buffer for WA BB

Maarten Lankhorst (1):
      drm/xe/svm: Fix regression disallowing 64K SVM migration

Marek Szyprowski (1):
      udmabuf: use sgtable-based scatterlist wrappers

Martin Blumenstingl (3):
      drm/meson: fix debug log statement when setting the HDMI clocks
      drm/meson: use vclk_freq instead of pixel_freq in debug print
      drm/meson: fix more rounding issues with 59.94Hz modes

Nathan Chancellor (1):
      drm/sitronix: st7571-i2c: Select VIDEOMODE_HELPERS

 drivers/accel/amdxdna/aie2_psp.c           |  4 +--
 drivers/dma-buf/dma-buf.c                  |  2 +-
 drivers/dma-buf/udmabuf.c                  |  5 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  2 +-
 drivers/gpu/drm/meson/meson_vclk.c         | 55 ++++++++++++++++++--------=
----
 drivers/gpu/drm/sitronix/Kconfig           |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c             | 12 +++----
 drivers/gpu/drm/xe/xe_lrc.c                | 24 ++++++++++---
 drivers/gpu/drm/xe/xe_svm.c                |  2 +-
 9 files changed, 68 insertions(+), 39 deletions(-)

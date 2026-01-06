Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB60CF8C3F
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 15:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C99810E50E;
	Tue,  6 Jan 2026 14:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="OpgsXkPD";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="pysWJJ9K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877D410E3CC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 14:26:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-fg2f.prod.antispam.mailspamprotection.com;
 s=arckey; t=1767709564; 
 b=SZ2cmldeEdX5sYzF2JR1KDYXu3Mi4BBFlVPiSlbUzZEFNcVKFA/aikU3FFRwJUhw9kl2c7qZea
 kMjv/b7I9aFjwrJJp1SUJY6h1KWlpHQRSzRy4YPeO1G6X0qOkOvlYxqdsP0DHYDyNCvDrSlnR/
 qT6eMcG10Qb6PXq2LaJ/h/i6YRKkgMJ0uuIsHx+bpG2SLmgoMHxWlODAr44jr+QPZmYVFDgrJY
 mbCJwSMbsK9LAs/0Pa2eFPGtN3HMOknAcNNBA5CtUJHHsknDe9Bg3PqIHMrRR4BjyMuCQfWqrU
 R+yIF8X3PfSideaV2UtFpEbkwT/skZ++YLzi7hGjUrlE6A==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-fg2f.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-fg2f.prod.antispam.mailspamprotection.com;
 s=arckey; t=1767709564; 
 bh=5RBZj5fiknLzyrEUj0wxw39RQT3sg1+tqKapk21gXJY=;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:From:DKIM-Signature:DKIM-Signature;
 b=i4/Y1eQvmOGjJii+4uv1DPU1rrQFDxJMQpElus9VYa9MZcL2rQvCHG4WRwrbbS1BxRerqJy2Pu
 yKXXymXXRJokLjFBmovcPTMK2YL2JL/FMzMb6391VHhjzpw5IvDAtN95YqtQ4rklkVZHwaAHiF
 MZkTYHz1dbdxB/+5krcsnXveMjQy/U5BYfAxgSQ6Nw1gXaqv7L6UVgCscNgcBJxFFBdAFzceNk
 DjgO2h8y/ZsW40L0ci3RXXcszgm8fkTcz/LdEn0Yxy5j/4edG06gOM6j2OJWPUR2w86+EwO2C4
 j+EEZ9O5tSWFh80iSP87eh4zSUE/slUpszDEyV1Bw3fCZA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:From:Reply-To:List-Unsubscribe;
 bh=hjiE/vy95miZKmIXOVeCZjg3Col/800s9OhVDa7FJ7I=; b=OpgsXkPDgRVAKMNfr1MDoMR4ww
 Sw/bPRqEwXTQLNSP3+xltYRr4SkOQnM810Ytkkb3Baqi3FrYpRyqHranLu/LUQvAUxPvja8Ykhnqa
 ITYfwPjzx0UpzhciwghZY6ag0m9SlnRwS/yrl3lK1sfTADk2aZSoUhtZ0URK9zwwr078=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-fg2f.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vd80V-00000006Bkt-0aDE
 for dri-devel@lists.freedesktop.org; Tue, 06 Jan 2026 14:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=hjiE/vy95miZKmIXOVeCZjg3Col/800s9OhVDa7FJ7I=; b=pysWJJ9KhgKk6vhs7nOD76bbaF
 PZz6G1BIUmBiO/u/dkaL/Kr5Pp3AEEHJg9PYKEl153KSi7Ck5krlGLLv+PZHTaiS6crwIifqQaeqy
 QySKJCCaiYQZivxPtITXkiTll9RVY49XrorsOtdQ+w2f44GFSkpD6JfG1dqWvXFRfha4=;
Received: from [95.248.141.113] (port=61315 helo=[192.168.178.65])
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vd80O-00000000MvX-3k3r; Tue, 06 Jan 2026 14:25:52 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH RFC v2 0/3] Add splash DRM client
Date: Tue, 06 Jan 2026 15:25:39 +0100
Message-Id: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NywrCMBREf6XctZE8NLVdCYIf4FZKic2tvRDbk
 pSglPy7obh0eWaYMysE9IQB6mIFj5ECTWMGuSugG8z4REY2M0guj4JLzax/tZ0jHJc2zM6EgaH
 gtrRaKyx7yLvZY0/vzXmH2/UCTQ4HCsvkP9tPFFv1U5Z/lFEwzjjX1alS6qEO5hyNc2ZPCzQpp
 S98n243tgAAAA==
X-Change-ID: 20251026-drm_client_splash-e10d7d663e7f
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, 
 Mario Limonciello <mario.limonciello@amd.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-embedded@vger.kernel.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3043; i=francesco@valla.it;
 h=from:subject:message-id; bh=5RBZj5fiknLzyrEUj0wxw39RQT3sg1+tqKapk21gXJY=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJmx0vmBst9LLTrPL2FLVnujIPlnxsv6yNs7Dy1QPNWrL
 VxZfWdDRykLgxgXg6yYIkvIuhv39sw1/5a2gfERzBxWJpAhDFycAjAR9yRGhueHNGbcPHawpueT
 qVZ4oKNqyd6FJ0MEuYM3ns6WcFitfYqRYUHtWgVV3mfNHyxu79i92Gd+IqsCn+7SVfviVojpf6p
 7yQ8A
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 3fe5309de7f9277537e62eada03940aa
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vd80V-00000006Bkt-0aDE-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-fg2f.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

Hello,

after quite some time, this is the second RFC version for the DRM-based
splash screen. Motivation behind the work can be found in v1 [0]. 

Following the advice received on the v1, I stripped away all of the
user-driven functionalities (i.e.: configurable message and progress
bar), which can be provided by existing userspace tools, and decided to
use 24-bits bitmap as image format instead of raw dumps.

With the addition of EFI BGRT as a new source, this new DRM client is
now able to draw to screen one of the following:

  - a colored background;
  - a BMP image loaded as firmware (either built-in or loaded from the
    filesystem);
  - the BMP image supplied by the EFI BGRT.

Once compiled inside the kernel, the client can be enabled through the
command line specifying the drm_client_lib.active=splash parameter.

Two additional command-line parameters can be specified:

  - drm_client_lib.splash_color=0xRRGGBB to modify the default
    background color (which can in turn be set through a build-time
    option);
  - drm_client_lib.splash_bmp=<image.bmp> to set the BMP image loaded in
    case this is the chosen source (with a fixed default of
    drm_splash.bmp.

These two parameters were kept against some of the received feedback
because they fit a specific embedded usecase I want to cover (i.e.:
hardware model detected and set by the bootloader, along with a custom
splash for each model).

Additional notes:
  - Rotation is still not managed.
  - As for v1, support for tiled screens is untested.
  - Plain color and BMP sources were tested both on QEMU and on a
    Beagleplay.
  - EFI BGRT support was tested using QEMU+OVMF.

Thank you in advance for any feedback you want to leave.

Best regards,
Francesco

[0] https://lore.kernel.org/all/20251027-drm_client_splash-v1-0-00698933b34a@valla.it

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Changes in v2:
  - Moved from raw dump to BMP format for static image source
  - Removed support for configurable message
  - Removed support for progress bar
  - Added EFI BGRT as image source
Link to v1: https://lore.kernel.org/r/20251027-drm_client_splash-v1-0-00698933b34a@valla.it

---
Francesco Valla (3):
      drm: client: add splash client
      MAINTAINERS: add entry for DRM splash client
      drm: docs: remove bootsplash from TODO

 Documentation/gpu/todo.rst                    |  17 -
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/clients/Kconfig               |  79 ++-
 drivers/gpu/drm/clients/Makefile              |   1 +
 drivers/gpu/drm/clients/drm_client_internal.h |   9 +
 drivers/gpu/drm/clients/drm_client_setup.c    |   8 +
 drivers/gpu/drm/clients/drm_splash.c          | 883 ++++++++++++++++++++++++++
 7 files changed, 986 insertions(+), 18 deletions(-)
---
base-commit: 7f98ab9da046865d57c102fd3ca9669a29845f67
change-id: 20251026-drm_client_splash-e10d7d663e7f

Best regards,
-- 
Francesco Valla <francesco@valla.it>


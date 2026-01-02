Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90C3CEDA2A
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 04:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFEE10E011;
	Fri,  2 Jan 2026 03:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kHefYzfc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF11010E00B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 03:57:47 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-8888546d570so175822876d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jan 2026 19:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767326266; x=1767931066; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oN5VJV2tZvTIBYdybUX6CVwWTiAxYRAEOorFIVavLj0=;
 b=kHefYzfcxiqd8cKSmJeBefIcIgXeRflDxhBnzXuvsuIjjRswsKcOaJyP19TWh8xe6l
 hLiFV/ifJYOTnI0gxBK6NhyDlG1ggMIcHcd87mdfQyzNN4l53EIkKVs2rcz4BOJm/9Xc
 nLrIccUAnjiHGI66lln3UGSjphDLGs/gnBZA7UUdoXlDTJherIUW+HvNe4KSF5hH7eWn
 3MFaXjFIwS+1RUTnCJ0PNjd+NfIakJKGD3pb6DpGkq/Vg4PTLkKz8jBUyMyJUS3k8AgH
 VcyDYrDFF+EH+zYlDSeG+/t6yzvFEy+H3VKnJfFmvzP1GxWUVFYE5Ff/bXt3ES0qIWNO
 DG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767326266; x=1767931066;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oN5VJV2tZvTIBYdybUX6CVwWTiAxYRAEOorFIVavLj0=;
 b=Kqjza+xCDnU1poNVYFTpGHMYfxxWqpI2FfoaVYHUhUp5x5Ir23cxymrzB3wLLXK9br
 JXPGrUJy48+o+EMP2SIWbfkUXBnyPyqWVXyXZQndSGMbstM2fcmxsJ+GfEIVy9ihfUBv
 rfcC+pjiyv17FQ9a5khsKr+YvfiFysXl8h2xBgFQkSDfg4/vgxLSbKAWoKMJJ9nCH+3Q
 wWrrDsCmfBCSCFOq0lg53Ks722rLg76fDnZxisLjoPHmkpGi+uRzUHv55T1hAZRC2u95
 Ynnfoz72y5vB2eXsC1rOcR3v+xfPyvFRrJdsS8Y4KglmSWVuJE7cYz5OqzFfW8fEPOg3
 59sw==
X-Gm-Message-State: AOJu0Yx86stUeHC91+jsSdMz3PCQmUKZnd5/tYFFcGNTfpXESdiDsafN
 0NQmDiYeQHsUYs2iZ+p+gLrm5fDppXG+TpingIxk7sVaoq4upEGsr/7CwMDIulmzksDPeVeDNT+
 nWH30JiTPHNoYB+SKgAaqIe/WXsKJDMM=
X-Gm-Gg: AY/fxX5BuzPXhMFtTICIrr0k4oIhrylB0g8YqBXFdH2h6sqi5UOLaMFyU0csxm0XM12
 h1umwNqrwBY9fVLSZF1WY7V2tRSD3QziE5pT0385+ZoBEmCclMWcSAIgB5a82CPqvjsrk/8HKtx
 CUhs1HizBJRfIYj7a5aQ590piiiu0CLEWtfQXXnFH43QkoBdoT31QGru8oUMBi/BL6YIBbupQ3D
 BqI1E6Hc/GSIM17CfDvyoLdgR1iytVV/iYSza077Ka9qMhNnCG+rCMxsX9bfoVAjjibaRBWQO7z
 nsKq
X-Google-Smtp-Source: AGHT+IHHuVR0fKK+96VKS+Pa2dHuUDf824C+49mPj1ohbbrTw6nv/uz67itpw+DV93hjLhwXUDQlH/oKc3inIxwXoWQ=
X-Received: by 2002:a0c:e783:0:b0:880:5bff:74b6 with SMTP id
 6a1803df08f44-88d851fcedbmr488770246d6.7.1767326266453; Thu, 01 Jan 2026
 19:57:46 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 2 Jan 2026 13:57:34 +1000
X-Gm-Features: AQt7F2rcKISLzIve25jq558xyroWk8348lTEvnC4CDXD629mTJLL0nUx3bPV9_o
Message-ID: <CAPM=9twCgpe-QbTaFR0JZ4hMAv8pmGe5wQn2wevGR4HSGQ99XQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.19-rc4
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

Happy New Year, jetlagged fixes from me, still pretty quiet, xe is
most of this, with i915/nouveau/imagination fixes and some shmem
cleanups.

Regards,
Dave.

drm-fixes-2026-01-02:
drm fixes for 6.19-rc4

shmem:
- docs and MODULE_LICENSE fix

xe:
- Ensure svm device memory is idle before migration completes
- Fix a SVM debug printout
- Use READ_ONCE() / WRITE_ONCE() for g2h_fence

i915:
- Fix eb_lookup_vmas() failure path

nouveau:
- fix prepare_fb warnings

imagination:
- prevent export of protected objects
The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da=
:

  Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-01-02

for you to fetch changes up to 7be19f9327d9a015ff97f97381e3bec163cd93cb:

  Merge tag 'drm-intel-fixes-2025-12-31' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
(2026-01-01 16:55:36 +1000)

----------------------------------------------------------------
drm fixes for 6.19-rc4

shmem:
- docs and MODULE_LICENSE fix

xe:
- Ensure svm device memory is idle before migration completes
- Fix a SVM debug printout
- Use READ_ONCE() / WRITE_ONCE() for g2h_fence

i915:
- Fix eb_lookup_vmas() failure path

nouveau:
- fix prepare_fb warnings

imagination:
- prevent export of protected objects

----------------------------------------------------------------
Alessio Belle (1):
      drm/imagination: Disallow exporting of PM/FW protected objects

Dave Airlie (3):
      Merge tag 'drm-xe-fixes-2025-12-30' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-12-29' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2025-12-31' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes

Jonathan Cavitt (1):
      drm/xe/guc: READ/WRITE_ONCE g2h_fence->done

Krzysztof Niemiec (1):
      drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuf=
fer

Lyude Paul (1):
      drm/nouveau/dispnv50: Don't call drm_atomic_get_crtc_state() in prepa=
re_fb

Thomas Hellstr=C3=B6m (2):
      drm/xe/svm: Fix a debug printout
      drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before=
 use

Thomas Zimmermann (2):
      drm/gem-shmem: Fix typos in documentation
      drm/gem-shmem: Fix the MODULE_LICENSE() string

 drivers/gpu/drm/drm_gem_shmem_helper.c         |  5 ++-
 drivers/gpu/drm/drm_pagemap.c                  | 17 +++++++--
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 37 +++++++++----------
 drivers/gpu/drm/imagination/pvr_gem.c          | 11 ++++++
 drivers/gpu/drm/nouveau/dispnv50/atom.h        | 13 +++++++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c        |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                 | 14 +++++--
 drivers/gpu/drm/xe/xe_migrate.c                | 25 ++++++++++---
 drivers/gpu/drm/xe/xe_migrate.h                |  6 ++-
 drivers/gpu/drm/xe/xe_svm.c                    | 51 +++++++++++++++++++---=
----
 include/drm/drm_pagemap.h                      | 17 +++++++--
 11 files changed, 144 insertions(+), 54 deletions(-)

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11079787E42
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 05:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD46310E5F2;
	Fri, 25 Aug 2023 03:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C6410E5F8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 03:07:30 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b962c226ceso6308101fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 20:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692932849; x=1693537649;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hxjULLs8tszYGy1gyvHkYEquD54rMJ6s2Os5kZTBKfE=;
 b=MSSI/lfbS/f/wZLZrOeP8cJ1qievmIL7UK0Kj1b/1fRfyJGDd3WGG81Z924bMA7nyn
 ngLhjfthzdZhoTDXDOn2fsyGFx2FrWXMPk4aodxJZW01MIhs3zTELIaQgsml1jWqQumf
 R58fq9IVVhDm16GeluJ5mqTQ1ZJ0ENYxN41DrNtakG6LH4A2oebR+Dukz9DIIxFNypwF
 ssHaTno1foMH4EvqvydB3b8/Jqfv6wuXd/64MXerBzsIAaVET5R/9jYjLE8+n0c1UmPG
 Jv6Qx3ngvs+KeUqac+EHnMjSssQN/rcIQAg3mur+idl96z6JDMwY0ySfsuk0Xa64paZ/
 AvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692932849; x=1693537649;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hxjULLs8tszYGy1gyvHkYEquD54rMJ6s2Os5kZTBKfE=;
 b=gf0aFA8C13D8yvJEixyj/UQDVLlFuwGIPwqFkIMQf+CyvReatB4LW7u1jhrQZkwMTu
 3uUoeVnwUovL7tlm6UDrPO1ll29zZBWJyY6kelpIKUm/x45sL2w8zL1QgBczlyC4CRCo
 Rt/N5Q2lHi66R8n233Ys3e/tIpKwFRTPkMF8DDhAt8wp8PXLRmYsZfKRmRT0TJlzoYrK
 5nan7dpXD7OS71PPaUjDs0Jl6160BdEQj8ilCKxO6U6D+xHzGoyP9YMvCrffuYC3SBOI
 UcIt0ASpuJX6a9EYFdGA8ewN6mvpO9Fqam3qWenhRAnrcU+7zxXMCbALXOCnQ9KmGyIs
 k2WA==
X-Gm-Message-State: AOJu0YyzR3Dloyf4Y4HCoXCSgZGGno6CuX6/+/GWmf2s4C3U4mIAKpmT
 YDMNuC21+5VnEk0Oxen5eLjJWnCj2ZnJpmmXkPc=
X-Google-Smtp-Source: AGHT+IEegpBDfaPBqqNmsZ9rrNZmdHsjADO/AD3Nqg0lhvvWgR//RsJD5iIbwuvUq1NB0QeIErmC86zdOQ/zDl4aOaI=
X-Received: by 2002:a2e:7010:0:b0:2bb:bf30:16f1 with SMTP id
 l16-20020a2e7010000000b002bbbf3016f1mr12416033ljc.18.1692932848419; Thu, 24
 Aug 2023 20:07:28 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 25 Aug 2023 13:07:17 +1000
Message-ID: <CAPM=9tyKm+X8XMk75_vWoFk90vjA33Jyo-ic==PQM84_WK2_Wg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.5 final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

A bit bigger than I'd care for, but it's mostly a single vmwgfx fix
and a fix for an i915 hotplug probing. Otherwise misc i915, bridge,
panfrost and dma-buf fixes.

Dave.

drm-fixes-2023-08-25:
drm fixes for 6.5-rc8

core:
- add a HPD poll helper

i915:
- fix regression in i915 polling
- fix docs build warning
- fix DG2 idle power consumption

bridge:
- samsung-dsim: init fix

panfrost:
- fix speed binning issue

dma-buf:
- fix recursive lock in fence signal

vmwgfx:
- fix shader stage validation
- fix NULL ptr derefs in gem put
The following changes since commit 706a741595047797872e669b3101429ab8d378ef:

  Linux 6.5-rc7 (2023-08-20 15:02:52 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-08-25

for you to fetch changes up to 59fe2029b9e05cd490eaf972053dd86f96f77869:

  Merge tag 'drm-intel-fixes-2023-08-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2023-08-25
09:12:02 +1000)

----------------------------------------------------------------
drm fixes for 6.5-rc8

core:
- add a HPD poll helper

i915:
- fix regression in i915 polling
- fix docs build warning
- fix DG2 idle power consumption

bridge:
- samsung-dsim: init fix

panfrost:
- fix speed binning issue

dma-buf:
- fix recursive lock in fence signal

vmwgfx:
- fix shader stage validation
- fix NULL ptr derefs in gem put

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/display/dp: Fix the DP DSC Receiver cap size

Anshuman Gupta (1):
      drm/i915/dgfx: Enable d3cold at s2idle

Dave Airlie (2):
      Merge tag 'drm-misc-fixes-2023-08-24' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-08-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

David Michael (1):
      drm/panfrost: Skip speed binning on EOPNOTSUPP

Frieder Schrempf (1):
      drm: bridge: samsung-dsim: Fix init during host transfer

Imre Deak (2):
      drm: Add an HPD poll helper to reschedule the poll work
      drm/i915: Fix HPD polling, reenabling the output poll work as needed

Jani Nikula (1):
      drm/i915: fix Sphinx indentation warning

Rob Clark (1):
      dma-buf/sw_sync: Avoid recursive lock during fence signal

Zack Rusin (2):
      drm/vmwgfx: Fix shader stage validation
      drm/vmwgfx: Fix possible invalid drm gem put calls

 drivers/dma-buf/sw_sync.c                    | 18 ++++----
 drivers/gpu/drm/bridge/samsung-dsim.c        | 27 +++++++----
 drivers/gpu/drm/drm_probe_helper.c           | 68 +++++++++++++++++++---------
 drivers/gpu/drm/i915/display/intel_hotplug.c |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c       |  2 +
 drivers/gpu/drm/i915/i915_driver.c           | 33 ++++++++------
 drivers/gpu/drm/panfrost/panfrost_devfreq.c  |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c           |  6 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h           |  8 ++++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h          | 12 +++++
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c      | 35 ++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c          |  6 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c      |  3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c       |  3 +-
 include/drm/display/drm_dp.h                 |  2 +-
 include/drm/drm_probe_helper.h               |  1 +
 16 files changed, 136 insertions(+), 94 deletions(-)

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD23176F947
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 07:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBADC10E240;
	Fri,  4 Aug 2023 05:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3773310E23C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 05:08:10 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5221cf2bb8cso2173660a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 22:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691125688; x=1691730488;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5nqqRfBNPBQ+VMaK2HsDYoXmhmlAtvK4SXNfFFGzlpo=;
 b=lACS6lI/ekoOHa/nyz59RAxxBRYorYg619oLE4WoJ+0tHRIgbsotkGfTrETXBdJ90K
 YLnSGJgpcAwEc9JknkHlswmASGDd1UEwpJeGg9Fvl49cbVJuiTX16G5Isdg4fVPg4oPl
 veMGoNBjt6umC24dlFxaL/I/2vljGKTAUH5hxF71qLZ5N7oal9OKMFBa+avD2IpFFS3p
 5M/xEYCP99dE/MiOLV5yDNC2gDsytIsIrTx3I0owIRf5NxEFW1W0UMmm4Tn1wWnPB/2A
 V2EuGzRFrcc6mAAjv4HsB296hjBHh9kbyCc5fH7s3xHuzU9eljjl780gbVpI6KPYgsVu
 4xvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691125688; x=1691730488;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5nqqRfBNPBQ+VMaK2HsDYoXmhmlAtvK4SXNfFFGzlpo=;
 b=ZKPXXSFiRwZ1cYBkDVVvBxa6MPIAIFT+C+5xItkiDl6b+HQgJFyhdSRf4cG2H7FO8L
 dvDDzuO3ywTavoTIUHAwg2mKFZSuA5O7vw9ves9LPI7/F9g8Hr3rNNlnyp5O1lSmE438
 /vBYB3WmBscXJFEUJWwIhk4PQKadb3wWRNrr/pjS2+Zsyda7+XhmDu8vFJ6xT2VLh4ci
 50IZCgqDKs7okKJQX7hXjV/vmSkM4qKFiqjrtiJ/xRAqGzPewWAgBEm+t7Sig/Cz+Sd5
 UJAnXCCyFv0OXXSQTeno2XkwTkPaI75kL6c3j/05BdbubbouPVPid2gywUXHKB6wJIi8
 Stag==
X-Gm-Message-State: AOJu0Yx9RICpR1gGm1Gh9zjUHZsPb72YpCBL0EWCaw6X8BV6pPAOcoz8
 e1ShMq1JZEl9NXI6Tjgi+Lgx8T27/QWsIlGsZW5mI6eholp6hw==
X-Google-Smtp-Source: AGHT+IEEFONMLQ+vBml2My8FR537suOeUVDgX4piJXXblwaS9SHtCdQfAVRo6JcqNmAlLjUPfTOHkrPlZKOGl2+aFPU=
X-Received: by 2002:a17:907:78c5:b0:99b:ef8a:d64a with SMTP id
 kv5-20020a17090778c500b0099bef8ad64amr612269ejc.0.1691125688392; Thu, 03 Aug
 2023 22:08:08 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 4 Aug 2023 15:07:56 +1000
Message-ID: <CAPM=9ty0b5R=rfu21PD=V1dh91XMit2wzAuAcrJA0E8h2EuUng@mail.gmail.com>
Subject: [git pull] drm fixes for 6.5-rc5
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

Small set of fixes this week, i915 and a few misc ones. I didn't see
an amd pull so maybe next week it'll have a few more on that driver.

Dave.

drm-fixes-2023-08-04:
drm fixes for 6.5-rc5

ttm:
- NULL ptr deref fix

panel:
- add missing MODULE_DEVICE_TABLE

imx/ipuv3:
- timing fix

i915:
- Fix bug in getting msg length in AUX CH registers handler
- Gen12 AUX invalidation fixes
- Fix premature release of request's reusable memory
The following changes since commit 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4:

  Linux 6.5-rc4 (2023-07-30 13:23:47 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-08-04

for you to fetch changes up to 1958b0f95a35e4443573c4c3ec2efd89d2d00d82:

  Merge tag 'drm-intel-fixes-2023-08-03' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2023-08-04
09:38:38 +1000)

----------------------------------------------------------------
drm fixes for 6.5-rc5

ttm:
- NULL ptr deref fix

panel:
- add missing MODULE_DEVICE_TABLE

imx/ipuv3:
- timing fix

i915:
- Fix bug in getting msg length in AUX CH registers handler
- Gen12 AUX invalidation fixes
- Fix premature release of request's reusable memory

----------------------------------------------------------------
Alexander Stein (1):
      drm/imx/ipuv3: Fix front porch adjustment upon hactive aligning

Andi Shyti (5):
      drm/i915/gt: Cleanup aux invalidation registers
      drm/i915: Add the gen12_needs_ccs_aux_inv helper
      drm/i915/gt: Rename flags with bit_group_X according to the datasheet
      drm/i915/gt: Enable the CCS_FLUSH bit in the pipe control and in the CS
      drm/i915/gt: Support aux invalidation on all engines

Dave Airlie (2):
      Merge tag 'drm-misc-fixes-2023-08-03' of
ssh://git.freedesktop.org/git/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-08-03' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Guchun Chen (1):
      drm/ttm: check null pointer before accessing when swapping

Janusz Krzysztofik (1):
      drm/i915: Fix premature release of request's reusable memory

Jonathan Cavitt (2):
      drm/i915/gt: Ensure memory quiesced before invalidation
      drm/i915/gt: Poll aux invalidation register bit on invalidation

Nikita Travkin (1):
      drm/panel: samsung-s6d7aa0: Add MODULE_DEVICE_TABLE

Tvrtko Ursulin (1):
      Merge tag 'gvt-fixes-2023-08-02' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Yan Zhao (1):
      drm/i915/gvt: Fix bug in getting msg length in AUX CH registers handler

 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 140 +++++++++++++++++---------
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h      |  21 ++--
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  16 +--
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  17 +---
 drivers/gpu/drm/i915/gvt/edid.c               |   2 +-
 drivers/gpu/drm/i915/i915_active.c            |  99 ++++++++++++------
 drivers/gpu/drm/i915/i915_request.c           |  11 ++
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c        |   2 +-
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c |   1 +
 drivers/gpu/drm/ttm/ttm_bo.c                  |   3 +-
 11 files changed, 203 insertions(+), 111 deletions(-)

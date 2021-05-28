Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FFB3947AA
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 22:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A905E6E0BC;
	Fri, 28 May 2021 20:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558866E0BC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 20:01:02 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id e24so6052114eds.11
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=XVXfZwPZFKcCSAJsJtKc65k2oF75TB0+EMNVC1jdGig=;
 b=CU6zf2IaEABOz1G19VE3RNZam4EkKciYmCtN+ndVfLGg2wppX2/fD8/TV3H4fRvxo4
 ElmDS/tfdm7ba/BQdQUf7onfK8SPNGDEqqHGG4KaZ5tCkotoR3vPNjfJBmspeCKc2JNH
 U0ZohQEoIxKU5pdqDQKPbKkZ7VU3sHpU7yKSodKXVW19mzEHlFXdhMex48ZqAGlWvet+
 4GS3EMUvlFUkfqTyFcsiiJkAlXlqzNRXigA4wYKs15G6bjW528Zf3TSIGU9dtGt5QZ+6
 /WHmNQsSYCeJyU0RifGM07pwaeiDj2hoI6mXC/ztm9N2g93bovSQ8jQ8IZjL0VHC49f9
 H3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=XVXfZwPZFKcCSAJsJtKc65k2oF75TB0+EMNVC1jdGig=;
 b=fAa28weGtfh8gILAmEeSKb7fRCqa2hUaFQHNKMg/bjhTrlCjxkkxBOf2NnkYF3+iM+
 6W/TjHfoxW1aSNnP8myXn6a1Jur0frDad4ux62RO6KpLEjCnfBuTteYIS/J3js/tSZxx
 mcuCl5qFMF+biGIzHiSGgAh8Y2FX/u+aW8XUFGh8OKKDFKwvaI3ex3mb8YfTX9kRS4F2
 nAjmaq5QIgD/NdB5U+YhMbH3qCmVjhXhVt/VrWovE9RUaMFFmn0GLiT9Jg7PPv0AQtyF
 Ry8Br3hlASQxwF3A7K/2HUM4+KBacgjGMLgI+jY9O/GKpBRThXR6986HtKbGKiUTuxw5
 4W3w==
X-Gm-Message-State: AOAM531OtWMijyBjWqLQW1GNtf2JUGdP1AwzyGEj2XysZPfJjPUrLC14
 1ebdy8bjbJ4q1LTqiFafEfS5HQlAZbMvyTN64bE=
X-Google-Smtp-Source: ABdhPJxkQcDQjk8PB8knVzCjHloLShbgaSNhs3NRDqcJXlr/olLTrFrneV3xYixI6wvTwW3WAtXPo6JngghBeTTrH4c=
X-Received: by 2002:aa7:d7d5:: with SMTP id e21mr11857017eds.78.1622232060781; 
 Fri, 28 May 2021 13:01:00 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 29 May 2021 06:00:49 +1000
Message-ID: <CAPM=9twKOn4j8-_gDfm_DsQv-96MA6Wv+76bURR6Tb34jkVMcQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.13-rc4
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

Pretty quiet this week, couple of amdgpu, one i915, and a few misc otherwise.

Dave.

drm-fixes-2021-05-29:
drm fixes for 5.13-rc4

ttm:
- prevent irrelevant swapout

amdgpu:
- MultiGPU fan fix
- VCN powergating fixes

amdkfd:
- Fix SDMA register offset error

meson:
- fix shutdown crash

i915:
- Re-enable LTTPR non-transparent LT mode for DPCD_REV<1.4
The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:

  Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-05-29

for you to fetch changes up to aeeb517368822e2b24231f5bd43a98ecdbe65d59:

  Merge tag 'drm-intel-fixes-2021-05-27' of
ssh://git.freedesktop.org/git/drm/drm-intel into drm-fixes (2021-05-28
13:28:18 +1000)

----------------------------------------------------------------
drm fixes for 5.13-rc4

ttm:
- prevent irrelevant swapout

amdgpu:
- MultiGPU fan fix
- VCN powergating fixes

amdkfd:
- Fix SDMA register offset error

meson:
- fix shutdown crash

i915:
- Re-enable LTTPR non-transparent LT mode for DPCD_REV<1.4

----------------------------------------------------------------
Dave Airlie (3):
      Merge tag 'amd-drm-fixes-5.13-2021-05-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2021-05-27' of
ssh://git.freedesktop.org/git/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2021-05-27' of
ssh://git.freedesktop.org/git/drm/drm-intel into drm-fixes

Evan Quan (1):
      drm/amd/pm: correct MGpuFanBoost setting

Imre Deak (1):
      drm/i915: Reenable LTTPR non-transparent LT mode for DPCD_REV<1.4

James Zhu (7):
      drm/amdgpu/vcn1: add cancel_delayed_work_sync before power gate
      drm/amdgpu/vcn2.0: add cancel_delayed_work_sync before power gate
      drm/amdgpu/vcn2.5: add cancel_delayed_work_sync before power gate
      drm/amdgpu/vcn3: add cancel_delayed_work_sync before power gate
      drm/amdgpu/jpeg2.0: add cancel_delayed_work_sync before power gate
      drm/amdgpu/jpeg2.5: add cancel_delayed_work_sync before power gate
      drm/amdgpu/jpeg3: add cancel_delayed_work_sync before power gate

Kevin Wang (1):
      drm/amdkfd: correct sienna_cichlid SDMA RLC register offset error

Neil Armstrong (1):
      drm/meson: fix shutdown crash when component not probed

xinhui pan (1):
      drm/ttm: Skip swapout if ttm object is not populated

 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   | 12 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |  2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |  4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |  4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |  6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  9 +++
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 10 +++
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 71 ++++++++++------------
 drivers/gpu/drm/meson/meson_drv.c                  |  9 +--
 drivers/gpu/drm/ttm/ttm_device.c                   |  2 +-
 13 files changed, 81 insertions(+), 57 deletions(-)

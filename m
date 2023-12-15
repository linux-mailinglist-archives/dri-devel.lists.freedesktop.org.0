Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE81D8141E1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 07:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B1210E319;
	Fri, 15 Dec 2023 06:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C4310E319
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 06:42:15 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a1f653e3c3dso40780666b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 22:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702622533; x=1703227333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hhCI+8rU2ZTrrNKubhh6GdAh79QcJDbf1NF2d1tBvLc=;
 b=IVQooAH5he3sAvWoFdgzoUcBOyQr0jYeu4nPVudKxFQFnhGCitS/HXLBjfL2zonUky
 1Mp2hgwxiVxask71WOkR4LDoZup2lcfx7WsHgiSW0weJFjFDQHpa77gYHuLNsS/zrbTN
 auH4bprE3U9+tYFF7kQ/wETW/gkc8dDCs9QxmucqiMt0KIADuJsTp89qYCLnhT6exmHO
 12+1J8UstxUHL5r1lrpylmppb1bJbP48rXWysXmS/aTKQTw8TEouVtulmkfaoSAFNm3v
 gqn2dNam5Aeihp1JLxAU7PB0nwI1/3VST/6f/g8zqi4SswwsUiawxnMpOeXtXefajFmn
 kBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702622533; x=1703227333;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hhCI+8rU2ZTrrNKubhh6GdAh79QcJDbf1NF2d1tBvLc=;
 b=Zskq+Xuhqzd6D+V58cKNR1Awltmnlm3ZvDFAFTBfYtFubwQjtV+tB8t4JRvPHBIE+b
 gWR9XkuTz4fE2d9RkveP5IoIJ2vsBQDo5liQ8DoQm5g2w6x+E5w8Ml8zVshsKt+hPly0
 AalZX/x0jKmU2UaDeFpjaUfw5qb/zBOaBifC/N5JJ6fana03J4xqSuZHO/lnPg7ByD37
 Pa92oS3FYmq5XsenWdB8qO6PzOueUQoT9n3CVOnUgaHOKX0UffySskp38oeqYDodfgPp
 3BdpbfCCR0qYiw6AtqFuVht7/HhIyLrfIQkXL06tOYQYyobCSYJHLANeN3dTkuS8u0Ag
 Jltw==
X-Gm-Message-State: AOJu0Yyk97CoFl712702z1r4osBeAu0W7Lu7yrbKAd2c0/HDbePDWPdX
 ai1Y8ESAnsULVJkb01FOOaj/jyTVIDfIL+SqCTvi86HLiHQ=
X-Google-Smtp-Source: AGHT+IHqXHo+PgVfPkopjEwAFFxRUoDVvHlsX0wAxuQvaVz0Tax80RaYQjx3V0KAhtqKofM7xB/mR7LJ3TnALs7oh14=
X-Received: by 2002:a17:906:2dd:b0:a18:7e19:5347 with SMTP id
 29-20020a17090602dd00b00a187e195347mr2893251ejk.47.1702622533055; Thu, 14 Dec
 2023 22:42:13 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 15 Dec 2023 16:42:01 +1000
Message-ID: <CAPM=9txCv2m6AKVoBPbAL4jpJL2aJy_T_vvH4Tj0rdtY004Hgw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.7-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

More regular fixes, amdgpu, i915, mediatek and nouveau are most of
them this week. Nothing too major, then a few misc bits and pieces in
core, panel and ivpu.

Dave.

drm-fixes-2023-12-15:
drm fixes for 6.7-rc6

drm:
- fix uninit problems in crtc
- fix fd ownership check
- edid: add modes in fallback paths

panel:
- move LG panel into DSI yaml
- ltk050h3146w: set burst mode

mediatek:
- mtk_disp_gamma: Fix breakage due to merge issue
- fix kernel oops if no crtc is found
- Add spinlock for setting vblank event in atomic_begin
- Fix access violation in mtk_drm_crtc_dma_dev_get

i915:
- Fix selftest engine reset count storage for multi-tile
- Fix out-of-bounds reads for engine reset counts
- Fix ADL+ remapped stride with CCS
- Fix intel_atomic_setup_scalers() plane_state handling
- Fix ADL+ tiled plane stride when the POT stride is smaller than the origi=
nal
- Fix eDP 1.4 rate select method link configuration

amdgpu:
- Fix suspend fix that got accidently mangled last week
- Fix OD regression
- PSR fixes
- OLED Backlight regression fix
- JPEG 4.0.5 fix
- Misc display fixes
- SDMA 5.2 fix
- SDMA 2.4 regression fix
- GPUVM race fix

nouveau:
- fix gk20a instobj hierarchy
- fix headless iors inheritance regression

ivpu:
- fix WA initialisation
The following changes since commit a39b6ac3781d46ba18193c9dbb2110f31e9bffe9=
:

  Linux 6.7-rc5 (2023-12-10 14:33:40 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-12-15

for you to fetch changes up to 7ba84cbf18c7a53107c64880d9c90f18fa68b481:

  drm/nouveau/kms/nv50-: Don't allow inheritance of headless iors
(2023-12-15 14:11:47 +1000)

----------------------------------------------------------------
drm fixes for 6.7-rc6

drm:
- fix uninit problems in crtc
- fix fd ownership check
- edid: add modes in fallback paths

panel:
- move LG panel into DSI yaml
- ltk050h3146w: set burst mode

mediatek:
- mtk_disp_gamma: Fix breakage due to merge issue
- fix kernel oops if no crtc is found
- Add spinlock for setting vblank event in atomic_begin
- Fix access violation in mtk_drm_crtc_dma_dev_get

i915:
- Fix selftest engine reset count storage for multi-tile
- Fix out-of-bounds reads for engine reset counts
- Fix ADL+ remapped stride with CCS
- Fix intel_atomic_setup_scalers() plane_state handling
- Fix ADL+ tiled plane stride when the POT stride is smaller than the origi=
nal
- Fix eDP 1.4 rate select method link configuration

amdgpu:
- Fix suspend fix that got accidently mangled last week
- Fix OD regression
- PSR fixes
- OLED Backlight regression fix
- JPEG 4.0.5 fix
- Misc display fixes
- SDMA 5.2 fix
- SDMA 2.4 regression fix
- GPUVM race fix

nouveau:
- fix gk20a instobj hierarchy
- fix headless iors inheritance regression

ivpu:
- fix WA initialisation

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: fix buffer funcs setting order on suspend harder
      drm/amdgpu/sdma5.2: add begin/end_use ring callbacks

Andrzej Kacprowski (1):
      accel/ivpu/37xx: Fix interrupt_clear_with_0 WA initialization

AngeloGioacchino Del Regno (1):
      drm/mediatek: mtk_disp_gamma: Fix breakage due to merge issue

Christian K=C3=B6nig (2):
      drm/amdgpu: fix tear down order in amdgpu_vm_pt_free
      drm/amdgpu: warn when there are still mappings when a BO is destroyed=
 v2

Dave Airlie (4):
      Merge tag 'mediatek-drm-fixes-20231211' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes
      Merge tag 'drm-intel-fixes-2023-12-13' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.7-2023-12-13' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2023-12-14' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

David Heidelberg (1):
      dt-bindings: panel-simple-dsi: move LG 5" HD TFT LCD panel into DSI y=
aml

Dmitrii Galantsev (1):
      drm/amd/pm: fix pp_*clk_od typo

Fangzhi Zuo (1):
      drm/amd/display: Populate dtbclk from bounding box

Farouk Bouabid (1):
      drm/panel: ltk050h3146w: Set burst mode for ltk050h3148w

Hamza Mahfooz (1):
      drm/amd/display: fix hw rotated modes when PSR-SU is enabled

Jani Nikula (3):
      drm/crtc: fix uninitialized variable use
      drm/i915/edp: don't write to DP_LINK_BW_SET when using rate select
      drm/edid: also call add modes in EDID connector update fallback

Jason-JH.Lin (1):
      drm/mediatek: Add spinlock for setting vblank event in atomic_begin

Lingkai Dong (1):
      drm: Fix FD ownership check in drm_master_check_perm()

Lyude Paul (1):
      drm/nouveau/kms/nv50-: Don't allow inheritance of headless iors

Mario Limonciello (3):
      drm/amd/display: Restore guard against default backlight value < 1 ni=
t
      drm/amd/display: Disable PSR-SU on Parade 0803 TCON again
      drm/amd: Fix a probing order problem on SDMA 2.4

Michael Walle (1):
      drm/mediatek: fix kernel oops if no crtc is found

Saleemkhan Jamadar (1):
      drm/amdgpu/jpeg: configure doorbell for each playback

Stuart Lee (1):
      drm/mediatek: Fix access violation in mtk_drm_crtc_dma_dev_get

Taimur Hassan (1):
      drm/amd/display: Revert "Fix conversions between bytes and KB"

Thierry Reding (1):
      drm/nouveau: Fixup gk20a instobj hierarchy

Tvrtko Ursulin (2):
      drm/i915/selftests: Fix engine reset count storage for multi-tile
      drm/i915: Use internal class when counting engine resets

Ville Syrj=C3=A4l=C3=A4 (3):
      drm/i915: Fix remapped stride with CCS on ADL+
      drm/i915: Fix intel_atomic_setup_scalers() plane_state handling
      drm/i915: Fix ADL+ tiled plane stride when the POT stride is
smaller than the original

Ziqi Zhao (1):
      drm/crtc: Fix uninit-value bug in drm_mode_setcrtc

 .../bindings/display/panel/panel-simple-dsi.yaml   |  2 ++
 .../bindings/display/panel/panel-simple.yaml       |  2 --
 drivers/accel/ivpu/ivpu_hw_37xx.c                  | 12 ++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  3 ++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           | 15 ++++++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |  4 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             | 28 ++++++++++++++++++=
+
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  3 +++
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |  1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  | 12 +++++++--
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   | 14 ++++++----
 .../drm/amd/display/dc/dml2/display_mode_core.c    | 16 +++++------
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  5 ++--
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  3 ++-
 .../dc/link/protocols/link_edp_panel_control.c     |  4 +--
 .../drm/amd/display/modules/power/power_helpers.c  |  2 ++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  4 +--
 drivers/gpu/drm/drm_auth.c                         |  2 +-
 drivers/gpu/drm/drm_crtc.c                         |  8 +++---
 drivers/gpu/drm/drm_edid.c                         |  3 ++-
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 31 +++++++++++++++---=
----
 drivers/gpu/drm/i915/display/intel_fb.c            | 19 ++++++++++---
 drivers/gpu/drm/i915/display/skl_scaler.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  5 ++--
 drivers/gpu/drm/i915/i915_gpu_error.h              | 12 +++++++--
 drivers/gpu/drm/i915/selftests/igt_live_test.c     |  9 ++++---
 drivers/gpu/drm/i915/selftests/igt_live_test.h     |  3 ++-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            | 14 +++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  5 +++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c    | 18 ++++++-------
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |  2 +-
 36 files changed, 190 insertions(+), 83 deletions(-)

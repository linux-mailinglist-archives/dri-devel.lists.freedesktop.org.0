Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC3571F929
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 06:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF2410E619;
	Fri,  2 Jun 2023 04:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB5510E619
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 04:13:14 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-974265a1a40so620635066b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 21:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685679191; x=1688271191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VIR8w9cgDXzXi7+1iKlCaAfcvOlfkoacHFLlw4+WQ2A=;
 b=LEHsExU4DVP+TUT5BXfeNgTtpxcaJOulSTjhhLWA8N3BT/YoGXKt86L7/Y+8jzGzkE
 bht0W80Ci1f9uuPcd7UjPpy2D0kb2M5ccCT6JNAr+8oCusxgQXb/4y60NKkp37asEown
 78msb8alKOlX7uzUgxri7VILKrTMLJ3VgJTs3XcBnH4lrHy802UsqXIFWXRg/N2PQSCi
 UG2zO7fd3Uh7GRxqqOUg5t8uUmXsGfXtw455gm9567fYiQNpoepuV8wDjif0wQOVnK8+
 AAkwtN3UzDxkByCAY+cgOzQRNeEs7znMCqAK8xV7lvb9NifZ0YWXLDQrCMGiQnD4r7H5
 05lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685679191; x=1688271191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VIR8w9cgDXzXi7+1iKlCaAfcvOlfkoacHFLlw4+WQ2A=;
 b=YOoSU2SeU/+4vIveg795EIfftbt4FmfxAMA4Py6VDwvxVHP8Zcb7nSj/dmx1ipYGdp
 UcvcGK7JYBok5u8fotxJG5NgMyRGCtD7jwV6FLr1jxU1cfRXJT8Cms1OW0yg2/AsFg9w
 lxuE3V3AIh0/MCCJ+G10B2bKkhPyqeuXBLMYolSVFqJHP0bQPA3cKkyDb1xlQdI8/OJM
 bnb9AQNtx612xrc87dNVKyebKBbzTo2eT+lXSBIpQuyt/HyvOrNtDegPJgdqQAPttcPZ
 rifaSrnDZuaWD4H+q41oJpjY1m5JL2Y4pWhiz6CGn+KMgKzu79Ny5rflEReLImcNNCxK
 R3fg==
X-Gm-Message-State: AC+VfDyCIg62U89fekYPFZCuoU9ivUyPVbW/l0oxpQPOs7VxnueqT39Y
 7VaesobzENKYlHJI6Hc4VDG+JBK8NsM0SxUN0+U=
X-Google-Smtp-Source: ACHHUZ4rbz+JEdNRv4AU0sSdE8gqFvZJ4o6EWuNPRzcMgNzr0FUIlsrkJgw32WWDPPsFL8l6CDbOh7NVAvDfdeGCypI=
X-Received: by 2002:a17:907:6e8e:b0:96f:b40a:c85f with SMTP id
 sh14-20020a1709076e8e00b0096fb40ac85fmr4132435ejc.23.1685679191267; Thu, 01
 Jun 2023 21:13:11 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 2 Jun 2023 14:12:59 +1000
Message-ID: <CAPM=9tyD7t3pBvY9PN5g8M3KN-y7i-cNHwtoR3x5-f=-U+fAEw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.4-rc5
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

Quiet enough week, though the misc fixes tree didn't get to me when I
was sending this, so maybe it'll be a bit bigger next week, just one
i915 fix and some scattered amdgpu fixes.

Dave.

drm-fixes-2023-06-02:
drm fixes for v6.4-rc5

amdgpu:
- Fix mclk and fclk output ordering on some APUs
- Fix display regression with 5K VRR
- VCN, JPEG spurious interrupt warning fixes
- Fix SI DPM on some ARM64 platforms
- Fix missing TMZ enablement on GC 11.0.1

i915:
- Fix for OA reporting to allow detecting non-power-of-two reports
The following changes since commit 7877cb91f1081754a1487c144d85dc0d2e2e7fc4=
:

  Linux 6.4-rc4 (2023-05-28 07:49:00 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-06-02

for you to fetch changes up to b6ccf213d95e9373ac1f7fbcb5de3b52eec0ddb3:

  Merge tag 'drm-intel-fixes-2023-06-01' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2023-06-02
10:33:29 +1000)

----------------------------------------------------------------
drm fixes for v6.4-rc5

amdgpu:
- Fix mclk and fclk output ordering on some APUs
- Fix display regression with 5K VRR
- VCN, JPEG spurious interrupt warning fixes
- Fix SI DPM on some ARM64 platforms
- Fix missing TMZ enablement on GC 11.0.1

i915:
- Fix for OA reporting to allow detecting non-power-of-two reports

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/i915/perf: Clear out entire reports after reading if not
power of 2 size

Dave Airlie (2):
      Merge tag 'amd-drm-fixes-6.4-2023-05-31' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2023-06-01' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Guchun Chen (1):
      drm/amd/pm: resolve reboot exception for si oland

Horatio Zhang (6):
      drm/amdgpu: separate ras irq from vcn instance irq for UVD_POISON
      drm/amdgpu: add RAS POISON interrupt funcs for vcn_v2_6
      drm/amdgpu: add RAS POISON interrupt funcs for vcn_v4_0
      drm/amdgpu: separate ras irq from jpeg instance irq for UVD_POISON
      drm/amdgpu: add RAS POISON interrupt funcs for jpeg_v2_6
      drm/amdgpu: add RAS POISON interrupt funcs for jpeg_v4_0

Ikshwaku Chauhan (1):
      drm/amdgpu: enable tmz by default for GC 11.0.1

Michel D=C3=A4nzer (2):
      Revert "drm/amd/display: Block optimize on consecutive FAMS enables"
      Revert "drm/amd/display: Do not set drr on pipe commit"

Tim Huang (5):
      drm/amd/pm: reverse mclk and fclk clocks levels for SMU v13.0.4
      drm/amd/pm: reverse mclk clocks levels for SMU v13.0.5
      drm/amd/pm: reverse mclk and fclk clocks levels for yellow carp
      drm/amd/pm: reverse mclk and fclk clocks levels for vangogh
      drm/amd/pm: reverse mclk and fclk clocks levels for renoir

 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           | 27 +++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            | 27 +++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  3 ++
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             | 28 +++++++++++++----
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             | 28 ++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              | 25 ++++++++++++---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              | 36 ++++++++++++++++++=
----
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  9 ------
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 25 +--------------
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         | 29 -----------------
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   | 10 +++---
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  5 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |  5 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |  5 +--
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |  5 +--
 drivers/gpu/drm/i915/i915_perf.c                   | 17 ++++++----
 18 files changed, 184 insertions(+), 106 deletions(-)

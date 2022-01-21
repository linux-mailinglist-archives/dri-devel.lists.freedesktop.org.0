Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E886495743
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 01:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454EB10E22C;
	Fri, 21 Jan 2022 00:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE2F10E135
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 00:17:18 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id p12so35739583edq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 16:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=I9viqpO6auKcSCT1TCANj8QL/mwnoErD38GKR+I2UBQ=;
 b=OAq1lmsOGVWdBdRHaUKwZbRm80b3SBv2hRX2HW+5UbwGjts3PFuGYE9zOXumwr2qFx
 +WAhLEmpw5/37z/7ifxANkepop967nkBCkwdH05oPGV0RBFZ5bvJ/fcC97s0avQgv+K1
 JAJsjiToTjCuORpDagXxvR62sNZrSIOsdYpWaVEDxlxZZ/viwVW30ePQpcCBhFPj60Cj
 U1GYL0I6zVyX0cCn57LfoyrioNC/Dfpg8REsG4e218Ql9yJhKj3KlJK0OBmJaySuyole
 eBw8UfS7X3CSDc1kMgQpQxhCID7hTS73DS4HOz50bCMQvfMQjo/zTHHcpCPCzh6Vz85i
 cqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=I9viqpO6auKcSCT1TCANj8QL/mwnoErD38GKR+I2UBQ=;
 b=h+Wbl3kPeAPBpKSJxxviMwSUtib5QDhNK7bGiZbNel3fGnpo0pYyKJrL7SxLitCqvS
 nOFsMCTItHWDtsRJYcr4AtGiK5xvutvDhWpgzv4npqurd9zcx6md8P+dD8HR3Wo9010X
 QjwLXHZn6Ta7suLU1L8pmRJrJVMfisN1vWCwkYaGzJUKf4oh7FghbHjkN0cfWSDJmdUl
 1Ci80VtnNHtghGzVd6MeTl+ANg+K5iZwaz5fLfWT3o8IJfKMa8Q7XO3bnQeSEHAikKt6
 viupk+kZXUllhzAlrpMTfgZrs4SYzamQHX2mKTKdpv8eYvzay8EvCpwLQ/+IDjWs3rHt
 CjmQ==
X-Gm-Message-State: AOAM532ZdEMN4Srh/lJeBX0MnlXqEURuD3pL+5avXQ6pb2Kh95Q9iaws
 BHyrPwkEf6REtPULJJCCzh02ubGHcZ5wxTXlhiY=
X-Google-Smtp-Source: ABdhPJyvwjlGCqiLtgCsE5gczG/HwTPFx+w0Jo9NolFqyPm8GfnCfOSEuwpYmObpCqCUQ3nkh0CaBMXTCteQznGyqHA=
X-Received: by 2002:a17:906:d554:: with SMTP id
 cr20mr1205318ejc.770.1642724237001; 
 Thu, 20 Jan 2022 16:17:17 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 21 Jan 2022 10:17:05 +1000
Message-ID: <CAPM=9txt8OsBJJBzCYXMgMC8T=yKTWz9MYA3osB93EqMk5vBGg@mail.gmail.com>
Subject: [git pull] drm fixes for 5.17-rc1
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

Thanks to Daniel for taking care of things while I was out, just a set
of merge window fixes that came in this week, two i915 display fixes
and a bunch of misc amdgpu, along with a radeon regression fix.

Regards,
Dave.


drm-next-2022-01-21:
drm fixes for 5.17-rc1

amdgpu:
- SR-IOV fix
- VCN harvest fix
- Suspend/resume fixes
- Tahiti fix
- Enable GPU recovery on yellow carp

radeon:
- Fix error handling regression in radeon_driver_open_kms

i915:
- Update EHL display voltage swing table
- Fix programming the ADL-P display TC voltage swing
The following changes since commit 4efdddbce7c1329f00c458e85dcaf105aebdc0ed=
:

  Merge tag 'amd-drm-next-5.17-2022-01-12' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-01-14
15:42:28 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-01-21

for you to fetch changes up to ccf34586758cf00c0934e48f6ef6d688f01d7b19:

  Merge tag 'amd-drm-fixes-5.17-2022-01-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-01-21
08:37:56 +1000)

----------------------------------------------------------------
drm fixes for 5.17-rc1

amdgpu:
- SR-IOV fix
- VCN harvest fix
- Suspend/resume fixes
- Tahiti fix
- Enable GPU recovery on yellow carp

radeon:
- Fix error handling regression in radeon_driver_open_kms

i915:
- Update EHL display voltage swing table
- Fix programming the ADL-P display TC voltage swing

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: invert the logic in amdgpu_device_should_recover_gpu()
      drm/amdgpu: don't do resets on APUs which don't support it
      drm/amdgpu: drop flags check for CHIP_IP_DISCOVERY

CHANDAN VURDIGERE NATARAJ (1):
      drm/amdgpu: Enable recovery on yellow carp

Christian K=C3=B6nig (1):
      drm/radeon: fix error handling in radeon_driver_open_kms

Dave Airlie (2):
      Merge tag 'drm-intel-next-fixes-2022-01-20' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-fixes-5.17-2022-01-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Guchun Chen (1):
      drm/amdgpu: apply vcn harvest quirk

Jingwen Chen (1):
      drm/amd/amdgpu: fixing read wrong pf2vf data in SRIOV

Jos=C3=A9 Roberto de Souza (2):
      drm/i915/display/ehl: Update voltage swing table
      drm/i915/display/adlp: Implement new step in the TC voltage
swing prog sequence

Lukas Fink (1):
      drm/amdgpu: Fix rejecting Tahiti GPUs

Mario Limonciello (1):
      drm/amd/display: Revert W/A for hard hangs on DCN20/DCN21

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 45 +++++++++---------=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 32 ++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  5 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           | 20 ++++------
 drivers/gpu/drm/amd/amdgpu/cik.c                   |  4 ++
 drivers/gpu/drm/amd/amdgpu/vi.c                    |  4 ++
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   | 11 +-----
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  | 11 +-----
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   | 25 ------------
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.h   |  2 -
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   | 25 ------------
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.h   |  2 -
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |  2 +-
 drivers/gpu/drm/amd/display/dc/irq/irq_service.h   |  4 --
 drivers/gpu/drm/i915/display/intel_ddi.c           | 22 +++++++++++
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c | 10 ++---
 drivers/gpu/drm/i915/i915_reg.h                    |  8 +++-
 drivers/gpu/drm/radeon/radeon_kms.c                | 22 ++++++-----
 18 files changed, 108 insertions(+), 146 deletions(-)

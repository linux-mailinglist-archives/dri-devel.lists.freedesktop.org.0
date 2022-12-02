Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8163FDCC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 02:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7385010E6A2;
	Fri,  2 Dec 2022 01:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D01610E6A3
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 01:44:56 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id e15so3394962qts.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 17:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4bLTeJ6YrAnPFThGmSk8KJr4jyMAp7UgMPl4HksAp44=;
 b=aYnKhSCrjGtm4vsnysotoMASKnP3QdutT10q95EHppyvQSaq+DReRl5xi3hLy8/BhZ
 rtgSvW4+3qLgaDKOKDzuUNLjCAAcxbIno2CMQqCHj7lOHHwp0cus7lB3/XjLNsKwieIK
 XkVO85CkwFx+bOAPmUjNBTzjtOfY1+t3ZLy+ujcXOaIKoqfvIZTbL+dIcZAoA+qVcbUI
 70B1MKIjbkLSsROBp1SBUCPXupuCCMx0TOHUzvKTMLfjBQDrCR0Qk9OkdAP2UTWJswU3
 EWBRoo8GV8xra9RLb9YtgwXY/sF4I4DYChHlYweI7Eb0QBRbtHi7m/OQVNQ0mQbJdGgn
 GBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4bLTeJ6YrAnPFThGmSk8KJr4jyMAp7UgMPl4HksAp44=;
 b=eaFjSC8uzue7B0//HKX3dCmpOgNMSFgIhT+erPMWEFNHfxsyxcQSn6cQcATF7kc+do
 O3A5rjswpcixLa8tifKmtdTRulzcvt4kGdKWp1KF7v48A/FE+RQcBQkx/rvt17O8h1wC
 RNhtF8TsLqENFRIBMt5Gt1rVYYK+oblQwcaNd0Hk5kXP0dr8Az0rkYovwQOy/okHSbT3
 8AsIgeat0P1yD6HFY1BPAMgX7YxK4e3T/52oY6HcGRDYDeq4D056YBk9jJmm9uL7MgOD
 Su3ZPA466oh56HIOy3ovYsWkqjxT/ut21NsJC6tWGpGOPCbVwxyNBYCAylThLSpyG6Ud
 WESg==
X-Gm-Message-State: ANoB5pmGMByNTjtYg7eweJttYviuViX86S/bK6cMCl+iQ1DivqaQY5Ky
 +wxoeBW1YXcbREcfLrOZIY9hk+25pG7PND24gZA=
X-Google-Smtp-Source: AA0mqf7/5LFh9irixKD6uvk05eIdlWzoStuesK1CKS2LvZB029c9+SxpcPE39deP4kMGA+0L0RS0akdEqi50xaJdd7g=
X-Received: by 2002:ae9:d846:0:b0:6ec:5332:6ebd with SMTP id
 u67-20020ae9d846000000b006ec53326ebdmr62506616qkf.0.1669945495063; Thu, 01
 Dec 2022 17:44:55 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 2 Dec 2022 11:44:43 +1000
Message-ID: <CAPM=9tzKpUGHMEw3aN43b+P3+WwAtZGia190JktnB163TvVjCw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.1-rc8
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

Things do seem to have finally settled down, just 4 i915 and one
amdgpu this week. Probably won't have much for next week if you do
push rc8 out.

Dave.

drm-fixes-2022-12-02:
drm fixes for 6.1-rc8

i915:
- Fix dram info readout
- Remove non-existent pipes from bigjoiner pipe mask
- Fix negative value passed as remaining time
- Never return 0 if not all requests retired

amdgpu:
- VCN fix for vangogh
The following changes since commit b7b275e60bcd5f89771e865a8239325f86d9927d=
:

  Linux 6.1-rc7 (2022-11-27 13:31:48 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-12-02

for you to fetch changes up to c082fbd687ad70a92e0a8be486a7555a66f03079:

  Merge tag 'amd-drm-fixes-6.1-2022-12-01' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2022-12-02
09:12:46 +1000)

----------------------------------------------------------------
drm fixes for 6.1-rc8

i915:
- Fix dram info readout
- Remove non-existent pipes from bigjoiner pipe mask
- Fix negative value passed as remaining time
- Never return 0 if not all requests retired

amdgpu:
- VCN fix for vangogh

----------------------------------------------------------------
Dave Airlie (2):
      Merge tag 'drm-intel-fixes-2022-12-01' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.1-2022-12-01' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Janusz Krzysztofik (2):
      drm/i915: Fix negative value passed as remaining time
      drm/i915: Never return 0 if not all requests retired

Leo Liu (1):
      drm/amdgpu: enable Vangogh VCN indirect sram mode

Radhakrishna Sripada (1):
      drm/i915/mtl: Fix dram info readout

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Remove non-existent pipes from bigjoiner pipe mask

 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c      |  3 +++
 drivers/gpu/drm/i915/display/intel_display.c | 10 +++++++---
 drivers/gpu/drm/i915/gt/intel_gt.c           |  9 +++++++--
 drivers/gpu/drm/i915/gt/intel_gt_requests.c  |  2 +-
 drivers/gpu/drm/i915/intel_dram.c            |  3 +--
 5 files changed, 19 insertions(+), 8 deletions(-)

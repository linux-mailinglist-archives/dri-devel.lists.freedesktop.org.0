Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7AA50AE43
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 04:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5310110FBEC;
	Fri, 22 Apr 2022 02:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF1410FBEC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 02:56:31 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id el3so4006995edb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 19:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=I6Rk2jsbXOAIxG1A5lmiEupjlgITDVei+c3ecVf7c6I=;
 b=mfV9T4S5I5l4rgMoG1OpPRftD54XDgGTf9QNYQEiUbUTkDY2te8HSfF6N8cSqtsf+r
 TDzwAkkKyJtPg35vRjz096lcBqDWCJ8gW5hdtx+mbeIQjJSH+zpI+7eNyKwH1MTsF3hq
 MpgSYNHwL7XRGTngrV3cCq6nbX16lzyztdaeN3W+oMpr31v2UugssKeQNa9AVY1Jsb1G
 1p6nTKqlWZBaFxJEgfxANEqh+FayQkhY/Rx83SoEQWnJ/UkUGp9MncVz3QTfVab5p+fJ
 0dIaIWY0TZw9UiLC0yTP0+WMJbR13dbWZteU0qqEqod1n2CMKiyYxxSnrwliEzixdJf+
 tP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=I6Rk2jsbXOAIxG1A5lmiEupjlgITDVei+c3ecVf7c6I=;
 b=i0qi56qlZ1X6EVkCUgyEX++DJv4LGb8/aein/d7YzT1y6Iquuiej/XtB45Ulgxy9/Y
 m79RL30Z9K8N0Tx7cqbAlQHG8UjNyTtqc2b9p88l378HO3aUHvB2lxnjPAN1X4YrzxhL
 T9NJUEMFmvJByxQoF5TmXugOcTj/8i2KSaILIAx9Mnt95FtVFSW7pBOldHZTZ5yYsHiA
 nYEWY4ZbXaa7MnhiladyPiKUynsH1oDymzxSfjkXYcXYBgk/w6jLEXhuDYZf2GDfzXcT
 9KZP3Q8WZemEVD1sDNN1mSZGhGfuSsglAPAu69buLQ0MgWQqjZJCpOmVBruKLGHWCN7+
 OUqw==
X-Gm-Message-State: AOAM533JtFIbJGAm1CXBcuCcEk1dvaDvUWD1wpBWtv88NiyBlemD1sKQ
 Z/g+0nuoOfwy7wxQMrTQ+rog9Oe4Kxr6udUWzgo=
X-Google-Smtp-Source: ABdhPJz8Bnz3N7vJ3BCNH4L2dNjA5ebD4y5+mbWIZJ04x6ANdJyIesUHyouSxmjOWo9H7LFKWPhHZh4uQzF8O9xzK2E=
X-Received: by 2002:a05:6402:1cc1:b0:413:2cfb:b6ca with SMTP id
 ds1-20020a0564021cc100b004132cfbb6camr2546390edb.265.1650596189459; Thu, 21
 Apr 2022 19:56:29 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 22 Apr 2022 12:56:18 +1000
Message-ID: <CAPM=9tzQpOnBBNNYWDaJRBztOCVM-PmprHHWZnr2yLh2rb2Y8g@mail.gmail.com>
Subject: [git pull] drm fixes for 5.18-rc4
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Extra quiet after Easter, only have minor i915 and msm pulls. However
I haven't seen a PR from our misc tree in a little while, I've cc'ed
all the suspects. Once that unblocks I expect a bit larger bunch of
patches to arrive.

Otherwise as I said, one msm revert and two i915 fixes.

Regards,
Dave.

drm-fixes-2022-04-22:
drm-fixes for 5.18-rc4

msm:
- revert iommu change that broke some platforms.

i915:
- Unset enable_psr2_sel_fetch if PSR2 detection fails
- Fix to detect when VRR is turned off from panel settings
The following changes since commit b2d229d4ddb17db541098b83524d901257e93845=
:

  Linux 5.18-rc3 (2022-04-17 13:57:31 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-04-22

for you to fetch changes up to 70da382e1c5b9b2049c10abfd4489a40c1b60df0:

  Merge tag 'drm-msm-fixes-2022-04-20' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes (2022-04-22
09:25:47 +1000)

----------------------------------------------------------------
drm-fixes for 5.18-rc4

msm:
- revert iommu change that broke some platforms.

i915:
- Unset enable_psr2_sel_fetch if PSR2 detection fails
- Fix to detect when VRR is turned off from panel settings

----------------------------------------------------------------
Dave Airlie (2):
      Merge tag 'drm-intel-fixes-2022-04-20' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'drm-msm-fixes-2022-04-20' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes

Dmitry Baryshkov (1):
      drm/msm: Revert "drm/msm: Stop using iommu_present()"

Jos=C3=A9 Roberto de Souza (1):
      drm/i915/display/psr: Unset enable_psr2_sel_fetch if other
checks in intel_psr2_config_valid() fails

Manasi Navare (1):
      drm/i915/display/vrr: Reset VRR capable property on a long hpd

 drivers/gpu/drm/i915/display/intel_dp.c  | 17 +++++++++-----
 drivers/gpu/drm/i915/display/intel_psr.c | 38 ++++++++++++++++++----------=
----
 drivers/gpu/drm/msm/msm_drv.c            |  2 +-
 3 files changed, 33 insertions(+), 24 deletions(-)

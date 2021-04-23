Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 850F4368BB4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 05:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25F56EB34;
	Fri, 23 Apr 2021 03:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8C86EB34
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 03:52:41 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id s15so55943793edd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 20:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=AsQS2+WKWTfo1Jt7nW4OhF01pRbwMoQdzfJIXlY/3JE=;
 b=aEUrJRPr2CPm0gyMjMpJzsHaKhYyHhYeb/Cswp/opvqq+XH72jpl3dHSAP/SmCh9Qv
 CemRSb/oq0FwHDAcUoqY2GTOmwCE2geQNbwCHy8Wdn16Hv2gx2IvsVjkYuGMUhoVxidS
 p3uS9NsJMYShQLCnNQ+Koo2ZC7xgR0bJjRali0A6lft0xV/rZxDxIMorMO7uFBz4tsEm
 Th6GIeUxa9DgyB2XxpXOabM9VBUWvGkjlGVCRukWAVXEY7KLyAYGtn+al5srkJQ0EQhc
 W0QR2dYmzNF44+D8+6Yjm1uvy3Kn02Vw3fuXqEGTrFXozFYIZPOJQ2akf6tZ3wP4GaLu
 Y58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=AsQS2+WKWTfo1Jt7nW4OhF01pRbwMoQdzfJIXlY/3JE=;
 b=rDdWw52h+LNeqMrT92Ru4Jt1ikUsb6BYP/Invaxas9waRTN7QuK/OaSuQn3/5qdStG
 b9pgzjf5W3Ad8t0G8FLBTMq6mWuIQi4noBaFb/N3GE9DE9bIY+uLXJs40YTkvy8zBrYy
 6vzjKQMUt6Mcyfmnm9S+XaD8t81dVlI5Hw6M4O3g+KU0sJPYNcm6u3rbYj5TQ8aqYUGk
 qvCd78Y9w3L102s08Tr9xQ8Jv1KYgLzMucPQwCKARnYgCfHUDFwIwDIv14zj8DQu+9Su
 J7BSica6PTqkAMSl/WsQqISFIaVg2isviQz6N4+D8NlYw+xmJNr+HdLSaKm2Dl/4X9pH
 BhzQ==
X-Gm-Message-State: AOAM53165Yqm6tTMQtU7LLMtu8YR8RXlHTvSd+0YOQ1b5wwrAw4eI11C
 bzUOenW5Dqu2beJnaowwlbDMznFMAXALdfiCggI=
X-Google-Smtp-Source: ABdhPJyS3WSdMIZNgtRyHDciXIkP+vYLJyfArCej6T4gFVnL9UyqYnz3fiSbyNB1bw4RQthfqVa90ovzzv16Vv4BCvg=
X-Received: by 2002:a05:6402:5113:: with SMTP id
 m19mr2037305edd.78.1619149960146; 
 Thu, 22 Apr 2021 20:52:40 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 23 Apr 2021 13:52:29 +1000
Message-ID: <CAPM=9tyKdGHyiRLDooKrMf=02GtNn8U4YfF4dJtXdabnVAGdXQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.12 final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Just some small i915 and amdgpu fixes this week, Should be all until
you open the merge window.

Regards,
Dave.

drm-fixes-2021-04-23:
drm fixes for 5.12 final

amdgpu:
- Fix gpuvm page table update issue
- Modifier fixes
- Register fix for dimgrey cavefish

i915:
- GVT's BDW regression fix for cmd parser
- Fix modesetting in case of unexpected AUX timeouts
The following changes since commit bf05bf16c76bb44ab5156223e1e58e26dfe30a88:

  Linux 5.12-rc8 (2021-04-18 14:45:32 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-04-23

for you to fetch changes up to aca38735ae624b93c71c055b68d5802b8f356ea5:

  Merge tag 'drm-intel-fixes-2021-04-22' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2021-04-23
12:18:21 +1000)

----------------------------------------------------------------
drm fixes for 5.12 final

amdgpu:
- Fix gpuvm page table update issue
- Modifier fixes
- Register fix for dimgrey cavefish

i915:
- GVT's BDW regression fix for cmd parser
- Fix modesetting in case of unexpected AUX timeouts

----------------------------------------------------------------
Dave Airlie (2):
      Merge tag 'amd-drm-fixes-5.12-2021-04-21' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2021-04-22' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Imre Deak (1):
      drm/i915: Fix modesetting in case of unexpected AUX timeouts

Jiansong Chen (1):
      drm/amdgpu: fix GCR_GENERAL_CNTL offset for dimgrey_cavefish

Philip Yang (1):
      drm/amdgpu: reserve fence slot to update page table

Qingqing Zhuo (1):
      drm/amd/display: Update modifier list for gfx10_3

Rodrigo Vivi (1):
      Merge tag 'gvt-fixes-2021-04-20' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Simon Ser (1):
      amd/display: allow non-linear multi-planar formats

Zhenyu Wang (1):
      drm/i915/gvt: Fix BDW command parser regression

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c                | 10 ++++++++--
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c                |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c     | 15 ++++++---------
 drivers/gpu/drm/i915/display/intel_dp_link_training.c |  3 ++-
 drivers/gpu/drm/i915/gvt/cmd_parser.c                 | 19 +++++++++++++------
 5 files changed, 30 insertions(+), 19 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

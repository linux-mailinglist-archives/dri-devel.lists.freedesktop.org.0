Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A09260AD9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 08:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4826E3FB;
	Tue,  8 Sep 2020 06:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B346E3FB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 06:22:37 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id r7so7468686ejs.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 23:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=8xZk5h8orsIZMMLdKGKwgCSU5Ncg3lkxXCBEPDaDCpA=;
 b=AOJ9YbOknHhYRe8Qlv1bDfj1mKnIEK3rjnrnnokpWXh3KVgYDd+Eddod0BzcNJsYgP
 uASMP1/hfpnaJaFtycqgMR6s3rFkAKrnxthyVtz22nRC9aPQV3nQCVDkdTHqXhI7WbQS
 yyfhS7Q12z0lS3hmlbojvTVU+kYcCTH24k3U5FeqdIcg4YEvuvjhLaR+zSweBl00OieL
 B9b/sS5dk+2ac3CP0JslmRg4ZeYFu3KC3thBWi0MInZWSk+UbVr5cVujq10i+/cMkNQI
 PwBdO4NM4VHGBazZsSNersHcb1v4XMTPtub82DWnSETQwSSmQN5bUhb16e3/VPUJ6GCr
 nzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=8xZk5h8orsIZMMLdKGKwgCSU5Ncg3lkxXCBEPDaDCpA=;
 b=GnAWK8PfboNnQBbWGVrvgaoRKCdaNNfP8cSrm+cji6Lt8kBls6tuBhGaHcupWUkvYc
 b8oi75VOOwosgPbF89hN0ICsCplF4RYOX6lWQi6nJW64COAVXI4TxqKMRl6y4NI31i3V
 PNSea0a1Nt7YpvUn3ck5MUpEWKKVVpp+KzCWl8gMOrnRuVuXvoRKk6ADgDvCVTN9nHS+
 odxiCQDvp8/jPWb6/AVx+HsxRuVla+jQKykLOlwvWfE8YKMlKaE8WPoF+pV2kUfX9PP2
 w3vysMxeSitNJdKu34LtCSNTE5LPzBhgwjBOqMlqdJFMhGPVbHmVL0niFVPKw9IaYDHg
 fUIA==
X-Gm-Message-State: AOAM530IWpWmhysGLkKmz/gDZOyP7gt7Ai+7uoA/JxZoTbIND+4NTDjj
 RUcK9rA24OEgYuQtTNCrqF0KqslKshUrL8q2yPg=
X-Google-Smtp-Source: ABdhPJwSL+vwLLfI3ZQQLK3zjTUolN5DDIkPKvkkXftjIBRkq5bCkLoAP+3zJkb8G1WgKjf88kBfXa1kB8JTYrNl8cg=
X-Received: by 2002:a17:906:fb8c:: with SMTP id
 lr12mr25668509ejb.9.1599546156100; 
 Mon, 07 Sep 2020 23:22:36 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 8 Sep 2020 16:22:25 +1000
Message-ID: <CAPM=9tw2tebfrjMEiB5fUy8USZrjq4b_siciDecFfMu8H794gA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.9-rc5 (special edition)
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

The i915 reverts are going to be a bit of a conflict mess for next, so
I decided to dequeue them now, along with some msm fixes for a ring
corruption issue, that Rob sent over the weekend.

Dave.

drm-fixes-2020-09-08:
drm fixes for 5.9-rc5 (special edition)

i915:
- revert gpu relocation changes due to regression

msm:
- fixes for RPTR corruption issue
The following changes since commit f4d51dffc6c01a9e94650d95ce0104964f8ae822:

  Linux 5.9-rc4 (2020-09-06 17:11:40 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-09-08

for you to fetch changes up to 20561da3a2e1e0e827ef5510cb0f74bcfd377e41:

  Revert "drm/i915/gem: Delete unused code" (2020-09-08 15:45:27 +1000)

----------------------------------------------------------------
drm fixes for 5.9-rc5 (special edition)

i915:
- revert gpu relocation changes due to regression

msm:
- fixes for RPTR corruption issue

----------------------------------------------------------------
Dave Airlie (4):
      Merge tag 'drm-msm-fixes-2020-09-04' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Revert "drm/i915: Remove i915_gem_object_get_dirty_page()"
      Revert "drm/i915/gem: Async GPU relocations only"
      Revert "drm/i915/gem: Delete unused code"

Jordan Crouse (4):
      drm/msm: Split the a5xx preemption record
      drm/msm: Enable expanded apriv support for a650
      drm/msm: Disable preemption on all 5xx targets
      drm/msm: Disable the RPTR shadow

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 314 +++++++++++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |  14 +
 .../drm/i915/gem/selftests/i915_gem_execbuffer.c   |  21 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   5 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |  10 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |  10 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  14 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |  25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  13 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  27 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  11 +
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   4 +-
 15 files changed, 411 insertions(+), 64 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

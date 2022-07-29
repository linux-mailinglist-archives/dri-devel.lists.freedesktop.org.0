Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64D6584A32
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 05:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDD910E47A;
	Fri, 29 Jul 2022 03:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE9A10E4F5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 03:31:16 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ez10so6261253ejc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 20:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=pJ4ZUNG6LxmawDqEhLdtSFr1ngQQv8SUwuZZJONKqlk=;
 b=a3RvweEzgjIpWRMXKG/5emZwl5y7xuQha54CpE3QKGBJjg9mdwZIwIIwRm+D+qdKxH
 5v5bU7EAiBeG8iRUUmi0qalXbma8j5z9AldHGGVrgcsa4vTWOcACG5fRUwUpy6Pc3FOS
 uGGyxEFovHOxzpBn2keHGzI7MbXGBD04e35e4O2QoMTCU//RIYihivc89s/05z6c7che
 38Gkol416Ub6BspeO4GOL4O8jlCuoeeXhq/ItQ79zAh4SBPRUhlHYjLXXa5xXLYps/Xa
 77lWkCp7dsOOFwfKYQhEmlm75qMGalH+Rqvf194+ltCrsBF0eQd9l6KQ0G4Ra+JBPtKq
 TDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=pJ4ZUNG6LxmawDqEhLdtSFr1ngQQv8SUwuZZJONKqlk=;
 b=pD66kxUZIDMwM34QmqELQK/p9rcMt/MUwAl0ofD2KDnFLzM9RwmKC3g1IBxmi9uB3N
 3xpVjQNtsJpYr3EzF/pIt3dG+Q/APPd6OIsAudPmw6rVBz/4ZtzBE9g+A8P4ir42zAnj
 oc57dvR9fPLVw5TjGNmtEzzfWfo9y4IGQoQKCh6V/UVDCj1ukhBQESjsIH+guaD+K25N
 kuA25U17YqCAX52Qv+vG6YmnbNd8vWzTK7rguMrx18t3jc96+tJEAdvjx2vPw5RVRclG
 O7RHH2oXxa0hwhWJOLSo9I8zwGZju4Qkp/O2SDRaXGpjIGXfnnR6MnXGZd4X2fnqkM+r
 HPZA==
X-Gm-Message-State: AJIora9NiCtNtN6/aQWwVatHAhkLSYLXXCFwh0KgqPzgpMybR9uCOIcA
 wRnL8RNp4WQu4Mx+n3fLZNnxtyb2xDQ3qrN16VSd10LRgTo=
X-Google-Smtp-Source: AGRyM1u1wBoESmd8bswYQncgE9pmBLhDJETi3dXUVLdy6xWjU+oeob04bHDcARbgnSkosnR8Ud/APH0SBGAfnk7xQ2Q=
X-Received: by 2002:a17:907:7f9f:b0:72f:11fc:86bc with SMTP id
 qk31-20020a1709077f9f00b0072f11fc86bcmr1312411ejc.770.1659065474730; Thu, 28
 Jul 2022 20:31:14 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 29 Jul 2022 13:31:03 +1000
Message-ID: <CAPM=9txsRyEJWjrTsha6wkqcdTM5MmTqRVns5b9eQCaQAwJpNg@mail.gmail.com>
Subject: [git pull] drm fixes for 5.19 final
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

Quiet extra week, just a single fix for i915 workaround with execlist backend.

Regards,
Dave.

drm-fixes-2022-07-29:
drm fixes for 5.19 final

i915:
- Further reset robustness improvements for execlists [Wa_22011802037]
The following changes since commit e0dccc3b76fb35bb257b4118367a883073d7390e:

  Linux 5.19-rc8 (2022-07-24 13:26:27 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-07-29

for you to fetch changes up to f16a2f593d0095e82e6b7f9d776f869c8ab45952:

  Merge tag 'drm-intel-fixes-2022-07-28-1' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-07-29
11:39:13 +1000)

----------------------------------------------------------------
drm fixes for 5.19 final

i915:
- Further reset robustness improvements for execlists [Wa_22011802037]

----------------------------------------------------------------
Dave Airlie (1):
      Merge tag 'drm-intel-fixes-2022-07-28-1' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Umesh Nerlige Ramappa (1):
      drm/i915/reset: Add additional steps for Wa_22011802037 for
execlist backend

 drivers/gpu/drm/i915/gt/intel_engine.h             |  2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          | 88 +++++++++++++++++++++-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  7 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 81 ++------------------
 5 files changed, 103 insertions(+), 79 deletions(-)

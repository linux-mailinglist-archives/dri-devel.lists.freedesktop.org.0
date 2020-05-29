Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F961E72A4
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 04:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A606E094;
	Fri, 29 May 2020 02:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437816E094
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 02:38:04 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id z5so548815ejb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 19:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LRWL3md3cdfmyEEJJW9b1YfTGvsPpjYM45xVODC6cfc=;
 b=PWbxRWqfCKXeJr+EPrN+hJitAczR2rWP+QP2s/cIcVNKpQy7BtLNt0pCGIjwGby667
 4RdLLFRuWU3RU7CNx40+MaNrKjI8fZWt3LJQK/IhGvKimWhThZe2EGUqwenVIB2sxdV1
 FU3nUXh5J/+sJ+OjyR7yiIeJ0S2ahL7kI/YSPK0NXPx4787GGrIlKsWY3quqZtTlrMps
 1nZrFpq/ER6cFFgJzWZ3L6HzFajogsYMCeDeeEfIzMrBTgD/0WamHS786L/zqHhim8lq
 H8kwxnRzBjGeJy7VCsT3BoLtlq3S5b/v151SW8CLSn+NS1P9a90ENkKOHLtZxXplDgDE
 Ffpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LRWL3md3cdfmyEEJJW9b1YfTGvsPpjYM45xVODC6cfc=;
 b=ASbpFZ4e9Hh+HS+2DsL2xTMoJCysNqofMP8Z+dKsAckGDoz5DCzJgXTNSjN+BvT2J+
 q69zQXvXIEVaLHctPwhNcNzwrytNU9jVsiYtj+faENp65cTxVhbsRMLT6/BwMSuZF+pZ
 Wg+ZMsNZeFQkhzzpNXi3asDuKtY0SrfcqvKwhwiIcqtgYFGCtJ1ooMdEmczqFoxJO99+
 jnnDLNZWmRwi/OhjK5DKOEkKJbEC7H18n3HjKrbsHd4lZ13y9DCP+qc5Lu1Krrj+iqIe
 vr7XMwTp/FTTcWAuKrpTbTtfouFuortYm7JnvdttieYNkUtnePhjFQjsVtMgw86J5u2c
 AZkQ==
X-Gm-Message-State: AOAM530c0/mgWhMAG2Xaid1vZyw7T6E29Ff985RyUXPL0xxXrapGVjyw
 JeL/CKdCoeTGd2D400wEbEUGA/N+DNII4+Bkxb0=
X-Google-Smtp-Source: ABdhPJwuQwT+mh59AfvI9h748+ECizDXZ6gIe+r811X0N6LfgmL4jbXZrAOk/o8tGqll+chuI/++ePZj/hfmwWJqnTQ=
X-Received: by 2002:a17:906:f115:: with SMTP id
 gv21mr104958ejb.340.1590719882776; 
 Thu, 28 May 2020 19:38:02 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 29 May 2020 12:37:51 +1000
Message-ID: <CAPM=9tznwDT9GEhbAHD1dkUVY_OF5bQNzxX7sBjXPkSH6VFjcw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.7 final (apologies release)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

Apologies for previous PR, I did build it locally, I just don't build
EXPERT kernels, I expect if I ever get a new builder I should add a
few more configs to my list.

I've just dropped the i915 PR from this completely, I'm sure when they
wake up they'll be able to tell us what we are missing due to mistakes
made.

Dave.

drm-fixes-2020-05-29-1:
drm fixes for 5.7 final

amdgpu:
- display atomic test fix
- Fix soft hang in display vupdate code

ingenic:
- fix pointer cast
- fix crtc atomic check callback
The following changes since commit 9cb1fd0efd195590b828b9b865421ad345a4a145:

  Linux 5.7-rc7 (2020-05-24 15:32:54 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-05-29-1

for you to fetch changes up to ed9244bd0b265c4c0866a9246c6e7cca1cca3acf:

  Merge tag 'drm-misc-fixes-2020-05-28' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-05-29
12:11:11 +1000)

----------------------------------------------------------------
drm fixes for 5.7 final

amdgpu:
- display atomic test fix
- Fix soft hang in display vupdate code

ingenic:
- fix pointer cast
- fix crtc atomic check callback

----------------------------------------------------------------
Aric Cyr (1):
      drm/amd/display: Fix potential integer wraparound resulting in a hang

Dave Airlie (2):
      Merge tag 'amd-drm-fixes-5.7-2020-05-27' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2020-05-28' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Paul Cercueil (2):
      gpu/drm: ingenic: Fix bogus crtc_atomic_check callback
      gpu/drm: Ingenic: Fix opaque pointer casted to wrong type

Simon Ser (1):
      drm/amd/display: drop cursor position check in atomic test

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 7 -------
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 2 ++
 drivers/gpu/drm/ingenic/ingenic-drm.c                     | 6 +++---
 3 files changed, 5 insertions(+), 10 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

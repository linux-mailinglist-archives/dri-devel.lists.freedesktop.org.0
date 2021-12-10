Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E9D46F9D9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 05:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07E810E270;
	Fri, 10 Dec 2021 04:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6DF10E279
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 04:29:06 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id w1so25911185edc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 20:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=7+XHAAFmJnNl1N/GcfKeTFDv+qRmpgDkY8DdxjU6bmQ=;
 b=RxoDd64XcVniZSqcVST6h7cqygZDN5yBunUjq80zbK7DNNZaGzapKz5d7mVDCk9Pp1
 ne3H8PQs01rUiqOkGcJADEy+hTeLNuQlSxSp6AxKQmDhxwohfnkUfLe3UauCFq5chb7d
 Oz2Z1VzU3ZS1KfORPkC1fCcMKUIHfZzQrotFe5TsmyQN2vMGf3KPls7rt+mUy7tvLbQw
 Fm/uUK1A3+hKCPUD3xU+mouj38Cz9W4AErybkY8Rsgr2AZStiY6iKjIyv4MUIPE1uLd8
 yrfgcUl2gtIwyuz0Qc5ydPUtJWorZeiFWLv59n6rDiMrNo1c7HEdHdngQ+7M8HdMTsRy
 pxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=7+XHAAFmJnNl1N/GcfKeTFDv+qRmpgDkY8DdxjU6bmQ=;
 b=xFsTVDgQyV8QQDeyurG8YQgqyGEEbYK/0bfc4TU0/dJWATq/JSMWap9kAzmXvIHtko
 jUoBFl9WgmhACZ19gkt9bYsjp++BSRoEnn1xzNA9XnFUvCI7TCWrvxRnSCZPOOtqnqLL
 HUD49roPsiApCcWkQ3iJgHaHkqmiMKgX3qp59B3Y+XNbmR+BVr6IugejN/1czYcoHzMl
 hXng6cD2v2CQOnimc+r83EP6MUJ0Qw2/q70rl3b5WyjI2AgRLNB/s3nA75zjOg66ei3L
 WEszipBEBYj1MdZ/ingH0fSgrTG99OTQwRqXX7nYPQik+MqAlLU2+snETTRIIu8S3y6k
 X4Dg==
X-Gm-Message-State: AOAM533LMNQdvRhTcWkfhcAxjJ4wxe7lEoMttaxbISgefIPFjTA7GLDV
 8Whym2Q/ZSkgX3ZiZjMMr2Lpt65tuP6Z+cPjBrk=
X-Google-Smtp-Source: ABdhPJy0OB5y1/KcoN9bnIp2xLAcsnL9ImmLkuy1mY/2SKgheN6NQi1j5pUXtlJ8hsXauOLRuANG4miFvINfVhAX68g=
X-Received: by 2002:a17:906:5d09:: with SMTP id
 g9mr21621955ejt.3.1639110544364; 
 Thu, 09 Dec 2021 20:29:04 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 10 Dec 2021 14:28:53 +1000
Message-ID: <CAPM=9twm_TjmNrr7VELofghf58qpo=-1VmFf_pNr6tBNKZL-aw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.16-rc5
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

Regular fixes, pretty small overall, couple of core fixes, two i915
and two amdgpu, hopefully it stays this quiet.

Regards,
Dave.

drm-fixes-2021-12-10:
drm fixes for 5.16-rc5

ttm:
- fix ttm_bo_swapout

syncobj:
- fix fence find bug with signalled fences

i915:
- fix error pointer deref in gem execbuffer
- fix for GT init with GuC/HuC on ICL

amdgpu:
- DPIA fix
- eDP fix
The following changes since commit 0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1=
:

  Linux 5.16-rc4 (2021-12-05 14:08:22 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-12-10

for you to fetch changes up to 675a095789a2663fe02fdebd6023e29d7f1f51ac:

  Merge tag 'amd-drm-fixes-5.16-2021-12-08' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-12-10
14:10:55 +1000)

----------------------------------------------------------------
drm fixes for 5.16-rc5

ttm:
- fix ttm_bo_swapout

syncobj:
- fix fence find bug with signalled fences

i915:
- fix error pointer deref in gem execbuffer
- fix for GT init with GuC/HuC on ICL

amdgpu:
- DPIA fix
- eDP fix

----------------------------------------------------------------
Bas Nieuwenhuizen (1):
      drm/syncobj: Deal with signalled fences in drm_syncobj_find_fence.

Christian K=C3=B6nig (1):
      drm/ttm: fix ttm_bo_swapout

Dan Carpenter (1):
      drm/i915: Fix error pointer dereference in i915_gem_do_execbuffer()

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2021-12-09' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2021-12-09' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.16-2021-12-08' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Mikita Lipski (1):
      drm/amd/display: prevent reading unitialized links

Nicholas Kazlauskas (1):
      drm/amd/display: Fix DPIA outbox timeout after S3/S4/reset

Raviteja Goud Talla (1):
      drm/i915/gen11: Moving WAs to icl_gt_workarounds_init()

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  7 ++++++-
 drivers/gpu/drm/amd/display/dc/dc_link.h          |  2 ++
 drivers/gpu/drm/drm_syncobj.c                     | 11 ++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c    |  1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c       | 18 +++++++++---------
 drivers/gpu/drm/ttm/ttm_bo.c                      |  3 ++-
 6 files changed, 30 insertions(+), 12 deletions(-)

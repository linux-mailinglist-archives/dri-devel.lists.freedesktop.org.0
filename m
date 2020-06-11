Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40EA1F60AB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 05:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6809489D60;
	Thu, 11 Jun 2020 03:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67DC89D60
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 03:56:35 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id f7so4975082ejq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 20:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vEkq8ztedt+qfPg8J7ZSmeiXnGr0VHQIJP0F6NBBlcg=;
 b=Svm7yczh4MLDGZXcAkI3ze0+uHZ8wJC+e9Xq5lwmoHGwNgLp35zut5dCXqOGMb7D+f
 ars6OeG4HfAEJLRoSeToSy30iVhqHszTHo/gdItawlKTu2yNCqZslZuoSZqCoEosXjo8
 pQgPZIUPTxv2AkVeBvWMIu/jbAVs0D/yrR7Hl051Zdjb8qCEgrUsAc/6ahy5wsvlp6jl
 dM+Bcbr99U5DvkMP2ZoxpgLwAqNg6rX4VwLqe+dV0JVJ1pcQ0cuCaJ0vxDSxp8cfRwba
 ZjMqfjdemif/x1NJ9v/WcPc0l4HhGWOpYacphBU2mXiSBIvDFt8NQI0JklOBrtGiSvJ8
 OCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vEkq8ztedt+qfPg8J7ZSmeiXnGr0VHQIJP0F6NBBlcg=;
 b=gg7QpULJgnvQM00zwYUWvR7+A9lhyDVYow/CjxTTOAZNPLirGgBAaHC6fVflYMIVME
 viA6elO3TXG5yW3qLoAJBvy7w2vNhgLZ4VuVfON++P3aovyGd2PFJo8NLDseIqeSwxxg
 Q7/IDssfo0lSRcEIXvAnwn5Zpe3iopMHgCxTS6gPNayXiVCADYBo36/ApMNGszz1HwA5
 YXAMDERJWbtk5Ch7iYMvBe7ml4OtAyOaqFiciwiW5cqSAwoi9tYEgV3OHhgpR3ouWUX/
 VrT1CSFa1UKoOfLogE6KzI00ArjsJUPUqU+pfDOPWRV1sXMfPUpPfxye0m7DEZfoDpAB
 j7nA==
X-Gm-Message-State: AOAM530sziSkgQgd2Az626cTghLs2RP/BNaKRgchlRXOszgr+TwN3QNf
 777ruLr4G7bD5z5Is060+LGlxQy+ZmFMEBVTN24=
X-Google-Smtp-Source: ABdhPJyjCBzpRLbkonfldqyBCvAO5JpRmv9SyXwSlFxVVI0GWmQiISf+9JR368yfch2UFL3aMJaqqO3Pv1WvXI1JT9M=
X-Received: by 2002:a17:906:1c8c:: with SMTP id
 g12mr6471204ejh.456.1591847794230; 
 Wed, 10 Jun 2020 20:56:34 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 11 Jun 2020 13:56:23 +1000
Message-ID: <CAPM=9tySU_oXYv+FF5D3GkkyngdxWfkb_6KDK6nA0uBx6EB=qw@mail.gmail.com>
Subject: [git pull] drm i915 fixes for rc1
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

dhowells reported an oops, and the i915 team tracked it down to a
missing fix that didn't have correct tags, they've pulled it in along
with two other fixes.

I might have some more fixes for rc1, but I might not, taking the day
off tomorrow, so probably won't be in a hurry to process anything new
unless something urgent lands.

Thanks,
Dave.

drm-next-2020-06-11:
drm i915 fixes for 5.8-rc1

i915:
- Avoid use after free in cmdparser
- Avoid NULL dereference when probing all display encoders
- Fixup to module parameter type
The following changes since commit 8d286e2ff4400d313955b4203fc640ca6fd9228b:

  Merge tag 'drm-intel-next-fixes-2020-06-04' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2020-06-08
11:59:57 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-06-11

for you to fetch changes up to addb1e23bf72c47a3e2eb7cdad6dc8cdffa91384:

  Merge tag 'drm-intel-next-fixes-2020-06-10' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2020-06-11
11:49:04 +1000)

----------------------------------------------------------------
drm i915 fixes for 5.8-rc1

i915:
- Avoid use after free in cmdparser
- Avoid NULL dereference when probing all display encoders
- Fixup to module parameter type

----------------------------------------------------------------
Chris Wilson (2):
      drm/i915/gem: Mark the buffer pool as active for the cmdparser
      drm/i915/display: Only query DP state of a DDI encoder

Dave Airlie (1):
      Merge tag 'drm-intel-next-fixes-2020-06-10' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next

Jani Nikula (1):
      drm/i915/params: fix i915.reset module param type

 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 56 ++++++++++++++++++++++----
 drivers/gpu/drm/i915/i915_params.c             |  2 +-
 3 files changed, 52 insertions(+), 9 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

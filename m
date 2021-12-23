Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A135047E941
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 23:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E52E10E315;
	Thu, 23 Dec 2021 22:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A78A10E315
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 22:15:04 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id m21so27726715edc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 14:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=oiC/rweM7PDyBEylmxgJ15XBNpKsLom+FHSsECX/FB4=;
 b=phlIUx2yCg+uIRsMEf5ybGdFUQflg6SUAa1RN24K+tMEkanM6bg08r10hzYQPS9SoH
 A6cZUmbsLKTpPlkNqUUQCTvJTV/98WgqZ9eAeObbyNbRhayX7su0tPvG6/U2a3EQpLyo
 w+7ZRAB6pPkgeUv2hB7iMnj5S7jeINOLHG7G+ea6pd3JsQuhF/2L5tdt4hzMlumkRzlq
 bHhN8LcQzVLMKyClcSw3HNHWqpepbZN+H6IuNk5ylHm6g8R43yHtGopf4MOc988SjGA1
 sR91ScetKS8WlzbKtUKzN2L3lB2DA7GyMCEqYrjMgP5jSfAiZ3ajgyQ46c4uHQAQPa/E
 dK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=oiC/rweM7PDyBEylmxgJ15XBNpKsLom+FHSsECX/FB4=;
 b=whnxqmS6eYZn/MpsYBHuHnuUfU9VZGgYBJ0IAi3IEp5T1ZnE1dWMfFNWaBMP3eYrXq
 nP2/TKE/llcxnCGkUZG6f5rNmtA2Bx5rVoFuLvI8exoAEDgyie5vzma6U5sPmBGnR64j
 f+2XYig4kNZbiLnG+d/zAtsYowAugczwwR9JU4lnuJc5WMsynfEE9RyjsPH+gsV1lNfF
 1AxDPNAu5YjYdxDCwpXrYqnCY85mWffLIxRGy3ORyTau6nHQFWQ7xIaCjYa1ONaD3dkz
 0kQT9NKB/Tpll83kQCPkJU1kQCdwyaqTe/iTOQLXoYo1PgIfoitBd3Jg/brPsDXbV6rV
 9Fbg==
X-Gm-Message-State: AOAM532KopHTqODc4q+3WK8nyr7tuAUMP9utG5bK/tb8Z8qLOpuL9OaE
 qwjtMOeChDAn4OAYo/X9OJ68JNx/4EarCDKkK5k=
X-Google-Smtp-Source: ABdhPJwvp4yqlmJJZZrkoV+Qi9rU47x16CUkFs0EbEddT8pEHWfk7HDv9u1tqB4MFkSA3CUzhWIuPNylLYGDIiYXPKA=
X-Received: by 2002:a17:906:6805:: with SMTP id
 k5mr3342104ejr.750.1640297702721; 
 Thu, 23 Dec 2021 14:15:02 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 24 Dec 2021 08:14:51 +1000
Message-ID: <CAPM=9ty=B0ZvuwiQExR2-RoCZo18DZYrKMzTfK8-00psKncw9w@mail.gmail.com>
Subject: [git pull] drm fixes for 5.16-rc7
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

Hi Linus.

Happy Xmas, pull request. Nothing major, one mediatek and a couple of
i915 locking fixes. There might be a few stragglers over next week or
so but I don't expect much before next release.

Dave.

drm-fixes-2021-12-24:
drm fixes for 5.16-rc7

mediatek:
- NULL pointer check

i915:
- guc submission locking fixes
The following changes since commit a7904a538933c525096ca2ccde1e60d0ee62c08e:

  Linux 5.16-rc6 (2021-12-19 14:14:33 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-12-24

for you to fetch changes up to dbfba788c7ef839849e013264fef551e4d119d0b:

  Merge tag 'drm-intel-fixes-2021-12-22' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2021-12-23
11:21:44 +1000)

----------------------------------------------------------------
drm fixes for 5.16-rc7

mediatek:
- NULL pointer check

i915:
- guc submission locking fixes

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      drm/mediatek: hdmi: Perform NULL pointer check for mtk_hdmi_conf

Dave Airlie (2):
      Merge tag 'mediatek-drm-fixes-5.16' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-fixes
      Merge tag 'drm-intel-fixes-2021-12-22' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Matthew Brost (2):
      drm/i915/guc: Use correct context lock when callig clr_context_registered
      drm/i915/guc: Only assign guc_id.id when stealing guc_id

 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +++---
 drivers/gpu/drm/mediatek/mtk_hdmi.c               | 12 +++++++-----
 2 files changed, 10 insertions(+), 8 deletions(-)

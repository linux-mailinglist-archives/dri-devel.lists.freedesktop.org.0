Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD278C706E
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 04:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B6610E316;
	Thu, 16 May 2024 02:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EgS6NjLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE1610E316
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 02:54:06 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-51ffff16400so344633e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 19:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715828044; x=1716432844; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Fc9idQrdbpiwMBSt6L8BxJOv1+2OpDzw7KOALEJ4jJ8=;
 b=EgS6NjLxt6BqitN0zCevQQaG/RQdVOwETq5dC6Zc2uZZ6wWhFggCEWAvcTiCWlkz+v
 8AMylQao3Zg2qzwXuW/6WG/Z2AHeB1EtL8RFFN5lV2eJHSLD/tosKm87Ks9JRrTW5J8B
 5Hxqh+9N8xUnF6gvINkecAd63pYao0bSiZRFx2Knzl/dL7oG2+f4KhS9Y93jzNmMgKsR
 Jv1Dg7SebDgFvFvOmdSNqSSeqGxuW9NHWyD/SrwrRmPxgGVGasVhYeFIroHdU7gu13XQ
 MoJKcehvIqIvFeJ1Idx2eSpv+eH9g1Jb1uTyre5zkxl/igY8AI5W9Mc91vxI279N2DK8
 lW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715828044; x=1716432844;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fc9idQrdbpiwMBSt6L8BxJOv1+2OpDzw7KOALEJ4jJ8=;
 b=HFIJjyHyuIvjCqw7ZD4IegwBnUkzt5fFkGOQeID7+bwpzsQxcbDaobPTk469ce6b2r
 YM6OIb5096qmO3EGBpjxwht+BUlijByQe5aZmPH2fx7847vOkJoujb8E8Qsi0/PPtsjP
 b/gCcDFEEzEA6EdUfeaSsQD+OPu35fFrJeQaM+LGz/e4MfcGKH/81i08pJXmcNo5xei/
 VuMeuwcub1Z5oXt/TAa96xeWw7IkiLK662e5BKQdPQpxRPqAsruS33sLy00U9aqed5wS
 mONN3oTWrpp+eTkXMAIWZxAL28/hZjfPkeIjhcygwt8PwmpUCWORirkbRhBxbjkI9HEY
 58xA==
X-Gm-Message-State: AOJu0YzCP9y08RhsT3dukknzeJa/Pf0eX5j1s9ywt14g/Kolw/Xq0ZCh
 vUNRoFAuLHiJcKeEXuLCJhAtJpqJRuUcnUizNPcY9nUsJt1mxojSx40d/p1yZHwLwVdFbyh1zsa
 RdTx7fwQhYJEccLht8pqCs72b0oU=
X-Google-Smtp-Source: AGHT+IEIVpnumLI29ZUaA8RK49U1gN6tcXn5ifUPu5C2wHhtI90oLioFPwr1i+oB405rRZyrCbG9Ny4XUqRc0DzrcD4=
X-Received: by 2002:ac2:504c:0:b0:51a:df97:cc8d with SMTP id
 2adb3069b0e04-5220fd7cc70mr10958319e87.26.1715828043991; Wed, 15 May 2024
 19:54:03 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 16 May 2024 12:53:52 +1000
Message-ID: <CAPM=9tx_KS1qc8E1kUB5PPBvO9EKHNkk7hYWu-WwWJ6os=otJA@mail.gmail.com>
Subject: [git pull] drm urgent for 6.10-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Here is the buddy allocator fix I picked up from the list, please apply.

Dave.

drm-next-2024-05-16:
drm urgent for 6.10-rc1 merge:

buddy:
- fix breakage in buddy allocator.
The following changes since commit 275654c02f0ba09d409c36d71dc238e470741e30:

  Merge tag 'drm-xe-next-fixes-2024-05-09-1' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-05-10
12:41:34 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-05-16

for you to fetch changes up to 431c590c3ab0469dfedad3a832fe73556396ee52:

  drm/tests: Add a unit test for range bias allocation (2024-05-16
12:50:14 +1000)

----------------------------------------------------------------
drm urgent for 6.10-rc1 merge:

buddy:
- fix breakage in buddy allocator.

----------------------------------------------------------------
Arunpravin Paneer Selvam (2):
      drm/buddy: Fix the range bias clear memory allocation issue
      drm/tests: Add a unit test for range bias allocation

 drivers/gpu/drm/drm_buddy.c            |  3 ++-
 drivers/gpu/drm/tests/drm_buddy_test.c | 36 +++++++++++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 2 deletions(-)

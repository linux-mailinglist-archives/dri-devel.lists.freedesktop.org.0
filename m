Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9023B151332
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 00:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342736ED2E;
	Mon,  3 Feb 2020 23:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A376ED2E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 23:26:57 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id j132so16530358oih.9
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 15:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=7PxxR1GHzdRYycbWi00wyis2Uv32fIAZsG7I2NFRsIw=;
 b=lRl7kEazMGZ0aJYBJaZOQQ5GyJy5smLO4fSz59JEidrYoVvgNAeu8G+Hq01N3IG0Wt
 GcO5t5AcYet5PTGky992RAU4BYSPrXqyBHCWZVMiEuvTb2FayVBeWUYfr5drb1onrv5r
 434b1B486q9Puk65Q+hCeY1Re26uRfXiU6V1YWmrzqvGs1QvF3GTM2i46MEMvnvCL5uZ
 26xMlFMquu9fiLm1ZTvHJNXW9ZVcaXZO7sCi011C5/s/UEhWQXTGdI21lCxBFLCyG4/N
 gjn1mdv/f04vJlTtyt8q2hwVIQsuXOTMm5XBr1z9al/K74+Bm1oehy+1OwWl27hc8f5X
 UsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7PxxR1GHzdRYycbWi00wyis2Uv32fIAZsG7I2NFRsIw=;
 b=COY5FKZ0UERiN3xngJol3RaUOrysR5SgEG9TblhPjet8H0GnxEzrzpu956BnOiJ3pg
 UEfR/hpM0iEkKpDSIzVRNHC95i8kZ0Lj/ouh2PHgWREB+BBIaiNzoy8facLizd88KsjU
 W1tyHUzVitHzjq0T8H8Y0pa0+iZyrDijNlEW7mOCrlUxluz136d42c6Jes9t/JLsFVHa
 wGdNaVQOa0EKf4UPU7MWlDJnP9hz5BaHpavSOD4+Tl4ijsE/u+mw1i3C1wEggBPTWHqe
 uw+KnW7uk7ea5WTC6ixxrPm+IPTJ/1W422vggPPQ+H5Uvoo5o8EI14umm9Ogy3v6A+7l
 AASA==
X-Gm-Message-State: APjAAAWR823UnLIlF5HSReNaP7SlIewQVOmfE6MRgpNw8h+bDs8jT4jI
 bFBPMFSDtyfQFg9SDLjGd7cc03VVZhpw9uCjO+qdeRAOMFM=
X-Google-Smtp-Source: APXvYqzCVSOmE/7CGjSxr8z/VVtC3D8eo9OyTml6D6R4PWfUHm/aXYct9eXk9L00tlcvpbTKk2N0nD0hatGuIMMDhgs=
X-Received: by 2002:aca:815:: with SMTP id 21mr1230178oii.52.1580772417222;
 Mon, 03 Feb 2020 15:26:57 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 4 Feb 2020 09:26:45 +1000
Message-ID: <CAPM=9tyPRUfbZZtVWWxs95aLkuaXkenwGU+QfR3N6NLRn+PsHg@mail.gmail.com>
Subject: [git pull] drm ttm/mm for 5.6-rc1
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Thomas Hellstrom has some more changes to the TTM layer that needed a
patch to the mm subsystem, this adds a new mm API
vmf_insert_mixed_prot to avoid an ugly hack that has limitations in
the TTM layer.

Should be all correctly acked.

Regards,
Dave.

drm-next-2020-02-04:
drm ttm/mm changes for 5.6-rc1
The following changes since commit d47c7f06268082bc0082a15297a07c0da59b0fc4:

  Merge branch 'linux-5.6' of git://github.com/skeggsb/linux into
drm-next (2020-01-30 15:18:38 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-02-04

for you to fetch changes up to b45f1b3b585e195a7daead16d914e164310b1df6:

  Merge branch 'ttm-prot-fix' of
git://people.freedesktop.org/~thomash/linux into drm-next (2020-01-31
16:58:35 +1000)

----------------------------------------------------------------
drm ttm/mm changes for 5.6-rc1

----------------------------------------------------------------
Dave Airlie (1):
      Merge branch 'ttm-prot-fix' of
git://people.freedesktop.org/~thomash/linux into drm-next

Thomas Hellstrom (2):
      mm: Add a vmf_insert_mixed_prot() function
      mm, drm/ttm: Fix vm page protection handling

 drivers/gpu/drm/ttm/ttm_bo_vm.c | 22 ++++++++++++++-------
 include/linux/mm.h              |  2 ++
 include/linux/mm_types.h        |  7 ++++++-
 mm/memory.c                     | 44 +++++++++++++++++++++++++++++++++++++----
 4 files changed, 63 insertions(+), 12 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

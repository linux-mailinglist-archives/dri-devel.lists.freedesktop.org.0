Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2456F19CD86
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 01:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F26C6E184;
	Thu,  2 Apr 2020 23:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6673C6E184
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 23:35:56 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id e4so4480206oig.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 16:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=FJ9qyX/ERFGH+sL2RwXnAwjcoDdSnfygv2TE0DrkPWo=;
 b=SzGjDNztDQhVQbdwBpZrpTB3sigb0d9gr0rb2ilzE5gv1OYeKmKhHVxgHuoB5EpDRr
 y5sK3xSBlLZz4I+rnBbmgsTE62hfp7wCJA9hSRNfaBJ2W7oE9trpYaBsBH6uk1JQH/Mb
 uxOw7OTviVCDrKdGrmMnlQuF1qZmnLa/4Xg+ZH5ksJo54THi+HjVMFyAf5WcyWaM8vWk
 iL5o5CAY+sm4smqIc3weyp+y0XAtZ8Pkn1S0PQUOflNTQfky+nJLOn8IT6RldJL5b9gG
 2aB6Tqw3K8I7n/84CgmfPjFD5hr6MvwcN8zTqz/KYCpw0jrTdW/S/8u5cd3bFF/H/BlE
 v9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=FJ9qyX/ERFGH+sL2RwXnAwjcoDdSnfygv2TE0DrkPWo=;
 b=oXmqITf/zlGDZZhvQCpZChHUmdFXyhgvANnN8XrGiI3er1GzF9ckyLSM695OkTXtAv
 4Sx357tBRX2N0V4Lx2wOddtVml80/pLFSQ10ZN5BvDvqYzy9MzwERvHjPHpku39bVwoO
 WR5i1X8S8M4fH2KvZG3U4+HaXhQken0/4SKO+GU2mnVTueF+bHQbFXoERgVRcJevEVPr
 Z+SyzM/nMw7Nuc+mLf1R++Ip8QjNz1vViuZZTqPXBfmMgqxnfWZYMi/wCm6VxzspXdCy
 vFpo8M+hjvBg2Rsb8viAwfTlYHuBj0qP+s7jd6KSw6kEzUpaFlXoYoy97CDqSWgq3nTP
 arPw==
X-Gm-Message-State: AGi0PuayeW2rphJYDa4h7hrmdJS3a+zJh1PdLglRbjZaAfbefnQ9llwK
 PGGZmdK4aJneMufsSDUX7VAConTuLwRcjcFPupI=
X-Google-Smtp-Source: APiQypJTQCO1O4Bgs3Gvhy9fyJ3ltnUEFJm8VzH3M/nuCD+9qFLUrR2PFdZacna+b1hbGXGm6k+tb7uaA25CpVSNW1s=
X-Received: by 2002:a05:6808:b1a:: with SMTP id
 s26mr1073671oij.150.1585870555434; 
 Thu, 02 Apr 2020 16:35:55 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 3 Apr 2020 09:35:43 +1000
Message-ID: <CAPM=9tz_FMuxj+RH3VqzVyN2yQC9xy8vePAz14HPKtVfEXs2iA@mail.gmail.com>
Subject: [git pull] drm ttm hugepages feature pull for 5.7-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
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

This is the second pull, it has some changes to mm in it that should
all have acks on them. The first dax constify arg patch got an ack on
the list from Matthew Wilcox and Dan Williams after the MR was sent,
but I didn't think it was worth a resend for that.

This adds support for hugepages to TTM and has been tested with the
vmwgfx drivers, though I expect other drivers to start using it.

Dave.

drm-next-2020-04-03-1:
drm: add support for hugepages to TTM
The following changes since commit 59e7a8cc2dcf335116d500d684bfb34d1d97a6fe:

  Merge tag 'drm-msm-next-2020-03-22' of
https://gitlab.freedesktop.org/drm/msm into drm-next (2020-03-31
16:34:55 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2020-04-03-1

for you to fetch changes up to 0e7e6198af28c1573267aba1be33dd0b7fb35691:

  Merge branch 'ttm-transhuge' of
git://people.freedesktop.org/~thomash/linux into drm-next (2020-04-03
09:07:49 +1000)

----------------------------------------------------------------
drm: add support for hugepages to TTM

----------------------------------------------------------------
Dave Airlie (1):
      Merge branch 'ttm-transhuge' of
git://people.freedesktop.org/~thomash/linux into drm-next

Thomas Hellstrom (VMware) (9):
      fs: Constify vma argument to vma_is_dax
      mm: Introduce vma_is_special_huge
      mm: Split huge pages on write-notify or COW
      mm: Add vmf_insert_pfn_xxx_prot() for huge page-table entries
      drm/ttm, drm/vmwgfx: Support huge TTM pagefaults
      drm/vmwgfx: Support huge page faults
      drm: Add a drm_get_unmapped_area() helper
      drm/vmwgfx: Introduce a huge page aligning TTM range manager
      drm/vmwgfx: Hook up the helpers to align buffer objects

 drivers/gpu/drm/drm_file.c                 | 141 ++++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c            | 161 +++++++++++++++++++++++++++-
 drivers/gpu/drm/vmwgfx/Makefile            |   1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |  13 +++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  12 +++
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c |  76 ++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c        | 166 +++++++++++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c   |   5 +-
 include/drm/drm_file.h                     |   9 ++
 include/drm/ttm/ttm_bo_api.h               |   3 +-
 include/linux/fs.h                         |   2 +-
 include/linux/huge_mm.h                    |  41 ++++++-
 include/linux/mm.h                         |  17 +++
 mm/huge_memory.c                           |  44 ++++++--
 mm/memory.c                                |  27 +++--
 16 files changed, 692 insertions(+), 28 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

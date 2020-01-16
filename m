Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D72813D7DA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 11:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D996EC93;
	Thu, 16 Jan 2020 10:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25356EC93
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 10:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 65D903FB36;
 Thu, 16 Jan 2020 11:24:32 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=BaajdoVU; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.272
X-Spam-Level: 
X-Spam-Status: No, score=-1.272 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PP_MIME_FAKE_ASCII_TEXT=0.827,
 URIBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3_ne1X1WC3tB; Thu, 16 Jan 2020 11:24:31 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 749263FAF7;
 Thu, 16 Jan 2020 11:24:28 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A6D903600E5;
 Thu, 16 Jan 2020 11:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579170268; bh=mEFx9V5dZREyu5xui8WPw7+d2B0H1YlLoWS5BPa9zvk=;
 h=From:To:Cc:Subject:Date:From;
 b=BaajdoVUOpy4nlM1oOsu9GaY9zDb2cietOWVgrPgjDHmNservfUdZN/QDE3cIaRst
 hK6VPw7bVYQfkSY34mFFDFPju2r8YOIUjcqulW3jjlrCjKGk4cwApmFJXhEe4lU9YU
 KRwJZ13eUfzmQtiZCgj0Y1sybTnYGbhkrj2cOk04=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: airlied@gmail.com,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [git pull] ttm-prot-fix
Date: Thu, 16 Jan 2020 11:24:11 +0100
Message-Id: <20200116102411.3056-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: pv-drivers@vmware.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thellstrom@vmware.com>,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1106098949=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1106098949==
Content-Transfer-Encoding: 8bit

From: Thomas Hellström (VMware) <thellstrom@vmware.com>

Dave, Daniel,

A small fix for the long-standing ttm vm page protection hack.

I'm sending this a separate pull request since it is touching mm code and
similar to the vmwgfx coherent stuff, Linus might want this as a separate
pull request. If sent separate it'd be good if it could still spend some
time in linux-next.

The mm changes have been acked by Andrew for merging through drm.
The ttm changes have been OK'd by Christian for a direct pull.

The following changes since commit 71e7274066c646bb3d9da39d2f4db0a6404c0a2d:

  Merge tag 'drm-intel-next-2020-01-14' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2020-01-15 16:57:54 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~thomash/linux ttm-prot-fix

for you to fetch changes up to 5379e4dd3220e23f68ce70b76b3a52a9a68cee05:

  mm, drm/ttm: Fix vm page protection handling (2020-01-16 10:32:41 +0100)

----------------------------------------------------------------
Thomas Hellstrom (2):
      mm: Add a vmf_insert_mixed_prot() function
      mm, drm/ttm: Fix vm page protection handling

 drivers/gpu/drm/ttm/ttm_bo_vm.c | 22 ++++++++++++++-------
 include/linux/mm.h              |  2 ++
 include/linux/mm_types.h        |  7 ++++++-
 mm/memory.c                     | 44 +++++++++++++++++++++++++++++++++++++----
 4 files changed, 63 insertions(+), 12 deletions(-)

--===============1106098949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1106098949==--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CB7186087
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3B56E2D5;
	Sun, 15 Mar 2020 23:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D064E6E102
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 04:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=M43Fclutcops3LTjLdBwRIG7fc6qs+/SivGL6t7wtcQ=; b=lVXJbQWZKeohEKZYCbB4VhDVV/
 XsMhxq3ZNhrJcH+HIjJOQHNOsyeBe6gyt/qf17MIyA30PaqWRrm5Vdf7f8V0BLXsHIMfNCUAwWOfX
 Hdv6oCUPEO/gWtLLMSrlPwujR4mKGfHvDB9Th85vsLEPxrICNf428R4H+9NcuNKn1cXLuVn8DBQYr
 PAKt5dFeWs/7RigXJ6QKkltkEKahOwGjNOKiF33VFufb5+yh6yGONB+L8n5sjZWUPF4pihtmPa/Bl
 PgfmRJNOnrkswUYLJn9gG7nD5o31pDXVK1s1qG1KXOHs3Y9QTWvqVhE7CGYAFSl9SPVAgZE8rnGVH
 Ya3xZTQw==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDKbE-0003dY-6j; Sun, 15 Mar 2020 04:10:04 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: fbdev: fix -Wextra build warnings
Date: Sat, 14 Mar 2020 21:09:56 -0700
Message-Id: <20200315041002.24473-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.16.4
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:06 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series fixes warnings in fbdev that are found when
-Wextra is used. In fixing these, there were a few other build
errors discovered (mostly caused by bitrot) and fixed.

[PATCH 1/6] fbdev: fbmon: fix -Wextra build warnings
[PATCH 2/6] fbdev: aty: fix -Wextra build warning
[PATCH 3/6] fbdev: matrox: fix -Wextra build warnings
[PATCH 4/6] fbdev: savage: fix -Wextra build warning
[PATCH 5/6] fbdev: pm[23]fb.c: fix -Wextra build warnings and errors
[PATCH 6/6] fbdev: via: fix -Wextra build warning and format warning

 drivers/video/fbdev/aty/atyfb_base.c       |    2 +-
 drivers/video/fbdev/core/fbmon.c           |    2 +-
 drivers/video/fbdev/matrox/matroxfb_base.h |    2 +-
 drivers/video/fbdev/pm2fb.c                |    2 +-
 drivers/video/fbdev/pm3fb.c                |    8 ++++----
 drivers/video/fbdev/savage/savagefb.h      |    2 +-
 drivers/video/fbdev/via/debug.h            |    6 ++++--
 drivers/video/fbdev/via/viafbdev.c         |    2 +-
 8 files changed, 14 insertions(+), 12 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

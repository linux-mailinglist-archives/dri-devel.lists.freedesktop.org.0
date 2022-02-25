Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E2E4C4BA1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831C810E842;
	Fri, 25 Feb 2022 17:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4349810E833;
 Fri, 25 Feb 2022 17:08:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF84861D4E;
 Fri, 25 Feb 2022 17:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03800C340E7;
 Fri, 25 Feb 2022 17:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645808897;
 bh=hz+lH5qNUjVnCbRoevPcMCs+vilBSIywQyZBMPYFZE4=;
 h=From:To:Cc:Subject:Date:From;
 b=J6iG1CiTd1gJ8dTRKFQs5BuMv+965CCZ5QT10FvqfnorcsRa+c8PyzUudIZfn8QJn
 bBeDyPP3mXgBnf4JPBeOv9XNs8qsTP7veQYZXGnXKv9Oek7Cv/CGfWO3AIxqLPpgzS
 v8Bpt6npCDD/MOd8qb2SkfqtMJb0rFmfvVxjr/yrCWwE6ZyOCDTN2+Hk5Pj6mlwIxi
 twKPO0qogNY5eJFX5cJWvjpIMSkaDl6NTLrbMz0BYLZHs8vTisOEDy+EU22+7EXW3B
 iUzc5yZdjH5hs+mIPnCrtlAQ0chWXYcGr0fhQGVlxhiII618BBgpeuIbl5JMvyAtES
 C/7M0HdvYUuHA==
From: broonie@kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Fri, 25 Feb 2022 17:08:12 +0000
Message-Id: <20220225170812.1523966-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_snps_phy.c

between commit:

  28adef861233c ("drm/i915/dg2: Print PHY name properly on calibration error")

from the drm-intel-fixes tree and commits:

  84073e568eec7 ("drm/i915/dg2: Print PHY name properly on calibration error")
  b4eb76d82a0ea ("drm/i915/dg2: Skip output init on PHY calibration failure")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

[Used drm-intel version]

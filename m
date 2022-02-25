Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C804C4A45
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 17:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3B210E4AA;
	Fri, 25 Feb 2022 16:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152F010E4AA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 16:14:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD02961743;
 Fri, 25 Feb 2022 16:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A29CC340E7;
 Fri, 25 Feb 2022 16:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645805670;
 bh=xkC4nSLHICZXNHLPzus0cNfYAdOEoTaFaMgu+1Pf2Vc=;
 h=From:To:Cc:Subject:Date:From;
 b=KWzljE6iP0Y97AxNUAcL/+fpHDJq+enejnltiHRu5mlxaBfZ3P2f5S6vvhYvFMRlZ
 5lx4hDKWtwpPHnv/RCFL47/gTQjHP9l5p9lm97amNS8k1YorS/bndcY1pO8qSbZD27
 UFiumJwdp/SnxZLlsDA3SRUYI+h2rEe27MmIPedORKgyuwW9x4N6PEg9fhNea4ROx3
 HvAAIWTzr+vwekPDlVXPJQpPnFepl/t4ET8jAuvjwj8ePtqN0BG2zVDZf1LMsikXwF
 tN9CjGuTx6eAMomX5NQLgIQ9rOnPti0UqMPV8104E87n5ornDX3kD+RhhdTwuETlth
 QfwWHvwjwubog==
From: broonie@kernel.org
To: Dave Airlie <airlied@linux.ie>,
	DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes tree
Date: Fri, 25 Feb 2022 16:14:25 +0000
Message-Id: <20220225161425.456356-1-broonie@kernel.org>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_snps_phy.c

between commit:

  28adef861233c ("drm/i915/dg2: Print PHY name properly on calibration error")

from the drm-intel-fixes tree and commits:

  c5274e86da5fe ("drm/i915/snps: convert to drm device based logging")
  84073e568eec7 ("drm/i915/dg2: Print PHY name properly on calibration error")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

[Used drm version]

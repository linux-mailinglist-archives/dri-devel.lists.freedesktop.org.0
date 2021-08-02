Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF6A3DDC39
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 17:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A09A6E2F2;
	Mon,  2 Aug 2021 15:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C796E0B9;
 Mon,  2 Aug 2021 15:18:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6591D60FD8;
 Mon,  2 Aug 2021 15:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627917530;
 bh=U6CN0PhWEJhWY3mV7ebsRA4d/EhmRmKPYW5M7ZP0IqU=;
 h=From:To:Cc:Subject:Date:From;
 b=oAG6QRU1mp4M9hZ76rOLUQTdQ/mnDwzPJFMq+gmb9NwA56dXwlGuhA5wcD4PM7OHg
 Ifi+oFvKc04+Q8LjeRz6sqynMF+9C1+dPQlcJQVesxk+gqPClhHi7UaW5LPSCElRDn
 4mil4a7cEetd/XkDKLNgDFGX3eUA4X5eesJ+pmX3t+DW5ucXyUHKhi8GHt9DVP09oV
 76pFsqOBjbIfk2un7U9F4H8D9/7svDeMlrnb62q6vJRnddd92qDDTr39HUoKFCr8YU
 NLEacPhsxaWgGC+Ckwvfi1r9xoW33TnZNbq9FqS/f8lYWpNpp3QHFbPh9Vi+NttNiq
 xrLE4r0IY0J0A==
From: Mark Brown <broonie@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Mon,  2 Aug 2021 16:18:33 +0100
Message-Id: <20210802151833.15348-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_device_info.c

between commit:

  0f9ed3b2c9ec ("drm/i915/display/cnl+: Handle fused off DSC")

from the drm-intel-fixes tree and commit:

  a4d082fc194a ("drm/i915: rename/remove CNL registers")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/i915/intel_device_info.c
index e0a10f36acc1,305facedd284..000000000000
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c

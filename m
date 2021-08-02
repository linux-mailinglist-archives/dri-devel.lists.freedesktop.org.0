Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA483DDC88
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 17:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5B26E202;
	Mon,  2 Aug 2021 15:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844606E202;
 Mon,  2 Aug 2021 15:35:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CFC62610A8;
 Mon,  2 Aug 2021 15:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627918519;
 bh=uaD6LcM0hJBb/L3SNeTefSKZ9bj7Ix5GN0yWEUA3Bfw=;
 h=From:To:Cc:Subject:Date:From;
 b=ncpAGccp0N5gsmshPd3iL+fAuTMfexkRiO3lwsMMzwU0P8c4h7+aWZF0WlinTQk5T
 GoEesBFUGoxQQNDixa8ZDGH5J5NKVfqfpa60Gyvd7AIzHHvKsn5dYMMc1fLuELxE0L
 IGhDpbKIXQh4KVOn/aMxzt7KOkttXBO2+w8wjYpuJgFS8IMJ+1I6JllU+4pni1DzNC
 6iCiyzUjMkWJaohyTysFwr0LWbf/DWRnlwuAYQqx9NMRPwv5fP26Ryzp7vEBEDpz0W
 R6WgFVfJeLHECCKDci3p/K30166MCHZyXVeR02zHgjqnzEvADmhCUHURZbNf1xxB0c
 J0gAumDkfWnYg==
From: Mark Brown <broonie@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Date: Mon,  2 Aug 2021 16:29:49 +0100
Message-Id: <20210802152949.15965-1-broonie@kernel.org>
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

  drivers/gpu/drm/i915/display/intel_display.c

between commit:

  b4bde5554f70 ("drm/i915/display: split DISPLAY_VER 9 and 10 in intel_setup_outputs()")

from Linus' tree and commits:

  cad83b405fe4 ("drm/i915/display: remove PORT_F workaround for CNL")
  ec387b8ff8d7 ("drm/i915/display: split DISPLAY_VER 9 and 10 in intel_setup_outputs()")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/i915/display/intel_display.c
index 557871ee07db,3faedcb7ef42..000000000000
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c

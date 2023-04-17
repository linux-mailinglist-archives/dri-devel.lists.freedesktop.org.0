Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8B56E4BAE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 16:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAAA10E55B;
	Mon, 17 Apr 2023 14:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB5510E55B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 14:39:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7BCA262301;
 Mon, 17 Apr 2023 14:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B522C433D2;
 Mon, 17 Apr 2023 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681742367;
 bh=LTTln81pU3tbmAEDXucfOA7gxmfn0aHgrBX7aTXJ72k=;
 h=From:To:Cc:Subject:Date:From;
 b=KWw03S2bX6ty62CMEBwRHiWNsa7WKHIf2dy9Mw+vo8zKfKnII4QYxPRTdNZn3OSys
 o7KvJ6G+0sKRoqv1OG3hbzQ5yz4YrG0QQ1CrYw0bazhg0hnHvQPrkAxeNUkelhlPQz
 XCcWPDMN1/xh/s4dqbenWCvuvFAOkULifUJciYX0CJEzwQyvobwSLkD2Gt4974OwWv
 K5XNhOs2zzPePJyeY9WsB6xSKGEXzOjd/OH2Yr6MM82vhuiexQHEIZblE9MQ8QeQHK
 zvfhqQlLpQQVqJX5J7RriLijAFzrq1bCmKp35/9x41Fq0JUtyfVBeL7Z0Y7pgewKt4
 ZYLZZIUWAkbYQ==
From: broonie@kernel.org
To: Dave Airlie <airlied@redhat.com>,
	DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes tree
Date: Mon, 17 Apr 2023 15:39:23 +0100
Message-Id: <20230417143923.2136597-1-broonie@kernel.org>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_dp_aux.c

between commit:

  e1c71f8f91804 ("drm/i915: Fix fast wake AUX sync len")

from the drm-intel-fixes tree and commit:

  605f7c7313334 ("drm/i915: Fix fast wake AUX sync len")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/i915/display/intel_dp_aux.c
index 30c98810e28bb,705915d505652..0000000000000
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c

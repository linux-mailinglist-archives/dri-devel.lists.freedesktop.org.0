Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B0C570B69
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D0F14B9AC;
	Mon, 11 Jul 2022 20:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C934714A0A1;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6B373B81205;
 Mon, 11 Jul 2022 20:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085C9C34115;
 Mon, 11 Jul 2022 20:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571123;
 bh=gmUsOXoQJn4VasGdRabTn//YULN5ONt5Qo/z2YXpkw4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=beVau9XqV6z2ujjPu0EBBrK1UT5fo0ZgcW+NtaZx5kIjL6ceFS2Ug1ZYg9OX0lcqt
 cBS4CgmZP+BQuezzkYcbT5jqvHnGFpKJwVmRuepSeWlG0OaakiJlmKd0wl7Ye8+uF5
 cXS/bbWtT5UmPYnxKbmH8vmyM2JchrKLjaexbtWKTGCQhovq7WqumRLsTI5A1UkXCY
 7rBLEeq+6TrLDeM7b4clTV4r+9AunCxQKKewspd+8wRqnPme+m/atqf9vQTtI9J2v0
 f3fYeETnnL29zuJNXaxM9M7HTyUzcaqQohuhBg39YKV0gvNL9Bspf6M65DXUuP7bIp
 biCUbjo4odRvw==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e8A-Jz;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 15/32] drm/i915: intel_pm.c: fix some ascii artwork at
 kernel-doc
Date: Mon, 11 Jul 2022 21:25:00 +0100
Message-Id: <eb7522b15921a505e88572b128e0caabf9574b2b.1657565224.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657565224.git.mchehab@kernel.org>
References: <cover.1657565224.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Preserving ascii artwork on kernel-docs is tricky, as it needs
to respect both the Sphinx rules and be properly parsed by
kernel-doc script.

The Sphinx syntax require code-blocks, which is:

	::

followed by a blank line and indended lines.

But kernel-doc only works fine if the first and the last line
are indented with the same amount of spaces.

Also, a "\" at the end means that the next line should be merged
with the first one.

Change the ascii artwork to be on code-blocks, starting all
lines at the same characters and not ending with a backslash.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/intel_pm.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index f06babdb3a8c..d3393752b04b 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -684,18 +684,20 @@ static const struct intel_watermark_params i845_wm_info = {
  * FIFO is relatively small compared to the amount of data
  * fetched.
  *
- * The FIFO level vs. time graph might look something like:
+ * The FIFO level vs. time graph might look something like::
  *
- *   |\   |\
- *   | \  | \
- * __---__---__ (- plane active, _ blanking)
- * -> time
+ *   ^
+ *   |   |\   |\      (                          )
+ *   |   | \  | \     (                          )
+ *   |   __---__---__ (- plane active, _ blanking)
+ *   +-------------------> time
  *
- * or perhaps like this:
+ * or perhaps like this::
  *
- *   |\|\  |\|\
- * __----__----__ (- plane active, _ blanking)
- * -> time
+ *   ^
+ *   |     |\|\  |\|\   (                          )
+ *   |   __----__----__ (- plane active, _ blanking)
+ *   +-------------------> time
  *
  * Returns:
  * The watermark in bytes
@@ -731,13 +733,14 @@ static unsigned int intel_wm_method1(unsigned int pixel_rate,
  * FIFO is relatively large compared to the amount of data
  * fetched.
  *
- * The FIFO level vs. time graph might look something like:
+ * The FIFO level vs. time graph might look something like::
  *
- *    |\___       |\___
- *    |    \___   |    \___
- *    |        \  |        \
- * __ --__--__--__--__--__--__ (- plane active, _ blanking)
- * -> time
+ *   ^
+ *   |     |\___       |\___        (                          )
+ *   |     |    \___   |    \___    (                          )
+ *   |     |        \  |        \   (                          )
+ *   |  __ --__--__--__--__--__--__ (- plane active, _ blanking)
+ *   +---------------------------------> time
  *
  * Returns:
  * The watermark in bytes
-- 
2.36.1


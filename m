Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620DE5B3031
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 09:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F1310EBF3;
	Fri,  9 Sep 2022 07:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1C010EBEB;
 Fri,  9 Sep 2022 07:34:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A36C461EEA;
 Fri,  9 Sep 2022 07:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5E2C4315A;
 Fri,  9 Sep 2022 07:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662708894;
 bh=TwanRK/R0DaOUl8s+MGdP5tuX2z+kZ/zhcAXRv1Dj9g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jpFhFI/0WDt4zOtGrQvIQ/qGgJF3aDOQ3GQDq9QEzvRnZ3f18UNZTlOlnnSkQFox9
 m9bjjDrfEm/oiOfWnOvUPca8WQQWIb31KV11PGpCbkUdavhbF9+mqqiLoQFo5gTQz+
 Su1YQaphf05icyQ9sBQRAATWA5+tHbFy40DvqEuiUgPOwctiLMGo8lCAD5F8NYBZKX
 KeIPH3vLyC44Qx/v91aypyr58R8v8eWEGcNtEWwAjti5K2jdWqCh4KL0STZ8l9VgQW
 5Y6U2qZPkdjEQgH/wV5lxS3f/fc20/ctVKrQpfjmhSqaAAOb+Do0aWXYpXVq49+wLb
 0KmN9N0zKETuw==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oWYXG-007FGZ-CP;
 Fri, 09 Sep 2022 09:34:46 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 15/37] drm/i915: intel_pm.c: fix some ascii artwork at
 kernel-doc
Date: Fri,  9 Sep 2022 09:34:22 +0200
Message-Id: <0c993e585f1fbc26cdd86c1325fdfd7f7c969f10.1662708705.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1662708705.git.mchehab@kernel.org>
References: <cover.1662708705.git.mchehab@kernel.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Preserving ascii artwork on kernel-docs is tricky, as it needs
to respect both the Sphinx rules and be properly parsed by
kernel-doc script.

The Sphinx syntax require code-blocks, which is:

	::

followed by a blank line and indented lines.

But kernel-doc only works fine if the first and the last line
are indented with the same amount of spaces.

Also, a "\" at the end means that the next line should be merged
with the first one.

Change the ascii artwork to be on code-blocks, starting all
lines at the same characters and not ending with a backslash.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/intel_pm.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index eb9c54bbf51f..1f5e520a6728 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -683,18 +683,20 @@ static const struct intel_watermark_params i845_wm_info = {
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
@@ -730,13 +732,14 @@ static unsigned int intel_wm_method1(unsigned int pixel_rate,
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
2.37.3


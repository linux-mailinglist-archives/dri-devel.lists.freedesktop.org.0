Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EBC9B14E6
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 06:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA43210E40B;
	Sat, 26 Oct 2024 04:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mF2E2RMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7E510E010
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 04:52:47 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-6e31d9c8efcso50210557b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 21:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729918366; x=1730523166;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/xM391IR48qrcB5QAxis1fqgvS9fSdsN/EpuN4x9UQ0=;
 b=mF2E2RMok5DgdSIF0vXrvkV+8bQRCo8xNMjCCvGIDgTWBaLSqgMxK0reiyzELqlf7y
 igJKdPzd3BON56LRLtOBV1ur3l5u18m4TQTmGdhgiPVJwrbM1F2ovw5LXJcWY+dqIehA
 shMRtwlIgITwMhKVzjfF94CLJudaoj5mSVIUq6PCvEEmcbFmz+TwlmHJj552ym/UOnH/
 GW81Qb+spMRy9Xt25dycUGS4yRdNBeU82AP563w2oe6Gyf/g/Q4xbQHnkK+3jR1VHb/W
 px7WrCkOoIcZvzqIsAWBQgfby8OhAGcjk+UEC9XBdS/xYKa5b8ztcir/KQIzb2POjSNj
 j6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729918366; x=1730523166;
 h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/xM391IR48qrcB5QAxis1fqgvS9fSdsN/EpuN4x9UQ0=;
 b=g94Vvs82hzYTqpqLBe/JKPUjCz4ZDl5KALQx/hVkaF0sNYgRgXsgEX5hafQC6K27IQ
 22SRja2oo9STsNUanL3wW3l4cSfkiUHyTeC+rgNA3+RLNxJID6V64QhlCTO0DPnvXMka
 DCI8yMji7j3z8ho/uxtjJpK55C3xkW7Hd7E3l0r+/FQZWNtxBsBCNDYNvEbETP9gLilL
 D5Feg1KV1EN7Qs2PdIcHsoWLa0DzrOrt2nr0rx7x3HMA63C4PFssomFq6fpNFi93SaId
 RYJg5tNU9e+FpKJOKi44PgjJrsi4QFS6Ta57IqYWQB9BA1Y4J/s7S70N0iVxpTU0dzhK
 60qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhvy7w4CZ7KoB7sECfL/udbAhW/N921CXF+aHCPaR9+w/JwV4IvEnbAVi2Fl9Rj30gsJskaQ7nr1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcmojgeZbqUglL6p9VF1QwHkNNFjUFkcGxhFmVFqgf2az4r/ot
 gjs8gH/TQueRE6zjfpffckpxxOHP6LuqlARzi32gR7eL0wxGDRedOwf3aB01yeM1FCzedGVfV+W
 GzU7RF06QQAdRBg==
X-Google-Smtp-Source: AGHT+IGRhPGhaOAsmtwnVFsCBSjW9h81zlh5LCF4eegHPpzOMNumbplBd6lmfCGpHlNLVd/xKdy0TFipMv4YWoE=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:999e:1eb9:2ed2:327])
 (user=saravanak job=sendgmr) by 2002:a25:838d:0:b0:e28:e97f:538d with SMTP id
 3f1490d57ef6-e3087c19387mr979276.6.1729918366217; Fri, 25 Oct 2024 21:52:46
 -0700 (PDT)
Date: Fri, 25 Oct 2024 21:52:41 -0700
Message-Id: <20241026045243.452957-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Subject: [PATCH v2] driver core: fw_devlink: Stop trying to optimize cycle
 detection logic
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Devarsh Thakkar <devarsht@ti.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

In attempting to optimize fw_devlink runtime, I introduced numerous cycle
detection bugs by foregoing cycle detection logic under specific
conditions. Each fix has further narrowed the conditions for optimization.

It's time to give up on these optimization attempts and just run the cycle
detection logic every time fw_devlink tries to create a device link.

The specific bug report that triggered this fix involved a supplier fwnode
that never gets a device created for it. Instead, the supplier fwnode is
represented by the device that corresponds to an ancestor fwnode.

In this case, fw_devlink didn't do any cycle detection because the cycle
detection logic is only run when a device link is created between the
devices that correspond to the actual consumer and supplier fwnodes.

With this change, fw_devlink will run cycle detection logic even when
creating SYNC_STATE_ONLY proxy device links from a device that is an
ancestor of a consumer fwnode.

Reported-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Closes: https://lore.kernel.org/all/1a1ab663-d068-40fb-8c94-f0715403d276@ideasonboard.com/
Fixes: 6442d79d880c ("driver core: fw_devlink: Improve detection of overlapping cycles")
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
Greg,

I've tested this on my end and it looks ok and nothing fishy is going
on. You can pick this up once Tomi gives a Tested-by.

Thanks,
Saravana

v1 -> v2:
- Removed the RFC tag
- Remaned the subject. v1 is https://lore.kernel.org/all/20241025223721.184998-1-saravanak@google.com/T/#u
- Added a NULL check to avoid NULL pointer deref

 drivers/base/core.c | 46 ++++++++++++++++++++-------------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 3b13fed1c3e3..f96f2e4c76b4 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1990,10 +1990,10 @@ static struct device *fwnode_get_next_parent_dev(const struct fwnode_handle *fwn
  *
  * Return true if one or more cycles were found. Otherwise, return false.
  */
-static bool __fw_devlink_relax_cycles(struct device *con,
+static bool __fw_devlink_relax_cycles(struct fwnode_handle *con_handle,
 				 struct fwnode_handle *sup_handle)
 {
-	struct device *sup_dev = NULL, *par_dev = NULL;
+	struct device *sup_dev = NULL, *par_dev = NULL, *con_dev = NULL;
 	struct fwnode_link *link;
 	struct device_link *dev_link;
 	bool ret = false;
@@ -2010,22 +2010,22 @@ static bool __fw_devlink_relax_cycles(struct device *con,
 
 	sup_handle->flags |= FWNODE_FLAG_VISITED;
 
-	sup_dev = get_dev_from_fwnode(sup_handle);
-
 	/* Termination condition. */
-	if (sup_dev == con) {
+	if (sup_handle == con_handle) {
 		pr_debug("----- cycle: start -----\n");
 		ret = true;
 		goto out;
 	}
 
+	sup_dev = get_dev_from_fwnode(sup_handle);
+	con_dev = get_dev_from_fwnode(con_handle);
 	/*
 	 * If sup_dev is bound to a driver and @con hasn't started binding to a
 	 * driver, sup_dev can't be a consumer of @con. So, no need to check
 	 * further.
 	 */
 	if (sup_dev && sup_dev->links.status ==  DL_DEV_DRIVER_BOUND &&
-	    con->links.status == DL_DEV_NO_DRIVER) {
+	    con_dev && con_dev->links.status == DL_DEV_NO_DRIVER) {
 		ret = false;
 		goto out;
 	}
@@ -2034,7 +2034,7 @@ static bool __fw_devlink_relax_cycles(struct device *con,
 		if (link->flags & FWLINK_FLAG_IGNORE)
 			continue;
 
-		if (__fw_devlink_relax_cycles(con, link->supplier)) {
+		if (__fw_devlink_relax_cycles(con_handle, link->supplier)) {
 			__fwnode_link_cycle(link);
 			ret = true;
 		}
@@ -2049,7 +2049,7 @@ static bool __fw_devlink_relax_cycles(struct device *con,
 	else
 		par_dev = fwnode_get_next_parent_dev(sup_handle);
 
-	if (par_dev && __fw_devlink_relax_cycles(con, par_dev->fwnode)) {
+	if (par_dev && __fw_devlink_relax_cycles(con_handle, par_dev->fwnode)) {
 		pr_debug("%pfwf: cycle: child of %pfwf\n", sup_handle,
 			 par_dev->fwnode);
 		ret = true;
@@ -2067,7 +2067,7 @@ static bool __fw_devlink_relax_cycles(struct device *con,
 		    !(dev_link->flags & DL_FLAG_CYCLE))
 			continue;
 
-		if (__fw_devlink_relax_cycles(con,
+		if (__fw_devlink_relax_cycles(con_handle,
 					      dev_link->supplier->fwnode)) {
 			pr_debug("%pfwf: cycle: depends on %pfwf\n", sup_handle,
 				 dev_link->supplier->fwnode);
@@ -2140,25 +2140,19 @@ static int fw_devlink_create_devlink(struct device *con,
 		return -EINVAL;
 
 	/*
-	 * SYNC_STATE_ONLY device links don't block probing and supports cycles.
-	 * So, one might expect that cycle detection isn't necessary for them.
-	 * However, if the device link was marked as SYNC_STATE_ONLY because
-	 * it's part of a cycle, then we still need to do cycle detection. This
-	 * is because the consumer and supplier might be part of multiple cycles
-	 * and we need to detect all those cycles.
+	 * Don't try to optimize by not calling the cycle detection logic under
+	 * certain conditions. There's always some corner case that won't get
+	 * detected.
 	 */
-	if (!device_link_flag_is_sync_state_only(flags) ||
-	    flags & DL_FLAG_CYCLE) {
-		device_links_write_lock();
-		if (__fw_devlink_relax_cycles(con, sup_handle)) {
-			__fwnode_link_cycle(link);
-			flags = fw_devlink_get_flags(link->flags);
-			pr_debug("----- cycle: end -----\n");
-			dev_info(con, "Fixed dependency cycle(s) with %pfwf\n",
-				 sup_handle);
-		}
-		device_links_write_unlock();
+	device_links_write_lock();
+	if (__fw_devlink_relax_cycles(link->consumer, sup_handle)) {
+		__fwnode_link_cycle(link);
+		flags = fw_devlink_get_flags(link->flags);
+		pr_debug("----- cycle: end -----\n");
+		pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
+			link->consumer, sup_handle);
 	}
+	device_links_write_unlock();
 
 	if (sup_handle->flags & FWNODE_FLAG_NOT_DEVICE)
 		sup_dev = fwnode_get_next_parent_dev(sup_handle);
-- 
2.47.0.163.g1226f6d8fa-goog


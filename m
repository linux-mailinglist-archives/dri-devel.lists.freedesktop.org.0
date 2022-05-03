Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14026519924
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE0610F2F2;
	Wed,  4 May 2022 08:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E042210F2FD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:03:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267575671"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="267575671"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="734292524"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:03:16 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:03:13 +0300
Resent-Message-ID: <87wnf1ohby.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:25:12 +0300 (EEST)
Received: from fmsmga001.fm.intel.com (fmsmga001.fm.intel.com [10.253.24.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9C1F4580808;
 Tue,  3 May 2022 02:25:00 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="707970399"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="707970399"
Received: from fmsmga101.fm.intel.com ([10.1.193.65])
 by fmsmga001-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03
 May 2022 02:25:00 -0700
IronPort-SDR: 0P9zL1d0FS6nbrx06IjKDsAt69vXrHaYP+rVBVdrV3DM4re0JE4nS0bHkg60By6GuO6eMuI2LU
 pfKJmYavRA9Q==
X-IPAS-Result: =?us-ascii?q?A0FZAQA483BimLHS/INaHgEBCxIMQIFEC4I9AYE8J1WEE?=
 =?us-ascii?q?j2JAIVmgj6WfIVQgUAuGQEBAQEBAQEBAQksEwECBAEBAwSDe4Y5AiU0CQ0BA?=
 =?us-ascii?q?QIEAQEBAQMCAQIBAQEBAQEDAQEBAgIBAQECAQEGAgEBAQECEAEBAQEBAQEBC?=
 =?us-ascii?q?QsJBwYMBRAOBSKFLzkNgjUFAgMYDm5KCTUBAQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBEAINUkcBHwECAwEBAQkXBAsBDQEBBAopAQIDAQIGAQEIHAIeBAQCA?=
 =?us-ascii?q?gMBUxkFgniDGAWSFJsXen8ygQGCCAEBBoJdgyyBXAmBECyJQ4QgeicQgVVEe?=
 =?us-ascii?q?k6DNYFTgz+DCYJllRcggQ5DlHiQGZ15NAeDToE7BgyeNTOoVS2WNKJRhE+BY?=
 =?us-ascii?q?TyBWjMaI4M5URkPjiAMFhWDO4phcgI5AgYBCgEBAwmFRwEBhGGBbgEB?=
IronPort-PHdr: A9a23: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
 0hA+rj/N4lGbuXG
IronPort-Data: A9a23:/7PFe6gTvWQ7gqmDvR5DBSHPX1615xYKZh0ujC45NGQN5FlHY01je
 htvWjrQP/6DajH0KdojOdi0oEIE68KBmtEyQAplqSk2En4W8JqUDtmwEBzMMnLJJKUvbq7GA
 +byyDXkBJlsFhcwcz/0auCJQV9Ui/3QHtIQL8adYnsqGGeIcA941VQ73bdRbrdA27BVOSvU0
 T/Ji5CZaQbNNwJcaDpOsfre8Eg35ZwehRtB1rAATaET1LPhvyRNZH4vDfnZw6zQGdE88kaSH
 o4v/Znhlo/r105F5uCNy94XRnY3rov6ZmBivFINAvT/3UISzsAF+v1T2PI0MS+7gtgS9jx74
 I0lWZeYEG/FMkBX8Qi0vtYx/yxWZMV7FLH7zXeXn5KN5Q7sU37QyOh3Uxg6EaYbqrlGHjQbn
 RAYAGhlghGriOu8zfS1UORhisk4L9XsJMUYoH4IITPxVK1/B8qeGeOQvIcehWhv7ixNNa62i
 84xaDxzYRCFbBNff10QFZQ1kfyAgnjkbyYepkiYqKY6+GvPyxQ316LiWDbQUobbH5sPxxjG/
 Aoq+UymH0s0aYOQ5gGozVP3hubhuiDqG5sdQejQGvlC2QHMlz1KYPEMbnOyrfC8zEu/QMBUO
 UUX0i4vq7Uisk2tUtT5GRa/pRastxgQWpxLE/wm6SmJy6zJ80CYAHQJSnhKb9lOnM0/Qz1s0
 F6KgtfgLThutqCFD3Ob6rqQ6zi1PEA9L2YEeDQWCwgf8cj4sp00gBPMZtJiFrOlyNzzBTz0h
 TuNqUAWhbIUi8cQkaGy/UzGhT+qjpzISBMloATRQm+hqAh+YeaNZIWpr0bW7fNJKoufZl2Au
 mUU3cmY8O0KS5qKkUSlQ+wIHbXv5PGDMTDXk1h+N50g8Sm9vX+lYY1Upjp5IS9BN88NYyPkZ
 gnXsAVS5JhJJ2eCaa5xfpL3CsI2wKymHtPgPtjRZ9FPb5o3bAab8SVld1+T92TsllU816A5J
 ZqfN82rCB4yDK19xzuwAe0Qy7ki2ichxGjBbZT6yQm3l7uYeHORD7wCNTOma+Ey7KqJpDLb7
 v5bNs2X21NeVvHzZm/c9ot7BVULLnF9Bo3xs9RecuerJgtgBXFnCvnNzLdncItg94xTl/3N+
 WD7VkZD4F7+g2DXbwSMdn1nLrjoWP5XsXU+NDc+e1OpwGQqfa6r7aECZ902e6Uq8KpoyvscZ
 +UbYdmDBbJSUC/a/zUbRZ38qpFyMhWtmQ+KeSGiZVAXb59mVhHPvNvlYyPr9S8THmy2s9czp
 /ur0QazaYgDSgJzEdn+bPOp0kP3vH4BleY0VEzNSvFBeET97YFsbSjvpvs2JdwcbxTF2jaek
 Q2RBH8lSfLlrIY//Z/Hn62Jo4qyEPd5BgxdBWazAauK2Tfy0DS968xqcOO0di3ECzr41I6hN
 bpk0KSpWBEYp2piv415Grdt6Ksx4drzurNXpjiI+l2WMjxH7Zs9fxG7MdlzWr5lmuIF6VPqM
 q6b0pwDY+/UaJK8eLIEDFN9Btlvw834jdU7AR4dGELg+Ct++rbvva56bkbW0HI1wFeY1uoYL
 QoJt8cc5kqxkBcnPtudjTxT7yKLNHNov0QbWnMyX96DZukDkw8qjXng5snevcznhzJkbxRCH
 9NsrPCe74mwP2KbG5bJKVDD3PBGmbMFsw1QwVkJKjyhw4SY36Jtgk0JrWpvEWy5KymrNcouZ
 wCH0GUoeM2zE8tA3qCvokjyRlwaWnV1BGSokgZheJLlo7mADzCSfTxkUQp81Fge6X5Ydz5Xt
 KqEwXroGSvsfd/8xDAzRV8NlhAQZYIZy+E2o+j+R57tN8BjOVLN2/b+DUJV9UePKZ5v1SXv+
 Lk7lM4tOPaTHXNB/MUTVdLAvZxOE0/sGYC3aaw7lE//NTuCKGjaNPnnAx3ZR/6h0NSXrx/lU
 5A+epMnutbX/H/mkw33zJUke9dc9MPFLvJbEl83DQbqeIdzYtakXFw8O8Q+aKIWrw1SrPsA
IronPort-HdrOrdr: A9a23:8wYtdagYQ1o/3Fxfs5FnVTa8TXBQXkcji2hC6mlwRA09TyVXrb
 HnoB19726KtN9xYgBcpTnkAsa9qBznhPlICOMqUItKYjOW81dAQLsSiLcKhgeQYxEXGIZmpN
 Ndm4YXMqyHMbFRt7eJ3OGAe+xQt+VuGsiT9K7jJg5WPHRXgsJbnn1E43igYytLrdl9dOYE/c
 Gnl7l6TlObEBx9AqTLZEXtHdKz3OEju6iWKyLubCRXljVm4wnYjIIT0nCjr2YjujV0r9ZSkl
 Qt6zaJn5lKPJmAu2/hPgLohahrpA==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="292621662"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="292621662"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mga01b.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May
 2022 02:24:59 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEB4110E646;
 Tue,  3 May 2022 09:24:58 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C36110E646
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569897; x=1683105897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1E27ttVE2ySsvZLN6ssEqapYFa5UNYHoluV2HJmTz3k=;
 b=HE85tUBUPZs+epqf06FTcA8aZcGDk6U03l6fLTeKbZRkcrXsXavwBgic
 bW7SytfvKq4X4X1whvv9CuNybHK2jJY4ljZcOvcDNEFeg1h9VwrRYlEnx
 ArCcBEzo1q1rqauummdMZPF49LblKrRLYqedJv3QEmJAYu8H2GQWUiTGs
 SkE4QCJlsKSV/dFfEEu8U+N7vBMKHA0VpdXIDrdU8071L7aL8j8lQrb2n
 fwNjwMqjic8kvZVRMfwtiC0cwlVT1uX80qoJLYkXvGsghguzNB2nKpkAu
 qg/I6n+LwyWXw4SWj1HawGFOxwhnAQyfFkD5sBOLoRrusbKtJvueWsZCi A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="249415573"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="249415573"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:57 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="598996134"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:23:54 +0300
Message-Id: <0b9e7f136854055a14b826097160fe0b43b9f3d1.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 09/20] drm/edid: convert
 drm_edid_to_speaker_allocation() to use cea db iter
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
X-BeenThere: dri-devel@lists.freedesktop.org
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the cea db iterator for speaker allocation. We'll still stop at the
first speaker data block, but not at the first CTA extension if that
doesn't have the info.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 47 ++++++++++++--------------------------
 1 file changed, 15 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 5c3e2ed53012..7d6bf0b2bd9e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5069,42 +5069,25 @@ EXPORT_SYMBOL(drm_edid_to_sad);
  */
 int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
 {
+	const struct cea_db *db;
+	struct cea_db_iter iter;
 	int count = 0;
-	int i, start, end, dbl;
-	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid);
-	if (!cea) {
-		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
-		return 0;
-	}
-
-	if (cea_revision(cea) < 3) {
-		DRM_DEBUG_KMS("SAD: wrong CEA revision\n");
-		return 0;
-	}
-
-	if (cea_db_offsets(cea, &start, &end)) {
-		DRM_DEBUG_KMS("SAD: invalid data block offsets\n");
-		return -EPROTO;
-	}
-
-	for_each_cea_db(cea, i, start, end) {
-		const u8 *db = &cea[i];
-
-		if (cea_db_tag(db) == CTA_DB_SPEAKER) {
-			dbl = cea_db_payload_len(db);
-
-			/* Speaker Allocation Data Block */
-			if (dbl == 3) {
-				*sadb = kmemdup(&db[1], dbl, GFP_KERNEL);
-				if (!*sadb)
-					return -ENOMEM;
-				count = dbl;
-				break;
-			}
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		if (cea_db_tag(db) == CTA_DB_SPEAKER &&
+		    cea_db_payload_len(db) == 3) {
+			*sadb = kmemdup(db->data, cea_db_payload_len(db),
+					GFP_KERNEL);
+			if (!*sadb)
+				return -ENOMEM;
+			count = cea_db_payload_len(db);
+			break;
 		}
 	}
+	cea_db_iter_end(&iter);
+
+	DRM_DEBUG_KMS("Found %d Speaker Allocation Data Blocks\n", count);
 
 	return count;
 }
-- 
2.30.2


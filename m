Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900942205A7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD446E43F;
	Wed, 15 Jul 2020 06:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF836E39C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 05:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=WnynRIMfITaZMYZcNLabagyEgxDCBTufX2A0jcLZF0o=; b=TlraVXkm1rHpK1VF8Yo7dwSrUE
 WTobD94OaIOiMsU5X6a+VpyrWzgXlZCFdTeQHguytfv2zJbuPYCaFdDUN2L81O0cJiAJBB9BkpedU
 LqUcegPY78oIgAvN5fDa/L685DVMXpwgTFhcSJ9qLVRVvJ5aaWajsgWPFuBfvTyg2jSnIRMy0oZOE
 ZxoxopJ02m2prVxxGZDZ3JLV41XbeG+tD0wHoieon/IkZhOOmlq9EPOiEVhnQ+qiBvHmHGyxuvmiP
 PI3kl9vsAnZOM1aT9JA5dRA98UE9/vSAdxBFPKMbNVTbag+IW0rrXsm34eHy+DjOtk0DMrZaQfFQt
 OMBArcUw==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvZtf-0006Vd-3V; Wed, 15 Jul 2020 05:23:59 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] drm: i915_drm.h: delete duplicated words in comments
Date: Tue, 14 Jul 2020 22:23:47 -0700
Message-Id: <20200715052349.23319-5-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200715052349.23319-1-rdunlap@infradead.org>
References: <20200715052349.23319-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop doubled words "the" and "be" in comments.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 include/uapi/drm/i915_drm.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200714.orig/include/uapi/drm/i915_drm.h
+++ linux-next-20200714/include/uapi/drm/i915_drm.h
@@ -55,7 +55,7 @@ extern "C" {
  *	cause the related events to not be seen.
  *
  * I915_RESET_UEVENT - Event is generated just before an attempt to reset the
- *	the GPU. The value supplied with the event is always 1. NOTE: Disable
+ *	GPU. The value supplied with the event is always 1. NOTE: Disable
  *	reset via module parameter will cause this event to not be seen.
  */
 #define I915_L3_PARITY_UEVENT		"L3_PARITY_ERROR"
@@ -1934,7 +1934,7 @@ enum drm_i915_perf_property_id {
 
 	/**
 	 * The value specifies which set of OA unit metrics should be
-	 * be configured, defining the contents of any OA unit reports.
+	 * configured, defining the contents of any OA unit reports.
 	 *
 	 * This property is available in perf revision 1.
 	 */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

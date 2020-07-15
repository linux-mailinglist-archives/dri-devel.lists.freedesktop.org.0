Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 548842205A5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBF36E444;
	Wed, 15 Jul 2020 06:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396C66E391
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 05:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=HXh3ski+GPcGZpvJ68cKeSX8JRfurQWDErJFFmRJGeg=; b=BAxPo9MnajgoZdIO8PwLphY/qr
 8t2T/7knbH63dDEaFnE9kDzUlLPRHzN3jNlg9NQRMjoikd3/+CAsxqkrHEqr1av/yjXWKL/VIbps/
 S4EOTAAmcaYdtGc7ctlc6E9OoeUqT/TJ//lnfBAyEG9aRHGagotNllFmG9I2W81ZjoG+tWbndlqt2
 31eGzF4IHaSKdGEIVNgfRBf50V9s+TDL4jGk8OkP+Yk+0la/xxSW63O6kRTq8EneCrEKLYdQK7pKD
 hXXige4rGDEW3IDBQeY28bDuQViKSH8Bf7gkRAL3sKlFDv+/iVsB7XTP8UwSWn54zst0qBwNfXsJ8
 yaz9JT5Q==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvZtX-0006Vd-Th; Wed, 15 Jul 2020 05:23:52 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] drm: drm_atomic.h: delete duplicated word in comment
Date: Tue, 14 Jul 2020 22:23:43 -0700
Message-Id: <20200715052349.23319-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
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

Drop doubled word "than" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 include/drm/drm_atomic.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200714.orig/include/drm/drm_atomic.h
+++ linux-next-20200714/include/drm/drm_atomic.h
@@ -103,7 +103,7 @@ struct drm_crtc_commit {
 	 *
 	 * Will be signalled when all hw register changes for this commit have
 	 * been written out. Especially when disabling a pipe this can be much
-	 * later than than @flip_done, since that can signal already when the
+	 * later than @flip_done, since that can signal already when the
 	 * screen goes black, whereas to fully shut down a pipe more register
 	 * I/O is required.
 	 *
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

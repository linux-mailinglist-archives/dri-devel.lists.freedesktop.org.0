Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C4184937A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 06:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4A5112392;
	Mon,  5 Feb 2024 05:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="saBm3e9u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB71112392
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 05:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=rtk1/1Oqfan3c3AyvrsnNRZo+2UCl3bzkD+9KBjYrMc=; b=saBm3e9u4HqxkJQ7SSjNaKcPn1
 bqQmT3CM2JwC7i/jn13A2Vn3tp+e42Em/Q2Q3k3idLpMXDyliuBPDg7sXHrChu7vtJgORRuWAN5jC
 RgiTy5WNjA62ZRCx4qyLTLCCZuSaCqfN015r5wMxnDbDBqgyIPxUWy0E3HWW5ADv2kyOpGxtJMphD
 GceDoNbACxn11c8W1CUH2rMhTbGl3/W958nLQdcElp8INVfTY1dGYSjWxy9qUKSwHEikRGdEd3yId
 tpP0YfuIU3vnCxvve24e5j3wL6EjM36c3G3tc2MOjtL9MG3ujNLV8zdNUUx4I4tFtVnzSqAu7ZqCV
 Nm8L0TQw==;
Received: from [50.53.50.0] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rWrj3-000000025xu-2ggJ; Mon, 05 Feb 2024 05:41:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] drm/rect: fix kernel-doc typos
Date: Sun,  4 Feb 2024 21:41:01 -0800
Message-ID: <20240205054101.27929-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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

Correct typos of "translated".

Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: add Reviewed-by, rebase

 include/drm/drm_rect.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/include/drm/drm_rect.h b/include/drm/drm_rect.h
--- a/include/drm/drm_rect.h
+++ b/include/drm/drm_rect.h
@@ -129,7 +129,7 @@ static inline void drm_rect_adjust_size(
 
 /**
  * drm_rect_translate - translate the rectangle
- * @r: rectangle to be tranlated
+ * @r: rectangle to be translated
  * @dx: horizontal translation
  * @dy: vertical translation
  *
@@ -146,7 +146,7 @@ static inline void drm_rect_translate(st
 
 /**
  * drm_rect_translate_to - translate the rectangle to an absolute position
- * @r: rectangle to be tranlated
+ * @r: rectangle to be translated
  * @x: horizontal position
  * @y: vertical position
  *

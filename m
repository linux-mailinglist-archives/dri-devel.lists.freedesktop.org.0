Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A297B82631A
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jan 2024 06:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3518210E053;
	Sun,  7 Jan 2024 05:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D276110E053
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jan 2024 05:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=GK75hswHbptiElM1VpVJwVBjfuxG16GwBE9vIgYAskc=; b=Xq7MB5meLEo2infRm0jmSR5qz7
 qa9ES8pBmV3NeKfNpJQ27QvNdnQs5444mwfRdtGb0LgzUG6vvzlcmttPQ72ekgyIeUA3jo6rUuYFB
 EEy0dkTOtkvjuv95T8UVgRXxhviwu0Kq1J6dFDMSiSOzsknK0u5BUlitlZ5dFLSRr9G1A4Tf/uJkw
 +lDNgfpYEHhaEsoMKFlplPp+VNR7w1wVAXlmaNrZpwI5DiqfcGssFazKGUht3sExoGqdgyTgYLW4S
 vJc7GDGahsiR7oI+bpZzP32YIKbQdtymT6Ddad3Y6H+XL27cNaQvIGR/RRav9ji6rYZRMUF+ki/eo
 +OrPDMSA==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rMMAS-002RGq-2E; Sun, 07 Jan 2024 05:57:52 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] driver core: component: fix spellos
Date: Sat,  6 Jan 2024 21:57:50 -0800
Message-ID: <20240107055750.22441-1-rdunlap@infradead.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 "Rafael J. Wysocki" <rafael@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct spelling mistakes reported by codespell.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/base/component.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/base/component.c b/drivers/base/component.c
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -751,7 +751,7 @@ static int __component_add(struct device
  * component_bind_all(). See also &struct component_ops.
  *
  * @subcomponent must be nonzero and is used to differentiate between multiple
- * components registerd on the same device @dev. These components are match
+ * components registered on the same device @dev. These components are match
  * using component_match_add_typed().
  *
  * The component needs to be unregistered at driver unload/disconnect by
@@ -781,7 +781,7 @@ EXPORT_SYMBOL_GPL(component_add_typed);
  * The component needs to be unregistered at driver unload/disconnect by
  * calling component_del().
  *
- * See also component_add_typed() for a variant that allows multipled different
+ * See also component_add_typed() for a variant that allows multiple different
  * components on the same device.
  */
 int component_add(struct device *dev, const struct component_ops *ops)

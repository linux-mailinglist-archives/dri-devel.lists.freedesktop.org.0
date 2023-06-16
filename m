Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA097330F5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD51F10E609;
	Fri, 16 Jun 2023 12:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB0910E609
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:15:08 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 949253F36A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1686917228;
 bh=HXrbrNjx5wkbmZikN4dyh9skh67sgOUdUExxc/zzJTU=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=C5vVY7DCWb+XWlyf/eb8f6T/8YVm+QwqG8ki5qc2Jah4kCjENpXIzvQySs9Rj8+Ec
 gvaj6b0YcuvJ77JLp9POeFUq50DZ7FX5Sax08VMH3/5ehnvhFHV/UjAr07GfiKjB0w
 LLtei/zyHGvtjjiLPgU8R2b7JUiHsJch3BXIBlZhPQGicry2p/t1QU8jI+ty1eHDzL
 ffWbJnmgYHZaVwcpAKpaQkRF0tYANx+UdIo5pYK8KvEhEBOEHqLW/yUbe9OUIFdJcY
 Vzea1orGhINbxLkDgtdDXQgMDhMLI2bX8DIvAX8N9UO2WTvowN1NUv//pTL9w9hA3m
 DH5eiboAuYqnQ==
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30e4d85e1ffso800498f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 05:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686917228; x=1689509228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HXrbrNjx5wkbmZikN4dyh9skh67sgOUdUExxc/zzJTU=;
 b=j02EOxYC8mghCfKMWHZEkyVJWWX8hh9tVM6lykSqlQj6Z0d0xQbm9MFrNatSu8ZUd7
 bNPLrGHLRlM4xdYgDG4AshGFNjGAOJvad7zhMBJrQjZ/9WzgRuWwLvAGjKrXvIkvCZZX
 lmc9REcgQKUmTMmFx5BMFooaPuZ6llwFNVO8B+bEXPOotqH64l4e9pM0UrlUHy/VnqFo
 qBsP6fqK2cpfYuha4q9hrqMEbkaC+VLRrGQMDLPM7ScRlewj+5m8bQGO5NSJnwdkoUVw
 k5p75PLMj/2a3dMIZ6wWUjEBmeanOyHEOwN4f9sl20e0h/IltFhnbOjgkNFGYQYNM5F6
 WSGA==
X-Gm-Message-State: AC+VfDw0gjulejcf9HvWUMk3NDDX0nwYkpXk/KvJt3nKVz+UuPT8mc4O
 cYp8q+1uu9084p14q34Lvkd9Do2yDhmVduI1wGyAdpSb0vRyE+eloMApmL6ei0ntQoOZx/PaoS3
 vnLG2LycgNVvP97vjwiN8gsRVjqQgrAoYxvRi5NBLJStguA==
X-Received: by 2002:adf:f30b:0:b0:311:1390:7b55 with SMTP id
 i11-20020adff30b000000b0031113907b55mr1318545wro.68.1686917228274; 
 Fri, 16 Jun 2023 05:07:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6y5XukSe+P9vq+zfXWohqAIWdKqIQWbdE7ej4TGZZFMtoW9oJ1tfvYWN7PDP7vhBlrCWHGmQ==
X-Received: by 2002:adf:f30b:0:b0:311:1390:7b55 with SMTP id
 i11-20020adff30b000000b0031113907b55mr1318529wro.68.1686917227945; 
 Fri, 16 Jun 2023 05:07:07 -0700 (PDT)
Received: from localhost ([194.191.244.86]) by smtp.gmail.com with ESMTPSA id
 q7-20020adff947000000b0030af72bca98sm23428851wrr.103.2023.06.16.05.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 05:07:07 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: deller@gmx.de, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: broadsheetfb: Add MODULE_FIRMWARE macro
Date: Fri, 16 Jun 2023 14:07:05 +0200
Message-Id: <20230616120705.1030177-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
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
Cc: juerg.haefliger@canonical.com, linux-kernel@vger.kernel.org,
 u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The module loads firmware so add a MODULE_FIRMWARE macro to provide that
information via modinfo.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 drivers/video/fbdev/broadsheetfb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index b518cacbf7cd..678d182d187d 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -1223,3 +1223,5 @@ module_platform_driver(broadsheetfb_driver);
 MODULE_DESCRIPTION("fbdev driver for Broadsheet controller");
 MODULE_AUTHOR("Jaya Kumar");
 MODULE_LICENSE("GPL");
+
+MODULE_FIRMWARE("broadsheet.wbf");
-- 
2.37.2


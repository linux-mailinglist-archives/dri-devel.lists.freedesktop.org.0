Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A557245A9DE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 18:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84CB6E197;
	Tue, 23 Nov 2021 17:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7906E15D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 17:01:42 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b12so40118475wrh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 09:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YAopufrfMZ51IGtrg3jTbLpMge5spZgYt27uOrZnXBA=;
 b=nKO46A64Nn9kSMXB1SEY4C49GXR5FBaHOG0W6j27DYcBsFT/YWWtkBApRX3vpIupGx
 B5e/ro1ZWXln9QHkxTIBAbazIcHlLJfN2WKs+2PmfwVGAyN4qbYg7BDb0NspnbJfdUz0
 4UGCPZCuaGaBNUebs3MRN8Mr1DPg5902DGzdR8+8DoNMI1ldmpsxJ2FrltYEBz/EMfVY
 oAZhcou27Z8/yA4ImlANkG/bch0t1cz/LOzwqEud9sxhCcPv91HbOUBn7sxTNid1Cvoj
 7kgj+TmvY7jhfdWEN01iCaUrH3qvgCoV7pzTQl8eGgQEYGinm8iMpv3tVWJc8CBogTgd
 43zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YAopufrfMZ51IGtrg3jTbLpMge5spZgYt27uOrZnXBA=;
 b=MWauzGlbNJLjfG6N9TKGe4IpoiPK0BmG+ZeTUhq83XXL9cAd8JCXjEQEIiQA/d6PHL
 LtVsawROXHjVlqf/PQ/EO+PyuLElyXQEdo6b6erl/qzvojxUp4Ww2pRiDAdkCu/zBrYR
 e2yuhoTKYVyT8q8EB2BkFr0rvCiOOVjcoNRi23+4ZYOVMT3lhiThoIzR7N5tNSz5bwb7
 YZI5fwb1vYF2RytWcylUF03t7DegjyDBVFlgRq9k7xN3Lkaw8wmbgXy8Lxe04LEDRdPp
 nyPMwFvrfAFyu2JTXKcW7AjwaUqnOK8B9czXHlHkXLzQZygmB2AIhy4Q39vF0A7U6aUf
 Mi5A==
X-Gm-Message-State: AOAM532/Z49q6a8hcgTbhzYbQmxO6+ceGK9JpsrqrV3ecwu4+lWzHoCS
 uKWFa/Xyj3kIkviS5Nv+RFY=
X-Google-Smtp-Source: ABdhPJyetI47JKwVIheOYqRKaeL4OcjedUkDWkJjuz1rRSB94ig0upCTfPO3LxIRnBqG2ICTzaw1NA==
X-Received: by 2002:a5d:4b8a:: with SMTP id b10mr8858909wrt.413.1637686899505; 
 Tue, 23 Nov 2021 09:01:39 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g13sm17380689wrd.57.2021.11.23.09.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:01:38 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/doc: Fix TTM acronym
Date: Tue, 23 Nov 2021 18:01:26 +0100
Message-Id: <20211123170126.28446-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Nov 2021 17:20:14 +0000
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
Cc: tzimmermann@suse.de, corbet@lwn.net, airlied@linux.ie,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TTM acronym is defined for the first time in the documentation as
"Translation Table Maps". Afterwards, "Translation Table Manager" is
used as definition.

Fix the first definition to avoid confusion.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/drm-mm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index e0538083a2c0..198bcc1affa1 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -8,7 +8,7 @@ the very dynamic nature of many of that data, managing graphics memory
 efficiently is thus crucial for the graphics stack and plays a central
 role in the DRM infrastructure.
 
-The DRM core includes two memory managers, namely Translation Table Maps
+The DRM core includes two memory managers, namely Translation Table Manager
 (TTM) and Graphics Execution Manager (GEM). TTM was the first DRM memory
 manager to be developed and tried to be a one-size-fits-them all
 solution. It provides a single userspace API to accommodate the need of
-- 
2.25.1


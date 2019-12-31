Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E7C12D8AF
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 14:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C9089ECD;
	Tue, 31 Dec 2019 13:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D38E89ECD
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 13:05:47 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id b9so19512777pgk.12
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 05:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GHERosgBsujakP2B/I6YHrJDTfsLICVpu4z4584lwQw=;
 b=Z9lmykbL1nS45J4e96jiJrcedroR8CQp8/MeoSvUrSO/T8/6PwYaSv4AglTj72wHS8
 TEehWz56jErqgZn5HhjOH/Ea8HEBcam9LJPgZi8vJvfIbZO03k+uNYgiAnX/eFP938py
 Gcm3jjwouXbnUzeY6J7ALjylcPQEVRXGeFhyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GHERosgBsujakP2B/I6YHrJDTfsLICVpu4z4584lwQw=;
 b=AbWUISfIMYzG4X9QzLBxre5Zuj6a61QBbRlAm+Gd0YwSPi4FM4Avl+ACmF8QY8ZHK2
 1DdjRUHtjr6JEESgyU8FURsHUcuXerzHN73z9lEFpyGts2eWEV7XMVq3VwWkHZ6iIU9v
 l8DezyCWb3d+i66Y8HtzzekS8kaL2cOGvdB5LtZfMO0ctVP9bLuUW5V6Nz5x8Vheh/me
 Ok1szmu4adK/2sAFY3ccfghNCgbAZEwAXf0Wshy4M2c1r6UWW9HUaMjN06oaRY5cZtFz
 rhKvIdKGTOorEVXFEP4P2UnnEj7j3daln3+UUmWcX1NDL4KqZsqFKlpjkziW6wGrA8IQ
 N1Wg==
X-Gm-Message-State: APjAAAVDm+MZ1yVHEd/m42LP/xx8DiLiGLGU/SkXUG98BuDNQAxCELF9
 RVWJYQf8YrDrb0oneZ/WjMZt+A==
X-Google-Smtp-Source: APXvYqw2sViAJoSwquTTS8URdM3Gc8OxZVcyoU64PLz9q9NvLdSS35ykWYOHT21Xmz7I1N3x+F2elA==
X-Received: by 2002:a62:a21e:: with SMTP id m30mr67506229pff.56.1577797546877; 
 Tue, 31 Dec 2019 05:05:46 -0800 (PST)
Received: from localhost.localdomain ([49.206.202.115])
 by smtp.gmail.com with ESMTPSA id i3sm55204089pfg.94.2019.12.31.05.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 05:05:46 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 1/9] dt-bindings: display: Add TCON LCD compatible for R40
Date: Tue, 31 Dec 2019 18:35:20 +0530
Message-Id: <20191231130528.20669-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191231130528.20669-1-jagan@amarulasolutions.com>
References: <20191231130528.20669-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Like TCON TV0, TV1 allwinner R40 has TCON LCD0, LCD1 which
are managed via TCON TOP.

Add tcon lcd compatible R40, the same compatible can handle
TCON LCD0, LCD1.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes for v3:
- none

 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index 31ab72cba3d4..9e9c7f934202 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -160,6 +160,7 @@ Required properties:
    * allwinner,sun8i-a33-tcon
    * allwinner,sun8i-a83t-tcon-lcd
    * allwinner,sun8i-a83t-tcon-tv
+   * allwinner,sun8i-r40-tcon-lcd
    * allwinner,sun8i-r40-tcon-tv
    * allwinner,sun8i-v3s-tcon
    * allwinner,sun9i-a80-tcon-lcd
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

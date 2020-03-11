Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F6B182ADC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BBD6EA7F;
	Thu, 12 Mar 2020 08:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED5289D56
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 12:51:48 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e26so1972236wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 05:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pSjQ4E8m+1eJQtkq/G98lOplM8W5Ztx8OcIT9w8yzWE=;
 b=kQkT9EzwcJjSKnzy+NKeVejeHTj4PwXiL/sGNgNxD5ZaWR1Gl4dCKxja87SheHDQx8
 8ImI4VYg/nu2S/0ClrmWEnr6KQdwgfGkKdeJTWlsiUdtSndr+6MSPgLEEEkYReUq2I6Z
 ewMbunHmOqMd8boJ6bNii0vJ/3rk22U87HDVcTTNjcPquRyC9zgyzOpedudW+3mXbto3
 tTxmNB0bKRk1v3plqEL1e80H9WeG2y+c87mZ/NQgjm4/5xWWXoG9XwC6FQ7zuG0rjyux
 NHYjgZvKrZmraz7RY5iLoHN2kGtHKJDT1tII7t5pzU+PSHso8d885+MUdvpWMQYVox76
 GiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pSjQ4E8m+1eJQtkq/G98lOplM8W5Ztx8OcIT9w8yzWE=;
 b=KwEBv/p9ywGxTqTmIW/TprUAgHKDnvzNmavl+Ed+qegNmD4lGmXLRpuBo9Qhx1mCX+
 P5qgC+pyggg9gPjnJ/xxdCk5MOb6i4jGM2LZSQHj5W2DUu6WY3pegC6s6sEK7dm54hp8
 Yfn53WS1Kvxw3NGrMRhsYGkyWY3Q2qfNDVdKQNROMFR7xkZUw0cd4LpjIPyqx/INuyyD
 uvpdLL1OyC71B5wTKQ9B6Nw2JAfmwpNzhqTsI9vQFoOfSoGC+YLpGuhoq504M7Nx/KW4
 DvLEg5Mn2yXPivORvji7koc3h9uLaezvJSYBK+cKHHM4aHiD1TKGtxJgiH+ic+DJqQgd
 jjsA==
X-Gm-Message-State: ANhLgQ0LPV61B6qTd5W6WM/Oxjf+wHhuoiOyFNwd5a6QeqdblzfIplqN
 QLap9kyCQQ2fbZOO2i/coN/CZA==
X-Google-Smtp-Source: ADFU+vsqrlP7LpT3iV/tyxVYbgWkwmJe3brNDlGyKZHhOh2/BIESgTAtpdl5ra7zbk0yaBxY2Y4sVQ==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr3806905wmb.16.1583931107436;
 Wed, 11 Mar 2020 05:51:47 -0700 (PDT)
Received: from robin.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o3sm8843538wme.36.2020.03.11.05.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 05:51:46 -0700 (PDT)
From: Phong LE <ple@baylibre.com>
To: narmstrong@baylibre.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com, a.hajda@samsung.com
Subject: [PATCH v2 4/4] MAINTAINERS: add it66121 HDMI bridge driver entry
Date: Wed, 11 Mar 2020 13:51:35 +0100
Message-Id: <20200311125135.30832-5-ple@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311125135.30832-1-ple@baylibre.com>
References: <20200311125135.30832-1-ple@baylibre.com>
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 dri-devel@lists.freedesktop.org, stephan@gerhold.net, jonas@kwiboo.se,
 heiko.stuebner@theobroma-systems.com, Jonathan.Cameron@huawei.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 Laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
 mchehab+samsung@kernel.org, andriy.shevchenko@linux.intel.com,
 sam@ravnborg.org, davem@davemloft.net, icenowy@aosc.io
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Neil Armstrong and myself as maintainers

Signed-off-by: Phong LE <ple@baylibre.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 37c2963226d4..3d722d723686 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8977,6 +8977,14 @@ T:	git git://linuxtv.org/anttip/media_tree.git
 S:	Maintained
 F:	drivers/media/tuners/it913x*
 
+ITE IT66121 HDMI BRIDGE DRIVER
+M:	Phong LE <ple@baylibre.com>
+M:	Neil Armstrong <narmstrong@baylibre.com>
+S:	Maintained
+F:	drivers/gpu/drm/bridge/ite-it66121.c
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
+
 IVTV VIDEO4LINUX DRIVER
 M:	Andy Walls <awalls@md.metrocast.net>
 L:	linux-media@vger.kernel.org
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

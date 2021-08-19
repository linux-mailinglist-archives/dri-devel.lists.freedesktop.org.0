Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A8A3F2769
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702D96EA14;
	Fri, 20 Aug 2021 07:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC156E988
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 08:41:30 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id k19so4841918pfc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 01:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9pbcm30VIAQ9iEVPI1FIF1aW9JXXtwoO9LwunNGqeRE=;
 b=uQ+TV2dmDfLzGr1GVXfjxEdsSOSUyKADcD9YJ/DldFGx161UmaoatkQNUwJtppzWdE
 hJFXNJE4hsWMM4SJNU+Df4CeN/NI4Rhm/TOiqtw+d6ZN5zl0laiF+hCSeBHN0Vi+Olnw
 Zy6eLN3eVzA9s2P8+FT4jpCYa5mHeklX+0RlrYgq2J+UgIJsoZ57jSvAS4uf+Bkh+lyV
 8o1FFJaAg9qzYDfNIY9FJWJnAe0xEGIl5w/b8ziyoWMKFxFUBYnL4NYHqNb8gWP0dX2u
 OGWOaS6UCqPv/RHUgUTm1tGu5Cc1lxL6dc/k5gGwWFqIt4Wy1ymo/rDqZ4u1Jj4wLXXx
 4DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9pbcm30VIAQ9iEVPI1FIF1aW9JXXtwoO9LwunNGqeRE=;
 b=QR3kwfw/+W+YK5gmLgLYLpeduflpMThRIMtUcr56Tq7qXi1lqSZMQVPaQPjcBlNd9m
 5u6xFfU3qDSsYwYrdyR9GE/aVU2nSG+LYDAN606CnSnmuTNWd9G+BvOJqMmFaAkYis/m
 oxX9PcUEqx+ZlrCN+YIryDK0uqy9szBJcHxDe586lpRH4jd2Zo259MZnBB8jtLtXzMs/
 7sV+QVLWpmY8UddI4ICNTZSmSr0TX3/iPv/KqRF2mIAin7giNBef5sAD/nFAD9ec+GGG
 fot40PgE8R6pHyw7+cY5PUU3I6X5YkWykvXt+qOAudFLrkB9biSbgKqEPTXRr1n/m8rD
 lgGg==
X-Gm-Message-State: AOAM530UOsauTH2fxzWDXyzKH5ZIlyRVSDArDotl9mPdbAqQf/dsckEm
 3pSz+R8N5dX1FjzmIgSLmSaJ3w==
X-Google-Smtp-Source: ABdhPJzR04yhvKJlt13IzOaH4nIHK2sk5Tc60iEvZaCr6+pEZukHAif4mEjTv24VWeEydJ7NwjmMkA==
X-Received: by 2002:a05:6a00:1484:b0:3e2:51da:7a1c with SMTP id
 v4-20020a056a00148400b003e251da7a1cmr13353848pfu.56.1629362490548; 
 Thu, 19 Aug 2021 01:41:30 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id c26sm3027492pgl.10.2021.08.19.01.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 01:41:30 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v1 2/2] dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a
 3.3V rail
Date: Thu, 19 Aug 2021 16:41:11 +0800
Message-Id: <20210819084111.717459-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819084111.717459-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210819084111.717459-1-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:16:30 +0000
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

The auo,b101uan08.3 panel (already supported by this driver) has
a 3.3V rail that needs to be turned on. For previous users of
this panel this voltage was directly output by pmic. On a new
user (the not-yet-upstream sc7180-trogdor-mrbland board) we need
to turn the 3.3V rail on.

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 38bc1d1b511e..e45de7a4360e 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -36,6 +36,9 @@ properties:
   pp1800-supply:
     description: core voltage supply
 
+  pp3300-supply:
+    description: core voltage supply
+
   avdd-supply:
     description: phandle of the regulator that provides positive voltage
 
@@ -52,6 +55,7 @@ required:
   - reg
   - enable-gpios
   - pp1800-supply
+  - pp3300-supply
   - avdd-supply
   - avee-supply
 
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3456620FA0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 12:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AEE10E3F6;
	Tue,  8 Nov 2022 11:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDC810E3F6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 11:57:15 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id m22so731354eji.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 03:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kVfGNdtNg+zCQhJb8JnZXraJEUpvWY2XlNM2DVwiefU=;
 b=Es1qARbsX7RS0Xd92HZZOXqamwXebEAT3D2rXZ3242oq86HzzlEKeouCKkE0VHuTdS
 wV5oVWbgvc1NgAKIFqN8aujoG++ihft46CuIV9EBKh+8ZOeAr+ECVeYP3n7kbgEcJzqU
 PASmZvErmpFvngKyJXPLWQGHor2Qink3rJUPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kVfGNdtNg+zCQhJb8JnZXraJEUpvWY2XlNM2DVwiefU=;
 b=OvDa5BCFvr8K5uKWdFrHeyF46yZD5Z6FYFMXt00v/sKn7sMwuJ/JQ+Rz378HsdDM4k
 OsTfcJ2dflMMRMmkqXcRgVYV7yLuOPCrRF64I/BRBP/JiN1HP7a4VP6ilXbnWU0njY92
 k6OJHdA1Ai6C75XGdj51W3+C1ppZRUK8OdBM1oDrMGnHB7Fm3Qum7qutkl+m2c0gtZ3F
 a/DDQuqEspUpbh4MhZvYEFBb8hZLtv9mmDfya8lUt1uOFgTSvAAp0UK96y1A29YJ43cD
 VTeZwGGZ4y7xhsp2xBWshPekH6m7letiM2iIg8RrI6YIsWbGrYK/ku812M1e6jRwOxq+
 5xQg==
X-Gm-Message-State: ACrzQf28OvS9j6UZ5jdzp9W76lTVylwuZ/IaHu8mtcMkGC0ldKq1oum7
 5i83jvqeGZqCO+vI2U6JjBNvs74neEANKw==
X-Google-Smtp-Source: AMsMyM5BuaFCyJpqFWdC5RbAV59Rp2Hk0lf/tuzgBE7M6wyhtpIcHG60tUWHoycUppUGF1bFN6wtdw==
X-Received: by 2002:a17:907:e8f:b0:7ad:923a:5a2c with SMTP id
 ho15-20020a1709070e8f00b007ad923a5a2cmr51867849ejc.736.1667908633613; 
 Tue, 08 Nov 2022 03:57:13 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 ky26-20020a170907779a00b0073cd7cc2c81sm4513201ejc.181.2022.11.08.03.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 03:57:12 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] docs/sphinx: More depth in the rtd sidebar toc
Date: Tue,  8 Nov 2022 12:57:07 +0100
Message-Id: <20221108115707.1232621-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We love to nest our documenation for good structure, but that means
the table of contents needs to keep up or you can't navigate them.

Realized this trying to find the drm property documentation, which
with some shuffling around disappeared. Why I didn't realize we can do
this earlier, no idea.

Since the relevant parts of the toc are only loaded if you're in the
right .html file there's no harm in going all the way to unlimited.

Note that this has no impact on the alabaster theme (which has a much
simpler sidebar toc which doesn't show the entire hierarchy, only
what's in the local rendered file) nor on the various :toctree:
rendered inline in the output.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
v2: Rebase onto linux-next, reword commit message to take into account
that alabaster is the default now.
---
 Documentation/conf.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index c715610d6297..a5c45df0bd83 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -296,6 +296,10 @@ if html_theme == 'sphinx_rtd_theme' or html_theme == 'sphinx_rtd_dark_mode':
                 # Add color-specific RTD normal mode
                 html_css_files.append('theme_rtd_colors.css')
 
+        html_theme_options = {
+            'navigation_depth': -1,
+        }
+
     except ImportError:
         html_theme = 'alabaster'
 
-- 
2.37.2


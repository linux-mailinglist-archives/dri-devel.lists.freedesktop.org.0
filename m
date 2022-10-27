Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9325960F597
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 12:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509C510E396;
	Thu, 27 Oct 2022 10:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8685B10E396
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 10:44:10 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r14so1959375edc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=giuiXYYLk+f5QLS50ASlMusr4jOA07sul4BoLmCP2Tg=;
 b=IN9rKSLQysrc1zS8/Aoy0aq5vrB08zsUfVBZNbxbclZikymid0Wk8I3Lp7v/HwF4GB
 rV8Ar7hRJgWBBNYj406pMQkOXFslXJbPhUoLOUPKAWyYwJWp1C532zZC3zoKvfAHbSjS
 KRHuRUanvg2fCyM5XUnSGVsrL4XRBVeVYoWHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=giuiXYYLk+f5QLS50ASlMusr4jOA07sul4BoLmCP2Tg=;
 b=SnQuPX6q/stpITzMngizEHFmw7kono+101zLYz5ubp636HHj57C1Kp/M1PlEynf3Bz
 33H/dIJ3pLfjrmUnJCzlBk5XgIdXe6skuupi2l+zze3y5b3ielowGosvZFVV69Jaoiov
 imJrih4Bi6W11BsPpoa6U4sI5E+fR6EhQzTFrwSfzO1uWQQlAEd/bOrw34dnKP0FF2Gf
 U9PL2SyzmqTsGzY0miXGp808sOZmVHGZ7bRyJtBisz+xfEmbkfdDUawJFNuOPbwfpQU2
 iZxTcAN7t0FXigb/wqZfASqVAjJZPIurgEZnm1kUO3UWoKbH20bP3lZThPgU5GqseOjB
 81WA==
X-Gm-Message-State: ACrzQf0gUIKaPHWlw96VXnQ9pGforkk8RHncV1v/bFyOxA+UFWlNeX8+
 9cF8lZwPhbKLBus0fc6NCm09fSI8MlJaSg==
X-Google-Smtp-Source: AMsMyM7YmuQMOzkUROoct74BrEyBOXOY61+z4zYghz3wpEMzNkYu5jz8gJBxDNSYk3HcGTxe4XoSaQ==
X-Received: by 2002:a05:6402:5291:b0:45c:3f6a:d4bc with SMTP id
 en17-20020a056402529100b0045c3f6ad4bcmr44696532edb.285.1666867448979; 
 Thu, 27 Oct 2022 03:44:08 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 n1-20020aa7c441000000b00461c6e8453dsm774012edr.23.2022.10.27.03.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 03:44:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] docs/sphinx: More depth in the rtd sidebar toc
Date: Thu, 27 Oct 2022 12:44:06 +0200
Message-Id: <20221027104406.549734-1-daniel.vetter@ffwll.ch>
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

Note that this has no impact on the classic theme (which doesn't have
the sidebar) nor on the various :toctree: rendered inline in the
output.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/conf.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 934727e23e0e..5dc141c66726 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -240,6 +240,10 @@ if html_theme == 'sphinx_rtd_theme' or html_theme == 'sphinx_rtd_dark_mode':
                 # Add color-specific RTD normal mode
                 html_css_files.append('theme_rtd_colors.css')
 
+        html_theme_options = {
+            'navigation_depth': -1,
+        }
+
     except ImportError:
         html_theme = 'classic'
 
-- 
2.37.2


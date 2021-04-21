Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A96F5366F28
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 17:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1836E169;
	Wed, 21 Apr 2021 15:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679276E169
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 15:29:18 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id n2so64094056ejy.7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D9cYeQjsmbm7N0G9SYYKqixFynKO7BLL8/PiYxQrUa8=;
 b=fqmuic3T8AViijvn37YC2oVQ3UZMI91TNv+sw9WgBE7Xko6RqLRtVla393BsYNt0l9
 mg4OguqTMx2HIAiGp6p5/x3MRO4GcoeNQExUzWDSSpb9aZ+Qefvp38yPPLIBniR41hC/
 vUrDCjQbpQ6f3/aO1kksxic7p8jYr6CHFOt1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D9cYeQjsmbm7N0G9SYYKqixFynKO7BLL8/PiYxQrUa8=;
 b=eIELzHCTIoclLoBNYfKASDEHn7hrrCT5OhGWfsSbR2/K4b+/r0TAvdaflug9yffaGq
 2JsS/CL167A9ZLE9n6MBEgIlF7nLn49DWcx1UCsKHmueBxOUEq0LK14pkaO6OywSryih
 wYFoxAPZzbfgzrP/wLWaTntcmaxq21NH5IiFGh5CE1ThifwcIDpjppgCD+9afuQbNs+1
 xnONDCVLMoQEDl4REyIcivZpvw1A1d2J1hfwDdA8gZkE9enuJEhKdOenemCjLdOTdBWd
 2vWllXNiWeks75WmXEFkh3YYhVYIrfK6QJ06zmWASTEzlj1mlZjsqPvdnPQq20yIvAnU
 vVKA==
X-Gm-Message-State: AOAM530cMwfGssWCFKd+jWEXczWxCKwP9bCQfinI5Il8bGZODluh8+hc
 NTYIJhs0aDESScEcpZaWpuB+/ZJrAefphg==
X-Google-Smtp-Source: ABdhPJyimNvbe+zQ5zu6cKOyz09g7ohBhwQGEsLmUz/FxJ3f9+HD8dgawKzJ50ET13ZjTNQL9O3kRg==
X-Received: by 2002:a17:906:b34e:: with SMTP id
 cd14mr34190841ejb.369.1619018957055; 
 Wed, 21 Apr 2021 08:29:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id br14sm2810254ejb.61.2021.04.21.08.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 08:29:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/todo: Add link to old debugfs RFC
Date: Wed, 21 Apr 2021 17:29:11 +0200
Message-Id: <20210421152911.1871473-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
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
Cc: Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I always forget where it was, store it until this gets picked up by an
internship again.

Cc: Wambui Karuga <wambui.karugax@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/gpu/todo.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 7ff9fac10d8b..12e61869939e 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -546,6 +546,8 @@ There's a bunch of issues with it:
   this (together with the drm_minor->drm_device move) would allow us to remove
   debugfs_init.
 
+Previous RFC that hasn't landed yet: https://lore.kernel.org/dri-devel/20200513114130.28641-2-wambui.karugax@gmail.com/
+
 Contact: Daniel Vetter
 
 Level: Intermediate
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

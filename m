Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7481D49F8
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27AB6EC34;
	Fri, 15 May 2020 09:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB2D6E132
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:06 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z72so1960467wmc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KQyxdAeLrtrj7Dvj11uWd2+1qx/CRyBNW+gNIqlp2ZY=;
 b=jlxmajnv/2iFVmbsGBVNR4iZdbztJ5xXoh5WtiYN7PGpUtv1i+AU/YRW0URLvQGwji
 PeX6mNRwjeCnQ1O2wGXhfDP8hH0TuQsUhrD5dXMshNTFkrt7wjyCedjJsDVQDOWGWmaP
 3Z2c5eDaZFhJfDKXSTXUrjshvZC8klAvlv1UjTJa27FIs0JhXniF5gze8OuisarAamzJ
 5hfkGd9430K4nSiW82ny8JriXuLyb4W/Eh+t2/V8CijnevtsUxMkIhMZChqXq2UEEmHm
 lNSfnyu4veh4QjHa4DeNc5vWEKHEu07F97u8Eb5a2ZnKiRo+qUr3fQ3AyIRNyD4ONFlW
 Fajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KQyxdAeLrtrj7Dvj11uWd2+1qx/CRyBNW+gNIqlp2ZY=;
 b=A8SX3CNJB4Gj5lHkmU/Lpk/+Nee9A3xNSwW/LivAvdEmLjwPR9hGrqUnYn8ZoLSfT7
 4sg9X/pLy+txYmnt6vyZ1ZuR4V2nXzl0xDXFG+crLNtJnypbwIC1vd7jXvpeBMDoPE+P
 zTnj8yrp1tpmg9h0pk4TBsIF5eqrb9anNA8XHwCoVaDUZY7HcZrm5cE7neE2OTtfYsQx
 By0P6uDTFYUd7FMh3zlZ51qwarmMBnfbmWqDFdP2/ltMkpsoH8fe89o19ikTNFjm8CI/
 MLuwOEn4sqJVyICmXLNJHhX0nSdlXji3OAOeZ0E6DIgXmH5yZhpPI3DSWKjojPZD5wAM
 MNBA==
X-Gm-Message-State: AOAM5335n+ewYo+a2jgESk2g1sgnka/SCCVx3DPTznidYhv/xZwMPLPq
 KX+0iSFWSdWSlOLicOfFvV32bctk
X-Google-Smtp-Source: ABdhPJxwSRR/trmsaFyboRrU9+m3MO47OvN0fc9/M0nBFp3LJ9a0eYPuK9wLnBVLxMepmzz4CfpibQ==
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr3021949wmk.112.1589536445391; 
 Fri, 15 May 2020 02:54:05 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:04 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/38] drm/todo: mention i915 in the struct_mutex section
Date: Fri, 15 May 2020 10:50:43 +0100
Message-Id: <20200515095118.2743122-4-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 Documentation/gpu/todo.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 658b52f7ffc6..2ce52c5917f8 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -157,8 +157,8 @@ private lock. The tricky part is the BO free functions, since those can't
 reliably take that lock any more. Instead state needs to be protected with
 suitable subordinate locks or some cleanup work pushed to a worker thread. For
 performance-critical drivers it might also be better to go with a more
-fine-grained per-buffer object and per-context lockings scheme. Currently only the
-``msm`` driver still use ``struct_mutex``.
+fine-grained per-buffer object and per-context lockings scheme. Currently only
+the ``msm`` and `i915` drivers use ``struct_mutex``.
 
 Contact: Daniel Vetter, respective driver maintainers
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

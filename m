Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9FE924AD2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABD810E72F;
	Tue,  2 Jul 2024 21:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PGUwxlvs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5491A10E712;
 Tue,  2 Jul 2024 21:59:40 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-7e21dfbc310so177462739f.1; 
 Tue, 02 Jul 2024 14:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957579; x=1720562379; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ym+La6D/NLLhNjjl/GCbF3WdukVm3ek2K4bqw3UNhOo=;
 b=PGUwxlvsqq4047XSh3EK9Magb8Hsnbmen0wIhfsGeKlMk3THMKrEIj89Xj0BjkqdWj
 yCIiCeApLqj9aqQW/KqfyAmcROpD7+XSoXYH4SKQ8GyjBhRDWYDsppsnHQWHAlcVt1uY
 1xlOMZMN+aEiR5BjsgFnZfYqO3VrbmK6uh7ge2k8f1NW7rNA3ZLX9tIEbarsEW6Go6zM
 ldJ++ZQjfqn76JI6FUUqC4lsGVgfpvhozIUBrAmzRD8HZ3G14SIRw22vr+fhd7d6qcJL
 50hgnLxyNJZDihAawCOtIaQhkiRsHDZtd57ilgs4ypMG7goX3BOvj15CR+wt6iYOxg8Q
 uUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957579; x=1720562379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ym+La6D/NLLhNjjl/GCbF3WdukVm3ek2K4bqw3UNhOo=;
 b=h712AUCv0gm0CRRL3AOIv285hew5GsD/t2NHjFk0Es6CvNSEDK+OJ6Vb3K2rO+IjX0
 DBcf6wwa+zdFFXbDJmbZL5mW5d2Y19zVwiJj2JSmlpA+Okx8SI9/+NiNtvYvzRdZvcHN
 Dq0ke6X3cn98gbyCiv9TqQhVL3+tgtNXAWCOZOjjvpL9R96L2CPpLP3p8VXfjTSnKA3+
 PKNGHbI4DEGtTEbkgMVqWveTQ8/+1J7WcsW0ACO/1wlU84WLqH/TH+FwBvShrws/bRSA
 U0bL111MxQiFVQ4GZCjCHqgv7PHxwJQlR78F9o1PIwh8FQ+bzo3+GCuOIrrl/FU3sR7m
 o4Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf/EIS3eBItu6udQg/C0bdlkeJaMd3ZTMxfzZJH9pkJkVC5lqgJzQpj/3AdSP52BZ17D5maFw0q57NO8ZMvyq8AjmUfcaXFYz5fXkz39fMG1y6kf4cYVX5OpkcXwvzPENHvBasfkC8rvrv12aimTOy77JAop6Gscs/l9LyN8IBRzrbxh7pbhLR1qB9p3ZHWQi+4u7Ye5XJMrZy6E5Ar8q8SJvawcKcdF2WL5r3xN9GTkRZYxw=
X-Gm-Message-State: AOJu0Yxjtlb7woOlCr24wq3OKH5/biVjntGtsFnX+36SIee6Da6U3stv
 h+XKq8e6+4TrFzEU50VxX6zEoAqcZDS8JycKSrsfyKofP9SHgDNV
X-Google-Smtp-Source: AGHT+IHIRUIlmI3WUW2mIpy7hm5XHgMqtIZ7QkWlOh59CvhPr4UBjQt+AtFMIBoct5NjwYy95AHiIg==
X-Received: by 2002:a5e:d606:0:b0:7f6:1fcc:25c9 with SMTP id
 ca18e2360f4ac-7f62ee19639mr1076084139f.9.1719957579545; 
 Tue, 02 Jul 2024 14:59:39 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:38 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 53/53] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Tue,  2 Jul 2024 15:58:04 -0600
Message-ID: <20240702215804.2201271-75-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

end of official submission.

Time for some quality CI

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 5a0c476361c3..b2ea73ae48f0 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -54,8 +54,7 @@ config DRM_DEBUG_MM
 
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
-	default n
-	depends on BROKEN
+	default y
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.45.2


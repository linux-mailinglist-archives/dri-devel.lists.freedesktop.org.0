Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC39C924AD1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2205B10E72B;
	Tue,  2 Jul 2024 21:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kwxDdxTx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AE610E712;
 Tue,  2 Jul 2024 21:59:38 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7f65715fe2cso34974739f.0; 
 Tue, 02 Jul 2024 14:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957578; x=1720562378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ym+La6D/NLLhNjjl/GCbF3WdukVm3ek2K4bqw3UNhOo=;
 b=kwxDdxTxIvfbOinlbywwgv/wsnwgQkzTeFBiFOha5yCPtRrljIVYMeb7OW5+a4EjCl
 DffoD4aP+C3kN8e3iS2+6o+nyi3RsN/cjtNjI14rUt2/5hg/wMnXPkfEjktfVEvvi4cP
 4Tlr2jTCMfvdbytwgpyry7dMFeWsdACly/jE2jATYM8nBWskz//0+uL+JWHrTSVI376q
 utepkeodMGcZnNmmrwcMAwJpKGcNbsMPMkoBcPgAwniltEQbCyWpTXHVDDcusHAwhYho
 +marLqpWcpu7VG04JUEp2QxHJeGIKHa0hpJVCN7R4K6HaCeny5lcQtFk2NnUpzLiesFj
 h1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957578; x=1720562378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ym+La6D/NLLhNjjl/GCbF3WdukVm3ek2K4bqw3UNhOo=;
 b=vUH1Jb2CCIaXKfH+B7i3vPBZgNQSv5hLuNvRqJVAOXuKTtBGd0CO88u+UhrM+j3PnU
 0j0smiyNwlOTxwXIdOakY9Jpv/6bH04hoMX8apNIP1U1Gwyasl//HvOWkIr7x2u8TSNV
 W34WTBKi0b558h7fO2s803zAu4a/TrhVpkWg4PuLnTvQE6lynXZVzlEeccRHJ3+fofVK
 jlbiEcK0ceTwL/08JPycO2RtcTWtN5E7lRgAQ0zqfN/ut2GDtpapbKStoYndjONSV5t1
 hHbagrxDS1qvSSoHQsev/H5ruKKw36AZkX7xrxSUv1/+9+m0Fb4PySe7qLig90t7NFZU
 stSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzloJ4Twmib2nzxFUFG6bckq1ykJcRpvFivAWf4rURZgrbMTjaXkBeOY423qLyl+qyjJzVJYE1TEcjuQf4tQqTw+jXXtf0pM6lgLFhocGoBrUFiN5SAyu2a2fCsn0y1J2Ld53ZlUmjtCalUEWBzbVlzb+dnGYgJVB5+onYQqyB4DzxkDjmf7l2OvvboAxHBCBVewCRTW94NhuOl8RpzRVlk3992BS0OagawI5szHJYFFsyKu4=
X-Gm-Message-State: AOJu0YxHP4pFxRYJIWY370SJ1wzlkYZOs1pYIvIrz7nQiQwRsJqQWKbO
 odQSZVv8Ia2kDZGU/OpgvQ164M7BgXAOYaxl+IKAcbtlCr88vKz/HSlpcw==
X-Google-Smtp-Source: AGHT+IEx2Gyrde0A2uOqS8y+YjAXzajqP8cUSrab+Dm1ugLLW9FFgCd4CeSHn5fLmUCcTWDUd94ipw==
X-Received: by 2002:a6b:e01a:0:b0:7f6:1fcc:25c5 with SMTP id
 ca18e2360f4ac-7f62ee9b593mr1304401439f.19.1719957578034; 
 Tue, 02 Jul 2024 14:59:38 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 52/52] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Tue,  2 Jul 2024 15:58:03 -0600
Message-ID: <20240702215804.2201271-74-jim.cromie@gmail.com>
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


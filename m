Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49B993311D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E202510E85B;
	Tue, 16 Jul 2024 19:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PVYvRL+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B37710E832;
 Tue, 16 Jul 2024 18:59:17 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-7fe8d029fbeso5437339f.3; 
 Tue, 16 Jul 2024 11:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156356; x=1721761156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iNQhk3CU61T+AcfVcUeB9pjaIkKdAz26cxffCe7xJQA=;
 b=PVYvRL+BLzC4aCa3CPgIlHoRN1BsOhgNtmFodeKC0ZCIkIKi5zvTYCWbSw7TPaFRWk
 vu0ig0TZhKSP0uQn+yKTYyYgjc0LQeKIXxf+Y6AOnNZtGwT6ODinalAY5vI0HNbRi/jL
 4AU0YKDMDiXvtQ15xuUZ09p6Hu9zvtrovDJDOkb2AOXqkPoqyFNhL6OLa4U/Jraz1C+B
 Od54o/aC0I8F5r+fLUYtQ0H8yO4xR5KqhoL1oVtPgDpWw/ap1bXgun6R1fqDxSk3LVA3
 1biRfgv3diKuQhQtzI321dRsgnnBJ4rIEfSyVYiQOkJVra6jRmZQk7AETGEpYAxu4g/X
 KqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156356; x=1721761156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iNQhk3CU61T+AcfVcUeB9pjaIkKdAz26cxffCe7xJQA=;
 b=t1rE899CJTTYuBoFkjMGwbzHEezjB0vHk2TCPxnkNy4TOhRyLYuLgto1vrm0h3vI2V
 NRVchcrow9i8VrlkmMsd/EL79u5+695h0u2h+pXfGR8MDpKH1j0PmAMEC949Dhjp7ulb
 d9GLNrZaC24uacuhuxY7/posDrIJxHdkO4FZyQpezfBx2hJtk0Cbuy3jne32cviygl3v
 8UzXE27VQwSFtdU0V1TdPYyo9eor7dR1b0sVlm0ICE0hThmW+0sGMdqDn0FVDnO7mv3q
 8eQz9+3AXYmg1XR00CPHR+zkfybmPO84KEVfalXGHVyQcTRt70Zts5KDc+1fXK6MtEMv
 DTlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHoyGpVJP+sNl5Or3gKEThrG78BjfKq8veIPYHxkwqvcRHx2Bzed8cGXhJfa/u8VFHXxZEKCZb3Ho7MOrdrVfy5zihiOdoAJTNC7GcFY+tspqpX1gZv4xdgqFQsTP29qvrrgY83NZ0GCalfwmnVKg2zAu18F+R+AgWbmY4Sknjfw4Q7SP8c9gkUwpUnq3sfuZGh6eEDn9eHyX3GCGv6x29w7B2xQd9mNSQ4OSwOXVlyHTvwKE=
X-Gm-Message-State: AOJu0YwR4SFKleP/fbNjuJl7xWz7D0f13wYdWq6Y7Oi5h4JgvV0SVPPr
 QH3wNZDNubLgH1zGaDKwUYjHQv1iKPe5BOg5Bw627HBEiVL5d0IW
X-Google-Smtp-Source: AGHT+IERqs2wFcp6BuPJMtdrHm6x9C6aaXku1vgcCPBJMhxnTRyvGKpPaEvovr34nmjY1Lv8JYbY2Q==
X-Received: by 2002:a05:6602:26d5:b0:806:31ee:132 with SMTP id
 ca18e2360f4ac-816c2eef653mr47483039f.4.1721156356447; 
 Tue, 16 Jul 2024 11:59:16 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 40/54] drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
Date: Tue, 16 Jul 2024 12:57:52 -0600
Message-ID: <20240716185806.1572048-41-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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

tiny/simpledrm has 3 DRM_UT_DRIVER debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 1d8fa07572c5..69cb580ca9d1 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -34,6 +34,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * Helpers for simplefb
  */
-- 
2.45.2


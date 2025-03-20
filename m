Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0966CA6ADD2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2480110E6EE;
	Thu, 20 Mar 2025 18:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fB2t99iO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC3310E6E0;
 Thu, 20 Mar 2025 18:54:11 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-85e15dc801aso94097439f.2; 
 Thu, 20 Mar 2025 11:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496850; x=1743101650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+QMYU6kMnFOETa/gyjW3XwbPIpROUU0JSPdCI4eHHw=;
 b=fB2t99iOcg/gEaCKwgNO22kmcxuHtBFT0BbUstgXz1vB3V+z/F+/2uMrgcdHy5TqSO
 D5Il1z9vpWZvgPiXIFYuQbdhpW+s0LB+/CsqsnuvfhaAN1Rx05jD6UggJ8YfM617WBtx
 fZTVx/NWkvuy/5yuZephtpFAhTewWJ9auudhUFloMpzPmyaCGSJZ/D0lYdn7geQ3WGhd
 AbdrXMQD7ZgbnAx+fFrKhmihlVq6JEZDFwUDUzknFamHFTp2Dci+GySjt31Nd3Ygy2jq
 q5yPYw6qmwsZJvJWRHXlM3HnoZunn0OzmIUmC0b7eFrRK5B6lvQa7x5tXwv0HkikepD2
 LSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496850; x=1743101650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/+QMYU6kMnFOETa/gyjW3XwbPIpROUU0JSPdCI4eHHw=;
 b=WiFJQKWzUVjd0hhe4/s/BV9uuQlH6y6gjfbMPq4NQpAdOB7q8aP/slMgXsHvVPKdTp
 cC/BQAY1UvPEiFyD7q1KfIkuMiENkRr8XmIrCTftBb8dNOJll0cIefNmALlpDQGCnXw+
 48sqN04FjTK01mR8Jt9fP7uWeSVLjXhjY8Q4J6hS2WZ3w6Ny36TDRPNfA4GMZODvbiW6
 YHP0WkxXaKaFSMq2cg66dvuugmxHhm+bGL6bqtLOWMprcAe3yRqJSIi42KS1y7VgY8qy
 BPW60aI0YP1NPsCmrt6dY85ipgRMp4xUo6irimJ4ejsBr0mynaYOj0Mzu8YQmauPw6BL
 81fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJtnjJuvmRkLGQGNytIXG2U8XelrxFCwoc11W6B9WzT8sSXmwaVkqHqddoKhn34NwzoErD08WVqsk/@lists.freedesktop.org,
 AJvYcCUxbmi1nnAsngo88lqFDhA5yxwah81wvaRBqsSzv+TrcyYfd0AEYacc+lhboB7/KjfdMOcVT67qUzMq@lists.freedesktop.org,
 AJvYcCX/SwdHpKP53f/xdXjyS3f58WcPxGIyfiTS/GmsAh/JHmfRsnPEwgOPuaX8pOn0RaQHsEHA/sho@lists.freedesktop.org,
 AJvYcCXT5+gJg4vqHIAwmMnu2Zp+t3pXUMxqtG+mACwon7oruNw1PWjslSfOouedIBmYid9iT19BbQ1sRMtcmFNXoA==@lists.freedesktop.org,
 AJvYcCXn2UjazX7Wy+7f2h6WCMN1wymAK1iRejg4x8Usm3is4Zi7975PEbC/OJsK7HezWzY316Ir5SQo+RSL+pRccgHOTA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPuh3SubQVY0NJPyZ13xkXkdSfDmTXsb1K1DsrVnxGtKACR/0j
 2tUFWpZ3SvaDmpjYLsicFU4o9b2FTI+TNGa1VZwGVU6OmNQSwNah
X-Gm-Gg: ASbGncv6tSdgKGW8lpfmGLuu0EYp+VLjHqo7M8KFltxh4ZXIGpHkGF3Ntmv5KKxJ2l5
 4RPw8eDJJpz1qObEECBujQR/Cqw7WaE3nFdfl4gf8BvCofxsu7vEzx+mL6Lcd5RQPBaBybGSqPz
 pf86a/dQWRnQfQ2gscV28xz71fMf8f1JPf+J8tJs96AqnkCFmaEsKVfUsqLOjP/BkPPo8X9yDZI
 VrAvDnY2aJEBH5lhScB5rDTpEcNLVESJH2QyK3wdyPd52TWNRRF0xy9SU8G8hG3DjXD9uwxAxqm
 Chjza2rYkNwc0g/GY3G/KXEMrnOBgocJ7FNzsgDISMN10CJ2ZtaaX70gf/Nh76se2D9xaPhE6PX
 KM80grfRs7nH8
X-Google-Smtp-Source: AGHT+IFM14DB5b0+Yb3xk+iy8bUVQ6+k06Y9+AI7/qq96L95YVo4adquNQGvMAtgqIcPJKOtb0c8DA==
X-Received: by 2002:a05:6602:408e:b0:85b:4170:e1a1 with SMTP id
 ca18e2360f4ac-85e2cc7c771mr36727539f.13.1742496850400; 
 Thu, 20 Mar 2025 11:54:10 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:54:09 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 58/59] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Thu, 20 Mar 2025 12:52:36 -0600
Message-ID: <20250320185238.447458-59-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

Time for some thorough CI.

Also, the previous 18 patches could perhaps be replaced by a single
invocation of DYNDBG_CLASSMAP_USE, from a C-file linked into all drm
drivers & helpers.  I didn't find such a file, nor a drm-client
linkage item in the Makefile.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index fbef3f471bd0..c7d6adbe17eb 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -53,8 +53,7 @@ config DRM_DEBUG_MM
 
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
-	default n
-	depends on BROKEN
+	default y
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.49.0


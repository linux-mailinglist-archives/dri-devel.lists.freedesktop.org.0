Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC67A6ADCB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2B710E6E3;
	Thu, 20 Mar 2025 18:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MNJtjW9j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8141510E6A4;
 Thu, 20 Mar 2025 18:53:59 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-85db7a3da71so81529439f.1; 
 Thu, 20 Mar 2025 11:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496839; x=1743101639; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mR3GZQ988EXrhdMWSVSfrBHjk8VugzTeXVmkAtrRrJY=;
 b=MNJtjW9jakCt5QKXlLr5okAvGLJPW6pWsrt8xEC34vdr/iWvYZXSXelpcxW8npous5
 P6DtP3FnUwLbOrFeGn8DeJeP05b8Tde6AIVh9b1r8S+Xuup3QvxtIvdhHU2GYRwgUf9I
 wsQytEezEj+kwyp41i3XmmraJvezXhhUni/4ZhzMbLq7GmD7lufhTQQXUCWVkBH3mbCe
 8LIQ64nIrEV127Solc1c3roFO2chRZDgLY59ilbTOAdP4Ls5ANT9IqWnZnYH+pp1qjcC
 Ko6uJ0cLP2ujj3gMmN7eWM9J6RDmoRUudTMxK4ra8EJulLVBCHPEotrTt4yADNT0HA/y
 Uwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496839; x=1743101639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mR3GZQ988EXrhdMWSVSfrBHjk8VugzTeXVmkAtrRrJY=;
 b=H9cBV4zIxHgfq16BAOcqiS2vQDoyM4R6ua4/zqafPG2mGRHQaGeUOnPMk7CwjdNbEC
 iqIEeWGvqeUSg7kj+Jib235Dxxk+FnfxFkJ6bSbvPF9XmcjgOY2wMLxoDhNqz5XtN+Ob
 nza23/ZRMGvvSloJ3rIRmKnJjNH/Y1800yhhmqMw80Ih9eUZj3LZMuvu5439lNmGVCX3
 +1fjurzHKw/9SPNAZMwcsYbOjBzAFlGbeqYqPoBJhMri0EQKzjjVFI9JqXb7GU3Ip5yp
 AJa0b7c9Z/plr63Bq+47++xnoYDxE41L6ifWy9FGttfnQ0Cymy8uQrLMx6IO0YQ8tIkp
 FJSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkI9KFbzpRg7hpqofCVAxb8xhBb66o6TOM8OdhSnm8aJRMm0mOL6ZVG1TpwR9eiFsPG1jC5D38@lists.freedesktop.org,
 AJvYcCWgazDjIFTBbCdDyhJf+vEEo5LFXpeeBEUFPNC8rLpVuJ2Vxg6AsN5EDVNgXQJ/xmt/twlOovbTmylZlJDD1Q==@lists.freedesktop.org,
 AJvYcCX8jVaTZPdDkTL3uKu2iTT3s0GnLS9VJ5wOjbGvjUs09lq4ajP0nZoDteVrO3FSvw3wPXaQH0qfUuLp@lists.freedesktop.org,
 AJvYcCXAWT6GVsyGimhZa1YYcdKFzmV707la7++Ji0Z9FOtLSGZdM4RROV7AwBv0yeFuOd6OhkyhHaGl9bvY@lists.freedesktop.org,
 AJvYcCXcM6hPOTcCcPylHPH6dpmhiWlzTtxXXzVGT3RxYpSizyOvBl2oOer0g3WBS2tymhhpS9pt5e0eGDtkTnfTMQ54Ew==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjSLvfddSe32VOCalHUCyix54F26nvT9zfYwjkmQCJAr5cnpxt
 qOD2veNaeoXgbnixKcrFN1fS3jngkG2iEFaYhgKetf0Y8uv+DXjP
X-Gm-Gg: ASbGncv+jSN0OguMhL/VLBEWj3A8yswTGHGeW4k6z1yuSTLBpujfPwazRWf7u3oTOQr
 NT8BDLVYZ8sFMDd+ALkOSH3jTqBBMK9Si8qvUyLPd5ou2pfloJpRsTldRio0FG5TVyIyRcS3X2D
 MqJubku8I2QXZr5jjG0pzeW5g1383Gj6DTFkh0KkR0fji+YUqDYk+LleU+AJOOEesfZ39mk9tBn
 49+ShwV5pElgwRZ0M/HM+0At05cyPU/ejnLfIu1eHTwfOZV2qaw6FYuaPams1mlHK9ExgkaXdbE
 6gIJeWgaS5yIi/BsWLg7nSW5E+XoeN9YZuvYEr9DqylhuJLjruKLT79VJm9XoE0YKFbCbl9NYsU
 wRA==
X-Google-Smtp-Source: AGHT+IE/8vAD9xn894tiXvAQK0Gxh3uyYswy4zA7uBx2cF18ny9SJTNkmwBTELmd0JQj7p9EY0kClA==
X-Received: by 2002:a05:6602:2762:b0:85e:2020:2396 with SMTP id
 ca18e2360f4ac-85e2c8ff5a6mr53200439f.0.1742496838785; 
 Thu, 20 Mar 2025 11:53:58 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:58 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 48/59] drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
Date: Thu, 20 Mar 2025 12:52:26 -0600
Message-ID: <20250320185238.447458-49-jim.cromie@gmail.com>
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

etnaviv has 5 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs as well as plain-old pr_debug()s

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 3e91747ed339..70759b7d338f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -25,6 +25,8 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * DRM operations:
  */
-- 
2.49.0


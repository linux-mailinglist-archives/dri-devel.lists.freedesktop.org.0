Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C905A6ADBF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DD710E6B7;
	Thu, 20 Mar 2025 18:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VLozY6t/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C9910E6CE;
 Thu, 20 Mar 2025 18:53:56 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-85e15dc801aso94077439f.2; 
 Thu, 20 Mar 2025 11:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496836; x=1743101636; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lmnUjD6NKJR963XR8Ej2QuH8oZFh+mV0bkdDgwQtC1c=;
 b=VLozY6t/ImsaxGl8Pejmswj5enADWjw5LtyAmVyg3AccTzva321mKtmm1GihfNbUi1
 wzBPwbcW6EJhXp+v3bbl8z3dzvDXn1BHQYiRGONLGCXTi034SXX1J8x3lPsWNl6VaeTb
 vl85p9+3/tLevx/ds7W6rzSRM1W93I12UILd+171T5GpLlWx6AHnFouWMeTdFgWU5HS/
 16yzvZHjTdF8/KxkBI90fGawwmzLNCrR21F32y/AwjUv3YlLjJG0WGYijdCUJ+trAJP5
 WUs+JrtSWQWq1cLMgYS7rdpOG562On32kJKLv+6omQ7PTr77Dw4oF4pha/+luXqZWsr7
 ENHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496836; x=1743101636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lmnUjD6NKJR963XR8Ej2QuH8oZFh+mV0bkdDgwQtC1c=;
 b=H14HLeG3mSbgzTcOxTxxXTyoOpyEB30AhUUJ12mqqkotfwKA1QnvJLAMqlJpbdfqkI
 NRXbZTvuOGn2tu4vMjXylMq2O+3FlyvaY5F21+CIEjfrkCWT3a0h4WzpFW/jSWX0SnvX
 7LIfGGTBITzCHfoJmzPzR9hCClg4MUOM4n5h1drcWhpi1m7O1OMI0ihzAgFz6w2Heth/
 ci+Gc0i6Dvf/kYzAiMLGg132nO7iBkFJ52+ysuyHLdUFYsp/JRUUBtVsR01e2KxgjBUH
 XthbUfijN7K1xjV4PBkr5gV3tyrvctvpv0Jfiwa3YVqevQL/t1Eerl+6usFB/wvfhs2f
 qfSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAaQnP1mLjEpbNOGyPxhEj+w+2IKPGbXx8jBKmduZJutw+zz782XukO3SciyCm5MhU5uGEe0mt@lists.freedesktop.org,
 AJvYcCUNlzUxZy+PljL3n/0VyUGqF5Cwd5dGtH6g+74lICqwjRh+OwRB0dWTSmyD19eB53dLqrRS5Vml8sDkADufjw==@lists.freedesktop.org,
 AJvYcCWFfxcN9XIV4yBcoHhctGNcPEXFbMC+WIPZa4gBambW0c9pscnsFhSoAmoJBKj3i+tA5HShOCoplIIF@lists.freedesktop.org,
 AJvYcCWmYx284L36QYE0Lnw92k6ignhil49E+oalTpH1VoI98R7vHcirEB2Zcb6QMHJecdsjYMWUbE1zfqEh@lists.freedesktop.org,
 AJvYcCXImvYk+Dde9K1wUOjbY6UFgq3kkA6De+49M42MpurHNNoGxkRerazSIG8ynBewhSCXH6Y2MpNU0qu9e9TWkS6yAA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxf6k/IYaZPfC/Ivh+fvKuqo99/CqPk/yJ3ahYbIfOLFgV+mdW
 vr4Fkwt9p+i//yZyEs5myi5DekhVHUzf2ZPmDXyMyCUR/SAPS4vN
X-Gm-Gg: ASbGncuCwf66YJ3c59jxbve1eskvhqAUEZHhEg1zUjWvnjckv1z+VaQLj+XGiZ+h+B6
 8WpIIfIjgKcLFezPHb3grMrkzi8ynxgm1q0lJITTn5jl4oKM4e9Ueum/0O2DLr11AZ4B5PkxGD7
 se3dwe4ijluFvxvkTeWbu6lOWtHk5hgRoehyuo6v0nYhNHKQUdqaVWBckbLD649nX31OoIiRpPv
 CquhCgiCv0OFEjBECDT10HbTso+sXtWyjLWu/AdwtBg9WpcDnYXeHOsC3EKf4/S9zvjkjC42VqX
 51tQlgiv/tqQKRFOkPFpyiDnpRzxWnWIClMHLcuKwNl2I5LT5S1xf6IxAJYiODGJTZCb7lD37YR
 UCA==
X-Google-Smtp-Source: AGHT+IEE+IsH7hIG3IwpuXTfje/wS/kbP6qcYYW231aMk+d0pYaAsvECTE7km24gsBf+wVdEupvShw==
X-Received: by 2002:a05:6602:3a01:b0:85b:3d1c:87d7 with SMTP id
 ca18e2360f4ac-85e2ca36477mr39404939f.3.1742496835558; 
 Thu, 20 Mar 2025 11:53:55 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 45/59] drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
Date: Thu, 20 Mar 2025 12:52:23 -0600
Message-ID: <20250320185238.447458-46-jim.cromie@gmail.com>
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

virtio_gpu has 10 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 6a67c6297d58..3bc4e6694fc2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -45,6 +45,8 @@ static const struct drm_driver driver;
 
 static int virtio_gpu_modeset = -1;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, virtio_gpu_modeset, int, 0400);
 
-- 
2.49.0


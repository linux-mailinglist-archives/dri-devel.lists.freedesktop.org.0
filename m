Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9EB7DDA0B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 01:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F0110E63C;
	Wed,  1 Nov 2023 00:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4B010E632;
 Wed,  1 Nov 2023 00:26:47 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-35809893291so23024055ab.1; 
 Tue, 31 Oct 2023 17:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698798407; x=1699403207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5LQP5MFDhA+xfUDGLuGe24GCmwsysAw7CRqOtSg8az8=;
 b=FfrcrIWPR0k13iuXPzn6kk50WdwFVCu+qha5rNu8+iGyL9evyEV1XAY2Qu1+ZVGIPU
 bLkGULRAGpJsYsns0BYtzSJEBcb+UdHKzgfdrFjcwg1h8wuebSwjdh6AVPfK/2c6oHMT
 6ef8s9LWGd6+Pw3RMngxb+FFQSq5oku7u1BU9LXvc/arSgI8hEYbJODWD3E+7zHKGl6a
 EI9iRKQywif+a/cWUPmhbDalQxz5MEc/WQJhM0iGniEA3FpwZNCoaBkR6t1baAbgwXRM
 BJW20HHqV3N+Cs9F0Wj1c4fwTCX1LWmQBZKD6JdxeoaKyZNiB7DrqHcQIWYV+QJhp3hr
 HDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698798407; x=1699403207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5LQP5MFDhA+xfUDGLuGe24GCmwsysAw7CRqOtSg8az8=;
 b=NB9JwOnnNH9XRdZxs4ISzDejhLoNOHYU2/l4z/fimifD/NRzn6YBXc7ul4o+ibp3Oi
 EHpRYVvaICMfOYTSE/Xh2RBBhn0NJ46zm0157MQmZJs5O60ZtomztkPvZRENd4u9hzDY
 MOZ04s4if2QZ2dYoBLd3OlQIq4W8XWYoX2a9/uhrW2F3q6pMAsi407+veoe1qsa7wsp4
 0N89iIPPNmelabPATtZE+9ke0LcULDDwrvAEOySXzRVRcyp6ZcHwfYLAtp3EXy2KS3zO
 Dm3woahxmi2+TGZw/CjxhpNpXveJmwXLd+YXdyMTF/cH0dlX3kaBOt88YeyCGhYQjmj7
 iteg==
X-Gm-Message-State: AOJu0YyVfgEWRzdxoc0n47qQvYl1MGc5G9eXj/qukIYvyMcXkr9pWwqT
 2Y7D5IkWCWWfMA73cwgvrHc=
X-Google-Smtp-Source: AGHT+IEgTmvlOr9x4bLvw8pciAoCY0BZ4bhDKeUIJ6/TeWefWYnRzCu1JAK61myF6Ajh5soTw+Xx4w==
X-Received: by 2002:a92:c266:0:b0:357:5db1:9170 with SMTP id
 h6-20020a92c266000000b003575db19170mr17284727ild.28.1698798406942; 
 Tue, 31 Oct 2023 17:26:46 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 17:26:46 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7d 21/23] drm: use correct ccflags-y spelling
Date: Tue, 31 Oct 2023 18:26:07 -0600
Message-ID: <20231101002609.3533731-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101002609.3533731-1-jim.cromie@gmail.com>
References: <20231101002609.3533731-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, linux-doc@vger.kernel.org,
 daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, will@kernel.org,
 groeck@google.com, maz@kernel.org, mcgrof@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, arnd@arndb.de, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
 linux-arm-kernel@lists.infradead.org, lb@semihalf.com, yanivt@google.com,
 quic_psodagud@quicinc.com, joe@perches.com, bleung@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which broke builds with:

CONFIG_DRM_USE_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_DYNAMIC_DEBUG=n

Also add subdir-ccflags so that all drivers pick up the addition.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 215e78e79125..22b1984cc982 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 drm-y := \
 	drm_aperture.o \
-- 
2.41.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3C67C74A1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDBE10E535;
	Thu, 12 Oct 2023 17:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0226B10E551;
 Thu, 12 Oct 2023 17:22:13 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-76c64da0e46so48043139f.0; 
 Thu, 12 Oct 2023 10:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697131332; x=1697736132; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5LQP5MFDhA+xfUDGLuGe24GCmwsysAw7CRqOtSg8az8=;
 b=SD24BUt3E41LuY3EvwaINfdENumu5wYmWwOydcm90k/Eye+6iQWT80OEaCSoXkeFkj
 zneIBY/mMic6CAza7Vp/IB7PwH4y7+0FvYoPcSHXxvFA1cHSAcTw3z/IVnU46TM5QTZl
 CNjn8OH1artLJ35M7hDzAaJC39/W7KYEAaoHX7675jO6ISXFvzDOtUeRMwGAnRSqZVDy
 aYDHnWJTsCQh5ca0eqLx0q7JZzZmPsf46734tgDZd5brDeqxs3E/01pPrPXlHx7jigLV
 4FgC2B3oHg/VdqzSHb64Imr5NhT/Oo8wz70EkmcJm8oSwxPKAev6mQEeWX+NLUNWeYeY
 YcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697131332; x=1697736132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5LQP5MFDhA+xfUDGLuGe24GCmwsysAw7CRqOtSg8az8=;
 b=IcW4hLZC++55Ga2dlb0bDffyiQevZlNwKKKzAr7cqVTTBD+GAHtHn0yXVddAmZIfVb
 6lpw5NjxrLtM1vSMxYTGo1eChmWxSeKreWjwsgO7gbr0wubkm1tfDVLiDOJWs/51T0Nt
 7ZkAE369HjdqTwlw0HL51McGXBGH2+EBPI9ZheZ6A/SK0lchPiwBnNBla4LZQI6a1DgE
 uDaZ7JEnrLgMIp6Gid0qiWSUfQEik9VWnafKuNyrJoIBnnhn8zc6bZIoakljhCqqjZv6
 CvHbDfVS1h1GaSGKSGTaBM3tcFGngW6Z839iBitEWA6MhDKlJ+4gMYGrEvEMDWrLeOKR
 H61Q==
X-Gm-Message-State: AOJu0YzTP5gPhW/mEFn+d6xeYYf2KXrW5xZdTsfAaZB2zhE6RZIH6GKN
 ZxsxTCYegUv+QTcG5AJQdPc=
X-Google-Smtp-Source: AGHT+IHzdz6j/vLvb13hWGyitF0NYfQ+58DfX66YHxmuF+rTNL+ptBqWkmhR8dXqdb+0bFLGeWyapA==
X-Received: by 2002:a5e:aa0c:0:b0:794:e96f:b87d with SMTP id
 s12-20020a5eaa0c000000b00794e96fb87dmr27630637ioe.0.1697131332304; 
 Thu, 12 Oct 2023 10:22:12 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:22:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 23/25] drm: use correct ccflags-y spelling
Date: Thu, 12 Oct 2023 11:21:34 -0600
Message-ID: <20231012172137.3286566-24-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012172137.3286566-1-jim.cromie@gmail.com>
References: <20231012172137.3286566-1-jim.cromie@gmail.com>
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
Cc: groeck@google.com, linux-doc@vger.kernel.org, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, yanivt@google.com, seanpaul@chromium.org,
 bleung@google.com
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


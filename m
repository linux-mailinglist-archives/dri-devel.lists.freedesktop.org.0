Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59E93312C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1725D10E860;
	Tue, 16 Jul 2024 19:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jsj7VbcK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF13310E845;
 Tue, 16 Jul 2024 18:59:20 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-8152f0c63c1so5470939f.1; 
 Tue, 16 Jul 2024 11:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156360; x=1721761160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MstXp7FK88BMTd8JHXdyfJJm9pHe+R2QRKpv7nuxLhw=;
 b=Jsj7VbcK49i5QsdNLiXz+T/u0zxTLPlfNaMrhfGUcaqVadnbeXtLdv09bsf6XKjr99
 YtIlRTbfLXFnP3TS0Jp/I1p7C/gtSrjQieLMt/oV1cq5ELAJExmgaDpgo2IbEa9QzfTP
 qhWyASCEbrwQokaJqo8czvXo/eC7nfIqd3BdePXnD2X99DD56GJWXoB3tDzIzH3iTOFb
 8P4f8dFgsfuQa4tSdeO8reanIz+6ipxg0wApQlej9WkEFjWOc7cd9VCE10c9Un96fT48
 DUNzQ3q3ZEQvDr5XMukzntq7CJPzb4cjrIkUQHdWzrb4MsF//sgLPYegN+gTQqRCWXqZ
 io3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156360; x=1721761160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MstXp7FK88BMTd8JHXdyfJJm9pHe+R2QRKpv7nuxLhw=;
 b=v1N0YhCfKON4gRSmjxjdbh4myLZ+U9QCU74EI4lb8Vg5WYo4oJYWzRwamdwoSp9Y3P
 eUsFl63hThX4ujNuOmdOqA8u2c7gGTexisFaywNJ/D0xkAsCC+YoxHhcQUJi3zT6O+2B
 bn/RnNTfjUxXn4BG52SY6hS2GMd4tGq3iV2B9ndd9XPHwnaLuRjD2UkhQ7KUFD6g7cV6
 BjBmkDakz+i8HRj54S+lqA65TkQxjm86ImKUbHb3eefrAEPMwWqwnTz1G1HDlRtf/jkk
 QXcM8XP1VpA6P7c/976yr03pY/QYlZ7PDRajzz64ltSVJvjDd4GzsL60RFKf4yL+XRc6
 bI9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdOtPkWohyZyLIG9bgovlvoN6If6FUIE5DxcjjMBkiMDE9A8k1xjBgJDImyy3Te9UC2FiWgsUuLyFg2mhgqc8v8iAY4MiDQ4T7w0qYEemD1Y1ahcIy8sd1cx1gI1vmd6dqHKS9jcBcPn4QuUVr4BGOwBRIoOU5jh1No4eyOKoEiGJ8sL792e+1y+H2Ah0tEmBj4Pp+vUoMaEcUnRE3+6qoVc85HZ6y7voZVwob2izuFIqNWKM=
X-Gm-Message-State: AOJu0YyDKDxwbSW7eHfLOBM4gb26ofa+he9hLekm5fKlzzYx7sJtEMWb
 hfoqVP0gSYPOYRGIKHzSj3BWy8xhld/szxPjPFQVoylMFU0H+iuf
X-Google-Smtp-Source: AGHT+IGQuunN6rsgX1Y8tE4Gm2pjADPPVTDv3hD9rbQpd59uugz0Y/Tl+qes57urn2HroXprfn28JA==
X-Received: by 2002:a05:6602:2cc5:b0:804:fc36:dd02 with SMTP id
 ca18e2360f4ac-816c52c09bdmr40756239f.12.1721156359955; 
 Tue, 16 Jul 2024 11:59:19 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:19 -0700 (PDT)
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
Subject: [PATCH v9-resend 43/54] drm-dyndbg: add DRM_CLASSMAP_USE to gma500
 driver
Date: Tue, 16 Jul 2024 12:57:55 -0600
Message-ID: <20240716185806.1572048-44-jim.cromie@gmail.com>
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

The gma500 has 126 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 8b64f61ffaf9..5e03ac7ff433 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -39,6 +39,8 @@
 static const struct drm_driver driver;
 static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * The table below contains a mapping of the PCI vendor ID and the PCI Device ID
  * to the different groups of PowerVR 5-series chip designs
-- 
2.45.2


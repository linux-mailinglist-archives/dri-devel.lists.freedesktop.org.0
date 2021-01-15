Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55662F83AD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EF56E4D4;
	Fri, 15 Jan 2021 18:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2716E4D4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id 6so2911948wri.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ouF11XatezVbFMuPjsn7FwMINIqwkDbexOTfYg8EXx4=;
 b=Gk/bU3FB1IFDV8OfDg9iJegntzsA+v1LnclxDJt+hsb7B4CgA13LFMBZCzfJN+gsWX
 4jHt/mC202CfahomgeLpBcXw0YKenaVlwcrOqoWo95y1alita7OLMMIC+RdNbS7Qnlme
 yyHeijNl3qu0QtHk9jO4YQ5oI7E2HOTmXVR3w88AFncHrcLrmwit+YFBZYpP7uEpwpgG
 ANejlTeY5nMYc3NEJMrYiVncAdkanlvh1jpcxOo58Rr/KdyXYyY6RYfgLJrjSrnFIHaP
 plEjM7ddJ8zkdB1439qXoEo6KAX5vVV4wmUA+W8vCa+yhZumnGW7wPFSBZtfA+6CKRMk
 KQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ouF11XatezVbFMuPjsn7FwMINIqwkDbexOTfYg8EXx4=;
 b=Lhd+vgyueKxbirNKFh1LrObwz8vBQPKbzrjF1tY8ma0+EicrKtr26iyTn2r0DK0GAh
 XnWbETnOGE2kpH5ze4HxZSfPQOcASXeRIOEe0C4z/cc2+Mh21DuinUdJ6NOqDZcSaDIe
 8mdV7Py6bwj9EhZ8iKXL+GHh0jQTbVweWUI39NtpYXLoScQ72V+YpZ44dQ9so4RWV+aI
 8iG8v+y7UXNKLiiRINvkDBFL4Zwi3ALLEisBpG1uipIw/uAbPhxbyGpahyULj3emsOAF
 kXAeg8A/ICrED1IUyKlLQMy065BxnPOXuxuM8XjG3zXvEFFWkM/tZS0sFPXH8kWF+QQE
 J05w==
X-Gm-Message-State: AOAM531R4WwkxQzQY0Q3PjbAOeNq30owU5qOUfuKUq04JsN5HjAS6+7C
 d6h4dTbsFxfxDPoA55e4/k1E9A==
X-Google-Smtp-Source: ABdhPJxWIcNsX9CfW4n898DqqtkFvgS6ZiJ3Dm+q2aQO76ewoRPXBVCi8e54Aik3hGgwUT/JjGyNYA==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr10085990wrp.172.1610734588620; 
 Fri, 15 Jan 2021 10:16:28 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:27 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/29] drm/gma500/cdv_intel_lvds: Demote unworthy headers to
 standard blocks and fix another
Date: Fri, 15 Jan 2021 18:15:48 +0000
Message-Id: <20210115181601.3432599-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Jesse Barnes <jesse.barnes@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/cdv_intel_lvds.c:83: warning: Function parameter or member 'dev' not described in 'cdv_intel_lvds_set_backlight'
 drivers/gpu/drm/gma500/cdv_intel_lvds.c:83: warning: Function parameter or member 'level' not described in 'cdv_intel_lvds_set_backlight'
 drivers/gpu/drm/gma500/cdv_intel_lvds.c:107: warning: Function parameter or member 'dev' not described in 'cdv_intel_lvds_set_power'
 drivers/gpu/drm/gma500/cdv_intel_lvds.c:107: warning: Function parameter or member 'encoder' not described in 'cdv_intel_lvds_set_power'
 drivers/gpu/drm/gma500/cdv_intel_lvds.c:107: warning: Function parameter or member 'on' not described in 'cdv_intel_lvds_set_power'
 drivers/gpu/drm/gma500/cdv_intel_lvds.c:298: warning: Function parameter or member 'connector' not described in 'cdv_intel_lvds_get_modes'
 drivers/gpu/drm/gma500/cdv_intel_lvds.c:480: warning: Function parameter or member 'mode_dev' not described in 'cdv_intel_lvds_init'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: Jesse Barnes <jesse.barnes@intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index b62368962c219..5bff7d9e3aa6e 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -74,7 +74,7 @@ static u32 cdv_intel_lvds_get_max_backlight(struct drm_device *dev)
 	return retval;
 }
 
-/**
+/*
  * Sets the backlight level.
  *
  * level backlight level, from 0 to cdv_intel_lvds_get_max_backlight().
@@ -99,7 +99,7 @@ static void cdv_intel_lvds_set_backlight(struct drm_device *dev, int level)
 	}
 }
 
-/**
+/*
  * Sets the power state for the panel.
  */
 static void cdv_intel_lvds_set_power(struct drm_device *dev,
@@ -291,7 +291,7 @@ static void cdv_intel_lvds_mode_set(struct drm_encoder *encoder,
 	REG_WRITE(PFIT_CONTROL, pfit_control);
 }
 
-/**
+/*
  * Return the list of DDC modes if available, or the BIOS fixed mode otherwise.
  */
 static int cdv_intel_lvds_get_modes(struct drm_connector *connector)
@@ -471,6 +471,7 @@ static bool lvds_is_present_in_vbt(struct drm_device *dev,
 /**
  * cdv_intel_lvds_init - setup LVDS connectors on this device
  * @dev: drm device
+ * @mode_dev: PSB mode device
  *
  * Create the connector, register the LVDS DDC bus, and try to figure out what
  * modes we can display on the LVDS panel (if present).
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

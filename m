Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B365A1ED4B6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 19:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC4E898B7;
	Wed,  3 Jun 2020 17:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD369898A3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 17:07:54 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t18so3188935wru.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 10:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eQn4SPNZ858vxzD2Qu1uxFmadmCL32RUlJjsXOLL1Dc=;
 b=meh/wcsjyxN/EkwHcJ/9yJvisz4KvurKEV8v2Pv3G02MfuyP/tbkEV1Dteet4HxEh1
 e8ZRxAZaKQpy3aZYG2oeubXypRHZKna3iHUjcGFDI0TsXgdmjYcl5q6O2ss3LtgkFiAp
 v+J1X3tvsF7gb1UoPsISCahQSMaKagDOV55KH65LoPXHKJJUCxAqLiL7TYFldx8atZdz
 jl4aEJayGJGxnzQV9GYgOzF0lnajeMlrmB+nimRnbRerjcGy3AROEONqLrwvmvvb7Th9
 yJDNh/KD8x4ZJNXHi2RvdvfkTNRMzCzO0zk6Yn768px3fhboYWRSNAtmPjX8fIS1Isqd
 q83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eQn4SPNZ858vxzD2Qu1uxFmadmCL32RUlJjsXOLL1Dc=;
 b=M0AXz8BrLC2+GdzuNUDyVjGGbqfhV7Nef8LY+5vMqzwNXG6O26iCW0DHtRVLyYYFYC
 ssc5f3K1WrfliM2M2k74bq9agrCzuY0R9bYtlrCb+fBKVEYBAoGhWTRVc04l1KWlYXaL
 lLvjkrMeKJo2im76AXQMbP4nbwUujSOFDzwABQzr6cFFcYHkwr4izGqX4mFUNQSPA2Hr
 zFhvHdq/IjdHkPHIEeoSGpzQe0uqHrZYue7C5SnaPEbo0vJNmXU8No/7ACVHacwjqC4H
 MazLUAg+RUTgkoJW5H5JNG3WVEx5eHIglSvcQBAUuj0FOf7mgvxtXszTWEtqLmcBL0c/
 EkOw==
X-Gm-Message-State: AOAM530PXN/cxaJkr6A/ofvz29vN8Zptq4TUSUTR/KT4rJJAaewcgTSV
 tQv8I7GN7YjIjgaLKYTWw/Wn2D51
X-Google-Smtp-Source: ABdhPJxmD35LDixXTSWCvcJ+5TpaaUsx/xEvrCw+NF9jMZ+M/v5SiM1w6bmNYgedlsA7PVKwr5oc/w==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr427322wrt.322.1591204072935;
 Wed, 03 Jun 2020 10:07:52 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id 30sm4261284wrd.47.2020.06.03.10.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 10:07:52 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/todo: Add item about modeset properties
Date: Wed,  3 Jun 2020 18:04:34 +0100
Message-Id: <20200603170434.2363446-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some information about pre-atomic modeset properties alongside a
list of suggestions how to handle the different instances.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 Documentation/gpu/todo.rst | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 658b52f7ffc6..6648fd13cc1e 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -392,6 +392,38 @@ Contact: Laurent Pinchart, respective driver maintainers
 
 Level: Intermediate
 
+Consolidate custom driver modeset properties
+--------------------------------------------
+
+Before atomic modeset took place, many drivers where creating their own 
+properties. Among other things, atomic brought the requirement that custom,
+driver specific properties should not be used.
+
+In for this task, we aim to introduce core helper or reuse the existing ones
+if available:
+
+A quick, unconfirmed, examples list.
+
+Introduce core helpers:
+- audio (amdgpu, intel, gma500, radeon)
+- brightness, contrast, etc (armada, nouveau) - overlay only (?)
+- broadcast rgb (gma500, intel)
+- colorkey (armada, nouveau, rcar) - overlay only (?)
+- dither (amdgpu, nouveau, radeon) - varies across drivers
+- underscan family (amdgpu, radeon, nouveau)
+
+Already in core:
+- colorspace (sti)
+- tv format names, enhancements (gma500, intel)
+- tv overscan, margins, etc. (gma500, intel)
+- zorder (omapdrm) - same as zpos (?)
+
+
+Contact: Emil Velikov, respective driver maintainers
+
+Level: Intermediate
+
+
 Core refactorings
 =================
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

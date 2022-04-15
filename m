Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58DA502F63
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 21:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897E710E2E2;
	Fri, 15 Apr 2022 19:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C354F10E2D1;
 Fri, 15 Apr 2022 19:52:11 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso8851090fac.9; 
 Fri, 15 Apr 2022 12:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Su+WQbxMXrM+OhvwH5m5NIoIdi7+bcOuNz7k20oxO8=;
 b=hV31H4GIKDe1FUOWsNZLWg75tgQJHCXdLrn3KDSuE2Kzmx88TM5H+oC8Vq/OHpVNjj
 1FzgD5qpROIwiMMXWitW6jq6SdZKNI22BpyYpWcQdZOPopz5E64DQGF7Edh9QHTbydvR
 i+0fPSQwZWKgs09Gnc96CguYkzV9X0TbfCnZEoYaWytFgJO83e+M0YoB8Zkv78IMbf1b
 9dV8NOVouDw5cjX9gOCy5icxq5mycwTwvptp80+wPP47blV46Q7gTnhzpKmwDreVnny/
 xxF9MLtpfHGUL4zNTEFg9A4L7HFtbb5sm0Ha2nwlGw79LU1WVzmg5T6NXIb2sfi4bOuH
 4q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Su+WQbxMXrM+OhvwH5m5NIoIdi7+bcOuNz7k20oxO8=;
 b=4mDTHQK6E76IhsCFHUMD1QeAijdwowle+3JjOVGZjjEIFOEEr1H3yMK3/Kh9JmOspX
 Z8qEvxez8h/g0dYpM2AY979JItd+v3ndrnRWP0TLyqBOsN3GQwUDhiu71ocDsIJy9EQz
 ddI6T4DEpkw8b4xOY+7wBfrv7w5HcO2FTtc/8dqax6CCL0UeSWpObpTC3IYkK/0T2jOJ
 vvROfYyu8iBA6FrMC+LoLwuF0730FOa5Bx63US2D5Zu9x3Bklm4KmUByVi/zoQ7eAs3w
 fVxZ+cO5hgZes2s7tCOh7X4YCtI9KAjREfwfaA9K2jC01pc4pO8fCdfmol//ioLJAHsk
 BHYQ==
X-Gm-Message-State: AOAM533XR7M95RsOAIid556bLxUoVBKYKQ8wqN72sRXMdYDBqJjzUaeA
 sv/lPJmcpZgk0Ac/UoxwGjcG4IrGJfgHDlZc
X-Google-Smtp-Source: ABdhPJzvv6gcmeVAdWroqSq6Wxi3b/FlcuW63p6fWik33qgg/97LvEtlOvFCCEpJrcCnCTNFem9YOA==
X-Received: by 2002:a05:6870:15c9:b0:dd:e6db:cfce with SMTP id
 k9-20020a05687015c900b000dde6dbcfcemr2018666oad.269.1650052331073; 
 Fri, 15 Apr 2022 12:52:11 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4c2:8a9b:dcc3:45ee:2581:b4cb])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a4a2854000000b00329d3f076aasm1436532oof.24.2022.04.15.12.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 12:52:10 -0700 (PDT)
From: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrealmeid@riseup.net
Subject: [PATCH 1/2] Documentation/gpu: Add entries to amdgpu glossary
Date: Fri, 15 Apr 2022 16:50:26 -0300
Message-Id: <20220415195027.305019-2-tales.aparecida@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415195027.305019-1-tales.aparecida@gmail.com>
References: <20220415195027.305019-1-tales.aparecida@gmail.com>
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
Cc: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing acronyms to the amdgppu glossary.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/1939#note_1309737
Signed-off-by: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
---
 Documentation/gpu/amdgpu/amdgpu-glossary.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
index 859dcec6c6f9..48829d097f40 100644
--- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
+++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
@@ -8,12 +8,19 @@ we have a dedicated glossary for Display Core at
 
 .. glossary::
 
+    active_cu_number
+      The number of CUs that are active on the system.  The number of active
+      CUs may be less than SE * SH * CU depending on the board configuration.
+
     CP
       Command Processor
 
     CPLIB
       Content Protection Library
 
+    CU
+      Compute unit
+
     DFS
       Digital Frequency Synthesizer
 
@@ -74,6 +81,12 @@ we have a dedicated glossary for Display Core at
     SDMA
       System DMA
 
+    SE
+      Shader Engine
+
+    SH
+      SHader array
+
     SMU
       System Management Unit
 
-- 
2.35.1


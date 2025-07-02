Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EE8AF5E38
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 18:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FBC10E743;
	Wed,  2 Jul 2025 16:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RTaLnFCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E3D10E743
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 16:14:06 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-74b50c71b0aso642704b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 09:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751472846; x=1752077646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0c/84mBXTtb1I5DJ3f//CNcOZAIu4pgnp07Yr6FAASE=;
 b=RTaLnFCyAQiv4gkL2C5+N6rUSvMcCcH0HbF3ueZ+OJmM4Q/fhBsZ83M7edvbYRwGhw
 LWNhbGuCYyaq7qyaqFAdeD5qqNvfwH+pNl0EolaFo//pPzTVYjoH8SyH2gxnrVHMPvmJ
 jRCt6fuTnYSNcFE5J6XNg/69R13O3vo5NTlsUOqqK+EcHmQZ9LF3rDOIRzRu3cXqIqGv
 xSWWHB4jTtqYDI0eTjekbvFVwith7aMXhtI7Ayx0DPihn1bHAMiWtjYa0lWCKF1/d40X
 f7873u0R7ONmNBdgr7IplFC5SMEfoUSfi2JxQQYESFnTkElmc3noEulcQ0bfFhfsUlht
 fcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751472846; x=1752077646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0c/84mBXTtb1I5DJ3f//CNcOZAIu4pgnp07Yr6FAASE=;
 b=qJ6pm1t5WeohRL47dQa0hx22YJ4uJyhwWEfwyceF1/dh6mw9ZvADuzO29X13etjvQs
 KLOR2rLjVVm408aAj5I0Uf70N0EzNvF9BgFC/bVu6/L79mhiRXvspntN6TCd3h4iZ37t
 SXOlK/rnjXK5jtvD0PPqVlWznDN3Nwh+0FAuy/VNW4T+Cq+TUJX88ewgU5waFdv9bMdt
 JU8EMHtMrKghI/xE18197SflK9uP6E2ZSomlNcfipHoPLbUhbvCz77ozQJuGXT/1iagY
 0dbe+kNorkz8u16GZKbOhWuQUich6QzEeEhZMdujX0xLfKB5P1UcRV/kGu5o2NEGbfTR
 WTYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVJKSEwv0Og6rnCjvlmCRxkO0szUniY/BRLR+ZURjwQtQjFlop8MIoB+7yX2/w0IkTAin1q+YIBZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxls2RrmbezlxoIfsDPwJDuWy5fpYhMN55Vmvcawr8Nn+agUsCI
 KnvXgcEKMu9ezAnMtsMKIuOncgw8a75BIiPCmsR0WSTvoE/Edl7zi/NApDIhr5A6pyU=
X-Gm-Gg: ASbGncs/Bu/DyEYeF1fmqylCN0Kxghc0Df7Er/Vg20zuJuSK5foO4j7Jf9z6Hip2sN4
 ZZ8y/29beAwftuLq/BfHc4Nw7T/QHKYtagXV9xZQNH1rWJ8AF2M+yRqF95lwGdmE1+p5bEzHyJi
 /X6h1dimtX+oWdK44vQLRWA7xIJsxPvX+0Aphg31PP/y/RtenYAX5TK3lpMRaYQ87+RFfK/3eWd
 0r+alNdAov4PVegvSmG8wU6/HZ6B9uK3KHUU86scvZNMpjEs/JKER090VMxU51aHSNqSDwn9u6W
 FySLKHg1yLTX2vwrIryc/DAmuYHSzCWQLOxV6cyMpRiAczSZXf9uJiv9oOsuZJmLfWT0rM4ft1M
 JmGq927M=
X-Google-Smtp-Source: AGHT+IEVOoy1Wg3zr/ivZW5QJMDsut3/0p00VNy9N/gGgSjttY9YOrjPlh1fZzMAA62oF74U2z1nzQ==
X-Received: by 2002:a05:6a21:62c6:b0:220:82c7:309c with SMTP id
 adf61e73a8af0-222d7db195bmr6344370637.7.1751472845622; 
 Wed, 02 Jul 2025 09:14:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c408:a02c:2fc6:2cad:e985:b61d])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b35016ee1e0sm9385740a12.54.2025.07.02.09.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 09:14:05 -0700 (PDT)
From: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kevinpaul468@gmail.com
Subject: [PATCH v3] workaround for Sphinx false positive preventing indexing
Date: Wed,  2 Jul 2025 21:43:37 +0530
Message-Id: <20250702161337.69943-1-kevinpaul468@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Functions drm_format_info, drm_modeset_lock, drm_ioctl_flags are not being
indexed in the documentation because there are structs with the same name
and sphinx is only indexing one of them, Added them to namespaces as a
workaround for suppressing the warnings and indexing the functions

This is a bug of Sphinx >=3.1, first reported by Mauro in September 2020
Link: https://github.com/sphinx-doc/sphinx/issues/8241
Open Pull Request
Link: https://github.com/sphinx-doc/sphinx/pull/8313

Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
---
 Documentation/gpu/drm-kms.rst  | 4 ++++
 Documentation/gpu/drm-uapi.rst | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index abfe220764e1..b18a99869b6d 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -357,8 +357,10 @@ Format Functions Reference
 .. kernel-doc:: include/drm/drm_fourcc.h
    :internal:
 
+.. c:namespace-push:: gpu_drm
 .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
    :export:
+.. c:namespace-pop::
 
 .. _kms_dumb_buffer_objects:
 
@@ -473,8 +475,10 @@ KMS Locking
 .. kernel-doc:: include/drm/drm_modeset_lock.h
    :internal:
 
+.. c:namespace:: gpu_drm
 .. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
    :export:
+.. c:namespace-pop::
 
 KMS Properties
 ==============
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 69f72e71a96e..e9d7b7282a19 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -554,8 +554,10 @@ DRM specific patterns. Note that ENOTTY has the slightly unintuitive meaning of
 .. kernel-doc:: include/drm/drm_ioctl.h
    :internal:
 
+.. c:namespace-push:: gpu_drm
 .. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
    :export:
+.. c:namespace-pop::
 
 .. kernel-doc:: drivers/gpu/drm/drm_ioc32.c
    :export:
-- 
2.39.5


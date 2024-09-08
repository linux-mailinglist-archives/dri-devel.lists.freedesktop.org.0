Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEE4970729
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 14:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D06910E17D;
	Sun,  8 Sep 2024 12:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FJEuBfd0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A9610E17D
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 12:04:49 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42bbe908380so30121305e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725797088; x=1726401888; darn=lists.freedesktop.org;
 h=content-transfer-encoding:autocrypt:subject:from:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pMtdBLoDJGVGHaQEZcHM1icGAqYuf9SguZkIFznfapw=;
 b=FJEuBfd0aTcyjp54J2tTgBVYnROnF6zG0mwHIRSLi7jz2oLZvNBslkA3CuYtlAwF7P
 YDfksFV28bVTrS+8WLehGRuHzSKc2fZ2UOE0/SHBnRR1J/cvy4jIlqeMkV6BRed0H4ar
 5p2a5VFtpI4lUFZdRJ/Dll0y+7xvj70F7OFB70AuWlGPaXg9KVdUvLjjIud56wQLMQvy
 Cvmsxj3bJrenxGXT5D+mzhTSf0ZuEa8nHl+FYaBqPjXANaTizu7Iba604auaJev9X+k3
 goQ8ucQZVwB23S694Qa61u3a9t9yKzDf/PpSZLJlQJPNpx9QRq29VTOlDX/ClUR4F1cp
 ME3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725797088; x=1726401888;
 h=content-transfer-encoding:autocrypt:subject:from:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pMtdBLoDJGVGHaQEZcHM1icGAqYuf9SguZkIFznfapw=;
 b=GNvGu2UIvyxgBoERJKmPD9p1+n/fjIHkfs0PgVRTz+hnzpmRi7EuHjRlDruAbupt8A
 h+ySreZYo9/SUw9Ot0H6TlvPIo5hzLmarle0X4vvWQ98RPo+48BbkmcsYQb7rQgcloAt
 dYQohbQ2qRT4sj79KLovtmaKpUiFYng6NOmlrkFkYwleL0obFG9mW4yddsBIyALj6yxG
 bgQztB+4ryhQGBztBTTXiY+kzoJJygWj3vPw4OIbF6cTroekS24ER7LufHfknvRtDb4U
 HclJeJDcjMBDBpR4xKtc9G3Q/zATvg7vBsierdWSHoGhO5PFi7I1+9Dlcm3ercgeljq3
 kG+g==
X-Gm-Message-State: AOJu0YyZ8sT4k3BNphyuCQ2pFi7UgB1QF2SrUgfcnJrGM8VlcDM8qZtA
 vKK+gE3Pjc+VrNbWnrrUm7lxsVlHe4i/n9WqPT92WDoVTVrg67hv
X-Google-Smtp-Source: AGHT+IEBBhK5Ay79xo4XtTWw87SDtuFOnGqy5OXBoXUpfbuOQ5fWYFJPkaCchLErndc1zAHLCqwNjw==
X-Received: by 2002:a05:600c:3511:b0:42c:acb0:dda5 with SMTP id
 5b1f17b1804b1-42cacb0e2c4mr36385135e9.1.1725797087283; 
 Sun, 08 Sep 2024 05:04:47 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bd18:a600:88fa:9e17:3532:fcf4?
 (dynamic-2a01-0c23-bd18-a600-88fa-9e17-3532-fcf4.c23.pool.telefonica.de.
 [2a01:c23:bd18:a600:88fa:9e17:3532:fcf4])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3789556aa7dsm3312125f8f.0.2024.09.08.05.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Sep 2024 05:04:46 -0700 (PDT)
Message-ID: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
Date: Sun, 8 Sep 2024 14:04:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>
Cc: "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/6] drm: Series with core improvements/refactorings
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Series with DRM core improvements/refactorings.

Heiner Kallweit (6):
  drm/sysfs: Remove version attribute
  drm/sysfs: Drop unused drm_class_device_(un)register
  drm: Refactor drm_core_init error path
  drm: Change drm_class from pointer to const struct class
  drm: Add __init annotations
  drm/sysfs: Remove device type drm_minor

 drivers/accel/drm_accel.c                |  2 +-
 drivers/gpu/drm/drm_cache.c              |  2 +-
 drivers/gpu/drm/drm_connector.c          |  2 +-
 drivers/gpu/drm/drm_drv.c                | 18 +++--
 drivers/gpu/drm/drm_internal.h           |  2 +-
 drivers/gpu/drm/drm_panic.c              |  4 +-
 drivers/gpu/drm/drm_privacy_screen.c     |  2 +-
 drivers/gpu/drm/drm_privacy_screen_x86.c |  2 +-
 drivers/gpu/drm/drm_sysfs.c              | 89 +++++-------------------
 include/drm/drm_sysfs.h                  |  3 -
 10 files changed, 39 insertions(+), 87 deletions(-)

-- 
2.46.0


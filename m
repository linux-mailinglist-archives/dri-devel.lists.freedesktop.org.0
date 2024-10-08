Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B74A9954BC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 18:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9427310E593;
	Tue,  8 Oct 2024 16:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="QgecRrAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF99F10E593
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 16:44:48 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42cbb08a1a5so60057695e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 09:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1728405887; x=1729010687;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=udKngyn+COgJHxzCzBfjM15Dlpu8/Zt6WSESJW97sjY=;
 b=QgecRrAzrsdGeLpLHHpNM2Sq/eHbvSjzFJxsKZXtqJN1cCPfQ4XdIVwrHOkgNmBc8+
 nNgq0+fM55nIO4sSQW0wgw43FQa3kQ4TOegC0BvFq14tX20tU8zlq8fGgVmNxk8EF3qB
 2Hda+ETZ+XCLD9XjtZRyNMS014AzCnkT65ZFm3c7ZIYx20fxsZJ+jlbXC+XhiLcRHWzZ
 /oyUGQWMn2t5KkAPBlmJXhpRJXmhAenttUhpT4KAnPfuaT0T4pUqziZ3ZbC6OScmoH1g
 N0/WARZGIUyKJ11KdJbXNw2e+eea30/GuIeUORtfwRU05i4eGEcSizW3zp9xODSUPLA6
 ud5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728405887; x=1729010687;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=udKngyn+COgJHxzCzBfjM15Dlpu8/Zt6WSESJW97sjY=;
 b=nRdVdeeaePQbiusQnsv6MznjTZoQ/Vp+JP8uOLg4wQzp091VNkWcMd9+RpslbDeSES
 2PWD9Rbkp45CEcWD65Ot4V69o8mc7N84eq6cCFIPnMVbIEh2BOESNb2iVf/F67BnMGoS
 BudM88zDpu7QGXfq0KV918oK9I+jv/zZp5gO8cZnGUkPJ86qXrlWlcrdHHcwbOlH1I3K
 7HjNZkeh8RHhjkV6lAmmzDEPAcbcOTSzCC/snE00/Uim0Z+0hR/AaeCPqIIXdvG2cz4e
 q+1Fc7a+iI4U5xsypME/NmYZuAobg5ywebWrh1KwTqZXlYLDxb/a+b5XtqOXRkyGQsiV
 lT9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2w3igJk4rOdBZfiIWr1IfzQ7uCsbpRG8b4basvUyU4IpNCPFPqAHyxjSur72HpCrN0+33E2MHjVA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHxdB2DDlP9dHmiQPEuSQF9VOec54jms3Y5xXpmythtkxSZDOc
 q4tb8wCPeFREYIIOi6yD9NpASTRmWcHS9bTNkB1jPuYt7DwL3/7TkUXquTb8SWo=
X-Google-Smtp-Source: AGHT+IF27i1dGmIROblQGzX8h59SOUWQT8qB9G5dks/SKZ7D0pTTjd6iXvAjWXmjbSdIpGlxGbY7dQ==
X-Received: by 2002:a05:600c:512a:b0:430:5887:c238 with SMTP id
 5b1f17b1804b1-4305887c481mr458385e9.11.1728405886643; 
 Tue, 08 Oct 2024 09:44:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42f86b4acddsm132133155e9.44.2024.10.08.09.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 09:44:46 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/3] drm/vc4: 3 minor fixes from mismatched
 drm_dev_[enter|exit] calls
Date: Tue, 08 Oct 2024 17:44:33 +0100
Message-Id: <20241008-drm-vc4-fixes-v1-0-9d0396ca9f42@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJhBWcC/x3LQQqAIBBA0avIrBtQUaiuEi1Mp5pFFgoSiHdPW
 j4+v0KmxJRhFhUSFc58xw41CPCniwchh27QUhsl5YghXVi8wZ1fymicp03byVjroT9Poj/0ZVl
 b+wD4y1sfXwAAAA==
To: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

These are 3 fixes noted from Marek's report that he was seeing lock
held issues.
The place he had noticed was actually triggered due to an incorrect
change to a conditional, but also a further place was noted where
it was possible to leave the function without calling drm_dev_exit.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Dave Stevenson (3):
      drm/vc4: Match drm_dev_enter and exit calls in vc4_hvs_lut_load
      drm/vc4: Match drm_dev_enter and exit calls in vc4_hvs_atomic_flush
      drm/vc4: Correct generation check in vc4_hvs_lut_load

 drivers/gpu/drm/vc4/vc4_hvs.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
---
base-commit: 2c34a5464007c45142af009d13c668b0630ef9c0
change-id: 20241008-drm-vc4-fixes-4aceb259455c

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


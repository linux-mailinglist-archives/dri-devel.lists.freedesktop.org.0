Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8D5A6ADD0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1293E10E6E5;
	Thu, 20 Mar 2025 18:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KZpUzE0l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A663F10E6CE;
 Thu, 20 Mar 2025 18:54:06 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-85b3f92c8dfso39676639f.2; 
 Thu, 20 Mar 2025 11:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496846; x=1743101646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=av5O5WnsuBn1uC/IGfMHk77btJQzrlTi1UNrBIeIfGA=;
 b=KZpUzE0lMQv/RieFNbcVBZBZmdOlbzNiZKrHop92MEFMXGphzZ4126B28soFs0BCHt
 hALNImB+dBu17LWoAs7WfZjCOB2rbCLefjJOULOGwtbEaYHQJf4Q0h8iVPxni+4Z3Ue5
 I36+QJcRM+hMoHF2HIprUpNZQ0QT9UMltB8Fkih7WVx0iKEqeP/OPfXArg+ZpRD7Yekw
 LgSgaF4slsaC1GAkinXbdTzWYve2kCWpy1+Pyp14TZG46efy6+HrFVSKip+cqVZiedy6
 vFZi+SHloF1g+/99jHhT/Lzafipe3vuzmoPt0fhsjaWP8zr4+k5aW8QUbJFbIDh9Tvim
 ueag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496846; x=1743101646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=av5O5WnsuBn1uC/IGfMHk77btJQzrlTi1UNrBIeIfGA=;
 b=A/NsHolsoOjaraOgMjk3bJ8wRhbkQlDtUYGKOhRNzDZVgU8lz9J2q+qzbcdeO/SVVV
 aHRPepnNe9IHhFdFheCaYadQnmoYxX4BQ4AajYNQq9D3cd0s2T1B3qnQ59L1btTk57qG
 feCbBBqms9FR7oSfIxaraf6wg87ammgtw5Pri0UIAZNkTnN4Z8DNH6aPFaN+Y3nbPdbT
 LR0qhedVZoQLV6uBjGbron6O7KPGPztXrrmtF9BYDbCA2mFYsJMXZ7mFnJcNV17zSqn0
 +8kx+AVQ20JmDtQ//cSw1HpbE4fu+Rvoizn+sc3o6/X7bePZn8N2Ueh0hC6BrmArKBY2
 pZlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGX41+2jNt9UU2AUN5NvPDO+RQGYfIYdWKSiyBQWYVr5tBcKJxA2I6NvRy+M+vWG4nqPvnZyxahkvA@lists.freedesktop.org,
 AJvYcCWQ3M0soypKfYGcGxBr5gHQFDt06OXArRXJ8s0yHquYWFdRh150nBN/uGuAknpGJj8oOuczmVV2aWOE@lists.freedesktop.org,
 AJvYcCWkozVO740DA8UMeXNVI3qK/FMoP6J60ePt0qqRO634O0Q10XnLjrzW5DqD/Aulzk/3hoRyKKaR@lists.freedesktop.org,
 AJvYcCXGI+3GsrQbunYOcUHIdNYSFCd7ZORoiN2218vJ20zOFzVBVSerVLl5ttRXMgsuvGxzD0H2uFfcU/TM5P1okA==@lists.freedesktop.org,
 AJvYcCXfxW+X4U11LDny/X8rkKwXMNMAue4WX6K3LQPzRN43Xh+UuCfOoP1cJQBzLXWefies268amQGgab1NmKDLbHz/Dw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbYWoGIo9nm8z+7F8P2X3ecReYogizsD67c8WTW3bsvB2X9AWS
 Wo7hPUKKCAfj5ySZ20RXlbPO7NQWO9XlNXvMSLKDuhwLM7lkWU2s
X-Gm-Gg: ASbGncvtiXetlp6LPdmi1+Ap/DsaG2LNUr71KrsGKTApmFLhyVjCRupBt7cbWbncIoX
 2leRL98mxAdnBLZTdiRk9vYEwqV3CdBZB4a//XrtbV8TBsckYDTTqN0gwQ9sljyyhHw3+W6E7F1
 5dc3diJ0PduHCTM5dyXmDJw92093tcb5LyDFKcuRgzqi7tbRb7dvoRkheLXJt3rpBo0RviXJsQM
 x+6/bHiVX6C1A1tUD+zryiXF/8G0kK6e+JcWk1XCiL/jEXWlAhO53h5y1yudtJod65RtSrjVDle
 OW15NCclQuOvbaeRkq763m91iJQ7s6hOWGoaLy8rKWHUv8Q6QAb2Ox4IvoU6qtbwuti5jDh32DN
 ESA==
X-Google-Smtp-Source: AGHT+IFrm0izbW5klOGAefVwIfXwq8vA34rc+9wleGItV26sAOFToBmsSmKm8djU5+LnJkwqDnPVZw==
X-Received: by 2002:a05:6602:380f:b0:85d:9e5d:efa9 with SMTP id
 ca18e2360f4ac-85e2cb423f8mr36109539f.10.1742496845798; 
 Thu, 20 Mar 2025 11:54:05 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:54:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 54/59] drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
Date: Thu, 20 Mar 2025 12:52:32 -0600
Message-ID: <20250320185238.447458-55-jim.cromie@gmail.com>
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

The mgag200 driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 069fdd2dc8f6..5b6ec1550da3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -27,6 +27,8 @@ static int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 {
 	struct device *dev = &pdev->dev;
-- 
2.49.0


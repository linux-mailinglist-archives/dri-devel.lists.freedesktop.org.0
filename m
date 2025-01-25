Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01199A1C1AA
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4924A10EA98;
	Sat, 25 Jan 2025 06:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="krRQRkCs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9408510EA91;
 Sat, 25 Jan 2025 06:47:42 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3cfb0ed6ef8so11168705ab.0; 
 Fri, 24 Jan 2025 22:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787662; x=1738392462; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0Zd3BfiY3W2vF0LG5AZgUdYISO6p26vGoDy33af8qg=;
 b=krRQRkCsav9BdavOZwbxi73yUJ411sO61C4YyC8p3WXBAFji+j867HjaPGO78D4ykj
 HU7Zm4APK7M4upgAuZ6oibkGzVpUJHvEj4fh7qJydtaNvLbbsJxrFq4gVxeMK7CSNbJc
 fZnPwiGa83gTa+MEFuT+VR7sc08VVq+GKVXDYLEpho46sM6wOo51gUFrD96iQ0hS3z6A
 HVVascFsEAB9/5MyLmrcK3olqOgt16leXPJ4OZtJRm43dtWzHtLQEEBZobclrE9ZC9ol
 1lJ1PU0wLqL6wLUeEhTVg7OyStUwv0VlIr0XnJ5bjsrLEhPnPaUPmoN8eZJnWWaQXwo/
 RlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787662; x=1738392462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p0Zd3BfiY3W2vF0LG5AZgUdYISO6p26vGoDy33af8qg=;
 b=BuX43gQZm0QoGwca1WhXoTPuuU7Yf2kodZvhSxAupVcsdZ/jQcw7Oiwwwy7VOy859y
 y2H/ZrXtP+I35+R3gCpAQ9GCM6w+3mcmyLuoUdYkkJFBOlomsN0v1nGwXrNMJYOSnRys
 NUPkXvtEQsOJc6L67A9Ske09kbkpnrV46N97YIVycWjl4+K8PemVvj7OH2FUiUX4dZF8
 a2zU9IEPT8O52q2C+XM1eqHKo+gSDeSdIeq3rspRVpYFsjrFnJT9DHllwPxxOeP0OkxZ
 DePJXe5uExWJQ0h92mleRD1MSrfpvd+Lr0Jcpfd4l2Uv6naDDhEOlXWAHMFPr3VbdiXd
 OtzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG0KUtqFEm04AVmlIHnCd2beU2xxZdJ4DJlEdjY+EZCUsEuS6uWd9wxKUZtpBPytKCJllAw4AMOCkw@lists.freedesktop.org,
 AJvYcCUdu6ae0oc7G8/PyvfjLqCD6ecUy2N/qBZ1fmmXaY+VuaAXZSzc6JPx6TLQvMrIjYISDdRxkqUV@lists.freedesktop.org,
 AJvYcCVDI/OadU8ZrD1QA9gCeGUS+R81x9S770QaQ6WujXbhIa9lwg806UZuzbjT71BiihJuPxGmvvjSwmfU@lists.freedesktop.org,
 AJvYcCWv42mJueOWdYiZAjNqiCzLw3mHwkOLoTbBwd00rAHtI/qip1jZ0fQGdRbTDWi4oF8RrhpK7LbDyREJNTXpAQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk54zjyJkYDKMU2wUl4AHSCszGYQ0E0/61QD1Kvej7b0r2onEQ
 aUh6prt7kmN2bV6jZ+p4ZgrcBka96qMVQBY1j9ZN0LgKKw1sbNJy
X-Gm-Gg: ASbGnctcc1EGeNSD3F78nVE2eirNMxu02aYg/8dnEZZHqYKszLwefAooGTiymt9V0co
 SMLdi9M6ll6PSNWaMSU4Sjq3KOCyW8dLBm4EhBBNN2U23QOtp4ocgzSyFTyz8hG0LTDA6MlPv4n
 OdsDYLljR3wy5KuvO4B/9s1DEVuQm+0tXZYquJcaJjL4nWdN4GMOgg6OduSf4xtz2G+65SNK7Ku
 dsb3ksNxw9PwxocwcF6dV24SAKdW+tskYau0g0q8TEGUTBuJRYde/rAo1D5PGm+1dmnGexX3C0S
 2PGGqWu2w10YcYbqM3QevUBTwuJwEPEJu3BzUw==
X-Google-Smtp-Source: AGHT+IF1zMmq3tsjDiYaBlPDj34+isgHT03SW+yXHV8H8+MqeBVAiaiWzp3yJjk7UYIGJ79lbI6G2A==
X-Received: by 2002:a92:d4c9:0:b0:3cf:b059:9dd9 with SMTP id
 e9e14a558f8ab-3cfc7a564ccmr37732475ab.9.1737787661907; 
 Fri, 24 Jan 2025 22:47:41 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:41 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 61/63] drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
Date: Fri, 24 Jan 2025 23:46:15 -0700
Message-ID: <20250125064619.8305-62-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

The qxl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 21f752644242..4b72ad1ac72e 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -66,6 +66,8 @@ module_param_named(modeset, qxl_modeset, int, 0400);
 MODULE_PARM_DESC(num_heads, "Number of virtual crtcs to expose (default 4)");
 module_param_named(num_heads, qxl_num_crtc, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
-- 
2.48.1


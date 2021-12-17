Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF947957A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 21:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44D910E5D1;
	Fri, 17 Dec 2021 20:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6387F10E5D1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 20:28:58 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 t184-20020a2546c1000000b006008b13c80bso7038879yba.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 12:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9buOhFi0q+Dx/OMfzTqRPp5hw+SV6/dM42HWcYuNNO8=;
 b=P66pa3NcByvXTlgt0CoajClGTkCuKScmYPVO/GC/7GIFd5e9PTTGrSSUBNkmJ1ONwy
 cNfw/vooGPmlxJPnexTZklmAoS/ED6I9WMdalVFo1INHssCF0H2R28H3qwssvKkvsM8K
 7Yd2BA02rywzvDdUJN/uilAuPtQ5M9V1OWUmMX1r++HRUUy/o3CW+wm1avDI3lA3Qy3Z
 ApmTmui9Q8xAPo2rdMgV+lqRTIrSP1GvjyGwSrD0uo92aNkm0wd6sytsnLcdaNZ3guho
 XLeORcPpHY2FdkTIxm77R38sg5v7ZOZmksRBz+cvBtTKaNCbRLv7N2IdsCUqfmy1rLnE
 pSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9buOhFi0q+Dx/OMfzTqRPp5hw+SV6/dM42HWcYuNNO8=;
 b=G+gDXVwc8mluBmg85t0dzV2UYVXfBo1leTzQm7r8XlobvErkwkA1TOlX6t0Aki2TE/
 sGraXQ6vDUTqcZ9ZzgUV+1YRzmzGbqrK0HnQZ6uIvd1WUOHoyRH8N/FDzYqeIo4TdZuN
 52WmUx/6+Ge5ELRNVisSt6KaswxyGT/848lD/I4r/9e6/jg0QsJeqeDKzOgBWkXqPYXs
 rSi03Ks5xV6YWZerbYPF/m7MebM2hKarMUkfLkYCrqRDFmLNK8SPx2JOzXPjbtpXDasW
 HE3lBo27+L+uJnIXEJ4QiWdA/RW+E0R525uNZPwSBJRZXvEQcNkMo86NaEsGsicg/jhD
 +fRw==
X-Gm-Message-State: AOAM531VRWefArcuFL3qrrEZ5dMSk1FP+HuPbV4vtLrQTGsOlb11M0Nv
 9BRpd3eJt1fwfqDwHzBF3Ykjj13Yyv3S
X-Google-Smtp-Source: ABdhPJxCNefaz2E9hWLS/2ohTOPd+lksZ93cTIt4DZZY2vVGhK/t8zXAXkUWbgXIDdW5t4c3oRMrMHeaWvZp
X-Received: from rajat2.mtv.corp.google.com
 ([2620:15c:202:201:1bc7:219f:9362:ade9])
 (user=rajatja job=sendgmr) by 2002:a5b:c4b:: with SMTP id
 d11mr6627318ybr.452.1639772937573; 
 Fri, 17 Dec 2021 12:28:57 -0800 (PST)
Date: Fri, 17 Dec 2021 12:28:50 -0800
In-Reply-To: <20211217202850.1967594-1-rajatja@google.com>
Message-Id: <20211217202850.1967594-2-rajatja@google.com>
Mime-Version: 1.0
References: <20211217202850.1967594-1-rajatja@google.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
Subject: [PATCH v2 2/2] drm/privacy_screen_x86: Add entry for ChromeOS
 privacy-screen
From: Rajat Jain <rajatja@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Benson Leung <bleung@chromium.org>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 gwendal@google.com, seanpaul@google.com, marcheau@google.com, dtor@google.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a static entry in the x86 table, to detect and wait for
privacy-screen on some ChromeOS platforms.

Please note that this means that if CONFIG_CHROMEOS_PRIVACY_SCREEN is
enabled, and if "GOOG0010" device is found in ACPI, then the i915 probe
shall return EPROBE_DEFER until a platform driver actually registers the
privacy-screen: https://hansdegoede.livejournal.com/25948.html

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v2: * Use #if instead of #elif
    * Reorder the patches in the series.
    * Rebased on drm-tip

 drivers/gpu/drm/drm_privacy_screen_x86.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
index a2cafb294ca6..0c5699ad70a3 100644
--- a/drivers/gpu/drm/drm_privacy_screen_x86.c
+++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
@@ -47,6 +47,18 @@ static bool __init detect_thinkpad_privacy_screen(void)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
+static bool __init detect_chromeos_privacy_screen(void)
+{
+	if (!acpi_dev_present("GOOG0010", NULL, -1))
+		return false;
+
+	pr_info("%s: Need to wait for ChromeOS privacy-screen drvr", __func__);
+	return true;
+
+}
+#endif
+
 static const struct arch_init_data arch_init_data[] __initconst = {
 #if IS_ENABLED(CONFIG_THINKPAD_ACPI)
 	{
@@ -58,6 +70,16 @@ static const struct arch_init_data arch_init_data[] __initconst = {
 		.detect = detect_thinkpad_privacy_screen,
 	},
 #endif
+#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
+	{
+		.lookup = {
+			.dev_id = NULL,
+			.con_id = NULL,
+			.provider = "privacy_screen-GOOG0010:00",
+		},
+		.detect = detect_chromeos_privacy_screen,
+	},
+#endif
 };
 
 void __init drm_privacy_screen_lookup_init(void)
-- 
2.34.1.307.g9b7440fafd-goog


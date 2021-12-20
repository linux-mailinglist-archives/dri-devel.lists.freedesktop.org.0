Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D27F47B5E5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 23:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBD710EBC4;
	Mon, 20 Dec 2021 22:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE09E10E8EC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 22:29:21 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 s189-20020a252cc6000000b005c1f206d91eso22070837ybs.14
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 14:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=fksgA1JsDJpYuy0g0e7IGPB8FkPT8ahC676Z+SBk5d0=;
 b=e+5atsRINdfmhMu85Kr/tAJ7TrsaeUuxdCQLTvU0+Xrk4IYm96lVIa+5DRuZfPxMtY
 MNbBAfxGzbhcucB8PMyMvRB7XBftaV5ZXWJxiiAoIqGt6ldQEPwx21iGX9GgZesD9jx3
 htU6B+xl/3DoWdZupBUOHRLqmNnQd+CyigxzAJTFB3ABYke0O50KOencRIXmkEvRbllz
 c6e+a3masCoiLqB33CZbf8dLtOO0/QqbPf9kVrvFEhvs6On0IdSUT53xBiUwh32VDhQK
 SEThbYVuxk6HdFQ+lPeoHPIdaw/WhO4ddxGUTa3fgP/8XEb0Nh39J5sSd3fcFccajl9y
 trkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=fksgA1JsDJpYuy0g0e7IGPB8FkPT8ahC676Z+SBk5d0=;
 b=dWBeQjycfkfJd8arZQx0zwPqGkB8VO4pZGGLETS5PbMQAox6Y2GGAEvh0QfTY2P6HA
 SEU1KJ9Rkuq3Lr7QCN6DYihrg8OkFn7Dz+CAViyPtCagXxJuM2RTMlWQDGiT1XXQtSmp
 BjzqcAy7aTJXGBHpbdl0dHuoUq3vl1fhrh87C3PcEK/SEoQmuqNoIVXWuJafw5R+n1QL
 iDnsC5ebv5Ast0kbZ5JbrRTq3cC9TeEeeCfZYugqQpo7ghtSc42N/dpG9r7o0gV0Z2ON
 6cWFHjo0znUvSG+IsXwJH/n+i5Zk7+r1zZmzlW91/4ClubCOZIAnR+3S4cB7lLbXMAxP
 OpKQ==
X-Gm-Message-State: AOAM530TSrdopUC5qvXRD/5GdVvIxHoYuXK0rk/rbeB5+F2CQIr0Bwwi
 Z6tu4RA6KmT4qFSn2Ti5K6Py9D/8F8YR
X-Google-Smtp-Source: ABdhPJzrXPMAorJsrHo+Qwly1Bs2XrhOf9wwHctqzTpYT/FCrcPqa8tsV3CcEMZ8RHpJyIAgOErATcevbHqr
X-Received: from rajat2.mtv.corp.google.com
 ([2620:15c:202:201:f6d7:6572:2e42:ea7d])
 (user=rajatja job=sendgmr) by 2002:a25:3b95:: with SMTP id
 i143mr380252yba.423.1640039360896; Mon, 20 Dec 2021 14:29:20 -0800 (PST)
Date: Mon, 20 Dec 2021 14:28:28 -0800
In-Reply-To: <20211220222828.2625444-1-rajatja@google.com>
Message-Id: <20211220222828.2625444-3-rajatja@google.com>
Mime-Version: 1.0
References: <20211220222828.2625444-1-rajatja@google.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
Subject: [PATCH v3 3/3] drm/privacy_screen_x86: Add entry for ChromeOS
 privacy-screen
From: Rajat Jain <rajatja@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Benson Leung <bleung@chromium.org>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Mark Gross <markgross@kernel.org>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, gwendal@google.com, seanpaul@google.com, 
 marcheu@google.com, dtor@google.com
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
v3: * Remove the pr_info() from detect_chromeos_privacy_screen(), instead
      enhance the one already present in drm_privacy_screen_lookup_init()
v2: * Use #if instead of #elif
    * Reorder the patches in the series.
    * Rebased on drm-tip

 drivers/gpu/drm/drm_privacy_screen_x86.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
index a2cafb294ca6..0fdd2b500e6d 100644
--- a/drivers/gpu/drm/drm_privacy_screen_x86.c
+++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
@@ -47,6 +47,16 @@ static bool __init detect_thinkpad_privacy_screen(void)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
+static bool __init detect_chromeos_privacy_screen(void)
+{
+	if (!acpi_dev_present("GOOG0010", NULL, -1))
+		return false;
+
+	return true;
+}
+#endif
+
 static const struct arch_init_data arch_init_data[] __initconst = {
 #if IS_ENABLED(CONFIG_THINKPAD_ACPI)
 	{
@@ -58,6 +68,16 @@ static const struct arch_init_data arch_init_data[] __initconst = {
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
@@ -68,7 +88,8 @@ void __init drm_privacy_screen_lookup_init(void)
 		if (!arch_init_data[i].detect())
 			continue;
 
-		pr_info("Found '%s' privacy-screen provider\n",
+		pr_info("Found '%s' privacy-screen provider."
+			"Might have to defer probe for it...\n",
 			arch_init_data[i].lookup.provider);
 
 		/* Make a copy because arch_init_data is __initconst */
-- 
2.34.1.307.g9b7440fafd-goog


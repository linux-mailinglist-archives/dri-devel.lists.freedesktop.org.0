Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCE047B5E1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 23:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8CA10E669;
	Mon, 20 Dec 2021 22:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B09910E669
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 22:29:16 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 p133-20020a255b8b000000b006086e19f89fso21917378ybb.19
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 14:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=uLgnyu9H28L0o4/5g5fqJKfG3fFXBkc3fYhacdUUcgw=;
 b=cAXdrsPYMReIJqz5vlx1QjZTgEROMGiIeIGg1hnr/dFqoONdlmTAcHo/00CNsg9RxU
 VoaXWs4KjXDtiw09HbCVQmTDwztU7VhdbAXGWfZIMoPgIkdCLjV9liJf5kwBiT848LLC
 /7LjQ/Y2BXrJFEl49u4tdH1lYhgVhQrlrndd0HCoKPQG2Tk0KA0F/BpRVUJiI1CyfO02
 n7jPM2h//GsKPjnQuzyBJg08CqTtwMF304ADnRMgvyMhkw2OXoYYImgn5UU+PLBcZbnB
 wZuqV46o3YyE31IQCkjN8bKShJgE+LJigzGE2Rtvkn/LNW5A8gPyZBiyiKenCPN+bbNJ
 QhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=uLgnyu9H28L0o4/5g5fqJKfG3fFXBkc3fYhacdUUcgw=;
 b=K7m5PTcvy4FbEt5NiVaMHxZYJazhuRk7UzZ+xAuPTcHtUas4vLtdpt67VUjQFrQDQ8
 8BO6GQcVCtzipMLkLGXPossZPAckxUgYNYm174f3+uiN1plSJEnxFM91FQH6QG+Xmpl1
 63zR1oFeZJmR31yM5MSdrtXXAqmBvexrJGSAyTn+XNFC4OwL6JGJkESEwEr26EG77HOb
 llFGiqjFpxoV+ebHn2TnUGtU5s7oFinzuBo5RBdcyErPbLKY216xt29IIj4+bP0jgAcv
 r7ON2bNcctx/19Rfzra73EK8n+U0iLn2tQhGLXeDHRe2VIXAHHFNNHRyM1pm5SaZfLs4
 1wJw==
X-Gm-Message-State: AOAM531f1Kp3+k49+Q0DBfLd/C+a0eLzMSUZ9aOC0RpEsuKk88+jfsuE
 rJhqAnSILnnogKRdI6qtL8NBs+mUDX9+
X-Google-Smtp-Source: ABdhPJxYHlhZeIVsUaUYKhbs/4y+GhYqRHEH5FjjkMj0Er17reckxShJn6sW2n6m/r22H7ANDMdsJK08zQQc
X-Received: from rajat2.mtv.corp.google.com
 ([2620:15c:202:201:f6d7:6572:2e42:ea7d])
 (user=rajatja job=sendgmr) by 2002:a25:b682:: with SMTP id
 s2mr433602ybj.736.1640039355990; Mon, 20 Dec 2021 14:29:15 -0800 (PST)
Date: Mon, 20 Dec 2021 14:28:26 -0800
Message-Id: <20211220222828.2625444-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
Subject: [PATCH v3 1/3] drm/privacy_screen: Add drvdata in drm_privacy_screen
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

Allow a privacy screen provider to stash its private data pointer in the
drm_privacy_screen, and update the drm_privacy_screen_register() call to
accept that. Also introduce a *_get_drvdata() so that it can retrieved
back when needed.

This also touches the IBM Thinkpad platform driver, the only user of
privacy screen today, to pass NULL for now to the updated API.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v3: Initial version. Came up due to review comments on v2 of other patches.
v2: No v2
v1: No v1

 drivers/gpu/drm/drm_privacy_screen.c    |  5 ++++-
 drivers/platform/x86/thinkpad_acpi.c    |  2 +-
 include/drm/drm_privacy_screen_driver.h | 13 ++++++++++++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
index beaf99e9120a..03b149cc455b 100644
--- a/drivers/gpu/drm/drm_privacy_screen.c
+++ b/drivers/gpu/drm/drm_privacy_screen.c
@@ -387,7 +387,8 @@ static void drm_privacy_screen_device_release(struct device *dev)
  * * An ERR_PTR(errno) on failure.
  */
 struct drm_privacy_screen *drm_privacy_screen_register(
-	struct device *parent, const struct drm_privacy_screen_ops *ops)
+	struct device *parent, const struct drm_privacy_screen_ops *ops,
+	void *data)
 {
 	struct drm_privacy_screen *priv;
 	int ret;
@@ -404,6 +405,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
 	priv->dev.parent = parent;
 	priv->dev.release = drm_privacy_screen_device_release;
 	dev_set_name(&priv->dev, "privacy_screen-%s", dev_name(parent));
+	priv->drvdata = data;
 	priv->ops = ops;
 
 	priv->ops->get_hw_state(priv);
@@ -439,6 +441,7 @@ void drm_privacy_screen_unregister(struct drm_privacy_screen *priv)
 	mutex_unlock(&drm_privacy_screen_devs_lock);
 
 	mutex_lock(&priv->lock);
+	priv->drvdata = NULL;
 	priv->ops = NULL;
 	mutex_unlock(&priv->lock);
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 341655d711ce..ccbfda2b0095 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9782,7 +9782,7 @@ static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
 		return 0;
 
 	lcdshadow_dev = drm_privacy_screen_register(&tpacpi_pdev->dev,
-						    &lcdshadow_ops);
+						    &lcdshadow_ops, NULL);
 	if (IS_ERR(lcdshadow_dev))
 		return PTR_ERR(lcdshadow_dev);
 
diff --git a/include/drm/drm_privacy_screen_driver.h b/include/drm/drm_privacy_screen_driver.h
index 24591b607675..4ef246d5706f 100644
--- a/include/drm/drm_privacy_screen_driver.h
+++ b/include/drm/drm_privacy_screen_driver.h
@@ -73,10 +73,21 @@ struct drm_privacy_screen {
 	 * for more info.
 	 */
 	enum drm_privacy_screen_status hw_state;
+	/**
+	 * @drvdata: Private data owned by the privacy screen provider
+	 */
+	void *drvdata;
 };
 
+static inline
+void *drm_privacy_screen_get_drvdata(struct drm_privacy_screen *priv)
+{
+	return priv->drvdata;
+}
+
 struct drm_privacy_screen *drm_privacy_screen_register(
-	struct device *parent, const struct drm_privacy_screen_ops *ops);
+	struct device *parent, const struct drm_privacy_screen_ops *ops,
+	void *data);
 void drm_privacy_screen_unregister(struct drm_privacy_screen *priv);
 
 void drm_privacy_screen_call_notifier_chain(struct drm_privacy_screen *priv);
-- 
2.34.1.307.g9b7440fafd-goog


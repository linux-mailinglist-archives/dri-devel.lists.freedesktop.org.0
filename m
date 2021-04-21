Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23903673B2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 21:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958006E9FA;
	Wed, 21 Apr 2021 19:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D036E9FC
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 19:47:10 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j5so41543617wrn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 12:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1KX4Ge8zZXYgCiWQwqMKqpWnsb1m5aafZmymxkmb0zo=;
 b=Mo1rlD6cgRfWqYbA1tV1S46DEtbQ5Y2NHPEm7nlHP8YLCd+1CDRbligh4nWm4XsM3y
 OPhUuaR0IMaJkcylyboXsNFS+tOAho+fDkTl1KF00qU9B9PgWcJstTF1Nj9kohNkB1eL
 IEQkURvwZXncSzHvHBFVUgZMcra0hZSc4vr+unpm3T+pBOI9iL+dHf36zXpH54bQQ8NI
 mWlYmMqpeg+wAt+amHCIx+2jG8myLjf6bnjB3DzkHjeOnm2FmQV99gg0BzYtSV7gezZo
 KqRRvmV4fvRJyaj8ecS1hFQLlQAmVap1C8x6+qKkpTXe9BztGqwO59gO3STC9IN9mM/w
 KqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1KX4Ge8zZXYgCiWQwqMKqpWnsb1m5aafZmymxkmb0zo=;
 b=MCW1gZ/fB0wgo+ufuBSmdf+FMk2vSnc35TWmn6eOj/jcmGANqV9xOjN9GfGTfyfm/B
 P+IVgnG2Mx3Eaw9FnBMiVeBtrdqZpVDYkdJ3d3RPwp2H2OfWJQ6oXNKXGlCejlnjXzm8
 xM091TLaf8BJFJsRTfZ0w35eBWIzz6uhb6JDjkM2vwSEEJW+xpFYDsyilJHS+IG3S9BM
 K1EGuXFp638TWVbJ5dOg5fSd+DlDSZ6Z02AKkj+rgYG9G85YHsWaXyA8+7oXGlNFsP4K
 iag5TPojCWQr70P5YDhXS24vSsStQNXklMBuh8NH3utfyHEmFTsYmZi5byrRf7jSf9qJ
 +CgA==
X-Gm-Message-State: AOAM531ApsxV2PDg4Hi9fzEZgSzrkUXzVer2JFhBya6JWGp/B8obIuHi
 naLUzFYhgGPos+/i7LvWtGo=
X-Google-Smtp-Source: ABdhPJz6tKg8JqOWqxz3763wuEjQWj6nddg+Vj7H4GQMvY+K8lM35aLlffQOqwOQ9enTFpxg1/sRbg==
X-Received: by 2002:a5d:5091:: with SMTP id a17mr28828143wrt.60.1619034428783; 
 Wed, 21 Apr 2021 12:47:08 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:6d3d:2d8b:5417:831c])
 by smtp.gmail.com with ESMTPSA id
 c6sm13004217wmr.0.2021.04.21.12.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 12:47:08 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 4/5] drm: drm_connector.c: Adjust end of block comment
Date: Wed, 21 Apr 2021 20:46:57 +0100
Message-Id: <59abdb2d65a643d5937e5773db684b926e8c9233.1618756333.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1618756333.git.martinsdecarvalhobeatriz@gmail.com>
References: <cover.1618756333.git.martinsdecarvalhobeatriz@gmail.com>
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
Cc: melissa.srw@gmail.com, outreachy-kernel@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new line with */ on the last line of a block comment to follow the
Linux kernel coding conventions.
Problem found by checkpatch.

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 7631f76e7f34..8714f2d021f9 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -279,7 +279,8 @@ int drm_connector_init(struct drm_device *dev,
 	drm_connector_get_cmdline_mode(connector);
 
 	/* We should add connectors at the end to avoid upsetting the connector
-	 * index too much. */
+	 * index too much.
+	 */
 	spin_lock_irq(&config->connector_list_lock);
 	list_add_tail(&connector->head, &config->connector_list);
 	config->num_connector++;
@@ -2288,7 +2289,8 @@ int drm_connector_property_set_ioctl(struct drm_device *dev,
 static struct drm_encoder *drm_connector_get_encoder(struct drm_connector *connector)
 {
 	/* For atomic drivers only state objects are synchronously updated and
-	 * protected by modeset locks, so check those first. */
+	 * protected by modeset locks, so check those first.
+	 */
 	if (connector->state)
 		return connector->state->best_encoder;
 	return connector->encoder;
@@ -2450,7 +2452,8 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 		out_resp->encoder_id = 0;
 
 	/* Only grab properties after probing, to make sure EDID and other
-	 * properties reflect the latest status. */
+	 * properties reflect the latest status.
+	 */
 	ret = drm_mode_object_get_properties(&connector->base, file_priv->atomic,
 			(uint32_t __user *)(unsigned long)(out_resp->props_ptr),
 			(uint64_t __user *)(unsigned long)(out_resp->prop_values_ptr),
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

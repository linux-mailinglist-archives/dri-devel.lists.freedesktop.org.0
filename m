Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA937F0195
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C8110E34B;
	Sat, 18 Nov 2023 17:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9660310E346
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 17:42:44 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40859c466efso4638705e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 09:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329363; x=1700934163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
 b=YNpPVHqrIXRzcOcM5270jqR5KSjwBjhpHBaTmdHtgGVox5z/RK9wsUrAn3+MWCxljP
 xUF6P23VNSlKDICOkfffnK5p38oZZcZMBwmiPZnDM8ea8UvMO5l3rN3FZYzKonsF/bWt
 h5MBCtzBScOfK5b2agRpacAbVOoMDBFDe5dqrWtbzbAofxLj6f1SDBskGoiuf0hdiC/E
 fICBlwO3Yt6Um/DoMX/8HukM7M1pnK3wnxR7LvVLPmuEkA3nQUqqdAm6/WBJ+ULySbJI
 Fg9bNKrkgSsHjrTb1FaoBgsc7J240RjbE3OnFvsrA+7h7ttBkgubJ3QwI8X5fToEMSTy
 h0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329363; x=1700934163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
 b=tM241u+r9duQbMg82+YVkv42xqnS093E9DpPeLbygeGRNQUMK58zQ9b0CU4VB0aGPQ
 J9Hsp6/4e1KObPgKyk9FrnqXg0mNdlJ+YQNPNZnYP4jIz7hccYvdw/+3kwI9dBUoqQ4d
 CpGwqFVL9KaDZ2sOKn8rehhy7MjHmhmdpEMTCyckxpALdP4CKRq991SeFUtvqADq50Ab
 8FHYrbyjxGY9iefW7dcCdh7NMUwO4uHA//jiWVms9/l2oYw/ECbiYZqvT6AML6m/Qvqx
 nPNNoF4gVuUvoUvBvJaza9FEnlQQp+Rr/tfRTcU8YsSrZvH61q+nN+gADzBF+z8cFagi
 7i7A==
X-Gm-Message-State: AOJu0YzA2QO3Cg51qYDhz3XtFmMzREYzyoZbNQsX3CM6lDaFtJMgzg5+
 UDqYpUBKvxpzTDkwpehcxQE=
X-Google-Smtp-Source: AGHT+IG/rpSoscDMsjiZahKHW5DKav0OGOlQ6bqp04xYQwKcY1sQ1AOt05hiLcK74Hz4Jvo+yXtCJg==
X-Received: by 2002:a05:600c:3542:b0:408:3f64:6553 with SMTP id
 i2-20020a05600c354200b004083f646553mr2565974wmq.16.1700329362877; 
 Sat, 18 Nov 2023 09:42:42 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:42 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [PATCH v2 17/20] drivers/gpu/drm/ast/ast_i2c.c: remove I2C_CLASS_DDC
 support
Date: Sat, 18 Nov 2023 18:42:17 +0100
Message-ID: <20231118174221.851-18-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118174221.851-1-hkallweit1@gmail.com>
References: <20231118174221.851-1-hkallweit1@gmail.com>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/ast/ast_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_i2c.c b/drivers/gpu/drm/ast/ast_i2c.c
index 0e845e7ac..e5d3f7121 100644
--- a/drivers/gpu/drm/ast/ast_i2c.c
+++ b/drivers/gpu/drm/ast/ast_i2c.c
@@ -120,7 +120,6 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 		return NULL;
 
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);


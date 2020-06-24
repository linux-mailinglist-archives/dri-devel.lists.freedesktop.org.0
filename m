Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 809D5207691
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AB96EB8C;
	Wed, 24 Jun 2020 15:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E346E133
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:04:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k6so2647271wrn.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RVepsW5AvbKSelkDGpeRLJ59PttgtzeSmv2QlhFjJvQ=;
 b=LsBw1uV8LrG03R4u2wAAHV9lr+txMyw7+BdND15xIDswqXzGkXd922uezxszzxlKxa
 y6z1rBpFXRbiDLX/DYinCMp07ITmQAaZc4ADuyeddcvqYS9TdDbGAYOWzoL2rDSQWcw9
 85nofVUxEK24RYZvCHdW4bsSTMWEs4SAqGBcHF+XCYhgfe54ZZFoXKhSjLS2/c9PD9N3
 MjSyj4nMjZzhJNj1+kmNeddik1BNOt9Qx4pJUmMe8atuBq0wU6WIA3OgGX8lEd5hIh7w
 uQSnwO83jCtGstF7Qtm4upnJkXj8EyJ26Ib+qAdCMXuKvWx55yEiYohCoEgTdLNct4K9
 AsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RVepsW5AvbKSelkDGpeRLJ59PttgtzeSmv2QlhFjJvQ=;
 b=clB1ION4qaVIjtbyTXCAYVlTNnKoSSZTIr0zcGyiSq2lrPBhQ2Zn7YgZDZ7DFouFFg
 eyz5Zlnuq3pOnyc3jI8tuD4V5Lld7nARW7JWPsMVee0j/5aXXuDXOko96O8zVWCThfxJ
 r+9b8q7QE6k6CdVE/zkGuf7MUkmp/0Q0GNdPAKTVwivpE9XxXsxx3kv6aAewKrj2efBX
 qA4a5OW9kBsPWUT/R5N7n83VARsodeKKJkAIb2fNNEnhQzosA8oIhvQuIHyK0/rANrzv
 duddX+IcdSlo/nY7M35csU5T0Yd1hLmet81Bt7gaYrOrgq8mH1WvDgI8WZg/0P/Y+kfZ
 +9Vg==
X-Gm-Message-State: AOAM531C02O43nuPGmVfqiKSDVt+mTVaGjqYw/rvwpYC526XLlSpWhU1
 bzx0BuGxbKAuGf4i+O5ld4jbxGbDHIo=
X-Google-Smtp-Source: ABdhPJy5hjoveRZ0F4NTZinjK6e2tP12GsQQtzyhrotgfkM8UdmF7amCXrR0qX7WGB+tS0ZfQBcPvA==
X-Received: by 2002:adf:e782:: with SMTP id n2mr31179657wrm.417.1593011088504; 
 Wed, 24 Jun 2020 08:04:48 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id f186sm8200319wmf.29.2020.06.24.08.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 08:04:47 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 6/8] backlight: backlight: Supply description for function
 args in existing Kerneldocs
Date: Wed, 24 Jun 2020 15:57:19 +0100
Message-Id: <20200624145721.2590327-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200624145721.2590327-1-lee.jones@linaro.org>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
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
Cc: Andrew Zabolotny <zap@homelink.ru>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jamey Hicks <jamey.hicks@hp.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kerneldoc syntax is used, but not complete.  Descriptions required.

Prevents warnings like:

 drivers/video/backlight/backlight.c:329: warning: Function parameter or member 'reason' not described in 'backlight_force_update'
 drivers/video/backlight/backlight.c:354: warning: Function parameter or member 'props' not described in 'backlight_device_register'

Cc: <stable@vger.kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Jamey Hicks <jamey.hicks@hp.com>
Cc: Andrew Zabolotny <zap@homelink.ru>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/backlight/backlight.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 92d80aa0c0ef1..744ba58488e01 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -320,6 +320,7 @@ ATTRIBUTE_GROUPS(bl_device);
  * backlight_force_update - tell the backlight subsystem that hardware state
  *   has changed
  * @bd: the backlight device to update
+ * @reason: reason for update
  *
  * Updates the internal state of the backlight in response to a hardware event,
  * and generate a uevent to notify userspace
@@ -344,6 +345,7 @@ EXPORT_SYMBOL(backlight_force_update);
  * @devdata: an optional pointer to be stored for private driver use. The
  *   methods may retrieve it by using bl_get_data(bd).
  * @ops: the backlight operations structure.
+ * @props: pointer to backlight's properties structure.
  *
  * Creates and registers new backlight device. Returns either an
  * ERR_PTR() or a pointer to the newly allocated device.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

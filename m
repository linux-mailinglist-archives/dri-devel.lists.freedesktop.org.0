Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE19B4773D
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 23:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6047F10E155;
	Sat,  6 Sep 2025 21:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BZTy6c3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12ABF10E155
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 21:04:34 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-70ba7aa131fso35828596d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 14:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757192673; x=1757797473; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b62IzWT3U/jmS4w32jS7evJW7nAOjCiyG+9WwQyBpOQ=;
 b=BZTy6c3ptCpNVZFfp/jSV5q8CTJE8Hfp7ek7pnFoUdiNZ6NshZn+d21qS2kVgPvp9Q
 xEuGdJHgcRwK6npelJbD9nLFkkr8Qxr7NxhYqePSOiknuHbHwAa02Io5h3FkJ4I9hr2J
 xVbzIvNxNiFuwPUrhHnUQC+O6YQ3BEKxwy1Ht7U/btSvD5v5A66npcqWHNFKlCcqKJwe
 FpypkxbYkcKSKmWb+1qnAUJYbpShlTuvNGfSk3iuhH2NqDsyQ7hnn5N/rEWnO8AAa1f9
 0n70L6Ob1bRgAgNUJVLaaB2lCNhKO1EyWMSUnZ69LKnAgTO8CnEx9wCBisRCIqgjSatE
 0V9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757192673; x=1757797473;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b62IzWT3U/jmS4w32jS7evJW7nAOjCiyG+9WwQyBpOQ=;
 b=u7KTbKMNFHewqHWdubXkxKVRvQVLLnzqWNJBfpn6eJfaA8JyEAMZaafWaXBy3H8JrH
 54MwuJMHP/sz9MMld08KmsABn6/Asz2slz/I8txSQef93Tn++p/X26OdLvxvGlZv5y8A
 WR4AE4XI7onx7Qp4Bd4WODLmJD1dF+RktNj4+r1FzNoTA6lm2K/yX5J1hsqhxCv0Yz4s
 k2ddxSBdImle7AxYKhweF23+F4xyTjL7MUGbZWJ3s/K7nZMnJ/8btuqGgs2ixuGL3bGZ
 +PFSWQte8BSNAMg6PghlSvbuRZY7YbbIQvhewDq3c9UwBkDJEgmrq3QMJHeXomnZkg0K
 Sd2A==
X-Gm-Message-State: AOJu0YzO6iJ+JvZ24oO17ojzJgFIPs3rsJI37DwfMg0TxdaQlLSFH56u
 CZs40y4sDJFEo0GEjXiCd6bibTwpSBBkKt1OlG2awEOYB2XhCeFlrmju
X-Gm-Gg: ASbGnctwA4Sg41VyO/DkEgDbaoJ8I0Me2y294XiYlmiu0j9jMJkxQgYOqqLSV5a8hqt
 I0Klu6zz+PdmNwPIfWsjnyu7GCVBMqIkCGfdszL4G04KMEGCM9TjaiZk8cZYCK5crMmkUd2dx8O
 tNJFvWig2RN2k6vg941sWAFXNo9SUoF4RlGLnEU6yGh6E9xeBWlRxgmOscfUD7hhAl9VgIzFKY2
 TWpajMmGT07hULohAWKjyAhMgATuRKsrwTaAZaqStbHtgSwDA9GE/9f6/Sw9CVR5TSuq0csbU/Z
 WnP6E32sbW7Hq65C/sz/jzp9SEIOebO9HnumMt7C2XJjGL8cnJ+3CTWTSbaga3DhX40uDJyl+px
 Yx7SdFQ06+oNmAYLnB1vmmouZmUhCbIONh3JIK4seynGP3V+kRcHytiyvvwL7i92odoqpNtAu
X-Google-Smtp-Source: AGHT+IEhb6y1k0tYnwn5fj8U8Z+JL2j+dqN/f00TH0uqlk4sL9BiBxUI+m9U4j78lTLBWmjv0tiN2Q==
X-Received: by 2002:a05:6214:21e4:b0:736:291a:6203 with SMTP id
 6a1803df08f44-73919c9e251mr38808476d6.6.1757192672835; 
 Sat, 06 Sep 2025 14:04:32 -0700 (PDT)
Received: from cr-x-redhat96-client-2.fyre.ibm.com ([129.41.87.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-720ac16de16sm91932526d6.3.2025.09.06.14.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 14:04:32 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, suraj.kandpal@intel.com,
 Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] drm/amdgpu: fix logically dead code
Date: Sat,  6 Sep 2025 14:04:12 -0700
Message-ID: <20250906210412.39904-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The ternary operator inside the if block is redundant
because the condition is always true in that context.

This patch removes the unnecessary check and returns `ret` directly.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1ecc3df7e316..654d466183d5 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4227,7 +4227,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight mode: %d\n",
 			    aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	*current_mode = (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
-- 
2.47.3


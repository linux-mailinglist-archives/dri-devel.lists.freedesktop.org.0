Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA93B24CEF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D1310E06A;
	Wed, 13 Aug 2025 15:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OmSQ43wU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2190A10E06A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:13:25 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3b78d729bb8so3988890f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 08:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755098003; x=1755702803; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CXaG+nrbYg1bcSitJNL4gXYIE8J8lX8ImkkRSgEhuy0=;
 b=OmSQ43wU+A2zBJloxLuBJlzGiUabeIF2E28VYr+pdYcx7zdjSnvYZVdn7Kk9JxfwQ0
 UzbOdHKdB+aDU+ZbvmUyDPsD2+UVIodAPmOv5Fp7bOJANwL2/1lBcop4hrjsHyDKRXup
 OJf3UdHYDfUy4S96padwkMJOgK9YjGioKbMkmfp2NYSN1jbDgvFBn6ENhMEUdhn8jm2o
 H6ITapnkgzSGZJ9RfnvRnBQHVC6457gg383qDoHKA16pr9nPa8hQWmorMZYJ0mxRoZMP
 admseeT5eJfx20UeZzHu5wXugkIU2g6sgv6n5Qid9SUArbYz/DkiZoVsQc5DePa78O86
 QUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755098003; x=1755702803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CXaG+nrbYg1bcSitJNL4gXYIE8J8lX8ImkkRSgEhuy0=;
 b=oSnr/phUBzZi2x3A5Fx0s4KIgoGVpHPVOyy0saq0dttJPGJ36z3ldE8O8KNn9XoM8P
 ztTv5sx6GoZSDLG9HQebUwfZVjG8vtuMbUF8pShFU6A7yYyCVWx8R1Kn+dD7QIWKoM79
 uxO+efjPSt7XmGMQyLVmvndZXwIBKaZ8WIGgfprh15SUWfe+S9unpCxqgEAKYyRbAvLo
 kQEVjukEtsHhtMc2ofggTBx/x/NaAEtn1moChqxhViohknnA+PRKuT1YD4CEG+YEe94s
 ImZp7WkYfYUo52ofJ49Bgq7QdnanvLjQV6XIb3HIrqpW7dWylINO48DO8d2jAUesbBHi
 o3fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6sqZoLNeWEADiTGzVw7XvSVtqVfvr/URqAhc3scmVXIaJdd/g0SLjrCxYAG35wQKgWjK9bI8DqCk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwYuaCKHQmTZ3C2ddyLClQHpYMzHPRvE8jcUybI3OfEWH68EnO
 AYSAevf4Y24VyoxZyBDr7EBZrNYH80oq/aAFlLKK6U1pczysgu+UvhP9
X-Gm-Gg: ASbGncvSngHlHZplYYHXQdLWdjKJRCHS0F/RvvmP5YWTEVw1tzUOmA5scGrKPEQnQ8+
 8VarJiLhEIdNNA05X53jkADGQN6B2fbYqRU7Qxpz4Spu/l23sy6552iraZFLgAxRcc9vK3AXEFE
 jE9U3nM4JDBEOcKt4yYUcsRFrTyHYKM7oNZdUcur8O4QwARnVY9XiW8fSCwJH1rNgfD2c/fbk5t
 Gv4yB5m+z7R+np/cO4lRmdJGIJtfLd8mhR4hXPGiZRfjC+6oXumIFsVhsI07phNFdPX2/46AUCV
 3y/U8wxP9vdXXF9jKT57hIhWG6/mQZ23xkjKvgeNifrFqxml+c6FnPUgXBcrK/Yr5In9qCZXytg
 vMpVYPhBFOvmBSdtncBBm
X-Google-Smtp-Source: AGHT+IEsPZFlG97saXVcQXUrRmXTyLn9RugilGXKIzGMNgbzqlIDl+eWbvR+L/17fz8ERclDq+F/OA==
X-Received: by 2002:a5d:5c84:0:b0:3b9:167f:7f2e with SMTP id
 ffacd0b85a97d-3b917d1d57fmr2898871f8f.11.1755098003262; 
 Wed, 13 Aug 2025 08:13:23 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3abeb2sm47954103f8f.11.2025.08.13.08.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:13:23 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/dp: remove redundant check on ret and return
 statement
Date: Wed, 13 Aug 2025 16:12:43 +0100
Message-ID: <20250813151243.2055798-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a redundant check on return and a return statement after
a previous return statement from the call to drm_dp_dpcd_write_byte.
These statements are redundant and can be removed. Remove the
statements and the now unused variable ret.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1ecc3df7e316..ccae67abb8ff 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3594,7 +3594,6 @@ EXPORT_SYMBOL(drm_dp_pcon_frl_configure_1);
 int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *aux, int max_frl_mask,
 				u8 frl_type)
 {
-	int ret;
 	u8 buf = max_frl_mask;
 
 	if (frl_type == DP_PCON_FRL_LINK_TRAIN_EXTENDED)
@@ -3603,10 +3602,6 @@ int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *aux, int max_frl_mask,
 		buf &= ~DP_PCON_FRL_LINK_TRAIN_EXTENDED;
 
 	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_2, buf);
-	if (ret < 0)
-		return ret;
-
-	return 0;
 }
 EXPORT_SYMBOL(drm_dp_pcon_frl_configure_2);
 
-- 
2.50.1


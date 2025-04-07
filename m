Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1BA7E2D6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 16:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B90F10E4BC;
	Mon,  7 Apr 2025 14:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fy1rD4AR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C0410E4CF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 14:58:51 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6eae4819112so4745196d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 07:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744037930; x=1744642730; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BSL/Umne63WeKz6DVQx0NLyY1Y4Pn9uacURukfI+Kqk=;
 b=fy1rD4AReqs+v4H71faFGY3APDFTAgH6oyKDA0LE9b7eHKy8+p+m5zow2Q6BYld/Zl
 nx6vObK5lEFP7uOk2F7SLI8RfwBj+gW9S/qJnHq0Zu4b1ys3Nf7H2YvlfaHvfhnNyPIE
 fN1TZT6P1QbNVlxCvpSQ+mJgkre2bZl4WvJ0NKj62WA35rRpLMHrXDQk0u08mDL7p5fh
 iKMnJJvGa3UJ5EBCyJ4B/6cu3Wu1LphLM1fRlYAE7Qiw34bf8pE+tcbFfZdganbLeiLL
 lkfrdUHv8FeVgb2v0gNcT8lz8MjLuyIcJpeW1AcNbnMnxf+FAjPrYEGUJxPbOygupEA8
 nq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744037930; x=1744642730;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BSL/Umne63WeKz6DVQx0NLyY1Y4Pn9uacURukfI+Kqk=;
 b=eNR44JT0in9umItUluRSFsyKbCHB/cs04OvAYzufcbr5T+rkyh4LPoXJodqI1oc9Ks
 fggYHIR/Hh2NJZZdHtq/3a42XVnlyMc2JMas130dqqxF74aqlvYEr2xaFTScJ7ddP08j
 DknfqAvPduEdUeEeZu4r9ZZ5QIV4DRZNjQuYpXWLj++jbI4mV/ZZJeWd4slDZwb3mvIi
 YgUZm7vTjhN1RzJ7A/U2UOZ2JkfDK5/jy+c1g/zAOg9HBljT7paC7i+M26qKaNWsF+2x
 uFJEWd5xUO66yni4R1p0IO/Sw8Zm/Wufe4LLICeaUWp5aBzoR/yb6ESEwHMKOkZTjkz2
 MoNA==
X-Gm-Message-State: AOJu0YyMCnhi9THHgWHJt3qmzWoGsLabC5W7cVmH7KoHCb4PIv5AC72P
 5+LHFpbXvRIP4sU0MxIObU4eKz6+ZRXRvS8tXnt0ZN4+4ycOlqc=
X-Gm-Gg: ASbGncsHR9gIDcs3H8tMNlJl5y4ZLYemMfZGiQdCUn/8b96R5W7SVkFcKw83UUSmab5
 Es+XG3mjmWG+cqKErCPGDaBSx1LdYIfol85VEHC7Aht1VMGEVHrOCRUPLtoFQbnrxQ18Hh08Fn+
 H7l0fbaC8ryyh9u4u1KABjjcx479mwjuvZnGYxI9syaAEypmqJ6ZuPkzMSYk4ecrXgwReypvFO6
 dFKBFsCvMNj3pUcBS3kns4d9CYIrcQnp8+7a8G54Z2I2I3P31sSH7gA19bKTLbbf9k6F2SKpjiQ
 xJ50dswZ/l21qxp2h7W6EkvhQr+9klpQs8K7xiREQA==
X-Google-Smtp-Source: AGHT+IHkhABbtbnbZCCqFm6QnrvFXaTc5FgxOup1Hmvg0MMV6iWmGuCzMsv9xxt25ZU2Gr7ek+7lYw==
X-Received: by 2002:a05:6214:e8e:b0:6e4:29f8:1e9e with SMTP id
 6a1803df08f44-6f00214d08fmr75158456d6.0.1744037929933; 
 Mon, 07 Apr 2025 07:58:49 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c76ea5782fsm607790885a.73.2025.04.07.07.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 07:58:49 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, airlied@redhat.com, yakui.zhao@intel.com,
 alan@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] gma500/cdv: fix null pointer dereference in
 cdv_intel_dp_get_modes
Date: Mon,  7 Apr 2025 09:58:47 -0500
Message-Id: <20250407145847.1016528-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
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

In cdv_intel_dp_get_modes(), the return value of drm_mode_duplicate()
is assigned to mode, which will lead to a NULL pointer dereference on
failure of drm_mode_duplicate(). Add a check to avoid npd.

This is similar to the fix commit cb520c3f366c
("drm/gma500: fix null pointer dereference in cdv_intel_lvds_get_modes").

This is found by our static analysis tool KNighter.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: d112a8163f83 ("gma500/cdv: Add eDP support")
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index c85143792019..4bd66804bc09 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1767,6 +1767,9 @@ static int cdv_intel_dp_get_modes(struct drm_connector *connector)
 		if (intel_dp->panel_fixed_mode != NULL) {
 			struct drm_display_mode *mode;
 			mode = drm_mode_duplicate(dev, intel_dp->panel_fixed_mode);
+			if (!mode)
+				return ret;
+
 			drm_mode_probed_add(connector, mode);
 			return 1;
 		}
-- 
2.34.1


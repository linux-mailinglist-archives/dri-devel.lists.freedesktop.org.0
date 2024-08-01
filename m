Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEF6945252
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 19:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622D710E339;
	Thu,  1 Aug 2024 17:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LOkAnpy1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4240110E96B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 13:03:37 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7a0c6ab3354so4739733a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722517417; x=1723122217; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6/80Ws2dZKJyd/nQCETf7KVjiCoNcpFK0kEqa0MrzWA=;
 b=LOkAnpy1P52TKJjoXtmjZWxRXeFRcpeQVccQ3TAzrmlDLHOFe6sh204lqhE9G5/SDy
 PEQ6prhTsjtlNMI7vm04KUVzIVTKygGrzXQBMWnrluQZPO47F1s//ql1WaZjH+LItU3D
 rza3+38YMYpdaYl4q/hm1swbELqdP/wMQ/w6z3YH8udNAJvRRkOS9MC9HoQUp9qXWU7I
 Hgt2gqPRJsAdHd3tY7IpFQYHljfIIE0FbV7/TuOBpCeEMWGZNQW84P0Kj+QxuxBWQQw5
 fWd8G2ZjCfLZhp5zmQiGWpxSNHL1PjFPZSEssQim2xXUTu7kWNiulBiXSE/4YQ422SXT
 RANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722517417; x=1723122217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6/80Ws2dZKJyd/nQCETf7KVjiCoNcpFK0kEqa0MrzWA=;
 b=ERdugVhI6wSSq25ps/uQTiCUr8ceWy1g2HgUoVdNLiWWJEOVPeqyzgQA2BrtGde2QQ
 Yy2oIsTiANv5w7/MtdOkSALjhW5KZqqhn1sfA5RzEQehDosBObyGtPwD7u/KR0e+L20R
 oXXbaRp8jR32nVP1WFIFmswq/u11M24qYpZeYq7e61p3GT3nYo1i08/ENOBz4Dkh+O8M
 UXHPQ0DLhQXzfO292YVoji+LchhEcgDyML5z0JTqr7qDkj0UlxrC7NHIzDibNBV89fKT
 G8rN5AqRLBs9Er2uay7IjCx0S9Ik+pGUaD908qmf2YkqOBSJWPJ1Vxuorv6VU3L3ql89
 TMfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUQI/S6PoYNbZHiAM3AkMz8TgKM+WSv+BEFfBx8UWOJ8r+30PhITollEWoe/f2nFShLytw8d1vKg3OLaecfxb1AAx3KBkpU0ACgHrgEowo
X-Gm-Message-State: AOJu0Yx1QDkQknqkCayt7OR8ZaZxiUrFYWOpXXU3KhZuMQbSZfLe6Ypu
 keE3g3sQQBEfQMLSpGDqBNm63eWeE6dQpk1hCDXhRB+tfNF4Iqvf
X-Google-Smtp-Source: AGHT+IFpSlVTarED15EN70bhN1qHLsuGdh4wsVbq4jNZJLyHvLQOLiKM57H2lvXCF+RQQ+gZdSBOyQ==
X-Received: by 2002:a17:90b:4016:b0:2c8:8a5:c1b9 with SMTP id
 98e67ed59e1d1-2cff94143f4mr130012a91.13.1722517416525; 
 Thu, 01 Aug 2024 06:03:36 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:1cb4:cece:78f6:191b:3e2f:ac7d])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cfdc4e3d88sm3210577a91.55.2024.08.01.06.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 06:03:36 -0700 (PDT)
From: abid-sayyad <sayyad.abid16@gmail.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abid-sayyad <sayyad.abid16@gmail.com>
Subject: [PATCH v2] drm: Add documentation for struct drm_pane_size_hint
Date: Thu,  1 Aug 2024 18:31:13 +0530
Message-Id: <20240801130112.1317239-1-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 01 Aug 2024 17:55:14 +0000
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

Fixed warning for the following:
./include/uapi/drm/drm_mode.h:869: warning: Function parameter or struct member
				'width' not described in 'drm_plane_size_hint'
./include/uapi/drm/drm_mode.h:869: warning: Function parameter or struct member
				'height' not described in 'drm_plane_size_hint'

Signed-off-by: abid-sayyad <sayyad.abid16@gmail.com>
---
My sincere apologies for the spam and the patch subject error
Changes in v2:
- Adress review feedback regarding indentation in the fix
- Link to v1
https://lore.kernel.org/all/20240801102239.572718-1-sayyad.abid16@gmail.com/

 include/uapi/drm/drm_mode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index d390011b89b4..9d398335d871 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -864,7 +864,13 @@ struct drm_color_lut {
  * array of struct drm_plane_size_hint.
  */
 struct drm_plane_size_hint {
+	/**
+	 * @width: width of the plane in pixels.
+	 */
 	__u16 width;
+	/**
+	 * @height: height of the plane in pixels.
+	 */
 	__u16 height;
 };

--
2.39.2


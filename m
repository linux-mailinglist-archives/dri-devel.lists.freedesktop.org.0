Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50578945251
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 19:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B4810E079;
	Thu,  1 Aug 2024 17:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m5DlU6Wv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BB110E939
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 12:26:43 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-70ea2f25bfaso5037253b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 05:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722515203; x=1723120003; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BzW25HOmDgu3PFYeFf46/aEJDlCqCkDxgxEWomrUeUU=;
 b=m5DlU6Wv+ZwtbAMGubHSu3nVaVtdNBrTebKZAidyT59IAhd0r6M1ABWfJ5Ohwu+GTW
 kvgjKShrZIokTNetNyiu5ywuGXHIKrF+D9z/NzYVROPV2+u2oUwDQCoZXX9I1nrZ5ORh
 giWA5NRrfLZduFayt+6moNVCHyfnmqY7OShdPMY3yAdWIvNhpVRK+slTkxGB7uhQAsLi
 haUItS77rRFVU7L3o/S2Dx4KJlOiJK2ROjE53tzwYroqGBE2hktG953lhg1AwNqCxFV1
 yUYhXqzY/3ByX8nyyhPdg3Bamr8QwAyjGP7Zy3G1whAeJlPceExj6klc2kYbGjfiBJHw
 mWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722515203; x=1723120003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BzW25HOmDgu3PFYeFf46/aEJDlCqCkDxgxEWomrUeUU=;
 b=E3jYxcNK+0/qCZvUw3r9E+adrGVGh6sY4E0G7PLwsEm9jPCKy6B/xbOe7hM61K+4u4
 1yJ3hxJe3i++QdIHFuzAjKOecto2KbzxePwQ7HPYDVXYh/ZDxCXkLv45K+0roFUVXItI
 Bsjp8ebYNcFXHD4kY+6wStVgqPc0BXA9pZ2txIsEVPqFOBS6f18vn8gk8U3w4aQFKdI/
 wqFM9oTRu/6LHF3bk0M/kWHxummkjqbFhU4Nj9icnw4iopULNBC3pbXqTEv0yuKMDslA
 OoKau02G0+Pgq6wEVBMofKb7Pdta2hxqCcbghAn+dltsqR1D29FznEsIyq3B2A9bmAOd
 5cjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbo2nma9uMGkf0SFBOFdmHBuXL5AEXsG1qpbbO4omPVkpyTQ60NXh2NMp7HLcjL28UlnjxOCeIYEOukhzDlNACbbmVulpFTIq5hP8esNyn
X-Gm-Message-State: AOJu0YzluUZW8k74qa9weZVjsK9I5M12x9Nmh9TzIsuM7SVDn4DFiSiK
 1hesIsaLNj7eppIzuD3a6bmOiiFyqp4l9n8GaIpCTSvwe8NN01h0
X-Google-Smtp-Source: AGHT+IFwicjwGeuVIdR66gMdzrlUa/EEPeQWIAuXIp9B6xqMrPvT9RnTWtob2tlFVuJCWCRAEtPYCw==
X-Received: by 2002:a05:6a20:7f93:b0:1c4:8dc0:8520 with SMTP id
 adf61e73a8af0-1c6993eaa83mr136017637.0.1722515203122; 
 Thu, 01 Aug 2024 05:26:43 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:1cb4:cece:78f6:191b:3e2f:ac7d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead6e0b76sm11407939b3a.36.2024.08.01.05.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 05:26:42 -0700 (PDT)
From: abid-sayyad <sayyad.abid16@gmail.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abid-sayyad <sayyad.abid16@gmail.com>
Subject: [PATCH] [PATCH v2] drm: Add documentation for struct
 drm_pane_size_hint
Date: Thu,  1 Aug 2024 17:55:53 +0530
Message-Id: <20240801122552.1151747-1-sayyad.abid16@gmail.com>
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


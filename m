Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3FA4AE054
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 19:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41E810E972;
	Tue,  8 Feb 2022 18:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A4210E972
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 18:08:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d27so3985573wrc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 10:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6JMh0kEFjwRWWk+1XHv7gVJ8Hpyf3EWCdFFn+Jweb7k=;
 b=TBxL7N3MT59b7iiL8T3Liji0tNYRV0YQpr4VmZbtlCwTDF6guicYakW3piuqkblF6P
 z5w66wT4auVoLP/HQsQfYoQIi2zUJIO32+Qg98sUNPevUEo+zZDuyUXV1t7LLIszesZC
 sB36y65LcRJKT18Dk2koP4XEHOUhVJKWU5TUZgq62Eu6dYAbIfUZb6H1sTmGneM2zPfQ
 Ho3tEIrIe3vh4urF9r9MPrmqzOIYc7jPdtdzoDxlHNGbQ7zfocSkk7C1stAjVhUpiGu6
 cL+fuzXHxh6MAGkBdSnMiwNDf6mQtm5UuazSL5MsFW457C6jagrNgaxTyZ0mtukOPMUe
 WiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6JMh0kEFjwRWWk+1XHv7gVJ8Hpyf3EWCdFFn+Jweb7k=;
 b=b0VEiGeuq7HRIuqnDLu7i1oDnYCT4vpubbRswlTum5F9xpfBmKII85avZcaPogL3Sh
 dG52fzMLB3l0ZLBNLcjIVfhCcRIl+98+Cdf3C/HneQDoUe3IJWl9PWQdufhKq8dwBye9
 GeFyMxURHftqpapgnrHS+Pc5eDMYfhy76hFJr3CmNX+3FX5hb0JROmp1Cs7MEFz+l2zQ
 WobpN/R5NJQU04lncRXuzLhO/rT7XWryJqroB4c/L3LQsuEOdC7MM+FeZ5evRIMF9l80
 a9KylG97ZA5yYjBXowc1AW69pkfItKVqRAuZ33pVokvW1zFWw439Q0HsY7VsZmv0K13P
 KFCg==
X-Gm-Message-State: AOAM531g+Qjquaf1qEhEDkXjW5g6MmN4raXn+eiTETma4ugtLxoaPkNu
 sZ5xBE+cFd7nVPeW1ZH3ONs=
X-Google-Smtp-Source: ABdhPJxtksjX91rPiGjY9Ly7fTiS/Xhqn6J3q2EbZpF9HlFuxavVAE6e4Z+m2/JR4F8eDfTQluGJpA==
X-Received: by 2002:adf:f504:: with SMTP id q4mr1514450wro.670.1644343683027; 
 Tue, 08 Feb 2022 10:08:03 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id j46sm1218519wrj.58.2022.02.08.10.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 10:08:02 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Subject: [PATCH -next RESEND v3] drm/vkms: set plane modifiers
Date: Tue,  8 Feb 2022 19:07:46 +0100
Message-Id: <20220208180746.24141-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Chris Healy <cphealy@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Where no modifiers are exposed, usually linear modifier is assumed.
However, userspace code is starting to expect IN_FORMATS even when the
only supported modifiers are linear [1].

To avoid possible issues, explicitly set the DRM_FORMAT_MOD_LINEAR
modifier.

[1] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/599/diffs?commit_id=5aea1bc522f0874e6cc07f5120fbcf1736706536

Suggested-by: Chris Healy <cphealy@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

---

v2:

  Implement format_mod_supported (Simon Ser)

v3:

  Now that "drm_plane_funcs.format_mod_supported" has been made truly
  optional [1] its implementations has been removed.

  [1] https://lore.kernel.org/dri-devel/20211222090552.25972-1-jose.exposito89@gmail.com/T/
---
 drivers/gpu/drm/vkms/vkms_plane.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 32409e15244b..1666fa59189b 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -20,6 +20,11 @@ static const u32 vkms_plane_formats[] = {
 	DRM_FORMAT_XRGB8888
 };
 
+static const u64 vkms_plane_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 static struct drm_plane_state *
 vkms_plane_duplicate_state(struct drm_plane *plane)
 {
@@ -189,7 +194,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
 					   &vkms_plane_funcs,
 					   formats, nformats,
-					   NULL, type, NULL);
+					   vkms_plane_modifiers, type, NULL);
 	if (IS_ERR(plane))
 		return plane;
 
-- 
2.25.1


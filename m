Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B330647BDF8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 11:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116A810F1C8;
	Tue, 21 Dec 2021 10:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F91910F1C8;
 Tue, 21 Dec 2021 10:13:30 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id s1so25898721wrg.1;
 Tue, 21 Dec 2021 02:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nTc5PZ4Wpig4VXigMSaZ0XPsk2m3HQFKiyeVvNbBNNc=;
 b=dJHKjSoEEyVDkgtyh+/qOBv2HluDHaGeirviwPCijFFsSYfAhtrw4ytbGMh5V6eqpV
 ccUrgpQQwnhNyl1FVEETH07cmfqFR5oq+3eEN2QgH5ZLA1ZiERd7bJ7/PVCc8jNSpfsz
 7ha/4NGab+1PYTf58rRiQBsLI5ucgutc66cqc2iOt9k8aDjcEfTPHkyFdwaHaYf3KSrA
 /yC0imuNG3jMSHoSAlU1pibAoiLgS+huZgX3msw/pKYg0tT5990jrKTgMR3/n3M6pbVN
 vXuLxJpKgVbm/852wjXVhog0tfoBKaeV6vKPIDdgX20pvenMvW1lh0T7u7FYQd9DyXKO
 OPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nTc5PZ4Wpig4VXigMSaZ0XPsk2m3HQFKiyeVvNbBNNc=;
 b=G0F/o6ypnrUDX/jWYylpXkMT8prwQk8BIIf9avH++nVwibttu/dZVMKpN7ErKOPlD3
 GbOwlMjnisNkZIJGcfZQVMidy9TGNhFTbOyPxWjWAKTWldJFuEFuS4/QNMhp3/vU63WZ
 62c8CO0Q/SUff8g8zUFIS31iIa2hbPZ6RSHc2iCjImYvwAmLTRAmQuc7oEdptHYo/rW3
 sbNB43SfMkyIY5YExcMeBGWHOCN80jEDOoXspgXYNGVjBg7f+J+LIsv7ef5+Pctizzr0
 cGK9SKJ+YybDZsf7E8aOjnRqjTmOpkWp2F6O64ImU6mWY4UeeWcfO9c96A0TE6nAVz23
 Brzg==
X-Gm-Message-State: AOAM531bmFx5RkAQn8TCo9AeldTOTawgdsCmknpfdI1EBsdoJpAsstc8
 pjQ6du2bG3chF9coBbgerUs=
X-Google-Smtp-Source: ABdhPJwWwRH/sAEV2HigzIshd3439K7j8BsMJXS05VWy3mSDd+pPK3adu3sTGg0uNpYiwEPOmgUKZw==
X-Received: by 2002:a5d:64a7:: with SMTP id m7mr1949098wrp.687.1640081608579; 
 Tue, 21 Dec 2021 02:13:28 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id m21sm18012267wrb.2.2021.12.21.02.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 02:13:28 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH 1/3] drm/plane: Mention format_mod_supported in IN_FORMATS docs
Date: Tue, 21 Dec 2021 11:13:17 +0100
Message-Id: <20211221101319.7980-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221101319.7980-1-jose.exposito89@gmail.com>
References: <20211221101319.7980-1-jose.exposito89@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, jernej.skrabec@gmail.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wens@csie.org, maxime@cerno.tech,
 tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 sean@poorly.run, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding format modifiers without implementing the function
"drm_plane_funcs.format_mod_supported" exposes an invalid IN_FORMATS
blob with modifiers but no formats to user-space.

This breaks the latest Weston [1]. For testing purposes, I extracted the
affected code to a standalone program [2].

Make clear in the IN_FORMATS documentation that implementing
"format_mod_supported" is mandatory.

[1] https://gitlab.freedesktop.org/wayland/weston/-/blob/9.0/libweston/backend-drm/kms.c#L431
[2] https://github.com/JoseExposito/drm-sandbox/blob/main/in_formats.c

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/drm_plane.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 82afb854141b..347571f8909a 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -126,8 +126,11 @@
  * IN_FORMATS:
  *     Blob property which contains the set of buffer format and modifier
  *     pairs supported by this plane. The blob is a struct
- *     drm_format_modifier_blob. Without this property the plane doesn't
- *     support buffers with modifiers. Userspace cannot change this property.
+ *     drm_format_modifier_blob and the drm_plane_funcs.format_mod_supported
+ *     function must be implemented by the driver to determine if the given
+ *     format/modifier combination is valid for the plane. Without this property
+ *     the plane doesn't support buffers with modifiers. Userspace cannot change
+ *     this property.
  *
  *     Note that userspace can check the &DRM_CAP_ADDFB2_MODIFIERS driver
  *     capability for general modifier support. If this flag is set then every
-- 
2.25.1


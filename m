Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0938135FC3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2736E93C;
	Thu,  9 Jan 2020 17:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CD06E450
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 14:21:05 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j42so7515874wrj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2020 06:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WK9gkU3m513Bp7Cu1KXOPb6NwVeeFqZuUplsaUVFOIk=;
 b=ghO3EugBL0+/4U4+kMiJ6nLW+1QsNX88U6mry2WtI8EVV8HzkEHzR0K87NLTCQSos0
 kihimaZh5YvIbuaSzQGGkHW8qo48pxNQDa+GEEa+n0X55v7xC6OrJB40TC21P3OIb2Jh
 P6CmXgLCA/oiF8najEnmbqZ5hNYbpdIiI7R1JXjH0Ce2PX6fXWyFR1prAuR337wZljBu
 vZtcohvXrDx9I3jNflVUw/E1UiC8k9swnJCkaFY+ZDImtNMEzpN3tw/m6f/nQgFe4FKp
 JRo862ZtpCgPSmEZeIkqteJKZMFjytf90Roz9N1nDzwPNO92bXCALRQwg2Rcb7l9Dlh8
 FPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WK9gkU3m513Bp7Cu1KXOPb6NwVeeFqZuUplsaUVFOIk=;
 b=cFiCP9qn1TAB4LHqWihohc4lDgwEqpWuGfNery9Opm5BJhrpcl3kCCiaiwDBIC0w7h
 j67MoP2sOkde5oe/qsyJGGGtGMo8ptxpM7gJylQOBOEyS8Ldl9tewCe2K0+4nzZh0Vzx
 uMqhVaQGUCdISb7O9CAYO7IN+zL+n+V/TjZPS/BEaE4sMFtZyriqtLw+m0vUY6tuN0Su
 0LkQrj6WxfseTtF8aAf7qEMTJ9atRi6a5HiqNDgIGbpl/vjOvpeXqfC8g8/JOGEuGIka
 gSDxz3LbzsVtnE2L3XPEpcCT9JM/KaqRUAAhq+4Mnx0BCoqkmleLZLuD7FmfJrv+v6uD
 xKiQ==
X-Gm-Message-State: APjAAAU2mefSjFs5KdSFxEqTd6s0aa+hb7L14mScRykzKsNpFjgkZ+/k
 0egiUxR9nlSNWXJXzt/RPsU=
X-Google-Smtp-Source: APXvYqwf5cjzGgESlCq81pbBePPTkbxeU1QNXFhPZqiJ69f3+QB80EdywpsFxWfxqtJMEgBWZVeCAg==
X-Received: by 2002:adf:8b4f:: with SMTP id v15mr11505791wra.231.1578579664576; 
 Thu, 09 Jan 2020 06:21:04 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id b17sm8337337wrp.49.2020.01.09.06.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 06:21:03 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/rockchip: use DIV_ROUND_UP macro for calculations.
Date: Thu,  9 Jan 2020 17:20:57 +0300
Message-Id: <20200109142057.10744-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the open coded calculation with the more concise and readable
DIV_ROUND_UP macro.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
index 0b3d18c457b2..cc672620d6e0 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
@@ -328,7 +328,7 @@ static inline uint16_t scl_get_bili_dn_vskip(int src_h, int dst_h,
 {
 	int act_height;
 
-	act_height = (src_h + vskiplines - 1) / vskiplines;
+	act_height = DIV_ROUND_UP(src_h, vskiplines);
 
 	if (act_height == dst_h)
 		return GET_SCL_FT_BILI_DN(src_h, dst_h) / vskiplines;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

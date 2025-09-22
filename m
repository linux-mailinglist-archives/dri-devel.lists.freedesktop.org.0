Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4263BB93210
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 21:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3200C10E507;
	Mon, 22 Sep 2025 19:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UsWxAerJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC8E10E4A1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 16:44:35 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b2ba4753d24so20597566b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758559474; x=1759164274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+qVjEH1OrHc9W6t0k0tXjROXejrmvtmPSgsAnXcZ868=;
 b=UsWxAerJTlEaYyDC8DgkGHBJMt8deVbU395JOsmzo7SYKzzuwOF+GQ6SfQ5GMf0dqH
 jDCi+Fo9JzuYwHUmIiN+NOs0i+w7lXUgQAYVV9wlh2uSZ4zSw+tZQXpUHOCj7poErbhZ
 KnzE6+8+tZWy4qq2J5WCiwQd2qju16aiZ+INMo4YCNzcG3QKqqqCzrPsiQrU214WEtws
 nc31ALve3T/nMriHSbz5Kn7asIWQBFv9gn8emfiebrcpzj4wmt4mTrOucskL68x9EQbE
 7eWHBRUXq0zvJ8p5X2HJe73nchYTEpJZ/PSPoilqBzjb5ZiRedDinq5MaHRkYAT8duZR
 ELzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758559474; x=1759164274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+qVjEH1OrHc9W6t0k0tXjROXejrmvtmPSgsAnXcZ868=;
 b=SIW6UngdxeBHwdvkbeDOCknPJncrw73jH9CkUgGM3A41CTLnOA5z+6EW768rEv3CjU
 uxX2ELcKIRus6ycpWPSz7IHi1P4ephnplHMSVWQD2IWu/twUi4R0WtTYcP5LqLD2I/c3
 lMRWJzhuuecEC18Mgvw8Sq1sJV7NLXzJJqwWcfX7zA5HPBooGH7AWrmhIxG4lRzAZSp3
 p05Y19w/1WgEbl/SmvDrqPD7Be1SELLrZQgAScqdJU7W/06Ckj9QW99DdNkPm6HXf94Y
 WtAhHU/0b0a+BD0QkG5sRmXnYDgOQ5cD5xRh+She/LeMhix3D7aDUiCzalBkrI15h1hN
 cgVw==
X-Gm-Message-State: AOJu0Yx3lMfXB17qoH25bXAOEpRvDuPCh8XwVFvV8mib/tX0kBj2b6AW
 SIgPZW+FGs/y8K0R/sVIeWL6kk9ktNK9li8x359pmt7at62YDgcG4Gon
X-Gm-Gg: ASbGncujr6YIum5Meh/r44bpxHRMSwmFEeFs4gITToBuZWkwNI5f9yXsAmgH26bFDAD
 gj74x734YQmvV4ltZ7eeaP1TtH1uu9ax9Ap5ggcUzshaRIedUcvk8+uh1Swr4DJQV1OohfuoQ6F
 cAAaQinsznsedsbBhTh5SDYld5z/ZjSUVlJBX9JQlDY0TXr6eSyk+SyoDeMir2IzfDo5y1H7iE3
 6IuPwvPlmokQEls86Bm/nZtVRBIi8eDu1K3P0S3Y+FhqR9U45MNnJcR51zC438KOptMClVp4Esz
 WN7YMdqBuKeccE89j+YsDDcy1ATvLQnQb9Uc/EeV3eccr0llR92G7mVo09VE7X0Xmt/z00aZhOk
 MyTEn/YsvkZPFMkiM4QF+7J+3Li0=
X-Google-Smtp-Source: AGHT+IGIF21Xhnp4hpfIy7oA9V9TFGFTlwmwiLgfHOfK/D3mn2OP04oE6hrYlLRBvg7agjvzZJaJ8Q==
X-Received: by 2002:a17:906:1755:b0:b2b:c145:ab8a with SMTP id
 a640c23a62f3a-b2bc145b425mr204508766b.3.1758559473592; 
 Mon, 22 Sep 2025 09:44:33 -0700 (PDT)
Received: from bhk ([165.50.125.136]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b2d4309ab9asm216084566b.74.2025.09.22.09.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 09:44:33 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, mingo@kernel.org, tglx@linutronix.de,
 jfalempe@redhat.com, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] drm/gud: Use kmalloc_array() instead of kmalloc()
Date: Mon, 22 Sep 2025 18:43:59 +0100
Message-ID: <20250922174416.226203-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 22 Sep 2025 19:48:05 +0000
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

Replace kmalloc with kmalloc array in drm/gud/gud_pipe.c since the
calculation inside kmalloc is dynamic "width * height" and added
u_char as the size of each element.

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 drivers/gpu/drm/gud/gud_pipe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 8d548d08f127..eeea0cb4c7aa 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -70,7 +70,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 	height = drm_rect_height(rect);
 	len = drm_format_info_min_pitch(format, 0, width) * height;
 
-	buf = kmalloc(width * height, GFP_KERNEL);
+	buf = kmalloc_array(width * height, sizeof(u_char), GFP_KERNEL);
 	if (!buf)
 		return 0;
 
-- 
2.51.0


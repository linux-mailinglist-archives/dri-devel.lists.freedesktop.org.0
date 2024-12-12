Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D9A9F062F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 09:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2060610E0EE;
	Fri, 13 Dec 2024 08:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H2k36yM4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB8510ED60;
 Thu, 12 Dec 2024 10:56:30 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-7e6d04f74faso310007a12.1; 
 Thu, 12 Dec 2024 02:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734000989; x=1734605789; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TVIQo8NqWQ6SELkLfckK1F5HTaemJ2gPgY9CRh8/kkQ=;
 b=H2k36yM4tFav2zo8wyHyKp03YMAsa37TD57hh4fcyH5WFtYsCIHGzhceU6po1qN8I8
 //d+GXE5LKAaQJgUmznobGNXE+1VyTMPVdomlSgpmOrXvPjMDuaWc5sys1g2ZFJTbGQJ
 0Mvob+db3wlB0AdeaP0JDfMO0EaMVWMl4ii7IRRzWCBr5Un0T06xhKeeC0bpVaLLUVvB
 lKihbBB7189HPBlSVyIfUW+qcMdmq2Cf7xoM2hWHtdtSyINaVtG3Ssf86wok/oARWqHq
 Z07gbXaWESbK/QQ730iBQEgcZOF/1tG8CE0d+3xTjr2axHXM3S0k3c/tLzfeVxC1fuZt
 bkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734000989; x=1734605789;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TVIQo8NqWQ6SELkLfckK1F5HTaemJ2gPgY9CRh8/kkQ=;
 b=JlEOFRGltMPcGkM7wFapPoidPVusdb2nPQEYXARYAYgOiqrZADupNhKX7jdBc5kO72
 FyVI6Dsyyga+I1h1Jou9y2Vi7kZ6/3MvbHD6TYt1Ps1uPAVlzicg6aNR6MgLCR7qd/0z
 wgJq6CcR8Qmx5Qk6oTdFbib7S/gYh5pkaUxNSyOui5brY6PKNa3hnFRuC1OJC+dfRRjG
 6D2oBNEP7R5S/KYtGFHq2mCNSxg1XWNZMiDIwUOFRdgGbq0o6EqtUngF78jZOuXFjHnd
 z43mCCePcdnW+rxWbM15nQ/ziPJpVtdxH08U6LAUT3aPbplnxvYOjXw6jCQLOTUxsIa1
 jXwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsUOrBVUsOROejKJcZ8TnVS2bkSPZH/UJbuNIzewXWYjIuI5PihBDm7u6tlxODzVOoKDq3QmWggRNM@lists.freedesktop.org,
 AJvYcCXjr7gWOBvgIpkgsmrbsJoPYljzQZ6Osm/lvMyxuQlR+Fg9arFmMk1FosYZpzKGbJ9kgC8Nt7NK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyV4v+pEaZqHeqK+0UjdvvkmD8+T8AovGNN2vPHWrMEaZ2TZXR
 N3fse/p6cZRlbHYaMO9Iys2JC7swYHbzIMV2Gd5N93i7v9es2vj1tsBPUw==
X-Gm-Gg: ASbGncsm4Uz992/xqbJ62r286SKC45j1ge+c0GjWom39FzjRIgv+9bQ0BBWAfpUNM7p
 5hlhN91uaW8qqpXBDmbYY7zv2ndpuQx8i2nK1U2eRAGf7GEGhoS2kMWO/ovBU+5CGDdvcER6jtf
 NMVDMy02zuhZINjHhknixUIbEMH/I+UdKUugeqbCW0QG7Q9v4PagxyKNJOClWKp6Aq1dtb+Is+o
 H4pxW4wuMIi0TnsrhgjUQ5mnidw6ZHZ0PtwzVLLPJKoQ4/7zbh2fBZtnaxRsg==
X-Google-Smtp-Source: AGHT+IHR9YBy2fc9hy1FcQ+uJJ1iUSaXLspeZXS2ea9QTPKDUsicXHM39fumSQB2wALvNjSDERvIpg==
X-Received: by 2002:a05:6a20:4321:b0:1d9:a94:feec with SMTP id
 adf61e73a8af0-1e1ceefcfb6mr4960965637.2.1734000989398; 
 Thu, 12 Dec 2024 02:56:29 -0800 (PST)
Received: from HOME-PC ([223.185.132.235]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725cf9f681esm9223571b3a.98.2024.12.12.02.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 02:56:29 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH drm-next] drm/amdgpu: simplify return statement in
 amdgpu_ras_eeprom_init
Date: Thu, 12 Dec 2024 16:26:24 +0530
Message-Id: <20241212105624.35877-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Dec 2024 08:18:23 +0000
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

Remove the logically dead code in the last return statement of
amdgpu_ras_eeprom_init. The condition res < 0 is redundant since
res is already checked for a negative value earlier. Replace
return res < 0 ? res : 0; with return 0 to improve clarity.

Fixes: 63d4c081a556 ("drm/amdgpu: Optimize EEPROM RAS table I/O")
Closes: https://scan7.scan.coverity.com/#/project-view/52337/11354?selectedIssue=1602413
Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index 0d824f016916..52c16bfeccaa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -1390,7 +1390,7 @@ int amdgpu_ras_eeprom_init(struct amdgpu_ras_eeprom_control *control)
 	}
 	control->ras_fri = RAS_OFFSET_TO_INDEX(control, hdr->first_rec_offset);
 
-	return res < 0 ? res : 0;
+	return 0;
 }
 
 int amdgpu_ras_eeprom_check(struct amdgpu_ras_eeprom_control *control)
-- 
2.34.1


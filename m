Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B8DB11349
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 23:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1BF10E3F4;
	Thu, 24 Jul 2025 21:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ki4/z4Jc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1344710E29D;
 Thu, 24 Jul 2025 19:59:28 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7e32c95775aso157710385a.3; 
 Thu, 24 Jul 2025 12:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753387168; x=1753991968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2glPXiLDXj+7i+zys0K4XQZSPXsH6Jhnylbt4ZU6Pz8=;
 b=Ki4/z4JckEC/8lvzC/q5pcUq/sU2yKv+0RvoVrUHjGyNhjbFYUK4hiJAS9qafpooLR
 Jo1VkMz2PBNQNygEzg0+tiy0hH6DeULh5dEkI2XHa0ELM2AwYuH7f8HkqtS10q6LtWHw
 bxE7qAPozB0u5hZx39y+AZK0tXUI+tTu3TtCGWXMHXr8ckKkgaSjPTJiR1pdgL7WBbqN
 NcfEObUSR4COcmXpjnJ+6wzhp493noRtyKtsa75Csw9xpRXnTg0+PGFOmYsbLeXsRPP3
 F4tX5ttoWOkhejKv1BNYxged0oCT5xniqkKGMJiujyPzzZEmy0Dd5JbO29JeGjKw2TnC
 xPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753387168; x=1753991968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2glPXiLDXj+7i+zys0K4XQZSPXsH6Jhnylbt4ZU6Pz8=;
 b=tis+KmOfjOSXAndCqdDyVf6S5QuaUAM+8CS8/61/q4Tmj0nNsQkG46w2X9da1G1Pq9
 q0VbQNQQdoZRBsJMpzuLZAr+otFQVkvMB4WpZ0X6YJH+KcpV+77P3nfIm8aQXaF8sx9A
 NN/PgaQ8QJdGnkbRrKwgyYy5nRP8uwy1bt+xHhkxzbE94Bfmu236JfObPGSDxgSkwo+c
 uVTSmWupTuhMDDcunyqLgIBgtysS1KzgFqydpGPosbf6ys013/p1NMRoIxI3HZXRGIt5
 8U7v32fMYnoDvqLI5nNVzxvjqhJN8YIB7Tg82ASxSwQ7Ur6dRSKg0yd/b0U9K68Llwoq
 0Q5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUxTVl9QxL3JkQFjwCc5+yfYwADBtFg3s7WJqnA/yrUhBqXktSd9qKxuk0x+jpgW/msuwWHCM0@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/wLyplcewpdSUIPnI5Szj3DAgSDt98kZlCdxg/+4SGaeXT+oF
 Z+o3u7VAyqQTzUIIXtWFgsaElJM8RworTrFsWd4bt7C6cDJIyJBe9bjk
X-Gm-Gg: ASbGnctdcsftUz0l28Y4D44Ag9Idsz7qDiyVWbD42n2s5k9mLu2tdWj0bqbZRR41EMp
 HjrU8sCYkf/985PeNevTEQGmXFJcM6xbkzEOYjUfmJ3mmeWIiLBBPLr0GHWgoHXxXCpTnXct6fp
 +d98jGH6pIG0sdh53Rc8blTqhawnLYuc+GxpAswWXqdyKcgiS9MsjJHlXmopPv4ibk+WPOZ9s2S
 RtYnRbbhsUt1Qb+PI0VcEUrhRbifcSTQRErNItJVQmHEn5MZUtmDov0sSLPtg4Kv0a/ArtSRQrg
 oYn8lz28ubZM0u+bKkgeuWuD1o5/md7uXF860Wt/oyH7/OnI5ENCnsBrro703flCu0IxvNa25tw
 c80E2yHSILXKBdfvsH2oy4g==
X-Google-Smtp-Source: AGHT+IE8tiKXPF+rPmVC2uaEgbgWJXzxROd8gqRk6866T7szqRWjDH57DUs1ux8XzdCpbhD/gUk/rg==
X-Received: by 2002:a05:620a:306:b0:7d4:4e42:7b43 with SMTP id
 af79cd13be357-7e62a17cd67mr977879985a.30.1753387167675; 
 Thu, 24 Jul 2025 12:59:27 -0700 (PDT)
Received: from iman-pc.home ([142.186.9.88]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e632e1a687sm165994985a.50.2025.07.24.12.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 12:59:27 -0700 (PDT)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
To: lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Seyediman Seyedarab <ImanDevel@gmail.com>
Subject: [PATCH] drm/nouveau: replace snprintf() with scnprintf() in
 nvkm_snprintbf()
Date: Thu, 24 Jul 2025 15:59:13 -0400
Message-ID: <20250724195913.60742-1-ImanDevel@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 24 Jul 2025 21:50:37 +0000
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

snprintf() returns the number of characters that *would* have been
written, which can overestimate how much you actually wrote to the
buffer in case of truncation. That leads to 'data += this' advancing
the pointer past the end of the buffer and size going negative.

Switching to scnprintf() prevents potential buffer overflows and ensures
consistent behavior when building the output string.

Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/enum.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/enum.c b/drivers/gpu/drm/nouveau/nvkm/core/enum.c
index b9581feb24cc..a23b40b27b81 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/enum.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/enum.c
@@ -44,7 +44,7 @@ nvkm_snprintbf(char *data, int size, const struct nvkm_bitfield *bf, u32 value)
 	bool space = false;
 	while (size >= 1 && bf->name) {
 		if (value & bf->mask) {
-			int this = snprintf(data, size, "%s%s",
+			int this = scnprintf(data, size, "%s%s",
 					    space ? " " : "", bf->name);
 			size -= this;
 			data += this;
-- 
2.50.1


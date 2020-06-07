Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17CF1F0981
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 06:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938CA6E260;
	Sun,  7 Jun 2020 04:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE176E260;
 Sun,  7 Jun 2020 04:06:19 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id q19so14485081eja.7;
 Sat, 06 Jun 2020 21:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YnfNaRqVPV6XqQG2QgxhQE+LJO62l70Xq3ODGCdKbrM=;
 b=eD39SVG7TsxYBPUexkrFKxT01/K/7WNVvcZVjjdXxDZsDBHnZR8F2bDGsKs5f0rCcx
 SR++CBlzHVetPlhWMGVgnnNs0Gv2eyvHAS3sCkCmbaKtny0s1WU3bOPWSROlBIFqcjR7
 nvhWhoaa8kkFj/amy6sLglXozu2G7tyEVoIyq7psRuweyrQitRuufIC7++SJa+j/ctPi
 HlF+91KWFg9+WGyJyEXP7Rrh4vCzwboT+Lwmg/A58q+QQUx/RLT1XF6T6gQX6j6MRejM
 caC1MoEATdDn1hqmhIlCWUVtEtAn+VXxru5fyawLWE8YSvlYux4wr76sUSdy0Tpau1ej
 zUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YnfNaRqVPV6XqQG2QgxhQE+LJO62l70Xq3ODGCdKbrM=;
 b=kPPP+Irj8r2NJlB4JU9is2ibG64gUz7VGxDyCrp3IAo2lxjS9J/u1U6tQ65ujt/L+v
 s/cd5JzjrK2F6QkTAqoqQBPm0hg+wPbOAXiI7/XcKSRe8lTJyM0bMTqf1AGewuIG21Jg
 eSPpVxDgF5ULPyVI9sxW24cz50BVjVU69S940C75UkGpowFCBklzgZaf+SF9RFO3sxXC
 zbOxyM5zUNMGXG6xS9T9cuQaXtJZRmCBgaVa4d22jwJtw2ZAubWB7vtm0gSIpIQ7qjNk
 1X4o1+oCnES7Y+v1uF1Rv5r8EjTJBdx3Zxgk761CpXZGYIc8mQsxSOYoQK26PFIvHuqv
 G+ig==
X-Gm-Message-State: AOAM533wLacGEWFL6vsy72v2N5XQ7TUwxBS90ELdLMQIxY+R6phCr+5K
 1qy0caAfCKqrqJCiJ7Q5ZgKOHNu2
X-Google-Smtp-Source: ABdhPJxhxitFum4zLZeNoJUz6WK4R5MBNcjk9wnR74y7u9CfPAXCoyIGjDW2KWz1tRVTPmFs7vRZKg==
X-Received: by 2002:a17:906:b88c:: with SMTP id
 hb12mr15086605ejb.483.1591502778428; 
 Sat, 06 Jun 2020 21:06:18 -0700 (PDT)
Received: from twisty.localdomain
 (dynamic-2a01-0c23-8430-e100-f914-43b7-6b66-02cf.c23.pool.telefonica.de.
 [2a01:c23:8430:e100:f914:43b7:6b66:2cf])
 by smtp.gmail.com with ESMTPSA id w13sm7797243eju.124.2020.06.06.21.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jun 2020 21:06:17 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amd/display: Enable fp16 also on DCE-8.
Date: Sun,  7 Jun 2020 06:05:58 +0200
Message-Id: <20200607040558.15996-3-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200607040558.15996-1-mario.kleiner.de@gmail.com>
References: <20200607040558.15996-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
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
Cc: alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assuming the hw supports fp16, this would be also
useful for standard dynamic range displays, not
only for HDR use cases, because it would allow
to get more precise color reproduction with about
~11 bpc linear precision in the unorm range
0.0 -1.0.

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c b/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
index a19be9de2df7..0dcea3106886 100644
--- a/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
@@ -402,7 +402,7 @@ static const struct dc_plane_cap plane_cap = {
 	.pixel_format_support = {
 			.argb8888 = true,
 			.nv12 = false,
-			.fp16 = false
+			.fp16 = true
 	},
 
 	.max_upscale_factor = {
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0438EAD9952
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 03:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A83110E9BF;
	Sat, 14 Jun 2025 01:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cXMumqpt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F333910E9BF
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 01:03:21 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-70e2b601a6bso28331417b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 18:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749863001; x=1750467801; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=45jf0gP7QjTTPLFpULqujGZqfZ7lIP0Ebdkf9ozISuA=;
 b=cXMumqptTYv5i6eRherm3Lgh7uzDxSoRYEHek1o7yJiCdUNfzSxeD93He9mrsSTrrz
 BPlJQlk/uYhMoA+sHcTP8W63tn9vIGUGMeQsnHXVfkO+7ZdCJ4xbn8vRFphrEpyC0Ggf
 vXm9TLXwtx3j69gz30mgRAaIQcUO78voxRhyxpFG91Q1waUt73vX3TAshE+d5v3/paPq
 bvy4K/FmTwJyWGRrrpOYz35VKDdKsCVMsgo+p5oO51mtX3IHvXzVxGpwnurYcES+FPhq
 1dKNy3JrOvQGh6JOdqkUL86KK/3s/rqCoZHqK8j+nUxyr3PaUgsXvcX6mWX0wnosWNzI
 Hdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749863001; x=1750467801;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=45jf0gP7QjTTPLFpULqujGZqfZ7lIP0Ebdkf9ozISuA=;
 b=pUX4SA6iryBC4KM+jyT/jDbBRA0hifVf7LU6IdRSIL8rK/7hwNFPszq7DkK7LzWj3O
 ZesgzXgKcv5DfVRF56UpArG1wlkO5jQajJF4sx9Aynkj+wtggdVWACYVsNiHT7AZ729n
 NC8Wmwgrinjb3D6LcrGGwE+GWrp7zZdS8/isfW0Vj+FWjckCO9hadk2mD4rebTXPgo/N
 6h9TxgDZMXmfbm3Eyy//D81FfWGF0v5NsTIfFIR/m5/8iLjK86oLwKyiF/7j408kvhoK
 4uqb+76Qx8zKj65NjrGbAj++gsC9jIHr+bLZwx4nlqp5KQM48XSLdSeXwmYyW8j5DUOo
 kGUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJqWRRJw1A9sqr//7xsciokm9I7k6vlGrbwy12W76b5WaVxtcV4LeqIk6aeXKWuc1K/yfZqBhLHWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysmjCYNznEhEeUqs7kI894PTOwJK5krleJvY/EFULzO0w69e8G
 0UjnJjD3jH3zFQ4PZ63IIdA4YnL9fXhscv+qMyHtkwU0u9059mQskkpY
X-Gm-Gg: ASbGncuk28o/LMfJKPJ13KVkSel4CFJ1Ivlg5uKVGZEaEl0MLLTyR5+oMPYPW4wQNnk
 Qp4LojUrYnhGn5XNfOPe10y/mY3LUp+4x+SUGPVAG1poCRC+U2gNKZAYFkwEs42JCc9YL7vFYVX
 cy1aP2glZOQsTh55urHpU0amaXyaQpjH+h5ocpeQv9VSDTVymXOc5Oa7pFViSFcEHJqPC6NRfIK
 aZTLzJBT1IGPYEVSNX3ZDGLeIxgnKJUuF5oYdC+UMEzU4ifnLvvTUwoLqN4y2roVbHBzSRXNF4K
 gTE3B34yW7vExDaGx2dra6E4fnT7QkREoY4/RHC/QpG5xkkjAceDJUgdZVHtBIjGRn/S5+Rg9za
 q
X-Google-Smtp-Source: AGHT+IHmXSLPMx1K6XEijZ+aaRJwCSHJWyEvchSbPlDWmGU/iFQOIYE/s39k6qttoIL7OYrx8thaZQ==
X-Received: by 2002:a05:690c:23ca:b0:710:d950:e70c with SMTP id
 00721157ae682-71175475514mr21836157b3.28.1749863000992; 
 Fri, 13 Jun 2025 18:03:20 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7117157067esm2967597b3.41.2025.06.13.18.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 18:03:20 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: deller@gmx.de
Cc: FlorianSchandinat@gmx.de, alexguo1023@gmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: via: hw: Fix potential divide by zero
Date: Fri, 13 Jun 2025 21:03:18 -0400
Message-Id: <20250614010318.3128558-1-alexguo1023@gmail.com>
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

Variable var->pixclock can be set by user. In case it equals to
zero, divide by zero would occur in viafb_fill_crtc_timing.
Similar crashes have happened in other fbdev drivers. We fix this
by checking whether 'pixclock' is zero.

Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
Error out if 'pixclock' equals zero")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/video/fbdev/via/hw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/via/hw.c b/drivers/video/fbdev/via/hw.c
index 66afd7be00cc..31e0cac91889 100644
--- a/drivers/video/fbdev/via/hw.c
+++ b/drivers/video/fbdev/via/hw.c
@@ -1488,8 +1488,9 @@ void viafb_fill_crtc_timing(const struct fb_var_screeninfo *var,
 	if (viaparinfo->chip_info->gfx_chip_name != UNICHROME_CLE266
 		&& viaparinfo->chip_info->gfx_chip_name != UNICHROME_K400)
 		viafb_load_FIFO_reg(iga, var->xres, var->yres);
-
-	viafb_set_vclock(PICOS2KHZ(var->pixclock) * 1000, iga);
+	
+	if (var->pixclock)
+		viafb_set_vclock(PICOS2KHZ(var->pixclock) * 1000, iga);
 }
 
 void viafb_init_chip_info(int chip_type)
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F87BA501C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 21:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C180E10EAD7;
	Fri, 26 Sep 2025 19:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="IldbQ3I6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f226.google.com (mail-il1-f226.google.com
 [209.85.166.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AA710EAD7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 19:54:39 +0000 (UTC)
Received: by mail-il1-f226.google.com with SMTP id
 e9e14a558f8ab-42861442ec5so2213805ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 12:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758916479; x=1759521279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+5beUj1lW/DIqOkEO13Qz2zf2QxJpQ6GV/z78+Vgozk=;
 b=hSsrdSIE69IGCa0jfDfp/4Ozv88EJpzOB98lMFWC48KuQiuDocAiHX6UpkiKleGQfu
 16+xdQdRgbcM7tvoGsbNuwSdwllRexzE1rxP7mwFKaEHi4O0ga1lXHAaqGxUu19Ah2G0
 MQTgHqoa01tMnsrCI1MylhLL3Qn/ishUSOuJjXGheoLIApUGNv4tp0ugvnyMBjiwwhNX
 Ab3lZcKjAjj9cUSkV2QQJx31ydf6cLmCJANy7oNc8KCBrv1nsaY4luFJaLfAeMPCEvdz
 VnawWTqsXaPnOYwF6KFHdq8JmHbs/JH7na9CTWqfm4O/oIMGoK/a8nMdciK0eRV/L9p+
 e2hw==
X-Gm-Message-State: AOJu0Yz+E2NN5eim+7y+Yyh59SCqLB1jy/dM9YW0Y9SvL/Uwm9nvS0Rt
 GM0YQ9/anwQwgabZVH+PbiB2hdT50CtWuf7uDAFwb25EuGGx2YBkxQAz+/J41Pps+GlRCX0LEjd
 +bwbJMWlikJ7MCDfQQ0Q7f0CJd0q4zNrn1IBW6d9Ae4wwAjbv3hvlV9GjmqqdZxAxP1I+1SfGbU
 Z4t/GZM0NQDYLXjRE5bo11/ACPPYjoig/v6mNolN4OWivDjvthjfkIko1sZgz/400Z5MYn51xbm
 JDesbRwIivLrGcCq5sV
X-Gm-Gg: ASbGncveT8ArKaZQ86MQnCtRpauiHq5nyVRxAXlfkkwAUZGQUoBUy/rvyU9wUUZvNzp
 xPr1FNKT1GlgYQeZay0H24Nli2P85u/wzjCwz71KRXwYJSv6TCj6ubY/weBGuHgJm5VNjLxZkkG
 OqwVeOTTw+MwwyTG/cDrPQ79GH2zIC3jWpOzm85g+A5O6YE5JQXykDpKk+BkCkJvirDbGS4TM79
 SzlRHiwScGropHbOxpgBgjPM+3/rS3k1zvY2X+PIQVb7UuWtxEyHM3skS3v8XxphFIKVvawOAuf
 1iYef/FL46rOtC/4QdU9+GfYKq/n2qv5cPdQx/p5wVEp3vcwZAiQYSWmvfN0nBBeqlcclo+yuSA
 1681V/2ouR0y0jLCBE2dlgAcyuvpQrPg4XMmHPJlsdGw35gUdQTwleddeI4jFJMLiKW5AZ+sSHJ
 4=
X-Google-Smtp-Source: AGHT+IFwCUU8gdCbCagepp8H6hE2iiyJDov3aEPj2dMM/quAt0Q3G0+7FXO1W81KcTOP8fFFt1hgpy8btymu
X-Received: by 2002:a92:c532:0:b0:424:771:418e with SMTP id
 e9e14a558f8ab-4259566e677mr116948455ab.30.1758916478982; 
 Fri, 26 Sep 2025 12:54:38 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
 by smtp-relay.gmail.com with ESMTPS id
 8926c6da1cb9f-56a64211e08sm308963173.9.2025.09.26.12.54.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Sep 2025 12:54:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-818c83e607bso21375106d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 12:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1758916478; x=1759521278;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+5beUj1lW/DIqOkEO13Qz2zf2QxJpQ6GV/z78+Vgozk=;
 b=IldbQ3I6Ks7X0wgc5Eah0ycO4iyGc727T1nCoZUn9hNIU14UqxAh4sVeNLnZ1M/FQk
 8yUWk3ZQ05Zp4DDdSNqmJvGqAlyprRJdApCiChNMr8MPTPxHNN64TlgP/hX677FJ61Fn
 78wjiAxscSIkHHkVSE4Q2nAn7Ow+rYax+lyto=
X-Received: by 2002:a05:6214:4016:b0:78f:493d:15c6 with SMTP id
 6a1803df08f44-7fc28076af9mr106468516d6.3.1758916477721; 
 Fri, 26 Sep 2025 12:54:37 -0700 (PDT)
X-Received: by 2002:a05:6214:4016:b0:78f:493d:15c6 with SMTP id
 6a1803df08f44-7fc28076af9mr106468326d6.3.1758916477249; 
 Fri, 26 Sep 2025 12:54:37 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8016ce9a3cbsm31004076d6.56.2025.09.26.12.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 12:54:36 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, maaz.mombasawala@broadcom.com,
 zack.rusin@broadcom.com, praveen.singh@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH 2/3] drm/vmwgfx: Fix copy-paste typo in validation
Date: Fri, 26 Sep 2025 14:54:26 -0500
Message-ID: <20250926195427.1405237-2-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926195427.1405237-1-ian.forbes@broadcom.com>
References: <20250926195427.1405237-1-ian.forbes@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

'entry' should be 'val' which is the loop iterator.

Fixes: 9e931f2e0970 ("drm/vmwgfx: Refactor resource validation hashtable to use linux/hashtable implementation.")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index 4d0fb71f6211..35dc94c3db39 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -638,7 +638,7 @@ void vmw_validation_drop_ht(struct vmw_validation_context *ctx)
 		hash_del_rcu(&val->hash.head);
 
 	list_for_each_entry(val, &ctx->resource_ctx_list, head)
-		hash_del_rcu(&entry->hash.head);
+		hash_del_rcu(&val->hash.head);
 
 	ctx->sw_context = NULL;
 }
-- 
2.51.0


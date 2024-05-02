Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC98BA7EA
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 09:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EF710F426;
	Fri,  3 May 2024 07:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e9Iyqgag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530D110F6C4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 20:01:18 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1ec486198b6so28976555ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 13:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714680078; x=1715284878; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uaz8rW2sq3u4mWnq4w7bNSJ13vyEsIaZonXWAGwzYCs=;
 b=e9IyqgagLHJaKF0d/DlCBmHvkJqM+16nDWuBgr8b6+YfxlxILv8+WMw1yNVhv0r+b/
 kKhG7uLJsQFr95UpaGCIls0MjfTrkcNSV2FQggNwqvJUbfkY3ZSCziUv9eZBMionr3u3
 dNeNar6VFnhcGRL3ZYy5C5odK2BYv0uB+FnNKvW2ogw97MnU1XPhQHJmC1mirCyjjeqi
 fxiKk2TskofUIp2ZobStEZLSaEksv+ODdIyKZp5LvnB3mwMpsQVPAOggVW9P1YU/bFn5
 UWEoYUQlbvWuq+HNebo9aKgaHZwEpgC8F376tMNJO/75eCWSwoYMjua8fAb/1+a7przo
 Msiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714680078; x=1715284878;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uaz8rW2sq3u4mWnq4w7bNSJ13vyEsIaZonXWAGwzYCs=;
 b=MZTlTlRvnbibgWJrkLTzzduZhtx9Bgk9N8lkdpj5nKdaj+/iKdnOcq0MEZOuVFKtvi
 oG033hr+MQBZPKl9PWBciaHnNVbIxtmW/q/ekSVCfct66/KHbAmsRZapMnABk0jsxSYJ
 G+ASsLve3PXIpepT+Bafwgh04Uueb5m/Ozks1MMSqIaeMiPj2oG/BMVV98o65KUrG8Uj
 MNWrECpGLJJPuxqq2xZTvAF5hKCVxG1iKluhjI+BfD6VTDy8uBQm/MyxFiT3OOEZ8fIn
 ebvYqjmAq9KAUMD20CIpXccKERjywTvsJFAIMVy+JY5kDKJc5PHTCAhawnWS8iHBXlCk
 3nTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2Q8cC85GqgvURirqkor/+ted8TZzEWb/GobJPDRFrFqH5kOloWmVXGfzzkX+Kg+gQlhignMZLBWnOHvNHz2uukZ8KOmGFB9Hqk23QsDgs
X-Gm-Message-State: AOJu0YzuXAPISeT6WUE4NOrgFP3gm79Cl2eYEspnXMS3PTcyWacQjz/d
 G43AwJK6/f6pMFtGr6AdEGWWXT4tnzduhy994A/xlNZCppJUYR+b
X-Google-Smtp-Source: AGHT+IFo69+W9OhD2MlkT00tcySGlmudG12kCBNx4rppmHaul9a8Wp/3Zo1K5hFmMcCmZomdYMRhxg==
X-Received: by 2002:a17:903:246:b0:1e5:d021:cf02 with SMTP id
 j6-20020a170903024600b001e5d021cf02mr870737plh.36.1714680077654; 
 Thu, 02 May 2024 13:01:17 -0700 (PDT)
Received: from localhost ([115.96.207.161]) by smtp.gmail.com with ESMTPSA id
 i16-20020a170902c95000b001ecc3a62b7esm1732757pla.45.2024.05.02.13.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 13:01:17 -0700 (PDT)
Date: Fri, 3 May 2024 01:30:11 +0530
From: Aryabhatta Dey <aryabhattadey35@gmail.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Cc: deller@gmx.de, tzimmermann@suse.de, sam@ravnborg.org, 
 christophe.jaillet@wanadoo.fr, javier.carrasco.cruz@gmail.com,
 skhan@linuxfoundation.org
Subject: [PATCH] Remove of_node_put from drivers/video/fbdev/offb.c
Message-ID: <ipercce5fi5islpzglwkxsz5fyffooxz4cn4luxa3y25yfvawf@lbt46vliet6v>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 03 May 2024 07:37:28 +0000
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

Add __free(device_node) to the declaration of the pointer pointing to the pci
parent.
This change replaces the manual clean up done by of_node_put() with scope based
memory management.

Signed-off-by: Aryabhatta Dey <aryabhattadey35@gmail.com>
Suggested-by: Julia Lawall <julia.lawall@inria.fr>
---
 drivers/video/fbdev/offb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index b421b46d88ef..ea38a260774b 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -357,7 +357,7 @@ static void offb_init_palette_hacks(struct fb_info *info, struct device_node *dp
 			par->cmap_type = cmap_gxt2000;
 	} else if (of_node_name_prefix(dp, "vga,Display-")) {
 		/* Look for AVIVO initialized by SLOF */
-		struct device_node *pciparent = of_get_parent(dp);
+		struct device_node *pciparent __free(device_node) = of_get_parent(dp);
 		const u32 *vid, *did;
 		vid = of_get_property(pciparent, "vendor-id", NULL);
 		did = of_get_property(pciparent, "device-id", NULL);
@@ -369,7 +369,6 @@ static void offb_init_palette_hacks(struct fb_info *info, struct device_node *dp
 			if (par->cmap_adr)
 				par->cmap_type = cmap_avivo;
 		}
-		of_node_put(pciparent);
 	} else if (dp && of_device_is_compatible(dp, "qemu,std-vga")) {
 #ifdef __BIG_ENDIAN
 		const __be32 io_of_addr[3] = { 0x01000000, 0x0, 0x0 };
-- 
2.44.0


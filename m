Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F032AF0E6B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 10:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC4D10E108;
	Wed,  2 Jul 2025 08:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D59Wxw6K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C80310E108
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 08:49:10 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so29099215e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 01:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751446149; x=1752050949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iziNAMdJAZIDx33n/pmbnZ5EW53u9SNG08MJ3g31k6s=;
 b=D59Wxw6KM0cRr51F2LCSuh0O47adE3oMZ4VYs+tjKrhUr5P9dhAH2kICgvJ05Y/PJb
 bfrbU1b3hYvGILGIDx8ZuLhdk3XZ2O1yY+GjYhE2qyCvq14b06snHApsShWlE5oY8Ap7
 sudC+7PNg5pcIEsGAtMP5SwHEOGsP2u8vS9oCr+OHLMnldVRvOCmRmbijRUgm2y2+x7r
 GIYvdj4z/2ZT4njm3B0mgq9rtMtpTTREmDgxg1cbY45QSdehSYazVnfTp6NSU8x1kjfB
 t/jpgWS2HAIxroubpa4S9AWfrNQQh9f+1Q8q2khNzhcxo3Vu9KL2kHzts4DTdlKxrBhm
 mI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751446149; x=1752050949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iziNAMdJAZIDx33n/pmbnZ5EW53u9SNG08MJ3g31k6s=;
 b=ohlwXKNhUHGV/2vGr9U9aG7FaZ2eQMy3XI2qUbg+IvaVDODvtdIT25BlIrLJu1ld8C
 M2DpZGCLCKGTaZz7d5qi5oUv9QHULbu2QZI8QsfOONC9k2eF7RYwCss8Maq0FgPQPlfy
 atugaZ1Fb+f3V5BBskzQHnHAvR8aS/m2ZL6f1b79OqvZijTp6J4Vd401m4SjzkV1p9Tw
 OMcfOMtFvIFsU19u2aIHdJdOKAWSVKO9YHtqC46kD45lDEi5FoMoJ0THL1qMw6OzIjso
 Hs4v+mG9O9InNapuFaeBKtRKD8kJDtd8syvlLEBShmtT8aOAe/N1gYlnFirwp+gjuk3G
 DDNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULx9VxIW598AdmbSsaXrGCUI1xhUfm25RckGUq1xWUCfjzsk3cQmwk2txrjo3EY6C4vBmkKgBDpJ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsT+9EyX+EK1GfZJgHzGOmxLoIqn/279PmCo2bkibQYrjbiXIL
 JL1yykJbfelc48brtciLRum4Y3xvza95VBM6Deuhn5hNeE2JUzuwHAPB
X-Gm-Gg: ASbGncuRme7oeHHRVmgYPXgp1Jj9Gs8vLjhTlA7iIvVeHL0zUfNYnTsrAgouAjRnwBp
 mNli5gTGaWOK8mRuQC9HQso1tZK4paAYRjR10BWh1vr9unxLPBnVJS2YAe71TMh99Y7SK3pCriD
 qEJGe3xk5jw+zNAKrPHOwZX6SzIFyvTjlL/VHg8XTUBSpBmF6SgEUSRkJehTtIdtYw7/PbQiaHH
 WwWELh1anz88wxbIU4eNKtsFEgBQ6VU4AvrbUSFzCn7bsNcrpZm1QaHtQOVj6FdTSxKnEBJFLUh
 x7Z/piy/sKDoMjoyaYI84gcrX47lv6UrZsxLY8eOZ9BWL36xVpUt+Tl2APa+
X-Google-Smtp-Source: AGHT+IFxiYecp4uZ8N06XdkoxoWRIDA9NFEdTiYseV/L9zVDNrtz7gti0tX6H09Zso27sqM6lEyn8w==
X-Received: by 2002:a05:600c:8692:b0:453:62e9:125a with SMTP id
 5b1f17b1804b1-454a37fe36cmr14424645e9.18.1751446148516; 
 Wed, 02 Jul 2025 01:49:08 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a892e6214fsm15636752f8f.98.2025.07.02.01.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 01:49:08 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/tidss: remove redundant assignment to variable ret
Date: Wed,  2 Jul 2025 09:48:44 +0100
Message-ID: <20250702084844.966199-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The assignment of zero to variable is redundant as the following
continue statement loops back to the start of the loop where
ret is assigned a new value from the return to the call to
get_parent_dss_vp. Remove assignment.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 8223b8fec8ce..182a69354424 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -464,7 +464,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
 				 * which may still be connected.
 				 * Continue to search for that.
 				 */
-				ret = 0;
 				continue;
 			}
 			goto err_put_node;
-- 
2.50.0


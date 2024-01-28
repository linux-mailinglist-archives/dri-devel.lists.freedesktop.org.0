Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351B283F4EC
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 11:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7043E11252C;
	Sun, 28 Jan 2024 10:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBE3112496;
 Sun, 28 Jan 2024 09:05:44 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-42a8e0becfdso5199621cf.3; 
 Sun, 28 Jan 2024 01:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706432679; x=1707037479; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tl12HUX4uU642Pm0XD/FsExYrprZs5KqQHYM6NQv7yw=;
 b=dRnScH0vdRSbQizneN9N6guvnV/c7W3RrXyBJkYOcLTSfcixih8jnTIyPdegVx0qSo
 mT7povdA3LELCMpr7dNZ3VH56i9+KJpKOOh70SYtzNlaj6L8o7SnEN16oSiah3tccW05
 TZYcNzo42IB5MndQrV0uQYwqTYgNTRn5dD3ecSUqfE1gBkZPpH20gxLoDhoMX/iT9iQ+
 BQWSst7d1rBS9yyAp3wWtu3YDls8ksQRuf74766Wu/Bn8b+zlQxHMrZtWZanRYWURa05
 zIjTmn7v8HN6hLEwYzUZGslaNg5NIvw/xvGJfFCNwObJ3gKd7w/azqcO29jMBbl8eAKM
 yzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706432679; x=1707037479;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tl12HUX4uU642Pm0XD/FsExYrprZs5KqQHYM6NQv7yw=;
 b=SRFEF8hGy4pcExUn2gD1Quod1TG99bfXv4r0sCG9pzFYKuw3VIhRti25bNJSbODlai
 Gi31m51sHcd4Nzn5yGtO/yH8q4HayQlx8TPvzWYt8RZqVjKC2X/38zo1pqeFvcu3hA1F
 zHk1IytiadVotWg34X/vEu66ScKlEtSvlfNUYtEineXl/WFUA1YsT113hs4+ksrvYQA0
 HxmCsb3iXlKxhhM9HAVKSt7so68sFg92S7huIm3VNMnQYBatEC5rrmLKdYO9q+ZbNTK4
 2lG/lInHRCVSSsR4QrnTUbEKsUAc1VZxpZBwN406VniVtp7IB7MLgfxfb8lPrq6JkdbK
 F8Eg==
X-Gm-Message-State: AOJu0Yx+1xlorBaeER3rRCD7pWdwggnU7jJjEYrAPvqMp7Vem/t11OYd
 HipMgFagX1jR80o/tAwXHBr2kP41OE8n5TfAuqWJKTkgwOJayFs=
X-Google-Smtp-Source: AGHT+IFyTE09o/xWHMwQXLRQeWK4UyZ7mKRESG5vo897/5dTOfLsZ+QnKmU9/J0QcLWgtItYdBAXtw==
X-Received: by 2002:a05:622a:1050:b0:42a:6860:4b5d with SMTP id
 f16-20020a05622a105000b0042a68604b5dmr4062236qte.91.1706432679336; 
 Sun, 28 Jan 2024 01:04:39 -0800 (PST)
Received: from localhost ([207.181.197.26]) by smtp.gmail.com with ESMTPSA id
 kf13-20020a05622a2a8d00b0042a9a2e43ffsm709108qtb.92.2024.01.28.01.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 01:04:38 -0800 (PST)
Date: Sun, 28 Jan 2024 03:04:38 -0600
From: Lenko Donchev <lenko.donchev@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Use kcalloc() instead of kzalloc()
Message-ID: <ZbYYpky2sb8p8hjx@nixos>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Sun, 28 Jan 2024 10:11:19 +0000
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

We are trying to get rid of all multiplications from allocation
functions to prevent integer overflows. Here the multiplication is
obviously safe, but using kcalloc() is more appropriate and improves
readability. This patch has no effect on runtime behavior.

Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments
Link: https://github.com/KSPP/linux/issues/162

Signed-off-by: Lenko Donchev <lenko.donchev@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/link/protocols/link_dpcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dpcd.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dpcd.c
index 5c9a30211c10..b67cd78e7c58 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dpcd.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dpcd.c
@@ -164,7 +164,7 @@ static void dpcd_extend_address_range(
 	if (new_addr_range.start != in_address || new_addr_range.end != end_address) {
 		*out_address = new_addr_range.start;
 		*out_size = ADDRESS_RANGE_SIZE(new_addr_range.start, new_addr_range.end);
-		*out_data = kzalloc(*out_size * sizeof(**out_data), GFP_KERNEL);
+		*out_data = kcalloc(*out_size, sizeof(**out_data), GFP_KERNEL);
 	}
 }
 
-- 
2.43.0


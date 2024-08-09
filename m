Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8245894D04B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 14:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E188910E8ED;
	Fri,  9 Aug 2024 12:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AyDNdUOl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A165F10E8ED
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 12:33:22 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a7b2dbd81e3so268042766b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 05:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723206801; x=1723811601; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1T9HTo7YuUX/e0pBQrzS8G/CpwBUyTZ2HB8zoVX3uIY=;
 b=AyDNdUOlhkoOD4ZCR/5Kg4l1SRZFsnhuIhuwAIxans0xb5pwPvn9JZdo5UH3v43qJw
 fR3X2oIoWPEQRXVpfp5Bed23Y9wr0wbXNzg1zeeDrQGU5+rhTTmcsVwvEfiGmVsocvYz
 BXiGP0lAEfPR4IkvHy3QV8Tr7wFu47soiM2UVzuQV3DP/8+MM6eEDpv8ruoUdlVP7lr8
 2dXkJb+ZW7cQGZFKYg49NS2H7s/Rw3MXATbvCGGdrBrRFcHKqrwkzbSC08/U0Pypy3+a
 jQD6zO/+bPTvaxHXU5JIhB89tUCmwYkE2AI55jOGTRL6NgCWQHII8uH6N1UMIX2g837K
 MAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723206801; x=1723811601;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1T9HTo7YuUX/e0pBQrzS8G/CpwBUyTZ2HB8zoVX3uIY=;
 b=c7czE6vtja3KPySHYPSou8fD7xfAZ4anAbA6oD7QBZhKXbNBJ7Ig2YZgyH0NWN1GW7
 Kjr3Xs4Qcx45BKhdH5EgpBDayPAiluPCN4p+rO0nf7LUbhjTf5Wumum/FXH8zPBTaOrg
 yRAyXFAODTAnDrY51R1WulUy2YY16Cbk7htXDkikuyudgyXnGzdQYya7e0fOBmV/49JR
 hBS5lukqV1mP4QM/mazgxGb4y8qwctxXw3RwvLc52O3VNRMDtpqLeDYeIGzrkhnqEhzx
 0zEp8EJFH+byrn5rGWIJ/V1dlbPDqOAGcpbgbRbCsPj3Osd4aIkAtImUUb2H5jyVNckd
 jwHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl8MJ2gWShBZZWTUbaqPXg6JA/QMjH1S/Tn5zqtIfugNz9amhl3pFiHSbxJ9Hy2MsuoQCxS9DpAqnJxLWdj+GjDffPSD2KlQTs0T0YEqTq
X-Gm-Message-State: AOJu0YwTMHhJ3RqOTDLClCs6hxQGX0Ujlf31wuRRJa1qzhGdeOe5gEVo
 JNhJ4ARzTbtU2CMgE7EdvAPgn/QD9PZ9mByQjRn7JZiv1m62CD3rkBSDcPBn/Gs=
X-Google-Smtp-Source: AGHT+IGfuyRpbD5V4xldOFw4WjAJic6XGUVn3OQ2mq4qUmdJmCTvIzhHm4FAOhWT0pdhLWFXDAB0Ig==
X-Received: by 2002:a17:907:d599:b0:a72:6849:cb0f with SMTP id
 a640c23a62f3a-a80aa67b98amr113030566b.62.1723206800818; 
 Fri, 09 Aug 2024 05:33:20 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ec8cc7sm838307066b.215.2024.08.09.05.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 05:33:19 -0700 (PDT)
Date: Fri, 9 Aug 2024 15:33:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/ast: astdp: fix pre-op vs post-op bug
Message-ID: <f7790a38-6b72-44dd-aaeb-550d2de14cf2@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The test for "Link training failed" expect the loop to exit with "i"
set to zero but it exits when "i" is set to -1.  Change this from a
post-op to a pre-op so that it exits with "i" set to zero.  This
changes the number of iterations from 10 to 9 but probably that's
okay.

Fixes: 2281475168d2 ("drm/ast: astdp: Perform link training during atomic_enable")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/ast/ast_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 5d07678b502c..4329ab680f62 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -148,7 +148,7 @@ void ast_dp_link_training(struct ast_device *ast)
 	struct drm_device *dev = &ast->base;
 	unsigned int i = 10;
 
-	while (i--) {
+	while (--i) {
 		u8 vgacrdc = ast_get_index_reg(ast, AST_IO_VGACRI, 0xdc);
 
 		if (vgacrdc & AST_IO_VGACRDC_LINK_SUCCESS)
-- 
2.43.0


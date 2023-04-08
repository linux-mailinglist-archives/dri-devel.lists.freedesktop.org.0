Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362976DBAF2
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 14:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D1010E17E;
	Sat,  8 Apr 2023 12:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACA010E0BC
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 05:03:34 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id ji2so1905199plb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 22:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680930213; x=1683522213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+R/ILs7X2QW/RaV99o/bwUC9Aw8QyPL3GQ9e2y+a4WE=;
 b=BXp84ojiPYIkwMoCq9DKxH2191XSUOvi0Kc3tkQch0SRdrRK0mBZFzV5vTnIzMa6DU
 Ip46rTGa8l19fZBb1+0HvjDoaXozr5L8VvUK7+wu3pJ1lpBB+Taz5tZKmUDRBulb9zNv
 6nCIiWVIdrfnhMIZfDzSrIG1Ygvcg4vm9hZ1ZJ0hngNwBWgN2JlK617WrOrCnE5gY8Og
 CmvBMhteEyYKr5rPNrLn4Ep8qADOVAZhXZR0jSz8kcOw3MUAfQuUWJZ1LX3KlzjhRHYm
 V5gQCyJjZJdbyUPV2fk9ftr0oQiGpN3iZwTbz40JIS3kV+B/8iZnw4NN5+UAf56qpLUv
 cqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680930213; x=1683522213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+R/ILs7X2QW/RaV99o/bwUC9Aw8QyPL3GQ9e2y+a4WE=;
 b=G028a5Zsix8ksJUmux72BvWHn2tIfWVuiha3f8NQVt0eqaridfMW8EUhMqWHj2m+9b
 ARxBBaSBliS7WEQChkQh97SKWkSyKe1hE5D7KJ3O3pc4eKN1yuyttIfzV2gF5YMAuY86
 BOmcQkRVLVMKZz+NMnN6svPN3ndLKDxi5QsKgwYGtuhNlbGOgiXZ1D5Ou3jeszEQ/urE
 CARXKytfNt+tJfAV4JGKIw6RyjR513/2UKTUzSi2qyjytLb1Mkc9BV0eOb85XdGQ3bW5
 FVF+b/aUzy10ifu8bcoGEBISAFH+z/qhcNxqm0yOvtlq7qdrj5moTOLys5EZ6H288s5T
 uHhg==
X-Gm-Message-State: AAQBX9ensjy7amwcAqq4QYzu+H6hvvVj63g5xIbWCUVR7Zs9KnTseNlO
 8+9q86WPR0IYKwQ3VxtW9AA=
X-Google-Smtp-Source: AKy350biBnNtbUmjCCSsUo7ZnBDg5Xa0/r5u2lvsRMWOhCtDRJ0yncGgf3luzUAboVxyz4lKPpmVFA==
X-Received: by 2002:a05:6a20:b29d:b0:d9:a5e9:4b4a with SMTP id
 ei29-20020a056a20b29d00b000d9a5e94b4amr4033801pzb.62.1680930213590; 
 Fri, 07 Apr 2023 22:03:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:8475:d375:707b:4600])
 by smtp.gmail.com with ESMTPSA id
 v22-20020aa78516000000b0062d19179ec6sm3831278pfn.87.2023.04.07.22.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 22:03:33 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH] Staging: fbtft: fbtft-bus: fixed extra space and parenthesis
 issue
Date: Sat,  8 Apr 2023 10:33:23 +0530
Message-Id: <20230408050323.70919-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 08 Apr 2023 12:37:55 +0000
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
Cc: Deepanshu Kartikey <kartikey406@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed a coding styling issue

Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 3d422bc11641..02a16671f2a1 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.25.1


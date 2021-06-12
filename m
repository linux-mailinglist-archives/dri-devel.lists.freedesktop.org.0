Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C413A5704
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jun 2021 10:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4BA6E0A8;
	Sun, 13 Jun 2021 08:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0756E11A
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jun 2021 11:45:22 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id u18so3517996plc.0
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jun 2021 04:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yETzIEA0FE51iHDiilpc4taiEHo/TOmRxZBfjJ3S7Bw=;
 b=INPsrGFMJW9mzsR/+ohw+zzIRzDn+VFI2/sI+DNCnyqJxTh6myJ82Ps1jj9LrtGb6J
 5n+oMRbDavZqOjstkv7tuaphQQqhlEDTedd6WYsQnfDWTtqzySBRtESH6PcsloCRIsXG
 gcsXonkmQJPMsv8EhAfvBl4fr46vSX6GI7GtQw3kDOdeXdvCUUmYJk10E0EGz4G7WtTQ
 wNLhkDpCIss7IPzkISxsxCBxTnJdK/Fw/Pue7mKeNUZgXzdsPq2JR1/7EWPmImXJePrn
 TFgfdRHenFtGTZNMww1uufw63w31WlH+FOGoHKczMesW5ZviySs3dRW5n82YHpcJcgON
 F0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yETzIEA0FE51iHDiilpc4taiEHo/TOmRxZBfjJ3S7Bw=;
 b=G3MGxBlzZlxtaO++yiO516gC7Gfiq/UxXhCmXUMXFCYyoztZ3Ark+/uWWrBIxjjSv8
 eyhG/u4oLymftuJ065bpXfqj6fsbIgakR222iLlY574K7kmrUeArFEv02rWnXgSEzFlj
 vIFqqefGTbAYpT0lcr7PXmNKQj0FtWI5dZQRQe6o4fIpyLL504oNZz1tKY6vQavIM8Kg
 ICfieCM2RjkrNbx/IHZ8jJgmEtsJQgm//luKIForZahQMbsx39nnT5QrbKASzE6M+2fC
 lRypsVw/X7M08/iZ1zGqOhdR0NWkXWaDk34fREg+MeAFV5nQ2+Y1ZSOEJj8/6Ly/v19N
 EipQ==
X-Gm-Message-State: AOAM532Bnmn8J9tlB+CH3U4bxbt5uxn5S0uUfg6YpxUnnthZcHegfc95
 7i7y9MU4CRYRvWxhkLVj7Gs=
X-Google-Smtp-Source: ABdhPJxCShIv1IMMtVGH1gBsgPqeHLYwuMVVNRSYR7O5mVUCKfza4jq7durCcWsjhxPb39NYNTZF3w==
X-Received: by 2002:a17:90a:4f0a:: with SMTP id
 p10mr13860518pjh.36.1623498321660; 
 Sat, 12 Jun 2021 04:45:21 -0700 (PDT)
Received: from localhost.localdomain ([117.222.175.26])
 by smtp.googlemail.com with ESMTPSA id b5sm1648762pfp.102.2021.06.12.04.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 04:45:21 -0700 (PDT)
From: arjuncr <arjuncr00@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH] fix for checkpatch.pl
Date: Sat, 12 Jun 2021 17:15:05 +0530
Message-Id: <20210612114505.6833-1-arjuncr00@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 13 Jun 2021 08:15:20 +0000
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
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 arjuncr00@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: arjuncr <arjuncr00@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 63c65dd67..cdb451dd3 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.25.1


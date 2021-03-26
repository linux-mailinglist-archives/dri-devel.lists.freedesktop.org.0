Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B567134A943
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555CA6E1F8;
	Fri, 26 Mar 2021 14:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6946E1F8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:09:18 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so5651478pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=h+bhUb5pCuEYh025FUBqhTIp//Tbcm99mGV1EArYpWE=;
 b=Cd+G377/rdX6Bw06AG5m11TwNuzgPRsnhn0+penE/Q5ZwFX7VD6eQf1frs4G31+CAH
 aGcCei6VpcaqQrqfoTjQ3sRVJqsQTYubVfYrkgV9fkuLO4tKbAdKQ4mmxZaqy9bUAWFg
 a0Mita0wtS6ziHMdkrt3EGQd9g1AXg4QKVCxQN7S0DqLqpyNorqUglvSR08D7CuWpVdl
 E79cEr0A8aTQfxV9NRgseeg288n1PBdz5L3+58dj1LnD1jFQrgdaxCa9+yvS+zFSQNzQ
 Sx1zQ9iXDw7+Ory+S+3p3KHJ7ixhC5N9r3uN3Nl0Z6E/aNsXjNzeRDdZ9SuOUDHbjk3j
 N7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=h+bhUb5pCuEYh025FUBqhTIp//Tbcm99mGV1EArYpWE=;
 b=dT8gr0LwaVBZFxZ92+SpbvISCvNg6dPLOFPSw0x+7wj94ngCQmdYvNqvElH3rdLqhx
 B+S/IIrV6YgveVxLN0lMKKnMpRmNewcYYAsBtXCZC8dk2NpUoXqdRPecr94nw3oVIh0s
 f/xGNx1jBqSqbixGMqcBmkRcEmWrUo49BYKApqNA2uqAAQDAd8HFfR0mdYZBN0ruoUVH
 mEt4g3eyNg4UirTi9Kc7pTwU2i6zgTLaPooMU6kt7/u1RR+q9YaxQuI2frZ4b92v4Vv5
 ulOEn52x7okGL5ofTYrxzy9dLzOwAjpslp0BAuz/tIhXRa3SHFFj0b7kSwMgNwgLYEb4
 yTRg==
X-Gm-Message-State: AOAM530cGZ4iJhuFe9ZxpFYkSkH7+CdsN0P0RgW48GnWoyiI3I1gVAlo
 TO5FbrRylyoZbjQPTVhxKLg=
X-Google-Smtp-Source: ABdhPJxszqiKf4suKiwiqLf+J7gikvo+wVRhKUs8+Qga0N4et1pAwlcxfGUpK7kIzTFACqwWz1cjeg==
X-Received: by 2002:a17:902:7792:b029:e6:caba:f836 with SMTP id
 o18-20020a1709027792b02900e6cabaf836mr15272990pll.41.1616767757973; 
 Fri, 26 Mar 2021 07:09:17 -0700 (PDT)
Received: from bf-rmsz-10.ccdomain.com ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id mr5sm8923717pjb.53.2021.03.26.07.09.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 07:09:17 -0700 (PDT)
From: Carlis <zhangxuezhi3@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH] staging: fbtft: change '16 bit' to '16-bit'
Date: Fri, 26 Mar 2021 22:09:30 +0800
Message-Id: <1616767770-70063-1-git-send-email-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 1.9.1
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
Cc: zhangxuezhi1@yulong.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "carlis.zhang_cp" <zhangxuezhi1@yulong.com>

Change '16 bit' to '16-bit' for a same style.

Signed-off-by: carlis.zhang_cp <zhangxuezhi1@yulong.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 63c65dd..7040131 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -117,7 +117,7 @@ void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
  *
  *****************************************************************************/
 
-/* 16 bit pixel over 8-bit databus */
+/* 16-bit pixel over 8-bit databus */
 int fbtft_write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 {
 	u16 *vmem16;
@@ -172,7 +172,7 @@ int fbtft_write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 }
 EXPORT_SYMBOL(fbtft_write_vmem16_bus8);
 
-/* 16 bit pixel over 9-bit SPI bus: dc + high byte, dc + low byte */
+/* 16-bit pixel over 9-bit SPI bus: dc + high byte, dc + low byte */
 int fbtft_write_vmem16_bus9(struct fbtft_par *par, size_t offset, size_t len)
 {
 	u8 *vmem8;
@@ -228,7 +228,7 @@ int fbtft_write_vmem8_bus8(struct fbtft_par *par, size_t offset, size_t len)
 }
 EXPORT_SYMBOL(fbtft_write_vmem8_bus8);
 
-/* 16 bit pixel over 16-bit databus */
+/* 16-bit pixel over 16-bit databus */
 int fbtft_write_vmem16_bus16(struct fbtft_par *par, size_t offset, size_t len)
 {
 	u16 *vmem16;
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

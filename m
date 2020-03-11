Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9881812F6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 09:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A8B6E926;
	Wed, 11 Mar 2020 08:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021786E22C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 01:25:42 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id e11so559709qkg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 18:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Fukjl9q8moe8CzDk64XDMos63vCyfonbgEhEiAaGvw=;
 b=DGaA0U9LZTxFDk9p+UrQTc+2w6FbZ2lAa1NdcuJN6FekMurcJUwLjEEAb30LZopenF
 IhQQqBpDgZ/B1xli5AROa0jXmEJRoFr02uu/7E/l3xzQdINShRX0rY6vlr8pNZDUEmu+
 lZCOyQ6Kz/rqCIq9UC4KZUNXRnvLdwhb/ShruKQrjpmEkIk64zxarVhNYPB8QfGuhQbZ
 CjR6OS8+dQFdIojetGmZej1ArM7tpp/ZT+eMwCO3FmHKjNmgyu5Rw9LxF4HyEAniCgn6
 mTeiCpXNH5mPFpBF7eBXIVTPfqKTUi1t2aq8/UoyLMzwd6IBCM1Z2+ivahWqzXIk+6i+
 P65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Fukjl9q8moe8CzDk64XDMos63vCyfonbgEhEiAaGvw=;
 b=KBzeJqx/xmqicw7v0OXKf39BHm0QA9fxMn3ivly8n4IEqYv5C3sGwCJib8xgixBkCj
 ABbdftw4UVvFcKeViJAUMQIqZIzu8GNDYFlLPCWXh807nmolf5DtBOYyhpZvYaxb3bwe
 bc3+dT0ngB/QG4+0TdXjAFVvaAWzfuK9JWDcbKdEBOV+4Am1AeO2ghnSgbNvGTP9tjce
 Igc7XW+1G8sueb28IHIA29aT94bqxXy0MDqH+9WT9XVBTNYmS1zC7GyOrkJdd81+MAqO
 3+dC0EXGjgncpvWeYkOYzd+xsI1yX4ae9FUtqp+Ch2jhNwge6RRhgmi0DOVW9gzkafwE
 FjBg==
X-Gm-Message-State: ANhLgQ3jEwZIhiwjmNdtDMfsJWos4f7D6xb4/vpgmZoIr688KowdGGVN
 gL6xh1AN4HMadOsjMLbHdEm7//zC6FM=
X-Google-Smtp-Source: ADFU+vtwivKOZ8x2mrkiVtdyMruWBJg75D32INLdZIi72P50DVRuj9bAjvMTNxFmNm86LOt8++lszQ==
X-Received: by 2002:ae9:f504:: with SMTP id o4mr611927qkg.306.1583889941922;
 Tue, 10 Mar 2020 18:25:41 -0700 (PDT)
Received: from 73ec49dbc856.ic.unicamp.br
 (wifi-177-220-84-29.wifi.ic.unicamp.br. [177.220.84.29])
 by smtp.gmail.com with ESMTPSA id i66sm4618570qkc.13.2020.03.10.18.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 18:25:41 -0700 (PDT)
From: Marcio Albano <marcio.ahf@gmail.com>
To: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
Subject: [PATCH] staging: fbtft: Remove prohibited spaces before ')'
Date: Wed, 11 Mar 2020 01:25:33 +0000
Message-Id: <20200311012533.26167-1-marcio.ahf@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Mar 2020 08:32:41 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix checkpatch errors:

"ERROR: space prohibited before that close parenthesis ')'"
in fbtft-bus.c:65 and fbtft-bus.c:67.

Signed-off-by: Marcio Albano <marcio.ahf@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 63c65dd67..847cbfbbd 100644
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
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

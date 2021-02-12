Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 605BF31A433
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 19:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EBE6EEA5;
	Fri, 12 Feb 2021 18:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99FB6E5CD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 14:58:41 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id u14so1296090wmq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 06:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K8hSkoUmfBulq+yHz3wJFmvWeXwkFbdhHHcnOeQCVlM=;
 b=t83NhmMo6pwaQPI5Zng04ZOiiFb4/YaXQfRDzVj2ok7hthn7uCjsuhRPmblwKuZrdX
 vrP4mdL3C52Vh1mOdvRUnze7TrWj8T0YHWskCOyy19rF1HY/5ZSJ2tEa+W7kXT4m62ww
 E0ECDrOhXzT1RTGnZiT9gQ+SurP7tC/o/HaJZQKNYHoEK8ryyI78qzYjhlObePKCQVWI
 urAY8LrKqZGMmvPFOy6E2hKpoeFrGdX9d/JgUs2zDWerpKXSaMDpdaO0+8ftasy1QlbA
 +94bI9JtVFru25GUawL+Otsj9hrN3NSI6Zvaf2b4flqDut1B/FVTF1Yai8ZH2A/wu4Kf
 mUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K8hSkoUmfBulq+yHz3wJFmvWeXwkFbdhHHcnOeQCVlM=;
 b=SLSW7m501qlk3CzAW8GffW8V64S+6zEZORLkaKwuH9HmVfPgLqrlZNAXWEw5v/jjOd
 IRxOimBSqkhzXZphyp2gIrZ65tJ4A+hPshLskzxkpDfZNYlxlq88jzrpcrrV/VZwZxVH
 VcZTq/39bMDqN3XJ6KGmc4Zf+geJ3LvkFKx08xruRvvavtx7alt5hlIat/5w4h/2c8G5
 AMtAJLNzycLGOW6FYQ5/wR3dQy3Na86IL+YBnwfVisyDu67d6OhaHFmaN+hGqLgb/dbF
 LZYGq0RlhJ9Be55Jm/togNBd2dw1Yhf7JnWrZ04UhThtxEYJGMRyislKe7vvTjtgLIp8
 dLlg==
X-Gm-Message-State: AOAM533YC5U8TAGtOVDti2BZ5ggeLuuwKGFkAMexiHb6sH1WuK66OjYb
 YjBNzFaSfTAbG9fxtSWcD+4=
X-Google-Smtp-Source: ABdhPJzTHuqPrdid7EiN+/Q1zJfLj7UNAo13dBfxmXTLFjk6lxb9i9aoCZIXEwqb0c97b/kLIzpMYg==
X-Received: by 2002:a1c:20c7:: with SMTP id g190mr3010312wmg.156.1613141920327; 
 Fri, 12 Feb 2021 06:58:40 -0800 (PST)
Received: from alaa ([197.57.74.212])
 by smtp.gmail.com with ESMTPSA id d5sm11442525wrb.14.2021.02.12.06.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 06:58:39 -0800 (PST)
From: Alaa Emad <alaaemadhossney.ae@gmail.com>
To: gregkh@linuxfoundation.org, mh12gx2825@gmail.com,
 alaaemadhossney.ae@gmail.com, sbrivio@redhat.com, colin.king@canonical.com,
 oliver.graute@kococonnector.com
Subject: [PATCH] Fix space prohibited issue in fbtft-bus.c
Date: Fri, 12 Feb 2021 16:58:33 +0200
Message-Id: <20210212145833.3809-1-alaaemadhossney.ae@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 12 Feb 2021 18:06:21 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change fixes a checkpatch error for "space prohibited before that close parenthesis ')'"

Signed-off-by: Alaa Emad <alaaemadhossney.ae@gmail.com>
---
 certs/x509_revocation_list        | 0
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 create mode 100644 certs/x509_revocation_list

diff --git a/certs/x509_revocation_list b/certs/x509_revocation_list
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 63c65dd67b17..847cbfbbd766 100644
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

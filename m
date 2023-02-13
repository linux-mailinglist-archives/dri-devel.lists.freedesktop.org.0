Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E7F694020
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 09:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C6210E4E5;
	Mon, 13 Feb 2023 08:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D9810E4E5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 08:57:02 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso10732304wms.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 00:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A2v1+wAQIxuDwwfxKBOXSuMRM+HP0P5i3QqMWmALdpg=;
 b=E7xg3B5eff3XtQGugwQOH4Lg08fyzJ6jm39iQ3rGjFHGXCUFDCHlRJaRLAPObm2rJN
 GY3i0iY7i6rrDz5daOFJc2/8Vd7UdmTk9A4rY6UOKc13xVByDW70ll2m8d6A0v1XyOmB
 wpM3wx6DKfW9W2Yr0l5YLv6mknvUJ5WX2ma358/n4tAlAAh09BXV9djARLTxN29ZBS+h
 rRR1P8ZUxAG3Vj5/c/8gXOYQiUy06jA8quctDib4upMtmNGhzb6GzoJEjIRh0r50a9AD
 dduQ+EfgPutdM7VAbGTJhJTb22+8U1gk+KfJ2vZaySI3UIMTyd3sk1xOA4iiuircIU0i
 DFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A2v1+wAQIxuDwwfxKBOXSuMRM+HP0P5i3QqMWmALdpg=;
 b=ClhtQhAPu52VWPKXS6tNJf0F3uSL5/uwq48Q/okVkpOQ1Cx5iDVp0ll74WxTH6/kCe
 T08Ls+mlMSL2/sXIUuWvshzJt//QWfw4M9wOi4nS8CCqiMXsEJJRO978fPdM2YsO8uUx
 gSUEQ5bEoFQvbDvKNmsZwzDe5Bqn/onU4WDH7+jskgj29+0iYkCh3PfT3zpK+cjfXudI
 m7z8jQNxCCrX4NSvpGgYgLoFhnVwCWQxpEN+maBSJwV0nw+afifLzyxjbyg09TLJuQbn
 NWJ6dM6mj7lvsnHytWZRGCcaepnZgLr+R4Ydja5jnPHdOalY8FIkBH0XTmExNG0nj6ID
 MDxQ==
X-Gm-Message-State: AO0yUKXaBArmLCzNK0XjotD/tq7oZwjGP/kwZv/oHjY6fwvOonJ5/meW
 NR3NN+8SEOw7tJOhWoE0jkM=
X-Google-Smtp-Source: AK7set8U0uKqML9KE2p+Jse1vuLMJiY1RtQBjS2ARR+GJhqbCyI4NylHOGp73+YufJis9gr9tB5/8w==
X-Received: by 2002:a05:600c:4b1d:b0:3de:3ee3:4f6f with SMTP id
 i29-20020a05600c4b1d00b003de3ee34f6fmr18753551wmp.8.1676278620730; 
 Mon, 13 Feb 2023 00:57:00 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c4fc700b003db0ad636d1sm18005330wmq.28.2023.02.13.00.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 00:57:00 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Oded Gabbay <ogabbay@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH][next] habanalabs: Fix spelling mistake "offest" -> "offset"
Date: Mon, 13 Feb 2023 08:56:58 +0000
Message-Id: <20230213085658.96918-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/accel/habanalabs/common/command_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 6c4d9b1aa5de..74ccafeb38dc 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -3199,7 +3199,7 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
 			usleep_range(100, 1000);
 			if (++iter_counter == MAX_TS_ITER_NUM) {
 				dev_err(buf->mmg->dev,
-					"Timestamp offest processing reached timeout of %lld ms\n",
+					"Timestamp offset processing reached timeout of %lld ms\n",
 					ktime_ms_delta(ktime_get(), timestamp));
 				return -EAGAIN;
 			}
-- 
2.30.2


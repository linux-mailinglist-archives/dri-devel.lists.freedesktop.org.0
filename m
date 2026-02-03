Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBufH8/mgWl0LwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 13:15:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3AD8DE6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 13:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A8910E324;
	Tue,  3 Feb 2026 12:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mjT6N8Kx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0057410E324
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 12:15:05 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2a7b23dd036so27254595ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 04:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770120905; x=1770725705; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LVb3ZndkYPxb0vLCFm6FM7GNTS9TCg3b/+4i6KnRxlE=;
 b=mjT6N8KxVMNUnxcb5yLDYV9Jc8BMrIbS7iQFnl9etWe1ztue30SSFAHqXMPnWI6liQ
 czcHFmfSSwVFMHjaQA+S5C6w6+dfhIpMCW/rjfj0QcyEoKDQ26jnYn8lihhQMCQU4jFq
 dt4aiZSk8vYKlpXNavE/0pgcCxE6qYD4WOXf5ViKP2sMxkRbqMkz92vXg1YzzH4a6UHp
 kdtfxl1XtcXlpDt8omfmoUygHZlyHOL7ASmdMPtteZq+CpZ9wROcSSHUzbrAkbDKwyZn
 h9XNQHlyea5niem+Kwpf27lrjC7pWpp1rFCD87QuF1u0O9K6h45Lw1/3ZbICS/Pp31/m
 ehkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770120905; x=1770725705;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LVb3ZndkYPxb0vLCFm6FM7GNTS9TCg3b/+4i6KnRxlE=;
 b=dvWhtXTfIVCCN7opHXpLjrue21mSsZdgai24uXnpvScXzta4ZKwirs+lP7R+FIOuna
 GlNXnxdsh9WU9Rg/meO/CT1yUxfMFzuQg9OPhBVTXMBHcAHPIDpdAZn0IFb0mc1mWCg1
 5MHcmDTqJCkId64TfDJEHw4SIIWszJOtuM77+mN2GvBdoFWdxUJ2yTxFb4hIhOM1g1hv
 C2xglQa82LY9E50nvFoPM0bGW583QAOBRghqs6fPNqGNWwQKzLRqpIuvEYtZP9xPUMAo
 8LDgI9XByVY046XHecrFhvd4XCLwROBXgxikkQfmX9SWd/KyHNo1cjmf+x0PafzG3Y5u
 0C6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5UH4M2MWFJfJa1i1CsSA9efTlyDC3wM70P9joHvYlENlJVdJ9KkKtNahSCvx7/dJVGUEtezRz2GM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZmlg+rcHuGxgSLotg+Na6/zjWXNDg8BQBUYn5hNy35wgHwWbl
 6UPkE0SjLdGtZPY8LHAy0ebpHeD8/4DionykWIC4pxvUB8NZPHjTAyh7
X-Gm-Gg: AZuq6aKgvyGDGo463KWY1fOyj8ehtUcuVxA25eA9lgpdF9P0Yw586SraKpTOyJyTkpZ
 8LYgxme+1CVeak2noQOgjxdQGMnfMSrLtum1W+TZY7Y9KJQnkKwmoZ3bQeTUCENalz7Gbr322Lo
 6dN9vf7Ap6uYgOPXJn1sBxlGm+xMbm9xhVw6HshB40vpJriQXfRuLGYhJ3MleDlF7pK2QTAmGvg
 27MnXWG+8rNGKe5zXsQqNIupXkEb/JRBUNYI1sNdhl0cq2dhvI7wCKmORxKxL5sd/T/MwnllJxV
 bxkk5d+K1ZmX65YjPwlJW+tRuHYrZ1KlpBg94vEuqQLRl8BcKHkwrH7jdWTIXSyrOfHF3ffx432
 p1M86RiNPMGgv2li9g0kDcKjWtKU7mHeQUqEBpuUFLk84t+I97GAS4Vn8TbT1AvJpQ+jxFMfs/A
 86smjZgcE0faVb2H75JRn+MLyhgw==
X-Received: by 2002:a17:903:2c04:b0:269:8d1b:40c3 with SMTP id
 d9443c01a7336-2a8d7eaadd2mr149945765ad.12.1770120905361; 
 Tue, 03 Feb 2026 04:15:05 -0800 (PST)
Received: from junjungu-PC.localdomain
 ([2408:820c:9008:ba52:f091:7dff:927e:f788])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c3db4sm183413415ad.50.2026.02.03.04.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 04:15:05 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 03 Feb 2026 20:14:58 +0800
Subject: [PATCH] fbdev: au1200fb: Fix a memory leak in au1200fb_drv_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-au1200fb-v1-1-7889c4061337@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMHmgWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNj3cRSQyMDg7QkXXNzMyMTE6OkZLM0AyWg8oKi1LTMCrBR0bG1tQC
 ZhAwuWgAAAA==
X-Change-ID: 20260203-au1200fb-7762442bc6f0
To: Helge Deller <deller@gmx.de>, Zhang Shurong <zhang_shurong@foxmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770120902; l=1120;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=Z9DoncZRp1hGTgs52zuEEOEhMYNvMiELdJSmhQoVOuU=;
 b=STbOjk+2U9pG24k+N3Z0e3r2giORI4ny9g7q6UZRZr1BYvAHqq9qT9OEGEdSXbyMrbpFP9jfH
 +TC2o9HFL5GBnTkn5B1TXGOv1owwlmXHOxLzhZSEXFi4/PCiqhPggma
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de,foxmail.com];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:zhang_shurong@foxmail.com,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustc.gu@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CDF3AD8DE6
X-Rspamd-Action: no action

In au1200fb_drv_probe(), when platform_get_irq fails(), it directly
returns from the function with an error code, which causes a memory
leak.

Replace it with a goto label to ensure proper cleanup.

Fixes: 4e88761f5f8c ("fbdev: au1200fb: Fix missing IRQ check in au1200fb_drv_probe")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/video/fbdev/au1200fb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index ed770222660b..685e629e7e16 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1724,8 +1724,10 @@ static int au1200fb_drv_probe(struct platform_device *dev)
 
 	/* Now hook interrupt too */
 	irq = platform_get_irq(dev, 0);
-	if (irq < 0)
-		return irq;
+	if (irq < 0) {
+		ret = irq;
+		goto failed;
+	}
 
 	ret = request_irq(irq, au1200fb_handle_irq,
 			  IRQF_SHARED, "lcd", (void *)dev);

---
base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
change-id: 20260203-au1200fb-7762442bc6f0

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


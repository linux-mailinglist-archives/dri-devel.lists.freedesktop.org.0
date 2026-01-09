Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD653D0B14A
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 16:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD3A10E8F5;
	Fri,  9 Jan 2026 15:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="cDOgZZ+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f100.google.com (mail-dl1-f100.google.com
 [74.125.82.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F82B10E8F1
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 15:58:27 +0000 (UTC)
Received: by mail-dl1-f100.google.com with SMTP id
 a92af1059eb24-122008d4054so1172022c88.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 07:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767974307; x=1768579107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBmlh8nnPiKUViarZeFngGoBMYKS/RA0CR8KSiE0VAc=;
 b=M6vKNWhBJoZyElYOIu7KJc7e647ka+/kOajN3geWwYfFdLoHEoWOY2816XRiC6cIdh
 5G2StHiACx30uTb44hi5RW+sQA5GOEm1H0UZ+xDF2vsrE+eseliZIloRCJYFtwMcbAYx
 kxFxl0u0U9fTgjF/HM7/oUcSD3LW+qymGZBUePYQvaH4c7JK1Zv9PRVulQj/0dcU7iUg
 rCo1QuloCq58ByDj8zeQGMQ/H8eae9BmTyZMrRxyACHCFDn7wrmQQPwbvbDG7ydwVXTJ
 sW8GS2oqafogLuESsJMxHxie6ofsP1/xYhXY1lfk1LHcZud69muQubVKdFXPlczTbEks
 wJDw==
X-Gm-Message-State: AOJu0YzelFcCjHLWlQ2yEdSRBcA85me8hLPp8A9UBJaZL8sSrQM7Mt+3
 buJ7+5WEnaIyJI4hYFsSE7PuDAEGvfl3XyVdWyIyGGq3nMTbZdsSXRDbJn90AaMLMAAnrbbY5s8
 kSGErvVCYvaIISi8fWRdRcxY1mQituuh4j5VzEs6EvWS7DqPeRofC0qBb3rRhmRNXgJrvY52svg
 nSw3XXrO8q/9udE5/cj8ZLzZnCFPX2S5bzQbnSzIr5FU8ndeadweT1QEyzw13BEvRVNWHeWlvfv
 UUod4XpjZBd5SPMZ9Sg
X-Gm-Gg: AY/fxX7RMVeBw6mj/DXnEe4qXMW4sEpKGyA5h2zk7GqcgwL0W6pHrw9vYzk/Krc9YEn
 sNmXOOJyuXZOWBZ3ST3ezrSEIEgfdJFxN7aiMzebsWev46dCk+I6VTiz8aGW6lnfcSemp5wAdjQ
 BR8ZfzC3RGLOC4jiREQJG+lkTePLupt8Ge6MUR+uhVp3ZqLBGp3KywjhBuzjDswG42RYsjB/pIN
 0x/yyIO3rgdkNtNEiNNOGRUf9n0uUwAz388n8dM2+2GlEPz9gtKrR6tYnYFiKN19lijAtlEdMml
 zw21cbE01wnm/maICZXXlKy1zUMXBeO6BEmxlOZXofn+KmJ3RB9ePhc6xpRTZb2NNIhEMvBuxCS
 lf97AKx4nyPHw4YhKao4kodewv8VwdnTNdsqdke7Xod8NqcG+pFAz6RJ0ihgBDHU3Q6juQfLcbk
 1XWOfLWkz9XiagVgEqndAE2KSLGgPapEr8nK+n6OBPI8Si
X-Google-Smtp-Source: AGHT+IEIj2m4BarvnLXAq0fDMFlCl0/ljdFyL/Q2iqrVgdcG+l8/Q67gxzzvNSwugTWygH0/EFx/VQqWB3q1
X-Received: by 2002:a05:7022:6620:b0:11e:3e9:3e91 with SMTP id
 a92af1059eb24-121f866f870mr9230157c88.26.1767974306590; 
 Fri, 09 Jan 2026 07:58:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
 by smtp-relay.gmail.com with ESMTPS id
 a92af1059eb24-121f24966f5sm2347001c88.6.2026.01.09.07.58.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Jan 2026 07:58:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b79fcc35ab2so372879666b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 07:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767974304; x=1768579104;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PBmlh8nnPiKUViarZeFngGoBMYKS/RA0CR8KSiE0VAc=;
 b=cDOgZZ+f/IXInFAZXbbQfk7oWbJ7MXQ9Hj/hKnwocrbpQ0mP8LUqEL7UtFbdSWLVIO
 aGblsymsFVjGXzx8IAORxAbKn5ozTAuPtzxh29I0UwtqDmiGxLPboruonTvyFvCGA9c7
 4g/zWDUiw6sv6+s2JsRiEdP1bGmeCDQVoPD6M=
X-Received: by 2002:a05:600c:46ca:b0:477:aed0:f403 with SMTP id
 5b1f17b1804b1-47d84b0a288mr117105085e9.8.1767973904096; 
 Fri, 09 Jan 2026 07:51:44 -0800 (PST)
X-Received: by 2002:a05:600c:46ca:b0:477:aed0:f403 with SMTP id
 5b1f17b1804b1-47d84b0a288mr117104865e9.8.1767973903666; 
 Fri, 09 Jan 2026 07:51:43 -0800 (PST)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8636c610sm64893235e9.0.2026.01.09.07.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 07:51:43 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Set a unique ID for each submitted command buffer
Date: Fri,  9 Jan 2026 09:51:39 -0600
Message-ID: <20260109155139.3259493-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

These IDs are logged by the Hypervisor when debug logging is enabled.
Having the IDs in the log makes it much easier to see when command
buffers start and finish. They can also be used by logging/tracing
in the Guest to help correlate between Guest and Hypervisor logs.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
index 94e8982f5616..1ee37690b940 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
@@ -105,6 +105,7 @@ struct vmw_cmdbuf_context {
  * @handle: DMA address handle for the command buffer space if @using_mob is
  * false. Immutable.
  * @size: The size of the command buffer space. Immutable.
+ * @id: Monotonically increasing ID of the last cmdbuf submitted.
  * @num_contexts: Number of contexts actually enabled.
  */
 struct vmw_cmdbuf_man {
@@ -132,6 +133,7 @@ struct vmw_cmdbuf_man {
 	bool has_pool;
 	dma_addr_t handle;
 	size_t size;
+	u64 id;
 	u32 num_contexts;
 };
 
@@ -303,6 +305,8 @@ static int vmw_cmdbuf_header_submit(struct vmw_cmdbuf_header *header)
 	struct vmw_cmdbuf_man *man = header->man;
 	u32 val;
 
+	header->cb_header->id = man->id++;
+
 	val = upper_32_bits(header->handle);
 	vmw_write(man->dev_priv, SVGA_REG_COMMAND_HIGH, val);
 
-- 
2.52.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD5qCiOJf2mptAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 18:10:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838BCC6A23
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 18:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6D310E0C4;
	Sun,  1 Feb 2026 17:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BElkj7Ch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C86B10E0C4
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 17:10:54 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-82318b640beso1967018b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 09:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769965854; x=1770570654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u54ua+qu21FHBsf3zLWVG9pnVP6xgcSXcYQSK/iMf0g=;
 b=BElkj7ChdFQ7ddMdR2OkT9skAGYN0MLpoF0qtYovmvpxjaHkuVe0o0APbXLhfu5DMG
 rcSkxjcvSPdrl3LN8CLU+qBojGAd1WIUkabmucAddbraJzG/B5SSpXBEBTFnn7+xaCfw
 lQSeClGuEKBuas7rygY9kfyKJUICFgjwcg37YD+yxQ4lsNgOmupwdsBtwtpVs8ag+Lub
 P1Fawtn+NGpnmH2zTUrKD5CmXL6Ul5Wos2b7ULl/rjGTxemWNNEa4x/0lu+9i9h9h32R
 CopLRr5NFLw2e2KuifCxst5nMUH1Uc4U0678d5XnINIEe6liysgfrnZQeeDQzbYoN6T7
 YcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769965854; x=1770570654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u54ua+qu21FHBsf3zLWVG9pnVP6xgcSXcYQSK/iMf0g=;
 b=Pi/rgSDGmN+ALfOaRF2iwqkpGCrOFGP1NolkKOZqnZ+UyBlp91JrvW7PI7ev0lfZYM
 mOeqQohK8cQCa2npOm2TxIwTqt0pL4KnYqvsPTnmAe+BwdTn7/LkehvCOHnTOb0W0akt
 fjDeEQG1iWMoOE+UM3SNY5Agcx43DJ4vvyNDteMmHyNMRtB7fT8SoSwjPxo/4C3tMutd
 1kaR9aSgAiQgSfo0zFw7wC8DQkE4vRxa4iJQvrzpfppL6OdIRddpWSufe/56JMjhA8Ei
 TlTBMk1aaGg65PKWZnYHJ56FS6PSGpAuhvzdGMsMOaC2TFOfaufmKPih88tPPKalQC/k
 8nzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSRTNr7RiZXW35bzvA6jfUdgWcji0c+UCVcZYzhdpgZ5v2p3TMuaIp5B3vvr24ivCqese6Yx3DOPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx742+e46mbYjD/PYL3+DdJvZJ/4FmZzHu4scJPY/4gLcGeJB8
 XvuoUwyK+P8d9dR7oHKrjApC/xJO/M5QK4wEjG50VmyzuJHyy1fBJGZF
X-Gm-Gg: AZuq6aLuX50b884UJyeuQSinwz1SdDL/6DtMYz6CccWCIKyPl7McEXix9C08qml1eIF
 vs39l3qhwMzwNNFKBYBlsDIT3C97sCM1JvxPVFH8d1V00ro5kMGCb+ej2f+xMuqEncwIZHGn9Dd
 Tqx8+eH7u10FIe1k58Pr855B0V0praQLkX4CQEcfdIPi4HtyfDKRagjthx1ZrxObBoLIZ8tOqKt
 wVT7EQz9rWXZZFyVaSmjXm0bl/AHu/t91Rjtg93qqKTnGKyTwFa7WT3fogk70h93qyfWAY4nGto
 wh9CESmNWU1to2Bgbd3P963r4FnD+gB6n0OX34Fw0txLIEx+VuDBBz3vsZ+STf3fN9JKSIRS5L8
 3MA4BtsoW1nxLdyQgtiwuNqhk6iwDfrq8FReJAgU4Ogwlku6J2AWuPVXlKLAVLkr3M7i6MQRf8z
 mIEbzuED/OwsitOGpb
X-Received: by 2002:a05:6a20:6a05:b0:38d:fe2a:4b0a with SMTP id
 adf61e73a8af0-392e006f5b3mr9449061637.33.1769965854039; 
 Sun, 01 Feb 2026 09:10:54 -0800 (PST)
Received: from pop-os.. ([2601:647:6802:dbc0:eb8e:fb38:51dd:c774])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c642add5199sm11579118a12.31.2026.02.01.09.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Feb 2026 09:10:53 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Cong Wang <cwang@multikernel.io>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: add SB_I_NOEXEC flag to dmabuf pseudo-filesystem
Date: Sun,  1 Feb 2026 09:09:52 -0800
Message-Id: <20260201170953.19800-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-media@vger.kernel.org,m:cwang@multikernel.io,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xiyouwangcong@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiyouwangcong@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,multikernel.io:email]
X-Rspamd-Queue-Id: 838BCC6A23
X-Rspamd-Action: no action

From: Cong Wang <cwang@multikernel.io>

The dmabuf filesystem uses alloc_anon_inode() to create anonymous inodes
but does not set the SB_I_NOEXEC flag on its superblock. This triggers a
VFS warning in path_noexec() when userspace mmaps a dma-buf:

  WARNING: CPU: 6 PID: 5660 at fs/exec.c:118 path_noexec+0x47/0x50

The warning exists to catch anonymous inode filesystems that forget to
set SB_I_NOEXEC, as anonymous files should not be executable. All other
pseudo-filesystems that use alloc_anon_inode() properly set this flag:

  - fs/anon_inodes.c: sets SB_I_NOEXEC
  - fs/aio.c: sets SB_I_NOEXEC
  - mm/secretmem.c: sets SB_I_NOEXEC

Add the missing SB_I_NOEXEC flag to dma_buf_fs_init_context() to fix the
warning and maintain consistency with other anonymous inode filesystems.

This was triggered when testing DAXFS (https://github.com/multikernel/daxfs)
and was 100% reproducible with CONFIG_DEBUG_VFS=y.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index edaa9e4ee4ae..e2e1f77aca80 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -192,6 +192,7 @@ static int dma_buf_fs_init_context(struct fs_context *fc)
 	ctx = init_pseudo(fc, DMA_BUF_MAGIC);
 	if (!ctx)
 		return -ENOMEM;
+	fc->s_iflags |= SB_I_NOEXEC;
 	ctx->dops = &dma_buf_dentry_ops;
 	return 0;
 }
-- 
2.34.1


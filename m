Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2EEBA501B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 21:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA8910E097;
	Fri, 26 Sep 2025 19:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="fTOy0lxM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f225.google.com (mail-il1-f225.google.com
 [209.85.166.225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C5610E097
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 19:54:37 +0000 (UTC)
Received: by mail-il1-f225.google.com with SMTP id
 e9e14a558f8ab-4248a13fbe9so13763735ab.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 12:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758916476; x=1759521276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJIu0O1GDMSuAYjJOapGZvPW2pq9XhmxRYoc8eSbTZA=;
 b=Wyr0MxUc6e9skZInz/coAWXh1TE7Ob/j/mASVZgH+4Geao8IdCXL7iT01nXW0wq4l4
 4FM+3k8dm2Pw90bvw6KLk9M6uc2jnaIY5e8T84DWhZxrEajFGnBLSTzFwSsnaTAt0+66
 ZZ44UEucuovxSJhfJipKHLwUna5itBUYP8rnvvTimVwMGIRnOc6/Le65kLfQzQwnccM8
 e4BzOHbsDILMri7p14OTpBvtPWCQgWyKbNg9AeDh4cwD/azuVr5Ea75VwD3u301OH+1e
 SV06OO/vx0kC6c0ZCM1FGdg3b6GkIrO8GZeW3g274E72BOl0xBwdXqzADHT0Let7khki
 37RQ==
X-Gm-Message-State: AOJu0YxkGaYZ7hABDepeshMKwtaeLtHmB93+QSpuLk6EOagn5YlGOu1p
 R82ku4yWp1B5UoSNSyFSg/YXaXp/w+82I79B67NDhLeu9+Y4SYw6dDuTxgkTcy/a3VzL3XeliSv
 /TxU4NJjhkg3EMRO0r7+//3yJTNnFDgFFGw0NLkn19vzTSz93Icof1WIGMyH05X1+SAEmtyt2PM
 ww8WEqSH5tq8mI7JTxMB+wl3BbpEkEFLRcWZOcAIUQzOH/vdxu2vo1cR5hivguss6JnYup8ApRu
 xNApGwvv1z4fIYS6m1j
X-Gm-Gg: ASbGncuzq/QtwPNE5ig9iDvt+xaZa7ocd+eX3TDkKjlQ2P8NK0r5GxKCSOSQFafObSG
 WHM5OQquh6hvOPu7yJSwfaJMcW/8aRY/IS23/C5DpWcNhpwxuZPClGPlycZUtl127ryuk+rX8JN
 pdnNL/BgqGhJt59he6bItXHIKW2dx5k6lWPfE0ldtg8vaMhk4UNfik37QXwyt7E9Rv/xGZgymkz
 xc/vEpgeiLyz/dq6r3teHNfvMkTatyFMathbNtiTnDI/tEMVLt1MlFjJANC41zwUgOLYcwHYC9u
 NuO6sEk0Dwbpoqtc9Iwy/H9IrVe1+83SQz6rSrngcq+MA9rCplHISwQoShDZob5KRoy571HQXAJ
 JARJL9xkMJ1nKPd79t37ITnmu9crZrlZVMRy+/jTi7RuMlJH5NFLKd4FncteT3qGaZrbk0G1A
X-Google-Smtp-Source: AGHT+IFZFe3tWgf/dAIloa//QLw9weHloIY4VFfzC4QX08G0o2jk58lJ2R2jthauixFSnPVzQVRPgxCh1RCh
X-Received: by 2002:a05:6e02:194a:b0:428:306a:175d with SMTP id
 e9e14a558f8ab-428306a1868mr26219715ab.28.1758916476019; 
 Fri, 26 Sep 2025 12:54:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
 by smtp-relay.gmail.com with ESMTPS id
 e9e14a558f8ab-426a0190598sm2844725ab.6.2025.09.26.12.54.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Sep 2025 12:54:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4d8b8c3591fso69792891cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 12:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1758916475; x=1759521275;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GJIu0O1GDMSuAYjJOapGZvPW2pq9XhmxRYoc8eSbTZA=;
 b=fTOy0lxMFtYYpQohpSun4FOhJ0zNVKqSSWTLDD1owddalCq2/o32VXWvfW18vrCYAn
 M41BcWfoiEoX8v/3i6VucguOOj1norqhAX66urlIl1IKwQxqsOgdTlUUNkJpzQTMlSer
 pSJdZNYdta69s4ynGVAY/E3HIZGrP69sAkndA=
X-Received: by 2002:ad4:5dc7:0:b0:7eb:c8ca:c137 with SMTP id
 6a1803df08f44-7fc2f4c54c9mr118796776d6.29.1758916474560; 
 Fri, 26 Sep 2025 12:54:34 -0700 (PDT)
X-Received: by 2002:ad4:5dc7:0:b0:7eb:c8ca:c137 with SMTP id
 6a1803df08f44-7fc2f4c54c9mr118796396d6.29.1758916473960; 
 Fri, 26 Sep 2025 12:54:33 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8016ce9a3cbsm31004076d6.56.2025.09.26.12.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 12:54:33 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, maaz.mombasawala@broadcom.com,
 zack.rusin@broadcom.com, praveen.singh@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>,
 Kuzey Arda Bulut <kuzeyardabulut@gmail.com>
Subject: [PATCH 1/3] drm/vmwgfx: Fix Use-after-free in validation
Date: Fri, 26 Sep 2025 14:54:25 -0500
Message-ID: <20250926195427.1405237-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.51.0
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

Nodes stored in the validation duplicates hashtable come from an arena
allocator that is cleared at the end of vmw_execbuf_process. All nodes
are expected to be cleared in vmw_validation_drop_ht but this node escaped
because its resource was destroyed prematurely.

Fixes: 64ad2abfe9a6 ("drm/vmwgfx: Adapt validation code for reference-free lookups")
Reported-by: Kuzey Arda Bulut <kuzeyardabulut@gmail.com>
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index 7ee93e7191c7..4d0fb71f6211 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -308,8 +308,10 @@ int vmw_validation_add_resource(struct vmw_validation_context *ctx,
 		hash_add_rcu(ctx->sw_context->res_ht, &node->hash.head, node->hash.key);
 	}
 	node->res = vmw_resource_reference_unless_doomed(res);
-	if (!node->res)
+	if (!node->res) {
+		hash_del_rcu(&node->hash.head);
 		return -ESRCH;
+	}
 
 	node->first_usage = 1;
 	if (!res->dev_priv->has_mob) {
-- 
2.51.0


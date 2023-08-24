Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB06B78798F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 22:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2768410E053;
	Thu, 24 Aug 2023 20:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd4a.google.com (mail-io1-xd4a.google.com
 [IPv6:2607:f8b0:4864:20::d4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296E910E053
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 20:49:12 +0000 (UTC)
Received: by mail-io1-xd4a.google.com with SMTP id
 ca18e2360f4ac-77b257b9909so18964439f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 13:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692910151; x=1693514951;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BpHJy0xtUCv2a8+NkW5PB2F6J+9bq70l3+n1crasXPg=;
 b=4LHD+g3Hs93NzyV+bQ21E+6npsJl1j6DyiILpZfa70xOL04NtrcgcxNja0HiixFg41
 PrTf4UfUdQDU/V8mg2ZFUmRgb2Zuc2OlF7y62wISBC8uCLbBJ4zZqSGeFYa/2SXlIgki
 ExYfzJAfwP3q2slB97qIUwuNJpv1nNtAZQMa0M+MmshbAJsQABzZGYIDI0y6usSMbPMY
 i8rfAcFb3FpVcq9qLYzgBsC0A/7+J+Vrti+dWuRWP0moLpOHVrI/LnzkcV08mqagQXVq
 YoEmujrR1+DBOcTFF+TKf4ZrbsOuHkTinvqyXSDIWx9ImqIm94NhIr5gIvIMDoK5edfs
 BDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692910151; x=1693514951;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BpHJy0xtUCv2a8+NkW5PB2F6J+9bq70l3+n1crasXPg=;
 b=Y28p+1fiTYm1Xz9nTtO+qhn0iQXHIaToPwd+fXfoe9Yds4rNN0S6qMxRdI/bZLc30q
 seADHyHvZ6skXrt0F7fpswTYW29Vzrr+zXP8sZc0OCqmMykp2TbWRiPfA8oVKHKWQ1P3
 ATxkiE/Peo++YtI4zYrR/yNDwmNpFaAqmeSF2iTHuJLD1voF0n5rnUaMeUDQj4PAUXwp
 mqAzw21+2i4rMvNLM9Bi2qaT1MN6lTLJtuQXdQoXj6DTUAFTw0FWQOGnp+pi9f5SCaW7
 yBBIOnZLYlRrPuwmnVGCmmyoZNYoSw/WP2MJT7qWOe4uZja6ldCRnQKdL73nj4Pq0FBR
 VPig==
X-Gm-Message-State: AOJu0YyDiarzn1wsfJqNLUX+AQ0ZRGQjze+1l8A2N9Cq8ANrCBjomrSV
 bX4Ozk1S8wDQmqZAizHVI0ZZAZRYjKZpFaoQVQ==
X-Google-Smtp-Source: AGHT+IGCzg9T12M4d/3pwncQLdGrc6I6tVfup/nIVd1cLf8n14WecMd5Gd812VnV/4jZSw+Sf0ueKAW2eYw3EjxUhw==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a02:a155:0:b0:42b:a220:a32d with SMTP
 id m21-20020a02a155000000b0042ba220a32dmr202775jah.2.1692910151324; Thu, 24
 Aug 2023 13:49:11 -0700 (PDT)
Date: Thu, 24 Aug 2023 20:49:11 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEbC52QC/yWNQQqDQAxFryJZNzBNLZVepXQRY6oBGSUpooh37
 2A3D97i/b9DqJsGPKsdXBcLm3KR66UCGTj3itYVB0p0Sw3VGF/PMm/YuS3qgSyiIw7ccuaR28B
 +2vgPQeJ0ZyqtPBook7Prx9bz7vU+jh82xQlvfgAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692910150; l=1804;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=q9RFqzuzSf+JWcxuWQQn2bXUpH2CiQm1RQ706+wRDyY=;
 b=JHfQP3Jmi2+KwCdCuR3S3FvUV4fZkP336jFiB4R4SLBE4/A58qQuTS/kDapIjztNdiYDiiYxh
 3SvAzyQcFyJBJyFXWRGaxHRr7ZkcwaenKRdNvQPuN/mBtNP3AXUA0E9
X-Mailer: b4 0.12.3
Message-ID: <20230824-strncpy-drivers-accel-habanalabs-goya-goya-c-v1-1-b81d5639e7a3@google.com>
Subject: [PATCH] habanalabs/goya: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Oded Gabbay <ogabbay@kernel.org>
Content-Type: text/plain; charset="utf-8"
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
Cc: Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

A suitable replacement is `strscpy` [2] due to the fact that it
guarantees NUL-termination on its destination buffer argument which is
_not_ the case for `strncpy`!

Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.
---
 drivers/accel/habanalabs/goya/goya.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/goya/goya.c b/drivers/accel/habanalabs/goya/goya.c
index 7c685e6075f6..d0ac7065f3d7 100644
--- a/drivers/accel/habanalabs/goya/goya.c
+++ b/drivers/accel/habanalabs/goya/goya.c
@@ -466,7 +466,7 @@ int goya_set_fixed_properties(struct hl_device *hdev)
 	prop->pcie_dbi_base_address = mmPCIE_DBI_BASE;
 	prop->pcie_aux_dbi_reg_addr = CFG_BASE + mmPCIE_AUX_DBI;
 
-	strncpy(prop->cpucp_info.card_name, GOYA_DEFAULT_CARD_NAME,
+	strscpy(prop->cpucp_info.card_name, GOYA_DEFAULT_CARD_NAME,
 		CARD_NAME_MAX_LEN);
 
 	prop->max_pending_cs = GOYA_MAX_PENDING_CS;
@@ -5122,7 +5122,7 @@ int goya_cpucp_info_get(struct hl_device *hdev)
 	}
 
 	if (!strlen(prop->cpucp_info.card_name))
-		strncpy(prop->cpucp_info.card_name, GOYA_DEFAULT_CARD_NAME,
+		strscpy(prop->cpucp_info.card_name, GOYA_DEFAULT_CARD_NAME,
 				CARD_NAME_MAX_LEN);
 
 	return 0;

---
base-commit: f9604036a3fb6149badf346994b46b03f9292db7
change-id: 20230824-strncpy-drivers-accel-habanalabs-goya-goya-c-2a05a2202c78

Best regards,
--
Justin Stitt <justinstitt@google.com>


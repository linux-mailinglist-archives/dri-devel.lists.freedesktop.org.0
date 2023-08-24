Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6912E787982
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 22:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E92810E136;
	Thu, 24 Aug 2023 20:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6670810E136
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 20:45:09 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-591138c0978so4047177b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 13:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692909908; x=1693514708;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZUR68uKdghzn2Y8Ad4w0Ea6gF9hUY3E2tFS5OeMPoWo=;
 b=WUm5i98pTP7NvgunuzXTkokjDZUgTIFrlN4kIp7ozqkz/QPleN+RIiBkhtGzOb9IBn
 XsHVw91mX8ry/g42MRuowOm6eJ6GZrtoVv70me8cLRmwLL00hddEpgBlZPtSp70QPdq1
 Uj0wcbPRCkyZdNX8YiHdkM56E+dPiWmmVuPolOJP+eCIAgwxNTlIF/czwiEGJDOiVEiW
 2gDxnqLq1qLFVrAIseA5XK2HRXeSLhRTM0lE9rhHkiJ9unE4qco+6wHHZaHbF0S4ZYCt
 aGhsVltsPfzxtYzhXr2vUEutUWE/Dq5OrX+qkTicJEbr0+UZE1mPDZn3xfRKpPRZhjN9
 UETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692909908; x=1693514708;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZUR68uKdghzn2Y8Ad4w0Ea6gF9hUY3E2tFS5OeMPoWo=;
 b=E6+Q7yCRH3JvBP+FuBRMhujh2LOD6695en/cd2TyiXI45lRxiQWFYWc+bTmjgW5ZeJ
 BXGh6tZyOr7sIiM0GcM7YFuJg/UX1K/8MPNHGhI+phSSXa3JwkDNnsc9AtIg+j9C/9xD
 8qdbLy9XIcMFYhJxK12759DG8yxwC3eY+qBc5xPZfGvlb4FmlVb5kprY85V92RGqFrmT
 v56pl2kiJJ3GfCDxEblHh7WmRjJg+yYP5cEkoyt/mxhMANEFMMwWk/6WrvbpmWFaMFkW
 2rYUkwL5EiTCVJQFcR4quXJ0rgKkkQIVSU/hEfNW6hdx87NxX8NOmS8fAYv2ePxnThJw
 SNNw==
X-Gm-Message-State: AOJu0Yx602xb/ZuHpZxG4egEPgpbpt5HLzQug3hWMi04E3++TZ0QWAmN
 seqMQqJ5xEm3pnqnKw+oAadsYigSI+gJN5Zrnw==
X-Google-Smtp-Source: AGHT+IGPDaZhtt7yTFPzL+iUB8gPlSwsG7LrnFHzE3lb+AAvs/HuF+e1Dp6UupEf3ne4ULA78L3JabmtBg+sOQn8+g==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:2442:0:b0:d11:6816:2d31 with SMTP
 id k63-20020a252442000000b00d1168162d31mr248160ybk.7.1692909908546; Thu, 24
 Aug 2023 13:45:08 -0700 (PDT)
Date: Thu, 24 Aug 2023 20:45:08 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFPB52QC/zWNQQrCQAwAv1JyNrCbChW/Ih6yu2kbKGtJtCilf
 3cRPA1zmdnBxVQcrt0OJpu6PmqTeOogz1wnQS3NgQL14UJn9KfVvH6wmG5ijpyzLDhz4soLJ8e
 JX0Xpj4wh9eMQhyQSCVp2NRn1/Vve7sfxBU6EPOOCAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692909907; l=2009;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=6YGJBQmqB85nFtFD66zoKdZ4L+GgP4Vbcd+6oeKMetM=;
 b=+rLrfvbmfKhGQUmnwCP1/TSULbb1D6F2rtJ/GwVNHlqUPNPwNaUZuVzkoksRXIHvf+ECMV3Od
 iAsOhO9SWEsDzwggz1kemkbqpISqUBHTxxpuL/PkaFKeR7WZw8MhNQ5
X-Mailer: b4 0.12.3
Message-ID: <20230824-strncpy-drivers-accel-habanalabs-gaudi2-gaudi2-c-v1-1-1a37b65576b4@google.com>
Subject: [PATCH] habanalabs/gaudi2: refactor deprecated strncpy
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
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 20c4583f12b0..755b2d92357d 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2431,7 +2431,7 @@ static int gaudi2_set_fixed_properties(struct hl_device *hdev)
 	prop->pcie_dbi_base_address = CFG_BASE + mmPCIE_DBI_BASE;
 	prop->pcie_aux_dbi_reg_addr = CFG_BASE + mmPCIE_AUX_DBI;
 
-	strncpy(prop->cpucp_info.card_name, GAUDI2_DEFAULT_CARD_NAME, CARD_NAME_MAX_LEN);
+	strscpy(prop->cpucp_info.card_name, GAUDI2_DEFAULT_CARD_NAME, CARD_NAME_MAX_LEN);
 
 	prop->mme_master_slave_mode = 1;
 
@@ -2884,7 +2884,7 @@ static int gaudi2_cpucp_info_get(struct hl_device *hdev)
 	}
 
 	if (!strlen(prop->cpucp_info.card_name))
-		strncpy(prop->cpucp_info.card_name, GAUDI2_DEFAULT_CARD_NAME, CARD_NAME_MAX_LEN);
+		strscpy(prop->cpucp_info.card_name, GAUDI2_DEFAULT_CARD_NAME, CARD_NAME_MAX_LEN);
 
 	/* Overwrite binning masks with the actual binning values from F/W */
 	hdev->dram_binning = prop->cpucp_info.dram_binning_mask;

---
base-commit: f9604036a3fb6149badf346994b46b03f9292db7
change-id: 20230824-strncpy-drivers-accel-habanalabs-gaudi2-gaudi2-c-0b3f717bee12

Best regards,
--
Justin Stitt <justinstitt@google.com>


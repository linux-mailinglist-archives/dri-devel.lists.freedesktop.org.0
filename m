Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FFD76C11C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E9E10E473;
	Tue,  1 Aug 2023 23:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD66E10E46A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:56 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-34915ceb5eeso10482805ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932956; x=1691537756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7iCNWvd7mdJx34DAX7Wae2aC5uwBwu5nJTt0y8KbTx8=;
 b=p+NsVriXcPo3kkm17+FNLSSKaoOxRCz8MOiWWmrqSIT42Y7Mdkp+/8meW/1zSODlvE
 Dy1TGTcF7MJkH4Hw0IkGWIv6llvHXj7Mtot64iDV1TqTT0TwZv9b+9k4cEhQZALB621X
 ji/X2i/Awk0V4o0pboSGbUtWxxg7HfjZttr+08xgRX8+Og6I0VGqlaLsinEkDNgmDXfj
 k95K3WUPHYGIjl2LgZvtbDVpQ7CIyhJIKbgkcOFGYIP/+JRoP217fV7THjfjDcCHvdza
 ZrBoSQqPqqFqDuvegv0pAF2DM3XgO05t/XtGeYzv6PBn8wsoUNveCe49FdW3wW4Ex1Qf
 jUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932956; x=1691537756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7iCNWvd7mdJx34DAX7Wae2aC5uwBwu5nJTt0y8KbTx8=;
 b=W8n4Mip/6q3ji2T24tzVUmn6Kboze9/Hfl26P+NpapVvdy5PKN0plRD8K6+hlQTVgb
 pQ+byoMe3v+6lIUIaLmG87/w/Pf0UOJCYiw7h8vo+kfJ6vVpKWwi5gTsDs+V8v3nfRCu
 b21C/e7QuOT0myIAcB8BIw5zHaG8+cpYkakWsqx218lu7HZZgtXPIb1EOdFaKk2pSnmg
 /7DhMOgR66T7zppD2ZKVWHftBV8qOxNXN0gHzFnI6AgkKrXl67EVLmJiM3jcz5JSc5tZ
 Wdr5ePu5f15JMJ4QKTG1jXGh33f34HSSPKLiIhYEKG3x+QhP4qaEVVBDrG8H7noMFnN7
 qD6A==
X-Gm-Message-State: ABy/qLYMXlob3XYfTUuIOTxl8t38Wtq/isGFCWYQIHP3itXFDv25ZEt5
 +3mmK7WBa5wWu3t8Ds1Wiqk=
X-Google-Smtp-Source: APBJJlHSfKlG3LMisc2KAZfy5seMkjLsG3yLPUJVVnZN9r71+k9L7FCjm3IIqGPHj/3d1Yb1ynxlYw==
X-Received: by 2002:a05:6e02:1a65:b0:348:e4a7:7bff with SMTP id
 w5-20020a056e021a6500b00348e4a77bffmr14543737ilv.21.1690932956103; 
 Tue, 01 Aug 2023 16:35:56 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 23/23] checkpatch: reword long-line warn about commit-msg
Date: Tue,  1 Aug 2023 17:35:15 -0600
Message-ID: <20230801233515.166971-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233515.166971-1-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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
Cc: apw@canonical.com, joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reword the warning to complain about line length 1st, since thats
whats actually tested.

Cc: apw@canonical.com
Cc: joe@perches.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f6b6b2a50dfe..31c55e3ece09 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3272,7 +3272,7 @@ sub process {
 					# A Fixes:, link or signature tag line
 		      $commit_log_possible_stack_dump)) {
 			WARN("COMMIT_LOG_LONG_LINE",
-			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
+			     "Prefer a maximum 75 chars per line (possible unwrapped commit description?)\n" . $herecurr);
 			$commit_log_long_line = 1;
 		}
 
-- 
2.41.0


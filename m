Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEC276C11F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5E810E476;
	Tue,  1 Aug 2023 23:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDB910E46A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:54 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-790ba9cf42aso52401639f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932954; x=1691537754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7iCNWvd7mdJx34DAX7Wae2aC5uwBwu5nJTt0y8KbTx8=;
 b=bLc/OD62yNGsaknTN2LSfF7wm4qDMA7XF1hJsijXqExyBhtTYyEgnb9aZQdD9yfGpi
 FV1f67yZalQI1a3yePxSdRLdvF5QXAOzbhX1eReL0FgLFRmg6auJjD8k9OL1Y01k0iRl
 QBGro2ZLn93eCFPVg1kCOiefPiTBLuexk9N4JsTkM6c2frBFrxZ84Tyz59PzENbBvG9+
 cngDbZJqNIAeiEm2pWGbIaWpPh/K204qJmH4IzIfO26fS/UFuNjUKQVLedeXfIsfRbh8
 Tb9z+XiG1GmL1eQYvcfbP+yg7o74DvVjR4DOLLQvDwWD4t5NzolqCxSGOjNf4uOvIjD7
 xYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932954; x=1691537754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7iCNWvd7mdJx34DAX7Wae2aC5uwBwu5nJTt0y8KbTx8=;
 b=JPE73+/jTzWzWzDiVLdqsFUwBMz8lAVMo1T6IXyfgfV+NEQn5DrdMTA4hFFtO1tBBE
 xjoWmMTceSJOkZiWQB2r8iYjrVo8/okQ6u16XbSSKQ+ITRjqDfv0O3gkNIbR223k35eq
 P7BFjq52apzqUXhl9AhsctVXImfzWo86UuGI1fbCQStqI9/K2FaXupPcTsHse25cO3LY
 O3RjKQauDbObRWYPNfiTyWjkPLlJq1EIvQ9+pZl5Q8YSQkU5VtDl5TQ3TKvZD8Q9RViW
 6O6ufc0cEny404YcRiA2eKBc8u1jMBBGuDT4HiYl5IJbE1bMZXLfFVmwhajRYzbAQXoR
 f1mw==
X-Gm-Message-State: ABy/qLZQJHO9UjTLloowEaGX4AQ8lyULMl78FmeijFNPbZYH7kzRiZYD
 GOmGWd9jLlvJCsTYteIERMc=
X-Google-Smtp-Source: APBJJlHqhtYgS6dRQygk8fBjeI5DUfuNvz9P6ibFHfWkc+R2QpnHb+6E9yO8BmI4l4uYGV5feQCmXw==
X-Received: by 2002:a05:6e02:13cf:b0:348:7d72:48cf with SMTP id
 v15-20020a056e0213cf00b003487d7248cfmr12372723ilj.17.1690932953960; 
 Tue, 01 Aug 2023 16:35:53 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 22/22] checkpatch: reword long-line warn about commit-msg
Date: Tue,  1 Aug 2023 17:35:13 -0600
Message-ID: <20230801233515.166971-28-jim.cromie@gmail.com>
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


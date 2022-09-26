Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AAB5EACB7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 18:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970DA10E106;
	Mon, 26 Sep 2022 16:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1142810E106
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 16:38:23 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id
 126-20020a630284000000b0043942ef3ac7so4316657pgc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 09:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=aBQtcstDZQqLeHVlIM75vGyKaWR65kO7/EjVsPGFbYA=;
 b=EuXMliuCVgEb1UTMiKFb+ESdp6V3BzRKc+b7utuqQIOPOHNcwiAsdfKXv0CByTTMHO
 A/cmtXWFZtS8qARFtlVgSMUoZBimXHF1wz4CNwGtGvIz2LwpajwPSKklhsP+tlMtwmql
 maFFjcq1BNEqNzfcLBbn2QBILgjsUBkIRZDrEbP/Ee6rqtFXy5pVqdEqCVQYSaqQ/KxT
 QmrCgi9T2QAhE8Au227HDc7b87Lxp9Qyw4xLEnUVSufrfkujevJSc2cuw0Zin34Kx5iF
 dXhGmPgrci5SDslFl/iRJhPu5X5tnWB/YP+N83p2LX/+U7MLLaGbj62ZK1Etpu7gbWji
 lPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=aBQtcstDZQqLeHVlIM75vGyKaWR65kO7/EjVsPGFbYA=;
 b=fHoGW0ptL9lFDMDvP8Of6ypqZ//09EhvYQv/TPQ8hge29WBjLITwE+k2RJGM8MujsM
 Q7+HqezP+T5bky1wUCwiQxcqnmKdTtubu8aji/rcTY9yE3Md0ovZOhZ1NQ6U8mS1gEA3
 OMYxotMg01zwuqG56Y8qIt5IrHo/14bJpO2/3G+o/iAFZMSXhBYcGHuVEMr4qoBfhv1s
 fonJLFWN0hRb5DjT8ChJ1MTGr+xasfLyOCzoGVI19UtxnRdMcmdWXX09vQIFB79Iz2ju
 MQJ5TTEngsNAI1KbR10ir14opCBiF1aEbyjFxwILCHJ5cbHaXiibEqHSh4btXNw9IYuF
 sSDA==
X-Gm-Message-State: ACrzQf1Uk+xa+MTaAwn5x05mk2s1BppYeQCaX6wFAboQq+oCTUopDdaA
 2QbiCj+OhZlrzsyBQIiZCaT0AKQB78s=
X-Google-Smtp-Source: AMsMyM7311CIPZJFPTAvVFfQHxqDeZdSosVfC0bK8XteC7QK27a6RZCjRZFQy2YWBurbmRyr0JE2qBn9lDea
X-Received: from jstultz-noogler2.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:600])
 (user=jstultz job=sendgmr) by 2002:a17:90a:cd06:b0:203:ae0e:6a21 with SMTP id
 d6-20020a17090acd0600b00203ae0e6a21mr900179pju.0.1664210302025; Mon, 26 Sep
 2022 09:38:22 -0700 (PDT)
Date: Mon, 26 Sep 2022 16:38:15 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Message-ID: <20220926163815.332144-1-jstultz@google.com>
Subject: [PATCH] MAINTAINERS: Add Sumit Semwal and Yongqin Liu as reviwers for
 kirin DRM driver
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 John Stultz <jstultz@google.com>, Yongqin Liu <yongqin.liu@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>, kernel-team@android.com,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I no longer have access to the HiKey boards, so while I'm happy to
review code, I wanted to add Sumit and Yongqin to the reviewers list
so they would get CC'ed on future changes and would be able to have
a chance to validate and provide Tested-by: tags

Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao  <tiantao6@hisilicon.com>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: kernel-team@android.com
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <jstultz@google.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f5ca4aefd184..11027cf9b670 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6875,9 +6875,11 @@ F:	drivers/gpu/drm/gma500/
 DRM DRIVERS FOR HISILICON
 M:	Xinliang Liu <xinliang.liu@linaro.org>
 M:	Tian Tao  <tiantao6@hisilicon.com>
-R:	John Stultz <jstultz@google.com>
 R:	Xinwei Kong <kong.kongxinwei@hisilicon.com>
 R:	Chen Feng <puck.chen@hisilicon.com>
+R:	Sumit Semwal <sumit.semwal@linaro.org>
+R:	Yongqin Liu <yongqin.liu@linaro.org>
+R:	John Stultz <jstultz@google.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.37.3.998.g577e59143f-goog


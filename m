Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB0D1FA996
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 09:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C246E7E5;
	Tue, 16 Jun 2020 07:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1843E6E2E9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 12:11:56 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id 35so1403533ple.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 05:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jmNwY1vIJ7/djpVmsAk2hr/MwPcap1XkQT7uL/1tT8E=;
 b=HuqE19COYpuNHIT3UuvzszzPtqj4W0LsknbEekTvPgJlMPNIZj1fNd7zfyWtZqXij2
 CviajApjQz0WEM274stGdYidx4ME6ESiI9td5CCzkZLn6CsbeucVBJiKqv1cqzf3KjRW
 W0u2VD0JLhSAZoi2JAQ8WIvyw58nbrARQ8ocWStC2QZNOqbWFq4Gwy5we3ldARe0MfYT
 Z4enFVTXme6cj5Xb7n6vHSD5kMdVx0mzRbAhiO2BDi16JWREF/WAd24XYa5tC1jhfZbb
 gIjL88D6VjUK9hdKvbmRCao6+4FcmN7UV3ZlHXF9vMCQleeye4WI4ObmYssNLeqIMCpn
 r7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jmNwY1vIJ7/djpVmsAk2hr/MwPcap1XkQT7uL/1tT8E=;
 b=uOQUMUtAzDHfBni/HSDJZgkbjHpqkFaPUK2VHoxwfZWK/OiY54nO9xy9r+YVp/MFN8
 oySIKc7yb9RaFpnD85pGVbpr04NwpHdVYSvAiSq3YUoWUdwOzSFLkeRyfd0CPEVwxput
 AxOirHBLI34bDH01mSGY4cBAiT8n8VFKVTpntNuAs6maUMbRckrACkT1q3aYc9kYNc/w
 lFES7DSyAIHMKOa+3jiWDgJgMMXXHb3XBtOaenqoLoVlPEB5RsNpngY02j1UB5MlVonq
 6hjKbwheCCj6kcseSZCJWy79F2pU9/E3r2+oGxka5VKb7LgEhPcC6lF04SMoyBi6tGMO
 6KQA==
X-Gm-Message-State: AOAM531q4dvg6ix6uwIddCRMyfbLZDUh9Sw0/E8Z4TBF4thK+rhK1I0a
 vgb/aSa+567f8pxIabOEKWc=
X-Google-Smtp-Source: ABdhPJxGY2bfusF5uLULG7HQhQQNx6pScSfHbK6VJCc8lradSg9bAHRHfa7bUhuLBCUZG6LzyV+d5Q==
X-Received: by 2002:a17:90b:4c44:: with SMTP id
 np4mr10968050pjb.63.1592223115715; 
 Mon, 15 Jun 2020 05:11:55 -0700 (PDT)
Received: from masabert (i118-21-156-233.s30.a048.ap.plala.or.jp.
 [118.21.156.233])
 by smtp.gmail.com with ESMTPSA id q186sm13905972pfc.166.2020.06.15.05.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 05:11:55 -0700 (PDT)
Received: by masabert (Postfix, from userid 1000)
 id AE02D23603D8; Mon, 15 Jun 2020 21:11:53 +0900 (JST)
From: Masanari Iida <standby24x7@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, chris@chris-wilson.co.uk
Subject: [PATCH] drm/kselftest: fix spellint typo in test-drm_mm.c
Date: Mon, 15 Jun 2020 21:11:51 +0900
Message-Id: <20200615121151.1557985-1-standby24x7@gmail.com>
X-Mailer: git-send-email 2.27.0.83.g0313f36c6ebe
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Jun 2020 07:09:12 +0000
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
Cc: Masanari Iida <standby24x7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fix a spelling typo in test-drm_mm.c

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 drivers/gpu/drm/selftests/test-drm_mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
index 9aabe82dcd3a..31602134c515 100644
--- a/drivers/gpu/drm/selftests/test-drm_mm.c
+++ b/drivers/gpu/drm/selftests/test-drm_mm.c
@@ -2359,7 +2359,7 @@ static int __init test_drm_mm_init(void)
 	while (!random_seed)
 		random_seed = get_random_int();
 
-	pr_info("Testing DRM range manger (struct drm_mm), with random_seed=0x%x max_iterations=%u max_prime=%u\n",
+	pr_info("Testing DRM range manager (struct drm_mm), with random_seed=0x%x max_iterations=%u max_prime=%u\n",
 		random_seed, max_iterations, max_prime);
 	err = run_selftests(selftests, ARRAY_SIZE(selftests), NULL);
 
-- 
2.27.0.83.g0313f36c6ebe

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

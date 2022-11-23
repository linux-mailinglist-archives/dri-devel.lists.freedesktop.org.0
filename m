Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37223636A72
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 21:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE5610E23E;
	Wed, 23 Nov 2022 20:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1D410E240
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 20:03:12 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-36fc0644f51so178832377b3.17
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 12:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hIREoJf8N7Qc+VI7fjvFzFHUarKpVpMkIN35nq6OkBQ=;
 b=l1mxEbyxVuvgCMgyIuQZpfdpVrq4rsAJi1MvOzrIyNXqKnZd4Cx9qvZB//AScFMrEN
 qWwA9y4HbubWiFfhM3Xk9sU27zw1Q3wvw7BUIkIi5XHuc9KCpzp4jRY/r0+NQ2RwrMkX
 hWYNctdtH34/WkllwXFLqkty/1xRyZZJowBDeOitxO2DagCFfwGAGHQ7Axn9vvBoQDPL
 Srndn6yYz5xf88boenep/sbvzG5tkF6pKkg4x46jny08ohyb6DlPljEtHXhsGXhyL0+d
 hque1ArFzfYw9fX7WFNosN0JwHiMcfkzrG7q8UrIy246uRwo+JFiR7yw9OalVnXLMQ87
 9wqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hIREoJf8N7Qc+VI7fjvFzFHUarKpVpMkIN35nq6OkBQ=;
 b=ksV9T4kWWqMbNyvzB/yuuYhjDfN7Q3B2vNfxv2JhzEr+nNLwl3Tx4Wt0q0xR8WMCg5
 O02O2mQXtWAtyGgOEv4e8Gs/BJ0FHd7HTZgQsHnbKwmOcWbXvUpCyBA/+c/atGzywi5b
 n0rc+1SLHTZ+bfB6ltfz3eOTmi4q7YMT4gPlhj7mT4w7ZT3HBrM97m06bwy8pKqOTiYf
 wfMCDQXLZqwCr+oBKPLTYwyK22MsFrPdKf+0LAuEpEDrWpEDkkLxCPSmnAcuWbMDrYSv
 DVUT/KNtihCq3dPArj9dxuMxJ/NB4Pj7MWlWWewhcug/5PBbJ+wV/2c6gc249nn0izH6
 qT9w==
X-Gm-Message-State: ANoB5pmy9ng1muxqK6eKQ9TEb52OIkifXeefUEZqWZzPM9F+IGeqOqTv
 Uy6w6RtbZOjwqKcZS66+WfpGYR2PnQ0=
X-Google-Smtp-Source: AA0mqf5MO01AjcVUz5B2xUKnE+P+u7xDM/v7K4PW+5p9xOAl/tBWIExyOJDPWYMpp477NUnPNz5J+0fQIOf+
X-Received: from jstultz-noogler2.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:600])
 (user=jstultz job=sendgmr) by 2002:a81:5805:0:b0:3a5:aebd:2bed with SMTP id
 m5-20020a815805000000b003a5aebd2bedmr8ywb.174.1669233791751; Wed, 23 Nov 2022
 12:03:11 -0800 (PST)
Date: Wed, 23 Nov 2022 20:03:08 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221123200308.400566-1-jstultz@google.com>
Subject: [RESEND][PATCH] MAINTAINERS: Add Sumit Semwal and Yongqin Liu as
 reviwers for kirin DRM driver
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
index 2585e7edc335..9f26e6b74ef4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6919,9 +6919,11 @@ F:	drivers/gpu/drm/gma500/
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
2.38.1.584.g0f3c55d4c2-goog


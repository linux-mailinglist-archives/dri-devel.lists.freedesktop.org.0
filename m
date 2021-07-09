Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD823C208C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 10:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607E16E9E0;
	Fri,  9 Jul 2021 08:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF79B6E9E1
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 08:11:22 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q17so10970154wrv.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZCO5959kVrJtaae3fTrEb7+OZEh/FfOKLUp3bINIoX0=;
 b=WsKxjjkKQ6J4kemfcVyreWB36kmaRu43Gv/0zwDa26X1HOMjuxm0qLaxq1QXqfEOV5
 LPNNOu/8aWoXKrsJaB7Wpi0gKO6T3vwpuqTmulMmOgc4VzbNpMXqzBVtpnislEMYs+q/
 wq+at/pjJIyX+la/RphO4g2zKuGddjhSJepcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZCO5959kVrJtaae3fTrEb7+OZEh/FfOKLUp3bINIoX0=;
 b=Q0w1KuicicpcgClT4aF0y0NUDUCthfXZ+XowEEQKT/s7IsT3eDWtLaxTkOWd4B0FWM
 NSUMZ0GewFHM54KrDV5weN9LaNLYrUE+HoALgTIlmzI+IABLBW2tT8TqMCRifqclNPt/
 1mbtMyGysaRDUX/R52q+WKQu7ovc1+uy1bhPb51fOea1o3IflVkPW5inBQIDWa2fB7BQ
 mjMyDP20BMZga5crPc9HssROHXRPASqH4yqfyLr0+dJTZGk6Woq4LZeTFNdjzDEnI7Af
 lBkS2TlIDy6fIePA1mGUxgrP0TtBlyaYE/mKjXBvUflG8HeS4f7+ul0SMqm68XLyItj3
 DfbQ==
X-Gm-Message-State: AOAM530o5l9JKu1nhq66bD77SqhECEdSgLI19sWA+JdURqGe04Ffjiek
 4bG1Zd+lr9FdsaxSJ6fLLbZMMrhNlrX0Cw==
X-Google-Smtp-Source: ABdhPJwL/wmXGB5MatbuFH+4mHrLczIo7XAtt+rjIItVZUaitCfvVidF35WH9BSqTEn5LiS3tP/Rmg==
X-Received: by 2002:a5d:5103:: with SMTP id s3mr18324922wrt.180.1625818281647; 
 Fri, 09 Jul 2021 01:11:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v15sm11754511wmj.39.2021.07.09.01.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 01:11:21 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] dim/drm-misc: Add rule to not push patches with issues
Date: Fri,  9 Jul 2021 10:11:16 +0200
Message-Id: <20210709081116.4170288-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We kinda left this out, and I like the wording from the drm-intel
side, so add that. Motivated by a discussion with Christian.

Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 committer-drm-misc.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/committer-drm-misc.rst b/committer-drm-misc.rst
index 9497a5d26a9d..110ca8b0525e 100644
--- a/committer-drm-misc.rst
+++ b/committer-drm-misc.rst
@@ -21,6 +21,9 @@ Merge Criteria
 
 Right now the only hard merge criteria are:
 
+* There must not be open issues or unresolved or conflicting feedback from
+  anyone. Clear them up first. Defer to maintainers as needed.
+
 * Patch is properly reviewed or at least Ack, i.e. don't just push your own
   stuff directly. This rule holds even more for bugfix patches - it would be
   embarrassing if the bugfix contains a small gotcha that review would have
-- 
2.32.0


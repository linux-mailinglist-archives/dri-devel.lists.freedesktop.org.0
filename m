Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 238623FFFC1
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 14:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71D26E888;
	Fri,  3 Sep 2021 12:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669806E888
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 12:31:38 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u9so7994046wrg.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=o3lIvk6NIuWXMfTlmoadGYze9kaAW2h7gefWjYO1hnU=;
 b=d153tfAhiInNtpwhgPA46R4MqCNkgl2v9bneCxG0/a5FoS1wTvjKYowTUTHgbKa0DR
 SNenHh+P6t+7WpKjsaiSRp2rrcq5dleKTr9SZf3+y/m2tOAMRLV54pObq976zxoKfbB9
 AQVDEWjbzqnCqkMT30iPHBgiI01NgaZ1zic9rYZkNzBtHQpo442N+9OwnVZa8vJRTNWS
 hDNWtdgqkVuVkjZDdItmobipwvHXK53yxTEC2hCStx8bByfzfy9FW2K+8BKDecwKB461
 owspLfKhub9lQToYILRUL2nYR4Sh8IV7elk0lR2fzor0ZZGelDh2O9FzeVSXMzLDohL+
 nV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o3lIvk6NIuWXMfTlmoadGYze9kaAW2h7gefWjYO1hnU=;
 b=I+ZP2cA0UtJJhTWpmbnZh6lh7/0rFTDL6+pllKjEqp9En4YQtoxHVwzrP0Xp/sRbl6
 c0Qvs1wsTwdTDLTWafhaaBBo+sqaevjB8hEv5UjxGcQwqNiZpkO7iPYhoj/iKb/50ubF
 Clfr/RvwHP1hEwkM5gUcLIEKKnbmS8lf0d59gaTtqXOsspoAIlHAg83CUhcIkaQRKZ4R
 x8gaULaJgl9usKN3rHLnKQ8y+qoLHPlcOWq+NPAaWt+C/KCBy0HF3DFLNMIFRBwASjjH
 y+E2YwiUk6xMKRvPsGp8l3iw9Oa1l7d3c+UgCTnRXPuDUIs0BkQrwqxfugJdlO4MTAZs
 dAzA==
X-Gm-Message-State: AOAM533HmN+Ee0T+0v60QVeSIND+69lKgNlpUuahTuxKfse9DQpLMU0D
 ggAEHdfOQwZ3Y0AMUx3u41ltMnEw690ACimI
X-Google-Smtp-Source: ABdhPJw8lhLg+6UcYmS8fsmfSEybHYAFW5yeX+rJCNvROjikx9MoGpvMN+XgIeZyIfOgvPCxWqz+ow==
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr3801389wrx.293.1630672297056; 
 Fri, 03 Sep 2021 05:31:37 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 x11sm4564873wro.83.2021.09.03.05.31.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 05:31:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/ttm: enable TTM placement kerneldoc
Date: Fri,  3 Sep 2021 14:31:22 +0200
Message-Id: <20210903123123.116575-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903123123.116575-1-christian.koenig@amd.com>
References: <20210903123123.116575-1-christian.koenig@amd.com>
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

Fix the last remaining warning and finally enable this.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/drm-mm.rst    | 6 ++++++
 include/drm/ttm/ttm_placement.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 094e367130db..195a857fa1d8 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -39,6 +39,12 @@ TTM device object reference
 .. kernel-doc:: drivers/gpu/drm/ttm/ttm_device.c
    :export:
 
+TTM resource placement reference
+--------------------------------
+
+.. kernel-doc:: include/drm/ttm/ttm_placement.h
+   :internal:
+
 TTM resource object reference
 -----------------------------
 
diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index 8995c9e4ec1b..76d1b9119a2b 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -58,6 +58,7 @@
  *
  * @fpfn:	first valid page frame number to put the object
  * @lpfn:	last valid page frame number to put the object
+ * @mem_type:	One of TTM_PL_* where the resource should be allocated from.
  * @flags:	memory domain and caching flags for the object
  *
  * Structure indicating a possible place to put an object.
-- 
2.25.1


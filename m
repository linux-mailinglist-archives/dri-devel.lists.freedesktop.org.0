Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A27733463A5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F4E6EB9B;
	Tue, 23 Mar 2021 15:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448696EC02
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:54:25 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id u9so27928472ejj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ttCD6uCX5tFeOHJNIPofy4nwJsMNY2bP8hvgcMSOHFU=;
 b=Teog51hXf+U5LdhrN1Q17doEvCKL84mSY7vWRBetExH5CXL+TG0Z2l/cKWD8lBZh5m
 y/Z9WYcKeW+pMDBc0UR5uduNY7e7RdcDRV9/40hq7DHVZXHeGMMQuaVVxuUK+HfEjt/p
 qOipRFboiB4Yq69jLCaTeN4uGLt98hxz2gtPETXydBz7jePyWzBNJs4y3FP/EMQXPUXZ
 zf/OkAVlVK/2QTxnAwswtMpfYf4eNGiKBjl0LREXafjOVOPrGWJVQxl4eovl2U9OWNeS
 CxRBAYafhW53CnsOP2NJLl2UYeNs8WRxNFU6UYncPdE8srfBCvsfljmpUqSQ1ZhAiG23
 GiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ttCD6uCX5tFeOHJNIPofy4nwJsMNY2bP8hvgcMSOHFU=;
 b=JrdmNfirKr/Kc3mp3Qg5wo/lpfvkNW2R0Z/RrzSAeD+PQjfgpAkkvCeggWKz9d48bO
 xk+kjhvsIxCFKM36PUHaVRvJmjEwGr9MhKOC15j/m9arOBZ/0vT8BzSFIojELPkPbP5J
 OWo19y6ZpZ6g9g85/r7jTe2IxW2kX7XCCxibtWpRBIBMLREgHmwFtB+DLhXfDYk3JFHX
 QevgAiwtfbqRv8zduxNSnWRBaQ+B31UCYF97EKjjdPfVkalxeYtJllrjP9b79HltBKHe
 ysT3LapmZZxFNx8JV8y8ZVHVnbh4VOhE6WY8z1i1xMZLYDFUBnHuogxAbIkOATah3wj1
 wWRQ==
X-Gm-Message-State: AOAM5304X3HAx4srIdoctxZiC90E8BTdT6zRRUGNkx0DiRvxh6S+tOnp
 R8HUYqpd3M9vjATGTEWR59o=
X-Google-Smtp-Source: ABdhPJxEkR+OjzJB2FpCESzwpXM5NSRSJPKHgeSFb5twIZw/J5vwiPJQQLzHJZTeEJNL6mWGDWLsOw==
X-Received: by 2002:a17:906:a1c8:: with SMTP id
 bx8mr5406071ejb.381.1616514863951; 
 Tue, 23 Mar 2021 08:54:23 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id g7sm6973977ejw.51.2021.03.23.08.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:54:22 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/9] drm/fourcc: Add macro to check for the modifier vendor
Date: Tue, 23 Mar 2021 16:54:29 +0100
Message-Id: <20210323155437.513497-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

This is useful for checking at runtime whether a given modifier is from
a specific vendor so that any vendor-specific parsing can be done.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/uapi/drm/drm_fourcc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index f76de49c768f..567fd4566e08 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -366,6 +366,9 @@ extern "C" {
 
 #define DRM_FORMAT_RESERVED	      ((1ULL << 56) - 1)
 
+#define fourcc_mod_is_vendor(modifier, vendor) \
+	((((modifier) >> 56) & 0xff) == DRM_FORMAT_MOD_VENDOR_## vendor)
+
 #define fourcc_mod_code(vendor, val) \
 	((((__u64)DRM_FORMAT_MOD_VENDOR_## vendor) << 56) | ((val) & 0x00ffffffffffffffULL))
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

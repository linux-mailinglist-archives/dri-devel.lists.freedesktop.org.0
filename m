Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7432F83B2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86ADD6E4F9;
	Fri, 15 Jan 2021 18:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A94B6E4EA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id y187so8415692wmd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J0MKcaQJg4qBHpqlKLqhoArao/P8hSXgM/s3rj7VTt0=;
 b=J172cC3Uyma0VckyFc9AxWG25drY1eDR3/CO7zKGtLnvPXc3QRyYBEZTk3wr/Oojdt
 MkXBZReGLj4d5du5UEuPAIX7iFhOX6Vp/xqc5CaimCjZSRf3tu+X2lx0zRUVU0sd/VqE
 J7k689wvnQ9GOfnh2QIXAOotKN4qzk9cE78Zs+gHvwX6sealI/MJlNafXOsJUNEO6q6q
 joQ57rLYh0mr85db9y/WWYUIMrefeocZ7Rixa1rmjqqOxJ2UUyHLrmCeBsDOkMWRXBJb
 MdaAdsRDDvgLImIUSWBGUW54fPXMROaN4hPMMy8GnqvniwL3os7PGOxpxKELQxSNQv4O
 jXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J0MKcaQJg4qBHpqlKLqhoArao/P8hSXgM/s3rj7VTt0=;
 b=gQd2A3tgb+aHJWFdN+AdqRGn+Q61ouoc/yAnKD2QGBlnYWOsXPWKBqa2ZMMF6bFArV
 GG6KAhjSdu8F7Y8k3jvaoEwJcqFHovXd+yuerLvWi1rpWqg30svjGXViS6kTOXjhNyFq
 yGv/L8wTNBWjnBd23IMtefk+ndtHe8gpfnOew0dR5vvIwkGP+MsMbnPSO0AHJiyYV9Aa
 sjmyE4tXGuoMHvMec2CXLdlgWW991ibosOJjKupKMa/XkYeVi4CWmfKy7utZ2OQLT6dl
 mIdRPRLSON3ayxGyYuCHAqTdnGiI7d9Rwib57an9d39siC7McBd9bLJAYmuuaW6zEApx
 4+Kw==
X-Gm-Message-State: AOAM532dQI0BRT2yxopXRCu1MPgV6BTq+bCKbOPhko4C8Sg6RtMftLt6
 kKGlDpnlY/P91rTabZJuoHUt5g==
X-Google-Smtp-Source: ABdhPJypKKRUbRWYCHxMnXoeZXHc/KsmeR5j7hQzz6Ji0P/sOn9WdxZugDa5oe2vQNPvr7o3cVICrg==
X-Received: by 2002:a05:600c:4417:: with SMTP id
 u23mr10051589wmn.100.1610734599295; 
 Fri, 15 Jan 2021 10:16:39 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:38 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/29] drm/i915/gvt/handlers: Remove kernel-doc formatting
 from non-kernel-doc header
Date: Fri, 15 Jan 2021 18:15:56 +0000
Message-Id: <20210115181601.3432599-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Eddie Dong <eddie.dong@intel.com>,
 linux-kernel@vger.kernel.org, Tina Zhang <tina.zhang@intel.com>,
 Min He <min.he@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ping Gao <ping.a.gao@intel.com>, Niu Bing <bing.niu@intel.com>,
 Pei Zhang <pei.zhang@intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Zhiyuan Lv <zhiyuan.lv@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/i915/gvt/handlers.c:1666: warning: Function parameter or member 'vgpu' not described in 'bxt_ppat_low_write'
 drivers/gpu/drm/i915/gvt/handlers.c:1666: warning: Function parameter or member 'offset' not described in 'bxt_ppat_low_write'
 drivers/gpu/drm/i915/gvt/handlers.c:1666: warning: Function parameter or member 'p_data' not described in 'bxt_ppat_low_write'
 drivers/gpu/drm/i915/gvt/handlers.c:1666: warning: Function parameter or member 'bytes' not described in 'bxt_ppat_low_write'

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Eddie Dong <eddie.dong@intel.com>
Cc: Zhiyuan Lv <zhiyuan.lv@intel.com>
Cc: Min He <min.he@intel.com>
Cc: Tina Zhang <tina.zhang@intel.com>
Cc: Pei Zhang <pei.zhang@intel.com>
Cc: Niu Bing <bing.niu@intel.com>
Cc: Ping Gao <ping.a.gao@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index eaba80975f42a..0d124ced5f940 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1651,7 +1651,7 @@ static int edp_psr_imr_iir_write(struct intel_vgpu *vgpu,
 	return 0;
 }
 
-/**
+/*
  * FixMe:
  * If guest fills non-priv batch buffer on ApolloLake/Broxton as Mesa i965 did:
  * 717e7539124d (i965: Use a WC map and memcpy for the batch instead of pwrite.)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

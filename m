Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0D9552BD5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2488510FC75;
	Tue, 21 Jun 2022 07:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8CF10F717;
 Mon, 20 Jun 2022 12:00:04 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id bo5so10028179pfb.4;
 Mon, 20 Jun 2022 05:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nWm1HuDYDniRiWG4QbCIzu8XBm9RdL4rAmU7DmwMgag=;
 b=TnIQURtTcrz69rPQXxoFw4lPoL3YiTafG5VwGyzk+3OCP83UrfYIXmTwN7UxNx95i6
 QySrwShr8gukdDKU4OlOmFyGwmdSHjOHwX7e0mIe11cWlpBVO+ER99SQtBLEOrMVncZV
 jhsmEH3K9UQetdyyI1m7Ba9uN+dSo0QryEfenw/Vc2BmFt1OeMNcOIXd9Hh/oxs/Z8/t
 D9UldAxzoDHts1avlU8ogeIZHMTSNqvD+2lGHA/lSaby28kr6uvBTfaw7zg6jzSnBXvl
 IkXbxW9rImeluyyzPWltydnA+FvIvJQf/2HIwDqNDXCaqcQmXEczVs442/Na328Kljcm
 X7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nWm1HuDYDniRiWG4QbCIzu8XBm9RdL4rAmU7DmwMgag=;
 b=h3XwKj5GlUAonz4Qa0h5D+6P5k0Q7Q53GhAphpcYRn/x3gEYsK353qGF12U3dBZjrP
 SJNXPNzHvYB+Z5BdF3gKntv34FLL1miZDaKGSEu2NHNZSDdI7LZzhed4dWd/khr8QVI0
 u8W5O56+CYwHZbg5FJKX/kxPFS4LhuFf11l3uav+CbigsB3jZWSQZne4DU1NR9d7glMg
 pruFeAmOU1WvBe2Vk3IBiAh4ytHtRHKkLPwIb4KEw0vh9kHsEV21WgtWreN4Irr5yQWv
 7tfB428clmb2A55XclSMfjHVQhS6vLjcjDCpZG+PGzIvguscDsmKb6Gg7Xr2kspINtDn
 ANqA==
X-Gm-Message-State: AJIora+90EXAXUWE9vz/3jOGVc27rzL9gSvwJL5ejnfr2ztnzTTYAWiN
 gFEadWZ31IVX4BEPvTvPxiZW5d1S+aMpkBex
X-Google-Smtp-Source: AGRyM1sZxtJChIafkQ//v0PvExkGTbn6NttZ0yNG8QxVW/Qp2Qb6OeR0R5t3Dvq5fb2otXRJhSTbZA==
X-Received: by 2002:aa7:814b:0:b0:525:1ada:329b with SMTP id
 d11-20020aa7814b000000b005251ada329bmr8360890pfn.34.1655726403372; 
 Mon, 20 Jun 2022 05:00:03 -0700 (PDT)
Received: from localhost.localdomain ([43.132.141.8])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a62c71a000000b0051bbd79fc9csm8853516pfg.57.2022.06.20.05.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 05:00:03 -0700 (PDT)
From: zys.zljxml@gmail.com
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v2] drm/i915/gem: add missing else
Date: Mon, 20 Jun 2022 19:59:53 +0800
Message-Id: <20220620115953.1875309-1-zys.zljxml@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 21 Jun 2022 07:24:08 +0000
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
Cc: bob.beckett@collabora.com, thomas.hellstrom@linux.intel.com,
 katrinzhou <katrinzhou@tencent.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 linux-kernel@vger.kernel.org, matthew.auld@intel.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: katrinzhou <katrinzhou@tencent.com>

Add missing else in set_proto_ctx_param() to fix coverity issue.

Addresses-Coverity: ("Unused value")
Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: katrinzhou <katrinzhou@tencent.com>
---
Update from v1:
Fixed the code logic as suggested by Tvrtko Ursulin.

 drivers/gpu/drm/i915/gem/i915_gem_context.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ab4c5ab28e4d..1099a383e55a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -933,7 +933,8 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
 	case I915_CONTEXT_PARAM_PERSISTENCE:
 		if (args->size)
 			ret = -EINVAL;
-		ret = proto_context_set_persistence(fpriv->dev_priv, pc,
+		else
+			ret = proto_context_set_persistence(fpriv->dev_priv, pc,
 						    args->value);
 		break;
 
-- 
2.27.0


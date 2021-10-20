Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4BF43510E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 19:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C017B6E329;
	Wed, 20 Oct 2021 17:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692AA6E329
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 17:14:38 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id v20so16600951plo.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 10:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YUffwqw7TyZ+nq+dSJh/YbaKQTy1hvlfSgjnuROyIOY=;
 b=jvessDKfgDNvIBa1Ww83XnWrWtkrnjrB7f47r8pXZ4iW8WkNc3ls20EuXb7qZSPrwv
 UcUgsWfy9GZygh3dBhyQxMskFvVOoECdLkZe1kYzrCJhTFsyBxe43pOFvtiRMCVSc6UO
 VMCjuKE/EPYcOsmj8kSQAFHhVl8SodYXSBfQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YUffwqw7TyZ+nq+dSJh/YbaKQTy1hvlfSgjnuROyIOY=;
 b=t/z1G6kJOWCpMY53uDMfHWwLBUdVP5X6I8SJlstIGB4vyekFw8w+osVrjNOsG72pmk
 WZFC5MR9E2DpBb7m9dpBOrZpQo518ZogcW4VFIWaIipo8rDFmxmGuiucCn+VuxCbIXEd
 IsEmW9cA4wTZ7ETeGJ8/qXeD2S53AR8QGpt+Da2JsthE8VRQ1EAok+dCGjRioRyD6rDV
 2sYujDxGqhRjAxLeKVaLTtFb3WKex9QiR0HAIcyqtIhqnyE2MSBFeuyiLLPrkgtECpPp
 fgu/7QPNIaN4QN33FKmfHXqOhOas3JlKew+OGtdZyGJuKHRhY90+aHL8uOFya6vz1RFL
 IAAQ==
X-Gm-Message-State: AOAM533JlKSIcgdyv1dpKPMzAR+S181FgfNYIx3SZKXBoVEoNV0oFdBK
 1hvrx+4OUKnidWKALpwRjAX7Jg==
X-Google-Smtp-Source: ABdhPJz6Lb8i9XfQ+ZaOzqCSrJ4aau7V9H411Ar5EcXAieXZwYegz99ehafx9jKjUjO/l7dfc48jeA==
X-Received: by 2002:a17:90b:3a88:: with SMTP id
 om8mr153373pjb.164.1634750077917; 
 Wed, 20 Oct 2021 10:14:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:ee8c:e73a:3f5e:717a])
 by smtp.gmail.com with UTF8SMTPSA id u16sm3378795pfi.73.2021.10.20.10.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 10:14:37 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Brian Norris <briannorris@chromium.org>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v2] MAINTAINERS: Fixup drm-misc website link
Date: Wed, 20 Oct 2021 10:14:18 -0700
Message-Id: <20211020101233.v2.1.I96669f75475cbb0ae1749940217876aa8991b703@changeid>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
gives HTTP 404, and
https://01.org/linuxgraphics/gfx-docs/maintainer-tools/ redirects to
freedesktop.org now.

Let's save people the pain of figuring that out.

Signed-off-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
---

Changes in v2:
 - Correct the patch description text

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 100d7f93a15b..811d8d3e35fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6158,7 +6158,7 @@ M:	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
 M:	Maxime Ripard <mripard@kernel.org>
 M:	Thomas Zimmermann <tzimmermann@suse.de>
 S:	Maintained
-W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
+W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/gpu/
 F:	drivers/gpu/drm/*
-- 
2.33.0.1079.g6e70778dc9-goog


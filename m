Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3599502F65
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 21:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA57610E356;
	Fri, 15 Apr 2022 19:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3104F10E363;
 Fri, 15 Apr 2022 19:52:17 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-d6ca46da48so8835501fac.12; 
 Fri, 15 Apr 2022 12:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h2cm2MOSanSaC5THCY+jxKX6TMWCJF7G2UyzKGGQSKs=;
 b=WwmwdajH7rmAtSPWosmaYAXStkl/64jZYAjbvfpvwCxMk65CoGzvyYWxG7JhR+fCVN
 S2/is+iseWMKw5HekCTf5vnymBsAOf0FYcaFcJ4A7qxMTY2uiibUEUmBjFbuit2O/0ZF
 acQ4LO4Yss6IP5GeBMOsawRZmdis0GPGDNjqmeVF57ztgoz9VQOW+xfXWyTX4PkHIldx
 ZeoZB/aXKe0L0AJY4gPu6B3mXSNa7kyTG6HWJXLkTzF6P0ceUyLNkMkq852esBL+VOI1
 jdSW0RkistXlp/RgRq0iJfopv3JnRZfyCio14v6B5ayXwc5YPudqxxKhLZngKfKkYE6P
 fqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h2cm2MOSanSaC5THCY+jxKX6TMWCJF7G2UyzKGGQSKs=;
 b=gMn/Th0aFLod3r4BAIX4ty9ldt5S39JBBXwZBE3yKYqCYzoXAiNQ4u2HBwvdkC4wki
 SF+g4ECPFMyelZEAIyy6MZitt6eH70VBD/2KhnWlYZHFnGyZg6hyJrE9bsFGrvgBnBB7
 8wj/wQojVGrvd7h9J9OShORzIPAM4C3djb1v5JrZwtVEuWTswmPKkd1p/ckPibgT9LpO
 81Pesr4AY/YaTuDxGKHNXo0V/kgZvihS9okYMwr1pu5mTWOlMVQzAp39BJwgRngvH0Fk
 0IYkL/bMLdzHjGQ3YU7oofU2Q6fFBIjKovV0U54RThtGqLcu1EqnnEl1vU4IdpFUW7oJ
 im8g==
X-Gm-Message-State: AOAM530Pxc3zevn/lkowqw8X+zNc5iaYWpBxlBPZGoSsnWqB1h8Ofnl/
 PCCvCKO6eC6pZOacQLHxQ78=
X-Google-Smtp-Source: ABdhPJxc8hCohn7Hi89V96Nkrg4BGBjU+19UhktljNUWu96rQH/UKyqwQtNGlYFgtKC/A1aqTpzTMA==
X-Received: by 2002:a05:6870:c6a3:b0:e5:9a53:28d2 with SMTP id
 cv35-20020a056870c6a300b000e59a5328d2mr1468998oab.96.1650052334944; 
 Fri, 15 Apr 2022 12:52:14 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4c2:8a9b:dcc3:45ee:2581:b4cb])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a4a2854000000b00329d3f076aasm1436532oof.24.2022.04.15.12.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 12:52:14 -0700 (PDT)
From: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrealmeid@riseup.net
Subject: [PATCH 2/2] MAINTAINERS: add docs entry to AMDGPU
Date: Fri, 15 Apr 2022 16:50:27 -0300
Message-Id: <20220415195027.305019-3-tales.aparecida@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415195027.305019-1-tales.aparecida@gmail.com>
References: <20220415195027.305019-1-tales.aparecida@gmail.com>
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
Cc: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To make sure maintainers of amdgpu drivers are aware of any changes
 in their documentation, add its entry to MAINTAINERS.

Signed-off-by: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d54b9f15ffce..b3594b2a09de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16449,6 +16449,7 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/agd5f/linux.git
 B:	https://gitlab.freedesktop.org/drm/amd/-/issues
 C:	irc://irc.oftc.net/radeon
+F:	Documentation/gpu/amdgpu/
 F:	drivers/gpu/drm/amd/
 F:	drivers/gpu/drm/radeon/
 F:	include/uapi/drm/amdgpu_drm.h
-- 
2.35.1


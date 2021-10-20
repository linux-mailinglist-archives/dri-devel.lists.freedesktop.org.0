Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0324342B2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 02:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08B46E0BC;
	Wed, 20 Oct 2021 00:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7B16E0BC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 00:59:52 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 ez7-20020a17090ae14700b001a132a1679bso1259711pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 17:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kWxdxCAUiPhUvCQhyuJY1pk4j1TQwQE9K4S2H/r2H2U=;
 b=ZqGH0mR3yJSZUiLY/y7VeWVbHN/hWa+mDC0PTE1z0qE1yrZ83KUdHfBpN3vq3qhfLW
 79KcuR1kDPxWTCNjvTPu5uZVjDIBlDQw8bkkxyLszgzS8wEU6FtVfxhvVQUWg0IDJ8iP
 usmiBYJAYq6u1x+FgvrZg8EAai9X/axyvUbg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kWxdxCAUiPhUvCQhyuJY1pk4j1TQwQE9K4S2H/r2H2U=;
 b=g3HCUR7gTk+sZocKB18vhoOSzlBRMnut4o2AzzKtzYJnDNlIjfGkd8apP0RHv+cJAE
 sJhXUV6JvSghA+J2qDgqsRFj90oqDs18SoaJ8+EIB4+FVG8E9PeAz96gsRCAueqUijGi
 GFYOGdHdwGyCEk+7IGfd7uwdIHNPaNgUCsvBijjOLoztPXgJkVwj52z8JjLUXWTWvrBq
 N6+3yOSq8VcKAkUTA5jdPk6C0DyUR6k04PUeneL1aZDPUXHbPAetPzLKjTQ5Gc54PjwB
 Hv8Lsst5YQOjj8uEP0XLycQIyo9GMG+4KbQhqPtkU5jxx57LCLiQULcNTwKmso0578PE
 NcZg==
X-Gm-Message-State: AOAM5308RbNDE7uePUBVzJxcverQrJAgTOZDW5jHjSR2iQzZ6A6VasQL
 DRC64+n/bC0huxPZ+dR1SPdQhQ==
X-Google-Smtp-Source: ABdhPJzPKUW9ZVR8VRSUVdIoRhlVp3TT0aqVAszkEOYphlAjTExxwlHs8w2BofIFRAqharqGFVZUCw==
X-Received: by 2002:a17:902:a40c:b029:12c:17cf:ab6f with SMTP id
 p12-20020a170902a40cb029012c17cfab6fmr36995830plq.71.1634691592496; 
 Tue, 19 Oct 2021 17:59:52 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:dcb1:f4c7:fe97:de13])
 by smtp.gmail.com with UTF8SMTPSA id b130sm419255pfb.9.2021.10.19.17.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 17:59:51 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Brian Norris <briannorris@chromium.org>
Subject: [PATCH] MAINTAINERS: Fixup drm-misc website link
Date: Tue, 19 Oct 2021 17:59:35 -0700
Message-Id: <20211019175932.1.I96669f75475cbb0ae1749940217876aa8991b703@changeid>
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

https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html gives
HTTP 404, and https://drm.pages.freedesktop.org/maintainer-tools/
redirects to freedesktop.org now.

Let's save people the pain of figuring that out.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

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


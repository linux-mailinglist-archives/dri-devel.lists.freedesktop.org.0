Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C59487BB7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 19:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2471610EB93;
	Fri,  7 Jan 2022 18:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF8A10EB93
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 18:02:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t28so5782646wrb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YAopufrfMZ51IGtrg3jTbLpMge5spZgYt27uOrZnXBA=;
 b=TraUtI5RVcXWtWTIjSiw3vhiP+xVKrVen0TTg3S6WOZZadQeV/I9gKp0ErVnV5X7NB
 udlB60AKz5HaagNq/WOQYUbNk5E1wvbXIYXRyK9+8mFwKFqRVy3KXioQEBkpxvm3vap1
 6lg+OnWERGHE+B96SI0B31iPMdFj+zCY5oGnGbmw0jXqssKsydD5rkAvv0IJWxLFuXTJ
 P44hgMKJu8zsnwjSeB7EbgXMWzcPjoZn9w6Aoib0tyZOtrCAQhjBHl3HhfxrEnAQGApZ
 0FFDY4fsn/p0J7m5D0gONllJjyzeYKQ3qBZXVERzjbrxL8/hRuyQm7+wgKe0DSVwuyCl
 XHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YAopufrfMZ51IGtrg3jTbLpMge5spZgYt27uOrZnXBA=;
 b=jsQozBsw32e1xEx6DE4v9DZg4safENXelaVFtarLRbTA1ozaoYYAa/sJDz6/V6sX9V
 SPJGi63RTQteKbRE9oB2XNdlhbdSb8HTU+fF9oUHyxG9uLQKWNjNj+mBgxHG2HXgGw8R
 sgOaTWWtKuJkogXOe7fDVSWB4e4wEwHi4Nc8oC6PfkkhJp2m1f2ko9avWD41FBJR+vW9
 o8dmsSBvF/mNYubZ6El1DPqUr11Zg492iQBSKE5tBKGWmaomCJwBkRyB2JRUCxg26r5V
 U2WIdA0ookV6GSE3nR0IcxqnlCMveKA2+ften6enixiVhN22FIPQrouTIdvum2FA40G9
 JrXA==
X-Gm-Message-State: AOAM530Sh20ifdNEq5RFedCm8MYMNyt6qPJxdmv22Ttsk18r4O+Uf3Pt
 jynxMjC9nVHiHTPV51wbeFKkYOvckkCM1w==
X-Google-Smtp-Source: ABdhPJzertBGoCCYZjM0BZgTRmAr5XsP7j92armg0TkxwVJ3M5CFmVwZ8SawLXy6vxtw2ghzKLh1Og==
X-Received: by 2002:a05:6000:1e15:: with SMTP id
 bj21mr10622402wrb.118.1641578559742; 
 Fri, 07 Jan 2022 10:02:39 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id c11sm10131449wmq.48.2022.01.07.10.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:02:39 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH RESEND] drm/doc: Fix TTM acronym
Date: Fri,  7 Jan 2022 19:02:30 +0100
Message-Id: <20220107180230.132666-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: tzimmermann@suse.de, corbet@lwn.net, airlied@linux.ie,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TTM acronym is defined for the first time in the documentation as
"Translation Table Maps". Afterwards, "Translation Table Manager" is
used as definition.

Fix the first definition to avoid confusion.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/drm-mm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index e0538083a2c0..198bcc1affa1 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -8,7 +8,7 @@ the very dynamic nature of many of that data, managing graphics memory
 efficiently is thus crucial for the graphics stack and plays a central
 role in the DRM infrastructure.
 
-The DRM core includes two memory managers, namely Translation Table Maps
+The DRM core includes two memory managers, namely Translation Table Manager
 (TTM) and Graphics Execution Manager (GEM). TTM was the first DRM memory
 manager to be developed and tried to be a one-size-fits-them all
 solution. It provides a single userspace API to accommodate the need of
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0C9793ECA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 16:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0585110E679;
	Wed,  6 Sep 2023 14:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFF310E678
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 14:28:38 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68a3ced3ec6so3076825b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 07:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694010517; x=1694615317;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N6HeleQWw0Y9XHoQUK3nM3UW0QTq3DvRuCxNVLyqk2w=;
 b=kz6EafpWeWNl4EQ7yuYVbeFvQXiOlfFEPq0J3bmcnDdOAlFnPgOAXovgn3/8k7kPzz
 izbua5pGriXIHbwtKqQr17mIZsrIw0ctht+uuq12XjkYS1KymMkk60LSHo50YQ3K6L3f
 pZCG48UoNIU2kx7k4ZO5r2e5uUINs3VAUtvhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694010517; x=1694615317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N6HeleQWw0Y9XHoQUK3nM3UW0QTq3DvRuCxNVLyqk2w=;
 b=RS+iJQOdfneaDXid0G3G+peehys6QBwtgve7ou/0/s95Y3/ctrStTaF/wcwMA9dMOR
 lbsodIwagX7y9ZLmNMvunzrokh6AqpuGwGmAh/axm+Mxsk9QyzrBpHEFAc1LScf1AhAL
 Gmaz/UPqoj5HdzKOpKn5nP6py3t7Dp5FoPMyyTD3PbaEB/IPwGzOvSlQGVXooWAOR1dY
 UK9C14MGUV4B5ULASkq7oO0iuZd9iUZSZZZiBGk46zuQr+733A/upu/JIlKEzZH6ZnSi
 DvyjEY90YqO+hKxcYEvIUuEq1ga1rzejoSVKfezFpT+rTgA4z1KWzJuhXG21LqH+c2uN
 zIbA==
X-Gm-Message-State: AOJu0YyaHrqMOr/0r33uszrjv/lxBkBCukLWjQyMkpTMiH2ovYeGcK2q
 /s/Ws4M/cDuRtae7WBc2oaBIhM3muHM9SB8+OkeQKFPC
X-Google-Smtp-Source: AGHT+IF7mOxXDB0NXRxhuQI4L0nXdWHrGcl43+W7501XqvJ8gv9aJTJWLtT8+XHIqibH5Q0caQSQgg==
X-Received: by 2002:a05:6a00:330f:b0:68e:290b:bb57 with SMTP id
 cq15-20020a056a00330f00b0068e290bbb57mr3498614pfb.18.1694010516829; 
 Wed, 06 Sep 2023 07:28:36 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4a07:e00a:fdae:750b])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a637414000000b005703a63836esm11393807pgc.57.2023.09.06.07.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 07:28:35 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] MAINTAINERS: Update DRM DRIVERS FOR FREESCALE IMX entry
Date: Wed,  6 Sep 2023 07:28:03 -0700
Message-ID: <20230906072803.1.Idef7e77e8961cbeb8625183eec9db0356b2eccd0@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per the discussion on the lists [1], changes to this driver
generally flow through drm-misc. If they need to be coordinated with
v4l2 they sometimes go through Philipp Zabel's tree instead. List both
trees in MAINTAINERS. Also update the title of this driver to specify
that it's just for IMX 5/6 since, as per Philipp "There are a lot more
i.MX that do not use IPUv3 than those that do."

[1] https://lore.kernel.org/r/d56dfb568711b4b932edc9601010feda020c2c22.camel@pengutronix.de

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I'd expect this MAINTAINERS update to go through drm-misc.

 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0a6b229b820a..ea69720f1552 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6899,10 +6899,12 @@ F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
 F:	Documentation/devicetree/bindings/display/fsl,tcon.txt
 F:	drivers/gpu/drm/fsl-dcu/
 
-DRM DRIVERS FOR FREESCALE IMX
+DRM DRIVERS FOR FREESCALE IMX 5/6
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git git://git.pengutronix.de/git/pza/linux
 F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/ipuv3/
 F:	drivers/gpu/ipu-v3/
-- 
2.42.0.283.g2d96d420d3-goog


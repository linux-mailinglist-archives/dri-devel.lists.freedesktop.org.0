Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B3218A134
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 18:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3B46E931;
	Wed, 18 Mar 2020 17:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCC96E931
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 17:10:24 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g2so8947859plo.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kzfdHSO2Eg/pCLBb9aj78kXEmbZ2vEcI/EKrPZigKxI=;
 b=AU7eU4/3E2gmDQx59Lfw1/ryh1dsM3Kf2E6dy+bDEQvBh8/uU7w/X6bF4fznHSSASt
 i9a1E9VmxE4DYH7eZKZ0cxcueWHrdKoa6z4ILBjN9BKMuZXFt/w8pxYRqIvTyG4YVPAA
 9bbZIYZI2dDr7gbfsEXq5e4y4RoyIeJP3JSjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kzfdHSO2Eg/pCLBb9aj78kXEmbZ2vEcI/EKrPZigKxI=;
 b=UkjFxiOATRI2VAb7GNlxdCNxHc8hhHS8HPc7FsSw3hLWH+CAiLGLE4NtayPsGTAIzm
 0w6TK015fmFQ1tAK91MYsAw3uNI+VJDE/qAIecByScgf4XMlEI7aRWSXkCYFqml7lXrG
 EF/va3rPHsQ1sB4FSZXx6MUgj4a19QJpWSEXw/e4+pVP1HZUrtkFsEqiOqsO5YmNh9M4
 U9CkMeERTDn6Mmjua8D8jyBWqWHI5jcMqHNaU1T21YOLgJep3UKVDctDTWvC7v86odj3
 2EzQGrboQ5kZTKz5k3DO2ermQtOpv92AnvFLw0HmPw4OP0phUM/Byf73BipaHryXpe0W
 UuTw==
X-Gm-Message-State: ANhLgQ3CneQapFsSk7a5Ar00JRRF6Ej0VwToEtGnQXLk9flI6ouLzWWK
 tyYZFO1unDJhRza6wxFFspyfJw==
X-Google-Smtp-Source: ADFU+vtu5mYYKn1aoaSPcvAoMeeiGoWtv0NZSu62f5Smu2NArdKXK3KRad7e8p6T+qn3WvIFv3X1nA==
X-Received: by 2002:a17:90a:26ed:: with SMTP id
 m100mr5599112pje.130.1584551424263; 
 Wed, 18 Mar 2020 10:10:24 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:1998:878c:c26e:b8be])
 by smtp.gmail.com with ESMTPSA id e6sm6443869pgu.44.2020.03.18.10.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 10:10:23 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/3] MAINTAINERS: Update feiyang,
 st7701 panel bindings converted as YAML
Date: Wed, 18 Mar 2020 22:40:03 +0530
Message-Id: <20200318171003.5179-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318171003.5179-1-jagan@amarulasolutions.com>
References: <20200318171003.5179-1-jagan@amarulasolutions.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The feiyang,fy07024di26a30d.txt and sitronix,st7701.txt has been
converted to YAML schemas, update MAINTAINERS to match them again.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- none

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ba8b584bf95..b987f2588e6a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5273,7 +5273,7 @@ DRM DRIVER FOR FEIYANG FY07024DI26A30-D MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
-F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
+F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
 
 DRM DRIVER FOR GRAIN MEDIA GM12U320 PROJECTORS
 M:	Hans de Goede <hdegoede@redhat.com>
@@ -5416,7 +5416,7 @@ DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-sitronix-st7701.c
-F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
+F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
 
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

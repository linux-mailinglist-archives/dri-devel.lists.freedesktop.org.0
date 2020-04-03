Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2581B19D912
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375686EBFA;
	Fri,  3 Apr 2020 14:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D646EBFA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 14:25:11 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id nu11so3008843pjb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xxGGn51zri+SmBzw6OefhHFXr2bA0wMiqg3raFhJWNk=;
 b=Dl8MYxOFg0TfBLOCOplJysObTuJ0bgBh15U2unyF9O1O5VlGEW8vPMVEsHiA+xpfLn
 u1p4DpYLO4L1LTNqUKtBfyeKN7Ok92m0YALjsOKfb5uaKdxhEtUZgHzSPkcR5HpO8UfU
 2Ka1EVSjq/tTo6qFMot+aXuJbz8WHWL6sCC18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xxGGn51zri+SmBzw6OefhHFXr2bA0wMiqg3raFhJWNk=;
 b=sWKN5JSdEX8dAWi4L+WSRCZiVGZ3BdB11XM9sxI29tDLiUj1U1JXAMZVKXN7tjcqtO
 5yzVmKnXq1hNEgWeITenEdcMQmD2UfPax8XBelTqV7toIpJYT1dAcgRE++iDxQTlmZst
 Lc+TSwmVl/qOOicAyxmbXcky45FBmW3dpZvy84blNIVJL5AxlSOi+BUYBC93mpfJm+4E
 SPMVrg9PUaRLhLcjtbWjl5zoLqX9dU9GsZ2fx2FtgUYvrp6/Ac0iB+Cl+ZaHmyBn7CuT
 7eci6N2GqlCzLVWFHhgws7OFeG/NdXa/qLuBjrw+Ufvb9CEEfxcJG9xrtuxuIX5W5dtU
 dXcg==
X-Gm-Message-State: AGi0PuYx4q1s1vczCVHGNezMLArpwRytZFY/KpIgKTj9xb4LVErNCqjc
 PSXMqTjwj3I1eBBLN0OpzFycaA==
X-Google-Smtp-Source: APiQypI5jQw1eSXRKQohkfFUTS7Vbekz33WC/zYzEcO9VRwvS2L6cNMg6F3ab1C/P8BJ+rmCfy9dQg==
X-Received: by 2002:a17:90a:33c1:: with SMTP id
 n59mr9737670pjb.4.1585923910684; 
 Fri, 03 Apr 2020 07:25:10 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:9cd7:b821:2c84:e325])
 by smtp.gmail.com with ESMTPSA id g75sm5857060pje.37.2020.04.03.07.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 07:25:09 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 3/3] MAINTAINERS: Update feiyang,
 st7701 panel bindings converted as YAML
Date: Fri,  3 Apr 2020 19:54:53 +0530
Message-Id: <20200403142453.25307-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403142453.25307-1-jagan@amarulasolutions.com>
References: <20200403142453.25307-1-jagan@amarulasolutions.com>
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
Changes for v3:
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

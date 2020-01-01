Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA65112DEAE
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 12:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F20899A3;
	Wed,  1 Jan 2020 11:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDB88999E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 11:25:21 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id b22so16710096pls.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2020 03:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kGyS2va2MM5LlItUz13S22TtfwiSSFhRb47vRs7rcSA=;
 b=bRoDYVtQ1NYUFDceNj0TvN7AgLnYHCKEZc9F2ihByaESmLqX4XnrdAyOdO4dIcdRNd
 BPIkUn4kHcXhQ90ZIpwuCpprRMAd9REj4spU0ZHxdb7GuFfpFARUird/OWwD74k/7O9q
 6R61h1eJJ/m91+hWicSXyQHEFX4LaY2hg7YyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kGyS2va2MM5LlItUz13S22TtfwiSSFhRb47vRs7rcSA=;
 b=IFe7J5gOwQIhJey0Z1Ib8YLpaz7GJGmsrtyBIiuhDQEzlpLy8dJj6+tA/GEZQvZ2DE
 hc0eKHOquXL7u4VrIuBm7b9btzDfNHhGdf8VzlnpqljLN57HoaMfnAPkEEETzJ1xWTvF
 IEb0h0BPoVD7XgmprL+uSPp2PRGhQHgYV2qYZgoxeJFS9w8vER+S64ucqc+Lvtyz/cia
 gsbMS2MY8/8TGkMRIZpub3rhrUZhmlb5pTnI6br6NI3Q5IOzb/UNWwLm9dw+sTnBcBdP
 yHwpoQIl4dRqHjd24dhnIc9MFR0DzvzNChaBXN5KmJL0LBidRVTvyhLc1q3TWaxGicSa
 XZ3g==
X-Gm-Message-State: APjAAAXg3/6frvSRqfY7a8ybSlsYchQ2hf3GZESVGYrmbXPkJdZrBgRg
 1F4jEd95tWozooGvg3cy9u+6EA==
X-Google-Smtp-Source: APXvYqx1w7BI3kSg5znfx18d2dqgKYCH7WWv2q9ctxYTFGBJxvjbzmixsUdL7wGN2fv0ZiGpf8bK6g==
X-Received: by 2002:a17:902:6b8a:: with SMTP id
 p10mr64853544plk.47.1577877921397; 
 Wed, 01 Jan 2020 03:25:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:d0fe:8978:1b04:ff94])
 by smtp.gmail.com with ESMTPSA id y7sm51945439pfb.139.2020.01.01.03.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 03:25:20 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/6] MAINTAINERS: Update feiyang,
 st7701 panel bindings converted as YAML
Date: Wed,  1 Jan 2020 16:54:41 +0530
Message-Id: <20200101112444.16250-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20200101112444.16250-1-jagan@amarulasolutions.com>
References: <20200101112444.16250-1-jagan@amarulasolutions.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The feiyang,fy07024di26a30d.txt and sitronix,st7701.txt has been
converted to YAML schemas, update MAINTAINERS to match them again.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8b2e6c68832d..4d6e4febd170 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5169,7 +5169,7 @@ DRM DRIVER FOR FEIYANG FY07024DI26A30-D MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
-F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
+F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
 
 DRM DRIVER FOR GRAIN MEDIA GM12U320 PROJECTORS
 M:	Hans de Goede <hdegoede@redhat.com>
@@ -5298,7 +5298,7 @@ DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-sitronix-st7701.c
-F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
+F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
 
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

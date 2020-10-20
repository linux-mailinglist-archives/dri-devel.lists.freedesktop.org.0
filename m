Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753E2948B4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E6A6E97B;
	Wed, 21 Oct 2020 07:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A08A6E0FD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 22:15:15 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id t15so108668otk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 15:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rv4qFTv25KqnYnglUjSv+IYVPK04sSlNOwpw43zg4F4=;
 b=TiVvp3IQiVH8w3fbaITLMtKf4RVlIR8Nf2Xtw7/DPUl7cZTFG8o8Ihbu6sQUVtRCTu
 4wQmWvElKnod+aMvkCFRKTTCMJd4XgfhGVF2MABgscH/PVNeDc6yBOwk0EcsU09ORd9V
 Vqu0PfaE1P+u6OG7gXPibLZRFGnn3wyd6iW54vF3Rqr/T3ZyHOyA+YP/7yyrJ1QjZzHt
 y0qdCTTLrPUw0bplS7h6yDSn1vKGahEIWUToflYHswNuQPL1QV7OgOyRbqMvodlNEn+i
 dneIZaO5YanWAPkFW8K+FWXDDpdka4uAMPXqUbgtTmW/Owd3mRRIO9DRSvJIsAwcNra2
 bJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rv4qFTv25KqnYnglUjSv+IYVPK04sSlNOwpw43zg4F4=;
 b=j7qyToN9jF5gaJyanonnobnLrT/OxYbOskW/is1w3UBfF6vNGGdEsPuQMOaA++HP1c
 CF0/6Z+Wcc5rwECv85DrM8ZkLJiY0d07FdAWVDn0SXLq+uCPZ50j8wogvD9b2qBPsK5a
 JRt0ucyUE008KgiDOI6Qn9GytN2FtYqsfbgh0HyOxyhYdYidrBv95Jvi73hKwkJZToYX
 Z0wy3C7D2olxUpOfJydtLpkXoEqfl17T9j9Z9NiTQcgVVRqR4t6bJ+tewS0XW4jPLIkx
 mrvyOXalepihRtnRcl2nV6Ar7SiFTXGcF10FIPn0LBwIMy1UHrqdM9ZUzORlEeqe7QfR
 fTFw==
X-Gm-Message-State: AOAM533JJflZJdqucHk/WK3yxkLyLvFPgGcRIzaKNLqOGG8ymutyfdwk
 03e4Gpdk7uK179LL4xoqHAgcFlIrDw2lNA==
X-Google-Smtp-Source: ABdhPJwPJhdXClV6mKkVtb4k+SG2MQb/0NO1UmCNo7vCUuPUkba2a1oHY5yrWEL8/StWEZCb8LAAog==
X-Received: by 2002:a05:6830:4d:: with SMTP id d13mr377764otp.67.1603232114779; 
 Tue, 20 Oct 2020 15:15:14 -0700 (PDT)
Received: from nuclearis2-1.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id 81sm57005oti.79.2020.10.20.15.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 15:15:14 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/3] dt-bindings: display: sii902x: Add supply bindings
Date: Tue, 20 Oct 2020 17:14:59 -0500
Message-Id: <20201020221501.260025-3-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200928173056.1674274-1-mr.nuke.me@gmail.com>
References: <20200928173056.1674274-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Mark Brown <broonie@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 sam@ravnborg.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sii902x chip family requires IO and core voltages to reach the
correct voltage before chip initialization. Add binding for describing
the two supplies.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes since v1, v2:
  * Nothing. version incremented to stay in sync with sii902x regulator patch
  * Added Rob's acked-by line

 Documentation/devicetree/bindings/display/bridge/sii902x.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/sii902x.txt b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
index 0d1db3f9da84..02c21b584741 100644
--- a/Documentation/devicetree/bindings/display/bridge/sii902x.txt
+++ b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
@@ -8,6 +8,8 @@ Optional properties:
 	- interrupts: describe the interrupt line used to inform the host
 	  about hotplug events.
 	- reset-gpios: OF device-tree gpio specification for RST_N pin.
+	- iovcc-supply: I/O Supply Voltage (1.8V or 3.3V)
+	- cvcc12-supply: Digital Core Supply Voltage (1.2V)
 
 	HDMI audio properties:
 	- #sound-dai-cells: <0> or <1>. <0> if only i2s or spdif pin
@@ -54,6 +56,8 @@ Example:
 		compatible = "sil,sii9022";
 		reg = <0x39>;
 		reset-gpios = <&pioA 1 0>;
+		iovcc-supply = <&v3v3_hdmi>;
+		cvcc12-supply = <&v1v2_hdmi>;
 
 		#sound-dai-cells = <0>;
 		sil,i2s-data-lanes = < 0 1 2 >;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

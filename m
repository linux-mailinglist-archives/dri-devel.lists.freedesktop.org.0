Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E891A64AB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 11:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B70189E9E;
	Mon, 13 Apr 2020 09:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D58289DE6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 07:53:42 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f13so9246083wrm.13
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 00:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=spiyZxT4E+JmLBsDsV1seik/2tk8bWL3YTlzlnavzgI=;
 b=f7pV8rfFH7lOGO3h5/nULD5HFllQxOEL05FTUF2SiEU7MAF1JJPc8mKH7k/3mp1dKC
 FdUtjdGVIhPaaHxiz+2ZaWsvZCsBdBLkUc0vwbtipe+jfJJ55AY7x9j9o7z3iU3ftoEb
 Bv3Ej6Xplpkv9hOYt6QwjKJzP4A3G62gst9hKhD5eBAYTvgF9Wr4JygtFDUu1AyZxBEn
 wNjlO5+VD0sorsLos6LHRByHb8qvslGj1FTporIbvRQfVEods0O9oLMrmXmySRNdjWmj
 QcA6UC/bsomklfXgRa3zN0/xG2DhA+CKHljfC40QOQW0cpHOsm/s4JnXCNvoy3PfS2Za
 3XdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=spiyZxT4E+JmLBsDsV1seik/2tk8bWL3YTlzlnavzgI=;
 b=OTGUiH13TKhfSOZtxKjSBGi+buUT0XNMIpIXgodB11Bfhff3ZiqXu82D0U6B8eHdcW
 p8VK+p86IZ6gg/HURCKGY9osW9/TF5IGBSY2FItFZiYaL8oooweGgXDr34Y2vI7ZS1dO
 1msx8ljMnty4w1zFaseDbw3y7DhX815Ty/rEujQcYmHPzAt7NelwzOCo/g7VmTEC+JKN
 FHm19UlH2WQdkU0F+OghNCCeWXfzefWuJhdvEjM0ewZejghFmhBmP7N2CuI7AkzTGHaV
 kPaE6jMPgQSCbr6/y3B22NO4l33+aT0Q8VG+O3KlY8vJApsI8WTwPU2riw14wl/NZMxO
 8aAQ==
X-Gm-Message-State: AGi0Pub9IwQ/B+zLJ4ubS29BA0hHIFb/b/vHjox7xnb9r1t8yQKKJ9Aq
 0WaFGOGuTLYWtVHnnuxLoDSDiFNhKEc=
X-Google-Smtp-Source: APiQypI3ADIddYujUXFFd3J7qJbmarkuNkmp+vZH8NiU3NHgBxky845LmO+SMRcLmZhfAGYfIIblKg==
X-Received: by 2002:a5d:6785:: with SMTP id v5mr3023648wru.376.1586764421177; 
 Mon, 13 Apr 2020 00:53:41 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2da9:2f00:c0be:812e:7fb0:ebe0])
 by smtp.gmail.com with ESMTPSA id s14sm14009619wme.33.2020.04.13.00.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 00:53:40 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] MAINTAINERS: point to display schemas in DRM DRIVERS FOR
 ALLWINNER A10
Date: Mon, 13 Apr 2020 09:53:29 +0200
Message-Id: <20200413075329.10717-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 13 Apr 2020 09:29:25 +0000
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
Cc: devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit f5a98bfe7b37 ("dt-bindings: display: Convert Allwinner display
pipeline to schemas") replaced sunxi/sun4i-drm.txt with
allwinner,sun*.yaml files in Documentation/devicetree/bindings/display/,
but did not adjust DRM DRIVERS FOR ALLWINNER A10.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches \
  F: Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt

Point to allwinner display schemas in DRM DRIVERS FOR ALLWINNER A10.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Maxime, please ack.
Rob, please pick this non-urgent minor clean-up patch.


 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..1f6c9bec872a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5552,7 +5552,7 @@ M:	Chen-Yu Tsai <wens@csie.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-F:	Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+F:	Documentation/devicetree/bindings/display/allwinner,sun*.yaml
 F:	drivers/gpu/drm/sun4i/
 
 DRM DRIVERS FOR AMLOGIC SOCS
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

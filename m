Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA60D3F0705
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 16:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB9C6E81B;
	Wed, 18 Aug 2021 14:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74B16E81B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 14:47:05 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id v2so3520019edq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 07:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vNVfBtmdSEQMHS7NoA4wKiTmeDTFKx5xuSiT5cX6rdQ=;
 b=IOgQGJmbcbWP/GZ5G+/xSr0a1QHxH3JvD8MK4+fmidRvQekv/jZ5OWdHrDsfxnrhka
 jfNNFVgp5HNJoF0S4vaTSSzFq2J0XwG2/m7zkW7ugBlXiHDb+jAoZlrn6vO+Wup6CL7u
 Vpsccuwcx9PtDgiTEtupb5Y7pJ7riUYCjIvUvizYeqX7jLbNQ4rVmtE6RDcBu6K9qWdK
 0tsBe70yTbqqUcHG4zNZ02ipGLr0g7MXoK2t924OSGwtHr+yFeeMg5hmc5Prr/w3ZsNu
 6AIvk1j+S3bypYU80LiPoIWc+bw5ePxMsZvnsLdhIfeXbLgwCBcVj7wFEIoLCDv3yIOV
 mk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vNVfBtmdSEQMHS7NoA4wKiTmeDTFKx5xuSiT5cX6rdQ=;
 b=giakYiayUrULgMUBgUvd4X16A4Fdfk3dEQlgujAw7fQnMVgeG0R3Ke6qqjAGK4Uqkb
 xNfL0vEnSWlV3zO/3ln+E+jr6R/vzk422E3bHMaTTFnhK6JiL6pWqzGAuxofk+yfXU3H
 R2fBoWFPdUwLGhAY8ooUFdUv3anDH0WOZgZ8UHqUjmPwd6i2UnkZYp3dO0FgTaewukff
 9orXL7enttBQEaUpaXGnlTZfUEGOx/EFae6ksBhA4zPwzo3WGSCXd80uiuHLd3uCARx1
 jhhvPQVi+6pitHkhd/PfEPSx6El+v0IIDHJfITeESewVkjTsoYexoZRoDTLTtDq83gOf
 8Y6g==
X-Gm-Message-State: AOAM532Xh6B40JJlM6dwfjWXrW1rFeAe/73PNFUkVGcFBOd10sh8E4kJ
 /IZxdPTFCgTTOKigM4c6Zeuy4sJi9mnYsw==
X-Google-Smtp-Source: ABdhPJzvloc74qMfIzl/6q9qLOKDLfOuqz0NR6SdFazcCDy8tXovf3+knaR82YSJJPp7PSoOUHTn+Q==
X-Received: by 2002:aa7:d54f:: with SMTP id u15mr7976174edr.178.1629298024282; 
 Wed, 18 Aug 2021 07:47:04 -0700 (PDT)
Received: from localhost.localdomain (neth7.eastcode.net. [79.143.160.90])
 by smtp.googlemail.com with ESMTPSA id x17sm2152808ejj.58.2021.08.18.07.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 07:47:03 -0700 (PDT)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nikola Pavlica <pavlica.nikola@gmail.com>
Subject: [PATCH 2/3] dt-bindings: display: simple: Add Vivax TPC-9150 panel
Date: Wed, 18 Aug 2021 16:46:47 +0200
Message-Id: <20210818144648.72665-2-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210818144648.72665-1-pavlica.nikola@gmail.com>
References: <20210818144648.72665-1-pavlica.nikola@gmail.com>
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

This tablet display is unique and hence must be added to documentation.
Unfortunately, it's real make and number is not known due to obscure and
missing documentation and lack of writing on the display assembly
itself.

So the natural alternative that came to mind is to name the panel after
the device that contained it (an Android tablet). Hopefully that isn't
an issue.

I can confirm that the parameters that I've obtained are correct since
they came from a dump of the original Android OS.

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 62b0d54d87b7..d0efefa5a820 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -285,6 +285,8 @@ properties:
       - urt,umsh-8596md-11t
       - urt,umsh-8596md-19t
       - urt,umsh-8596md-20t
+        # Vivax TPC-9150 tablet 9.0" WSVGA TFT LCD panel
+      - vivax,tpc9150-panel
         # VXT 800x480 color TFT LCD panel
       - vxt,vl050-8048nt-c01
         # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
-- 
2.32.0


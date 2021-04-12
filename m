Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE98635CA58
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 17:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808C389E86;
	Mon, 12 Apr 2021 15:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2B989E86
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:46:59 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso7192222wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 08:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QKsJYMfj+mAr/LEo/N+G3J+2p4GxyOGmqg/HnacP+4k=;
 b=jBSdhPsPjekjj+jMPgA0tSeRmZh1lYFavQ7g9j/ygo/Zvue9b3e4oZYn6ZfJYbMHoj
 zhucATVrrCRDWkvTGGOBEyIOuTWE1GYT2NwE3J9H+Zc+I2NZl1hAurIRJyM0lZ2IRfGZ
 85H9T45RTIoxIYBz3cjOL0rlpNkKKKnxwXbODLm6lLT3PTTGrlRLz1B5wkKbC7UCU/vx
 gpOTf4re0wD7tsWukZlvhvofCGEhujCvLiQcryS4sBZ8bpXjUFBhwnvbSZViilUkVztn
 L7ZNQSwApuWa5oXMv9pxMqqaFtb48u7OM7zBvNgFPnwti0vVUsL1L6U7R2BHn5eDpmt3
 ksaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QKsJYMfj+mAr/LEo/N+G3J+2p4GxyOGmqg/HnacP+4k=;
 b=ojk2N53KWZBqFP3Xbjmqv4Um3U06MQkdeSJtLwykqi87TU0bd/SmfL4L9fLdkQw4ex
 Euu8iXGc/z4brHk1q8j3A6j8iIf22F/6VZ1zwvN2iIX4saBWHyNx5DPN/FcXjfLP91LQ
 vlguejd7BZWdmM+DQB1nPyiSSbt2D6X9trkFJ+OGUTa8EYYXGSCRaOHjNFoLdjb3En//
 0Sh6NyFuSOSdIsefk09zN9SiKn8RdrRYcfmJ3vkG8avOahDpc5OE9rtAYO0Jib2YLf1b
 BSjhu/GRus5uqtPmy7ovDrO6MycMploRcgddUTf/AOyFYsqgNjyGcnbdnbL0nJ68pd/C
 V0jg==
X-Gm-Message-State: AOAM532zdjGlqSGqTVEVv+QtbNu/ZLvrRLAtATdDo+YsvS0VQBQiDaQu
 vG2WXb0u5vaYFVuH4xEsieHc/Q==
X-Google-Smtp-Source: ABdhPJx9aeflCvS1STVjTQt+KOuZ4pckqoQmL9pZFHX6R4v9knMtxFlDP5HTOFz9xwD/NNwLOCVCjg==
X-Received: by 2002:a1c:f715:: with SMTP id v21mr27817848wmh.187.1618242418068; 
 Mon, 12 Apr 2021 08:46:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id
 u3sm12647332wmg.48.2021.04.12.08.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 08:46:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 paul@crapouillou.net, robert.foss@linaro.org
Subject: [PATCH v3 3/3] MAINTAINERS: add it66121 HDMI bridge driver entry
Date: Mon, 12 Apr 2021 17:46:48 +0200
Message-Id: <20210412154648.3719153-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412154648.3719153-1-narmstrong@baylibre.com>
References: <20210412154648.3719153-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=QfcZVt5wD67EB4SM1GoV8Ndq0aCcis+V2maojsn145o=;
 m=+nVBMIivqLWmhW+4z3eXrpJ2lOG93YvhBxA0eTLsMTE=;
 p=xpVYdKteOn2lZkFgz3iqfdGphvWJFQwxpv+svO0TUAU=;
 g=2027a19d792bbe8bc07a2ee56f6cc447a8d26270
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB0a0sACgkQd9zb2sjISdG76g//Z99
 fJBzU/ZJUwtXn2n0EA5UeZH5FBVd6gtdBxoqhXXWe4EUX62pUx2pp3HDfDgcq4cV14bRPOpBtQgRX
 RE1aF27PVmNtfJLhvBrGAEd9/ZJ2BH41Bpo/8ZAQ6nw8iJlynt30zLdHzSL73tCaniFhlGcn9yUTS
 cjk3uhCDXb/D3fTnqlcgI8hBTG7c3cvbYSsGsPqQWRBFR3DUQbI41uAttiytauB1zJ6MP/nJys/q/
 xP6rqRhXUU0gISeY7Ti+AjP6rPv7siiXdT6dSPA981q1yRHn3sffZ1CaZKDuAQBnUP4+P37esJSyg
 o6MEtuJt4IZtlmw9l3rr7dxRrr4N9tO6XMf2SzOI61PiYb8D7KyKsx0N8JJNxxRprVHq2hCNih4Tl
 9RzHkD47lUr9nkfm1/IOKW2WawqCpg1c4uW0BKv+JRbxKhSBcpJlN06okhq8BMvi0ZkCZqwQrHA5c
 LwX7/e7w6+xUFI8e9kldNV5vKYPoS2rJOJCY/QFQGqLICp+EA9nf8QbuG2Oan7tz8PgIF9uyUsGH/
 droiDn4L5nPH1AvOGuJ6CZ3aG3gvwXhqArXaGxrn6WpKxnrAHf6oldGrF/+R6dxAhWrufVsmt1KTj
 Jpcky99GagzZNvDm8Wp7dMZfcq7dpnvgMTMpucS3u8IRNfwbAvYXZJxwT2bnd4aw=
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
Cc: Phong LE <ple@baylibre.com>, jernej.skrabec@siol.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jonas@kwiboo.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Phong LE <ple@baylibre.com>

Add Neil Armstrong and myself as maintainers

Signed-off-by: Phong LE <ple@baylibre.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ae8444c96b4..ff6450c83049 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9515,6 +9515,14 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/anttip/media_tree.git
 F:	drivers/media/tuners/it913x*
 
+ITE IT66121 HDMI BRIDGE DRIVER
+M:	Phong LE <ple@baylibre.com>
+M:	Neil Armstrong <narmstrong@baylibre.com>
+S:	Maintained
+F:	drivers/gpu/drm/bridge/ite-it66121.c
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
+
 IVTV VIDEO4LINUX DRIVER
 M:	Andy Walls <awalls@md.metrocast.net>
 L:	linux-media@vger.kernel.org
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

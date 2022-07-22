Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A1657DB7A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 09:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AAB210E0F8;
	Fri, 22 Jul 2022 07:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2585210EA24
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 07:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658476100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3hxncbcIe4Kl6PZy4gQqi0arV/C4q3zp6iiC7bYlb70=;
 b=JOVOCCmG1njjytcusVWKvBW1BzhKR3eoXg9USMTrsb0jB5rtKoSbLlh52HAGCuN06JB0VD
 oB3hP9j2wVKYLnkrz6LxPJLhiau63wZ0DZH6hCZq1ogPX0vDtsUp3G0uJ4uv6lKfL9WylP
 Duh4Tgt1sfwT/RoyTCH5EzdLPg3+9Ak=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-j4U_DrI2MD2S0d3BuIktug-1; Fri, 22 Jul 2022 03:48:13 -0400
X-MC-Unique: j4U_DrI2MD2S0d3BuIktug-1
Received: by mail-wm1-f72.google.com with SMTP id
 189-20020a1c02c6000000b003a2d01897e4so2126709wmc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 00:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hxncbcIe4Kl6PZy4gQqi0arV/C4q3zp6iiC7bYlb70=;
 b=IZrV/8cFnx4PZU8yi8LWH+4xXtjSdVB0K8GMVYMB2a366KcSGy0GhIOw1x1VksX6Un
 Uroig7sCYOE/zo0hmvaavoslnNcEB/6wkbvJjMRP0SPoX/kYMdKyRstgLyXINWpMKQEG
 MExtGuqhNUkPMymC2Nz/O6AT2Wpj+g2+zbmb6zUbVPlGdGYxsk+5QJZxaTcrzG+iRdSZ
 Y+YC1p4ptmsm5fkbdX8XHTmt33C0KNEEnzdf/ouftfHBphpETapxsX3XFQggZ30WP5Az
 vHWE7RaxedBhZsQRqWkZBxjWXxv6BXA66O29gp9ArQ67ERGbnI47Q7grOCqb4tQdgGBb
 5Gpg==
X-Gm-Message-State: AJIora+IMcJ7VKaw4veiB1Rx3+OndGMOjhtTARZZE0K1hufd4sAKmONz
 Bhlh3LtnDRIpnXV4m4u2unkIiYNl0JTx8mHcTBuJJ/EF+/k2SRWT160OybHuwVI4ukkIj2TJx0L
 Jx01iISrpiCq0MA7YKTwVS1Aw2Od7
X-Received: by 2002:a05:6000:156a:b0:21d:b22b:e5b with SMTP id
 10-20020a056000156a00b0021db22b0e5bmr1525070wrz.348.1658476092614; 
 Fri, 22 Jul 2022 00:48:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sDNNi2fuV3Q+f07HSbxoQkeX1wVwLud1oPEReIagKxVgo1g2hage93fB9UK5tJJAF3bhMQdA==
X-Received: by 2002:a05:6000:156a:b0:21d:b22b:e5b with SMTP id
 10-20020a056000156a00b0021db22b0e5bmr1525046wrz.348.1658476092351; 
 Fri, 22 Jul 2022 00:48:12 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b0021e5f32ade7sm553115wrp.68.2022.07.22.00.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 00:48:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Use dev_err_probe() to avoid
 polluting the log
Date: Fri, 22 Jul 2022 09:47:55 +0200
Message-Id: <20220722074755.660258-1-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Erico Nunes <ernunes@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Enric Balletbo i Serra <eballetbo@redhat.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If devm_drm_of_get_bridge() can't find the connected bridge, it returns an
ERR_PTR(-EPROBE_DEFER) to indicate that the probe should be deferred.

But this path also prints an error message, which pollutes the kernel log
since is printed on every probe deferral, i.e:

  $ dmesg | grep "failed to create panel bridge" | wc -l
  38

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 369bf72717f6..90bbabde1595 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1206,10 +1206,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	int ret;
 
 	pdata->next_bridge = devm_drm_of_get_bridge(pdata->dev, np, 1, 0);
-	if (IS_ERR(pdata->next_bridge)) {
-		DRM_ERROR("failed to create panel bridge\n");
-		return PTR_ERR(pdata->next_bridge);
-	}
+	if (IS_ERR(pdata->next_bridge))
+		return dev_err_probe(pdata->dev, PTR_ERR(pdata->next_bridge),
+				     "failed to create panel bridge\n");
 
 	ti_sn_bridge_parse_lanes(pdata, np);
 
-- 
2.36.1


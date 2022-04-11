Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921F94FC670
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 23:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226CA10F76F;
	Mon, 11 Apr 2022 21:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE9610F76F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 21:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649711575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOfEjGDhyNc9e2ZohfZoZhj46Tns/ai5DoWmszx5PGM=;
 b=JcEIXibAk4RI4JsXLe5PzQEDbrgfTaFqLtzpcQxNDNngPV4m3vN57m4JB+wE2fDct9FF+K
 9vfTf16Gkp7FPbdqPxEvMlGpu3vR8KHCViE2V4jFzC5+fJkw6/KhZDVY5N9kKbpZMXQUTW
 CkvRZe3DqEop8pHPVB6ILZ9Zcczz6Nw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-LqbTiMsuN7yYkO-qKUqdFg-1; Mon, 11 Apr 2022 17:12:54 -0400
X-MC-Unique: LqbTiMsuN7yYkO-qKUqdFg-1
Received: by mail-wr1-f70.google.com with SMTP id
 f2-20020a056000036200b00207a14a1f96so1177643wrf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 14:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jOfEjGDhyNc9e2ZohfZoZhj46Tns/ai5DoWmszx5PGM=;
 b=WRQwH5w+D8AzMjm/DcAkfYNvmaB/rIATTsyQn7EcPNNNhezR5Pi+Wi0x7dnwhoEf9P
 p/Srvovdh7M67ISBUNPO2g/ty968b3jELa+KJr4Z7AGkCGubsbbp2/RMNnv0TTpYTUpb
 f43vLQjTpC2+hhr6S7rGFzkROH9Xy6PzDDttYxVYEfna78Hoa11Hc7rHWUtSU4eZG0hg
 ABYerynYUZIYNP2Cg876XytmG4HQwARpzbyojuLDaHTFlQbReXlsc805hAp65Na79lqa
 oEHNkESEltaZ5vBlDQBw4ygWYnbUAenPiP45QSvxaoJ7HeBYJ0KCjTDjeVQmav8+2Wkq
 PjSg==
X-Gm-Message-State: AOAM53365w7N0T5InYRg9WBlkcyojx1dRm0/ZQ8RLHJPbV01Z2ExdIVt
 RSSmSwAaB1NhvD/xjE1eNwcgzB5KHjncSqtxfkGNBNbwJBNVietVfZdwW+fXeBA1XANzPDiLZ2z
 X00dGJ668aDqU4+RJCX7SuyeEzRYG
X-Received: by 2002:adf:eb81:0:b0:1e3:2bf5:132 with SMTP id
 t1-20020adfeb81000000b001e32bf50132mr26144645wrn.246.1649711572982; 
 Mon, 11 Apr 2022 14:12:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTCKXEjVBa6ZiAkJVgXv3Un1Fp+W8yDtHc844corf4v+tD4JqXCWEFTkdomwZsnwALRaVSUw==
X-Received: by 2002:adf:eb81:0:b0:1e3:2bf5:132 with SMTP id
 t1-20020adfeb81000000b001e32bf50132mr26144630wrn.246.1649711572769; 
 Mon, 11 Apr 2022 14:12:52 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a5d6d89000000b00203d62072c4sm28723722wrs.43.2022.04.11.14.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 14:12:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] drm/solomon: Add ssd130x new compatible strings and
 deprecate old ones.
Date: Mon, 11 Apr 2022 23:12:41 +0200
Message-Id: <20220411211243.11121-4-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411211243.11121-1-javierm@redhat.com>
References: <20220411211243.11121-1-javierm@redhat.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current compatible strings for SSD130x I2C controllers contain an "fb"
and "-i2c" suffixes. These have been deprecated and more correct ones were
added, that don't encode a subsystem or bus used to interface the devices.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Mark Brown <broonie@kernel.org>
---

(no changes since v1)

 drivers/gpu/drm/solomon/ssd130x-i2c.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
index d099b241dd3f..87abe1fe31fc 100644
--- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
@@ -87,6 +87,27 @@ static struct ssd130x_deviceinfo ssd130x_ssd1309_deviceinfo = {
 };
 
 static const struct of_device_id ssd130x_of_match[] = {
+	{
+		.compatible = "sinowealth,sh1106",
+		.data = &ssd130x_sh1106_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1305",
+		.data = &ssd130x_ssd1305_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1306",
+		.data = &ssd130x_ssd1306_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1307",
+		.data = &ssd130x_ssd1307_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1309",
+		.data = &ssd130x_ssd1309_deviceinfo,
+	},
+	/* Deprecated but kept for backward compatibility */
 	{
 		.compatible = "sinowealth,sh1106-i2c",
 		.data = &ssd130x_sh1106_deviceinfo,
-- 
2.35.1


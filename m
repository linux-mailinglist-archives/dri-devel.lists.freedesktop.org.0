Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB0152DA49
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 18:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8646410E478;
	Thu, 19 May 2022 16:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F38610F1EF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 16:29:59 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id i66so7050993oia.11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eDj9YtrL+ME/X2nogJu52e1JjwHXOpFB8AWWGPpN1JI=;
 b=GopHsktLl1FQHiOTG2Rcl7tq6cJcuAMLUPz/tIktAVi4pFMYnsHSyGZ/yNj18WFDUC
 qVvLfkJjJBsrQ9FK3hKmBv/G2kWYIIGctov/JcnxBJpj6Fo2Dq5vH+K+7J1L7e3ChsVa
 oAlXRfBGdaapF58zbqZnvfDY2J/15YRO/sx91miCOxpNhbrH1aACE9iUw3kp/XAd/jXG
 ofWGsCWs9xkx9zdWP8X82Sp5A10NP+d+jfb8DWv6t59TgMlOZBxPdhYxOKuSVmklg2NU
 v+UThHdaGO4a2MCA1BahEdkdwuOOSV8jATDUHhwsurxzLnXZY8qRsUj4SWzrHpMK2+LW
 wt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eDj9YtrL+ME/X2nogJu52e1JjwHXOpFB8AWWGPpN1JI=;
 b=Ecb50NubpG4SRyF8hsmn25EfJppD5kUm0npDouskaWWYT1zPGjJAHSOMzODWjkvzIL
 4ro5FD44wtdBxxzvuOIfW8WbMtLdgesQuO59n+oy5WITAfzhnNYRz/0iCd46NEYiwKJj
 uVPwmLM9QESNcsCv/YwbDd+7sO2IxiRjhMqxkTDNwcQo+HgTbqEQJdxNIVXNJT26nkrt
 xEaw+D9uchhottdm4M5JcXMybcRcqGOWbBmjAT9cvBR+6UO5MnUHWXDSBGp+uA0ucrsH
 fXdnmJ66Jgc70HalRjirV/SnQU4ntafEpy3yT0g285rxVmo7/j9mz585VZXKbGv/C1Xl
 f2fA==
X-Gm-Message-State: AOAM533DnC3D9ViGRoSUrNRah/uDcKBCRRrY1VOXZ9tpt+vedx+eclcK
 ZO4G8cJtddgFEAWiA34lrl2MhwOrc8EpLw==
X-Google-Smtp-Source: ABdhPJyRSED3NYB6g3npUapZBROIw+TePvZdH0R/K6jTKuECnoY/NSeSywuMIYCDp1g99Vxzp2Wo5Q==
X-Received: by 2002:a05:6808:ec7:b0:322:2bcc:42c2 with SMTP id
 q7-20020a0568080ec700b003222bcc42c2mr3283588oiv.168.1652977796926; 
 Thu, 19 May 2022 09:29:56 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 n4-20020a056870844400b000e92295f8acsm36562oak.2.2022.05.19.09.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:29:56 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RESEND 6/6 v2] drm/vc4: dpi: Support DPI interface in mode3 for
 RGB565
Date: Thu, 19 May 2022 11:29:35 -0500
Message-Id: <20220519162935.1585-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519162935.1585-1-macroalpha82@gmail.com>
References: <20220519162935.1585-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 emma@anholt.net, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, mchehab@kernel.org, sam@ravnborg.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the VC4 DPI driver to utilize DPI mode 3. This is
defined here as xxxRRRRRxxGGGGGGxxxBBBBB:
https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#parallel-display-interface-dpi

This mode is required to use the Geekworm MZP280 DPI display.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index c180eb60b..3c58ade25 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -173,6 +173,10 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
 			dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_3,
 					       DPI_FORMAT);
 			break;
+		case MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
+			dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_2,
+					       DPI_FORMAT);
+			break;
 		default:
 			DRM_ERROR("Unknown media bus format %d\n", bus_format);
 			break;
-- 
2.25.1


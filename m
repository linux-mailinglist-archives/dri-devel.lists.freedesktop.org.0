Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B638658C632
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 12:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172F111BD01;
	Mon,  8 Aug 2022 10:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C0318AF43
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 10:16:22 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bq11so11980985lfb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 03:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWyHWpRZ1Kh32AMhlQIk7pyHBxJVf8IzTt5zqpwObhY=;
 b=MrROKyLJJ83f3Rr2mGc49Yse06wHtSB+UZ/fdnVkIROrdgd6G5U0BHv6wZCH0y/ELG
 AJ/m/Z/4Q7nc+d7bJBHuSjCXT9hyjQr6FsJpynKeTu7fw5UTIUgWnyB4ROV6D1v5kGxH
 vKTPX90RZrqPKvjtOl/EiKG71FvteMwCGWYOobnquUOQm8jIHa9oCCfQu+PvxlH5NrCW
 iwRFPN/ePSPg8LUGx4iyC/fG14Oske8ipp/nAcCYTlFCM7MokuuK008QWNlC2JyW29WO
 FHjxT9M+nzbkNOPuHVaA9LMMz6lcaIpnRfAwa8DyvaqiF6QwEl9fAi1PbdzqmFR0fH97
 EVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWyHWpRZ1Kh32AMhlQIk7pyHBxJVf8IzTt5zqpwObhY=;
 b=Hnpl23IkJltCjOg090s6o/WSypdxTPqTL4KXRNc0WetjjiMpccLfzNmkZrhYaHpi5t
 8DGR4fYfqWGIq7Qps7i5puUw/Or3i0dXAIJSjbrVRTEtJ+CO0a6v7nDLt/Cit2N1X381
 B4+6/jIVpRJsemC3f16LDKUsix+nP/hf+xUg4SHE2WeYdwcaI+4F5oJVwemQQRaqAMiZ
 l09/1mUPKvZDBRC+R7r5KK9f7nYynGl+oBwMsWd5C2JOIJG/ZAoISv9X1TWYpTkxPZP4
 4DOzU+KdSuRdmsNInZSsATSkJJBg/wnDOkskWih50mMiGrgEEMxJsAMpa4huYDl7NK6P
 U3BQ==
X-Gm-Message-State: ACgBeo3GSwIygUPWTe+fGK9ZPE8Edcgb7s3KZtygP8yEqDteDX8tpY5z
 eW0kKA3382JwoofC+QG4eHfduA==
X-Google-Smtp-Source: AA6agR7cfm64Y6GBFeSO18v6MzV1E5WMXn0USHffiVixm1IpLgTYtoCxMdxCHJ8TpfOA7GHPubr/eg==
X-Received: by 2002:a05:6512:2349:b0:48c:ee14:7fc with SMTP id
 p9-20020a056512234900b0048cee1407fcmr1125838lfu.71.1659953780871; 
 Mon, 08 Aug 2022 03:16:20 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a056512070200b0048b193f677dsm1377489lfs.178.2022.08.08.03.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 03:16:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Mark Brown <broonie@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] MAINTAINERS: pwm-fan: Drop Bartlomiej Zolnierkiewicz
Date: Mon,  8 Aug 2022 13:15:25 +0300
Message-Id: <20220808101526.46556-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808101526.46556-1-krzysztof.kozlowski@linaro.org>
References: <20220808101526.46556-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bartlomiej's Samsung email address is not working since around last
year and there was no follow up patch take over of the drivers, so drop
the email from maintainers.

Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I assume that if other change was preferred, there was quite enough of
time to send a patch for this. :)
---
 MAINTAINERS | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 423c81f8ba61..4832b317fe05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16529,14 +16529,6 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/usb/pwc/*
 F:	include/trace/events/pwc.h
 
-PWM FAN DRIVER
-M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
-L:	linux-hwmon@vger.kernel.org
-S:	Supported
-F:	Documentation/devicetree/bindings/hwmon/pwm-fan.txt
-F:	Documentation/hwmon/pwm-fan.rst
-F:	drivers/hwmon/pwm-fan.c
-
 PWM IR Transmitter
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.34.1


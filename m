Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0D4709D2C
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978CB10E5B0;
	Fri, 19 May 2023 17:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3EC10E5A6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 17:04:08 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-510dabb39aeso4501874a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 10:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684515847; x=1687107847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1dVkVm60owDC6JSzPARMnl+gul/1/pxMfMjEQitNv9I=;
 b=I6BX/OCq0V/akGco+l/0H4GeaSh7ChmeYNKOuUp7wIaW2ZO3Nir/gbUo34ov/BbbNA
 s346zCmhh1Qt0CzHHcao4ykKmigfv3kSh+20tYSasmtTOdlyyU9mL1szZNCBXH8It6mK
 fba2vffHbKsDiZsqxchLCiYFAV9ccD21h+a6aUtmus21pA8ZxVVSDx+IMxp2wRRoRbMb
 3YGa9jSfX8P2143/jgIXUngL0hl2GmRKZlf0jYW8VumyzOD8xpdA33TafTP+SmLLMZlY
 TrZONhgWwqdInP/HM3bSQzyqZoMDcKG+MvLj/AVwU8qetrUp7NyBy4w+OIJzim+s6ro0
 rcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684515847; x=1687107847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1dVkVm60owDC6JSzPARMnl+gul/1/pxMfMjEQitNv9I=;
 b=khbzKi34p8cK2X2wPeJMtQ6WfTbmRK8bGt4jAyq5PidHLImGhipxJav3t5M8XHMZIi
 HPVj8J5AqVD2vJFHVuskVZOKVgfCZ4dhENmncyjyTtqjQQIRF9Ed4nH/JJDqTT3RfRtl
 4VAiwEVOMH/28yyFK9fT87kpprHidEg903vYrsyd9+uSr5EjTEDdFt5tN2rpLJDs+Gwy
 zW00Su9roJDAGHnM0fpK/SYcd26q7rg3yJLX6Y96m6c5lPgLDo6u5vhHm4m76q6JHms5
 nJ/RtqXtO+x0zxWr+IGqvZFIsU8kpKIRQJF3k0KViqL2zgES3oLSsNIwS4IJRWR7iLzg
 D+Xw==
X-Gm-Message-State: AC+VfDxL7nT4SMshXpuzVg0rFFCxQI3TWC0ypCNGTNJ1BWngsvyP0WAQ
 m2gY0TOzRcWSOOojXiqVc+8=
X-Google-Smtp-Source: ACHHUZ6+1t44ouGqhWp4W8tIAhR1PIcUO/ZWAT95WAs0wVjJJ2TAyw92KSvswc70U/jJMKs3pYqr6w==
X-Received: by 2002:a17:907:7f8c:b0:94b:d57e:9d4b with SMTP id
 qk12-20020a1709077f8c00b0094bd57e9d4bmr3007224ejc.2.1684515846457; 
 Fri, 19 May 2023 10:04:06 -0700 (PDT)
Received: from localhost.my.domain (83.11.222.198.ipv4.supernova.orange.pl.
 [83.11.222.198]) by smtp.gmail.com with ESMTPSA id
 mf13-20020a170906cb8d00b00965ffb8407asm2489988ejb.87.2023.05.19.10.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:04:06 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH v5 3/3] MAINTAINERS: Add entry for Samsung S6D7AA0 LCD panel
 controller driver
Date: Fri, 19 May 2023 19:03:54 +0200
Message-Id: <20230519170354.29610-4-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519170354.29610-1-aweber.kernel@gmail.com>
References: <20230519170354.29610-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nikita Travkin <nikita@trvn.ru>, Artur Weber <aweber.kernel@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as maintainer of the Samsung S6D7AA0 panel driver.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 402e26d0cdbc..7cc2bfa4af6f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6663,6 +6663,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
 
+DRM DRIVER FOR SAMSUNG S6D7AA0 PANELS
+M:	Artur Weber <aweber.kernel@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
+F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+
 DRM DRIVER FOR SITRONIX ST7703 PANELS
 M:	Guido Günther <agx@sigxcpu.org>
 R:	Purism Kernel Team <kernel@puri.sm>
-- 
2.40.1


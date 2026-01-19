Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E5ED39CEE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 04:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9F310E33C;
	Mon, 19 Jan 2026 03:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b7et5tAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD18C10E32F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 03:30:53 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-8c530866cf0so382646585a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 19:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768793453; x=1769398253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xiNtJwtw05QrNdGwEwvWFIn9UYOv/0m3Dr4ujrTo53Y=;
 b=b7et5tAF8NQBhdZjhN33Bfd+NVG5MKpmzufCxZTo43axZtNvqiueWQ39WJ3yn01OU2
 vT7b+faDAuizLqYS6MHux6UT/H53QpPSuefdwj2D59l/K6LtBYaZoF1VdA40vdCPTLfz
 fwDkDpo5iO+in5nErjGvaEDaIXulJ4hItCyyV05jskYjbYqTxQMaxLSB8DHUOKlbQblJ
 6BfUlQC9HsQ9ya8gx9qQkIpMJ3sx+yxyu0XegenFs9N2i3pMgOFhuUbeAalYyzl7cVrI
 W+DiK6c0I5mY3Pn4LmYWk1sYTF+ptH1v5+vyvIx7PLBE8URxo76HDYgGpnAhLIbruNtW
 M6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768793453; x=1769398253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xiNtJwtw05QrNdGwEwvWFIn9UYOv/0m3Dr4ujrTo53Y=;
 b=FjlJzWc+LhUea+J/X5KJHbcweZOPX3gg0+hnOjrmJsz3Az6jBnomCMsMzwAC8J/g9u
 ll06hnXY21mVRLXCH5ktfpXCxVvwz7AQ+IR5fnmyAH4raUHMXday9R84eruX1gB4jKDb
 WnXsxDvMZIyNYU/GLx7aF04kPC2BZMXYd7c/6jtlfeqpEdaREeVGY9NLznngQEeMAF+Y
 dRoQht3vEvaZC4qfoXfV/4enFSj4m+zrz+ia6kLXpbgLyuLbPXsRgX0S77jTkalGGwL6
 4s76d1Xz7hrfGh2iZDu1j53yFf3SScf+jab1PY9+r3vKXbmUUYGJC1S1vqe0svYDeDnA
 wn6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZKYnxYIRw0b3QzsPBLQALJwJkRjrEy5lfyH2Y8yY/Nrkrfy3e8SQBLNO/gdgHJ3De1DRQ62llVMg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEQeoq6hjuaqBCa5yQQVl9w001Nf+r+G099nahzgHYr47VkpKS
 8Pb4deQHuV4sCR2aD6VcBIK0BVnK+0OYtKY/rbK0TKwHopeN79IJmHyt
X-Gm-Gg: AY/fxX5OkHBoQnpG/3Bw/fPPQKb/v5xtbsIdKuLeXBo+uHpm0nTQ6zxgfCV0RNZQNoY
 x95T1RHucdO/p6qSYJznNVlyFS7XQmTQjsoYOwMowvv7cNQsU1cawR5VxouipIN1LaMd+q2Q0XX
 wL1OEcjlaiehcin/C8QIVaqarQ8EhYxrwwjvY7NOTHssLNdl1nwU21leEjmL/yCetziZrErnl81
 vxwP3jr/ulwt28XBx25xa7kpGNBlXE//H2WMzHjv0wQdn8KeIFimOIGq2lUsOM4EEd+Ylu4grSb
 gFKX8MYmAXLWq6qVLRldGlU7AsvWToLBopC2nOddiWxagjcWPva3J991Un80wbnMKM2mXilkC9t
 Fc/ucOOUr7P+Q3HNhsa1fxGjPhjMN0pKr9G0KOkCExZRzWeI3nRcDOuigYSk4TAxB4CkmYEZKWo
 gzOtA+T60vsbcpNx5WMVv/cwokvJ2TPV8EFqCRHkIk4FyhyodWyWcQCq74zN7HiA4wvz8=
X-Received: by 2002:a05:620a:448e:b0:84f:110c:b6e8 with SMTP id
 af79cd13be357-8c6a678b831mr1437612485a.68.1768793452693; 
 Sun, 18 Jan 2026 19:30:52 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:30:52 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
 rogerq@kernel.org, tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_jesszhan@quicinc.com, bavishimithil@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH v4 07/10] dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0
Date: Sun, 18 Jan 2026 22:30:32 -0500
Message-ID: <20260119033035.57538-9-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119033035.57538-1-bavishimithil@gmail.com>
References: <20260119033035.57538-1-bavishimithil@gmail.com>
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

Add samsung-espresso7 codename for the 7 inch variant

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 14f1b9d8f..d8774c676 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -144,6 +144,7 @@ properties:
               - motorola,droid-bionic   # Motorola Droid Bionic XT875
               - motorola,xyboard-mz609
               - motorola,xyboard-mz617
+              - samsung,espresso7
               - ti,omap4-panda
               - ti,omap4-sdp
           - const: ti,omap4430
-- 
2.43.0


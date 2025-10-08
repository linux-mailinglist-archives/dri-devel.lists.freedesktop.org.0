Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32954BC391D
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751D410E0B6;
	Wed,  8 Oct 2025 07:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N91Sqd1p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB7310E763
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 07:31:23 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-58afb2f42e3so8512888e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 00:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759908682; x=1760513482; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=enLEHKOtNTzkrWiTnMIts9Lyjvegz+xp8xyikQdOjDk=;
 b=N91Sqd1ppdLQHOpBhE4UvJafvRXMm8781Khxh02rNz/3OjaaxSVuXfPRczzOkpS6aY
 FFyYyvidLq9FfqljEnMLCcqonjFy1sUWasH2fdRy1gI7Av1a5P+TwFLv7c60Tq7OG+y1
 saWf45W7jT+IOWlyrOnKjK2yDUkVxHMI5Nz2HXA8guw+h/aa0rUy/03xWXo+uI+z5odQ
 sqkUgd5sR0XLzqvfIvnVgz8WxUfW+nrlSxi7mqtY8GIJ9ekvB7fxv22gfr5fqNGHx2m7
 Pr3EJnvHgFiOittgw1W31WTjLduQFsa1VNPsvXUUJnPnx2Pq5C0kpVjNNOOKChHg5jDN
 Tl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908682; x=1760513482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=enLEHKOtNTzkrWiTnMIts9Lyjvegz+xp8xyikQdOjDk=;
 b=t9ZeQBPpsptsPnVdNRZB5/JOPTggRun7xRMiYwRqBBBYoH6Z+nbhJYQKkW51KBObtt
 3weRfZ8dsgpSorXPybdiZf1UmdmtCJ9WTj4KrHfTMTTDHaMoToZK3VJLxO85MgadufyU
 GFJVVho6Zk/owBDANfK2/vE8eHMYdE4A/Sfa8ckCU2rZHjp6ICu7ab7YsLwbPpj8BF6I
 GWFE82Xxu2sTj//NpE2PnHy6Uz3L7St5+NWjxFJ7zXI8Id0GfAruTnkscO1Hz+GhSTPt
 ahV/eM0L6eFGouE36zTr5Eyk5G1axPZlyGrS6wDz6/vmwpjUpz14+K/uJBUULCF5ctXm
 1NKw==
X-Gm-Message-State: AOJu0YwcQhO2I3bMJ4LihUzRa5kC+KH/1AzOOjIXqA2IRdw6bH/uTB/r
 klbUhjBhfqVEkObnx0QDAwgiqXTyBHquMhDjtvRCJxotn5biYVZNNVL9
X-Gm-Gg: ASbGncuI8aIFXF95Zl4Nwkt7HSf0Iihvxog9PnSLjo4RnoJ+kM4wkS3M/nCM1f5Mkff
 YqKVzkeyN/uypVq4UQ8hXJ7TOz07s6FV3pfuvh+pp3YxT4TlArv14RWzNqN3sOUAgyHrUhLnuwV
 IE4Cz5fZzYm5XePUzJRduVa3+ER1MZ82H2MYSKFGe96VmT2hUC+ompAK0BMme2pVJLUotUn4Wiy
 N5zBAk80e9ptJI0aSB3RhCv1p3EYVlfoCX7QJ5luZ0Sa2mSHjE7CHcHjQsS8/3/GzxoiOxV+2JV
 RnXSYHEoqbESEZ221GiHmeJOHErwrrAvrHjIxo17Pz9Wp50P1F1aCvmdcaPoc57TzMBD/3Lvl1L
 t50KW6IicVYTGAu42CFGgN1wsLIYmX0i+IHpluw==
X-Google-Smtp-Source: AGHT+IE6CzpQ7p9cWL2g2u1KCij/uULFzIog+MKLpggK4YVhbmnkBbPJg12jiL753WYqBvss1sNwdg==
X-Received: by 2002:a05:6512:ac4:b0:581:7f39:d34f with SMTP id
 2adb3069b0e04-5906dd74a07mr738319e87.43.1759908681823; 
 Wed, 08 Oct 2025 00:31:21 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 00:31:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v4 05/24] dt-bindings: display: tegra: document Tegra30 VI and
 VIP
Date: Wed,  8 Oct 2025 10:30:27 +0300
Message-ID: <20251008073046.23231-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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

Existing Parallel VI interface schema for Tegra20 is fully compatible with
Tegra30; hence, lets reuse it by setting fallback for Tegra30.

Adjust existing VI schema to reflect that Tegra20 VI is compatible with
Tegra30 by setting a fallback for Tegra30. Additionally, switch to using
an enum instead of list of const.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../display/tegra/nvidia,tegra20-vi.yaml      | 19 ++++++++++++-------
 .../display/tegra/nvidia,tegra20-vip.yaml     |  9 +++++++--
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index 2181855a0920..dd67d4162884 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -16,16 +16,21 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra20-vi
-      - const: nvidia,tegra30-vi
-      - const: nvidia,tegra114-vi
-      - const: nvidia,tegra124-vi
+      - enum:
+          - nvidia,tegra20-vi
+          - nvidia,tegra114-vi
+          - nvidia,tegra124-vi
+          - nvidia,tegra210-vi
+          - nvidia,tegra186-vi
+          - nvidia,tegra194-vi
+
+      - items:
+          - const: nvidia,tegra30-vi
+          - const: nvidia,tegra20-vi
+
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-      - const: nvidia,tegra210-vi
-      - const: nvidia,tegra186-vi
-      - const: nvidia,tegra194-vi
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
index 14294edb8d8c..9104a36e16d9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - nvidia,tegra20-vip
+    oneOf:
+      - enum:
+          - nvidia,tegra20-vip
+
+      - items:
+          - const: nvidia,tegra30-vip
+          - const: nvidia,tegra20-vip
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1


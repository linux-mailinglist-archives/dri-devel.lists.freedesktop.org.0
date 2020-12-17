Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8B02DDF9B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4532089AA2;
	Fri, 18 Dec 2020 08:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB546E1E8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:29 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id h205so16299617lfd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yP8wRMt2G/dKkoQz0kDkh+VFFd+KrJNpavXd55zD7Hc=;
 b=Eevxt/jmSiXEagYpaEv4vTmdCIDS9N1+4fjs6XIYwYipyv36lpsy/C6pKYbwX3UiQu
 VAu1mRAoSEvOvC9CFXWr2nMYvvWgaq6SnOLErxU8ODNmC5j5jGOa6Ib2PM6ZcCqmH38P
 /ms4L91GUDsLbCwK3p/ykpA37+zlTT+eRvLma64wIszQWtha25BPEQkFpHNddqKyWQfT
 +buwKXxL3bX53bNkQosbcNQQk/A6YGx+HMISS5X5MXNlAcmh2539N1EunFi1fSgAdPPc
 lZu6y+bcf9lMXUeX6+mQg1Tjih0kF9Uxcyo55RH6sXDp4bTnJ3oHXwSLox21wctsWd9N
 I+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yP8wRMt2G/dKkoQz0kDkh+VFFd+KrJNpavXd55zD7Hc=;
 b=fiX42H3BJTkGlFau8yY5ozgrOlvuWxo6dgvxYc97MPt/jrJYqJ9KaG+395ep3F/3lx
 GIM0riFy//oZUrr3FOkOR2LNyxCpJgdfYZpj+Vu+cZuMcl/OlkGr8jr+dSihitrl+Yfa
 tCze7yhq9KQBM6IPmfn1vjntSToVXnYEFapLbKhDD/NefOxyJ+SeeaA267dwP5KaMRlU
 J5J2wFXIzAkUuEoHJWJs8v+72zbRIa4SW5rgpJ2tTp+a/9lEDCtIMu5tDx0/fTCuoZow
 DT9bmPccEXsnsly8id4QHo2dSSKLWX66yKrwngI72nna9sBp0svuVTZBYqXOzZywNQkD
 bPFA==
X-Gm-Message-State: AOAM533daFiKaIaYV9VPzKL7Uj85/mBqOjdVaQ9O5uKWTIPXLPNFjTeu
 Ch/Ag13A4DuWZCSxT1JDUZw=
X-Google-Smtp-Source: ABdhPJxW3mip7l7QnT2EdI9cbqOdB8U51k+kpDGMuuvT5UJhcE0JXjG8oIyqWzLDIWmT1OVJbpI9yg==
X-Received: by 2002:a19:c3c2:: with SMTP id t185mr1565lff.104.1608228448105;
 Thu, 17 Dec 2020 10:07:28 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:27 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 07/48] dt-bindings: arm: tegra: Add binding for core power
 domain
Date: Thu, 17 Dec 2020 21:05:57 +0300
Message-Id: <20201217180638.22748-8-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All NVIDIA Tegra SoCs have a core power domain where majority of hardware
blocks reside. Add binding for the core power domain.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../arm/tegra/nvidia,tegra20-core-domain.yaml | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml
new file mode 100644
index 000000000000..f3d8fd2d8371
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20-core-domain.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Core Power Domain
+
+maintainers:
+  - Dmitry Osipenko <digetx@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra20-core-domain
+      - nvidia,tegra30-core-domain
+
+  operating-points-v2:
+    description:
+      Should contain level, voltages and opp-supported-hw property.
+      The supported-hw is a bitfield indicating SoC speedo or process
+      ID mask.
+
+  "#power-domain-cells":
+    const: 0
+
+  power-supply:
+    description:
+      Phandle to voltage regulator connected to the SoC Core power rail.
+
+required:
+  - compatible
+  - operating-points-v2
+  - "#power-domain-cells"
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    core-domain {
+        compatible = "nvidia,tegra20-core-domain";
+        operating-points-v2 = <&opp_table>;
+        power-supply = <&regulator>;
+        #power-domain-cells = <0>;
+    };
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

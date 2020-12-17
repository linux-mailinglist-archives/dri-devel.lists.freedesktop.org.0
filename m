Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6612DDFEF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB8B6E062;
	Fri, 18 Dec 2020 08:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DD76E1BA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:23 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id m12so59846982lfo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wRLKIZbWYzVgD4/h7Q5pP/dMfh/6wK4T7bMtKrKWFYs=;
 b=nof46WJOEl3Od1rTO/2BYq6/+zk+zJ/AGmoG6erIC0+tgB/oIvdBZAktAlSvQoEZb/
 U6iFxEOBIugW299jwIFrWQ6bsT+VhSHlPUZ5crYO8SLL7E1ykhQSbvIOGz95lEK1CD1l
 xurdMXdFJ5bUbCKqPxQGL7MSkYrWUwxbVJS+pOaZ6U3PnQamubXJPaPBtEvoLE4NlBzS
 h6H+Hw6LLV7UvSbjkYoDkkk0kKwliK4ss66ReUrsUlErK+ZcCXIseijPZVZu6jr9Azfu
 2zvdUbpZW4E4SSI1d19fss7CvalcS3mCXXdnQe9Z374JJpshKOx9EGWBuFbOaGLwTIwv
 xBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wRLKIZbWYzVgD4/h7Q5pP/dMfh/6wK4T7bMtKrKWFYs=;
 b=f3+fguO1x22t56ZeJSLtlAgvEkrPigCWiJ2FNJ01kv7Hk2WUbhCAFY1nrZ82cY1JrD
 LR1NsLHrQ37nPctXWU7zfFbpPXJJgZzoxbmMFgUb++ejeu6n8rp+L7SYVvhXEs0ZhdRF
 z++9wpPHOPyLpuli0n+xnDxQn33992+Eu7BbIdSQx+4MriCCrDXrWjTSQkL0EfC5fwGG
 7O6Xo55Qcpgo5fZxlptQJU0sVTuO6dG46xtwr3saEEEXi7GLHUcoe9OkkSBm8AClZro0
 9lmHzX5nL8GozAvBzGY3hDx1nDU8TME9BXO9ONNC8zIzp6wBSbGLrjKvWT142LUdO5XB
 SckA==
X-Gm-Message-State: AOAM530oZzIYAavob3vpJfsJYRVokEsabRePyXul33gpxsI0fACdj0jg
 5seSKZbdQsw2+VmBh/i26V4=
X-Google-Smtp-Source: ABdhPJydLEQpauRBVKAwEa9RLHoou8ZxWlTRtLTcNVXWexn3xCJmbfFa9KYDYb9Npu8cupsJwFP+AQ==
X-Received: by 2002:a2e:908:: with SMTP id 8mr240132ljj.52.1608228442259;
 Thu, 17 Dec 2020 10:07:22 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:19 -0800 (PST)
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
Subject: [PATCH v2 02/48] dt-bindings: memory: tegra30: emc: Replace core
 regulator with power domain
Date: Thu, 17 Dec 2020 21:05:52 +0300
Message-Id: <20201217180638.22748-3-digetx@gmail.com>
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

Power domain fits much better than a voltage regulator in regards to
a proper hardware description and from a software perspective as well.
Hence replace the core regulator with the power domain. Note that this
doesn't affect any existing DTBs because we haven't started to use the
regulator yet, and thus, it's okay to change it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra30-emc.yaml     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
index 0a2e2c0d0fdd..7b4af9169b0b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
@@ -39,9 +39,9 @@ properties:
     description:
       Phandle of the Memory Controller node.
 
-  core-supply:
+  power-domains:
     description:
-      Phandle of voltage regulator of the SoC "core" power domain.
+      Phandle to the SoC "core" power domain.
 
   operating-points-v2:
     description:
@@ -241,7 +241,7 @@ examples:
 
         nvidia,memory-controller = <&mc>;
         operating-points-v2 = <&dvfs_opp_table>;
-        core-supply = <&vdd_core>;
+        power-domains = <&domain>;
 
         #interconnect-cells = <0>;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

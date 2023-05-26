Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6488E711E44
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 05:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740BC10E79D;
	Fri, 26 May 2023 03:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05EB10E798
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:06:22 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-77491a28035so36039639f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 20:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685070381; x=1687662381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DRTsj12b6O33FC+cr8c7BPZ01uR7I3K/mmxNkVF4jws=;
 b=WmIQ59Di4v3M/mXQbgwi2pQoRYZielG4kZCCoqzPisHE+8DjvztO76vbRaQG41IpE/
 95lE0AlZ3kQ+DZ03BU2On7Il7WUetoWIgnXteDV7hCia8s4+hZ/U/lRjylif0+1OhpbU
 5zVh0qb6kiwihMfRl36/KV8/loJcBiqqNBhwUSf/509WIfn7wmcbl0/ghiMHvEAE1KMj
 FE9JvYu75N8ewqC6Y2m8ynZ8eSAVKw/tzQ7JOKFn5l8EBHCduhYVk/s06zw03b/pKn4W
 VU9ruuT8LlTE7rRxUVzaGWaOLSrc50RqgmJUK6RQpgR9dH9Y/8oFIvuta8ITbhNyDZ/J
 X05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685070381; x=1687662381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DRTsj12b6O33FC+cr8c7BPZ01uR7I3K/mmxNkVF4jws=;
 b=WfRNXiqkIacgntOckpklUZKj1474V+DhuoYoS8qI7aV0YpAdO0n5G16bLTDpkO8vhB
 XOapBTh4NtYnS9aE+C+UBwpwjx1CkegNhweTAHq5MzJlL2x6PKzsq9jk6XixOhtG8d1v
 KEyqjKKIWCNJOcyS/+Ra7wbi9STuTIQi4OwsNEs7jLuaokCN5B9F6YdTEd88Jqk8KNaj
 Q8KQV02Q/jqNPBrh5nQqr9bFN4YixhFyqKhwlrc+fPiDVcZXTYEEuNEDv5OUBuU6sbNT
 DFLUDHYahOm5i24rgql6vu/Hdu9RfVSetSmTJeuPTCRFIbILnujMR/6HrMAkuCMjnLTD
 eoSg==
X-Gm-Message-State: AC+VfDzP+zL6dR42NZ30YnBeFaENyhgtFO/C3I8zCqAq7YivrxQZG+Hw
 fNCBb6kLvWtXaTsCO97i6Mi9JHdcpM0=
X-Google-Smtp-Source: ACHHUZ46ETqqCYSYeOAgsdP4uUnjzzJzPtujOlWTViqpEcR6iNPvd45x0tYH4YmDMzJqwsndOmzppg==
X-Received: by 2002:a6b:da0e:0:b0:774:8a30:a928 with SMTP id
 x14-20020a6bda0e000000b007748a30a928mr162926iob.5.1685070381381; 
 Thu, 25 May 2023 20:06:21 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:3dd9:3f6c:9922:6420])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a5e8502000000b007702f55116fsm363189ioj.38.2023.05.25.20.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 20:06:20 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V8 7/7] dt-bindings: bridge: samsung-dsim: Make some flags
 optional
Date: Thu, 25 May 2023 22:05:59 -0500
Message-Id: <20230526030559.326566-8-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230526030559.326566-1-aford173@gmail.com>
References: <20230526030559.326566-1-aford173@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the event a device is connected to the samsung-dsim
controller that doesn't support the burst-clock, the
driver is able to get the requested pixel clock from the
attached device or bridge.  In these instances, the
samsung,burst-clock-frequency isn't needed, so remove
it from the required list.

The pll-clock frequency can be set by the device tree entry
for samsung,pll-clock-frequency, but in some cases, the
pll-clock may have the same clock rate as sclk_mipi clock.
If they are equal, this flag is not needed since the driver
will use the sclk_mipi rate as a fallback.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../bindings/display/bridge/samsung,mipi-dsim.yaml       | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 9f61ebdfefa8..360fea81f4b6 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -70,7 +70,9 @@ properties:
   samsung,burst-clock-frequency:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      DSIM high speed burst mode frequency.
+      DSIM high speed burst mode frequency when connected to devices
+      that support burst mode. If absent, the driver will use the pixel
+      clock from the attached device or bridge.
 
   samsung,esc-clock-frequency:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -80,7 +82,8 @@ properties:
   samsung,pll-clock-frequency:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      DSIM oscillator clock frequency.
+      DSIM oscillator clock frequency. If absent, the driver will
+      use the clock frequency of sclk_mipi.
 
   phys:
     maxItems: 1
@@ -134,9 +137,7 @@ required:
   - compatible
   - interrupts
   - reg
-  - samsung,burst-clock-frequency
   - samsung,esc-clock-frequency
-  - samsung,pll-clock-frequency
 
 allOf:
   - $ref: ../dsi-controller.yaml#
-- 
2.39.2


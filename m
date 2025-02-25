Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F43AA437B2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 09:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D801E10E42B;
	Tue, 25 Feb 2025 08:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IhjglspI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4416D10E183
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 08:34:12 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ab744d5e567so900764266b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 00:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740472451; x=1741077251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZbRg4EAl+//ILxj7dao5FHZeWZVMErRSC6VDwPgGXM=;
 b=IhjglspINqY01ihoMYqYF7YEegdgDX03oZAnNXy0yHVw9gSLzv73301AjhNqdJMT2z
 4aAHchjkRgKQWfmHIZUu2OQExK6XaoLXqXKB+SqWbtk0AjuFR675QX1N+UQcRQvo0DCI
 lFUMWD0oOxNwD8IHGz5Kb/tNMt6JoWZbMhFg0IIxcf/W3Bmbmnd8LEcINwnBdzalU2wD
 0fPS27r+0f6BDIcHrERNrJ/Xl9qSxWn3Hzd2KesGyjhKdai1EZqI3RmJ/J+setvnup42
 k0d4qGDCcMKjvzdzvGTABDnp+yab67fvn57f/jBm88M9nYhzI2k47u8F0PAzGldO/bP7
 4sDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740472451; x=1741077251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZbRg4EAl+//ILxj7dao5FHZeWZVMErRSC6VDwPgGXM=;
 b=jBlWgTzVCulg8jZJFN80YxuCZzbeNkjOHZxoeYzPjVURpDUg/1bhVBjvcx8Ns1crW9
 pn9nk595qq/5o4TsxDxcuJE5a1VXkgzMXG/m+HyxUjCGqkwW7llr23M2sQYzt1VUm/7a
 uBAUGdNuM8U0mnpsuuKczjKJncM18KoNrrHG4eSZRsyNpkphHV5KDmvkvtzSIPXuB+sy
 MJfDPRWNu806tAeo5/925qA5u7PEaQ61YcIqwjrx7HBx0s05CdLHepYEA/rvdb6jpEIc
 cwF/5stw10bSY9LiHHkVqLil4/nBf+m7D75w9gVoD7JM2TVaMCZEpk7N4E9v97xIUXm8
 mp3Q==
X-Gm-Message-State: AOJu0Yz6o6oRN6fh8P4bDUWv/oT/4oiMR24SKdB/oTVCJAum41mdJzrY
 lFvRJ3LVhiCP7eeb/bWXL4MluifkF1wHwVktOhtkMTAvKOqx//rU
X-Gm-Gg: ASbGncsG9JzG5y8ix8gQbzY5iyEmh/7r6hokvEBysDVTP+xURZ/fhxftJRIRCjlfWfO
 17UzLvMoWVm0l57J9iyBIMg/WUAbPh1W+kQ7NOLDsjTJtcD3fFUAWknTnzHzDh6lYun5gimK3Ea
 jufAM3zSaq90RfZaVfzk57Re5d7nYkP0la8VKmJ1MzVevv4KqQdPPwYMcwakyUObIk9tI6PuE1P
 TrjsIgivZseUXokh3uE61uPyxQg/BT1f+kD0koP4e4LRNYh5G6Sfij+FNJI+OO7woQOBFNvylqj
 il6N1xn/Q8gH5vy2BQ==
X-Google-Smtp-Source: AGHT+IEGBF5qqkRZGyZTUbFHisgJbw5448A9giydmOMQQcC5CE642ZPcPZEgDt4yKKSrKj8gOlui4g==
X-Received: by 2002:a17:907:c48f:b0:ab7:cd14:2472 with SMTP id
 a640c23a62f3a-abc0b0386cemr1310102866b.23.1740472450559; 
 Tue, 25 Feb 2025 00:34:10 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1cdbe0asm102660766b.36.2025.02.25.00.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 00:34:10 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindigs: display: extend the LVDS codec with Triple
 10-BIT LVDS Transmitter
Date: Tue, 25 Feb 2025 10:33:42 +0200
Message-ID: <20250225083344.13195-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225083344.13195-1-clamor95@gmail.com>
References: <20250225083344.13195-1-clamor95@gmail.com>
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

From: David Heidelberg <david@ixit.cz>

LVDS transmitter used in the Microsoft Surface RT.

Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 6ceeed76e88e..24e89c1d0c76 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -33,6 +33,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - idt,v103      # For the Triple 10-BIT LVDS Transmitter
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
               - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
-- 
2.43.0


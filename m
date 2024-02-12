Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F09851D3B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 19:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FC110E633;
	Mon, 12 Feb 2024 18:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KsSyL+ot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CFA10E6A3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 18:49:59 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-59a6f2eecf6so55662eaf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707763798; x=1708368598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZiRsZjgJE08mlqExCXE02bhHnOiYxOBr2Vmf+IkslQ0=;
 b=KsSyL+otcaEvLw3xVgCHFcbxMuBsBFB6Y89AlPfOqRkP+F3qBf6kiZCeydRTZgB8tS
 UisUMxSsrqHCutOGyeN/nKssS2yChhC1X/4z8PEq3Lhh0sHu78LcjoZfDUiOeHk8BknY
 Q3VBmOtOy2Iw8UDp5I3N9vbKexkFpMxAMzbz5ejlWkMzT3JxO80uMb3Qv7ta0vXSC11l
 uCfll+0Xai1tRCfDAVot8xXUjxzEFDWgMNVGgQE5VUFeuMZBj5I7M0rp0/tJ9BRgK7Yi
 q3P9t634hPRVhNOtxA/BFu5UD0mC+duXB+Qb60btS08NNeZg/ZHGceO+68skXvQRiFVv
 4olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707763798; x=1708368598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZiRsZjgJE08mlqExCXE02bhHnOiYxOBr2Vmf+IkslQ0=;
 b=F+tDzkSSWOU2C5Fz45QMrjqcDa9KNRsnNg8fOH5bVWOCsMyVV8cg7CjYw87cLp3YtE
 5eW1IY7kuw43wkwpgqRsHx8/O4lJh6316JHciVxMhCZGs1eRb0YmRuPirgduUQkOLQkK
 hn/Fz76QxPRhZ5cG5l7PeVBxVmnJmInV5flO9WdDwIQCTzWFC4cF+24Xap6FKe6rDuIj
 HjajMnl+ZcH+EADW1fQbLbZHMX0xdH+MYiPO1Zw7wCXp2CYXiTzjMMy3sIYOyYRvC43B
 cyh5+nwPorRtDXceLUV7M9Pb1q7RwO5WMerrK6J106WNy36Fe0Jhk+ReLoQjjxVyp2G7
 2m9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWssEYmX1MjPkCmwi/0RcOr2KuboEdoMxqP2RhG5IMTgAy+uOe5N0qovFn/+MhBkYvmtEyLucTz9d41RNDXG9hZ4SfayGVMBidHKq+NNo8
X-Gm-Message-State: AOJu0Yx6nAtE+ePMrYT3s1xeTjbaoFPvf3ScVZhsApaGPGNRcNtY67zD
 ycOOlPQTIXHcGgAAEzm/TbFCfaGNEQxKdlrRDbxLmXJWi7xJvi3OwFbBbJoq
X-Google-Smtp-Source: AGHT+IGSw06NfJXdmlcQHzjnL3FF9bOgGHPCk5XmRWBD6/JKfOeCWsmU3Ve0BIUPqa8izDBTGRQqZw==
X-Received: by 2002:a4a:354a:0:b0:59d:2163:2d6c with SMTP id
 w10-20020a4a354a000000b0059d21632d6cmr5944522oog.0.1707763798563; 
 Mon, 12 Feb 2024 10:49:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWoo6AEFNlrC3bnOrjvKOb31aIvRIF0598Zzcq9BsCtpGsYrA4fxl/iW5UZpsNBm53a9TCD1Jnuu//P/4KrigxQpIA9bkXdgxmTZvvZA8g+ovwOz0PeWkeK+ZM4Vp8RyiFtHgSGSzeu8Q91kOPDWAgyBsbLr9CIGEJ0z6q3Ek5ISWrXJrXSZ8vf2U81WoR56oZoNQYkP6EHI6TIA7hC7KJtmN0LwxtlUvyJd8YBQrswea3FlmdawIEqJOL7/iGxZQ6Q6n6LmgjnTJ44nZ+PIoUjylOYgq2CveyDVbRStx2ZvNW1rKsEqNQ6llOQ+pI5ki687bsZOP0Q31WDgbstnP3+Pq7bC+FzwoiqanoZhICF2/mNPxCSqLp8C+Sy9oprwPynv3ocB7zKO6r0P0TEqvA/2Yjy9gPMzI6+fg15PZto26pEWOwQd6CJbvDmmxU0q5PnU50mKw/dgSikuhu3WRQXwr1pAWI3E8UAzHGKsQPii9+BF3x+thkL804XYXwYn3VNFyxy3w0SYBhDN/BcnsCVhSuO/CYFSRWCEQbLyKudfjpg0xTrWmZf86WT
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a4a3407000000b0059d5360c62esm171939ooa.11.2024.02.12.10.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 10:49:58 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/7] dt-bindings: display: st7703: Add Powkiddy RGB10MAX3 panel
Date: Mon, 12 Feb 2024 12:49:44 -0600
Message-Id: <20240212184950.52210-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212184950.52210-1-macroalpha82@gmail.com>
References: <20240212184950.52210-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The RGB10MAX3 panel is a panel specific to the Powkiddy RGB10MAX3
handheld device that measures 5 inches diagonally with a resolution
of 720x1280.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
index 97cccd8a8479..8dfe8951bf5b 100644
--- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
@@ -22,6 +22,8 @@ properties:
     enum:
       # Anberic RG353V-V2 5.0" 640x480 TFT LCD panel
       - anbernic,rg353v-panel-v2
+      # Powkiddy RGB10MAX3 5.0" 720x1280 TFT LCD panel
+      - powkiddy,rgb10max3-panel
       # Powkiddy RGB30 3.0" 720x720 TFT LCD panel
       - powkiddy,rgb30-panel
       # Rocktech JH057N00900 5.5" 720x1440 TFT LCD panel
-- 
2.34.1


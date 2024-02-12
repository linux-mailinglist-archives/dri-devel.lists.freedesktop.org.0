Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C799851D42
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 19:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BFC10E7BD;
	Mon, 12 Feb 2024 18:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XU1Zx49z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FB810E7A6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 18:50:00 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-599fc25071bso2443060eaf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707763800; x=1708368600; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m8VPhUxVNMumxmegz16wtqJemHSZk+dsg1qRV02Sa/A=;
 b=XU1Zx49z4gPPipGQdlUYHaM5x57zvArlBBcqlzLHBxvPiEH9z3Jrb+1j8YNYGaKWp7
 kYKo3+b83hyhOpxEa9jASzANrHDQC1YTPzwGIISC+W454/qS2zclHMLQOf1Q38VZPkZl
 WJrjsFUhk+8NcXXQVmZ4bVC1XquEWm/M4eXFFQCxsX3Cm1y16AvTAu1/RDC+LYZTr9lh
 s2FOyLJbACd96U5knffd1lUTT4tKLF/g5tCgL450IPFrl0fg6CQXASF7Hxoc0JezL8La
 uXUE+9bJFzgkDS76RaqgaxsManxYKUgSlS1YVm5yp3AcV7aPD7HaIr+JZGi2GP0Q17dv
 Lueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707763800; x=1708368600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m8VPhUxVNMumxmegz16wtqJemHSZk+dsg1qRV02Sa/A=;
 b=QAeUY2VZ519lRiczLY4+9kfICA5NZTjZmbWcRq/bouBF9Zzksj9NDP0G/JUXo09P6g
 A0y0oQeYOw2J7mXmjJXZpzKuZxYiEl27qoodBM4XHJr1DwbG8Oy3ilSmS29AQlb7Gx2I
 m4M5+jkvX3p9LWdrzBRbmVnh9BEgxa/0cnwQXwlUl5BfV4ldMEKcl5cvBcG06spB1dXn
 QGO6EOvwkJSopkw1sAc5qTS0PIa5k5URz7bdOCTvz3uAEVynTZ1uKa1X+7t2DrS2VzIs
 vlEX1haXFsseBeNvAi6kYi+v3chRjvvWwoXxv6XvXC8skYJ9UNN7NBvwtReqSAdnuACv
 ZFTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiQzKT7omFmXQ9tnhukcluec5J3ze8PXFund+g5yztzRdCqqW8ip+00iJ4tdirLIcUJslLDMYrQvTk+pk7wF+6h+lyL6ogQ5k49+6MjOTU
X-Gm-Message-State: AOJu0YxVuMv7Iw9oT90XJUDNOlLqUuetHh0qV0xgbN1NF1eM7n+g0lCF
 LmaPB/l76wQbXBq0nxLWTTsUOAs0pJOzv2hABeI1UKWEhE12OlhC
X-Google-Smtp-Source: AGHT+IFwgajYnNAT2DG3t1Dz1gR/jo0jukUytaecVSmzqrrmGdGsu+3jEnD6ECto3ArNVJhamBZrrw==
X-Received: by 2002:a4a:8557:0:b0:59d:35d7:a565 with SMTP id
 l23-20020a4a8557000000b0059d35d7a565mr6684550ooh.3.1707763799981; 
 Mon, 12 Feb 2024 10:49:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUAw9xmcZUUlJhRIP1qbo/rbWP6bZX5NSRm1WiUs2cyTvXQAuW2comimjVFLv6zQTgkrTRPLnBx2oFBFI0EUvHjaMhUL9qtGeonOQfsgadEu4lGsth6yuGSBgSw8q3CFjaSDWhLpFvdzS9/sLxxo9O99OyKQY9RycEe8W6djAuvkVZ0qLGQcDUuhwvGBOSb6ONrFDBejtFeFh2J48R7vvGLWARf3JevjXO7M9AoBmCluqfME+8bAf8XmGd8pwxTN0e/fXe+Fr9TdloVoaI7iKtZG5zVvXVsyDHuRgp9WQY0cQ2Idg9tWao3U1BM4XpgHYtCqqiZli1AyFBhUv9wkfvNePGNG+7M17faLFjB8dxmhlGEpBT6AABPM5MJM2gO2vzulHIWB8S7efK1u+adkraT99kRl3FTldMGvwKhVS/AmE3hcx7hudVPtcmMxYv2tOwg5MZ+xyPl/YHVWZRPbmE0wAJPhtbRLK4tD947MRrZOEdYMuUalJN0uATIud65dgI+PRCkNb9HqvTYyTDMdqMgYVNuNeHMhMjKogUhOs2LMHKk0a8C9+X8BDaH
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a4a3407000000b0059d5360c62esm171939ooa.11.2024.02.12.10.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 10:49:59 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/7] dt-bindings: display: Document ST7703 panel rotation
Date: Mon, 12 Feb 2024 12:49:46 -0600
Message-Id: <20240212184950.52210-4-macroalpha82@gmail.com>
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

Document the rotation property for ST7703 based panels.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
index 8dfe8951bf5b..97e0d14790e3 100644
--- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
@@ -46,6 +46,8 @@ properties:
 
   backlight: true
 
+  rotation: true
+
 required:
   - compatible
   - reg
-- 
2.34.1


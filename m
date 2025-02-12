Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9F9A32D80
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 18:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF9910E0AB;
	Wed, 12 Feb 2025 17:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S+oY/VAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440DC10E0AB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 17:31:08 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-5fca38e7be6so1189eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 09:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739381467; x=1739986267; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Jbx6FcfP3bq2n5NRhn4rgJREW3IAUmWBAJQw6Shyrdg=;
 b=S+oY/VASO6URR0n+Xo3SWxOWTmEFrfzcqiv3h1PmdFNGU5IustyRaqaV6yrtYnrdKx
 No0NgreyggMQAzjUZfZsT/ToTglqVYYLR7YIrNhb09gpOs2SjNOYC8sPyJPQNG2URtiZ
 PWDe+hg3X6gMR0qUWfpnKm2hM+5ein1vWZ+P5Z6miYcZO8uDq/gDvqxWRR43LZPA+e9r
 oRHRL4nKe2uVapxtRxwlzku2rwfSR6hd7lf9HxRN7Ta/Az3ep1h1gWIR7yuMnN/m2Np9
 fIloSGfGrwZ8hrzaCJEC842T5/uWx2XftgDgbXv8RXWBOh4XSIiSssx41V+cazfyr40A
 b6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739381467; x=1739986267;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jbx6FcfP3bq2n5NRhn4rgJREW3IAUmWBAJQw6Shyrdg=;
 b=BAJBukHcDCoCXb1xmlbgiOydVW2amgqv/8LwJ+xXLL+rprE8iNV5FUY+Sh0A/+odhv
 UjmFXxlYBnlH3yM/WTo0UQuCzQqKOfNvyH7ygcvlzPCQpKkKq9I1QXsrrfQjnjoXLlAy
 /ZF3huwILy8aQv/5wJDSkKZoBxjY/a/LWCUJkxl5ikJF/uMK3ucirS+0OD2Mkki2SGfk
 iG0zHAsU/SHNQJlHFKBHTbmP4AdA8mC6iltUbdjlTgVU6ZvX8eL5yKU3ugRUvYMJXnDV
 PJi5xTOEw1UtE0UwbFs9QViKr1kxFP0FlwzrilidOzTeuHpqnBw28og6vFkwM+kgn3Dt
 nQWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTh6DMWzObCUo8yWDVqEIMlhhehPQAifJ0pr4jEj364Cwm+5eF2+jwUwnEXlr6lfrj/pgliAjRwiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzr7EUzjlQ1QFEkvH86Mh/8kacUoAy4QMw9adTAw6bHgbWDPnud
 fc7mRlWMJ4orDA2nsh4KXVGouuCF2fkajwgCk0crS+z2FO6EaD16
X-Gm-Gg: ASbGncthu447uj8kznnw7gBTonuw0HWvTBGwGBomkNuDgxwGMfDKBO5OdvkQMa/s58N
 XWfDU24aCK9mgc50/FgY2F9Te0jtWhvGnHJEX2QWpO+e4oPsOd4apaF1cewRrMGNRRrgvLdS75V
 gpp6fp++5853HmMjJvS16pTg9A9zvQYwH3rXAIbhNDLuX6wueqdrzN8ioomhiz/FOif0EUpAXNN
 rptAgUrZ0bF5hi62yj/+8KA9hxhXwrnfjvmjcj6JDmQdkQ0fSjbZQaCHI21RDn/xos6BhNyrbZ0
 UmKRNSryDQn435B9RCJM2A==
X-Google-Smtp-Source: AGHT+IEfXVxl7VC/O2TXG5AUw40jRF/jqb2tNJhJqtHmv0DAX3h4yayluWuzrQzPBPHKrw7ZeZKhgw==
X-Received: by 2002:a05:6820:54b:b0:5fa:61b9:3e7e with SMTP id
 006d021491bc7-5fca183ea60mr2464323eaf.3.1739381467421; 
 Wed, 12 Feb 2025 09:31:07 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5fc8fdcbc21sm2233640eaf.37.2025.02.12.09.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 09:31:07 -0800 (PST)
Message-ID: <67acdadb.050a0220.28f58d.f522@mx.google.com>
X-Google-Original-Message-ID: <Z6za2bhKAmHvUMFR@neuromancer.>
Date: Wed, 12 Feb 2025 11:31:05 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 21/26] dt-bindings: allwinner: add H616 DE33 mixer
 binding
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-22-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929091107.838023-22-ryan@testtoast.com>
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

On Sun, Sep 29, 2024 at 10:04:53PM +1300, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> The mixer configuration registers are significantly different to the DE3
> and DE2 revisions, being split into separate top and display blocks,
> therefore a fallback for the mixer compatible is not provided.
> 
> Add a display engine mixer binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> ---
>  .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> index b75c1ec686ad2..c37eb8ae1b8ee 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> @@ -24,6 +24,7 @@ properties:
>        - allwinner,sun50i-a64-de2-mixer-0
>        - allwinner,sun50i-a64-de2-mixer-1
>        - allwinner,sun50i-h6-de3-mixer-0
> +      - allwinner,sun50i-h616-de33-mixer-0
>  
>    reg:
>      maxItems: 1

-    maxItems: 1
+    minItems: 1
+    maxItems: 3

> -- 
> 2.46.1
> 

Also need to add constraints to set maxItems to 3 only for the h616-de33

+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun50i-h616-de33-mixer-0
+
+    then:
+      properties:
+        reg:
+          maxItems: 3
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+

Thank you,
Chris

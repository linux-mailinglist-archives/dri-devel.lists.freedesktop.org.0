Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED57A32D72
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 18:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9E010E93B;
	Wed, 12 Feb 2025 17:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jX3AqitE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD2210E949
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 17:27:30 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-726cdcec232so2067887a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 09:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739381250; x=1739986050; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=beLRCGOxxX9cpZ21JwnULP9EhaY8G7Htxn7RQieYr0k=;
 b=jX3AqitEERTZuTbz11bcrHakQwI3rZWKgeglb1tKGhG+bydAjbcVZVEyxeXHSMtZEN
 4qHVTQfXCAXF5V/SACHoj5oIpJfkkwdF5AEni2fLobIFAXh80/lFa2RUVmwrfgIdNdOr
 ARq+SF7oy2upbq7G43dJVUFaZ+0S6+x9GNK9+0eONED2VnW0rb1hIln26T+iThfDXI3b
 nvuFpov5GkVJ2ZZ2jud6OEqCYVOj/y4p+3rJRLVnnY1OpG1T2enVivwma4C3el1EfdEs
 9eliZ2S6vJkeQBhxMimVDfAaVHHpBTW5JnDc7FrYVgK80Jh3Gy/x9VdO5C5hnGD14sPg
 ZF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739381250; x=1739986050;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=beLRCGOxxX9cpZ21JwnULP9EhaY8G7Htxn7RQieYr0k=;
 b=l2C4V1rw6dxvTM0BJar7YwI0++9iSi8J6xm7E0D/QKNcsNSjsgTwTmMqewvDhvgSLG
 ry+edaZg1ha1K+iiKBGE4zopcyrp9K7T/3twpyUnj99BHOGNF8lWmX9O53h57u1adyOL
 T8BEisKLTjbhKEkBKyRGgFg4j+eefAnU0Qys4lrn0djqQJ6nfOhCXVbUO62P/xHtg/E1
 ohd5KoK4WzroMx9jYwXsOm5O5zfVvv5Kcf3vYIxA7HZRx1C9aJTQWGsMxd0sXex4pjzH
 czCoqrnfXk3f5TI//Kvg1UQ8YEDzmbiXjJkjUUC7pb6LeiO6vBjxkf/uHZ8g4wts7LiH
 rv/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCViINa65mvuLSVkyb48LUmUvmHBnmtsOS8So61fT9g68JYYFCVkI78ey0b4LK5XfHPyY7GJdGb+P5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLeZY3IpT7WTpuwqaV5ts28yb3HGVYeo5Q4dRSpxkIuUdpKFHr
 CPthKYc8gPje6p0h9t2cvt2q/DjQbt6WJdpzepNUEJjSB6hSpIw7
X-Gm-Gg: ASbGncu1RWwTnpulr8zw8glTnvCIAapZdjeprFxejvTkSygd3jyB2sOKvhIMa9yaDSD
 VREeEEYdBy7++v8fB3VAcVwgNRb0fhFBU0rSIPGRm5O5LrVWYIP4tlx1wh8RWMq6iWoDp8yZBOP
 SkWEkkL+Xye7uFpBiGlQIjw3KXY4kkxr5kbLeewp3P3RzPmGbhfAvRfG/UBw4jZoFCjiIqOMwRC
 qm8mdex0uQ38N4CcZfxDp4BkWjORHtn45b41ixK3tpX5nZBNfxgwbGCnZC88xhYOM1X7hpPwz4G
 XjDTuXEoMR4VqvsDfuc7yw==
X-Google-Smtp-Source: AGHT+IHQ+r/B4g2h4U+MDj6Kx5Km7Y0OHx/D1NpwgCExrt743LdxVlv3VXUZQzCcXj0qf+dKJIpoeg==
X-Received: by 2002:a05:6830:4107:b0:726:eff2:9b57 with SMTP id
 46e09a7af769-726f1ca8939mr2600982a34.13.1739381249618; 
 Wed, 12 Feb 2025 09:27:29 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-726af932f78sm4722036a34.18.2025.02.12.09.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 09:27:29 -0800 (PST)
Message-ID: <67acda01.9d0a0220.22ffaa.f02a@mx.google.com>
X-Google-Original-Message-ID: <Z6zZ_2u-MrZUZnKF@neuromancer.>
Date: Wed, 12 Feb 2025 11:27:27 -0600
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
Subject: Re: [PATCH v5 19/26] dt-bindings: allwinner: add H616 DE33 bus binding
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-20-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929091107.838023-20-ryan@testtoast.com>
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

On Sun, Sep 29, 2024 at 10:04:51PM +1300, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> Add a display engine bus binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
> 
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> index 9845a187bdf65..ea7ee89158c61 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -24,7 +24,9 @@ properties:
>      oneOf:
>        - const: allwinner,sun50i-a64-de2
>        - items:
> -          - const: allwinner,sun50i-h6-de3
> +          - enum:
> +              - allwinner,sun50i-h6-de3
> +              - allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2
>  
>    reg:
> -- 
> 2.46.1
> 

Because the h616 uses additional reg values, we need to change
      reg:
         maxItems: 1

To
      reg:
        minItems: 1
        maxItems: 3

Thank you,
Chris

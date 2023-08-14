Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED86077B8E8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 14:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C1D10E1E4;
	Mon, 14 Aug 2023 12:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113E510E1DA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 12:46:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fe2fb9b4d7so38714495e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692017173; x=1692621973;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i0Tyv0KmVphJ0z20dJrEQzgQtleCJHCCuv4MDudOfPs=;
 b=r7wMTgYRIZgNGkT/XoFO/w6nJ8I3Mvzdt4N1Lo412ofYgfveF31Kk35SADXVNs8BkN
 5tfeHsQ7YoCIHrbKbOIA1dlBPAKEAr84d3qDp+7t2f9qpGnY/6tz85FZIkde+X+OVdmb
 CnJmrjAMYD1VIOHXgzQgRrMIGOFDH+yZwtpQ/PFx6r4fvAlt+xzOIwLzRwENZooWCC+C
 D+BxZM+S4JqYY+8SmQZP2PdWXgXrEgYf4SMamrZMjQixtFRWw2G6aZcVlbVYhHOJqodK
 mXb5dUrUBOYGU+jUiGQXPXFEKHX/qPT774EmKlNl7LPbFhRTKHTZ5McwD7TyNBbBLXfC
 Piow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692017173; x=1692621973;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i0Tyv0KmVphJ0z20dJrEQzgQtleCJHCCuv4MDudOfPs=;
 b=IN1mQRTX9nf4qgHea0jeSzkGH9sLgyzPvtqYPGCzhHCVfCCG9y5gJt0r1xzx1GXKq6
 cQW1JBe4iyYroNjUooXP5d7ZIfXO8Drb8tObdVYmKQ/jfTTZyqcQIHz5eEu05zvBUgI0
 8FUQ4Ls3g3C28JLjggmDPzLVPTECaCrk4YIw+Wonv2pxuADjNVOiFMk4yIopJmwU0uRp
 B0YiXHdZFg2e9Xk9vPaxToLBIwNFWUhkD3HJPkq006Op4Kk4ZvsniA6P/vCSpyVayn9q
 u1G8N9UmIyCZKiLL0NXQfGZoGnKHz5anGj8GYB96k2EnpC5CzhWICGf7FO0MS/wlMGqE
 RDGw==
X-Gm-Message-State: AOJu0Yx724oOQe0RAXNgcCQJ68BRYgdkV694Jfn0rOh/+LSRh6/UPEPG
 oFqPMJf5OC0IBXws6/4tBpJhEg==
X-Google-Smtp-Source: AGHT+IGcnNO93t8qkVG3Y735XP05Xra+V4B0KMWlc1cVDIT00NklY7TjoBod3Xc6rzSu0jY6QrmpVg==
X-Received: by 2002:a05:6000:12c4:b0:317:e766:d5e9 with SMTP id
 l4-20020a05600012c400b00317e766d5e9mr7293681wrx.3.1692017173460; 
 Mon, 14 Aug 2023 05:46:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d444d000000b00317f29ad113sm14249506wrr.32.2023.08.14.05.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 05:46:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, Miquel Raynal <miquel.raynal@bootlin.com>
In-Reply-To: <20230807123138.67443-1-miquel.raynal@bootlin.com>
References: <20230807123138.67443-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: simple: Add Mitsubishi
 AA084XE01 panel
Message-Id: <169201717234.1374248.9932150559832920648.b4-ty@linaro.org>
Date: Mon, 14 Aug 2023 14:46:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 07 Aug 2023 14:31:37 +0200, Miquel Raynal wrote:
> Add Mitsubishi AA084XE01 8.4" XGA TFT LCD panel compatible string.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add Mitsubishi AA084XE01 panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=50b0cd7d3ac3e6cbd8873434eafc3076957bbdf7
[2/2] drm/panel: simple: Add support for Mitsubishi AA084XE01
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=637d3fdc109a63ed3d3864b9ffe1ae50ef57d03e

-- 
Neil


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9982177017C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9980E10E702;
	Fri,  4 Aug 2023 13:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDAA10E6FE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:28:34 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fbea147034so20075015e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691155712; x=1691760512;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wy6cMwpEJf7gKHi9mBSsBAFtdHdF/m1nv2+iWOl0BKM=;
 b=lA8UbGBHWa9eh4cUqR1ElqbUm+5BTmxCI23/n5AdIB+uLHe4iuzV8z6xg6mmqBhskL
 gVTimKIipucuk/GkaM+MUTVBYXOz1jEX2aUIcb0fW8+buxoUpaB3nxsTn2OgFs5FxEbn
 yEEoWCudu3LQl08cbBZNo8RuiQNq5bPoRQFJR6SahaWnbyEISHN8oIHd89+Q/xtlnySz
 vh2xW9leRHnBKK5jAZfZJNLuK97wjNM4mQl5/9UUR6dLVifaDeguit8Qx9ANG4Jjukyr
 EZ4zP2qy/zU/VjeGm+gqW1yL0a7x+yaaWbhPxhVT6ecLomri6ZRr0RU74ZtiOu0Bd7dN
 YIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691155712; x=1691760512;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wy6cMwpEJf7gKHi9mBSsBAFtdHdF/m1nv2+iWOl0BKM=;
 b=g6R4swVjGu1GeK5EgJijnhg0nqK8jHo/+o5woLqDf5Sm4302hLAgiwEMXttc6zjr8K
 248vRuaHoILKculN/Ny+3bCCBsKviwsaRFgNtXeTaBbI9A/oZf2Zh9PYeN4E3aj4sK++
 COZsmVEufBDYZMuGA938ZecY6N0lNyE2+GeY7Su+T2fIhT05dgqQSR/TL7rgE+3Aa3Zh
 bOYvSJDL5KL1SGy/8RI04t4xuHM/maMjciaMzVVFXT001QqMijCXEdMAVbv9tK4bwFPt
 kHdCkIYHO42QMVIfqnytpjjrHQ2fRchzYkDwO/TbXO46K2Qpdt8dOpSfIxCpe9u0iCxq
 Uleg==
X-Gm-Message-State: AOJu0Yxs6UfcvAxvn7LOvdWUH2S6EG0GeFCz+v6Vnm96RrbrvaBX/T/b
 XuL9KAMEJ197hvxoP38otNm0Lw==
X-Google-Smtp-Source: AGHT+IGo/+eExp68vdRycdBrLmkZgZlg8mYAJJ9wUXTn/JnhhARqgHF2RquM65OX4q76G2HMQLtkjw==
X-Received: by 2002:a1c:ed03:0:b0:3fb:a102:6d7a with SMTP id
 l3-20020a1ced03000000b003fba1026d7amr1452813wmh.28.1691155712555; 
 Fri, 04 Aug 2023 06:28:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a1c4c16000000b003fbb25da65bsm2376182wmf.30.2023.08.04.06.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 06:28:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20230718-feature-lcd-panel-v2-0-2485ca07b49d@wolfvision.net>
References: <20230718-feature-lcd-panel-v2-0-2485ca07b49d@wolfvision.net>
Subject: Re: [PATCH v2 0/4] drm/panel: sitronix-st7789v: add support for
 partial mode
Message-Id: <169115571153.3578872.18363696877056679557.b4-ty@linaro.org>
Date: Fri, 04 Aug 2023 15:28:31 +0200
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 04 Aug 2023 15:02:31 +0200, Michael Riesch wrote:
> This series adds support for the partial display mode to the Sitronix
> ST7789V panel driver. This is useful for panels that are partially
> occluded by design, such as the Jasonic JT240MHQS-HWT-EK-E3. Support
> for this particular panel is added as well.
> 
> Looking forward to your comments!
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/4] dt-bindings: vendor-prefixes: add jasonic
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c1e98bb9e69f49e16c34c1cb48bcb5b0f0cb064a
[2/4] dt-bindings: display: st7789v: add jasonic jt240mhqs-hwt-ek-e3 display
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a5382e358e56f3bef13aae3432bec906130b2074
[3/4] drm/panel: sitronix-st7789v: add support for partial mode
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a82db60440c552b1def32ab33b642454490d850e
[4/4] drm/panel: sitronix-st7789v: add jasonic jt240mhqs-hwt-ek-e3 support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0fbbe96bfa089c3758a7d1969ff34036d3f03d68

-- 
Neil


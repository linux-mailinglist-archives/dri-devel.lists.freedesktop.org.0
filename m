Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750E1725722
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB4B10E459;
	Wed,  7 Jun 2023 08:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C2A10E459
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 08:15:20 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f732d37d7cso42337065e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 01:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686125718; x=1688717718;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qgIJSCejdHbYC6I5SehTRhoGCRpBeLeg1t9A/6zhpJo=;
 b=CIa64ozSdrDVRVg1jUgCTAiz36xySfnySuAigODI+An3r6XQLwAc3N8g+VaXmEjiEg
 He1RlJVQUxoLOzw6647ujk2cBWuG5dLxGbvmEZLSDY/gUh0iyjzUzrkaqmUzjpAHIVto
 lNKKf85hRuxVY5yhehspifd10g2gJM3UEbPTZy8ervc6l0QMC7MVrs7qvS0wu/HlEg80
 1VnX3ZT8NUJESTVrBaVbM2EbqeHm1gyq8NkjCit3BV9MxDJJala3XneiAODy5RWorTMY
 SR8xwkEIMgMIl5LO04gTuqe42G4s/GQE4SzegI6ubCioeBvlyAmb1IvNom+TsBe8gpYj
 WQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686125718; x=1688717718;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qgIJSCejdHbYC6I5SehTRhoGCRpBeLeg1t9A/6zhpJo=;
 b=GzYJ4V32iCcCU9M0Q/ShpLXe0LP7vabyD0i3vUx6zq74A4tAJ52OfjP4M9NhC5J+pZ
 duDHZ1kE+TyaHiXHrJGDhFnrL9wtXfaN+jv65cImYUrOWH6VCITvIy5iGcBlQnwGkQkW
 lZQGtp7jUjexhizd1ZMQB2fpBMCLiERuJrN6Q83FHAJuDjL1pEBUpzCF6RJgZYylnDDu
 ye8sFmCq7OtTOfDtCfiaHL2RuPgbilmD8dBxii+WD7KgwKqtwjcCaxezp1tvl+yZ6nMn
 4K53ttxbAJ9qF9lpk2LBGJQxCiUwpG7a1fUYnhI7V/6ew5g2O5cGjZ3yC+TEoGYSDgyp
 cUow==
X-Gm-Message-State: AC+VfDxMxKV0WCznSouZomtOxBUIPV5h//UH7UdIdNPeIMyk3BKEH1lw
 bC1nCEg1M70yh9d6h7HzPyRDog==
X-Google-Smtp-Source: ACHHUZ5tk6FymA5P3QCBia2YNIyTmWdjetu2eTi8qhNYTXKqJxyKEcwTWpSXM+EeMCN65Vy6Ap03GQ==
X-Received: by 2002:a7b:c411:0:b0:3f7:3545:4630 with SMTP id
 k17-20020a7bc411000000b003f735454630mr5745200wmi.20.1686125718557; 
 Wed, 07 Jun 2023 01:15:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a1c6a08000000b003f72a7918e7sm1228212wmc.45.2023.06.07.01.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 01:15:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [RESEND PATCH v2 0/6] Add display support on the
 stm32f746-disco board
Message-Id: <168612571728.2521024.1084005865126960680.b4-ty@linaro.org>
Date: Wed, 07 Jun 2023 10:15:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 07 Jun 2023 08:31:33 +0200, Dario Binacchi wrote:
> The series adds support for the display on the stm32f746-disco board,
> along with a generic patch that adds the "bpp" parameter to the stm-drm
> module. The intention is to allow users to size, within certain limits,
> the memory footprint required by the framebuffer.
> 
> Changes in v2:
> - Add 'Acked-by' tag of Conor Dooley.
> - Fix build warning reported by kernel test robot.
> - Add 'Reported-by' tag of kernel test robot.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[4/6] dt-bindings: display: simple: add Rocktech RK043FN48H
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c42a37a27c777d63961dd634a30f7c887949491a
[5/6] drm/panel: simple: add support for Rocktech RK043FN48H panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=13cdd12a9f934158f4ec817cf048fcb4384aa9dc

-- 
Neil


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F17717B7D
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 11:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B40F10E1CA;
	Wed, 31 May 2023 09:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E16110E496
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:12:57 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-30af86a966eso1224791f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 02:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685524375; x=1688116375;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b+YQlgx1VFjGNM9jR4+GNT4YtqTgZVS0cajTtQFZxPY=;
 b=TxgwASoWbYILqZMx1W+qJLLjUFcaq8VRufal5QmKv95NcDXZwa2NneqoeYjhsD96/0
 wfqjbVUm2NUBapNFOcmvDvKAIhr6DzfTL3C7JBNsury9sdT8Ujc4dQpyMOzSIyrElG/D
 MJ5JrgN92GvFuSM8u+O+P72L9t81wLayJDnPoe5M0IejPqt8abZAeBYRGt3sJCPPmX9k
 llGPNvd7wKwPetElGvsC5pbltpMWAQ6GIWef6E2fV83EdFR3yjyF37SMHYO28qItls3k
 prYaYkggSzcB67YRUUSkdSFT2WLspoPtqDHCq1+M8E4aJwC8Dj7u/HSwRbR833CoGbAx
 kGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685524375; x=1688116375;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b+YQlgx1VFjGNM9jR4+GNT4YtqTgZVS0cajTtQFZxPY=;
 b=BmkGTxwD52zTP/Fslr7ziVJf4W2ZSaj3Zuy/s0y/oJgNyHS4iMK1nrbYOb8kLSqexM
 1jpTwCkrYOUi3ZHdAWZaPsp55laxHi1zENJqkQNmbH+2cZCiiO+TrXOq6AXFIwKeM8Ua
 UCzITIdqkgMy+9KeP1/7jWIYLefMpuSJq4a06w1+UPQR1DkKzj3+rEiCVsw02P1uRKap
 5FEraCTPkBgZpHe8czCWnOedB5RZi6UW+K6H7386jZmMItbrYrBx5H2NJ2WLpOH03Sy0
 S0/3YhCtJIszTsmknDXQNnkMLf9yzak+qf0YbLV8AQaYWoNGJHpknMLiN1lmBdIiBGis
 g59Q==
X-Gm-Message-State: AC+VfDxL3uqNoYqY257a1NyF/xI0vSFeuRnnKBAVP84slSgnT7wn4ZRk
 xZOGQn1fX+09CSFEfOx9lWNwKw==
X-Google-Smtp-Source: ACHHUZ63Rq1SiIBEGY8gi25g6h2KtY943yA6ZZTaGh4uMaC/0fDaORIAd9BOP/nEMenZLdqK/Nut7w==
X-Received: by 2002:a5d:5150:0:b0:30a:e973:b182 with SMTP id
 u16-20020a5d5150000000b0030ae973b182mr3192370wrt.1.1685524374979; 
 Wed, 31 May 2023 02:12:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 cs1-20020a056000088100b002e5f6f8fc4fsm6117294wrb.100.2023.05.31.02.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 02:12:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230531000259.3758235-1-dmitry.baryshkov@linaro.org>
References: <20230531000259.3758235-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 0/3] drm/bridge: display-connector: add external
 supply support
Message-Id: <168552437407.2007178.8614236021819101690.b4-ty@linaro.org>
Date: Wed, 31 May 2023 11:12:54 +0200
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 31 May 2023 03:02:56 +0300, Dmitry Baryshkov wrote:
> On some devices the 5V pin of the HDMI connector and/or the ESD
> protection logic is powered on by a separate regulator. The dp-connector
> for such usecases provides dp-pwr supply support. Follow this example
> and make hdmi-connector support the hdmi-pwr supply.
> 
> Changes since v2:
> - Changed to use proper supply name instead of hardcoded "dp-pwr" (Neil)
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/3] dt-bindings: display: hdmi-connector: add hdmi-pwr supply
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=41b74821751466457dc8b87606ac4d71ec568d4e
[2/3] drm/bridge: display-connector: rename dp_pwr to connector_pwr
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=99304fd0050314a0c998c28300393ec574998db9
[3/3] drm/bridge: display-connector: handle hdmi-pwr supply
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6eb6b6f0a012993070b26dacb5ea1ff5fc233c18

-- 
Neil


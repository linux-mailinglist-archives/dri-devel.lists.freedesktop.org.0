Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B7D77E6FE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 18:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A410C10E38E;
	Wed, 16 Aug 2023 16:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4434C10E38E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 16:54:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-319779f0347so2820208f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 09:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692204853; x=1692809653;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W1FlQ3OUT9sdhoraSxgyWLKrGJemxIcdoIm3bMY/fyY=;
 b=zMVD4UnEmCBrtXvxNxx/nf9QK/ZGbiTpePnBbkU+17ZOHbRfvb4Y/E6p8Fo3P1j1vs
 X2+DCLUOlgBt4cnV+c2ikMmlyp93oxRpdRokfzePa6I3g2wfZtJuDJgU9jvHOQVUQioa
 gROGVbV5zEqKW/VNccfHds6Hs7m7kuu+dh3BCzKeK1XE73U5H6tbkZN20GjUirGa9qS2
 rjkd9kDLI2XzfHkZGvpJwox5XP449D5p8/GkfDeWkODD8yet2iMLfk+9XtstqX7YxTjY
 /lSUbfaCN9sF1zFoJF4l7nZYxQqPVhBpPXvwcfiNTYorZYIsZy0HThALKm18b53sgTI9
 58TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692204853; x=1692809653;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W1FlQ3OUT9sdhoraSxgyWLKrGJemxIcdoIm3bMY/fyY=;
 b=Wto9S9/lnKaeMceyLcUhNhuPEV5sHYimy/0ZD9+E2por44d28KCAGENy69oBNYh3kh
 xSw4o7ulvR+iIjWWA1bmalUw96kStNAB0HkNEgW0h6isvOuCtrqNiybXOMLyPVklA/2l
 g8FgOWuQfinVDrD6uEKzc5/CF5tCAd5eygBpIsnOtx0lyvI3YpLD/v7cSflhH/Q2u4O9
 tC14qNFTlIF9vkmubIC5SHaXTWsoe2qiIc/o4PnyNADZXC1D5CCJwwcQdUpULY8g5l82
 +M+ujw4SAM8Ryr0a2UYVOVN+3m1XJ69s8br6flGorN9Erc9ruARaWJqPM3MzZY4K5q//
 xuXg==
X-Gm-Message-State: AOJu0YzWDkkZqsNljbVfMxUZGlFJ9YFFodWMM9wFY96MhgVoOylcm261
 swft8bbOy8TZOJo6eCCn68l5Tg==
X-Google-Smtp-Source: AGHT+IE9s027KIYi6owabCjf/8FiMgf5Q19gDYbGExDgyCLbPrk+0TF4xCTXJ3ZMV2MmaWjV3Njd5A==
X-Received: by 2002:adf:e489:0:b0:319:6e5b:c7d7 with SMTP id
 i9-20020adfe489000000b003196e5bc7d7mr2337956wrm.30.1692204853664; 
 Wed, 16 Aug 2023 09:54:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a5d4947000000b003197a4b0f68sm10233279wrs.7.2023.08.16.09.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 09:54:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20230814134024.397739-1-luca.ceresoli@bootlin.com>
References: <20230814134024.397739-1-luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2] drm/panel: simple: Fix Innolux G156HCE-L01 LVDS clock
Message-Id: <169220485242.2959125.4727047434360696027.b4-ty@linaro.org>
Date: Wed, 16 Aug 2023 18:54:12 +0200
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
Cc: Marek Vasut <marex@denx.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 14 Aug 2023 15:40:24 +0200, Luca Ceresoli wrote:
> This panel has been implemented in commit 225213f24c79 ("drm/panel-simple:
> Add Innolux G156HCE-L01 panel entry") with a higher clock than the typical
> one mentioned on the documentation to avoid flickering on the unit
> tested. Testing on a different unit shows that the panel actually works
> with the intended 70.93 MHz clock and even lower frequencies so the
> flickering is likely caused either by a defective unit or by other
> different components such as the bridge.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/1] drm/panel: simple: Fix Innolux G156HCE-L01 LVDS clock
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=438cf3271ca116253cffb8edce8aba0191327682

-- 
Neil


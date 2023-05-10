Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 015316FE423
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 20:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD6210E506;
	Wed, 10 May 2023 18:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8586410E508
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 18:43:33 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9661047f8b8so980157566b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 11:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683744211; x=1686336211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gq7FGBBCVUWg9J5mCHnrCLlt8OqBW6wcJOJEyZGAjTU=;
 b=bmqkK9YGPu+Dx9JKP0oGXBndlrDSdWNiog1vFSUuZI0DvCy+7UmDadEPQTNfWgTOkS
 1bzucwXk1rJ74lAUkDBcwOfw7QkyVFfAkQNvjGr/22/3IiGyKfi1WZ6FtHe+et3MTS0G
 DiaEan1VTKwjOg1VQ2icxdFSJlBcQGvicNobmsXb56tbONBfx+0O0bc5lFjlseDZ/0av
 Yk8Bn2n1oXTrZFabtWVmJmjf5dSnU0Axt1NUKGfMjVJbnZw+eFmRKHAp97IKd8vUiCkh
 m4Jr80UbW7FLE/oWq3QHKlBQZvvjd8QgbF+cKqyd2E/+8ekX7bkuc9MmwQFaGP/mEu0f
 gXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683744211; x=1686336211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gq7FGBBCVUWg9J5mCHnrCLlt8OqBW6wcJOJEyZGAjTU=;
 b=NLOOSOqW7rcqrN2A9sYNQF3c0UsDV/YEBLaugqIn10zi0H3M9l5LzvY+PsjThQ69U0
 eOTvViUZ0cIjREiZcQ5qKryyPBi9KfdkG9FL1tvZI4SBgCAPIzueGd4mkiSxPAMsuTsz
 UZUOp1EwVsOZ0SB1wrak8qq2rPwJ4Rr4yBvhjQen0OeUvU2AQ4IEF0ZY/0I1m5OftnxN
 VfYQktG/+SZ5eo3xFvNtvVRF/euKxiI6Ilj0DGq6abNyLkSWvJXW54ohgaw39uVqTuRR
 F4NHwfODP3o5w+mynYbfnVmT65KGcSQMF+3Z+V7PUuSHfWQdOmYNAJxWzBRAEhhDq64C
 clxQ==
X-Gm-Message-State: AC+VfDxu2XMV1fwOzYeONk7EGA5/cl8CPqK6DPnoL+wLJXOQ+LDNt24P
 DslEvUDNKjwYmbzSwpsS/dc=
X-Google-Smtp-Source: ACHHUZ5qQHPAak3fJENQzWiF5faDzhV/CfrF6o5JZeuLw4jsNWWDaYlpbOzCCgyE3kmTmGrXn0ZNzQ==
X-Received: by 2002:a17:907:7f14:b0:94f:9acc:65c9 with SMTP id
 qf20-20020a1709077f1400b0094f9acc65c9mr16822802ejc.66.1683744211262; 
 Wed, 10 May 2023 11:43:31 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233]) by smtp.gmail.com with ESMTPSA id
 jz24-20020a17090775f800b0096347ef816dsm3003796ejc.64.2023.05.10.11.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 11:43:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Roman Beranek <me@crly.cz>
Subject: Re: [PATCH v4 1/4] clk: sunxi-ng: a64: force select PLL_MIPI in TCON0
 mux
Date: Wed, 10 May 2023 20:43:29 +0200
Message-ID: <5674988.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230505052110.67514-2-me@crly.cz>
References: <20230505052110.67514-1-me@crly.cz>
 <20230505052110.67514-2-me@crly.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Ondrej Jirman <megi@xff.cz>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 05. maj 2023 ob 07:21:07 CEST je Roman Beranek napisal(a):
> TCON0's source clock can be fed from either PLL_MIPI, or PLL_VIDEO0(2X),
> however MIPI DSI output only seems to work when PLL_MIPI is selected and
> thus the choice must be hardcoded in.
> 
> Currently, this driver can't propagate rate change from N-K-M clocks
> (such as PLL_MIPI) upwards. This prevents PLL_VIDEO0 from participating
> in setting of the TCON0 data clock rate, limiting the precision with
> which a target pixel clock can be matched.
> 
> For outputs with fixed TCON0 divider, that is DSI and LVDS, the dotclock
> can deviate up to 8% off target.
> 
> Signed-off-by: Roman Beranek <me@crly.cz>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



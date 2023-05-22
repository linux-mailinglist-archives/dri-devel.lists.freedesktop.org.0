Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D270BFF3
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 15:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA4D10E32F;
	Mon, 22 May 2023 13:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AA910E32F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:44:49 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f607e60902so3930435e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 06:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684763087; x=1687355087;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nBQBw6CfCpS2jHpwl66vgP+oxhK9iCxnR3a/pdGsx/s=;
 b=brpNwEFiTifCMI+2z3PPBypnlqFrU58HCyUjV1YwdYBjfst/B7BzHLu0niSYffYlH0
 NcHRNZxRoou7nTstHnyXeU88r4m4knbn6g5HewxB/9XedQrkhNKEzcaDfenDXpT5TO9X
 /mW5n+sqiWm8UcAh/z6JR2V9FV2Xj87uBdk8YctsC/l1bj4T97SenBpxFTPaev/kGcrB
 9XLPc64e6Kj9QRphARazyXSanLg29OJYMXCsFnKPo0ccbyrrnw3nkOxBz4x8k715rdIO
 gezXBrPDI+L/DMJP8ZGtO9wIRBhrvkILCLSJi06vT7qa2bnOOP217ftT4tMABHAwWiGV
 5y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684763087; x=1687355087;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nBQBw6CfCpS2jHpwl66vgP+oxhK9iCxnR3a/pdGsx/s=;
 b=QghTTnscQnpE2/s/ZitMz3b75Z518MIk6w/m7yNK+2gfnWgYvHi7JrJMnhiUFxPheS
 m6KmH94iNT2Z8GWOIo80qvSvbdH7ZzcoZ0y07ABi+l1/iRSCwq44PZqZ6BrXFPawXWuC
 EFIFbbAhqCamuev9MEv4qp2ornj/3778/r60BeiBjNTYysA3HjBdYtJCUfH9CMe7JaRo
 wc1Xc6ENXc1+gSMAEr4IgMZxD8+atbOaVEpzE4BkuKp+H8zU+Vx94VR+tVXGZ1y6OZXG
 n1GxzmNDRdLP9DQgREVAJJfWmkXbOhJICVkcbkPgJeNs6bYPQvCJG/p9YKcshR14UYhL
 M16Q==
X-Gm-Message-State: AC+VfDwRlTQRxM9htAYe2pPMYPF+wTMRVGKXdUDh3jRIDAEEIoH4OoKK
 9ztSeKE2P3nnTztRXER0PxoHwFcmN7EIbqUFf0sYJg==
X-Google-Smtp-Source: ACHHUZ50cNgmQvAobdIojXR4NTBQqipchc4EVGUHOzc8b0LtHCN9e+gzJm2x7j4KdDXzu4Zm50sWyw==
X-Received: by 2002:a05:600c:2049:b0:3f6:289:b769 with SMTP id
 p9-20020a05600c204900b003f60289b769mr3300930wmg.14.1684763087342; 
 Mon, 22 May 2023 06:44:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a1ce914000000b003f18b942338sm8421342wmc.3.2023.05.22.06.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 06:44:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20230514114625.98372-1-festevam@gmail.com>
References: <20230514114625.98372-1-festevam@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: samsung,mipi-dsim: Add
 'lane-polarities'
Message-Id: <168476308664.3841130.12910064753273358784.b4-ty@linaro.org>
Date: Mon, 22 May 2023 15:44:46 +0200
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, 14 May 2023 08:46:24 -0300, Fabio Estevam wrote:
> The Samsung DSIM IP block allows the inversion of the clock and
> data lanes.
> 
> Add an optional property called 'lane-polarities' that describes the
> polarities of the MIPI DSI clock and data lanes.
> 
> This property is useful for properly describing the hardware when the
> board designer decided to switch the polarities of the MIPI DSI
> clock and/or data lanes.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: samsung,mipi-dsim: Add 'lane-polarities'
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ec7743c9c48a14aa884d27f2feee1da30810ce0a
[2/2] drm: bridge: samsung-dsim: Implement support for clock/data polarity swap
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=74629c49e66cc6d36c46ac4e3f059780873ceedf

-- 
Neil


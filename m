Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2157110C5
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 18:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063A910E6C1;
	Thu, 25 May 2023 16:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099A310E6BD
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 16:19:35 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-309d3e8777cso930258f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 09:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685031574; x=1687623574;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J792pmgwZYjCthCbVbD0XbMQjnsrFglVru1pdmfLzCs=;
 b=zJAsS/yh7QWEW5Nc0yeCDj0yjn88zziqdrmms8/5ht+HLhZCa3LXSoJh+HetSO87wk
 wjOgV1oiSKCn2rHkKMca8x94TRZNtnnJGdd1ZoSfKgSAYZqCLsBo0UjW13yB0QiSjRuZ
 Q4Si9CsLTDWaXAXG8I+7HKCHzyV/TVRnKcVXTN1f5Mj5sa5MP4CwzZe63mN3Daw21W4s
 nfslYByXyhkI1aISyl/Pvb8OohDYQWga6urfL9PN1uXWW6acHH8CSo9V1wI31nFoKP0I
 UWoHeTx4KM9zwen7bk0UubUE6FQZlSaZiKemJQpZL5LUCVdHBn0AT11vAFLA4a3ZOS2j
 nPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685031574; x=1687623574;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J792pmgwZYjCthCbVbD0XbMQjnsrFglVru1pdmfLzCs=;
 b=ZUiLEypWBQyuaxH6XAI6xfPHsetDdjULPspNKLK2VGJqYpI3EgwahRQrCFZdm/f/dS
 X7iAP5itbozF4lRNv8u3Tu5HdSPCb9HOh12bzAtdXbNlEHGbxYl4HJybni9OZh7jQtT8
 sGDHu1MDsuJWr7+qO8oTE1N0AoBzFC4dUd0bD56+zb//pMh9hD/7r17grwlCw/zxhAxA
 jyGYe+nOrQOpvW8NH9YovXr9pp9UM0Ai6BTTo7uAEmO8bpFfOtmPFHUd8ASWilPViptT
 uJyOeYil9XGLZjhfjaRYnpjnPJbvG/7MfRTz3u0iUGOQpUjYds/pijBAF+fYwdt07ntp
 IfJA==
X-Gm-Message-State: AC+VfDyBsKR7/CwohsJl3PC9/Hf7QXXwVXLQBBw2F1siAwKZGOC5iWnf
 vSfb3zk/27e8d05NdmdThQzfee6rYBd/2vjOCcu2qg==
X-Google-Smtp-Source: ACHHUZ6FgPqiKtydERzxbHFcz2iQJVXJ4vGXA/l6lHkTNlloCfY1UYgInQomL7PkcTwGpfIwykQFyw==
X-Received: by 2002:adf:fb09:0:b0:30a:c681:fd2e with SMTP id
 c9-20020adffb09000000b0030ac681fd2emr1256379wrr.22.1685031574023; 
 Thu, 25 May 2023 09:19:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a056000194700b00307bc4e39e5sm2240017wry.117.2023.05.25.09.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 09:19:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, linux-kernel@vger.kernel.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>, 
 Frieder Schrempf <frieder@fris.de>
In-Reply-To: <20230503163313.2640898-1-frieder@fris.de>
References: <20230503163313.2640898-1-frieder@fris.de>
Subject: Re: [PATCH v2 0/2] Init flow fixes for Samsung DSIM and TI SN65DSI84
Message-Id: <168503157303.1160623.697502626208861584.b4-ty@linaro.org>
Date: Thu, 25 May 2023 18:19:33 +0200
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 03 May 2023 18:33:05 +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This patchset contains a proposal to fix the initialization flow for
> the display pipeline used on our i.MX8MM Kontron boards:
> 
>   i.MX8MM LCDIF -> i.MX8MM DSIM -> TI SN65DSI84 -> 7" LVDS Panel
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] drm: bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0c14d3130654fe459fca3067d2d4317fc607bc71
[2/2] drm/bridge: ti-sn65dsi83: Fix enable/disable flow to meet spec
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=dd9e329af7236e34c566d3705ea32a63069b9b13

-- 
Neil


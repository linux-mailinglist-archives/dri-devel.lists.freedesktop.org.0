Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9451673F62C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 09:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6537410E02F;
	Tue, 27 Jun 2023 07:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE59110E02F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 07:54:22 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b69dcf45faso33021881fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 00:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687852461; x=1690444461;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D/9SiAC6+9hSpeXdep9Ze7xghxn8zCBJk7xNH3HIPpA=;
 b=xH3OBdpByqpSTSDwgUUbQnCdFbZ8EGBUquiIbTgoM6ur/RxO4jzr5N7FVdLEyp9osu
 4fUg5o1kQgFd39kaSQB/v3Dt2i5+kH+XtjQrYFY2H/phUVXzEfm1YhsIZTP5BWuD6/AC
 d8Wd1CuUwipCNMSrcoEVdiV0oA82bEUcO/DWeKoMQVtlExD0oo0eqYO+EDG5OgJWsT5q
 l5gdVK4Ub+V8MQoKEiEqvq2+3rmEiIOuUolAzbjTnUgRBWqSgyoCdv8UKbyPfLgPtOaA
 E3s1bXCmPgb9Iy0Atr6leoWtgDn/a0RgdPONUCFznSOJfqB4wsYAYc3aSmK8lQQxqugZ
 5rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687852461; x=1690444461;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/9SiAC6+9hSpeXdep9Ze7xghxn8zCBJk7xNH3HIPpA=;
 b=esjSvtXY+LFqMrvi3bWo8bjVi3K8kIyp8OFBgeFaeGr4hSz1GB8T23txk7lj/fiL1J
 079aUGmZPmK9z8O3ZxTDnvZSoS16Acq6sqbnm2jA5862J1U/UNdTDp9F2m8uEJk7F0az
 uO2psIhuQTuO5aVXbOijzE74/y/9E0Sw6oyz1m9VGTBOJ4cePoYTksyKS43sfLkjrR6b
 5nbf6r3xoLqzNYhmboMegI/t8p4ap92CjlMDKfWLWtksuinMzQELFoInH+HvkvH9CT7G
 aNEdRNgtpCNcuvlFATxD+ODU2TiNuxLgBVivkn4ojBAN8X/XkDzNdA8af4HSJIBt0xH7
 ejWg==
X-Gm-Message-State: AC+VfDxXSQoovULzjgrvl06tZqG0pwb+BUdCHJxEUEL+/cIm4se4wAJy
 CSbOO7QML//lYMHQ+4K+ejhxHA==
X-Google-Smtp-Source: ACHHUZ7bpuVEi9RLkIMrLwAHeRUB8Dq5bSdhVpr9n9MLMwiGjVZ9wyoQ3JQkv2KD/Z88PbBdz+0EsQ==
X-Received: by 2002:a2e:6e16:0:b0:2b5:950a:711c with SMTP id
 j22-20020a2e6e16000000b002b5950a711cmr8267099ljc.10.1687852460842; 
 Tue, 27 Jun 2023 00:54:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a5d4561000000b0030e5a63e2dbsm9665578wrc.80.2023.06.27.00.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 00:54:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
In-Reply-To: <cover.1687702042.git.adrian.larumbe@collabora.com>
References: <cover.1687702042.git.adrian.larumbe@collabora.com>
Subject: Re: [PATCH v3 0/3] Add additional YUV420 bus format check for
 dw-meson's bridge enable
Message-Id: <168785245992.3048852.18155160209808336465.b4-ty@linaro.org>
Date: Tue, 27 Jun 2023 09:54:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, 25 Jun 2023 15:17:14 +0100, Adrián Larumbe wrote:
> This is a belated follow-up on
> https://lore.kernel.org/dri-devel/20220515204412.2733803-1-adrian.larumbe@collabora.com
> 
> Commit e67f6037ae1be34b2b68 ("drm/meson: split out encoder from meson_dw_hdmi")
> broke 4K display modes for me, and I discovered it was because the right
> pixel clock wasn't being chosen in dw_hdmi_phy_init. I misinterpreted the
> reason as a problem in figuring out whether we want to enforce YUV420 mode,
> but it turned out to be a mismatch between what dw-meson code is doing and
> the way the bus format is being picked by the dw-hdmi bus output format drm
> helper.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/3] drm/bridge: dw-hdmi: change YUV420 selection logic at clock setup
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=7ed40ff1d134bf3a4aef706eed478b926f35b404
[2/3] drm/bridge: dw-hdmi: truly enforce 420-only formats when drm mode demands it
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f3710b424a96078f416e1be9cf52b87eadabae78
[3/3] drm/bridge: dw-hdmi: remove dead code and fix indentation
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2299a8d12c1cbcdc7086027615d9936a970e7d68

-- 
Neil


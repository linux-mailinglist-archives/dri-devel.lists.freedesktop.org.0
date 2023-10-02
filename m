Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4753F7B4C60
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 09:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F99810E211;
	Mon,  2 Oct 2023 07:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5560310E20D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 07:11:55 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bffdf50212so249356141fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 00:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696230713; x=1696835513; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nvfMaUkoqxOdai7I7ecvncHhXdnmpTh02eP9PeaUV+0=;
 b=bNsztnS6ktuxAmU3E0JGziTGyIfkWWacVg4YAQgah6FBpEiu+nMvH1Zw/MHzfA/36W
 HD8duJVP+yzRs6iW6ZVbnmo3PcncVHMTSnIZyUpHoIa4umesk2aCOiXJlnJy9aLBUrwq
 LPIM5eJ85ADo4bkXLlatskpCMWYW9yZNuK5VSr3GuJVkwxujmZYEZrfXXosuxkPs/0dh
 FKqdYC/9YaI3tO1qLaYLVla7VMPEMS0VXvQH7UshoASoewqbXlWDBYkR4uVJ2eaBl71S
 OookJwEry7cN1TlSvV6OC5jly49SNWXV3etntnYyb98+ztPw0oaNITjHzDddWWZsihrV
 k3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696230713; x=1696835513;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nvfMaUkoqxOdai7I7ecvncHhXdnmpTh02eP9PeaUV+0=;
 b=lU9OrWiO0zI8r10BXXpwdvhft7f/0RfpSuRbudTPADA72ZIhvzBpjELjuZttCwRccO
 SiRhuQceoj7B7etv4lLuNHDpBJ3k5gtpDUaitz62CEiqz11hh1hnZgLLfqkGx6Gr+WDg
 6rzS16bR8oLZxKPuW1YGWmrsKojQ8Zq79rEagLKIGe7lubcVdWy+9LGYiGEvhV4hLV8Y
 IAApByghpdJth5ObJTXV1SOt0a5FCWfEri7cEy6GgWqEEUZvHW+N9aHq4NdDMcCT27wv
 yGtJOsNGmDRgXZYghLqsdYt/BmsYPqYvtKZvl1wGrYLD+WRUfWdeuMIDHF/HFLnfUgnA
 5IRw==
X-Gm-Message-State: AOJu0YyLyPzF6sXVTRSUDBvw1ARJQ3xe8uBCH3Bgubo2pzpeN4sadrjS
 +Cgs+zYjiItCja5XsGcDyEN7WQ==
X-Google-Smtp-Source: AGHT+IHZV19ronjlsIZ1rQLIh6Ioa9BRStyicQzU6glUdgfbV7Oc5uN1rCLPUA5MZ2qFHquSCZ0gRg==
X-Received: by 2002:ac2:4101:0:b0:503:2924:f8dd with SMTP id
 b1-20020ac24101000000b005032924f8ddmr8105031lfi.47.1696230713379; 
 Mon, 02 Oct 2023 00:11:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b00405623e0186sm6601371wmj.26.2023.10.02.00.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 00:11:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, Mark Brown <broonie@kernel.org>
In-Reply-To: <20231001-drm-sn65dsi83-maple-v1-0-5519799a55e5@kernel.org>
References: <20231001-drm-sn65dsi83-maple-v1-0-5519799a55e5@kernel.org>
Subject: Re: [PATCH 0/2] drm/panel: ili9322: Minor regmap improvements
Message-Id: <169623071250.3600226.7069510990814929570.b4-ty@linaro.org>
Date: Mon, 02 Oct 2023 09:11:52 +0200
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, 01 Oct 2023 11:24:12 +0100, Mark Brown wrote:
> These two patches provide some minor improvements to the ili9322 regmap
> API usage.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] drm/panel: ili9322: Remove redundant volatle_reg() operation
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c8c575ebf6daaf1fbe029cc04c845e2fad462320
[2/2] drm/panel: ili9322: Convert to use maple tree register cache
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=800c1ff7d1b12b6309eb877542367b94f376acbc

-- 
Neil


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB657BB1DF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 09:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351AF10E201;
	Fri,  6 Oct 2023 07:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60AD10E201
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 07:03:25 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40537481094so15952885e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 00:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696575804; x=1697180604; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8Z3UYNvAtyEDlrSr7KXfmu9oYxAGlZ+o0c72dpgJv4=;
 b=OzCrWXObz0IK2HBHgeKm4ub3c2KC+ONcjhJksQrnk7uBQKm+9cJXGE+c7+BG/02hhL
 9lMjCpqpKhR0D/VR5VjcaLZNSY+LCoQpTkTaPeTQhlQs984xYqFESupPGjgORUN8jPt4
 +l2Gl8H770TfyOjYukjEfb+wsd+0mzB74ZDLWXZTpAA2qQgAVzXKRqFnH8/RqUHhSTyh
 kVHQgYMtB0rzjGW3zwca6g2HfAei2dXp7KZ0+dbCIeAKsnkpPcakdirTyoFAwxIIzAoy
 oVk9rz3KPkPcG1RsHcZrFb2QtDztUvw98lUf9dql/Bf7iHxIOQ8suiRBFbELwSgg4mFk
 50yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696575804; x=1697180604;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8Z3UYNvAtyEDlrSr7KXfmu9oYxAGlZ+o0c72dpgJv4=;
 b=bIgcMneYNGxxtVNO56wkWkqCRr4RAhit/AJAWdzkVrv7GYX6BlREv9SYvCiU3j5P5H
 97xNl4fYqApUn0rWlTlAAyCJZlreN+dSeO5UM2V61wXjdu1hQVUTqvJ0YzzDSAJrCNMV
 8lyMqQdO4gYIti8sNd0aLhIWXtnGYZxkCHLVQ4HClkKoQ9SiUffcW2DPkRMcwrZN+qog
 jJiS6gU0gYGX5zIyII35Rp4+Trv7eLhDj1F8FpQz4IckqN8kZ6WEmvzhF+rNdwX9sa1J
 bsD6AnKrAr7PFNaToBY4s6bxkw8BYRG5/ngik1R0FMx/40abksnKoMKxu8YKWf+9DR+3
 96eQ==
X-Gm-Message-State: AOJu0YwsP4v66IaQfIrZePBYKHoDizUZ8CIa70KhnOLYXg4hyecMBooz
 zdRJbULczOVwUmxSPvZDgzwfWg==
X-Google-Smtp-Source: AGHT+IE0vdFoZPq1GaW6Q5CvV78kFSSPNlWMmQoCWBzIFhzjf5oxVJEh5fyUIBo3WnZB8u+fL0Xw2Q==
X-Received: by 2002:a7b:c8c8:0:b0:402:cf9f:c02d with SMTP id
 f8-20020a7bc8c8000000b00402cf9fc02dmr6583323wml.8.1696575803973; 
 Fri, 06 Oct 2023 00:03:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1c770e000000b004054dcbf92asm3056149wmi.20.2023.10.06.00.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 00:03:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230919103939.1367659-1-u.kleine-koenig@pengutronix.de>
References: <20230919103939.1367659-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] drm: exynos: dsi: Convert to platform remove callback
 returning void
Message-Id: <169657580295.3992302.7015352174084859049.b4-ty@linaro.org>
Date: Fri, 06 Oct 2023 09:03:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 19 Sep 2023 12:39:39 +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: exynos: dsi: Convert to platform remove callback returning void
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c1698c73f4aaef2fd406da1c0a92e1c8f7b7780c

-- 
Neil


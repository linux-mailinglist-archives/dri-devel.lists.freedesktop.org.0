Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C98A17BD658
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 11:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099CD10E23D;
	Mon,  9 Oct 2023 09:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E4210E23D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 09:09:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40566f8a093so39430855e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696842555; x=1697447355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8Z3UYNvAtyEDlrSr7KXfmu9oYxAGlZ+o0c72dpgJv4=;
 b=HF5sKYysqgcUXM2uUv36Jaq+EJduHdUobE6GRIOxWoB3k7R+jjQWqmD+KcZBn2+Udi
 ScOxdBKWqYBBqkY3eP03ceNQXOAv3dIQ59Yre6TnFcRtdhaltXt4yoI3dR0Dby2pn9h9
 wDedL3who30/0aNB/fs52NDdZIqw2+3Vss+EhUETpuzkMAmAjdl7MakzLp2mZvtkzoBt
 Bt3kLg3OPlCLuQjsgynBdG6nSkZ4G/7zJH9LXlNOeZB7ld681Qe9Fqok5WWk7BW4Uljg
 hj5tTYxE5tUT0Ol3xixW08vDfnbWK5bcLjJVaVELceewHgQpQ5z/YXESyT1JAFdiPKT2
 xJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696842555; x=1697447355;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8Z3UYNvAtyEDlrSr7KXfmu9oYxAGlZ+o0c72dpgJv4=;
 b=QTuXxP6HSkAJ5pp0isIesb5pROUrUwc8ylT0e0po+0iCSp+GT8K8FbVG/EmNPCIVuw
 cvEReqjEgfnOfgJweh8++jaY3eOHFmXtyzwQvKn5HKuECWq/EXiUtWxIyT4cFK0Y4nmB
 in67wyA0WLWFpumglSVZj4mh1aSzWqz03PI88j1OeNyVPQqR9DxtaYKLJHH6W67sb8ql
 uJSslBzFN3ayuhB+lj+ypnC3DdQD+Hw5pzkwREcj7rg6f2EDXDtcW9ZmL7/1vIK3ZLLg
 OOpjHf2v1JNK8792yM7J94VmEGmC07DlfquyknB9YKiqxvgI1MRqXMWHcwWN+IGh0wn4
 W3qQ==
X-Gm-Message-State: AOJu0YxQjLybwI4MRF1vD4kCs8sPr6/y2PuZxpl/A8YaMfB7qfXK1JrF
 uMMG5XYPqJ2DF0xjmTu4Rqa90w==
X-Google-Smtp-Source: AGHT+IFch8GuFHQEo6J3AnB25YuJr/bD2bLPerLfe0tE6CVQhPSYr2s659RcjWq6ka8GDVR+RhEqcA==
X-Received: by 2002:a7b:ce09:0:b0:405:3dbb:ec5a with SMTP id
 m9-20020a7bce09000000b004053dbbec5amr14092958wmc.1.1696842554673; 
 Mon, 09 Oct 2023 02:09:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a05600c219800b004013797efb6sm12864525wme.9.2023.10.09.02.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 02:09:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230919103939.1367659-1-u.kleine-koenig@pengutronix.de>
References: <20230919103939.1367659-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] drm: exynos: dsi: Convert to platform remove callback
 returning void
Message-Id: <169684255378.1988265.10483577692957189124.b4-ty@linaro.org>
Date: Mon, 09 Oct 2023 11:09:13 +0200
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


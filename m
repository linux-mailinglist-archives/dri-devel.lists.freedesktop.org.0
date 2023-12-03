Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE84280292B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 00:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9A010E16B;
	Sun,  3 Dec 2023 23:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C740C10E16B
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 23:47:51 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5cece20f006so45795237b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 15:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701647271; x=1702252071; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dQGlDF0/jjw9dSi1qf1IyGTSGhKN+Lmb8bzfMBqHt9Q=;
 b=mZ5fo8c6BhjuRXqTvt/0nVal24QOXfm6ow7c/URuf3rVn+MORSJXamULmBadjatrLk
 yFkRJxt+SPHN+V9Qt9DCvqm5BeSu6H752CRnFITYGfEvMNMBzYXnPedQRvsYOdspdZwt
 udjj2RqGh+nH1oA/oTBZFL0hzj+Ixm0Ea9ICp8wByPRSnDVX/Eqh3ql7BUOLL/3rk5nK
 qmorzglhX20fiMTXJoQRPe/Cx3Fgmpl8B1gAI7bZ9ztoOaR6DnmWyR/2cYrsafrQZrAB
 GeW7/NgqxtCK9Lzd7y7pPZW4fdacdFtz8zoHsqyM/B3pf8HQO0L8Dm9J98Iv/lSrw1LL
 bJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701647271; x=1702252071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dQGlDF0/jjw9dSi1qf1IyGTSGhKN+Lmb8bzfMBqHt9Q=;
 b=gZ6APWF9etsQqPmlfu0IWrSXduppxTzeUrxWZJjrYQhzFvW+7s1lCeJOyEfYXMs11J
 akzkNy4dcd6s9spPAaNQOId7nJwOCiXQ5ZUl+J8sVoKuZI8XnCFsYpbfA8LCI4kZKTIv
 0lKNbEWkJub4Abzp/Z8qe8FX+SQE7Vz22qN4Lffq0VZX/xYILa9JTLlNLghc6JRSCXSm
 79AOh3KuMQXNaC7/6DIH4Z9VVIuK/K8xu6yLGCwj2oeJvESzZ4n/NOnrHCkumQjXJuPb
 Nq8cnzqwabnZci1eCbm+LC5UKOid5O3a12i6BnKBVmtUjfiWEFlqiLgElqvLFfFTuKJl
 yHIQ==
X-Gm-Message-State: AOJu0YwwCg1xAp0dzVYBUc6kgqoWxsVPljFhB8sT6qT6AflpmYUNidEA
 RHIQxJo9Hl3fkWzqwgIR4a31MMgsI2KJRIqgo9ny5Q==
X-Google-Smtp-Source: AGHT+IGnSWiWfyQzd6OTM3fOOwAEWy7YikuSSszBHGPJey61EbH/PppL/ESJd2eJBKIKa8g6IZ+a8uMxqmmMVM4VLcI=
X-Received: by 2002:a81:ac11:0:b0:5d7:1940:f3e2 with SMTP id
 k17-20020a81ac11000000b005d71940f3e2mr2440864ywh.74.1701647270980; Sun, 03
 Dec 2023 15:47:50 -0800 (PST)
MIME-Version: 1.0
References: <20231202075514.44474-1-tony@atomide.com>
 <20231202075514.44474-7-tony@atomide.com>
In-Reply-To: <20231202075514.44474-7-tony@atomide.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 01:47:39 +0200
Message-ID: <CAA8EJprG9h_=skXNcdqWxPbQBzUWsXSdW4B6nzMMhMXW5BqjnA@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] drm/bridge: tc358775: Get bridge data lanes
 instead of the DSI host lanes
To: Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Simha BN <simhavcs@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Merlijn Wajer <merlijn@wizzup.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Carl Philipp Klemm <philipp@uvos.xyz>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Sebastian Reichel <sre@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2 Dec 2023 at 10:01, Tony Lindgren <tony@atomide.com> wrote:
>
> The current code assumes the data-lanes property is configured on the
> DSI host side instead of the bridge side, and assumes DSI host endpoint 1.
>
> Let's standardize on what the other bridge drivers are doing and parse the
> data-lanes property for the bridge. Only if data-lanes property is not found,
> let's be nice and also check the DSI host for old dtb in use and warn.

It might be worth adding that lanes configuration for the host and for
the bridge might be different (e.g. the lanes might be swapped on the
host side).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)

-- 
With best wishes
Dmitry

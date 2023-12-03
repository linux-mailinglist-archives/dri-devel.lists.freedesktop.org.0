Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D8E80290A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 00:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8045810E166;
	Sun,  3 Dec 2023 23:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C73310E166
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 23:37:35 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5d2d0661a8dso43870147b3.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 15:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701646654; x=1702251454; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N5DL7gnjEHlI/fPAVxCZSlozogoVaks8dZbVXnpDqkU=;
 b=P74wpiRRR69owBHcZXFpOwYNqcDmuLfs4Tlzx6OzNLeplk/cBmhDK9TJqWynmEvgdQ
 SrQJZfTtjyU8jXcCclJuoyjmpA3iBn0YPvuc4s22FqErNE4LPN3FjB/qS2j1ynZe+5zA
 1Woz3OhMSgAu0sFTceAzqDo3W7/MlK3UkO0R49NxSmBoHT7kvaN6b/uWmtQlcGYgsCEe
 vqvst+VHT7gfmIrgzNR6J85QyV+Mm9lFWSSlsTFPmWC+n74UvJCqoTGhteaSf+/BaOTi
 kHsx72VgBKxLduJUt3OaP6kc2Mk5HVxlBR+y+KGY25me3gCWBLucsdntVYfeZLOomZvA
 g8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701646654; x=1702251454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N5DL7gnjEHlI/fPAVxCZSlozogoVaks8dZbVXnpDqkU=;
 b=Qng3E7/9d4uTa0Cc+nXgtQo/pEgFc6hFt5TL7Wz3gT/MpSG0UWSG8zDf9BTJ9igKSB
 aK+P8pKNe13GdTvXILiclIN0ShBW3sSmkfpPl49/zQlJA8ElJww6Vp41TtQdAr6UHZrD
 t2pCmqooUL73y4LFGANADxWT1gmRzYpein50jHv1voJwxX41/Ca29PvRWzd6FkJ9HoBh
 Lue5lOfUFyYnmHcEuFnRmja4cLx6UiQ0/00o5sVrm8rnpTF7Zd+kMJdONx35bpCRGq5g
 LwKA9hodvfAqnhF3SEyeNDqr97MWEowkRHCbYcu4hwhdvrH/eMzzUY4FMuDGU+MUgpi7
 tnMQ==
X-Gm-Message-State: AOJu0YxygTVHcbwNqKNrwh91ytBgdwYHmP2XSPX4FIxOrIinqvV7X3TM
 4b4ieuhGFfJSmPiL7HIAwaFTbRm5zs46X7DkcEWsvA==
X-Google-Smtp-Source: AGHT+IEHyVmd6qk0gftxqvXdz5Im2YCU2z8k3ZkUKqMeG/CmWcowBUjzC+N+T6WSunBASjUi5laz5l5uiOwdMUvkhB0=
X-Received: by 2002:a81:9957:0:b0:5d7:1940:b384 with SMTP id
 q84-20020a819957000000b005d71940b384mr2544755ywg.80.1701646652325; Sun, 03
 Dec 2023 15:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20231202075514.44474-1-tony@atomide.com>
 <20231202075514.44474-6-tony@atomide.com>
In-Reply-To: <20231202075514.44474-6-tony@atomide.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 01:37:20 +0200
Message-ID: <CAA8EJpo02derUAfsKBO0wu46hJZUVP_aC8rkpe3y1+=BRwwBnw@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] drm/bridge: tc358775: make standby GPIO optional
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
Cc: Michael Walle <mwalle@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Simha BN <simhavcs@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Merlijn Wajer <merlijn@wizzup.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Carl Philipp Klemm <philipp@uvos.xyz>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Sebastian Reichel <sre@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2 Dec 2023 at 10:01, Tony Lindgren <tony@atomide.com> wrote:
>
> From: Michael Walle <mwalle@kernel.org>
>
> The stby pin is optional. It is only needed for power-up and down
> sequencing. It is not needed, if the power rails cannot by dynamically
> enabled.
>
> Because the GPIO is not optional, remove the error message.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

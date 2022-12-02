Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD8A64117C
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 00:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B1A10E73E;
	Fri,  2 Dec 2022 23:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E7810E73E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 23:27:37 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id e141so7838203ybh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Dec 2022 15:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=01Dh81m4jbKqJgneaTvo1zhRa3UD/HHJqjoMbOfF7J4=;
 b=a9xmb67lFpFoi4YEDWdAsR+kRrZg1Vr2lMYe1a6A8d0JpMMOlIXszaUkLarTleeNEU
 zBlly5tuIWV45UB2FUN6Z7ZOmgl8BiAWc9KUkjSw53Kovacvd7z75f2pGLL6E6+0mkUm
 D920BYaBXJl9eC4lWFhiue8lFdsSNE2c6wP/SWua7K+dcIPW644lswUb3Ssbj32OvMyq
 fc2nfO8dt6oeBIL7nsNhE54xSg7koqWTdY+52LbY27NYIHXsCvQoi6leYjwDyzm+g5zN
 Q1pt1EmqXyGUwqFmYTNsPZU6ZT8erB/sqm5hhRkoZLgSxvER4k5D+88zeFBOKhsjw6mk
 sc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=01Dh81m4jbKqJgneaTvo1zhRa3UD/HHJqjoMbOfF7J4=;
 b=vO8QOQmgrL/laX9vkVGaXVLwBl2GBQwtFatPgJz8hRQCP6Gt788lE5xMaBT++aDIMb
 ECWQCdBJCgE/bsFbHruS6IdJ5X6N0cEpfSYGmspkVki8GsWaAXhwn2gkeHAjKMdoaaKu
 X8IvoBPmx3PVigmpTpPZHpBSmx9Y1VuN8xr6B4YOwBEQ0f2o5V5zg8AfCTENxnl3SYAG
 Ma/rGn0PCcj9Zu8v9RBgVtTquBSFcJUbFwyCisNlIyI+NHwAYBjPy1ZpI4js/HeB3AVY
 noQ9B86uorjQQ3qHpsBNFhZoE2MX1ZKSrZrdwqpjTJ1/K6/yZap67tIdGUk/LmlFYZNy
 rTdw==
X-Gm-Message-State: ANoB5pk+YOqCQcsq9FYJtpZ3FtFXR7Anv1V6qpv1rSNSYJO4Z7JHG5xh
 wG+9Xk1kpO4eUnSRPN/9J2OOwzaKNWnzKnfzGNqmPQ==
X-Google-Smtp-Source: AA0mqf6PJ/bVmIQ/wE4S1OExKpRT9O5k9pewZIINIWmGYbkjwPDqfiGxa28TxTOCYjDRDy8IyKB5CP3C62LgP1KqHhs=
X-Received: by 2002:a25:c7cb:0:b0:6fc:834c:9c89 with SMTP id
 w194-20020a25c7cb000000b006fc834c9c89mr7444498ybe.43.1670023656365; Fri, 02
 Dec 2022 15:27:36 -0800 (PST)
MIME-Version: 1.0
References: <20221129172912.9576-1-macroalpha82@gmail.com>
 <20221129172912.9576-2-macroalpha82@gmail.com>
In-Reply-To: <20221129172912.9576-2-macroalpha82@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 3 Dec 2022 00:27:24 +0100
Message-ID: <CACRpkdaW8d5w5tnn-vdKQpvqXjC0N=6nCB0QfzUJ5rUk0oTt9w@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] dt-bindings: display: panel: Add Samsung AMS495QA01
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

thanks for your patch!

On Tue, Nov 29, 2022 at 6:29 PM Chris Morgan <macroalpha82@gmail.com> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add documentation for the Samsung AMS495QA01 panel.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>

> +  reset-gpios: true

Can you add a description saying that this must always be specified
GPIO_ACTIVE_LOW.

With that change:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

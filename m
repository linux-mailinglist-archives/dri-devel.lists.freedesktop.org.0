Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E01964D7FA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 09:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B369310E4F8;
	Thu, 15 Dec 2022 08:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F0A10E4F8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 08:47:31 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id c140so2664491ybf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 00:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WnqnAujO5vkgFIZAn2NFYepD7a3hgxx4gJdKQM7EdWw=;
 b=uj7Wp84Cqgei0v0WvmsVG0yd/ZHMmp/HBco/HcM9rsM3j4iZqpJ6N4jW03fZ2HhlGl
 xEftHNVESN5oX7xF3m8/ASoHkqBuGyNgfF64WtHzD+1shdBRG6zaQj0RvSb9HUTfrT6v
 Z9e5JNTf267bWOMw6wj0MDthCFqBKTDN21m9pGaTq3b0/eGBk4jCzMH3oMEN4M4OgNmo
 9uv7jERNiu9zRhlllpLJ8aDTKQJn6zpB3PdUM39qLfml6RXfSOS0fg28v5V0aDB8tnQA
 v3ACks6lb9/98c+H10sUoXjuQNJ9V0tVLdahZZNIzMxnm+q0NIa2ru8vqbmOUaxFZAO9
 Athw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WnqnAujO5vkgFIZAn2NFYepD7a3hgxx4gJdKQM7EdWw=;
 b=Ro3ecdWqXNTY5CYKFHNDi3MyOhpFD/8wqAWtZmjGHVXh1QGJ4KSLeiKCu8TjeTOsUv
 5GuAWXMJdwVgTH4ElQzOazhSrT8m3SqQ1G/i9DU5rSa6gFfKoyUoZXJqkvObm1BE8nJm
 gNjoqbM5wflGSTm4VqFG1nYlanWjIS31dsa8bEFqPE6BD2eG5SfvykO5QF+7Qd6ONIc0
 +jeLeL44gOYfg1Ud6pBq08i2rTdeQaXmtYyutGkwPZVfi+LcX03eTJYnPfnS+C48YXs+
 hWvG7FZ+pWJOiHdxKjSY8FibQRdse8i9/yBZf5htgbCbE5E2yt7HgBrXs3D0mmnAnpVx
 hnzw==
X-Gm-Message-State: ANoB5pmMFr1x61TvYfDeDSCxvYnZNqebG0VnBF3fpvIhQvEnEzQ/cx3p
 5m4D2Zggg9SHgxahbM+8geDZ169awlyr6RGsQDmMqw==
X-Google-Smtp-Source: AA0mqf5bsqySdrdRzZC3LcwYOXrrbKcZw5U684DMiTWRojvR6IWV7k6hdArOgzLWW/xTiTYH6m14Nbyjkf1sEQeqVlQ=
X-Received: by 2002:a25:7648:0:b0:6fe:54d5:2524 with SMTP id
 r69-20020a257648000000b006fe54d52524mr24021352ybc.522.1671094050499; Thu, 15
 Dec 2022 00:47:30 -0800 (PST)
MIME-Version: 1.0
References: <20221214180611.109651-1-macroalpha82@gmail.com>
 <20221214180611.109651-3-macroalpha82@gmail.com>
In-Reply-To: <20221214180611.109651-3-macroalpha82@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Dec 2022 09:47:19 +0100
Message-ID: <CACRpkdY7UArNJ5ZH8f5rx+9aoV_ii=0aE9PCj-6XHCL7Om0+=Q@mail.gmail.com>
Subject: Re: [PATCH V5 2/4] dt-bindings: display: panel: Add Magnachip
 D53E6EA8966
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 7:06 PM Chris Morgan <macroalpha82@gmail.com> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add documentation for Magnachip D53E6EA8966 based panels such as the
> Samsung AMS495QA01 panel.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
(...)
>  .../display/panel/magnachip,d53e6ea8966.yaml  | 62 +++++++++++++++++++

It's fine to keep this as samsung,ams495qa01.

Just mention that it uses the magnachip controller in the
description.

That Linux implements this with a generic driver that handles
all (in theory possible) magnachip-based products is a linuxism
and does not need to be in the bindings.

Yours,
Linus Walleij

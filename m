Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10A73F2282
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 23:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44F26E9E1;
	Thu, 19 Aug 2021 21:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C966E9E1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 21:52:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D1A26023E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 21:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629409971;
 bh=hz4ToEn11O2DiQ3bxZuN8OGUGc7W0kXGCy2CxI1VoXk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Kng3t7djpyX+7l91WqS70uHZCu/kiK7US//O1ZdEu2yJXPi5OjnT3+XbL9fWqW2r3
 oOOC5ZcT9UfiilbP2KUrF4yNg7i9OHkYJAj1PZQsJrfiybepbQty3tIGbK0ZGpJ6Bz
 tFM+ElKP3lxRGvUcLGKvDMvY5QNiPbUv5faLcqjK4b1URCH207khCLwlVG1FWcVNxm
 08Bo8t9l4DH9VHK0FxqtJWae5Q/6+K+rDJRbVyLWP1HBc8QrZnnhuQdQuw6ujpcNy9
 R+unuj2iZ1hXq9uGmVXKn1QRpm2MpA1pjXSMFfSQpvLLxghk6Pef9X3pR9v8i3OvHh
 S5plU2uqokfeQ==
Received: by mail-ed1-f41.google.com with SMTP id v2so10927037edq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 14:52:51 -0700 (PDT)
X-Gm-Message-State: AOAM531u6Er3aFw0sfCjxN/RlosPz2gGgNObbfNLNWRzgu8aMZEsD3Gg
 gcW5BSXs7wE7RLI2fwxVaxi/7ys6zatzSq6xUw==
X-Google-Smtp-Source: ABdhPJw0hq/j5YRbpD02wnMJhEDVCeMQ0sCrUH9AvIo9gZG8TCf7667Nb/WyMEJegfKzTCD/BF4SZP3zTCNMf4ZT1/A=
X-Received: by 2002:a05:6402:104b:: with SMTP id
 e11mr18790051edu.62.1629409970123; 
 Thu, 19 Aug 2021 14:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
 <20210819101020.26368-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210819101020.26368-2-krzysztof.kozlowski@canonical.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 19 Aug 2021 16:52:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK1dhwSKbmCbuaWtBWQH0e-+rdJaWkzfx5b_5vX0toAjg@mail.gmail.com>
Message-ID: <CAL_JsqK1dhwSKbmCbuaWtBWQH0e-+rdJaWkzfx5b_5vX0toAjg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: sound: rt1015p: correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Dillon Min <dillon.minfei@gmail.com>, 
 Tzung-Bi Shih <tzungbi@google.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 19, 2021 at 5:12 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Use common enum instead of oneOf and correct indentation warning:
>   realtek,rt1015p.yaml:18:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/sound/realtek,rt1015p.yaml          | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

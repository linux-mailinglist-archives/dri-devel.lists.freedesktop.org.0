Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C601B6591FE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 22:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884AC10E01F;
	Thu, 29 Dec 2022 21:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F389410E01F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 21:06:47 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 x44-20020a05683040ac00b006707c74330eso12109563ott.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 13:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+yHonGhQ+U58uUS0jyslPVrKLC3sDduyu0s9k7MuOZs=;
 b=gBmWUGN11WcIq9eznUyhrhXJC+dJMe09abUHO0k06U95JePClNHH2Ur7gB94QY6VQ7
 NAfeKDSwI9yLVpc8jaoNHay0mxrbP2RtT1dbNktLG4/1J1MbJKPzz1rq2pqyAH8lZlL/
 TS6UTi1q1vk3+CRrNfDahlwTWno4JVIj4HK1PWeOzsm8psfdCuOHIPjL8lSbN1aafGYl
 /qdo/VEc0OHf5tW6lWvqqK/s8wlL0082kwsdq4oTnx71rRbqZ2ZG3nS0jv8zoSAc6Z3a
 7hgebQ6/Mec/dljnJq6uSS2p/nUgRqnGL2xyWwXj/de3ynx2ggHviWrsXf+gOkJwQhng
 MomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+yHonGhQ+U58uUS0jyslPVrKLC3sDduyu0s9k7MuOZs=;
 b=G1JGaPrfd5EjwtkJ4rmWHiV4JmZiy9nsthZORLlAmoCYKDe1lkIMhiCHK9UB897d1f
 ASsd1XxcrgJT3JVkHRH67pxMWCmCEe7uqvP4zPWG9XlbVXwX9Bj06apNgSebf20PDr8i
 mUTjImmQ/kZbZarvbS3IW7t974nHuHzOxxq+6P+0ZL+FXgs1uUzFaz6ueVyd9MV6bWFD
 heNbhbC0xckLy+XiRYnZfrzxp8dqEMag59XKNjk7GH91qlEMWvRa272CRRRplhXPoDcy
 ebpPVJK5OCMYrmxyJGMQCf0TkJ3k9uD0TSN3v6l7al0rBeQXpS7FP0n31/OKAhEws2il
 CjpA==
X-Gm-Message-State: AFqh2kqbgeePPzSBQdxWfRzzqHUvv91tLr3/y43jcs6Ku0w4iqUC4ySJ
 HTsxTBIut+PYwLjWRnT10obPOkDmmmY0R02FdNEX4A==
X-Google-Smtp-Source: AMrXdXuujWF8gx7voSqxkRTNv1kjsqLg4eRTHc6xFQCHkGHSgzYPaKhgFSkgb1IIJHEJN/NuVzgVX8rLozR+rdb/2dc=
X-Received: by 2002:a9d:750d:0:b0:66e:abbc:cfe4 with SMTP id
 r13-20020a9d750d000000b0066eabbccfe4mr1943058otk.102.1672348007150; Thu, 29
 Dec 2022 13:06:47 -0800 (PST)
MIME-Version: 1.0
References: <20221219195233.375637-1-cbranchereau@gmail.com>
In-Reply-To: <20221219195233.375637-1-cbranchereau@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Dec 2022 22:08:41 +0100
Message-ID: <CACRpkda4NpF9D=1zu6-MU5T9+eoNfSrNhXLUhYJizKmYs_b+jg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add support for the orisetech ota5601
To: Christophe Branchereau <cbranchereau@gmail.com>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, paul@crapouillou.net, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 19, 2022 at 8:52 PM Christophe Branchereau
<cbranchereau@gmail.com> wrote:

> Changes since v2:

This v3 patch set applied and pushed to drm-misc-next.

There were some minor checkpatch warnings that I just fixed
up while applying. Check the result in linux-next once it percolates.

Yours,
Linus Walleij

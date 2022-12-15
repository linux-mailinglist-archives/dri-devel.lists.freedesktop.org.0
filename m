Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AAF64D995
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 11:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7FF10E51A;
	Thu, 15 Dec 2022 10:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2E510E519
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 10:31:25 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id e141so2967901ybh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 02:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XX+3f9Jwxgm3fjxBqATipqiQtxv3ULa91+RK1dgyvd4=;
 b=mnyoMdbCUmTDjkmawt7QqTqrMzsjNZ/ai3V09PmVKmsPN8oL3uV/Fd4knI4BRJTUDZ
 Gk5zOHiV7SN+O+FlIhfn2f5brBs9iYe6Q71atAGtMCXjhsOz10aj7geupTCeE/CtCAP9
 oX7sT386pIsxG0Lp+yKCL6DRhPKPxY2biz907OS7dTAI/TDGPz7I6SoCLWGRVOx6qgIk
 Z5cajGTZWyVsmhtOgTJRpnUmIyKqaG4R3oVl6fILz0UvL+zpUgnFxThjs1eDs0yCFOkH
 5T2hdvbsU7SavDXJnqOsv0EbGn0LxQaqFhnvEEqvLOuRruEsmXzdhQIbyepsnYT3ySZV
 DLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XX+3f9Jwxgm3fjxBqATipqiQtxv3ULa91+RK1dgyvd4=;
 b=Fc5jizVfmGmj/0CLzunwUsqZzui2sJxJQHjW8U0+zBtyHkJvdPbpyZc9x8nfEvddDy
 3Bv7Si2BXybPZZbNaTscSDF+DFjiC6BgIRuapNNH8D8d+F+2NQyZaGOT9L6VcUb4hRhW
 n0R2dWMXsryCQJYOpSvUqdnQt3GjKbb3Qr0w1Ai2SYHfkOfKsoKtNgw/XX/hUfo9391g
 0YvS7N+B1nsuXfFmIxkkuXtLBGQbgXXS/GKp7wP82YAaE7XAjHGyz66pugZFtrF34Ene
 A1CM2vOaiYW9FbukPTXzIsyYM+pWTQ17B1POVt9qVgXtm6KiUe9bLFhlkZrIAWQsnFur
 HckQ==
X-Gm-Message-State: ANoB5pkHMNFRCuiXi4Yr/3TQn4XmtfZ7A9wAmHEYuk5njUWNIDvO0i1U
 RwRwf63OvrRzjIPHrmJFnYZKfbwcHdCe34U2J2F/CA==
X-Google-Smtp-Source: AA0mqf5b5gXSrumgFf+LRtQ7Yw+51BXrZHF4HFnHjq32NHSqJWHcYXvRt9hSzYIHzy59WoULmiUU6LkvMV1uJ8FLBjU=
X-Received: by 2002:a25:6b51:0:b0:6c2:4ea5:fc95 with SMTP id
 o17-20020a256b51000000b006c24ea5fc95mr79059064ybm.619.1671100285097; Thu, 15
 Dec 2022 02:31:25 -0800 (PST)
MIME-Version: 1.0
References: <20221214180611.109651-1-macroalpha82@gmail.com>
 <20221214180611.109651-2-macroalpha82@gmail.com>
In-Reply-To: <20221214180611.109651-2-macroalpha82@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Dec 2022 11:30:32 +0100
Message-ID: <CACRpkdb_yaJSH0+RcEXh8w-48uCpdUS12TrGAD96pFyODKvetQ@mail.gmail.com>
Subject: Re: [PATCH V5 1/4] drm: of: Add drm_of_get_dsi_bus helper function
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
> Add helper function to find DSI host for devices where DSI panel is not
> a minor of a DSI bus (such as the Samsung AMS495QA01 panel or the
> official Raspberry Pi touchscreen display).
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>

Nice, exactly as it should be IMO.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

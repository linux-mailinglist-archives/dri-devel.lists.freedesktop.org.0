Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1D84ECE8F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 23:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295E810E2CB;
	Wed, 30 Mar 2022 21:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02B810E2CB
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 21:09:23 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g22so14844132edz.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 14:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AIWUmlaDC6yTdkOws5vD5QTYsCbCyE6p7xDvHws/iio=;
 b=I1RLXU6q/tBCEt2oknEeNRaPbNXZjphrUkxnrg8fmmotMEKyRIkyjUdi87mFJntny8
 L0rFNrc1dIUelM7aed1PvlC7mO8H7z+jz5ULiY97z/g53LtVRw1KrL1Ba+NFKBQhm2Gw
 nxBZREsYkwdn8ah8iCdmgXvB+XkWHsn2mumxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AIWUmlaDC6yTdkOws5vD5QTYsCbCyE6p7xDvHws/iio=;
 b=3bRzA8p7KuHL3AYED9DJPJcJgBiZnvvSqBIuJYoYgfG58jMpkj/g50LNficL5wyuJh
 Mf6T0NFttAnxiDFMU+lzv/hr9E3SgAQlZ0/3Cp3+8BHessIAjT95kgWYZjuAH9rp09J1
 ppyZHXUH7Hb4qIait8+X1nm2TL3D1wgFece/ysNXMGDfha4QqJIrkMhBOzZi9rWGyN/8
 DM1q7cEouGtht1srsiwFVAPIm0mbHgvv3b3H+DsPJ4nNfgCLafdJwZ/lKC7f7HGN1e6o
 Rl8VSOXjTpPQDEOss5fgY6/Hi9llohMn4rRpLj/PgCsBDcRCcDX3cWZ6I/IRW6Tr+fYg
 OTZg==
X-Gm-Message-State: AOAM533HGbhNWTyK9PCtbSipfAdzEgVFX4fwpCijF4e1h3y7jsHjsGBu
 TshMPtx3EnmCkxOx5sXbAfwK9cQKVa9ZgQ==
X-Google-Smtp-Source: ABdhPJx/D+4yD3vLEpUBJ50t4a6uXd6li0KFryAxU3PyduVg3hx9zXoeCFJvOaLgVrJQjXw4hnTu+Q==
X-Received: by 2002:a05:6402:3496:b0:419:82d5:f1d9 with SMTP id
 v22-20020a056402349600b0041982d5f1d9mr13445729edc.36.1648674561938; 
 Wed, 30 Mar 2022 14:09:21 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 h7-20020a1709066d8700b006d4b4d137fbsm8644805ejt.50.2022.03.30.14.09.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 14:09:20 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id i4so12179101wrb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 14:09:20 -0700 (PDT)
X-Received: by 2002:a05:6000:1704:b0:203:d857:aa7a with SMTP id
 n4-20020a056000170400b00203d857aa7amr1279796wrc.513.1648674559933; Wed, 30
 Mar 2022 14:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220330090435.1.Id1522250dd07a6b574c1cc7826023fc6acd141b4@changeid>
In-Reply-To: <20220330090435.1.Id1522250dd07a6b574c1cc7826023fc6acd141b4@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Mar 2022 14:09:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VK-gsp1mqU14ks9ocP3-LTvpa=fVNR_RaUBO83e1usuw@mail.gmail.com>
Message-ID: <CAD=FV=VK-gsp1mqU14ks9ocP3-LTvpa=fVNR_RaUBO83e1usuw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Fix AUO B133UAN01 panel id
To: Matthias Kaehlcke <mka@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 30, 2022 at 9:04 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Two digits are swapped in the AUO B133UAN01 panel id (0x8495 instead
> of 0x8594). This went initially unnoticed because the panel is still
> detected, though it is set up with a conservative default timing. Fix
> the digit swap.
>
> Fixes: ec57376fba5a ("drm/panel-edp: Add AUO B133UAN01")
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Doh! OK, pushed the fix to drm-misc-next w/ my Reviewed-by tag.

d049a24b15d8 drm/panel-edp: Fix AUO B133UAN01 panel id

-Doug

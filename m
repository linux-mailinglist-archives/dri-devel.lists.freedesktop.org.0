Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F35E2413E9E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 02:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7842E6E942;
	Wed, 22 Sep 2021 00:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A236E942
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 00:24:30 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id y201so1863884oie.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 17:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Hf6Vp80+wIn/KQ49ssxtpe6J0FEpDcx3iJaae+hOiS4=;
 b=MR5A5PaM8kTVWrRY5xBSFlPjfMBjW6eAbL3P9GdXpswPZNYKj9wqCll697/9rVEhBv
 7Xf9idcgBtPmWxERSix4BsI/dZMRCGek9p+/PixgZeSNTSFzaUI4tN1ohK5r1MV7STc/
 Hq4I5Ej4ROOJBGi3UK3DHEhzOPQXAS+NbK6ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Hf6Vp80+wIn/KQ49ssxtpe6J0FEpDcx3iJaae+hOiS4=;
 b=JM/GCtVOXNMYIFkBxZoWUGqN3RriupczG2cwlSpKJ4wHPE5bDnU1LqLd0ItlvNmO0M
 EUnyzMRzzM3KQVljYrDgK/e9DZSwWDutjpbnp8jchmNAjhpIFb1l/uPLScU3yLCTlrvU
 i0w+Fg04NQtOT/Jkz31ffCFCCuue2IywDSnVkVfIByb5dL2VPR3LyJGJHHFhUQHuE5fb
 wVoIWW0kfHg+DvADNY77gmk3eR4pjj4S5ApAelilUDs9vg0ldQUUzImIjSC9Oej2rV9n
 LRvo/NcNsV9y9/54au+oi9g9TgzIDsdwwzCMsC/yt2blx6Y+7vZDvePcmVClrqPCvMUc
 2Xow==
X-Gm-Message-State: AOAM531gHe2zYcm0c83PzHjUZwY5X4AJBiez3x88ePuu8E7reCZOU42e
 kp9VKU7E1muOEBmmpd44PzeyqgfDv37n6pXqPMrc1g==
X-Google-Smtp-Source: ABdhPJy+7x+o01xSRcYL1tP3gc/HLpDYlxHmu9rG3Eq6t1GkJCp7L77UDYrdDQYJ9J3mh6xNGheKnMg3238u+Tv1eHE=
X-Received: by 2002:aca:3110:: with SMTP id x16mr5889098oix.64.1632270269763; 
 Tue, 21 Sep 2021 17:24:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Sep 2021 17:24:29 -0700
MIME-Version: 1.0
In-Reply-To: <20210921110556.v6.1.I2351df94f18d5d8debc22d4d100f36fac560409a@changeid>
References: <20210921110556.v6.1.I2351df94f18d5d8debc22d4d100f36fac560409a@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 21 Sep 2021 17:24:29 -0700
Message-ID: <CAE-0n53A6VOqnCakvHJ+AwiHcZRnkZ+XAhCgXOZce53SDr-B6g@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] drm/bridge: parade-ps8640: Use regmap APIs
To: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>
Cc: dianders@chromium.org, Sam Ravnborg <sam@ravnborg.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org
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

Quoting Philip Chen (2021-09-21 11:06:16)
> Replace the direct i2c access (i2c_smbus_* functions) with regmap APIs,
> which will simplify the future update on ps8640 driver.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE66419E82
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 20:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F286E02C;
	Mon, 27 Sep 2021 18:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309096E029
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 18:43:30 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 o59-20020a9d2241000000b0054745f28c69so23635347ota.13
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HADnuLjmEAtZ6Adqy4cLTMjazC/sJm6aQiFvmVyyZo4=;
 b=THiCwO7Zruhs5bQqv3BzUlc2PVXfItncfte4Dq3tvyVrPzlN4omD2HJN0zKWLQu7Gq
 2R5/2tJoY80gO09YsafkznMakjhV0PKeqTcfocK6lgX1f5Ak98bouzA6SLA8l+m2Fm87
 jL7k3dh+oKEedYtCK2//ERCD0Et5Oy2spD8tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HADnuLjmEAtZ6Adqy4cLTMjazC/sJm6aQiFvmVyyZo4=;
 b=mNpvaj9MTQK3T1qAAfk7fDmgpSogoTD8hqlUNnpQ9E7iUxUfVUt+cHfypBjmBrsHUz
 FHo9jSPbzNcQ6+vWcAqTRI+tbZN8jTLs416rasH7kpxX/sUh6dVmas/lfYYNNFvOkLE4
 XJ0Bfch6ZOJM5vh4lWG2eZiIruNGlX0mPOJAOg334zEpxEOxKmGK9c0XIxOIzayLDbzY
 GNfVRwXZZtbIBRqRX3SJyC+oLEDbUsWS9GTz5bLjKDWL+HRF7URcT/oYS2e4XO33tDDq
 lzUwd6z2a6+OQmjSooJWYkTU6A2RHIKKGQGFJPNts00/2R4uC/nDpktKSur70SPVYqR/
 wLtg==
X-Gm-Message-State: AOAM533A+xvbcwElpSWgs5ecoRZEN5whaDoIrQR0BKDSxDfJ8WHfxpzX
 sbYQKrKahf2i57zac8FxbYQPhr+ns92idg==
X-Google-Smtp-Source: ABdhPJwcM9CjjDVFmj5AN5LKg5lx4c2qVmxWM3yyiePwJADAXazGl5K7zbhMay+FweGp2aB2yPkUNA==
X-Received: by 2002:a9d:192c:: with SMTP id j44mr1322550ota.302.1632768208806; 
 Mon, 27 Sep 2021 11:43:28 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com.
 [209.85.210.42])
 by smtp.gmail.com with ESMTPSA id 4sm162163ota.48.2021.09.27.11.43.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 11:43:28 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so25690582otb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 11:43:27 -0700 (PDT)
X-Received: by 2002:a05:6830:112:: with SMTP id
 i18mr1353439otp.186.1632768207428; 
 Mon, 27 Sep 2021 11:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210924162321.1.Ic2904d37f30013a7f3d8476203ad3733c186827e@changeid>
 <CAGXv+5Ej=sDXOy1Hg9fQrdxN-OEmxpfUjE8PfxgfBkWu9dvOXQ@mail.gmail.com>
In-Reply-To: <CAGXv+5Ej=sDXOy1Hg9fQrdxN-OEmxpfUjE8PfxgfBkWu9dvOXQ@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 27 Sep 2021 11:43:16 -0700
X-Gmail-Original-Message-ID: <CA+ASDXO4yGRDAH24YygC_utY3xBesLT1VapTibeiCYoH-xoH1Q@mail.gmail.com>
Message-ID: <CA+ASDXO4yGRDAH24YygC_utY3xBesLT1VapTibeiCYoH-xoH1Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/rockchip: dsi: hold pm-runtime across bind/unbind
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thomas Hebb <tommyhebb@gmail.com>, 
 aleksandr.o.makarov@gmail.com, stable <stable@vger.kernel.org>
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

On Mon, Sep 27, 2021 at 12:10 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> On Sat, Sep 25, 2021 at 7:24 AM Brian Norris <briannorris@chromium.org> wrote:
> > We should match the runtime PM to the lifetime of the bind()/unbind()
> > cycle.
>
> I'm not too familiar with MIPI DSI, but it seems that the subsystem expects
> the DSI link to be always available, and in LPM if power saving is required?
> If so then this change matches that expectation, though we might lose some
> power savings compared to the previous non-conforming behavior.

Yeah, I was a little torn on whether we should care about any possible
lost power savings here, because now we stay runtime-enabled even if
the display is not enable()d. But I'm not aware of a good hook for
handling this kind of a sequence, and I'm not convinced there is much
savings by disabling the power domain in that case.

> > Fixes: 59eb7193bef2 ("drm/rockchip: dsi: move all lane config except LCDC mux to bind()")
>
> This hash is from some stable branch. The mainline one is:
>
> 43c2de1002d2 drm/rockchip: dsi: move all lane config except LCDC mux to bind()

Oops, good catch. I've been doing too much debugging/development on
5.10.y stable. Fixed in v2.

> The bind function is missing an error cleanup path. We might end up with
> unbalanced runtime PM references. (And also possibly an enabled pllref clk.)
> This is a pre-existing issue though. The code changes here look correct.

In v2, I've performed cleanup for the runtime PM state in this patch,
and added an additional patch to fix the other existing issues you
noted. Thanks.

Brian

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C77C435860
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 03:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7296EA28;
	Thu, 21 Oct 2021 01:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3CF6EA2A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 01:41:48 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id o83so11946887oif.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 18:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RFZLsyhyggQBAw1ieiqx/iLchu3wd9m2t5ZqNswJbDw=;
 b=CR2ojTcfZCGkDc9qM8OY755pFDFVKGzCfda+m68dI3gOCMZ6aMJ6CWmeT+xv9zNEFy
 B5YxaFbEA5oaGtG+Nq2ynNsIp5mFZ1ZNJjt9U3A7MjFP/kd8YFdQF+yfFpwvJs9WwsxM
 wFM3uJB0XOUAx7XkgvPGwGXwAdLiNdV2ZaSFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RFZLsyhyggQBAw1ieiqx/iLchu3wd9m2t5ZqNswJbDw=;
 b=yxLwA65cz3bf8OlHR4hSfWTKnb0/ls5Qid0e71ZVegSki1zvl2RyMDavWKpm8Si+do
 yL8NMnYuaibWT8XADwQ80zXdBwIQ0mak7xPVirnvIUJ2tHr7iZ5IScv/QF4GPTMdbG88
 7bmgfd+7FIYKUMfbrqfgGYRvLu3JflNhvwn8+jIR9BZdfy7pXCMdKKureIZVp/wP/qWP
 HNlQCMqgHH2WiDAFtINBQS86turL1/8k1PYdvVx0Bn1KVL+mLh1k70TszjM1JIqCv60A
 fNU0Q8C6osOHK4qS33mR98cTtfYE2w+Xe4e1dJ1AhP+svMmf5TRBYZV8R3VXPYPpVFmh
 c2NA==
X-Gm-Message-State: AOAM5323Uta9mU/qy65b/zeahjquh2742RVbUC7Ck255Hp67Jow7F1u2
 0V5lm4quhYt0h9OpYiqrNFoirNTg5IduxA==
X-Google-Smtp-Source: ABdhPJxToCDJHAtE5wpvK43poKQfz/XVJkYuCKo6oXF4kpa/cTC5TS6ccKr1x94qBCdqvtLQjvubPg==
X-Received: by 2002:aca:b686:: with SMTP id g128mr2325698oif.38.1634780506438; 
 Wed, 20 Oct 2021 18:41:46 -0700 (PDT)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com.
 [209.85.161.45])
 by smtp.gmail.com with ESMTPSA id 187sm778595oig.19.2021.10.20.18.41.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 18:41:44 -0700 (PDT)
Received: by mail-oo1-f45.google.com with SMTP id
 w10-20020a4a274a000000b002b6e972caa1so2543592oow.11
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 18:41:44 -0700 (PDT)
X-Received: by 2002:a4a:424b:: with SMTP id i11mr2056955ooj.87.1634780503573; 
 Wed, 20 Oct 2021 18:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211020161724.1.I67612ea073c3306c71b46a87be894f79707082df@changeid>
 <20211021004015.GD2515@art_vandelay>
In-Reply-To: <20211021004015.GD2515@art_vandelay>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 20 Oct 2021 18:41:31 -0700
X-Gmail-Original-Message-ID: <CA+ASDXOAJqqEqx2ry4aRW4RZ87okosqxYDKRBJef8Sj_H2b1nA@mail.gmail.com>
Message-ID: <CA+ASDXOAJqqEqx2ry4aRW4RZ87okosqxYDKRBJef8Sj_H2b1nA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Make PSR-disable non-blocking
To: Sean Paul <sean@poorly.run>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 stable <stable@vger.kernel.org>, 
 Zain Wang <wzz@rock-chips.com>, Tomasz Figa <tfiga@chromium.org>, 
 Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>
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

(Dropping Andrzej, because that address keeps bouncing. Does
MAINTAINERS and/or .mailmap need updating?)

Apologies for the double reply here, but I forgot to mention one last
thing for now:

On Wed, Oct 20, 2021 at 5:40 PM Sean Paul <sean@poorly.run> wrote:
>
> On Wed, Oct 20, 2021 at 04:17:28PM -0700, Brian Norris wrote:
> > Prior to commit 6c836d965bad ("drm/rockchip: Use the helpers for PSR"),
> > "PSR disable" used non-blocking analogix_dp_send_psr_spd(). The refactor
> > accidentally (?) set blocking=true.
>
> IIRC this wasn't accidental.

One other tip that made me think it was accidental was that today, the
|blocking| argument to analogix_dp_send_psr_spd() is always true. If
non-blocking support was intentionally dropped, it seemed like you
should have dropped the non-blocking code too. But that's a weak proof
of your intentions :)

Brian

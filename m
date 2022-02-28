Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74D4C7579
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0728510E199;
	Mon, 28 Feb 2022 17:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF07C10E228
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 17:54:52 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id hw13so26373832ejc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 09:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rKyFAXCmKAYNuarZ8yzonNl7KAxrf0Qm9q5cbYgdEIY=;
 b=JDy8fgGUxf0IGJHfk/O0WyiqfUorrv0vNRQq82dCqBFpjXsWqco4CzrVWvadRg1/0t
 n+RDd3ztRNk5y4or+DUO9bjKQaeqkhnkPAXva+M2qMDwMS9w1ybbP4a+pECwFE+qimRA
 Uk39Oshxgwz/pp7FehPY5V1w9jkfkplrbf25w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rKyFAXCmKAYNuarZ8yzonNl7KAxrf0Qm9q5cbYgdEIY=;
 b=h7g4qkGxTMjm91l/ccbPO/mvBP9ZcjHk1VC69FaN3yDvwdpqoWDOk3gUAiI5joZhBp
 UoFxr98SNcL9YEtrn1udETqM3jLXrLeNEZkBLckLQlLYXx/hodFt3TDoIi0cZX/u+I9x
 tpGujvUXiiiydwqTOgmCBKIDyPYSSWkgWL1SU9GyM+8/zbc5+JMcSUN9MOGqdf4xr5z8
 zl65waB2tsOCch+tYsxM3efaDLKHL0d7n96C5fRYsYEmZAR578sOE497BCaPkZfh+Bdv
 tgxg0bhCFw7D9XDHUmfKIEHOutyEWXknmQGKPwQFBl6rzGZHb2Nek0dHVkTotqC60lbY
 gdQQ==
X-Gm-Message-State: AOAM530cccmlC/ZdVlA89O0quE8/m1OOwrbJRLy7AUvWMl7le50pMHqy
 wQv+hxNVw23ICjif4siflBOsfkj+ocf47A==
X-Google-Smtp-Source: ABdhPJxIX/TZIpjlxKa28/cXz7RG5EUAjLuUpibmcmJIYE3hUFNHzTND4NXXHLSqF6HDEX/La0ZbVw==
X-Received: by 2002:a17:906:a1d3:b0:6d0:80ea:2fde with SMTP id
 bx19-20020a170906a1d300b006d080ea2fdemr15180646ejb.344.1646070890928; 
 Mon, 28 Feb 2022 09:54:50 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 a25-20020a50ff19000000b0040f84cd806csm6232701edu.59.2022.02.28.09.54.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 09:54:50 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id b5so16763846wrr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 09:54:49 -0800 (PST)
X-Received: by 2002:a5d:6543:0:b0:1ef:7194:3efc with SMTP id
 z3-20020a5d6543000000b001ef71943efcmr12481297wrv.422.1646070889301; Mon, 28
 Feb 2022 09:54:49 -0800 (PST)
MIME-Version: 1.0
References: <20220222141838.1.If784ba19e875e8ded4ec4931601ce6d255845245@changeid>
 <CACRpkdbQ9U22afR74YiZs95qCm7dnLb2k4_nT3Le__hJPpDGUw@mail.gmail.com>
 <YhXBIxbx63IXBU7L@pendragon.ideasonboard.com>
 <CAD=FV=UV+3PNF=O8Zv4UJK50gvDx=WHbamLLhH5ANZUBeCxjdQ@mail.gmail.com>
 <YhZY+FLTlv7V5BIB@pendragon.ideasonboard.com>
In-Reply-To: <YhZY+FLTlv7V5BIB@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Feb 2022 09:54:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ux9aPqNnbs4vj1EO49smW7f6VVm4VyGTy246QjGUfqHg@mail.gmail.com>
Message-ID: <CAD=FV=Ux9aPqNnbs4vj1EO49smW7f6VVm4VyGTy246QjGUfqHg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Properly undo autosuspend
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Brian Norris <briannorris@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 23, 2022 at 7:55 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> On Wed, Feb 23, 2022 at 07:43:27AM -0800, Doug Anderson wrote:
> > On Tue, Feb 22, 2022 at 9:08 PM Laurent Pinchart wrote:
> > > On Tue, Feb 22, 2022 at 11:44:54PM +0100, Linus Walleij wrote:
> > > > On Tue, Feb 22, 2022 at 11:19 PM Douglas Anderson wrote:
> > > > >
> > > > > The PM Runtime docs say:
> > > > >   Drivers in ->remove() callback should undo the runtime PM changes done
> > > > >   in ->probe(). Usually this means calling pm_runtime_disable(),
> > > > >   pm_runtime_dont_use_autosuspend() etc.
> > > > >
> > > > > We weren't doing that for autosuspend. Let's do it.
> > > > >
> > > > > Fixes: 9bede63127c6 ("drm/bridge: ti-sn65dsi86: Use pm_runtime autosuspend")
> > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > >
> > > > Hm. I know a few places in drivers where I don't do this :/
> > >
> > > It seems to be a very common problem indeed, I haven't seen any driver
> > > yet that uses pm_runtime_dont_use_autosuspend(). We could play a game of
> > > whack-a-mole, but we'll never win. Could this be solved in the runtime
> > > PM framework instead ? pm_runtime_disable() could disable auto-suspend.
> > > If there are legitimate use cases for disabling runtime PM temporarily
> > > without disabling auto-suspend, then a new function designed
> > > specifically for remove() that would take care of cleaning everything up
> > > could be another option.
> >
> > Yeah, it would be good. It's probably not a yak I have time to shave
> > right now, though. :(
>
> I don't insist on shaving that yak right now :-) This patch is fine.

Landed in drm-misc-fixes:

26d347434829 drm/bridge: ti-sn65dsi86: Properly undo autosuspend

-Doug

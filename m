Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4294C1AD3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 19:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E1810E192;
	Wed, 23 Feb 2022 18:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34A710E192
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 18:20:34 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id q17so45813396edd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kc817LydO28fR6UkAPJN+rJA2Gepj0IpXCsI544eHP0=;
 b=hXkbGMYnWmwgIGl12e3NPzs5q+2Lgx8L+R2+dw2D7uuQK3jF07CqtynQW9kqCY8jiz
 9ax3T/B/9vUsDEPKt0lz6WV67/I1ZdJj5Dqo93BAQomcLcnjHrOsI0C8BV8ixjHWuEEt
 a3lHWmQ9yRRUixbMzbtt4mgK8WEH4rm0XgbxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kc817LydO28fR6UkAPJN+rJA2Gepj0IpXCsI544eHP0=;
 b=37F5exJLwfFqU8JTWvULRR+bc1qupKkMm/aW6iH3bvyHmi3rB7B/mR35IgjbLFFYm1
 cXGtX2r+udGJ3gG8JoVXN2DJ6J0gDuoB2MBFB8prSceiLVF8mvFLoNJzuwxiRuHe+pe4
 2JHcaqWfZPLbufSBuGLuHZ27O8z3do9w1iBnFFeS1LIMQOK9yn8Ngu+0zZHCK7JSyPIH
 4/FhmH9vkZ85FRlrLlZfq9eTEp3EEl/2zUwoaQYDYWgcoyGydu22/y8goIjG5rBRzUL4
 4dqKg+/yVCRTZo/kbMD+4jQdZLHm7ZdTpoZgilN893Qj16NTcG8OsiANDFkbsCHWUH+V
 Q/2g==
X-Gm-Message-State: AOAM531cv/7r8rj0xkZ4FFJlWYqLK0iNK1VQ5XX52YX19Y5ugUpCveUJ
 pCbk91u1zkcj7V9IGvzBL/DULBjlcAOXL1TAfP8=
X-Google-Smtp-Source: ABdhPJy7hb1aUHPvj0gotNR/RMcr84lFhi4wJIaGjhHng/lupGxzUyPJNK8JgDe5w77WxGB0fydLMw==
X-Received: by 2002:a05:6402:845:b0:412:ad14:863e with SMTP id
 b5-20020a056402084500b00412ad14863emr695101edz.380.1645640433045; 
 Wed, 23 Feb 2022 10:20:33 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46])
 by smtp.gmail.com with ESMTPSA id 1sm164430ejm.173.2022.02.23.10.20.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 10:20:32 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id u1so41009432wrg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:20:31 -0800 (PST)
X-Received: by 2002:a5d:5112:0:b0:1ed:c1da:4ad2 with SMTP id
 s18-20020a5d5112000000b001edc1da4ad2mr660312wrt.342.1645640431088; Wed, 23
 Feb 2022 10:20:31 -0800 (PST)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-11-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=Wwayx1Y-xv=RPuJbG+Q1wHrUWgh4P7wuzy_bAL=_FN0g@mail.gmail.com>
 <YNM+JO4AAkPOLg7Y@pendragon.ideasonboard.com>
 <164563949999.4066078.2399611738908533224@Monstersaurus>
In-Reply-To: <164563949999.4066078.2399611738908533224@Monstersaurus>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Feb 2022 10:20:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WSHpu3Ub=0Gbq01o_s-SsUa_Q6uC7Z3PaxFL00eeJbdw@mail.gmail.com>
Message-ID: <CAD=FV=WSHpu3Ub=0Gbq01o_s-SsUa_Q6uC7Z3PaxFL00eeJbdw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/11] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 23, 2022 at 10:05 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> > > > +       /* For DisplayPort, disable scrambling mode. */
> > > > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> > > > +               regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
> > > > +                                  SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);
> > >
> > > I'm assuming that this is the important part of your patch? Would be
> > > sorta nice to include the "why" in your comment. Why do you want to
> > > disable scrambling mode for DP but not for eDP? Maybe you care about
> > > compatibility but not EMI if you're hooking up to random DP things?
> >
> > I'll investigate and include proper documentation in v2 (or drop the
> > change altogether if it's not required).
>
> And indeed, this part is important. If I drop this hunk - then I get no
> display output.
>
> I'm afraid I don't (yet) know the reasons 'why' to extend the comment,
> beyond "Scrambling is not supported for DP".
>
> If anyone already does, please feel free to provide the text, and I'll
> include it in the next revision, or I'll try to do some more digging
> into this part.

I don't know _tons_ about it, but I later learned that the "alternate"
scrambler is used for eDP and the normal scrambler is used for DP. I
don't have any background about why they are different other than what
looks to be intentionally making the two things incompatible.

...so I guess that would make it pretty clear why you can't use the
alternate scrambler for DP. I haven't personally done the research to
know if you can be officially DP compliant with the scrambler
disabled. I also don't know why the ti-sn65dsi86 makes it so difficult
to switch to the standard scrambler or if it works at all... ;-)

-Doug

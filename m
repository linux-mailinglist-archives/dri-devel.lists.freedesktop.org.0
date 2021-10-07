Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3F5425B0A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 20:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143026E5AE;
	Thu,  7 Oct 2021 18:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F2C6E5AE
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 18:40:08 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id a3so10281377oid.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 11:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=guZCAG9/M6PTktkx+p5Y506i79kkw+F0pi1xST3ThjI=;
 b=eoaFzaHrfJm1jzZKszGfYysGFsPkWiLkV42qmUaekj0K6fMN2c0pWhvZv78K/0Ad4h
 B0fmpjHvEEU6jmiaMpLUfTIJNZ8ZO+LbthEG1lvmrkvlipbM6Ca0ExLXeRmTVr00aJRd
 aEUGwgH+rUznkfE9N4jbS5jI3a4+CT93HQVqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=guZCAG9/M6PTktkx+p5Y506i79kkw+F0pi1xST3ThjI=;
 b=Fid1dqgIpfBLfkF+kQy8qRRwNWUyUDLybWl/AvmqKs9KdM6GPXyIco82XwDadFuz9D
 zhUrxMs5OQhB3PaFIvDchaL7p8KR9xEcuTfR+H3pfgwJ9GJAiabKBs1p9Oyvamon+Oxs
 NsY1CvaFaEpNh8bd89FuD43YUYFNnTWomIa9dMA2hoR9DKrXZVoRYX2hF3O4UAfqsDI+
 D7RwV3/dRWtRz8x9dEuKnbG0uKInXD04XoATR29y5C0xYHkLenA/MsUMhBa7+gegaDcg
 OIi2vHJCuGxeKZtyRppY/oapYK0uLIpQxzoPKnrNW1Uu0Koed6AnovYioEkHrrkz66fX
 m8tg==
X-Gm-Message-State: AOAM53220oDQM7dZTWP1ZDnpAu1mO0ELWojPxDHP/jurGjT2ikeiinvL
 ammKtELpPUFogGIr5yj/VEV/W1J0zIOOversnjaC8g==
X-Google-Smtp-Source: ABdhPJxpUjFTInikBOthEuo2yMMcPcoUAGKwZEFNquucXrsgJOhNGhmC42pATrvLazjiCWiuJ+9KXCooSjB2ec7opUg=
X-Received: by 2002:aca:f02:: with SMTP id 2mr4508153oip.64.1633632007694;
 Thu, 07 Oct 2021 11:40:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 14:40:07 -0400
MIME-Version: 1.0
In-Reply-To: <CAGETcx9T59dHXodt9MW=tTV_hYhtNOZzYFT=35D--VN7WJ0GqQ@mail.gmail.com>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-3-swboyd@chromium.org>
 <CAGETcx9T59dHXodt9MW=tTV_hYhtNOZzYFT=35D--VN7WJ0GqQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 7 Oct 2021 14:40:07 -0400
Message-ID: <CAE-0n50YqKr1nKy-4WaxsfuwPiJ5kZcf46t-U_4i-TpfXzOX1g@mail.gmail.com>
Subject: Re: [PATCH v2 02/34] component: Introduce the aggregate bus_type
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>
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

Quoting Saravana Kannan (2021-10-06 20:07:11)
> On Wed, Oct 6, 2021 at 12:38 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > diff --git a/drivers/base/component.c b/drivers/base/component.c
> > index 0a41bbe14981..d99e99cabb99 100644
> > --- a/drivers/base/component.c
> > +++ b/drivers/base/component.c
[...]
> > +                       continue;
> > +
> > +               /* Matches put in component_del() */
> > +               get_device(&adev->dev);
> > +               c->link = device_link_add(&adev->dev, c->dev,
> > +                                         DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
>
> Remove the STATELESS flag and you'll get a bunch of other stuff done for free:

I tried that and it didn't work for me. The aggregate device never
probed and I was left with no display. Let me see if I can reproduce it
with logging to provide more details.

> 1. The aggregate device would get force unbound when the component
> devices unbind.
> 2. You don't need to explicitly keep track of and delete the link. If
> either of the devices get deleted, it'll get deleted automatically.
> 3. It will avoid useless probe attempts of the aggregate device before
> all the component devices are probed.
>

I don't think point 3 is happening right now. We only try to probe the
aggregate device once all components probe.

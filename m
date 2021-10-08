Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E7D42664E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 11:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B293C6E866;
	Fri,  8 Oct 2021 09:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F026E866
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 09:02:24 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id k26so7658522pfi.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 02:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BpiWKrR57rQM7hxD4xwCMn+cOv86MxVTUlWOKBIF9Zc=;
 b=VFMKsYXsC1OdO7ykj/+ZxMZ8Hn5nNByFnhBrv8zoYRghl3VkIF+zi5Bwtpd8+d1Sz0
 llWMCj0xzN1Ypi9r8oEHGOtQZbTL10oajgt17X8RggPsMnm3vRhiIY8DswfnJcm0tuuR
 H5RSmoBqNPZb7KwsRu1BY5RSf1bppufmQ/BM30ArE9XMmmBbKzNy4L+CZr8RrN9QqkVf
 qoGFM4hs0z/G9cKVX2/0UHNL34icSi97JN47M5EfKRNa3HtQRW2VqTifJKgtF7UAqXlA
 7ILfnNZHrjUsyA/056YZSUexntn5lmHx5m+Iz+eN3YuZppAdXjjAsXV0PHDy87oRJqSf
 BprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BpiWKrR57rQM7hxD4xwCMn+cOv86MxVTUlWOKBIF9Zc=;
 b=tBwuWnPN6uOQUcBV2PPQQpZXxGKKOKVm5f7/6wnNOjyaoQarbE7u4helpU65SHX3Mk
 z1nhthwL29tFapXt10Q6P6KQTHT78uc1epHQgtp0XCeQuCtZK3lt/pJdgQbXaUllF6tE
 4RhtUquUsfeRUhC5keqeOzgXNltRLac92/6e5xMonSZMpug7k0vWjNjxv9t/AtvUty/i
 H5phfXs6aJfHwKFDm8Gk0rcbhn4b5+VFig7Lmm4yVifGvsXn85H/HxRPaqFEdA6AdO4n
 DXk2KGOMxATsV100cWcj8fGK2PH+++8bPKZ8tp4bR366YaAXCiIHPASr1OSKo3zqGpjn
 3/Wg==
X-Gm-Message-State: AOAM531hroJu8RkYxnrGeUHexUsZvc+aPIaiu4QvE0OxF1pcESdCg1iE
 Gi20YOpDjFhLNXUE6jejadFkzyZV2Z0vKB9VmQ3fCQ==
X-Google-Smtp-Source: ABdhPJz/eSZYZbbohyXSbF3iCEa5NfEfjluHsJXnAVrVvxDZzvMFxB8jJVRaL2Iqp9sM0kUafPTLamHNcE+LgaV+IsU=
X-Received: by 2002:a63:3643:: with SMTP id d64mr3759264pga.110.1633683744518; 
 Fri, 08 Oct 2021 02:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210907024038.871299-1-marex@denx.de>
 <CAG3jFyv-dHKn1HmMSU25zT1wfU0Zur_u45kD47KXrsz_pPEu0Q@mail.gmail.com>
 <f28f9d1a-f2fe-8e04-a94e-acf940eda508@denx.de>
In-Reply-To: <f28f9d1a-f2fe-8e04-a94e-acf940eda508@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 8 Oct 2021 11:02:12 +0200
Message-ID: <CAG3jFyu=jki93RoSZ3w1kXXgmk1rvLq1p6CQZOna+emP9GBqiA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Implement .detach callback
To: Marek Vasut <marex@denx.de>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
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

Applied to drm-misc-next

On Thu, 7 Oct 2021 at 21:51, Marek Vasut <marex@denx.de> wrote:
>
> On 10/6/21 11:47 AM, Robert Foss wrote:
> >>
> > On Tue, 7 Sept 2021 at 04:40, Marek Vasut <marex@denx.de> wrote:
> >>
> >> Move detach implementation from sn65dsi83_remove() to dedicated
> >   .detach callback. There is no functional change to the code, but
> >> that detach is now in the correct location.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Jagan Teki <jagan@amarulasolutions.com>
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Cc: Linus Walleij <linus.walleij@linaro.org>
> >> Cc: Robert Foss <robert.foss@linaro.org>
> >> Cc: Sam Ravnborg <sam@ravnborg.org>
> >> Cc: dri-devel@lists.freedesktop.org
> >> ---
> >>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 17 ++++++++++++++---
> >>   1 file changed, 14 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >> index 4ea71d7f0bfbc..13ee313daba96 100644
> >> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >> @@ -288,6 +288,19 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,
> >>          return ret;
> >>   }
> >>
> >> +static void sn65dsi83_detach(struct drm_bridge *bridge)
> >> +{
> >> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
> >> +
> >> +       if (!ctx->dsi)
> >> +               return;
> >> +
> >> +       mipi_dsi_detach(ctx->dsi);
> >> +       mipi_dsi_device_unregister(ctx->dsi);
> >> +       drm_bridge_remove(&ctx->bridge);
> >> +       ctx->dsi = NULL;
> >
> > Is this assignment necessary? I'm not seeing it in the other drivers.
> >
> > WIth this cleared up feel free to add my r-b.
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
>
> It works in tandem with the if (!ctx->dsi) return; at the beginning to
> prevent crash in case the detach callback was called multiple times for
> whatever reason.

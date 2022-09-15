Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4F85B98D8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 12:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F7910E18B;
	Thu, 15 Sep 2022 10:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E24B10E18B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 10:33:07 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id 29so26268302edv.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 03:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=6ifpauVmJUgIH/sgYWdEGfAKQC88gDxZ9NsZnNvTH0g=;
 b=EvxJNskBHSObgaO7mGBWI/uXK0Mb3OD8ALwba2dS1xR96/k3XEE79tNNfWNTafh4Ze
 lqrj8swpHsBHpqi7JBf2SLgSaHPrDDB1sNbdgF/s63+qaEDBXADRV/sM3tdDrtUKas/b
 RSXwk0600eoHlXBcigsdUZWY2LjZgTgQq5l2nCYPIAw+GO0k3U4Xo9vGoyh0gZqK52fM
 OYRIfsdBrxsh+qH3i1MiQg0kKhngWbEB7yVjLhhDhCzTM1BQhId1fazvI3+6GnWnCwYH
 EJvqwn5lO38oymxuYtoK2+m7zrDfu6P4sJL8bLAde98AVqwTt3OQt2JqGAC4szcKqlPk
 4QBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6ifpauVmJUgIH/sgYWdEGfAKQC88gDxZ9NsZnNvTH0g=;
 b=M7FFzfmYQi1N4ZJwVzm669dQ+amW8yHEKg9UHSqo/yr0hCFyEFBqWO35fKwEipkvAE
 IE9557wBnA8vK9O6KBbjzUnrQxDCc+IslGyApGfLTDM+1oig8ypisVR9R1dyGFp0AgX1
 1eWhV02r4vwu0ateg1iS0mAVPv0Rh6SQReaTJ5DpihZDtF2Nc10LrGOHsk690eoFhcCc
 FAm05up8BAFWQSPGH1KbzpEmI78oppOeWDDoKfIymYe20qr468pHCDs0MqRuw6lyiljp
 ypgoYwi9x/XSvR2mQ8e6UlC8ubaZ3+AXnEOnM3ihoTM0V4QpswbHdrOtMZFIEpTgdY+K
 0nfg==
X-Gm-Message-State: ACgBeo2OlY5/iMudhm+ykhx5VHRoDd2V+5i8U7c22hUWYQOahu28lhU7
 VVe8vhBCcxB7eIxncufkEkdC1u6qi5PPkau9vZsZ1A==
X-Google-Smtp-Source: AA6agR4ylPnDzITJuO4HyK24okfIXy3SOGAp/Bfcp1DTAQbL9fSBv0XU1AwfnGlvLYEYSgPhNn2eVev0y2uFvpu0OrM=
X-Received: by 2002:a05:6402:909:b0:435:a8b:5232 with SMTP id
 g9-20020a056402090900b004350a8b5232mr34576311edz.240.1663237986096; Thu, 15
 Sep 2022 03:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220912113856.817188-1-robert.foss@linaro.org>
 <20220912113856.817188-3-robert.foss@linaro.org>
 <CAD=FV=WrH2AAFxV72FZqk-=xU8jzCn6KtcbZRYJAaCwhmvSWmg@mail.gmail.com>
 <Yx9FZDKjOcS9wmcI@pendragon.ideasonboard.com>
In-Reply-To: <Yx9FZDKjOcS9wmcI@pendragon.ideasonboard.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 15 Sep 2022 12:32:54 +0200
Message-ID: <CAG3jFytreStdyLLhUB+gHb3dHnEfUNr66BPQHkU8VdfjYYQiUw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] Revert "drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations for DP"
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Chris Morgan <macromorgan@hotmail.com>, Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Sept 2022 at 16:43, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Sep 12, 2022 at 03:29:52PM +0100, Doug Anderson wrote:
> > On Mon, Sep 12, 2022 at 12:43 PM Robert Foss <robert.foss@linaro.org> wrote:
> > >
> > > As reported by Laurent in response to this commit[1], this functionality should
> > > not be implemented using the devicetree, because of this let's revert this series
> > > for now.
> > >
> > > This reverts commit c312b0df3b13e4c533743bb2c37fd1bc237368e5.
> > >
> > > [1] https://lore.kernel.org/all/20220902153906.31000-2-macroalpha82@gmail.com/
> > >
> > > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 28 ---------------------------
> > >  1 file changed, 28 deletions(-)
> >
> > Any chance you got confused and reverted the wrong patch? This
> > ti-sn65dsi86 patch doesn't seem relevant to the problems talked about
> > in the commit or the cover letter. Maybe I'm missing something?
>
> Aarghhh I missed that when checking the cover letter :-( This indeed
> seems wrong.

Yep. This is a mistake. I copy/pasted the wrong line and then assumed
that ti-sn65dsi86 & chrontel-ch7033 shared a driver. I'll look into my
workflows to try to prevent future mistakes of this nature.

A series fixing this has been posted.
https://lore.kernel.org/all/20220915102924.370090-1-robert.foss@linaro.org/

Thanks for catching this Doug!


Rob.

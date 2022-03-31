Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 982E84EDBA1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593C610E349;
	Thu, 31 Mar 2022 14:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CE410E349
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 14:23:11 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id x31so15604997pfh.9
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 07:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bjmfb5u6fYvrbfFKce9FUHcqYeSNRBNWkwfp3EUyL1o=;
 b=aq8Tt5DETBnK9p7g1wFuXVumc5bg1j0fnKu0ykjPOIH9WRVOhOfytGKOmXl++7bSb3
 nS8biDSdxZVeY+jRnrXalADYk//PYuO6alsULs70todT24ppAOYpxxrTUee24F4PRXma
 bwaoyGWOA/JjQd+Hpdxa3jrq9cXrw/koFFCDRIZ+DMBV0cMWx80rBUFzMgSkRk4PBSyb
 9ghfahlMujefsVa5zk85rn9E7G3b9yp1+8x8E6kuuIYgYkDYedEFe8/mARru6hc7r0fM
 gykRIFyIOEGxeI2zSedrq65AgfE24cRaeTBz8ho3CK7FxUvl6cJUCHrL/ws+QzTrHxJ4
 1s+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bjmfb5u6fYvrbfFKce9FUHcqYeSNRBNWkwfp3EUyL1o=;
 b=tnU1lqo/GFnNYuqRBIeriWSLtupmQbawp1naJekBQcDt9hTFmKv+mpJ1xCVM/Uj4x4
 jZKWfPAaswLQdc5KQ/3//EWMJl62QO8t9SroTIV56bAJZ0BcGOaqtFg0U/92fwopY8J7
 cgRg1qt2uborP2BZIkfBQoQ4pGYrSqY7798lxUyb3dFELP42+mbd4GuPybJ4a9fmn73H
 qjP3XQc+n/QsRGTSDZhBmMUM/mppEIpy3n0Fqk0Jlw/SWfue77c5t4mm2l7OYNFzqxj0
 mQ8lubEmQPskMW/ve4Am1Kmh2EZ/hsM4iFH1CAS5NECUhJcCA/SB278yYmnHhZUsQRsJ
 Ma3Q==
X-Gm-Message-State: AOAM530DRYOVgeWtUZ2kStKr67jGg9DgrTAHbX9gWHuEhaKFI1tGGbDn
 jO9gUDibQi96aqVEIQTavugu5nJkeysNIxe8aOKA7Q==
X-Google-Smtp-Source: ABdhPJzFZtolZNghGoc3LjiS49A2HeAVc8R2QXzcn8f2/PZlGk/VT8Z8GcC1KuNApDG4CbQUAwkbCUWM1NiNuL9SBi4=
X-Received: by 2002:a63:574d:0:b0:386:c67:b383 with SMTP id
 h13-20020a63574d000000b003860c67b383mr10960016pgm.324.1648736590818; Thu, 31
 Mar 2022 07:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220303163725eucas1p26c4a165b20dd629f2129926b1b662154@eucas1p2.samsung.com>
 <20220303163654.3381470-1-jagan@amarulasolutions.com>
 <e104d9cf-73da-330a-db5a-d914839b273c@samsung.com>
 <CAHCN7xKpHFhRKSWQNPFjpav4B=LgipuVY5wNdkCYNQu71GS9Bg@mail.gmail.com>
In-Reply-To: <CAHCN7xKpHFhRKSWQNPFjpav4B=LgipuVY5wNdkCYNQu71GS9Bg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 16:22:59 +0200
Message-ID: <CAG3jFytFrzzXVWODccVBKaiD+ZeW-Kt7sazVdTiXxdUGjdVyNw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] drm: exynos: dsi: Convert drm bridge
To: Adam Ford <aford173@gmail.com>
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
Cc: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Mar 2022 at 17:04, Adam Ford <aford173@gmail.com> wrote:
>
> On Fri, Mar 25, 2022 at 10:00 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> >
> > Hi Jagan,
> >
> > On 03.03.2022 17:36, Jagan Teki wrote:
> > > Updated series about drm bridge conversion of exynos dsi.
> > >
> > > Previous version can be accessible, here [1].
> > >
> > > Patch 1: tc358764 panel_bridge API
> > >
> > > Patch 2: connector reset
> > >
> > > Patch 3: bridge attach in MIC
> > >
> > > Patch 4: panel_bridge API
> > >
> > > Patch 5: bridge conversion
> > >
> > > Patch 6: atomic functions
> > >
> > >
> > >
> > > Any inputs?
> >
> >
> > I'm really sorry for the delay on my side. I was really busy with other
> > things and I was not able to check the display of the boards with remote
> > access.
> >
> >
> > Finally, this patchset works properly on all my Exynos-based test systems:
> >
> > 1. Exynos4210 Trats with Samsung s6e8aa0 DSI panel
> >
> > 2. Exynos4412 Trats2 with Samsung s6e8aa0 DSI panel
> >
> > 3. Exynos5250 Arndale with TC358764 DSI-LVDS bridge and LVDS panel
> >
> > 4. Exynos5433 TM2e with Samsung s6e3hf2 DSI panel and internal Exynos
> > MIC bridge
> >
> >
> > I will post my acked-by and tested-by tags for each patch.
>
> Thank you so much!  I think a lot of people will celebrate when this
> gets approved and merged.  ;-)
>
>

Applied to drm-misc-next.

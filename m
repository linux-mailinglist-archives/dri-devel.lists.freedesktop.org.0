Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586C1512EB5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 10:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5B410E5C2;
	Thu, 28 Apr 2022 08:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4045510E5C2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 08:39:55 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id gh6so8190315ejb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 01:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZM0I9FLBdxBfWI01gte4uSiEvRTRl5rH8dWQh+u9ogY=;
 b=KJgxND+xFH2/Fv+kdMQsSCcy25Pzjbh6piMm1sj3fR70l6wTR9IVRFcZe4VBp+emiz
 7W5JxEnwX1Vv+DC8tO5Dnb93wrEij4Jx1BvrKUmt8XXOz0h88f1l6qZ3beJ9vGxKGywg
 EN6yzr2/5nKQFn0fSrxU2ECF8JsqbC1bh/DKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZM0I9FLBdxBfWI01gte4uSiEvRTRl5rH8dWQh+u9ogY=;
 b=uV5+GsGwgX1tQIUA4LpGo8LfGi8cdYKHvLSIcS6wEHMIsx7dym4Kp7UuL17WGrR0Ra
 U1D3SntM2/j5NXmGr0llhunQebEdOe0FkVGs5gmPqOFC5pwGVb1P1L+zTBHhrBZQwv1M
 /Aq1C7Gw9KWBFFTK5wcTBV1tQ/ndkAY3lU7s3YWPCrUsa85i8W9GUFmbJQTrJ14USqRA
 GUK3ymwJIC+OauDnhB/Kr7wWk9H57eJBJzhJIfw7vTBLJVGiFomiBDjPbqN8cK7CHAw5
 ZIp3h5Dwu/dXWNTOzVDSrfxHwBhIWGFbLyubXGTB8aN2kfcjQc0/2xI797/8jABblJFN
 /Rbw==
X-Gm-Message-State: AOAM530t960nV5eclk56IAMCLFWTFnfAtmaPCW17HB3szSBDlXg2jp02
 siQTGhGFd+g33/6K+ETMvpqv15HCdcirZNoQesKv+E+X0tEMXw==
X-Google-Smtp-Source: ABdhPJzUmAY96r8FtHibCf5TcAZdtnOrMcrJPS+A/mNw7Y0uXCa9uh6e3O6f2Ylzq57ttVAt2Bcw3RxA9GhXp5BTfMw=
X-Received: by 2002:a17:906:1315:b0:6ef:5903:c5d1 with SMTP id
 w21-20020a170906131500b006ef5903c5d1mr30082332ejb.537.1651135193813; Thu, 28
 Apr 2022 01:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat> <YmEdAVwZuA7Wo1Ch@aptenodytes>
 <YmelPCcWCCjALtRU@aptenodytes>
 <CAMty3ZBwguzvC8A9xA5c0enfoFRGS=4wWCzpfakTUXrsRS9GyA@mail.gmail.com>
 <20220427143410.bectqumq62qmlv5x@houat>
In-Reply-To: <20220427143410.bectqumq62qmlv5x@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 28 Apr 2022 14:09:42 +0530
Message-ID: <CAMty3ZDk-M3hW97_GY4-z=f+cKs1Sg4Jbq5L7L4zHgXURhFuZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 8:04 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Apr 26, 2022 at 01:40:31PM +0530, Jagan Teki wrote:
> > On Tue, Apr 26, 2022 at 1:24 PM Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> wrote:
> > >
> > > Hi,
> > >
> > > On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> > > > Hi Maxime,
> > > >
> > > > On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> > > > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > > > > + Linus
> > > > > > + Marek
> > > > > > + Laurent
> > > > > > + Robert
> > > > > >
> > > > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson
> > > > > > <bjorn.andersson@linaro.org> wrote:
> > > > > > >
> > > > > > > Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> > > > > > > bridge")' attempted to simplify the case of expressing a simple panel
> > > > > > > under a DSI controller, by assuming that the first non-graph child node
> > > > > > > was a panel or bridge.
> > > > > > >
> > > > > > > Unfortunately for non-trivial cases the first child node might not be a
> > > > > > > panel or bridge.  Examples of this can be a aux-bus in the case of
> > > > > > > DisplayPort, or an opp-table represented before the panel node.
> > > > > > >
> > > > > > > In these cases the reverted commit prevents the caller from ever finding
> > > > > > > a reference to the panel.
> > > > > > >
> > > > > > > This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
> > > > > > > panel or bridge")', in favor of using an explicit graph reference to the
> > > > > > > panel in the trivial case as well.
> > > > > >
> > > > > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > > > > switched drivers.  Do you have any suggestions on how to proceed to
> > > > > > succeed in those use cases as well?
> > > > >
> > > > > I guess we could create a new helper for those, like
> > > > > devm_drm_of_get_bridge_with_panel, or something.
> > > >
> > > > Oh wow I feel stupid for not thinking about that.
> > > >
> > > > Yeah I agree that it seems like the best option.
> > >
> > > Should I prepare a patch with such a new helper?
> > >
> > > The idea would be to keep drm_of_find_panel_or_bridge only for the of graph
> > > case and add one for the child node case, maybe:
> > > drm_of_find_child_panel_or_bridge.
> > >
> > > I really don't have a clear idea of which driver would need to be switched
> > > over though. Could someone (Jagan?) let me know where it would be needed?
> >
> > sun6i_mipi_dsi
>
> It doesn't look like sun6i_mipi_dsi is using devm_drm_of_get_bridge at all?

Correct, patch for this on the mailing list.

>
> > exynos_drm_dsi
>
> If you reference 711c7adc4687, I don't see why we would need to switch
> it back to the old behaviour. It wasn't iterating over its child node
> before, so what does the switch to drm_of_get_bridge broke exactly?

Exynos bindings have a child node (unlike OF-graph), the old code is
checking panel and bridge individually so it broke once switch to
devm_drm_of_get_bridge

Jagan.

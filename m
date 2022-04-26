Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E2750F371
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 10:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5D010F094;
	Tue, 26 Apr 2022 08:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1BF10F094
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 08:10:43 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id dk23so11102712ejb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 01:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nRArT/+HlPHZEaZpdvLJTxIQv1TzHF3bvOW7nBlL+EY=;
 b=cUYA7IL0HDqyYDejIukEKVYEwZ57pTZSJnfsTQz/JDYrIBAfglh3eIP0BQxwj4H09p
 DjEGG74rfqXBfGHefdt/sCbRGNBuMBSONvAwWKxGR1HxEtG60phAE36XvW7aPK/6mjNJ
 HQ29TjZ0NFl6x/UIzhSLw8CTdscfM4EAVK/RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nRArT/+HlPHZEaZpdvLJTxIQv1TzHF3bvOW7nBlL+EY=;
 b=mM1CZ1J7Lkjptc/sqrBwRdwQ7ixFYvq4g5TDK4gX+MBtOjlEky2b7sthaXTwgSdG9t
 sDWpQ7XRb21BbkjVbcrMeqTIlQbPnW7VeSQBZpbIGl0IhYMvQ4cIAN9bzc6hS1bVjq6O
 xUvBExLrHMS8NAi0MfJwCeYU3zAtiNG7oclutP9mBWyGuKH5Sc5gDAMdwDZk1p40lKb4
 W031qoCf8snDicbfbMiwFTQMO2xwTUZoTxAXPC6nBBeErc9uhukna64J0AhcQlDd9Ylb
 fhFxKiWasTwvZXIEtlcSFg/HN1qMfFTqj9fFTBewf1IGt7MnDjXy8f4m3t3ezaNNTE2E
 c6Lw==
X-Gm-Message-State: AOAM530eLHqvc7/CfgK20bXY1psMwGmDiVo+G4lsjIIVR0IO4yyCJ/st
 0dyH2sPxPY6ZXyVSJb9iU+cN3+kVBeT40DZ+3QbxMg==
X-Google-Smtp-Source: ABdhPJyev1jUqnm0Te3/JU59WbWhM9U+N2eYGYCS0OM1yz4jtK3nhD8ZwQfaytDXk26eSkZ+kYlLddAfzcv1AqcopCw=
X-Received: by 2002:a17:906:1315:b0:6ef:5903:c5d1 with SMTP id
 w21-20020a170906131500b006ef5903c5d1mr19913139ejb.537.1650960641955; Tue, 26
 Apr 2022 01:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat> <YmEdAVwZuA7Wo1Ch@aptenodytes>
 <YmelPCcWCCjALtRU@aptenodytes>
In-Reply-To: <YmelPCcWCCjALtRU@aptenodytes>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 26 Apr 2022 13:40:31 +0530
Message-ID: <CAMty3ZBwguzvC8A9xA5c0enfoFRGS=4wWCzpfakTUXrsRS9GyA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 1:24 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi,
>
> On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> > Hi Maxime,
> >
> > On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > > + Linus
> > > > + Marek
> > > > + Laurent
> > > > + Robert
> > > >
> > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson
> > > > <bjorn.andersson@linaro.org> wrote:
> > > > >
> > > > > Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> > > > > bridge")' attempted to simplify the case of expressing a simple panel
> > > > > under a DSI controller, by assuming that the first non-graph child node
> > > > > was a panel or bridge.
> > > > >
> > > > > Unfortunately for non-trivial cases the first child node might not be a
> > > > > panel or bridge.  Examples of this can be a aux-bus in the case of
> > > > > DisplayPort, or an opp-table represented before the panel node.
> > > > >
> > > > > In these cases the reverted commit prevents the caller from ever finding
> > > > > a reference to the panel.
> > > > >
> > > > > This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
> > > > > panel or bridge")', in favor of using an explicit graph reference to the
> > > > > panel in the trivial case as well.
> > > >
> > > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > > switched drivers.  Do you have any suggestions on how to proceed to
> > > > succeed in those use cases as well?
> > >
> > > I guess we could create a new helper for those, like
> > > devm_drm_of_get_bridge_with_panel, or something.
> >
> > Oh wow I feel stupid for not thinking about that.
> >
> > Yeah I agree that it seems like the best option.
>
> Should I prepare a patch with such a new helper?
>
> The idea would be to keep drm_of_find_panel_or_bridge only for the of graph
> case and add one for the child node case, maybe:
> drm_of_find_child_panel_or_bridge.
>
> I really don't have a clear idea of which driver would need to be switched
> over though. Could someone (Jagan?) let me know where it would be needed?

sun6i_mipi_dsi, exynos_drm_dsi, mcde_dsi (as of now)

>
> Are there cases where we could both expect of graph and child node?
> (i.e. does the new helper also need to try via of graph?)

One finding so far from my side would be if the check iterates the
child and identify the panel or bridge child irrespective of the
position it has and untouched non-trivial child-like dp, opp-table can
help to use same change what we have it before. Still working on
getting a proper check.

Thanks,
Jagan.

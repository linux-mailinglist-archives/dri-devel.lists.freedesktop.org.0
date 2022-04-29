Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C89514425
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2090510EC83;
	Fri, 29 Apr 2022 08:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE1B10EC83
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:24:25 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id e23so8177783eda.11
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MSHFrxJseu+2aYKFMzIZcdb0pTPamF/GM8qyPG4laMc=;
 b=o6bZJOkhepDUdYJuXatWdXH4hEC30djRKhajFO4TAGzOyUhhuLBwXGB9zf0legSUOI
 fB4RCZGnaC5RPKIWUlJdLFlIKMSX/HgelBjF4O7R0i0eSxA344OnxOY7aCmFa8P/cXvP
 Xc1D4GwabPI71zWDlaa3nSX0RHkcljV6vZ82w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MSHFrxJseu+2aYKFMzIZcdb0pTPamF/GM8qyPG4laMc=;
 b=cPmgZaE1CslPC4HdRoMFEJ2JBLT1QPduwcenfx9Jc8tigMg44HmZo7nsnws/tA0NK2
 gIeefHScrbNHWxBKPDrLexMTXJUg0WbvkycXcAR3lEGGoUIdaw+RRvteooIFTVmmYMLd
 pXVodZloQ0oWpJXhDYIzMhp6wBMjMmhjISJo4UxQlJLYakigRCPOm7jeaBXogMYURsVy
 CjipXc2DNxnv9Iw4mCTGYU960pk03K6euC+zxl2KBcvSfab3muJEx0rwvzUujpHLtJFw
 KfSJSRUo+q22rWX1rWyPDIm20xoHCB8jH3M8VGeQpNiDER4xqv2w+XtCJ/biGNYwpqg7
 NaCQ==
X-Gm-Message-State: AOAM530q9J2L6qL+OHbOFhUa/+N4lKvuRoCNfmSeUfrfudQ4faZia7Lf
 sxOXewH1TAvYMpAFxuTS68tgql17vCN7kbR4L4vUXQ==
X-Google-Smtp-Source: ABdhPJyIYUy77NsMEjP76/WvK8Lc+VGEiVUCUbxI/7U5MkvdeTwv5TKDnwUvI5JOBZEw22+cyLpLyc3xmDDQCgGemfU=
X-Received: by 2002:a05:6402:1941:b0:413:2822:9c8 with SMTP id
 f1-20020a056402194100b00413282209c8mr39822301edz.13.1651220663866; Fri, 29
 Apr 2022 01:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat> <YmEdAVwZuA7Wo1Ch@aptenodytes>
 <YmelPCcWCCjALtRU@aptenodytes>
 <CAMty3ZBwguzvC8A9xA5c0enfoFRGS=4wWCzpfakTUXrsRS9GyA@mail.gmail.com>
 <20220427143410.bectqumq62qmlv5x@houat>
 <CAMty3ZDk-M3hW97_GY4-z=f+cKs1Sg4Jbq5L7L4zHgXURhFuZA@mail.gmail.com>
 <YmsSdmOEpSz4okt2@pendragon.ideasonboard.com>
In-Reply-To: <YmsSdmOEpSz4okt2@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 29 Apr 2022 13:54:12 +0530
Message-ID: <CAMty3ZAGxhFtxNcYHJafJxSZ5xMuyumw4gWi1v=ZDVfgvF-7pQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
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
Cc: David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Fri, Apr 29, 2022 at 3:47 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jagan,
>
> On Thu, Apr 28, 2022 at 02:09:42PM +0530, Jagan Teki wrote:
> > On Wed, Apr 27, 2022 at 8:04 PM Maxime Ripard wrote:
> > > On Tue, Apr 26, 2022 at 01:40:31PM +0530, Jagan Teki wrote:
> > > > On Tue, Apr 26, 2022 at 1:24 PM Paul Kocialkowski wrote:
> > > > > On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> > > > > > On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> > > > > > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > > > > > > + Linus
> > > > > > > > + Marek
> > > > > > > > + Laurent
> > > > > > > > + Robert
> > > > > > > >
> > > > > > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson wrote:
> > > > > > > > >
> > > > > > > > > Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> > > > > > > > > bridge")' attempted to simplify the case of expressing a simple panel
> > > > > > > > > under a DSI controller, by assuming that the first non-graph child node
> > > > > > > > > was a panel or bridge.
> > > > > > > > >
> > > > > > > > > Unfortunately for non-trivial cases the first child node might not be a
> > > > > > > > > panel or bridge.  Examples of this can be a aux-bus in the case of
> > > > > > > > > DisplayPort, or an opp-table represented before the panel node.
> > > > > > > > >
> > > > > > > > > In these cases the reverted commit prevents the caller from ever finding
> > > > > > > > > a reference to the panel.
> > > > > > > > >
> > > > > > > > > This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
> > > > > > > > > panel or bridge")', in favor of using an explicit graph reference to the
> > > > > > > > > panel in the trivial case as well.
> > > > > > > >
> > > > > > > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > > > > > > switched drivers.  Do you have any suggestions on how to proceed to
> > > > > > > > succeed in those use cases as well?
> > > > > > >
> > > > > > > I guess we could create a new helper for those, like
> > > > > > > devm_drm_of_get_bridge_with_panel, or something.
> > > > > >
> > > > > > Oh wow I feel stupid for not thinking about that.
> > > > > >
> > > > > > Yeah I agree that it seems like the best option.
> > > > >
> > > > > Should I prepare a patch with such a new helper?
> > > > >
> > > > > The idea would be to keep drm_of_find_panel_or_bridge only for the of graph
> > > > > case and add one for the child node case, maybe:
> > > > > drm_of_find_child_panel_or_bridge.
> > > > >
> > > > > I really don't have a clear idea of which driver would need to be switched
> > > > > over though. Could someone (Jagan?) let me know where it would be needed?
> > > >
> > > > sun6i_mipi_dsi
> > >
> > > It doesn't look like sun6i_mipi_dsi is using devm_drm_of_get_bridge at all?
> >
> > Correct, patch for this on the mailing list.
>
> I've lost track of how we're solving the fallout of this for v5.18. I
> have received a report that the original commit (80253168dbfd) also
> broke the rcar-du driver. Could you please provide a git branch (based
> on drm-fixes or drm-misc-fixes) with any patch that you plan to get
> merged in v5.18, to let me test them locally ?

The affected patches for 80253168dbfd revert are

711c7adc4687
3730bc6147b0 and 3d7039e1e649

Both these are not present drm-misc-fixes but there in linux-next.
I've sent a patch for 711c7adc4687
https://patchwork.kernel.org/project/dri-devel/patch/20220428094808.782938-1-jagan@amarulasolutions.com/

This is my repo on top of linux-next
https://github.com/openedev/kernel/tree/linux-next/drm-misc

As I have seen before rcar-du ("155358310f013") is OF-graph and it
doesn't affect the child node lookup was introduced in
("80253168dbfd")

Let me know if you have any further information.


Jagan.

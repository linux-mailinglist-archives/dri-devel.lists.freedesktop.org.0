Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144BA511815
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 14:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CEF10F428;
	Wed, 27 Apr 2022 12:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A6910F428
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 12:59:27 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id l7so3267723ejn.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LDmJp5Whp8dmiIhAKFOdeRxPyoTu+bfhB5tptGx09HE=;
 b=K4S0rAP9lJ862776psIkLpwKBo+nn/e4mEFZkcbquLCnaqGCrJU59iqV3dfOIFdh/G
 zWZKaT3UAZqEGVfzw2zJsyxhRWthe1I2zoBlZ4t2ZtIOBIdHjBsT3fEn8d6bf4yLT/gW
 N4ZcGFwyp7xUVA49I9ZYumzPtsip5hnoK7eXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LDmJp5Whp8dmiIhAKFOdeRxPyoTu+bfhB5tptGx09HE=;
 b=V7+hszHITZWhoNSW6MPsbvLTjWbI/dN0IrH690KM/CkSVq6KUDrpYa+wIuEbQd4iao
 O6dBq2SGJSho9dVdsCZir62h1zV/LQLe/vE0rfbWwhq+uVRv1uUOfym7KREniRFHUOmF
 vsOLk+1pFifWDCJpCUmt3zLvMzLLBmlmWjoovjY00vq0ZROE64EkTonuaxS46BmVwkku
 QghtCH6k7R0hwyg/gI0iLDe+Sc37NDl6SsjBMB14OljlAk87z4tixhA+qUz2M6pYerfC
 IbY98YY/6sDPCYxf7xa19v83wtyN/6GUjMWDxKrjTWVkt80WELvCEFtLdX2KodxvSz6f
 Geiw==
X-Gm-Message-State: AOAM531YFsrzzdNof0YFo17G1SRI1A3ZHDiY1Jw3+3qnGO8uobfPePG4
 LETV4B9nCZxWHV953Xpu3cuh8qc9l8bQ05PHFHurjw==
X-Google-Smtp-Source: ABdhPJx85svbNMmRdxdVllL14VDSpMLFHkEO+pHyAu218rBgoFHo2Rfwxf/WsB6BpXdKawskZgUeKZjUGhuPjw7j9IU=
X-Received: by 2002:a17:907:7287:b0:6f3:8414:74f1 with SMTP id
 dt7-20020a170907728700b006f3841474f1mr18237119ejc.123.1651064365737; Wed, 27
 Apr 2022 05:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
 <CAMty3ZCLEMv4cqUcUGUAkLtH8tmh1WO582cDjZWynAifZJy=_w@mail.gmail.com>
 <CAMty3ZAkw0rssCzR_ka7U9JeoGxJr5JPM7GWDfd1dob9goL-BQ@mail.gmail.com>
 <Ymk01GLqfIKoZtJQ@aptenodytes>
In-Reply-To: <Ymk01GLqfIKoZtJQ@aptenodytes>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 27 Apr 2022 18:29:14 +0530
Message-ID: <CAMty3ZDQg2d33ce+OrSayuLUEErsMcYZ5WRhjvxM6QaQJ7JQ4A@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On Wed, Apr 27, 2022 at 5:49 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi Jagan,
>
> On Wed 27 Apr 22, 17:22, Jagan Teki wrote:
> > On Wed, Apr 27, 2022 at 12:29 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > On Thu, Apr 21, 2022 at 1:54 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > > > + Linus
> > > > > + Marek
> > > > > + Laurent
> > > > > + Robert
> > > > >
> > > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson
> > > > > <bjorn.andersson@linaro.org> wrote:
> > > > > >
> > > > > > Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> > > > > > bridge")' attempted to simplify the case of expressing a simple panel
> > > > > > under a DSI controller, by assuming that the first non-graph child node
> > > > > > was a panel or bridge.
> > > > > >
> > > > > > Unfortunately for non-trivial cases the first child node might not be a
> > > > > > panel or bridge.  Examples of this can be a aux-bus in the case of
> > > > > > DisplayPort, or an opp-table represented before the panel node.
> > > > > >
> > > > > > In these cases the reverted commit prevents the caller from ever finding
> > > > > > a reference to the panel.
> > > > > >
> > > > > > This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
> > > > > > panel or bridge")', in favor of using an explicit graph reference to the
> > > > > > panel in the trivial case as well.
> > > > >
> > > > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > > > switched drivers.  Do you have any suggestions on how to proceed to
> > > > > succeed in those use cases as well?
> > > >
> > > > I guess we could create a new helper for those, like
> > > > devm_drm_of_get_bridge_with_panel, or something.
> > >
> > > I think using the same existing helper and updating child support is
> > > make sense, as there is a possibility to use the same host for child
> > > and OF-graph bindings.
> > >
> > > I can see two possible solutions (as of now)
> > >
> > > 1. adding "dcs-child-type" bindings for child-based panel or bridge
> > > 2. iterate child and skip those nodes other than panel or bridge. or
> > > iterate sub-child to find it has a panel or bridge-like aux-bus (which
> > > is indeed hard as this configuration seems not 'standard' i think )
> > >
> > > Any inputs?
> >
> > Checking aux-bus with the sub-node panel can be a possible check to
> > look at it, any comments?
>
> That looks very fragile and oddly specific. Also why base changes on the
> original patch that you made?

It is just showcased a snippet to check the child's conditions.

>
> With the follow-up fixes, we are checking the of graph first and only
> considering child nodes if the of graph and remote are missing, so there isn't
> really a need to be more specific in the child noise discrimination.

So, does it handle child panel or bridge finding? just keep in mind
the same call from the host need to handle with and without OF-graph
representation.

>
> Actually I should also make a new version of "drm: of: Improve error handling in
> bridge/panel detection" to also return -ENODEV if of_graph_get_remote_node
> fails, so that it doesn't try to use the child node when the graph is defined
> but not remote is defined.

Jagan.

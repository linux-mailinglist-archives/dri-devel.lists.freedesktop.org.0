Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C8C46F233
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B25110E175;
	Thu,  9 Dec 2021 17:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00D510E168
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 17:38:09 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id w1so21813999edc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 09:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AQBlBcjP6KU5uEntMJe5O4a6k8Z/3VB3sqbxnkmyvcM=;
 b=AVXspGxsqbNkb9qLtrf/m8PsipZVTU/koLOnnlhmcUutzHApS+tJzgYLZC9aHwIdXs
 Gj2YL9nNbf4RnWb8qOfzLvvXHs8RbusLsXOZ12l/MOUfnaqdN90wchs/GyR+GfCzc+xO
 veEbVr5mVTM6LENi+W2DzQA5bRunZNpJ5waB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AQBlBcjP6KU5uEntMJe5O4a6k8Z/3VB3sqbxnkmyvcM=;
 b=LW/ZFuKdeUF9jAG2IkM16evZa2uc8mLQfl0RWhvQuGjBKnMIPn+3FWjcLX8TB3rdAt
 oczD2EikesH74yVgYJIoE6u/0JGRXKVfBex4WDsbNWoqrqyrmdaiWtdfj2tJyqKT/Uzy
 U5Mu1gpQ5OUTur7ZbtP8mkSLBl/rPeTWGq+3c0gfbsdtAZ9pFdJj9UEkYjMV+AFjVxS+
 pL8wfx7C3SGwzszTR5T5xi75nwwUwlxH0vsH5jXxpoNpk+lTR1em8oQvGv+mJv3ainPt
 MYITzbHsdRjIfitJ7Fkmb7NZ+DgX1MMkvhRuavplRGZoM32p/QXhASALmjp8opbILnyH
 +38Q==
X-Gm-Message-State: AOAM533/HOVZVGCaF5uJ3gbMhBgLkYnFPFo67dFu8e3q5c94FAfqQI4J
 0ytBZ2PlTCaDb4I1fPdlMVcyCo6vXkn/cF2DijwKjw==
X-Google-Smtp-Source: ABdhPJxeJtYCKaIxva4XOy/kJpcEADFymC/qRVkliAiJo2JxIeWtVodZlP1/RhK6lfHsM5oRz49mCcXXCAFetiCLDWQ=
X-Received: by 2002:a05:6402:2552:: with SMTP id
 l18mr30512010edb.368.1639071318398; 
 Thu, 09 Dec 2021 09:35:18 -0800 (PST)
MIME-Version: 1.0
References: <20211207054747.461029-1-jagan@amarulasolutions.com>
 <20211207054747.461029-2-jagan@amarulasolutions.com>
 <CAL_JsqKj_ToLpoGR6XLgAu=+THit6jhdzAvxMiCCNmWg5zbQ0A@mail.gmail.com>
 <CAMty3ZCO3yYcZhggorPBhywBs8=KjE3Mrv7573TrPQyzfPPiaA@mail.gmail.com>
In-Reply-To: <CAMty3ZCO3yYcZhggorPBhywBs8=KjE3Mrv7573TrPQyzfPPiaA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 9 Dec 2021 23:05:07 +0530
Message-ID: <CAMty3ZAjfF7wVD-zHM-465Q3T-aCOmcXUKJsL93+SBq+fuKwjA@mail.gmail.com>
Subject: Re: [PATCH 1/2] of: Add helper to lookup non port child node
To: Rob Herring <robh+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Frank Rowand <frowand.list@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob and Laurent,

On Wed, Dec 8, 2021 at 11:56 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Wed, Dec 8, 2021 at 2:20 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Mon, Dec 6, 2021 at 11:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > Add of_get_non_port_child() helper that can be used to lookup
> > > non port child nodes.
> > >
> > > Some OF graphs don't require 'ports' to represent the next output
> > > instead, it simply adds a child node on a given parent node. This
> > > helper lookup that child node, however that child node is not a
> > > 'port' on given parent as 'port' based nodes are looked up via
> > > of_graph_get_remote_node().
> > >
> > > Example OF graph representation of DSI host, which doesn't
> > > have 'ports'.
> >
> > This seems pretty specific to DSI and also can't handle there being
> > more than 1 non-port node. That's allowed for DSI too, but I don't
> > think I've ever seen a case. Anyways, I'd just move this to DRM rather
> > than common DT code. One comment on the implementation that will
> > shrink it.
>
> I think it can be possible to OF graph even for non-DSI, however if
> the end-node outputs to a panel or bridge. At the moment, I can one
> use case on the non-DSI side is rcar du encoder.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/rcar-du/rcar_du_encoder.c#n68

Do you see any point to make this helper in of/base based on above
rcar_du_encoder usage? if not i can directly use this functionality in
panel_or_bridge finding code itself.

Please let me know.

Thanks,
Jagan.

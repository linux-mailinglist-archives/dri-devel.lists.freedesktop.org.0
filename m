Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FC632A882
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 18:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16926E1ED;
	Tue,  2 Mar 2021 17:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E3F6E159
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 17:46:43 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id jt13so36942656ejb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Mar 2021 09:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RPmqkm376YmcwT7JP2kVIYMk9ag7VM/mKieAOclAGOA=;
 b=Tv0kPggItmAsQeD+UDRSdoWoPIZmSHRqOwGwVaLgE3f/vdWKaa+v3oNYgQf3EbzIVe
 L8//O9Z2jF0G7KMiO02g5vFF9mEMOAE8waWGElgzgQ/nWWQV1djlKjllB/d+VUt/yLEz
 ELblIL8wi4BU5OawUFYxbxg2vOK8De7qVPXcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RPmqkm376YmcwT7JP2kVIYMk9ag7VM/mKieAOclAGOA=;
 b=UYLg059L91gANhGDgeXKNFbsCgIbkQEx5lC4ZvdmYREyfZYOGq/D4jz1Lxv3o8GEAz
 wplGDP4xD6eQEQdr0wvlkp7PNCrlY6cfqXK5AfTaPJJEGIZ16PRA7zEYuy+8/J28TITs
 RG6SbeDzyYJUUujv6YNIr0zdG9YT22BNumxOoPsgZBaD3jBHJ9qjuHOmpthLSFgpqbF0
 dD4cRZqSdbLwpXD8gfdn1XuiM4eOKb2nAgP1ZJCfn5+QIqox1MVYoz2/F6dTuA7V6tvf
 Z5OouFMUBpMnJpWTSyccAVtn4iJsXO4NCZmcZ4+O/BAxG3j1xwmFNaMNTuJ7nW/yemYB
 +IjA==
X-Gm-Message-State: AOAM531QMbLpRfVWZMNXqqD5gtaveT7slHsd62wRag5doik+Vbn3QKUw
 DYct0pJkHP785Q3IIvetRJWn3AGKtEyZZWH+VdV+WQ==
X-Google-Smtp-Source: ABdhPJx7AkaIyyOwx2qyxpqGH7hcad7AAViqsSy3TOF4cnDdUJk27MkJvw07Ek8vNPvIjRJlIknBwJ9rzXlKGT1e3v0=
X-Received: by 2002:a17:907:3fa3:: with SMTP id
 hr35mr22059253ejc.418.1614707202338; 
 Tue, 02 Mar 2021 09:46:42 -0800 (PST)
MIME-Version: 1.0
References: <20210214194102.126146-1-jagan@amarulasolutions.com>
 <20210214194102.126146-7-jagan@amarulasolutions.com>
 <20210226165723.szblbiswz5vgapq2@hendrix>
 <CAMty3ZC0ynvk3qnWDSnpMD-_hJiP-edga6+HfqhRH_g0BkAqgg@mail.gmail.com>
 <20210302163505.2d42x364qsm26jo7@gilmour>
In-Reply-To: <20210302163505.2d42x364qsm26jo7@gilmour>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 2 Mar 2021 23:16:30 +0530
Message-ID: <CAMty3ZAxm3QtWNDm6yN6UKXz5HrWVU17NA6rQaOAae0XSPEmLQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm: sun4i: dsi: Use drm_panel_bridge,
 connector API
To: Maxime Ripard <maxime@cerno.tech>
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 2, 2021 at 10:05 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Feb 26, 2021 at 10:40:24PM +0530, Jagan Teki wrote:
> > On Fri, Feb 26, 2021 at 10:27 PM Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, Feb 15, 2021 at 01:11:01AM +0530, Jagan Teki wrote:
> > > > Use drm_panel_bridge to replace manual panel handling code.
> > > >
> > > > This simplifies the driver to allows all components in the
> > > > display pipeline to be treated as bridges, paving the way
> > > > to generic connector handling.
> > > >
> > > > Use drm_bridge_connector_init to create a connector for display
> > > > pipelines that use drm_bridge.
> > > >
> > > > This allows splitting connector operations across multiple bridges
> > > > when necessary, instead of having the last bridge in the chain
> > > > creating the connector and handling all connector operations
> > > > internally.
> > > >
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > >
> > > Most of the code removed in that patch was actually introduced earlier
> > > which feels a bit weird. Is there a reason we can't do that one first,
> > > and then introduce the bridge support?
> >
> > This patch adds new bridge API's which requires the driver has to
> > support the bridge first.
>
> I'm not sure what you're saying, you can definitely have a bridge
> without support for a downstream bridge.

I understand your point. what I'm saying here is, This patch
introduces two new bridge API's

devm_drm_panel_bridge_add
drm_bridge_connector_init

In order to add these API's the driver has to support the bridge
first. All the patches before this one support bridge and this patch
introduce new APIs, ie the reason we have code removed in this patch
which has been added before.

Okay. I think I will send the next version series till bridge
conversion. Improvement patches like this can take care of later
versions and even it depends on Patch v3 5/7 which indeed require a
separate discussion. This way it makes less confusion.

Hope it's fine for you?

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

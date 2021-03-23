Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F9134589A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 08:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08636E84C;
	Tue, 23 Mar 2021 07:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293366E84C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 07:25:43 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so9748971pjv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=UKDB4tP1o/qAJ5iZQYJec7JsyNelKTQdItmX1ycjyQk=;
 b=ZETG82JILVxDJCi3qiI1q0/LQNcWe9kN64W1uB852/RlDMI5Yh6PhOnBgKohVs1Xhq
 b2j43WJ1y0Gj/KQt3KYF3WXHWu9xefZzPtfdm40QocAiaK4lE24hDSjYV219L8YJWjol
 dupj1bUlLOxCnPRBRReCjJHZS8pgOjJ51nnXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=UKDB4tP1o/qAJ5iZQYJec7JsyNelKTQdItmX1ycjyQk=;
 b=liuzgWDn/4eEo6HGgtJ9jWWL4uz4xEUsifBvlijUx4/4abSKOu/Q4oRPk2DMY2cU3t
 1ghon6+CWUF35Cjt0ILFZhuk9/1MI2nxHPb5xINidhwxdiaakt83cZXj6Jw8XUsEYJHi
 3orfHLRPogMzROQq9QJHsQfrBHRzs5wxLxff9e6Ka633HGyU59qeM0H/SdoTjFlOsZ7J
 9/6Bb6FnTCbEdBOH1zn3PuI+sJdCLJ+Hxk/Dk7UuGgUaZowiABmYM746wfFIuIUo5G69
 2SpYkBj+/+fq0PbeJxMbg5lRMQTeAffVZEJOGGIf7tR98ZoIGVbOZEIr1CoHLA4oRNHj
 D+DA==
X-Gm-Message-State: AOAM533w+SFXJJiIAKiG619roilfEos9K9xdsoNVfoSgJ2UxmF7tSBqI
 gQyVaJOzhzdoTba3PbafHK/k0g==
X-Google-Smtp-Source: ABdhPJyPgeACfzPrxFvaTFzN2uVCCvcZfR0JEVYNsM780SwaiY1fnBGhInJl6nD7HjGAyflWidV26A==
X-Received: by 2002:a17:90a:c902:: with SMTP id
 v2mr3287152pjt.144.1616484342636; 
 Tue, 23 Mar 2021 00:25:42 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
 by smtp.gmail.com with ESMTPSA id z1sm15806362pfn.127.2021.03.23.00.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 00:25:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <YFkvl9tzP5Nj54C4@pendragon.ideasonboard.com>
References: <20201030011738.2028313-1-swboyd@chromium.org>
 <20201101173741.GA1293305@ravnborg.org>
 <160436612483.884498.883110130131457033@swboyd.mtv.corp.google.com>
 <YFkvl9tzP5Nj54C4@pendragon.ideasonboard.com>
Subject: Re: [PATCH v2 0/4] drm/bridge: ti-sn65dsi86: Support EDID reading
From: Stephen Boyd <swboyd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 23 Mar 2021 00:25:40 -0700
Message-ID: <161648434035.3012082.16414745959476755420@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2021-03-22 17:00:23)
> Hi Stephen,
> 
> On Mon, Nov 02, 2020 at 05:15:24PM -0800, Stephen Boyd wrote:
> > Quoting Sam Ravnborg (2020-11-01 09:37:41)
> > > Hi Stephen.
> > > 
> > > On Thu, Oct 29, 2020 at 06:17:34PM -0700, Stephen Boyd wrote:
> > > > This patch series cleans up the DDC code a little bit so that
> > > > it is more efficient time wise and supports grabbing the EDID
> > > > of the eDP panel over the aux channel. I timed this on a board
> > > > I have on my desk and it takes about 20ms to grab the EDID out
> > > > of the panel and make sure it is valid.
> > > > 
> > > > The first two patches seem less controversial so I stuck them at
> > > > the beginning. The third patch does the EDID reading and caches
> > > > it so we don't have to keep grabbing it over and over again. And
> > > > finally the last patch updates the reply field so that short
> > > > reads and nacks over the channel are reflected properly instead of
> > > > treating them as some sort of error that can't be discerned.
> > > > 
> > > > Stephen Boyd (4):
> > > >   drm/bridge: ti-sn65dsi86: Combine register accesses in
> > > >     ti_sn_aux_transfer()
> > > >   drm/bridge: ti-sn65dsi86: Make polling a busy loop
> > > >   drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
> > > >   drm/bridge: ti-sn65dsi86: Update reply on aux failures
> > > 
> > > Series looks good. You can add my a-b on the full series.
> > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > > 
> > > I can apply after Douglas have had a look at the patches he did not r-b
> > > yet.
> > > 
> > > Any chance we can convince you to prepare this bridge driver for use in
> > > a chained bridge setup where the connector is created by the display
> > > driver and uses drm_bridge_funcs?
> > > 
> > > First step wuld be to introduce the use of a panel_bridge.
> > > Then add get_edid to drm_bridge_funcs and maybe more helpers.
> > > 
> > > Then natural final step would be to move connector creation to the
> > > display driver - see how other uses drm_bridge_connector_init() to do so
> > > - it is relatively simple.
> > > 
> > > Should be doable - and reach out if you need some help.
> > 
> > I started to look at this and got stuck at ti_sn_bridge_get_bpp(). Where
> > can I get the details of the bpc for the downstream bridge or panel? Is
> > there some function that can tell this bridge what the bpc is for the
> > attached connector?
> 
> I've posted a patch series to convert to DRM_BRIDGE_ATTACH_NO_CONNECTOR
> yesterday (and have CC'ed you), but I've overlooked this particular
> problem :-S

!

> 
> You can't get the connector in the .enable() operation, but you can get
> it in .atomic_enable(), with
> drm_atomic_get_new_connector_for_encoder(). This being said, it's
> probably not the right option.
> 
> What matters here isn't the bpc for the connector, but the format
> expected by the next bridge in the chain. drm_bridge_funcs has two
> operations, .atomic_get_output_bus_fmts() and
> .atomic_get_input_bus_fmts(), to negotiate that format along a chain of
> bridges. The panel bridge driver (drivers/gpu/drm/bridge/panel.c)
> doesn't implement those operations, and neither does
> display-connector.c, so that may be what we should start with.

Ok, makes sense. I'd gladly test things out if you come up with some
solution here.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

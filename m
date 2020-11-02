Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 464A42A3E7E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128F16EC1A;
	Tue,  3 Nov 2020 08:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3FE6E093
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 17:09:24 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g11so621013pll.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 09:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=VqiKVe2OHLmU5JAf22RJzOSV9uu3Tp5oES/Ka+XZU48=;
 b=E+GXv1xhCIFEzwW4SU0iieWzqTiYdPYfZF6FA2tz6ySZFh1DEj0TtTVOvRllE4Y+Zg
 3FIeqIKXsy3OCMw12k0bjJZ79kpcoZnH5cFiu0RdpC7ciFct3ko4skYK+BTqTLmaqoUp
 jYNEdNCK5gPrswQ77HOQQVSQR0xPt/gAyFjTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=VqiKVe2OHLmU5JAf22RJzOSV9uu3Tp5oES/Ka+XZU48=;
 b=Yu2MaT/s/gHj6Vkj18ohulkFb+YLm2OlShovhTx7Swx9z+OvWCszuJ344Ds4AbszTe
 Z4V+4/aa79dAP6CNdOCNW/vuFJrOhBZ4cF+Mc+Sb1Q0Hc00ZvUtDjEpTaFjy7LWdxllR
 co0Fd9sycLWgD7B7SpcxmFyMt5lLPRM9uqv3oV7VwCZHH0IgzzfHCb+sEBE3SU1mcFdj
 TtHOntHa7y9ilGCEayrlUuZxn4XKZbm+owOEefQKKzV6av7APk64X/TjbWNVe2vI9d7S
 9Z5HEAq1caZ6INkLiqK1Mos19ryrn5EUygswYBGJVSjbDRVrslX2Bv2vtMvD058WWvdL
 /KlQ==
X-Gm-Message-State: AOAM5329WTF0cOgDyImycygrpFTPRb5dKEY8IzfQ1px3rlJJnkRUehUH
 sUs7jlerUpoDioFyXO3wlUKTjw==
X-Google-Smtp-Source: ABdhPJw8zB5/xSM90Q8TpAiNu3BRaZP596eYjK1Ir/3iDyBzYNs4HvGpVlbgKbb6uPSonDX/JXU8Fw==
X-Received: by 2002:a17:902:ba96:b029:d5:f36b:44af with SMTP id
 k22-20020a170902ba96b02900d5f36b44afmr20995122pls.51.1604336963252; 
 Mon, 02 Nov 2020 09:09:23 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id i11sm7619662pfd.211.2020.11.02.09.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 09:09:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAD=FV=V3kktCrwvMBeOy1dnQGYuV-ZUGX81+upRZacfzxjceFg@mail.gmail.com>
References: <20201030011738.2028313-1-swboyd@chromium.org>
 <20201101173741.GA1293305@ravnborg.org>
 <CAD=FV=V3kktCrwvMBeOy1dnQGYuV-ZUGX81+upRZacfzxjceFg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] drm/bridge: ti-sn65dsi86: Support EDID reading
From: Stephen Boyd <swboyd@chromium.org>
To: Doug Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Date: Mon, 02 Nov 2020 09:09:21 -0800
Message-ID: <160433696138.884498.1206890596724384092@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Doug Anderson (2020-11-02 08:37:21)
> Hi,
> 
> On Sun, Nov 1, 2020 at 9:37 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Stephen.
> >
> > On Thu, Oct 29, 2020 at 06:17:34PM -0700, Stephen Boyd wrote:
> > > This patch series cleans up the DDC code a little bit so that
> > > it is more efficient time wise and supports grabbing the EDID
> > > of the eDP panel over the aux channel. I timed this on a board
> > > I have on my desk and it takes about 20ms to grab the EDID out
> > > of the panel and make sure it is valid.
> > >
> > > The first two patches seem less controversial so I stuck them at
> > > the beginning. The third patch does the EDID reading and caches
> > > it so we don't have to keep grabbing it over and over again. And
> > > finally the last patch updates the reply field so that short
> > > reads and nacks over the channel are reflected properly instead of
> > > treating them as some sort of error that can't be discerned.
> > >
> > > Stephen Boyd (4):
> > >   drm/bridge: ti-sn65dsi86: Combine register accesses in
> > >     ti_sn_aux_transfer()
> > >   drm/bridge: ti-sn65dsi86: Make polling a busy loop
> > >   drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
> > >   drm/bridge: ti-sn65dsi86: Update reply on aux failures
> >
> > Series looks good. You can add my a-b on the full series.
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> >
> > I can apply after Douglas have had a look at the patches he did not r-b
> > yet.
> 
> They look fine to me now assuming that Stepehn has tested patch #1
> enough that we're confident that the slight change in ordering isn't
> going to mess anything up.

I did test it but the test isn't thorough enough to cover the timeout
case. I'll resend with v1 of this patch and pick up acks and include
Sam on To line.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6202A2FED
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 17:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF066E107;
	Mon,  2 Nov 2020 16:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987626E107
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 16:37:34 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id h5so7804955vsp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 08:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ovcjCIOpEfV1hqgQxS2QKiT2OQ1ZSCW/4Q1xN3dJVgs=;
 b=UzxkgOqrCuwNQptJpjds/vbFdVftn+vsaKBt+OKdu5fA0iysZmmnM3ZO1zgHfFfPJf
 T+q0GQO9iZp3k+UyuSTmlGNIBqYZnQrVMxWpoz1b34lqx+TbsG/RE5GhpsGUDDnDyMtd
 oj0l/C9Bcly2821At1syMoRBFjBiS4kXUtPMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ovcjCIOpEfV1hqgQxS2QKiT2OQ1ZSCW/4Q1xN3dJVgs=;
 b=GA+pNfKFZ59CMub/tfHprH+rzc5Cobe3325hRLywiahtT9MpBwaWeCyL/vDzHeBTp7
 hri7qcObfQ8pTdeFgce+z5lRG2VzyND8/evJdOA21zNAzK+Rt1lFVtMEc3azs+mPj5iz
 OmfmTKmQR5wcKgIZyj4+2beaKU8fnaf8RmkvIG0PEAtLx2REDSaA1zj2pHwnI+abI4YU
 ++H9Ks1FQeO85rCJ6RUuC2WmCcQPfVOqD+S3NENfJJsbeCumb86E0n8KyWN1yY6MF1aV
 4Jp0aw8HLx/ybTxLges1xt6JWUd2QiS7Lwe4hWcCfEtTbTYRayqkydgr5d8Aj8F7IBYI
 k6oQ==
X-Gm-Message-State: AOAM530sTg10aXSU/evmuIq4IrL/k9bmlY5oRQaPNjMA59Wfv22T/aO9
 zwqK0tHOWSbEyIAzajg1JKMRlO7BurB2Cg==
X-Google-Smtp-Source: ABdhPJz67CaXGmWOF3boPA3ETiWkA7XH3+pteb7HCqEXccPTZUMGVv7b2aVvL4foWk4A/2+ZDWOpKg==
X-Received: by 2002:a67:8e4a:: with SMTP id q71mr15810921vsd.1.1604335053509; 
 Mon, 02 Nov 2020 08:37:33 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172])
 by smtp.gmail.com with ESMTPSA id n16sm2271138vsk.17.2020.11.02.08.37.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 08:37:32 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id p16so3064586vkf.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 08:37:32 -0800 (PST)
X-Received: by 2002:ac5:c885:: with SMTP id n5mr13399838vkl.21.1604335052255; 
 Mon, 02 Nov 2020 08:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20201030011738.2028313-1-swboyd@chromium.org>
 <20201101173741.GA1293305@ravnborg.org>
In-Reply-To: <20201101173741.GA1293305@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Nov 2020 08:37:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V3kktCrwvMBeOy1dnQGYuV-ZUGX81+upRZacfzxjceFg@mail.gmail.com>
Message-ID: <CAD=FV=V3kktCrwvMBeOy1dnQGYuV-ZUGX81+upRZacfzxjceFg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] drm/bridge: ti-sn65dsi86: Support EDID reading
To: Sam Ravnborg <sam@ravnborg.org>
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
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Vinod Koul <vkoul@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Nov 1, 2020 at 9:37 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Stephen.
>
> On Thu, Oct 29, 2020 at 06:17:34PM -0700, Stephen Boyd wrote:
> > This patch series cleans up the DDC code a little bit so that
> > it is more efficient time wise and supports grabbing the EDID
> > of the eDP panel over the aux channel. I timed this on a board
> > I have on my desk and it takes about 20ms to grab the EDID out
> > of the panel and make sure it is valid.
> >
> > The first two patches seem less controversial so I stuck them at
> > the beginning. The third patch does the EDID reading and caches
> > it so we don't have to keep grabbing it over and over again. And
> > finally the last patch updates the reply field so that short
> > reads and nacks over the channel are reflected properly instead of
> > treating them as some sort of error that can't be discerned.
> >
> > Stephen Boyd (4):
> >   drm/bridge: ti-sn65dsi86: Combine register accesses in
> >     ti_sn_aux_transfer()
> >   drm/bridge: ti-sn65dsi86: Make polling a busy loop
> >   drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
> >   drm/bridge: ti-sn65dsi86: Update reply on aux failures
>
> Series looks good. You can add my a-b on the full series.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> I can apply after Douglas have had a look at the patches he did not r-b
> yet.

They look fine to me now assuming that Stepehn has tested patch #1
enough that we're confident that the slight change in ordering isn't
going to mess anything up.  Laurent also had comments about caching
the EDID on patch #3.  If he feels strongly about getting rid of that,
it'll need another spin and we'll just have to suck up the small boot
time penalty until we can find a solution in the core.


> Any chance we can convince you to prepare this bridge driver for use in
> a chained bridge setup where the connector is created by the display
> driver and uses drm_bridge_funcs?
>
> First step wuld be to introduce the use of a panel_bridge.
> Then add get_edid to drm_bridge_funcs and maybe more helpers.
>
> Then natural final step would be to move connector creation to the
> display driver - see how other uses drm_bridge_connector_init() to do so
> - it is relatively simple.
>
> Should be doable - and reach out if you need some help.

At some point I think Vinod tried to prepare a patch for this and I
tried it, but it didn't just work.  I spent an hour or so poking at it
and I couldn't quite figure out why and I couldn't find enough other
examples to compare against to see what was wrong...  That was a few
months ago, though.  Maybe things are in a better shape now?

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

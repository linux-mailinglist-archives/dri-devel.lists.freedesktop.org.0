Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444D641F44B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 20:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37F66EEB6;
	Fri,  1 Oct 2021 18:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177CD6EEB0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 18:03:11 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id n71so12735673iod.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 11:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TL04/DBPEoOSN56nSu3eaqiiO8NlK2fOuX7kmrPsg2w=;
 b=DRsDMqGo5t/bxn9+5wBzcERkuPc5KHDjQdwCt2EXk2REWJWg+v7NDlDKBEdVOQV8Tr
 rQiDclsnWhqlLo4weSCvtBOjuEtmMTeV0JLQ1zReAAvXljaJID8LuFvXtejnhGd9SZ7o
 pK5cJL6I4QrcjwMawjpp8sJMzu1gxIxRLfMuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TL04/DBPEoOSN56nSu3eaqiiO8NlK2fOuX7kmrPsg2w=;
 b=vULSp93tPXwiw5nd7VxoMDDFR7myFfchzOGc+MGKomr5rNUcXEP9Rx0PaI9C/4Vclr
 bbv1xCFqaM6ZwKjIMpP5Buoxrbm9kWn8hiw//7xWkLDgscm0s8TrrgFRnWHBpYQYoW63
 OCNgCgz4Hk7rbfscKptX27UXbBReOZQLerLP/ivVnh531B4J4z40pMPNpW9C+9k1xwPe
 /Em/znzOnhAsHTDLp2fjQEQxvj8U/ergtHDeqe3AOzHEwhC4YY5Sb6WeStMqOn/06iKC
 Wckh/1Bm9g+E+BAuEo7U77Y1iv9xVzHs/hBq9g2mByhRZzPNMU2pRJPQeyoGawK5oX58
 I4AQ==
X-Gm-Message-State: AOAM533B9X8RO8szxx5StwU98ZSY35yeb96wsxR21+ygdowp2ZDZpd8J
 uKkhy+BUw65JEktVYQstTpkGeCbqYTpzfg==
X-Google-Smtp-Source: ABdhPJwirXnWzM4B0z7yd84DOFcIV9CzRKe/nmisrBzmixwZK1hUVxXn18cuHTrtrx8+RRviSkwtPQ==
X-Received: by 2002:a02:23c3:: with SMTP id u186mr4189699jau.34.1633111390038; 
 Fri, 01 Oct 2021 11:03:10 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169])
 by smtp.gmail.com with ESMTPSA id e13sm4051640iod.36.2021.10.01.11.03.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 11:03:07 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id d11so11423019ilc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 11:03:06 -0700 (PDT)
X-Received: by 2002:a05:6e02:20eb:: with SMTP id
 q11mr10049918ilv.165.1633111385834; 
 Fri, 01 Oct 2021 11:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210920225801.227211-1-robdclark@gmail.com>
 <20210920225801.227211-4-robdclark@gmail.com>
 <YUvN3j0v+8NMjNte@pendragon.ideasonboard.com>
 <CAF6AEGviyfX6+c-CB5gMXqRQfHhvb5L8t++-VkZpvS3r9qDNoA@mail.gmail.com>
 <YU03M+CXJ+ALi8De@pendragon.ideasonboard.com>
In-Reply-To: <YU03M+CXJ+ALi8De@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Oct 2021 11:02:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UU1_ZR0K9XEgkTM2M55FgmqoH=ciU5a_oCC+W2NPdZ-A@mail.gmail.com>
Message-ID: <CAD=FV=UU1_ZR0K9XEgkTM2M55FgmqoH=ciU5a_oCC+W2NPdZ-A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Sep 23, 2021 at 7:26 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> > > >  err_conn_init:
> > > >       drm_dp_aux_unregister(&pdata->aux);
> > > >       return ret;
> > > > @@ -792,9 +790,30 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
> > > >       regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
> > > >  }
> > > >
> > > > +/*
> > > > + * Find the connector and fish out the bpc from display_info.  It would
> > > > + * be nice if we could get this instead from drm_bridge_state, but that
> > > > + * doesn't yet appear to be the case.
> > >
> > > You already have a bus format in the bridge state, from which you can
> > > derive the bpp. Could you give it a try ?
> >
> > Possibly the bridge should be converted to ->atomic_enable(), etc..
> > I'll leave that for another time
>
> It should be fairly straightforward, and would avoid the hack below.

Given this point of controversy, my inclination is to wait and not
apply this patch now. I don't think there's anything urgent here,
right? Worst case eventually Laurent might pick it up in his patch
series? At least we know it will work with the MSM driver once patch
#1 lands. :-)


-Doug

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 979E54E9BF7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 18:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B99E10E6E8;
	Mon, 28 Mar 2022 16:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42ACC10E6E8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 16:10:08 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i4so2267825wrb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 09:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lmxys5+Wm1X5K164q9rotePcIiSk9Jnpw6aPoksjE+E=;
 b=q7LjVQ60wDaxmmoVNtb1VxmBmp3QNIdbDpNKeKKXmwuDS5jsJ7c6eIxl7oZJHd/8m+
 g+6gr41IFG77dq2fTNBgv0wPw34ZFFldyAPdmkBinok4TPayBF30FzEb5rCB5BqgKErG
 ziF2Pm47Yz7R5npswNYveWZFnmOS73K8zup+OQX53F9zYndeEojpA9/eeOCfS61NEwda
 sVBjmDPMk94Z1Csds269tlIy0CcHiRRQ9EcFNlR6P1zewBE1q0lSemzU1vXBFCMnqJZh
 lEKQBroD3qKru+9vo0WRXsKXNFKVEwLvUiX5lQTo9GXM1hJvWnpeXoEOHnRy5mVSekn3
 qgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lmxys5+Wm1X5K164q9rotePcIiSk9Jnpw6aPoksjE+E=;
 b=lrKCQi0E4RRdu2WwdB0V45I8C0JB0CdxRT6DOxH8Fw1zS2dWsIOnyjBMXWwz6mfEC4
 4r6zZkq+8riDqcJRcLJRtKlKVa2CSpGss7fFeIan9m2DH2taAGl4an4DLgQMu9Q5BdOe
 7Vd8BJH9dLipCcout6IViN9sGi2GzcA3XqOZOToZHcqfk/p5LPvoUKfMB6K6O63VfOyy
 Y/21Y8/JTX/yeyjwK7eguYcgNHZtWm9xaEFYLN67buSjXa0XlvG5WAlfr4L+Tnvl5tx3
 6m4OaQU1no3/PER+f5qZc6QAt2moR7n7hiHOr0C+x4BQqbDfr8cmuZ0dSQYSTd2AWXa7
 2rJg==
X-Gm-Message-State: AOAM530PuhoBOrjNjGCmR+smr9wXZJ8UuZAOuXox0/w/W39StwPCAdDq
 iadlg4HwPZzZ5RXTWssINEU=
X-Google-Smtp-Source: ABdhPJxbkE68MgSxDKzSZwONLoQMtBodDeWbFWAyDuRI/XDf2qLm+5nFhZNdxRTyj4xo6V9DrMjj2g==
X-Received: by 2002:a05:6000:1d8b:b0:203:df82:ff8d with SMTP id
 bk11-20020a0560001d8b00b00203df82ff8dmr25085878wrb.623.1648483806600; 
 Mon, 28 Mar 2022 09:10:06 -0700 (PDT)
Received: from elementary ([94.73.33.246]) by smtp.gmail.com with ESMTPSA id
 y13-20020adffa4d000000b00203e3ca2701sm17431178wrr.45.2022.03.28.09.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 09:10:06 -0700 (PDT)
Date: Mon, 28 Mar 2022 18:10:04 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v2] drm/bridge: nwl-dsi: switch to devm_drm_of_get_bridge
Message-ID: <20220328161004.GA9156@elementary>
References: <20220317175852.799432-1-jose.exposito89@gmail.com>
 <4bd97d512e95845d7dd5a44d7713c59832676ada.camel@oss.nxp.com>
 <CAG3jFysp1xas4eVcRh5rysbgrhLAEJvsfYjHU=gHDT_JECaEUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG3jFysp1xas4eVcRh5rysbgrhLAEJvsfYjHU=gHDT_JECaEUg@mail.gmail.com>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, Liu Ying <victor.liu@oss.nxp.com>,
 laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 03:24:05PM +0200, Robert Foss wrote:
> On Fri, 18 Mar 2022 at 10:25, Liu Ying <victor.liu@oss.nxp.com> wrote:
> >
> > On Thu, 2022-03-17 at 18:58 +0100, José Expósito wrote:
> > > The function "drm_of_find_panel_or_bridge" has been deprecated in
> > > favor of "devm_drm_of_get_bridge".
> > >
> > > Switch to the new function and reduce boilerplate.
> > >
> > > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > >
> > > ---
> > >
> > > v2: (Thanks to Liu Ying)
> > >
> > >  - Rebase on top of drm-misc-next
> > >  - Remove drm_of_panel_bridge_remove
> > > ---
> > >  drivers/gpu/drm/bridge/nwl-dsi.c | 23 ++++-------------------
> > >  1 file changed, 4 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c
> > > b/drivers/gpu/drm/bridge/nwl-dsi.c
> > > index e34fb09b90b9..de62e3fc6a59 100644
> > > --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> > > +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> > > @@ -912,19 +912,11 @@ static int nwl_dsi_bridge_attach(struct
> > > drm_bridge *bridge,
> > >  {
> > >       struct nwl_dsi *dsi = bridge_to_dsi(bridge);
> > >       struct drm_bridge *panel_bridge;
> > > -     struct drm_panel *panel;
> > > -     int ret;
> > > -
> > > -     ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0,
> > > &panel,
> > > -                                       &panel_bridge);
> > > -     if (ret)
> > > -             return ret;
> > >
> > > -     if (panel) {
> > > -             panel_bridge = drm_panel_bridge_add(panel);
> > > -             if (IS_ERR(panel_bridge))
> > > -                     return PTR_ERR(panel_bridge);
> > > -     }
> > > +     panel_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev-
> > > >of_node,
> > > +                                           1, 0);
> > > +     if (IS_ERR(panel_bridge))
> > > +             return PTR_ERR(panel_bridge);
> > >
> > >       if (!panel_bridge)
> > >               return -EPROBE_DEFER;
> >
> > I don't think panel_bridge can be NULL here, so this check can be
> > removed.  However, even if this patch is not applied, the check is not
> > necessary.  I think it can be removed with a separate patch.
> 
> José, do you mind clearing up if this check is needed, and then
> spinning a v3 removing this snippet if it is needed?
> 
> Rob.

Hi Robert,

I think that as Liu pointed out, the "panel_bridge" variable can not
be NULL. However, as I don't have access to the required hardware to
test it, I'd prefer to keep the patch as it is, i.e., a refactor that
does not change the previous behaviour, rather than introducing an
untested change.

Jose

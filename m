Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7B02A2F31
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 17:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F396E52D;
	Mon,  2 Nov 2020 16:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7934D6E52D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 16:06:29 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id y78so7741582vsy.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 08:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3EAJxrbNKb2UnVB4OFa3XW/KW/bAnXVvDS85XdhAgXY=;
 b=kvaF0DVjznsslmC6N78FPbYUkt271nHsx8pzI2dwafQr+aWMtlTUXTa6XQF/UnTG7O
 v2m7iuSP5kYhINST9+HMHrHY96GvLZUaG+a7P/lEltBAhK4Cq1hSAal2iHde/HLUEona
 2yTUb6XZgmuzBIIq+4WmnRD4XDGPCre7UdoCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3EAJxrbNKb2UnVB4OFa3XW/KW/bAnXVvDS85XdhAgXY=;
 b=Lb/phh1z3RfujwMnTit66od1N5nUzgqXvOBiNHpOxM4GWrA8LU5tH7tb9fHTPHsTMI
 i7P/PnjZXQ7OXzBuMbr1BdZGJMzNmXXG3ThQWOg+ROQc8O5yAl5zpTiHPAjJ9ckzXUiR
 2VarGwfBuIQN2XUEeTq6pIy0/bsj3AFn1fGd5dxenXSW79kqnO+0W9dChz8CD/HxT9an
 gfixSAJ54Xy4T1/HS9VXyQt4uLq6qbZL5Ky8sOrC70KawRGi/6IqSacnRFcSgxGVykRe
 ZxD2k7PGvACotwkJqAklqy88ygiylNqPSMfSzl5pHnbZ1uNlwkgTSWt873B3ukrv1oxA
 RgAA==
X-Gm-Message-State: AOAM531KLOuAQrOmTp1muY2wCDRA1HV//WsW3w9ZdbZq7DMVkRk0SLmZ
 +AOsTw4Bq93LdUw+a10+Yqm5vds557sMfQ==
X-Google-Smtp-Source: ABdhPJw/mjp1c3C4ZIGxHpc+LFrfiVjt0pNYn3K6ZaWUMUNSxux358CrEfNi9TO6BIcX+uA1q7pAkw==
X-Received: by 2002:a67:e9c5:: with SMTP id q5mr4791735vso.5.1604333188271;
 Mon, 02 Nov 2020 08:06:28 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50])
 by smtp.gmail.com with ESMTPSA id 31sm2000639uac.10.2020.11.02.08.06.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 08:06:27 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id r14so2787732vsa.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 08:06:27 -0800 (PST)
X-Received: by 2002:a05:6102:309a:: with SMTP id
 l26mr2329294vsb.4.1604333186845; 
 Mon, 02 Nov 2020 08:06:26 -0800 (PST)
MIME-Version: 1.0
References: <20201030011738.2028313-1-swboyd@chromium.org>
 <20201030011738.2028313-4-swboyd@chromium.org>
 <20201101192027.GA7612@pendragon.ideasonboard.com>
In-Reply-To: <20201101192027.GA7612@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Nov 2020 08:06:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VKTS7G9a3x8iHg=eWRFtrcwKBdwbdtynmHhV4KPCnDKQ@mail.gmail.com>
Message-ID: <CAD=FV=VKTS7G9a3x8iHg=eWRFtrcwKBdwbdtynmHhV4KPCnDKQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Nov 1, 2020 at 11:21 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Stephen,
>
> Thank you for the patch.
>
> On Thu, Oct 29, 2020 at 06:17:37PM -0700, Stephen Boyd wrote:
> > Use the DDC connection to read the EDID from the eDP panel instead of
> > relying on the panel to tell us the modes.
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > Cc: Sean Paul <seanpaul@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index c77f46a21aae..f86934fd6cc8 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -119,6 +119,7 @@
> >   * @debugfs:      Used for managing our debugfs.
> >   * @host_node:    Remote DSI node.
> >   * @dsi:          Our MIPI DSI source.
> > + * @edid:         Detected EDID of eDP panel.
> >   * @refclk:       Our reference clock.
> >   * @panel:        Our panel.
> >   * @enable_gpio:  The GPIO we toggle to enable the bridge.
> > @@ -144,6 +145,7 @@ struct ti_sn_bridge {
> >       struct drm_bridge               bridge;
> >       struct drm_connector            connector;
> >       struct dentry                   *debugfs;
> > +     struct edid                     *edid;
> >       struct device_node              *host_node;
> >       struct mipi_dsi_device          *dsi;
> >       struct clk                      *refclk;
> > @@ -265,6 +267,23 @@ connector_to_ti_sn_bridge(struct drm_connector *connector)
> >  static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
> >  {
> >       struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
> > +     struct edid *edid = pdata->edid;
> > +     int num, ret;
> > +
> > +     if (!edid) {
> > +             pm_runtime_get_sync(pdata->dev);
> > +             edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> > +             pm_runtime_put(pdata->dev);
> > +     }
>
> Do we need to cache the EDID ? It seems like something that should be
> done by the DRM core (well, caching modes in that case), not by
> individual bridge drivers.

I can take the blame for the fact that it does caching, since I
requested it in early reviews.  In general boot speed is pretty
important to me and each read of the EDID take 20 ms.  There are
definitely several calls to get the EDID during a normal bootup.
Stephen did a little more digging into exactly what was causing all
these calls and can chime in, but in general until we can eliminate
the extra calls it seems like it'd be nice to keep the caching?  This
bridge chip is intended for use for eDP for internal panels, so there
should be no downside to caching.  If we can later optimize the DRM
core, we can fix this and a pre-existing driver that does the same
type of caching (analogix-anx6345.c) at the same time?

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

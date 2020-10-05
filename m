Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 567782837C8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 16:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6960389E0C;
	Mon,  5 Oct 2020 14:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F31489E0C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 14:29:12 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v23so7604625ljd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 07:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+cUizdRPiHQFsQCTd28Hqd94oO6FKlvvb3/hP2cIQhw=;
 b=by6eUml/nhhpcRWVFGpQDAO0sCs1HStz28dBA+w68MhFeulipbPVgnXWe+41IObNJM
 UtZ1J9+tv2FMIcyt9/FMcu9yY0anH0uzrlNwWGCwnD/5ibR5Ex2g3T5tKUTTfpSZ76eS
 n2EgXUmQ1bKXif0r7gPmUDCGlf8DhhyUGCKhx6VenMUJRj8tNFNQj7eLa0azmnhmjR9i
 wgZHH7KJf+6hmbzctG86UBWYOCk1TzVljUaFlXKurn4aihYw9Q0H0zavmYqntogItY8n
 5mRJlOVFLTFU22bBP+KFwY7mBXtuF1dEQjjAeuXV8MonR7vptDePd94j4W3rMeAjPdRy
 WQvg==
X-Gm-Message-State: AOAM530nggf9wfuIuXnUT/cdijt6rgY9l7XK7MfJohkq9HRUlLzNr1gO
 gdlBnXRnvmPJ5wh4/d8d2WuWgZ+1JWOG8w==
X-Google-Smtp-Source: ABdhPJxD1y94iGA4yIRXE//M4oOrbLjUwkmUNKqbRs6Zv0H4dIgsBLtXt0fMAVp8LrBz73Y/7ZSnWA==
X-Received: by 2002:a2e:a496:: with SMTP id h22mr4930lji.24.1601908150339;
 Mon, 05 Oct 2020 07:29:10 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id o8sm2750492lfi.213.2020.10.05.07.29.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 07:29:09 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 77so11165126lfj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 07:29:09 -0700 (PDT)
X-Received: by 2002:a19:c6c8:: with SMTP id w191mr5165802lff.348.1601908148968; 
 Mon, 05 Oct 2020 07:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
 <1df5a7bcafa091e008edb439ee9de4262ae4d5d1.1596101672.git-series.maxime@cerno.tech>
 <CAGb2v64dsqavVYL4UvjWw=DzpbE-Egwso1Ma8xH3qYgS2Te9zg@mail.gmail.com>
 <20201005141817.rsj7d6wwnsgdrydo@gilmour.lan>
In-Reply-To: <20201005141817.rsj7d6wwnsgdrydo@gilmour.lan>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 5 Oct 2020 22:28:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v67Tkk7FtZT8E-5V_X+f=W1FGAfp454KknUdTrYPMP08NA@mail.gmail.com>
Message-ID: <CAGb2v67Tkk7FtZT8E-5V_X+f=W1FGAfp454KknUdTrYPMP08NA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/sun4i: tcon: Refactor the LVDS and panel
 probing
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 10:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Chen-Yu,
>
> Sorry for the delay
>
> On Sat, Aug 29, 2020 at 02:43:53PM +0800, Chen-Yu Tsai wrote:
> > > +static int sun4i_tcon_register_panel(struct drm_device *drm,
> > > +                                    struct sun4i_tcon *tcon)
> > > +{
> > > +       struct device_node *companion;
> > > +       struct device_node *remote;
> > > +       struct device *dev = tcon->dev;
> > > +       bool has_lvds_alt;
> > > +       bool has_lvds_rst;
> > > +       int ret;
> > > +
> > > +       /*
> > > +        * If we have an LVDS panel connected to the TCON, we should
> > > +        * just probe the LVDS connector. Otherwise, let's just register
> > > +        * an RGB panel.
> > > +        */
> > > +       remote = of_graph_get_remote_node(dev->of_node, 1, 0);
> > > +       if (!tcon->quirks->supports_lvds ||
> > > +           !of_device_is_compatible(remote, "panel-lvds"))
> > > +               return sun4i_rgb_init(drm, tcon);
> >
> > Slightly related: IIRC there are a few LVDS panels supported in panel-simple
> > so they don't use the panel-lvds compatible. Any idea how to deal with those?
>
> I agree that this is an issue, I'm not entirely sure how to fix it. The
> proper fix would be to have multiple output ports, one for each output
> type, but given how our current binding looks like I'm not sure how we
> could retro-fit that without some horror-looking code.
>
> Maybe we can add a property on the endpoint?

I guess that works. :)

Since the LCD and LVDS outputs use the same pins, it's not like we really would
have multiple output ports.

ChenYu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

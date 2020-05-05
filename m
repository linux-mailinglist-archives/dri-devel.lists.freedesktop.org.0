Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91241C69A9
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD786E492;
	Wed,  6 May 2020 07:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D84896F7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 19:53:00 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id mq3so56488pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 12:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=+v3yXRYBdTDl2IQ3cSUD9x3QkNmu1c3yvGjn11hkD6o=;
 b=eXgdwU2TBfQdWavLRxs2y5/iRl3vmiwWS6NswNs0wL9cavsvf9xF6/lQ0oqivf3eA4
 qkDuUL3Kg4nxS/2JKNla7YdZrhClL1oUid/Bd+bMalzTGF3r0tTUlFQBtnukDRxqHtbk
 H4gEpbvEJKHX+bfTUSkJ7ShyvrTMs/IpePiqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=+v3yXRYBdTDl2IQ3cSUD9x3QkNmu1c3yvGjn11hkD6o=;
 b=aodFDPvQ2KkjkdtNBs0FVAdeDRqb6rKXqvP8QTz7lBzAX8Vi3bKMOyqmNEwryoZZl4
 Xr+iR3o5xdEO7ZK4BSvGtfAQYrsYTPzb+dnfE8hhH0/MRi6VeFOrzk/QUx0UtDmq5aET
 TJQOhHvMHCDzQaD4ULOaFrFh07hT5kSE6MERGvnnldCP70O9tx3Gqy6lLuYk9FVMYhv4
 aTvo/upesqIMauZVkQvSaFXpPU1ieU2+JuFOt3KcrkP3u1k0mWAf2qUZ8HJYbkr44LsX
 ArXQqdnHkbgqkqId0O68twOHF4+gZiQnxSyEULAvgPQB6Y+lrBjhHBK1kqcgPrrvwpJH
 O3qg==
X-Gm-Message-State: AGi0PuZLyBIBlaDkWa8Y8yHEN3izXsVeqoVjy221ca51YKpvKTjwG1e4
 22hE8rBii7q1fyCHZJ9FEf2sPg==
X-Google-Smtp-Source: APiQypIvJmxfC6YfB9qaWpknOl3wjvxDysY0VfmXMU+FrQLXWMy/7r1rrON3iWj84bN6y2eYj6M4lw==
X-Received: by 2002:a17:90a:d0c3:: with SMTP id
 y3mr5001545pjw.25.1588708380549; 
 Tue, 05 May 2020 12:53:00 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id r78sm2678084pfr.10.2020.05.05.12.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 12:52:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Uq6K95FBkKYn=M6+7cfyam11n_f-9AMxosmDBZQYfmsQ@mail.gmail.com>
References: <20200504213624.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <158865745768.11125.12003632060774071567@swboyd.mtv.corp.google.com>
 <CAD=FV=Uq6K95FBkKYn=M6+7cfyam11n_f-9AMxosmDBZQYfmsQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement lane reordering +
 polarity
From: Stephen Boyd <swboyd@chromium.org>
To: Doug Anderson <dianders@chromium.org>
Date: Tue, 05 May 2020 12:52:58 -0700
Message-ID: <158870837878.26370.13953763070282841423@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Doug Anderson (2020-05-05 11:45:05)
> On Mon, May 4, 2020 at 10:44 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Douglas Anderson (2020-05-04 21:36:31)
> > >         regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
> > >                            CHA_DSI_LANES_MASK, val);
> > >
> > > +       regmap_write(pdata->regmap, SN_LN_ASSIGN_REG, pdata->ln_assign);
> > > +       regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, LN_POLRS_MASK,
> > > +                          pdata->ln_polrs << LN_POLRS_OFFSET);
> > > +
> > >         /* set dsi clk frequency value */
> > >         ti_sn_bridge_set_dsi_rate(pdata);
> > >
> > > @@ -1063,6 +1066,50 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
> > >         return ret;
> > >  }
> > >
> > > +static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
> > > +                                    struct device_node *np)
> > > +{
> > > +       u32 lane_assignments[SN_MAX_DP_LANES] = { 0, 1, 2, 3 };
> > > +       u32 lane_polarities[SN_MAX_DP_LANES] = { };
> > > +       struct device_node *endpoint;
> > > +       u8 ln_assign = 0;
> > > +       u8 ln_polrs = 0;
> >
> > Do we need to assign to 0 to start? Seems like no?
> 
> Yes.  See usage:
> 
>   ln_assign = ln_assign << LN_ASSIGN_WIDTH | lane_assignments[i];
>   ln_polrs = ln_polrs << 1 | lane_polarities[i];
> 
> Notably each time we shift a new bit in we base on the old value.  If
> you think it'll make it clearer, I can put this initialization at the
> beginning of the loop.  It's 2 extra lines of code but if it adds
> clarity I'll do it.

No it doesn't really make it any clearer.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

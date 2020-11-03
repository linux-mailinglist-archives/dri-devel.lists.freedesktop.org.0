Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E322A3E76
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10CA6EBFE;
	Tue,  3 Nov 2020 08:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927DD6E13A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 01:15:27 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id t14so12370603pgg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 17:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=PqAbEpNaqalCL4gjVLHLOZmt8aSF7C4UgItgtzwaFzw=;
 b=Co/H6SGZJetUfpLSN6UcHn8yI/ZbXVM4biUCT5+bBZHl4+NBtkDegXvPd4KMNIRHRb
 UdL80W61Raf1tTMAfbBN/lrGNTNHZHHjIamdINXcd0oHCPJkL7DPv0+fs4uwhWiLDrUM
 OrF3n4VztpswIGau9qDdHF3pzNmcsgzPKU/bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=PqAbEpNaqalCL4gjVLHLOZmt8aSF7C4UgItgtzwaFzw=;
 b=G2pR3Cy8OsXgFWJ/jyNIK0YpYZ6LUQZwK7h8TinfqyheAgDkdAsT7BxWXTgQKjl4po
 pJPOLZZps/au4LOCMWIo+3tgeCgZ9XRIgB76J+hPtoCPkhyIIqgr3HFfhhwjGgKKj5HI
 3ykqVRihqYfFiSTO6Bv87KkUS3JOVu3beujWnjlgBjpmAeeDE01bka8JAM5KUkPtQHl+
 FRb/y9uyx/paEstAhnancBeamatarX3kD71beKCOWKvebkgxXmVAIazSWAZK2K6Ha6Ha
 Bibxbg9jlgKsrfnmkrycKP9N/tzgK722EFmxRWQgr9HVA5zEMJ5z2cNAt7n2EfxWc8O1
 lbsQ==
X-Gm-Message-State: AOAM531gzVl8RDYAWSIzkN2UQuYPKPnUPFQifkRSPdMognhgbmSxcc6X
 aSekEMO70l3sIth5gaEUussf7w==
X-Google-Smtp-Source: ABdhPJxyyHyCsFAt6uHd9IBB9Q7GU9/Cm2oktg1f3L5A2dQ2xhhfNg0ly2klkUgQPL5yKl3c5iQhAA==
X-Received: by 2002:a62:2a94:0:b029:155:3225:6fd0 with SMTP id
 q142-20020a622a940000b029015532256fd0mr24297587pfq.64.1604366127124; 
 Mon, 02 Nov 2020 17:15:27 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id z12sm747236pfg.123.2020.11.02.17.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 17:15:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20201101173741.GA1293305@ravnborg.org>
References: <20201030011738.2028313-1-swboyd@chromium.org>
 <20201101173741.GA1293305@ravnborg.org>
Subject: Re: [PATCH v2 0/4] drm/bridge: ti-sn65dsi86: Support EDID reading
From: Stephen Boyd <swboyd@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>
Date: Mon, 02 Nov 2020 17:15:24 -0800
Message-ID: <160436612483.884498.883110130131457033@swboyd.mtv.corp.google.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sam Ravnborg (2020-11-01 09:37:41)
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
> 
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
> 

I started to look at this and got stuck at ti_sn_bridge_get_bpp(). Where
can I get the details of the bpc for the downstream bridge or panel? Is
there some function that can tell this bridge what the bpc is for the
attached connector? I see that td_mode_valid() in
drivers/gpu/drm/bridge/tc358775.c stores away the bpc from the incoming
drm_display_info pointer but I'm not sure that is correct because can't
that be called for various and not necessarily the one we're using?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

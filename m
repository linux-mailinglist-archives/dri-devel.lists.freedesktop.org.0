Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5248C558857
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 21:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B50410E659;
	Thu, 23 Jun 2022 19:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F8210E760
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 19:08:33 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 l24-20020a0568301d7800b0060c1ebc6438so181442oti.9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=G7GUFKx0kufkNV6cl0VJc529FkLJIKTxF3dZCCvrwdY=;
 b=iN0a13Zqsn8ttJ7ja/KPwL2wPvJTDmHPO333uxUAd1CAaE8rvuUZkbPDyN3+0gOYeh
 yFjnENL67HNFCTd3LjmuhZ4hhwqdRyCMALZc3RW5N1Org7VuzCf1DFMR5WtCyfv2391G
 uo55OZxLAmQCzfMdLjGN999g9b+vwqIJ9/3eM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=G7GUFKx0kufkNV6cl0VJc529FkLJIKTxF3dZCCvrwdY=;
 b=Fj9cl+Cu+KW1gSZqzSj9PuzNwR0q4mo2J1xWGXx0+8BmAnHHPbw8UDuFnOi/mwu1Pf
 P4rlDH+QuYks32igv+kCq833QxUDKKT153vigN0jdMGtianNIxihw4OgpLS9YT8ZFWGR
 XetGeguR6ru69wI/XBgm4I/fyh1T5m+BLwpBZGKrXrvQ2hT9Zx/iqsp3N9CQQDh0XW3Y
 zrN+JN57DP9hH2kqPSZmgp0b3czt1kcwved3sGLmYANpgr/Mkt6pymc3elO1vHon7o56
 R9cSkqaW9BB/jMS8cioK29AamndADtegQtMIO4iWlM5hDaZXDVy7FTxbswSzlCURorZZ
 cUow==
X-Gm-Message-State: AJIora9xac58UcaIg4QtK8bX9AQ8MDovhcPwrgKyc/DZbTmh9f9KSyoE
 nhXJhw+/nmTj/WBpk1HyHHfT3t66Cnq61Oh5jmHMOA==
X-Google-Smtp-Source: AGRyM1vgbF+x4e8hC812jkDhF5ujgwGy9u1TIoIP8891Q9B03Dipuo0gmMCNmbyza772yJuf+a8CoPoLp42FIFqFmzE=
X-Received: by 2002:a9d:729b:0:b0:60c:21bd:97c0 with SMTP id
 t27-20020a9d729b000000b0060c21bd97c0mr4488368otj.77.1656011312243; Thu, 23
 Jun 2022 12:08:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jun 2022 15:08:31 -0400
MIME-Version: 1.0
In-Reply-To: <CACeCKaduttgNfxyzE2_7eD1N4NLNp_8J1EaWTnn+eqp+_P-i1A@mail.gmail.com>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-7-pmalani@chromium.org>
 <CAE-0n51d4S3T+_f+YXsu3es7AMxuyFORSXFQe2LTSkZB4C56Ng@mail.gmail.com>
 <CACeCKaduttgNfxyzE2_7eD1N4NLNp_8J1EaWTnn+eqp+_P-i1A@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 23 Jun 2022 15:08:31 -0400
Message-ID: <CAE-0n53Y4pe3TvNQVKZsqLU4cA-Vs4zH3HHV5U97W_6qCNsEow@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] dt/bindings: drm/bridge: it6505: Add mode-switch
 support
To: Prashant Malani <pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Prashant Malani (2022-06-23 11:37:08)
> On Thu, Jun 23, 2022 at 11:24 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Prashant Malani (2022-06-22 10:34:35)
> > > From: Pin-Yen Lin <treapking@chromium.org>
> > >
> > > ITE IT6505 can be used in systems to switch USB Type-C DisplayPort
> > > alternate mode lane traffic between 2 Type-C ports.
> >
> > How does it work? From what I can tell from the information I find when
> > googling this part[1] and looking at the existing binding doc is that
> > this device is a DPI to DP bridge, and it outputs DP (probably 4 lanes
> > of it?). Does the 2 type-c port design work by transmitting DP on two
> > lanes of DP for one type-c port and another two lanes of DP for the
> > other type-c port?
> >
> > DP could be one lane, so if this device is able to output one lane on
> > any output differential pair then I suspect it could support 4 type-c
> > ports if the hardware engineer connected it that way. Can you confirm my
> > suspicion?
>
> I will let Pin-Yen comment re: this hardware, but 1-lane DP is not a
> supported Type-C Pin assignment
> (as per VESA DP Alternate Mode Spec version 2.0 [2]), so the H/W

Some missing link?

> configuration you are suggesting shouldn't be possible.
>

Alright, cool. But it is possible in the DP spec. So it seems like if
this is connected to 4 DP connectors it could be used to mux between DP
on 4 DP ports.

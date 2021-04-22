Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E44ED367BBF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 10:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E5F6E151;
	Thu, 22 Apr 2021 08:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F566E1D5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 08:10:17 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id u17so67468857ejk.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 01:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h+CMl0wy3Vjr3C3/bC9rZ5K1PCcuzB8i4uU1sLoEz/Q=;
 b=REWRFzLC60dlqnMXMPEWx38bd5GYmNw56uXhyWHcnMYr3Tv5NpMHovQnA5Bb+5InmN
 4b+4f0c1dH/bJ06BBd0tlLT9CpiaeANYTqzerfaaKs42oIiIp1kXhG4vlCosi3/d5fu2
 ElHUSdzzB0d8IjpqH4NOgi+LZkCL7w/YXTu+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h+CMl0wy3Vjr3C3/bC9rZ5K1PCcuzB8i4uU1sLoEz/Q=;
 b=g0Lms1WV8/CGtzwpLwye7M+yyT8G2qaiqNOokWcZaI4RjUh+2GU748BRxZ5fHNmSOH
 QvothA8L5xDHJW3UAecj4aqb1T4tHGzR9cUOKLPxkdZ2aMpeRUmsUyM4RXbM9tMEypJU
 VjrjQon6iXzg6udccw+sqbcgOoX+YDdmiPz52DVOn7DxWt8yiTmgLgIg1WyTWlSyEoVx
 dKeIuSo8n99PphhqtDmvcBAG0iu3lfz19PBfXLbHCzZtP7weLP9I84vSgkJd2G7byqUj
 AOdtN+DLj+fchb1fdZFFCjEuQjN3qPWBfAqDlVjNtNxsYtaV3nQfuwyja+CLClGketID
 od9Q==
X-Gm-Message-State: AOAM5336IRlIvVf+jehfCB2VzFN/r1hjsuiCckt9h8tC1HvHFPK49h6l
 kWN0JsmdAnsmCVommuWBUGXW1jnHKMMTaUU7Y4PByQ==
X-Google-Smtp-Source: ABdhPJz86iG8pbA8A6dOaF9RURCM9V6vojTjv4f6LyDRLnUH+5yxZV2UZ3/KAwNZFRV4cxKgrwj0Yfx3i4LiRRYoxeY=
X-Received: by 2002:a17:906:235b:: with SMTP id
 m27mr2083664eja.336.1619079016529; 
 Thu, 22 Apr 2021 01:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210214174453.104616-1-jagan@amarulasolutions.com>
 <d7f9b241-3cfc-836a-2519-3b6621899108@denx.de>
 <CAMty3ZBMt+bx7ZrCQf0b3wrJUtZVe3CS=8-t_wYZ4+=PwP+mbQ@mail.gmail.com>
 <2d9a88e9-e443-0243-4b68-85fc01d9677b@denx.de>
In-Reply-To: <2d9a88e9-e443-0243-4b68-85fc01d9677b@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 22 Apr 2021 13:40:05 +0530
Message-ID: <CAMty3ZAhdOesrEA26_rduEOaxpwScd5Og6biXT5SzULbH6GR6w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for
 SN65DSI83/84/85
To: Marek Vasut <marex@denx.de>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Claudius Heine <ch@denx.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 4:04 AM Marek Vasut <marex@denx.de> wrote:
>
> On 4/8/21 4:45 PM, Jagan Teki wrote:
> > On Wed, Mar 24, 2021 at 7:26 PM Claudius Heine <ch@denx.de> wrote:
> >>
> >> Hi Jagan,
> >>
> >> On 2021-02-14 18:44, Jagan Teki wrote:
> >>> SN65DSI83/84/85 devices are MIPI DSI to LVDS based bridge
> >>> controller IC's from Texas Instruments.
> >>>
> >>> SN65DSI83 - Single Channel DSI to Single-link LVDS bridge
> >>> SN65DSI84 - Single Channel DSI to Dual-link LVDS bridge
> >>> SN65DSI85 - Dual Channel DSI to Dual-link LVDS bridge
> >>>
> >>> Right now the bridge driver is supporting Channel A with single
> >>> link, so dt-bindings documented according to it.
> >>
> >> Do you know when we can expect a v4 for this?
> >>
> >> I am currently working on top of your patch set to setup a dual-link
> >> LVDS bridge of SN65DSI84.
> >
> > Yes, I'm planning to send v4 this week. will keep you in CC. thanks!
>
> I haven't seen any activity here for over two weeks, so I decided to
> send V2 of the driver I wrote, now tested on both DSI83 and DSI84.

It delayed me since I have considered several comments from the
Mailing list to wrote Dual Link-LVDS configuration support. I have a
plan to send v4 in the coming weekend with these changes, I thought it
would be the possible driver to support 1 and 2 links LVDS.

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

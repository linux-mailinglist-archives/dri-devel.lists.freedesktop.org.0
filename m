Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC0031B7F4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 12:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C27B89FD1;
	Mon, 15 Feb 2021 11:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6E689FD1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 11:25:49 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id t62so6014122qke.7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 03:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V5p/Ptpd8Lzv5tKkYHxJzAd/BlFt3ePQF/VhO0/xQ9g=;
 b=XmjNHDNIuHF1fDcddYwkbuTllthAII7JSKOm/beY3HBLxAKdzSsi3l5Q835js8OMK2
 HOR1GMNG08PkRKVk7WtQaMwJjgDkjLG8X9BWtcGBJar/AzjDknMicSc2rLeO6fznCycZ
 P+AjBlz7/i7XZR/xYwn14nBCfEIoWAW549gVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V5p/Ptpd8Lzv5tKkYHxJzAd/BlFt3ePQF/VhO0/xQ9g=;
 b=jh4ygO1dTdCtNORYzWDAN1LrG+IVvmDw1eFqRFwWBB6VbapCXG1jC/gWWseGqSCn4C
 spWMYjQz+r8LxGye3aJIL6oWZP6jCf+YzBrz8j3hVzG4if1LRGi1u4OW11TzHBUhE1+s
 phzmoXEWu1gRwU9Q2/U1GLfwS+FYQInFfT58nFH8qYJy+Szpf/LOPbmLZ6zezd1+Cc7x
 dC+z7DgVA4mzXnzCPuBzJnj3eUUA1kkDeGt0j+1BRWDPOuRnOytyl9L8Xo+SnELrrg+W
 /ac/4qqhi1OLPn1J8EqcgNHnAS4zkFCF2XwD0quYUHb5KN71Ml+TryGjSDqoz37RVxCB
 Kvog==
X-Gm-Message-State: AOAM531HC+RSIl1acdXzQzjZ/wU6rO6vMOopeGofSoOjrfR6Vbgm0ic+
 hZ84sDqCU2vI6uSEcRohY9+kkLESs4KYJCFa7ao24g==
X-Google-Smtp-Source: ABdhPJxZm8ADvBSIVcrG9NDd4A2KXUR9+do9fxfPHlIi8CcMPRNY15cK/Vy9v+E/aC/pTUGVGQRBQQAN9JbJefmfiBI=
X-Received: by 2002:a37:bcc6:: with SMTP id m189mr14108089qkf.88.1613388348069; 
 Mon, 15 Feb 2021 03:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20210214174453.104616-1-jagan@amarulasolutions.com>
 <8330126a-b2f4-5991-a2fa-37776cb412d0@baylibre.com>
In-Reply-To: <8330126a-b2f4-5991-a2fa-37776cb412d0@baylibre.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 15 Feb 2021 16:55:36 +0530
Message-ID: <CAMty3ZAgKPXpkiWuG3cGFs4sZPd182hBNaTbveL9USLj8o=ZxQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for
 SN65DSI83/84/85
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 15, 2021 at 2:32 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 14/02/2021 18:44, Jagan Teki wrote:
> > SN65DSI83/84/85 devices are MIPI DSI to LVDS based bridge
> > controller IC's from Texas Instruments.
> >
> > SN65DSI83 - Single Channel DSI to Single-link LVDS bridge
> > SN65DSI84 - Single Channel DSI to Dual-link LVDS bridge
> > SN65DSI85 - Dual Channel DSI to Dual-link LVDS bridge
> >
> > Right now the bridge driver is supporting Channel A with single
> > link, so dt-bindings documented according to it.
>
> Shouldn't it describe Dual-link LVDS already for SN65DSI84/85 and Dual Channel DSI for SN65DSI85 even if not implemented in the driver ?

Patch documented only Single link LVDS as it only supported by driver.
Single link LVDS with Channel A configuration is common across all 3
variant chips. I have SN65DSI84 with Single link LVDS which is routed
in Channel A. Idea is to go with Single link and add double link later
and document the same.

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

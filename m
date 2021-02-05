Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B1A3106B1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 09:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DBB6E270;
	Fri,  5 Feb 2021 08:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E52B6E270
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 08:30:50 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id a9so10576441ejr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 00:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q+ylPOmVqxiwI3Mekr9xiE5Ov1z7xP6kqenxfg8J3H8=;
 b=oa8tmGM+AmeFGtvqDJCuZkdvBIJN7ltjyDQe8/Nr7zCn4xfCihxZAlowFHMnUiA4Hh
 7K/YRitiR0/G7MpGf/nU+5aemA1UZ7139JzG8SLWaeU+xGOBXuSKk9CUT9KiOhEkcrUg
 xqb2ITyP7MNpVeM0KUyAK7MrqDV/lBiK/ZRj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q+ylPOmVqxiwI3Mekr9xiE5Ov1z7xP6kqenxfg8J3H8=;
 b=jaEEzB/nmukLjLO2AoDfTFP+UulfTtYnf5mkkZn80VANl2SYcKU4PFzqRHIAN16NTh
 7Tmj0qIcHuMcV2iMEyS8bIEwAp7dmgFCRLtoUpfxT19RZFFYTZEtHv2DBLJoYpcbuQES
 0MPIWbpOD/FCfFadKm/4nAIJjvBOl031Y6j+JAmqkES32b47UQgHPjNybh7gGXLGcDgw
 fHZ8txNI/F8PasUpJ76IxagDhElS9zHK4GWq88mwUnuq26kWdkdYjSpIkIjc/ZTvkfpA
 M2JYH6D/DIjUF74X844I3fydAUt6NmA4NYY/xFi2S2cN+yUuZ0afgxnD4dGTOtUQ5HNB
 MxGg==
X-Gm-Message-State: AOAM531Iuv83iEio+BEFPFM5bd0Svbu5pIYEcL+XuMogQhZjQYCUiRbr
 nRi4S6PCXLo7YjIO06bK4YIZCk7kKnSvIGC/5fULzw==
X-Google-Smtp-Source: ABdhPJyrgtcgk1gvRXUJeAHKakFmL/Gl9g9udzyY62k9eYBNyjE7YAy+aSD8k+pxV1stsSIWt2joswrMvstVkMdJkKA=
X-Received: by 2002:a17:906:8252:: with SMTP id
 f18mr3041674ejx.418.1612513848888; 
 Fri, 05 Feb 2021 00:30:48 -0800 (PST)
MIME-Version: 1.0
References: <20210203071256.42050-1-jagan@amarulasolutions.com>
 <20210203071256.42050-2-jagan@amarulasolutions.com>
 <YBx1T3U1pNaLfJLQ@pendragon.ideasonboard.com>
 <ae346027-a58e-e773-60ce-92a79f0d99d6@denx.de>
In-Reply-To: <ae346027-a58e-e773-60ce-92a79f0d99d6@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 5 Feb 2021 14:00:37 +0530
Message-ID: <CAMty3ZApHx=o5SR14nL62Mc9Skd3a0HJyqsZVW06NBiF7uwR=w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm: bridge: Add SN65DSI84 DSI to LVDS bridge
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 4:50 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/4/21 11:29 PM, Laurent Pinchart wrote:
> > Hi Jagan,
> >
> > Thank you for the patch.
> >
> > On Wed, Feb 03, 2021 at 12:42:56PM +0530, Jagan Teki wrote:
> >> SN65DSI84 is a Single Channel DSI to Dual-link LVDS bridge from
> >> Texas Instruments.
> >>
> >> SN65DSI83, SN65DSI85 are variants of the same family of bridge
> >> controllers.
> >>
> >> Right now the bridge driver is supporting a single link, dual-link
> >> support requires to initiate I2C Channel B registers.
> >
> > MArek Vasut (on CC) has very recently posted a driver for the SN65DSI86.
> > Should the two drivers be merged together ?
>
> Since Jagan's V1 was out first, I will let Jagan pick whatever might be
> useful from the driver I posted, probably the O(1) clock rate
> calculation and some of the regmap stuff, and once there is some merged
> result, I am happy to test it on my hardware. The DSI83 is I think the
> same as DSI84, except with half of the channels.

Thanks. please wait for the v3 series, we can discuss further on top.

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

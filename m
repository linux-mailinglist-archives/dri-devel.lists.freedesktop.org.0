Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DD1122F8F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 16:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3ABA6E0F6;
	Tue, 17 Dec 2019 15:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512E96E0F6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 15:02:26 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id n12so7204888lfe.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 07:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O0Rb66CNDickRJ7Bq/qbZCX6pe18JWnwUGYQoSabjlo=;
 b=nc1kFGIJ2X3MLSwFsYgwekE3eU2ELET6ZDdDVyEmz8SzrcdMWQWzkYwBWnGwSdgtZo
 kh2P7GoGLqi7c3CK7uU6RYf02CgECXUagaEj8fTdohW6lijFhA/hVlviikpqrx8uc9FO
 6CUosdIm6B5iLGdwJSyaKdosfBdk2I3gv3Sy0rwQzKlfieMyu1I87feqxZq0uKI8vfwe
 00SZau+pluocODLrt9/0YkwjJafAsJBuJK5EJnlypuotcXqOwOU1AOTxsGg3jdGXimwg
 maj97Cf5R15V1SPJomwo057ptoU4RgxgvkhJgpDIs1kxReOSUdD+PWs8plH4fI37lFVy
 e1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O0Rb66CNDickRJ7Bq/qbZCX6pe18JWnwUGYQoSabjlo=;
 b=YphHHgNcH0r5ZEo2dIbOZyH0NJpCyg9owrEebmtAcch4QB7fq4sDY5kBRXlib32cyQ
 K1vG2fxzkh6OYKWULsqXDZva+3/wGDPAo55i2gDgS6F0i9uPFbd74be/L6HGtA5UIinG
 lY0GSrI6TVOxBKdjl97Vul9nVU7VGDJIYmYuqUd0vH/L9Erv8F7NGI/E+tBMjNBZURT8
 OYS1CN7JnFNCNk6DtqwUrW5AzOCYyyvwIKHq1v6SEcW7ZgkKx9xDBXm13KezDvtoRzvV
 sFhwEi//s3i0juxr3QNiG7GwDyAzcL+Zz3yRzcLpQdc4BxbWp5opux8LpCBgMdtw5HUl
 X1Ug==
X-Gm-Message-State: APjAAAVdTQDypBQ0NfhUizNMgw7X0XoEDMQVhNvqfaPrTZ959xMI/TAx
 3SnlDuL/YO4v/O1oIjcRk4WP4KCZiSUKpMex4s6CZPHJYM4=
X-Google-Smtp-Source: APXvYqziHWni3JFUJ+TuCWQlnrnZGScQfZ10zwQWd1xsjMdSwrSbKbX+lnqf9d2eTrU3sACzVPGsxGpql0eJY5wMDhg=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr2920893lfi.93.1576594944680;
 Tue, 17 Dec 2019 07:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20191216210647.21808-1-linus.walleij@linaro.org>
 <20191217102712.GA879@gerhold.net>
In-Reply-To: <20191217102712.GA879@gerhold.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2019 16:02:13 +0100
Message-ID: <CACRpkdb6WPuCktr16uOJigNkHbO8EbY0_EonWp07MzEi9xzCSA@mail.gmail.com>
Subject: Re: [PATCH v5] drm/mcde: Some fixes to handling video mode
To: Stephan Gerhold <stephan@gerhold.net>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 11:27 AM Stephan Gerhold <stephan@gerhold.net> wrote:

> I feel kind of bad to keep requesting changes for this patch,

Don't feel like that. It is complex hardware and complex code,
so it leads to complex development.

Also I am making way too many stupid mistakes :/

> > +             val = readl(d->regs + DSI_VID_PCK_TIME);
> > +             val &= ~DSI_VID_PCK_TIME_BLKEOL_DURATION_MASK;
> > +             val |= blkeol_duration <<
> > +                     DSI_VID_PCK_TIME_BLKEOL_DURATION_SHIFT;
> > +             writel(val, d->regs + DSI_VID_PCK_TIME);
> > +
> > +             /* Max burst limit, this is given in bytes */
> > +             val = readl(d->regs + DSI_VID_VCA_SETTING1);
> > +             val &= ~DSI_VID_VCA_SETTING1_MAX_BURST_LIMIT_MASK;
> > +             val |= blkeol_duration - 6;
>
> The vendor kernel writes blkeol_pck - 6 (instead of blkeol_duration) here:
>
> dsi_wfld(io, DSI_VID_VCA_SETTING1, MAX_BURST_LIMIT, vid_regs->blkeol_pck - 6);

You're right, and still I read the code over and over...
It's good we have 2 pairs of eyes.

> Also: It does not make a functional difference here but for clarity we
> should shift the value by DSI_VID_VCA_SETTING1_MAX_BURST_LIMIT_SHIFT (= 0),
> i.e.
>
> val |= blkeol_pck - 6 << DSI_VID_VCA_SETTING1_MAX_BURST_LIMIT_SHIFT;

OK I fix!

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

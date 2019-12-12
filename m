Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD46011C8AC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD626ECCA;
	Thu, 12 Dec 2019 08:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F296EC32
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 02:29:05 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id az3so51954plb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 18:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lHRtwIItCexD+qfgvxzFUTKiWLGwmF9F2M8+/bnkz6M=;
 b=ux12WCC2E3+EA1EbCjwqNx8GLRGFPRglvG3OVV3suv9+xOJ0ZqmYErZM2BHQfo/nm3
 mXj87BhfVUxlTAgx8V6zUmF3pW4+1/V9xWDkJFTcj/krxdPoaTL3ulC8e4OwiAOOLq+x
 hpI5I9FxsWarJ88KjytB+FmUgVmsY5e8qRbNmHqDWvA9VeDYq23iIJvLsNvqwRYbrEtL
 pnEtwKx+Oa8J4aiVHntuyapJ/zat8zULAJN3I/BL/Q74hkrVC8T8BCoGkMxGE+cSqe4k
 DGcD4Qfp0OSLgSuCQFikxaXFLZybCRjTX5RNHGNMtckb6zo1dIBb/60zVjbeyCfxR83C
 Aq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lHRtwIItCexD+qfgvxzFUTKiWLGwmF9F2M8+/bnkz6M=;
 b=ac1LK4UGyKRKPjQUnCgrG/lpuIdLEV6T/l8MXuu3CPWoghil7WQI9Qj3uAZHX6I5TN
 /KqUTyMAkw1JgrC0Mo7OfUznNk7hyyyA5gV+J1Ow4DIa/w6DF1wBJachFjRtyD/yJ112
 25R6ZgVjY1T5wSjpkku01miKNcs72KOw2yh0Ya7MfBOWqAl4Ih/AaiAP/zfZ9lKYQVpW
 yL0CcVscSz5fBVO3FvZTToY/l0h8ekg9w5Y+tKh7U+Pjs6CJD6bgbnZMIaaakrkXbQZs
 g7hG/ipqPggazHA9EKvPpC3Wj/oIiz5BAGnoKTmxD9dvHpCJnk4j4odxskIHuRkmXsRz
 d69w==
X-Gm-Message-State: APjAAAVW+9iyWxBiuKoKnF5xqhnA1IXdCzwjzBGFEkhG3FStNoe8VSZz
 FDt1kRovN71MBWJst2tnCmjpO1AsVxG7xbV2RLI=
X-Google-Smtp-Source: APXvYqzraVrq0yPjV6cCdYviSkDfllH+Syt21lxgYaYIKWwpt/8depedmOxOpdcMBfn+LiqHmkD9LCYhn9W3fzSvGuw=
X-Received: by 2002:a17:90a:d783:: with SMTP id z3mr6939052pju.3.1576117744957; 
 Wed, 11 Dec 2019 18:29:04 -0800 (PST)
MIME-Version: 1.0
References: <20191209014641.24685-1-jerry.han.hq@gmail.com>
 <20191211200651.GA10693@ravnborg.org>
In-Reply-To: <20191211200651.GA10693@ravnborg.org>
From: Jerry Han <jerry.han.hq@gmail.com>
Date: Thu, 12 Dec 2019 10:28:54 +0800
Message-ID: <CA+quO7Lt_961fHGPMAqHA0MUmQHJCyKnE=C8M26KunYunS2mjA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add Boe Himax8279d MIPI-DSI LCD panel
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Rock wang <rock_wang@himax.com.cn>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> Hi Jerry.
>
>
> > Support Boe Himax8279d 8.0" 1200x1920 TFT LCD panel, it is a MIPI DSI
> > panel.
>
> Thanks for your persistence with this driver.
>
>
> Unfortunately the driver no longer builds after the drm_panel
> work we committed earlier this week to drm-misc-next.
>
> >
> > V9:
> > - Adjust init code, make the format more concise
> > - kill off default_off_cmds (Emil)
> > - use mipi_dsi_dcs_set_display_{on,off} in their enable/disable
> >     callbacks. (Emil)
> > - Adjusting the delay function (Emil)
>
> ...
> > +
> > +struct panel_info {
> > +     struct drm_panel base;
> > +     struct mipi_dsi_device *link;
> > +     const struct panel_desc *desc;
> > +
> > +     struct backlight_device *backlight;
>
> We have included backlight support in drm_panel.
> Can you please introduce this and post a patch updating the driver to
> use this.
> See other panle patches what is required to use it.
> (Mostly deleting code)
>
> I took a look at the rest of the driver and everything looks good.
>
> Sorry for causing you this extra trouble due to the drm_panel changes.
>
>         Sam
Hi sam:

I'm happy to change the code for consistency.
I have provided the corresponding patch.

Thanks
Jerry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

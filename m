Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D712CADDE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 21:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75156E02B;
	Tue,  1 Dec 2020 20:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441056E915
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 20:57:37 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id n18so1032109ual.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 12:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NMR1Lqsp+XDlucBE3khvw25Z45PAY73axT6ZlCYS5O8=;
 b=bCJ4N2cHM0axheqniZb5ImFRDCynFzalm/pF1eW/CavdqG4eTwXAD6P+WEzaBRwsLS
 B8rOQIl7zyH6V57XkWttYpPL9SiDJU8F0uyx1FSgBxo6w6Lhb6v9wRgY4BG6ltvo9pCF
 +BQhN8HDTW0X0sXtPZEH3F3fuhIRj/uvrBtVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NMR1Lqsp+XDlucBE3khvw25Z45PAY73axT6ZlCYS5O8=;
 b=A2jDkUVpBUrXSjmwaPQhsZh7hN+EVd4BQazscF6xb8uc6i8MAUne7SeeUtQvTRtpOS
 +3EzQ484zdMLh6YrXlm8Xu7YUGgzm82I648VHihsAIV741ZtOfU7wdXxDqv9ekiNYHq/
 Il6f23X38hA/U9aSTO2KpihOejpYROVVZHrrg+d9fBLn9VHxbcEYVBTw14bY8BtQwkxb
 QtP8AeoIz+LrXZdtfE+vwhHyDWDNYsW7YCcynJ8m529ZJWV6MIh2psfOzcdVJSVK7/Sk
 mZMvYjnZdSqFCJs67mCl+xxerXXqduyGPggKoh4/fB6yIBxFwpIsJLBZvTL9pIUu8X8j
 DTfw==
X-Gm-Message-State: AOAM5326i4Wl4NJnt1jVPxeeXHEpI7rNLGWuYv7XNC96C5HQld31R3Nd
 TH/npM4ROvO6+ywOPp0ZPZa0QTk8uENH+Q==
X-Google-Smtp-Source: ABdhPJw65EYW4rUeLzOf72T1nBbXRqFbmpLoS8nK0hRyqXE4vk8vFcpVy/SxFLYBCnDuOb9RX4vTUg==
X-Received: by 2002:ab0:7653:: with SMTP id s19mr4361869uaq.14.1606856256086; 
 Tue, 01 Dec 2020 12:57:36 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44])
 by smtp.gmail.com with ESMTPSA id s6sm123642vkk.20.2020.12.01.12.57.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 12:57:35 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id z16so1708902vsp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 12:57:35 -0800 (PST)
X-Received: by 2002:a67:32c5:: with SMTP id y188mr4700191vsy.4.1606856255177; 
 Tue, 01 Dec 2020 12:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20201130182643.GA1497637@ravnborg.org>
 <CAD=FV=Ur+dENMpHHN7b=fahhtMFZ_BCDcr7cTDyPzZgn7rqbMw@mail.gmail.com>
 <20201201202833.GA2040622@ravnborg.org>
In-Reply-To: <20201201202833.GA2040622@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 1 Dec 2020 12:57:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XWrQL8KBt7AMSBAty_qvHinnua_RF3EwtjGv2i=J-6pg@mail.gmail.com>
Message-ID: <CAD=FV=XWrQL8KBt7AMSBAty_qvHinnua_RF3EwtjGv2i=J-6pg@mail.gmail.com>
Subject: Re: [PATCH] drm: panel: add flags to BOE NV110WTM-N61
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 1, 2020 at 12:28 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Doug,
>
> On Tue, Dec 01, 2020 at 10:53:17AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Nov 30, 2020 at 10:26 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > When applying a patch to add the BOE NV110WTM-N61 panel I forgot
> > > to add the changes that added flags to drm_display_mode.
> >
> > Sorry, I didn't mean to make more work for you!
> >
> >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Fixes: a96ee0f6b58d ("drm: panel: simple: Add BOE NV110WTM-N61")
> > > Cc: Douglas Anderson <dianders@chromium.org>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index 216cde33b5c4..2d093b5a513c 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -1367,6 +1367,7 @@ static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
> > >                 .vsync_start = 800 + 3,
> > >                 .vsync_end = 800 + 3 + 5,
> > >                 .vtotal = 800 + 3 + 5 + 24,
> > > +               .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> > >         },
> > >         {
> > >                 .clock = 57500,
> > > @@ -1378,6 +1379,7 @@ static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
> > >                 .vsync_start = 800 + 3,
> > >                 .vsync_end = 800 + 3 + 5,
> > >                 .vtotal = 800 + 3 + 5 + 24,
> > > +               .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> >
> > I think you're off by 10 and a letter.
> >
> > The subject talks about:
> >   NV110WTM-N61
> >
> > You're modifying the structs for:
> >   NV101WXM-N51
> >
> > I'm happy to post this if it's helpful to you, or I can review a v2
> > from you.  :-)
> Please do so, that would be very nice.

Breadcrumbs: this can be found at:

https://lore.kernel.org/r/20201201125554.v2.1.I8a7bfc0966e803ab91001c9e6d01a736950c4981@changeid

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

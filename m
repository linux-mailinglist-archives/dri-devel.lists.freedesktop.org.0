Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ECF21ACF1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 04:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434A86EB59;
	Fri, 10 Jul 2020 02:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056646EB59
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:14:55 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id e15so2181601vsc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 19:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Hywc1x9A6pr0CRt+2NvKzTMAzPWDqqcQzWTAgr3WdA=;
 b=FqMpvwwCb9dpe7UBryM/EcOozRX1lwFdrdBzi6xzDnEKZh2OoMEtN2fjbqcDCUrTRA
 G/uqyZ8phkRmpHCnbtDwt4L9W1fAWzn3ef/hbpBNScSTumoNlfxcimfhrs002pQgYYMO
 C5wNeccogggNi/MBtl9XYVeMhj+5M8PkPDZAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Hywc1x9A6pr0CRt+2NvKzTMAzPWDqqcQzWTAgr3WdA=;
 b=bwQkTEEFT/IWG1jDScUeBRTDR0D0cnxXAyhBJSVc+tVv6ABDlX0lHOw7zLQEAQ0DK6
 gBllvo3p7rpA9Y9WM+/L/7UzLPLHs4ren0r9TZn5ThrqdNYOY2/EJ6Niji1UAJOtxHmo
 Iao96FimbiF7Bxfy+GjDV5qvpNGfmHHPR7kdehJzMrkXwyV3Wjjmf3IUf2DhKwg7votJ
 CGyj9E99uelpo6e+xhXrnT75m1KJG/Tc/B6PJVXQmxZWsyj4xwAZA4nrjHzYtP7yImnC
 ONcpgfpAxzjNo6xfgL3lJA/EKQkMCvKk8WFOiQG30uaVbHyjnyCfMRtftGsDbKCKKhEc
 5MOA==
X-Gm-Message-State: AOAM530ZUOml+ZDNRD2g8XA3mztloDUJG8+S9+xO9IlNlAYWT76zfnQX
 9Tvyk8PkLA1rsyXLDg92qEoHILJeR0M=
X-Google-Smtp-Source: ABdhPJxMxHNylnfBxzPFiTjF+0OAqijdEsJV0lcVBHuun6fW0PhVe1thHjaKxRsSJF2kBVQEWPIrZw==
X-Received: by 2002:a67:f8da:: with SMTP id c26mr39178571vsp.204.1594347293702; 
 Thu, 09 Jul 2020 19:14:53 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id g10sm691234vkm.35.2020.07.09.19.14.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 19:14:52 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id o25so1358066uar.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 19:14:51 -0700 (PDT)
X-Received: by 2002:ab0:6e8e:: with SMTP id b14mr54133636uav.0.1594347291225; 
 Thu, 09 Jul 2020 19:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200710011935.GA7056@gentoo.org>
 <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
In-Reply-To: <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Jul 2020 19:14:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWQsGit6XMCzHn5cBRAC9nAaGReDyMzMM2Su02bfiPyQ@mail.gmail.com>
Message-ID: <CAD=FV=UWQsGit6XMCzHn5cBRAC9nAaGReDyMzMM2Su02bfiPyQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
To: steev@kali.org
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
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Steev Klimaszewski <steev@gentoo.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 9, 2020 at 6:38 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Jul 9, 2020 at 6:19 PM Steev Klimaszewski <steev@gentoo.org> wrote:
> >
> > Hi Doug,
> >
> > I've been testing 5.8 and linux-next on the Lenovo Yoga C630, and with this patch applied, there is really bad banding on the display.
> >
> > I'm really bad at explaining it, but you can see the differences in the following:
> >
> > 24bit (pre-5.8) - https://dev.gentoo.org/~steev/files/image0.jpg
> >
> > 18bit (5.8/linux-next) - https://dev.gentoo.org/~steev/files/image1.jpg
>
> Presumably this means that your panel is defined improperly?  If the
> panel reports that it's a 6 bits per pixel panel but it's actually an
> 8 bits per pixel panel then you'll run into this problem.
>
> I would have to assume you have a bunch of out of tree patches to
> support your hardware since I don't see any device trees in linuxnext
> (other than cheza) that use this bridge chip.  Otherwise I could try
> to check and confirm that was the problem.

Ah, interesting.  Maybe you have the panel:

boe,nv133fhm-n61

As far as I can tell from the datasheet (I have the similar
boe,nv133fhm-n62) this is a 6bpp panel.  ...but if you feed it 8bpp
the banding goes away!  Maybe the panel itself knows how to dither???
...or maybe the datasheet / edid are wrong and this is actually an
8bpp panel.  Seems unlikely...

In any case, one fix is to pick
<https://lore.kernel.org/dri-devel/1593087419-903-1-git-send-email-kalyan_t@codeaurora.org/>,
though right now that patch is only enabled for sc7180.  Maybe you
could figure out how to apply it to your hardware?

...another fix would be to pretend that your panel is 8bpp even though
it's actually 6bpp.  Ironically if anyone ever tried to configure BPP
from the EDID they'd go back to 6bpp.  You can read the EDID of your
panel with this:

bus=$(i2cdetect -l | grep sn65 | sed 's/i2c-\([0-9]*\).*$/\1/')
i2cdump ${bus} 0x50 i

When I do that and then decode it on the "boe,nv133fhm-n62" panel, I find:

6 bits per primary color channel

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

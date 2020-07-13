Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC7F21D9C6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 17:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD076E27F;
	Mon, 13 Jul 2020 15:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDCB6E266
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 15:08:33 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id q15so6759168vso.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 08:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jL0qg9txtW+UzBOFpRiVbZ1cvNjK+k+Z2zD2+dWd5xU=;
 b=Rrznap+7c3ejPjjRxwh934nQUUwJZgqI+M3shHiuekSOP8O2XMiQptg6HCTZ3/GqCq
 PtvZbvQ+9M7G4UEaYbk2Zkurr6mOU2qKAsB6gunmVxW0xlHUEsKN65rqdz5KBVIGQVuf
 s4ezGY5pV1pLxDDQrvlXGCCUyp85khIBh+8xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jL0qg9txtW+UzBOFpRiVbZ1cvNjK+k+Z2zD2+dWd5xU=;
 b=tGGiniNm46rwlJOGREI+BXstnK57I0cxXT+B9v4Ma/vQKytyaPuJRVXd02nuXncNbR
 I5i86NIRqosk3S4VTB69J30LgGjyQ//3dIFlDePDox5uIHtbjXmrmB/Ey609MkgdfCHQ
 Y1r1DqTaH/q0bJjvZDur6/Rh60971BRPaZRNFcGVNM2SLEZmnStcIEOjX9K2mTWTq7Az
 fcfKE2Hix28LIHjoOjA4sFvL8VxRgPiyg4PQT/nc7cU7obpjTh/jPyJe3g+lLtsFjUpD
 xgso2n4xAVBmyMf3eVnKp18NT9F8wP3CLa4fcwFNFBxRmxRaSGNnsITdQZ+NCzYe23e7
 FIKg==
X-Gm-Message-State: AOAM533ZUBU32bzTGKU/yzlOkC2gdyICoTwoojPavQ3oJpBjuyzuQl88
 OpyzSUmhkQ0Wv4he0Xh6jREH4ybIVl4=
X-Google-Smtp-Source: ABdhPJyqQzs9fCNuw/HtzPhU6Ve12jKTh4pRaDxDRmem+2SUJFC37lN0yIt6VS9/2bo0hhkFAW3U7g==
X-Received: by 2002:a67:d184:: with SMTP id w4mr43168545vsi.17.1594652911842; 
 Mon, 13 Jul 2020 08:08:31 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49])
 by smtp.gmail.com with ESMTPSA id t74sm1953752vkc.12.2020.07.13.08.08.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 08:08:31 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id j186so6756459vsd.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 08:08:31 -0700 (PDT)
X-Received: by 2002:a05:6102:20a:: with SMTP id
 z10mr50329603vsp.213.1594652906281; 
 Mon, 13 Jul 2020 08:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200710230224.2265647-1-dianders@chromium.org>
 <CAL_JsqKC5WtHb-coMCxMTDJ7CJcjVXcAxDT4J9N-Xyr=0uuURA@mail.gmail.com>
In-Reply-To: <CAL_JsqKC5WtHb-coMCxMTDJ7CJcjVXcAxDT4J9N-Xyr=0uuURA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Jul 2020 08:08:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWKoTd_t2uRGpw3oa0Nij2EPeAJpOHhUipXFW07JN2qw@mail.gmail.com>
Message-ID: <CAD=FV=XWKoTd_t2uRGpw3oa0Nij2EPeAJpOHhUipXFW07JN2qw@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm/msm: Avoid possible infinite probe deferral and
 speed booting
To: Rob Herring <robh+dt@kernel.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 13, 2020 at 7:11 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Jul 10, 2020 at 5:02 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > I found that if I ever had a little mistake in my kernel config,
> > or device tree, or graphics driver that my system would sit in a loop
> > at bootup trying again and again and again.  An example log was:
>
> Why do we care about optimizing the error case?

It actually results in a _fully_ infinite loop.  That is: if anything
small causes a component of DRM to fail to probe then the whole system
doesn't boot because it just loops trying to probe over and over
again.  The messages I put in the commit message are printed over and
over and over again.


> >   msm ae00000.mdss: bound ae01000.mdp (ops 0xffffffe596e951f8)
> >   msm_dsi ae94000.dsi: ae94000.dsi supply gdsc not found, using dummy regulator
> >   msm_dsi_manager_register: failed to register mipi dsi host for DSI 0
> >   [drm:ti_sn_bridge_probe] *ERROR* could not find any panel node
> >   ...
> >
> > I finally tracked it down where this was happening:
> >   - msm_pdev_probe() is called.
> >   - msm_pdev_probe() registers drivers.  Registering drivers kicks
> >     off processing of probe deferrals.
> >   - component_master_add_with_match() could return -EPROBE_DEFER.
> >     making msm_pdev_probe() return -EPROBE_DEFER.
> >   - When msm_pdev_probe() returned the processing of probe deferrals
> >     happens.
> >   - Loop back to the start.
> >
> > It looks like we can fix this by marking "mdss" as a "simple-bus".
> > I have no idea if people consider this the right thing to do or a
> > hack.  Hopefully it's the right thing to do.  :-)
>
> It's a simple test. Do the child devices have any dependency on the
> parent to probe and/or function? If so, not a simple-bus.

Great!  You can see in the earlier patch in the series that the very
first thing that happens when the parent device probes is that it
calls devm_of_platform_populate().  That means no dependencies, right?
 So that means it's fine/correct to add "simple-bus" here?


> > Once I do this I notice that my boot gets marginally faster (you
> > don't need to probe the sub devices over and over) and also if I
>
> Can you quantify that?

I'd say < 100 us.  I can try to quantify more if needed, but it wasn't
the point of this patch.


> Have you run with devlinks enabled. You need a command line option to
> enable. That too should reduce deferred probes.

Ah, good idea!  I will try it.  However, even with devlinks, if there
is any chance of deferred probes then we need a fix like this.  The
point of the patch isn't about speeding things up but about avoiding
an infinite loop at bootup due to a small bug.


> > have a problem it doesn't loop forever (on my system it still
> > gets upset about some stuck clocks in that case, but at least I
> > can boot up).
>
> Deferred probe only runs when a device is added, so it's not like it
> is continually running.

If you don't mind looking at the code patch, see:

https://lore.kernel.org/r/20200710160131.4.I358ea82de218ea5f4406572ade23f5e121297555@changeid/

Specifically you can see that each time we try to probe we were
calling of_platform_populate().  That appeared to be enough to trigger
things.


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

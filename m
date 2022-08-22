Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F2C59C58E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 19:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40AF9B2E4;
	Mon, 22 Aug 2022 17:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1948F9B279
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 17:56:49 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w10so2821054edc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 10:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ruv6/x2zxiBtuZTzNW3ZFqdO19u7NmO0/moPhHRrrEI=;
 b=bQCdaGEcjhM1WRYlDQ8CWkjVbQtO0d4RmkzIk66Y0ZAoAu6Ebor9tE8stwHQSPPtnx
 MyTnjWvWjBP1rmlw1Cb3MXkE9/riCIzTMqENjyeUPS7bGlPdAspMKUSfWkpVMcOdwLhb
 TWb3lUIjvCnporY09y1Z38hmrv/CJswmP9VcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ruv6/x2zxiBtuZTzNW3ZFqdO19u7NmO0/moPhHRrrEI=;
 b=20U6y6bKUpwC0XInqEVYcJwwtacEZprdph/QG71QQUuKQabaCVa01xOPwIhe3Fpfoq
 h2FpoVT9lrBMlHKh+k6Jodrvx8/8r90hwE+gEZEa1GhZqTed6fwtNJsct2uronDEmgt5
 YpjowZs7jwGtQNmjHLxKj1IG/sWuzVJo91/w4eayMkfRglUpmlldiXCuhriUBBCwIcjv
 0aZQFVJaWes28BZF41NhotBEJ4ke6jH3t4Uy6cO2pCjdCjBYJtXHXmCIYUX0eVmrVf6j
 k1xMxw4llW4TdXp6xJ0vHMImzuBw+Tlpf+/Z2Tvl3qBB3fFgAq6R2kcuPyY1mO7q8zDk
 C0Bg==
X-Gm-Message-State: ACgBeo1tiJuLlTkq6otb5vGR31i0jLk8fYDMCaobWdeKOFHfywBvmA3+
 Oxs5VwM5gCI4BIAVMYYb7Njq1m8pKgVvdjZR
X-Google-Smtp-Source: AA6agR7xg3NHRQmU66pt90G2MufMeMv1tstK4q50ChzkOHcHAlef8ePHsU6jNCod2/omZ6NcjwCNsg==
X-Received: by 2002:a05:6402:90e:b0:443:ec4b:2b03 with SMTP id
 g14-20020a056402090e00b00443ec4b2b03mr263966edz.71.1661191007276; 
 Mon, 22 Aug 2022 10:56:47 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 d9-20020a170906304900b0072f0a9a8e6dsm6462171ejd.194.2022.08.22.10.56.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 10:56:46 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id e20so13686589wri.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 10:56:45 -0700 (PDT)
X-Received: by 2002:a5d:6881:0:b0:225:28cb:332f with SMTP id
 h1-20020a5d6881000000b0022528cb332fmr11427575wru.405.1661191005432; Mon, 22
 Aug 2022 10:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220711075202.21775-1-johan+linaro@kernel.org>
 <YtpyeCHojFovBKxv@hovoldconsulting.com>
 <YwOGCPFTx0+MNfN2@hovoldconsulting.com>
 <CAD=FV=XRjpbeMnh_dtLh1hb-zfWOk6UJwqFBr+otk=sq9vjm3A@mail.gmail.com>
In-Reply-To: <CAD=FV=XRjpbeMnh_dtLh1hb-zfWOk6UJwqFBr+otk=sq9vjm3A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Aug 2022 10:56:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vzi-1XhGPpUE7=CDF6V36JkUVuOwX2+-r4UhHWOKO9Mg@mail.gmail.com>
Message-ID: <CAD=FV=Vzi-1XhGPpUE7=CDF6V36JkUVuOwX2+-r4UhHWOKO9Mg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: add AUO B133UAN02.1 panel entry
To: Johan Hovold <johan@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Aug 22, 2022 at 10:33 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Aug 22, 2022 at 6:35 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Fri, Jul 22, 2022 at 11:48:40AM +0200, Johan Hovold wrote:
> > > On Mon, Jul 11, 2022 at 09:52:02AM +0200, Johan Hovold wrote:
> > > > Add an eDP panel entry for AUO B133UAN02.1.
> > > >
> > > > Due to lack of documentation, use the delay_200_500_e50 timings like
> > > > some other AUO entries for now.
> > > >
> > > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > >
> > > Any comments to this one?
> > >
> > > It looks like it hasn't shown up in the dri-devel patchwork and just
> > > want to make sure it isn't lost.
> > >
> > > Rob Clark mentioned something about a spam filter on IRC.
> >
> > This one still hasn't been picked up.
> >
> > Is this something you can do, Doug? I noticed you applied a couple of
> > patches to this driver recently.
> >
> > Or who is really responsible for this driver?
>
> Officially it falls within this section of maintainers:
>
> DRM PANEL DRIVERS
> M:      Thierry Reding <thierry.reding@gmail.com>
> R:      Sam Ravnborg <sam@ravnborg.org>
> L:      dri-devel@lists.freedesktop.org
> S:      Maintained
> T:      git git://anongit.freedesktop.org/drm/drm-misc
> F:      Documentation/devicetree/bindings/display/panel/
> F:      drivers/gpu/drm/drm_panel.c
> F:      drivers/gpu/drm/panel/
> F:      include/drm/drm_panel.h
>
> ...and then you just have to know that if the "tree" is drm-misc that
> it falls under drm-misc rules. That means that anyone who is a
> drm-misc-next committer can commit it.
>
> I've been trying to keep an eye on panel-edp ever since I split it out
> from panel-simple, though. I'll post up a MAINTAINERS entry to try to
> make that more official.

Posted a patch to add myself in MAINTAINERS:

https://lore.kernel.org/r/20220822105340.1.I66a9a5577f9b0af66492ef13c47bc78ed85e5d6b@changeid

...though I had a brain-fail and didn't CC anyone on it. ;-)

-Doug

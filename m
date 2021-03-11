Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D0336959
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 02:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999966E3FC;
	Thu, 11 Mar 2021 01:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206176E3FC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 01:01:54 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id h3so1821302qvh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 17:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gz//qG4UKWaU4eBFBftxHoN1DTt9WFPAtbEDzRcy4ZI=;
 b=m20bJdO+CkdIH+TFxZdxXfjbq+tuRI61Mw/BzmynatBY61+Ak29sP5beKDkKUZNZwC
 kqV9Ko6EmZR9VIu2a2KuYW3TxCBTTp/lS1kewoCeMfxG2qqC0dvono4Boa6Mg9qJwxze
 6noxSfHWyh5vm+O3q+7qxcyxBT0nJMXwvqC8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gz//qG4UKWaU4eBFBftxHoN1DTt9WFPAtbEDzRcy4ZI=;
 b=I8gtoOlOPd+ooOoRxMf9ioraUmvZtNA0lnDAz3ymzkADKPlVohqonyDVqfcpp9JaQJ
 npNZVontV8bv7VLMpqVzNOD4kCkBP/OE+EwHgL5YWqTh2Jfqn7LlgFs2sLMIUJV4H0Ky
 TJA8c4dw+JusNRPL7lUMdLVg7wKUDACdZUCGoz+04XNSr5bCq3Gvxrw0NZfxI+JiY9aD
 AMrDLwwOAy3FZQwK4RPFM2pR5StaPZHfkc6QKcl9y4fcedvj65wFin2jGykvuwnJr830
 pIvh/q8fafktFYmBzFUpNMtbK1ltWO5aW6T4rDsN8XSA/BkRckeA1j1ssQVBFzgN4J42
 gh0w==
X-Gm-Message-State: AOAM533We717hGDIi6GqQ4ZFbkPXRShNeANXgBymw0Hg5ka5FL0VU960
 cbMBOJGl5Lu2Cx84WKFc1jlIpnHkgoVAoQ==
X-Google-Smtp-Source: ABdhPJway8YZu3C/8wkYdirr7+YsxGnSFG1bm8Y7Q6nd90tOE71+Bg+awOloCPW5m6EP8XgJ4G3bkQ==
X-Received: by 2002:a0c:fecd:: with SMTP id z13mr5440930qvs.43.1615424512824; 
 Wed, 10 Mar 2021 17:01:52 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177])
 by smtp.gmail.com with ESMTPSA id 7sm867005qkm.64.2021.03.10.17.01.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 17:01:50 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id x19so19972773ybe.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 17:01:50 -0800 (PST)
X-Received: by 2002:a25:aa43:: with SMTP id s61mr8713736ybi.32.1615424510011; 
 Wed, 10 Mar 2021 17:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20210115224420.1635017-1-dianders@chromium.org>
 <CACRpkdYUs2W3b_u8YrmYwq_kcUCf0DhZ-o2o6O2EmU5rdtv=BA@mail.gmail.com>
 <CAD=FV=WDVAj+OcVXaTJRUu8tvdDzySW0KOfiGqZHi5YvP42BTA@mail.gmail.com>
 <CACRpkda1Ast1cqNfVJ_u6zs8610DWSQGykPt4yBw+mFZFrUPSg@mail.gmail.com>
In-Reply-To: <CACRpkda1Ast1cqNfVJ_u6zs8610DWSQGykPt4yBw+mFZFrUPSg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Mar 2021 17:01:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vj-6Y0X667o5vH0EL7hXi6sU4ZWs_a41B6h0D1s05_Hw@mail.gmail.com>
Message-ID: <CAD=FV=Vj-6Y0X667o5vH0EL7hXi6sU4ZWs_a41B6h0D1s05_Hw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/panel-simple: Patches for N116BCA-EA1
To: Linus Walleij <linus.walleij@linaro.org>
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 10, 2021 at 4:57 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Mar 11, 2021 at 12:47 AM Doug Anderson <dianders@chromium.org> wrote:
>
> > I guess what I'd say in summary is:
> >
> > * If you object to the retries in simple panel, I still hope the rest
> > of the series can land.
> >
> > * If somehow this panel gets out into real users hands and we find
> > that the retries are necessary and people still don't want the retries
> > in simple panel, I can fork a special panel driver just for it then.
>
> I'm fine with the retries, if it is needed outside of the "simple" (hm)
> panel driver then we can certainly factor it out as a helper or
> library.
>
> I looked at the patches at lore.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> I see also Stephen has reviewed some patches.
>
> Tell me if you need me to also apply them to drm-misc.
> (I guess yes?)

Yes please. I was giving Sam time to do it but I haven't heard from
him for a while. Right before you responded I poked Thierry to see if
he was available but if you're willing/able to do it then I'm sure it
would save him the trouble.

If you'd like me to re-post the patches (CCing you) I can. Please let me know.

If you happen to feel in an applying mood one other patch to
simple-panel I think is OK to land is at:

https://lore.kernel.org/r/20210222081716.1.I1a45aece5d2ac6a2e73bbec50da2086e43e0862b@changeid

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC121387A89
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 15:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC4C6E1F3;
	Tue, 18 May 2021 13:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCC16E1F3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 13:58:31 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id m13so7433151qtk.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 06:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c0rcuf59hk8zzhGYb9mHFLDEmB+phP4Kth6slEOIZYA=;
 b=lFI0AHcModwrEa18qX2uKnk2Wac55m5AiPLM2cv6lnVwkVH8JDjqEIw0gazCaElftB
 cHNLRg0l98UfE8vp/8XiQGbD96CtVJc0fhLv9d7phtdY+1C1sgwhDT1cCrwNauVQRMVj
 zr3eFfPWbISXhR8fSSHBrFosPT42cHLgNrX+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c0rcuf59hk8zzhGYb9mHFLDEmB+phP4Kth6slEOIZYA=;
 b=OjSIwlxBNpIMT7QG7/ggG6tXTi89Q8UNgAeEAcNq6EsjoPhW75TEE0oMW/ygIqFNj6
 7a0nVRy9tfyyTyYIHV7V4c5jxiV4KdpKzawRhNVCYXeCB8zJjZfnIDmD1pkxzxvUBltc
 +6p+s7sYzU+dHBnPanmdngvWyxHfCbLRD8Xx8oLcJ7QxRBDWFHBtxo3RhbGaJxsuhkXM
 HDOy4w5iFUJCtpUR1d41CxU+Bnw8urWpXp3XnLZTrjVmAtUOcj2fFoggFUA0RoWwZO7X
 8oAdXCBv1OHx0Xu8m82T+TCuLe2VX3UuTZmfmlAZxfUMCB9QKKXfAXf5Auaf2OvqK4z5
 h+9Q==
X-Gm-Message-State: AOAM531GUOgHfpOR75TvbcLIOoAkIe89nJWI/myy0qua8M2ShNKUK0Le
 zBBFoQscWP7AOtqmplzRwv67Xq21H6ch/g==
X-Google-Smtp-Source: ABdhPJx5XZlAU5AuQ+TC8BZxhgF+GjhU2O+FMfEPR+qutF/CazUF8qj8hisjnfSBXRB4P67Yrlzgnw==
X-Received: by 2002:ac8:7f13:: with SMTP id f19mr4675855qtk.237.1621346310136; 
 Tue, 18 May 2021 06:58:30 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id e12sm13296960qtj.81.2021.05.18.06.58.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 06:58:29 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id e190so13358557ybb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 06:58:29 -0700 (PDT)
X-Received: by 2002:a25:aad4:: with SMTP id t78mr7268437ybi.343.1621346308916; 
 Tue, 18 May 2021 06:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.2.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
 <CAL_JsqLMs10Luj7fKkNVu-BUZhpqAGJMZyUxz76N3b9Xa7EByg@mail.gmail.com>
In-Reply-To: <CAL_JsqLMs10Luj7fKkNVu-BUZhpqAGJMZyUxz76N3b9Xa7EByg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 May 2021 06:58:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xsc1noo7ZBK4_+Cty6KO5vc7Ex7G7BCg38rRu3s=fvUg@mail.gmail.com>
Message-ID: <CAD=FV=Xsc1noo7ZBK4_+Cty6KO5vc7Ex7G7BCg38rRu3s=fvUg@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] dt-bindings: display: simple: List hpd
 properties in panel-simple
To: Rob Herring <robh+dt@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>,
 Steev Klimaszewski <steev@kali.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 18, 2021 at 5:42 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, May 17, 2021 at 3:09 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > These are described in panel-common.yaml but if I don't list them in
> > panel-simple then I get yells when running 'dt_binding_check' in a
> > future patch. List them along with other properties that seem to be
> > listed in panel-simple for similar reasons.
>
> If you have HPD, is it still a simple panel? I don't see this as an
> omission because the use of these properties for simple panels was
> never documented IIRC.

I would say so. It is currently supported by panel-simple in Linux. Of
course, you could make the argument that panel-simple is no longer
really "simple" because of things like this...

I guess I'd say this: I believe that the HPD properties eventually
belong in the generic "edp-panel" that I'm still planning to post (and
which will be based on this series). I justified that previously [1]
by talking about the fact that there's a single timing diagram that
(as far as I've been able to tell) is fairly universal in panel specs.
It's a complicated timing diagram showing some two dozen timings (and
includes HPD!), but if you support all the timings then you've
supported pretty much all panels. IMO the original intent of
"simple-panel" was to specify a panel that's just like all the other
panels w/ a few parameters.

NOTE: I'd also say that for nearly all eDP panels HPD is important,
but in many designs HPD is handled "magically" and not specified in
the device tree. This is because it goes to a dedicated location on
the eDP controller / bridge chip. I added the HPD GPIO support (and
no-hpd) to simple-panel because my bridge chip has a fairly useless
HPD line and we don't use it. Even though the fact that we need the
HPD specified like this is a function of our bridge chip, back in the
day I was told that the property belonged in the panel and so that's
where it lives.


> Not saying we can't add them, but justify it as an addition, not just
> fixing a warning.

Sure, I'll beef up the commit message.


> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I didn't spend tons of time digging to see if there was supposed to be
> > a better way of doing this. If there is, feel free to yell.
>
> That's the right way to do it unless you want to allow all common
> properties, then we'd use unevaluatedProperties instead of
> additionalProperties.

Ah, perfect. Thanks!

[1] https://lore.kernel.org/r/CAD=FV=VZYOMPwQZzWdhJGh5cjJWw_EcM-wQVEivZ-bdGXjPrEQ@mail.gmail.com/


-Doug

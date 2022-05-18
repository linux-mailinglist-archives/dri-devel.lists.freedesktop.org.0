Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C224D52BFD5
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 18:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C92310E352;
	Wed, 18 May 2022 16:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97AE10E041
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 16:54:26 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id k126so1473600wme.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 09:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d+efCMwKCzHZq8Cl4KmFkQrrYv15aDwHBzF5AWLwbrQ=;
 b=BTUPgo2TYfQstCyPN/R6x1aykj9j6m5rB8Vuha4hP1qaqIly6dQzMUsF9xE4NjgDS7
 n1rcSMUUFNNWE1/7MF/LWhO/fPaw0ag2EUoRupuVFOdwfYFc8wjnFSofmM1DTRFRAvwL
 JIbcmyY+aIxmF5RmnRIDA8Kjd1yUwg6n2ISpI4Pxqho8mdYUnYy3ZlFMFnEoXgSCIlQE
 VIFzy00TcWJim0W0rpiNuORehXcqJavFvbh/QJcgDtfj/sMyBqKXv6uhGgGzxk1FSIH5
 0wJZtcuhhb2VKr+9ChMK8ozkPzOEKKF6UsNxaZAsgmkp8X4S6lu3mg8eCmLylSoc/CrP
 5Lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d+efCMwKCzHZq8Cl4KmFkQrrYv15aDwHBzF5AWLwbrQ=;
 b=njYQls7c1KDK+IZmGm7dBA0Q6e3BQo7Jx9HISiwWA6DFaVK4D8Zw1Bje0WjRBSS9Qo
 iSE5ZBsLnFRZ7N+maUwkJKy+P/sYZwhw/cDY8NfxT4wnH2dV3dVKVThHVVXHQw2Qvr3x
 3clu5XTZIwDfB0r6gw3AAQZFYJwa5oZSp2hF0M2sm7+dsAxqQ4Y+ciztyNvyU8BBiEsa
 CAq4NcsAtU5UUEbjEU89odaAhptoXqqz2nwtEQzqd3nAZsARvKLXBsIDrhUnGt2+qA7k
 mTEWzkvsQQZatC+WKlqpU0SI1q/NYG+oQeEObyIS2U19ypBbskxao2ohK1ZlKritHRxq
 LLqw==
X-Gm-Message-State: AOAM530u+s7ZVsVf4kPuvWIH84RCq2Ip0hUIjkiboTmrUbbJ8UwOfyE5
 38xOV/w/oMAiq7yA6C8rlABvTJN9uO3OvjOeD/c=
X-Google-Smtp-Source: ABdhPJwsmW1zEelH5GRS1C+E3xvDp9JY6q7yKWyFAiKimoF0qGrsYKQ84uSTu7oWtrR95xweNlKokZFAlQfBrnxlTpM=
X-Received: by 2002:a05:600c:35cc:b0:394:7e9e:bd1f with SMTP id
 r12-20020a05600c35cc00b003947e9ebd1fmr779204wmq.95.1652892865360; Wed, 18 May
 2022 09:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220417181538.57fa1303@blackhole>
 <CA+E=qVeX2aU0hiDMxLXzVk-YiMsqKKFKpm=cc=72joMhZmNV1g@mail.gmail.com>
 <CA+E=qVdEtx8wVbcrMQYGB1ur1ykvNRp1L174mVSMkB0zeOPYNQ@mail.gmail.com>
 <20220428175759.13f75c21@blackhole.lan>
In-Reply-To: <20220428175759.13f75c21@blackhole.lan>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Wed, 18 May 2022 09:53:58 -0700
Message-ID: <CA+E=qVcNasK=q8o0g1teqK3+cD3aywy+1bgtTJC4VvaZvfZtGA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: fix anx6345 power up sequence
To: Torsten Duwe <duwe@lst.de>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, stable@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 28, 2022 at 8:58 AM Torsten Duwe <duwe@lst.de> wrote:
>
> On Mon, 18 Apr 2022 17:25:57 -0700
> Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> > On Sun, Apr 17, 2022 at 11:52 AM Vasily Khoruzhick
> > <anarsoul@gmail.com> wrote:
>
> > > The change looks good to me, but I'll need some time to actually
> > > test it. If you don't hear from me for longer than a week please
> > > ping me.
> >
> > Your change doesn't fix the issue for me. Running "xrandr --output
> > eDP-1 --off; xrandr --output eDP-1 --auto" in a loop triggers the
> > issue pretty quickly even with the patch.
>
> Nope, even that works fine here. Side question: how do you initially
> power on the eDP bridge? Could there be any leftovers from that
> mechanism? I use a hacked-up U-Boot with a procedure similar to the
> kernel driver as fixed by this change.
>
> But the main question is: does this patch in any way worsen the
> situation on the pinebook?

I don't think it worsens anything, but according to the datasheet the
change makes no sense. Could you try increasing T2 instead of changing
the power sequence?

>         Torsten

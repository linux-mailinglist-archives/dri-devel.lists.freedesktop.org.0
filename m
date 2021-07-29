Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4882C3DADE6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 22:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0986EE67;
	Thu, 29 Jul 2021 20:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4C66EE6B;
 Thu, 29 Jul 2021 20:49:09 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id k4so4542510wms.3;
 Thu, 29 Jul 2021 13:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w7rlS789IwgWOu8sIYtR7tqkgkaO1gIx+9/djlmIsjw=;
 b=hePKOPuIIlnAtoZEz8val+chOEf8rJ7kzDrFbr157HgnPoDVRtY059x6N91MtMpQiN
 i3MqE5tvyQ5TAyTg9vM6mw/qSOYzsd64vgehdXnhKJbddyoOBIKDmlSBN2ac4AFGM0md
 vfISX61P1x2bWXSzCmxafEDFt66XYhpjkINkU9Z455HUDmfwuko9p63/HAUp/bwgiHtV
 IMQPamLEriq+766cvyptqUAYmoC3x0HifCe/YVWKcSv4v3SetAx8o83afYhdy61wJOsS
 1FLHySZ7pOEur5JsLlXjylFwr/MNuqIHx2d0b4yoR8dExNw5gxakvCgPN0ldJK4BfIiF
 kTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w7rlS789IwgWOu8sIYtR7tqkgkaO1gIx+9/djlmIsjw=;
 b=PZH9Z5zHgg5izFdrvWq3kpBGCZ++JA4pbhctF7nW8JcwRFiTJdRxhHHYgL1spxRXQz
 mgqdeVqODJZnXvcKm9P6J4WKNHTV9D7UzlkumeBd/BQZs7cEK3eIffP++CqBHiDXkfW3
 ZJustHErxAtEZCG0I/gIGEOtxzWYGzIheOKcy42Ianga9YmQyn9lYy1tFfqFwa6JMOXI
 fAnNOXbBAikkxK4Mg054eZc0s5OwwvZ7LjC2H6KrnydC0oeKyVQLwkRDzvDsWZELVpKC
 XOCIUHPIXziXDa2xEuBZfG1cGgNbnMG3l+rVeJsVPucD7Ae90DnPtlNGwKWEzCxwitFo
 EgPw==
X-Gm-Message-State: AOAM531on77DxFFmryWv5C7CLYZDFIN9bPKnect1NUbJHetwXldLRi0J
 U/mPCFjdq/GAJyrB6vIB6C5SHzc5tKdocTrNeDY=
X-Google-Smtp-Source: ABdhPJwrrK8qfqv4dkeGpyNXWI9QqAVnY/HT978HGofFkhk6FkqxWZ2UrgZfiUdhYpi3+dyXWle5jXmbiZpkpyKssrA=
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr296283wma.164.1627591748230; 
 Thu, 29 Jul 2021 13:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210729183942.2839925-1-robdclark@gmail.com>
 <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
 <CAF6AEGs5dzA7kfO89Uqbh3XmorXoEa=fpW+unk5_oaihHm479Q@mail.gmail.com>
 <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
In-Reply-To: <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 29 Jul 2021 13:53:17 -0700
Message-ID: <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To: Caleb Connolly <caleb.connolly@linaro.org>
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
 freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 1:28 PM Caleb Connolly
<caleb.connolly@linaro.org> wrote:
>
>
>
> On 29/07/2021 21:24, Rob Clark wrote:
> > On Thu, Jul 29, 2021 at 1:06 PM Caleb Connolly
> > <caleb.connolly@linaro.org> wrote:
> >>
> >> Hi Rob,
> >>
> >> I've done some more testing! It looks like before that patch ("drm/msm: Devfreq tuning") the GPU would never get above
> >> the second frequency in the OPP table (342MHz) (at least, not in glxgears). With the patch applied it would more
> >> aggressively jump up to the max frequency which seems to be unstable at the default regulator voltages.
> >
> > *ohh*, yeah, ok, that would explain it
> >
> >> Hacking the pm8005 s1 regulator (which provides VDD_GFX) up to 0.988v (instead of the stock 0.516v) makes the GPU stable
> >> at the higher frequencies.
> >>
> >> Applying this patch reverts the behaviour, and the GPU never goes above 342MHz in glxgears, losing ~30% performance in
> >> glxgear.
> >>
> >> I think (?) that enabling CPR support would be the proper solution to this - that would ensure that the regulators run
> >> at the voltage the hardware needs to be stable.
> >>
> >> Is hacking the voltage higher (although ideally not quite that high) an acceptable short term solution until we have
> >> CPR? Or would it be safer to just not make use of the higher frequencies on a630 for now?
> >>
> >
> > tbh, I'm not sure about the regulator stuff and CPR.. Bjorn is already
> > on CC and I added sboyd, maybe one of them knows better.
> >
> > In the short term, removing the higher problematic OPPs from dts might
> > be a better option than this patch (which I'm dropping), since there
> > is nothing stopping other workloads from hitting higher OPPs.
> Oh yeah that sounds like a more sensible workaround than mine .
> >
> > I'm slightly curious why I didn't have problems at higher OPPs on my
> > c630 laptop (sdm850)
> Perhaps you won the sillicon lottery - iirc sdm850 is binned for higher clocks as is out of the factory.
>
> Would it be best to drop the OPPs for all devices? Or just those affected? I guess it's possible another c630 might
> crash where yours doesn't?

I've not heard any reports of similar issues from the handful of other
folks with c630's on #aarch64-laptops.. but I can't really say if that
is luck or not.

Maybe just remove it for affected devices?  But I'll defer to Bjorn.

BR,
-R

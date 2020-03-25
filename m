Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CB6192D5F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 16:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FFD6E160;
	Wed, 25 Mar 2020 15:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449D06E15D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 15:50:21 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id b5so1818591vsb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 08:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5R9OlcysTIjSd6LSQUVfdd7d9zM2FdO/Mwd40Pw5oqo=;
 b=XtpjmpZHorFljb0nMx6/72BT6LEyg6Yu3GZqe2zFozULuw0vZvc0DGxN1dv5nyYcCC
 hHWAbWGSOUvReB9nY4FED4Ar/y5wjn/ZL8FKAYhFCQofbGaikMQxNWYRkq+MvceY2mpy
 N4Sp0qbxAYASySnf+wDwpkd2kniFgXVKTcZFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5R9OlcysTIjSd6LSQUVfdd7d9zM2FdO/Mwd40Pw5oqo=;
 b=ZrCfSx0LJxtUvOd01PgyIKjHID8qlPBgQoGdZ0fxZnG6GeipoT3Q+s3iAruhlwux03
 3uagyEm/9efHMWjCxNaBWjYonNtsdEjy+RVkbJI13HTNMX47Nw5XWOTgUQJhIoah4L1y
 5SyUB589DSmPjFnBlay1ozjh3a1JiJ3fK/6XSEteZwcLbNpBOka70gqfmDViWM4o9++U
 uKFPMEyYjjfrruzCsXdCrWa8ss+BM5nQwsmzXeiYH3JU6iF/o76k45IA24XpPNB8A+ky
 TUAzmhTZCO9m06toECP5KJUOLJqKkuE/4L75qsecvNrQIrDrIlhcyURkgnNWpsF4aNQR
 dPoA==
X-Gm-Message-State: ANhLgQ3PnQZELo/f1xPkQuIQfBR40CpEtJaD/z37YbixNWnBdAQ+wdOE
 OoAf5kDtcMJ/kaTYlGLnaQs+ODC5nKk=
X-Google-Smtp-Source: ADFU+vtsESJ7q/Djc+88UC4BaK7pjSBBGgslmBVrN8p8JX9RVSRJJrYEqq0/5idedstgugKAWsVWog==
X-Received: by 2002:a67:770f:: with SMTP id s15mr3122953vsc.199.1585151419909; 
 Wed, 25 Mar 2020 08:50:19 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53])
 by smtp.gmail.com with ESMTPSA id j78sm10508287vsd.4.2020.03.25.08.50.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 08:50:18 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id a63so1777857vsa.8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 08:50:18 -0700 (PDT)
X-Received: by 2002:a67:694f:: with SMTP id e76mr2833828vsc.73.1585151417831; 
 Wed, 25 Mar 2020 08:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <1584944027-1730-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=VX+Lj=NeZnYxDv9gLYUiwUO6brwvDSL8dbs1MTF4ieuA@mail.gmail.com>
 <CAF6AEGs5saoU3FeO++S+YD=Js499HB2CjK8neYCXAZmCjgy2nQ@mail.gmail.com>
In-Reply-To: <CAF6AEGs5saoU3FeO++S+YD=Js499HB2CjK8neYCXAZmCjgy2nQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Mar 2020 08:50:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VxeCUEEFi9T0Jand3EWkaQTLnQkT3v5yjyjLi4yDeQ-w@mail.gmail.com>
Message-ID: <CAD=FV=VxeCUEEFi9T0Jand3EWkaQTLnQkT3v5yjyjLi4yDeQ-w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
To: Rob Clark <robdclark@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 25, 2020 at 8:40 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Mar 24, 2020 at 7:35 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Sun, Mar 22, 2020 at 11:14 PM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
> > >
> > > "The PM core always increments the runtime usage counter
> > > before calling the ->suspend() callback and decrements it
> > > after calling the ->resume() callback"
> > >
> > > DPU and DSI are managed as runtime devices. When
> > > suspend is triggered, PM core adds a refcount on all the
> > > devices and calls device suspend, since usage count is
> > > already incremented, runtime suspend was not getting called
> > > and it kept the clocks on which resulted in target not
> > > entering into XO shutdown.
> > >
> > > Add changes to manage runtime devices during pm sleep.
> > >
> > > Changes in v1:
> > >  - Remove unnecessary checks in the function
> > >      _dpu_kms_disable_dpu (Rob Clark).
> >
> > I'm wondering what happened with my feedback on v1, AKA:
> >
> > https://lore.kernel.org/r/CAD=FV=VxzEV40g+ieuEN+7o=34+wM8MHO8o7T5zA1Yosx7SVWg@mail.gmail.com
> >
> > Maybe you didn't see it?  ...or if you or Rob think I'm way off base
> > (always possible) then please tell me so.
> >
>
> At least w/ the current patch, disable_dpu should not be called for
> screen-off (although I'd hope if all the screens are off the device
> would suspend).

OK, that's good.

> But I won't claim to be a pm expert.. so not really
> sure if this is the best approach or not.  I don't think our
> arrangement of sub-devices under a parent is completely abnormal, so
> it does feel like there should be a simpler solution..

I think the other arguments about asymmetry are still valid and I've
fixed bugs around this type of thing in the past.  For instance, see
commit f7ccbed656f7 ("drm/rockchip: Suspend DP late").


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

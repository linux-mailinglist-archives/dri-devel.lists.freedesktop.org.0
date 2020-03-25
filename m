Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418B6192CF4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 16:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0094E6E87D;
	Wed, 25 Mar 2020 15:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858486E87D;
 Wed, 25 Mar 2020 15:40:18 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id bd14so2891617edb.10;
 Wed, 25 Mar 2020 08:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vVQBr/UYJMdab8jRg2zR24QImGiBviKI+Lqx/RV8Icg=;
 b=iM7fQags/yNx8RR2ehfaaLuUBoI2eC3ngDb/4LT7lEsOSVAPorZvL9vvcfzaiS579r
 pgFp1e+/ArquN9GvkHX9wxU90+sCMiWWybFbWUe00yHiHTdHFsutf3sq5PHLUx0JEJWK
 ck4Q8LpTpZQ3xd2pJEdZYJ/scZaUMf0DXBjEpWdWahv71/3HKMfYwqyZE9x1CylE0FtA
 lYiAm5qYpDgvG+qJMuPHYWCmkNOZJTw3UpvcMiNXXj3LZwXsTF+Kbf9uaZhGHfi6cbNX
 P9kq1JZiizjkbHXEhwwS0MQPu0HMt7xJ4FiUjJ9oPLUEPDLaCtnfOmZAgg1olxUPPlug
 ieXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vVQBr/UYJMdab8jRg2zR24QImGiBviKI+Lqx/RV8Icg=;
 b=sGTH4EAQWx0kjfqPVHljqD5qbn9Lk/VT/0VkXj8xFdlKU1pv8PPr+CqDPwHCsRnGnm
 pCpsL7xFrymeD3VdPxYDNCAndeGNQXm0yTnyuMFKMQFL9KtLMpwQi54aYvEYHd/ILP1X
 47VR3LZWwkLJEzTm/PriY0F84RBSidYwXGURxE9712hv8Kmu0kWq2ZugHZx2SPPzMo2j
 xkE4OoVXdmZUP3GoRnpL7T8bB1N9Jx+PrmSvGkeZ4zEjlq7Ab9VsHOXoK07/aOkKubP7
 ihWEvdHpfbCeM4eCRFPc2omEH+68NLa6VMGBrsR44ixq8m8XcCwaqTEugZsmCnfue00I
 cGHg==
X-Gm-Message-State: ANhLgQ270ERIvbHsmKX6Pcarx7UkDXnmtF8PXHicL87U2SUv38Pw2egP
 90NmCZtTAQYH4Ye6Nu6n6K6+phZXIvNvGJu1bexZaei484M=
X-Google-Smtp-Source: ADFU+vvti2A9QZho9Id7sZ6hCv38ZZx7DwFDLQbnZuOsJZY6bJU+aLt9MOUecd3kZZiKiatZ3p4eVZ3oEbpz1o8iDmo=
X-Received: by 2002:a50:d712:: with SMTP id t18mr3467606edi.151.1585150817053; 
 Wed, 25 Mar 2020 08:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <1584944027-1730-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=VX+Lj=NeZnYxDv9gLYUiwUO6brwvDSL8dbs1MTF4ieuA@mail.gmail.com>
In-Reply-To: <CAD=FV=VX+Lj=NeZnYxDv9gLYUiwUO6brwvDSL8dbs1MTF4ieuA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 25 Mar 2020 08:40:14 -0700
Message-ID: <CAF6AEGs5saoU3FeO++S+YD=Js499HB2CjK8neYCXAZmCjgy2nQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
To: Doug Anderson <dianders@chromium.org>
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

On Tue, Mar 24, 2020 at 7:35 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sun, Mar 22, 2020 at 11:14 PM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
> >
> > "The PM core always increments the runtime usage counter
> > before calling the ->suspend() callback and decrements it
> > after calling the ->resume() callback"
> >
> > DPU and DSI are managed as runtime devices. When
> > suspend is triggered, PM core adds a refcount on all the
> > devices and calls device suspend, since usage count is
> > already incremented, runtime suspend was not getting called
> > and it kept the clocks on which resulted in target not
> > entering into XO shutdown.
> >
> > Add changes to manage runtime devices during pm sleep.
> >
> > Changes in v1:
> >  - Remove unnecessary checks in the function
> >      _dpu_kms_disable_dpu (Rob Clark).
>
> I'm wondering what happened with my feedback on v1, AKA:
>
> https://lore.kernel.org/r/CAD=FV=VxzEV40g+ieuEN+7o=34+wM8MHO8o7T5zA1Yosx7SVWg@mail.gmail.com
>
> Maybe you didn't see it?  ...or if you or Rob think I'm way off base
> (always possible) then please tell me so.
>

At least w/ the current patch, disable_dpu should not be called for
screen-off (although I'd hope if all the screens are off the device
would suspend).  But I won't claim to be a pm expert.. so not really
sure if this is the best approach or not.  I don't think our
arrangement of sub-devices under a parent is completely abnormal, so
it does feel like there should be a simpler solution..

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

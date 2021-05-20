Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F44389AFF
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 03:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7506E7D0;
	Thu, 20 May 2021 01:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785376E5D5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 01:41:28 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id w127so11099923oig.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 18:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=iYMoi9RfdIWAgrdRsxo09y149SU9Ox48bYShc9UJAkk=;
 b=MN+ncWnQj5oJcKQh5vuPCIM41BJLa6s8lmFL8zoK2g+NHcZdFR9PgL21BglNUh2z4n
 nCdAoiPJU62w6XQ+ItF7ciK0mX48MZ669tc+ocCLqP2rD8dMbE2JuELGbvmIayYXYNOG
 WH9Tbh2D25aIZVMI9u7RYzMmmgOXo4VlM2ImA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=iYMoi9RfdIWAgrdRsxo09y149SU9Ox48bYShc9UJAkk=;
 b=RMSkHkLRZum+JWs3HO5HuKp2PuYc9iRrsHFGXnRR+GOHimVsUHPKWjaCBkaRcS54hl
 iLTKd8dOndaRj+zcTjnzdCmqAPsXYSVl+cWLyEuL0nNE1z9varpuge7oaX4tM6u8rwxI
 6KSa+T6nUCMVsfUlYUjq/yywvQez14DYZQmWoBCjFn8OOEvYj9QO/GoMFW8nMD1LtWl5
 pzaLltz5UaWQxu+lny6baZsZNV1OQEjqPBVWIwR5HzrpwpWrWwHsZfROnxP9zb6+aBVi
 x39klCUssQlS8wK3HF7EAcIGsHER5aEaSrrzsf92rYyDQgwlHkyJbSmHkff5c16TwSDK
 zWQQ==
X-Gm-Message-State: AOAM531uFT9mYiC3Evlz2s7dW4GBUc/b03QOtJv8CvLPbWEGE/Dt4r9W
 gBb+FHPtx3RNGDtzbNmHJ6Ut+IxJNCfcuBGcMHOCXA==
X-Google-Smtp-Source: ABdhPJw+XAwShhYEdBQWbCN36WfVRcWEA+e8iITrKYVuyjhU4KfB0Q0SdwsVvIj+ukXQ2RGlbZqeN+uJh1kegL9mZus=
X-Received: by 2002:aca:654d:: with SMTP id j13mr1688671oiw.125.1621474887843; 
 Wed, 19 May 2021 18:41:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 May 2021 21:41:27 -0400
MIME-Version: 1.0
In-Reply-To: <CAGETcx-jK3pBNRYevPmRhw1TALHNjtM5dSxCdEuB+2sBH32rtQ@mail.gmail.com>
References: <20210520002519.3538432-1-swboyd@chromium.org>
 <CAGETcx-jK3pBNRYevPmRhw1TALHNjtM5dSxCdEuB+2sBH32rtQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 19 May 2021 21:41:27 -0400
Message-ID: <CAE-0n522QRUfQOSGmYS59AbFdx2kmtz-CNszdWfLnPCbMkCryA@mail.gmail.com>
Subject: Re: [PATCH 0/7] component: Make into an aggregate bus
To: Saravana Kannan <saravanak@google.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Saravana Kannan (2021-05-19 18:27:50)
> On Wed, May 19, 2021 at 5:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > This series is from discussion we had on reordering the device lists for
> > drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
> > the aggregate device onto and then we probe the device once all the
> > components are probed and call component_add(). The probe/remove hooks
> > are where the bind/unbind calls go, and then a shutdown hook is added
> > that can be used to shutdown the drm display pipeline at the right time.
> >
> > This works for me on my sc7180 board, but I'm currently struggling with
> > the last patch where we migrate the msm driver. It runs into a runtime
> > PM problem where the parent device isn't runtime PM enabled yet. I'm
> > still trying to figure out a clean solution there. Moving runtime PM
> > around breaks boot and I think that's because the power domain is off.
> >
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > Cc: Saravana Kannan <saravanak@google.com>
> >
> > [1] https://lore.kernel.org/r/20210508074118.1621729-1-swboyd@chromium.org
> >
>
> I skimmed through the series and in general the idea is good, but I'm
> not sure why each component user needs to be converted/"modern" before
> it can make use of the benefits of this series. Why not just have
> wrapper functions around the component ops that the new aggregate bus
> driver can just call? That'll give all the existing component users
> the new ability to use the new ops without having to have two
> versions.

The existing users can only have one or the other. Either use the ops
structure or use the struct aggregate_driver. What benefits of this
series are they not gaining?

> That'll also allow us to do other improvements (I have some
> in mind) that'll apply to all the component users instead of only the
> converted ones.

What do you have in mind? I didn't want to convert drivers over to the
new way of doing things without making them consciously change their
code. Otherwise I worry it will break things in random, subtle ways. The
last patch, as I mentioned above in the cover, causes warnings because
the display driver is enabling runtime PM in an odd spot as part of the
bind callback of the aggregate/master. That should move out of there and
into the msm_pdev driver that registers the aggregate from what I can
tell.

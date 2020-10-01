Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FCB27FE4F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 13:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3AC6E1CD;
	Thu,  1 Oct 2020 11:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6186E1CD
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 11:25:16 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id a2so4949973otr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 04:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=up+YfAa4hUEz2jauGbOGQupzqkFEIqP5miPRNKb6g88=;
 b=AVTt1tHvqiwpCn8ORfJ3ByfuaERKEB+VTJJVMRxSler0/mRZ/81hC2shW3JAG3KsP8
 E8u9Nzr6mVudbSqiKqFVv7BGJL7rKVBkWkNYVynnJMbzVpx0UczuVqS8yRzajY0HbTwA
 CAxQvocmUjBq8KWPNbJzrGa+aEnqrb+128m6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=up+YfAa4hUEz2jauGbOGQupzqkFEIqP5miPRNKb6g88=;
 b=q3uepB2YONhv8biFV9cWF6fUGRo1bn78kqpvnGLJ5F51hUzcj3071dkJd3Z8hrxWnm
 Rdoasb4JtXM6tefgHxhjcOL8TW/kPp3rKMmtxPtkIoxnWOmFpQXyXkSgBcQ68AirKQaL
 b2h43uHLCiwKBjHKKP0BleTEM/T985hZksYyMsuwUfP7ss4EYmN7GBhqFsPIVOR8GNXx
 lA1yUFngyutXcMJmsNlP1gSr0VMLNe9jWMu6tHknYqxDNlinVGTPiWe6d1eYmvh3JJWL
 9DpK4sgfm6RtuzdOCuHjUbufBV/Q67qZQvuj2jpaD5bZdtQVN+QcRGRhiQtCfkAuyXNr
 XYwg==
X-Gm-Message-State: AOAM5326wFrQjekjX+KgmXDFaJXENlvcTS3/bE+c53LTNzWUAv99jidM
 Vr+PALpGSiC9P4SZzAwrOia7gOtO228vN+O3WVzLLQ==
X-Google-Smtp-Source: ABdhPJxPbL7LHeQL+k6gIy5NueiQXRMgOWTDIjglH6aXw9lY8zq0IMYSGJyw2kRbFhVw5K0r/VLucvhZmUE5VMcAKsM=
X-Received: by 2002:a9d:4b99:: with SMTP id k25mr4758628otf.281.1601551515453; 
 Thu, 01 Oct 2020 04:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200921131021.91604-1-miaoqinglang@huawei.com>
 <8ae8a758-23ee-a413-5b25-b7beb8f4e254@arm.com>
In-Reply-To: <8ae8a758-23ee-a413-5b25-b7beb8f4e254@arm.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 1 Oct 2020 13:25:03 +0200
Message-ID: <CAKMK7uHQe3PBnNinaGn37s+Cgko1taKcCT3=Yy1uw63pRurOhw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/panfrost: simplify the return expression of
 panfrost_devfreq_target()
To: Steven Price <steven.price@arm.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 1, 2020 at 12:58 PM Steven Price <steven.price@arm.com> wrote:
>
> On 21/09/2020 14:10, Qinglang Miao wrote:
> > Simplify the return expression.
> >
> > Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
>
> Reviewed-by: Steven Price <steven.price@arm.com>

As committer/maintainer for this please indicate whether you'll merge
this or not, with just an r-b patches are in an awkward limbo state.
Since Qinglang isn't committer you probably want to merge their
patches, for otherwise they get lost.
-Daniel
>
> > ---
> >   drivers/gpu/drm/panfrost/panfrost_devfreq.c | 7 +------
> >   1 file changed, 1 insertion(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > index 8ab025d00..913eaa6d0 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > @@ -29,18 +29,13 @@ static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
> >                                  u32 flags)
> >   {
> >       struct dev_pm_opp *opp;
> > -     int err;
> >
> >       opp = devfreq_recommended_opp(dev, freq, flags);
> >       if (IS_ERR(opp))
> >               return PTR_ERR(opp);
> >       dev_pm_opp_put(opp);
> >
> > -     err = dev_pm_opp_set_rate(dev, *freq);
> > -     if (err)
> > -             return err;
> > -
> > -     return 0;
> > +     return dev_pm_opp_set_rate(dev, *freq);
> >   }
> >
> >   static void panfrost_devfreq_reset(struct panfrost_devfreq *pfdevfreq)
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

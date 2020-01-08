Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88394134F8C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 23:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28476E343;
	Wed,  8 Jan 2020 22:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF406E343
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 22:44:32 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id t129so4233256qke.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 14:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vo+6C1EuzsBLHBwL8bvb08t4OkksMVFETIJoYKx5DTo=;
 b=Wnszb6on0SMp/3XOzNETDRgBA1SdEWJobacWeeLrc4lDfi7vhmtnOldGqbPPBAZbfG
 7wp6u/0G5WV3uSIpGENHwwILKLe4qZ56kKoDHOHcvgCpvAf4N2HVstmon3dD9/r6c9sv
 qlfEDsZVhNNIdGprWFOmlxpJcR4ut9Km4zNUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vo+6C1EuzsBLHBwL8bvb08t4OkksMVFETIJoYKx5DTo=;
 b=H6/N/lZClRixyefHG9aAIVWnVi0Z7g5PVxmg2AR0e4nZ4ElDAona7epIJblb2d0a/i
 EExLwQy3nQMOM+/L2ljEqDies1/pREUx6Caqp5e5z9CrP785jJLPWKSwh0Mvj3aRxQDC
 ImFpuw3zeOxaiIy/ikHxu6pBkBT5Xd9696lSWJeN6H8OcexzN73GTRYc6lUMj2e01qng
 bae+GqN9VUqk83lyCbJEBTZQh0h5skrN9lzOQ3WMKyI7+25ibe7UNHuRkBerowX17q6Y
 6PbOK0ofm+3HyXBUCdRGDY//cQCzs/W3na+v8iOPkVfxnH1tBW3yORkuTY4swb2ucygQ
 imuw==
X-Gm-Message-State: APjAAAX0qYKoGeLg/1T3GO7ZrytsA7iFk13AO4wh5O9gu77IDPdJA3mL
 gl6AlAhAgJuw7hPZw74NFMryMmwcSDkIB3zrcaOVvw==
X-Google-Smtp-Source: APXvYqxnt7gN4ytrxX2jjjTbvXbu6erGQ6HNZhqe3Pr82LWm38qxIiDN1rgAR/6KRKR7dwyCXJ7fm7aQppC5xk7pbCM=
X-Received: by 2002:ae9:e103:: with SMTP id g3mr6826468qkm.353.1578523471432; 
 Wed, 08 Jan 2020 14:44:31 -0800 (PST)
MIME-Version: 1.0
References: <20200108052337.65916-1-drinkcat@chromium.org>
 <20200108052337.65916-8-drinkcat@chromium.org>
 <CAL_Jsq+jWtrV8-iDzqsefRxr_21jzf7AdSLap8k4hstqK3MBvQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+jWtrV8-iDzqsefRxr_21jzf7AdSLap8k4hstqK3MBvQ@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 9 Jan 2020 06:44:20 +0800
Message-ID: <CANMq1KCTdtKDB4bmdAFf+voTvCECedAKTJHue4H1quhW6SXbxQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7,
 RFC]: drm/panfrost: devfreq: Add support for 2 regulators
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 9, 2020 at 4:09 AM Rob Herring <robh+dt@kernel.org> wrote:
> [snip]
> >  void panfrost_devfreq_resume(struct panfrost_device *pfdev)
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> > index 92d471676fc7823..581da3fe5df8b17 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> > +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> > @@ -91,10 +91,12 @@ struct panfrost_device {
> >         struct {
> >                 struct devfreq *devfreq;
> >                 struct thermal_cooling_device *cooling;
> > +               struct opp_table *dev_opp_table;
> >                 ktime_t busy_time;
> >                 ktime_t idle_time;
> >                 ktime_t time_last_update;
> >                 atomic_t busy_count;
> > +               struct panfrost_devfreq_slot slot[NUM_JOB_SLOTS];
>
> ?? Left over from some rebase?

Oh, yes, sorry.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

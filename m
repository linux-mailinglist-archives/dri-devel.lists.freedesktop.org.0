Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F624E1E3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 22:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66E46EBB5;
	Fri, 21 Aug 2020 20:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD1C6EBB5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 20:12:19 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id v13so2546061oiv.13
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 13:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/qU809CtNTXkjajhW2wh13M18DwibA6ul0FCeVgUG8A=;
 b=uNZJcPBuLQI6ASFZUw8QkZ9k3ruDXi+NR0Kt7euvSfH4mOkI5/9P8eZwp0n3pWGIA2
 BJ4j8yy0xBhrOtnOZFZLMc7a8rXqPwypZyipI8fq6RvAnmAgwpFzG81/j/WOGXKiGiPo
 8VAAvITRLMHZv00OrfzzKV4vVj3SWkldqmfvMNhMXywEZI2IPy/6TmMblhy2pRgEfzgz
 yFCi2m/o0WvrnQqp8VkEwh/4O4HMWoET8SG+sn0fYfLw24j101w3Sjs9gBVrCR3pZ9Dm
 STC2SEsoODBbxumcSiZ4huToeiteGnz0EWJmsz9eJevZQlzg1H+uKLuUeJotQ86iS3yf
 yOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/qU809CtNTXkjajhW2wh13M18DwibA6ul0FCeVgUG8A=;
 b=dtmZBaDCxEfU3X05CwMog9Qt0P5woAEbGFBdc/RLKgjmGxQXIIRi1xxVTtgElamJnu
 UHImBradZzFgFk2fCxzp5/LGYxSmSiojUyOY9TapN68KOi4KN1g2/3RiygrZCB8PZxch
 riHWZ4EY+WC1/wssrAAA2jwornjIUtYpmIk60j48umstVhOBm4rgwuzXKWvnUGqwWDVl
 65sx7dLzC5ZcuxUVbhgm8b2rG9+ySh5MbvLD6AfqMfxLch2XiBkuYT+Mthe8Fb2HYwnG
 8/nJCtG/UBi+lGZ2yzBmig4ULNk7O3ra0tHo8RaoMC0G+pX7hGAcWRuTbDwjJI2tWjsF
 VCSg==
X-Gm-Message-State: AOAM531TSiU0qPEUY2wwIMhDOQjSrUbBDpf3v1OiHV/u89uxtfUjU5Vw
 hOjCzKYHuefEOeQi/pD/QMINql6rsp31hEEGBYsHrA==
X-Google-Smtp-Source: ABdhPJxeOwH2KU0W0WI97zQrIKn2g+YzpfFe6sDTwlBDqKWlmQ7wcHROHsB8ml5rNCQ/tdEe6QqSYj9jep2a15MAg8c=
X-Received: by 2002:aca:1c15:: with SMTP id c21mr2982966oic.10.1598040738933; 
 Fri, 21 Aug 2020 13:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
 <9fa944021373ec5b82c2c1e118c15d9effe7f964.1597833138.git.mchehab+huawei@kernel.org>
 <CALAqxLV-LaMPKD-ddRM1EehFh+JZfh1eUsKobXgVG9R+q0EF2w@mail.gmail.com>
 <20200820102332.7223d38d@coco.lan>
In-Reply-To: <20200820102332.7223d38d@coco.lan>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 21 Aug 2020 13:12:06 -0700
Message-ID: <CALAqxLV1vskvo7MFsKdCiS_XcTy76B5hu2ZfWJbY6p2fVpYCVA@mail.gmail.com>
Subject: Re: [PATCH 25/49] staging: hikey9xx/gpu: do some code cleanups
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
Cc: driverdevel <devel@driverdev.osuosl.org>,
 Liwei Cai <cailiwei@hisilicon.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Chen Feng <puck.chen@hisilicon.com>,
 mauro.chehab@huawei.com, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 20, 2020 at 1:23 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> (added c/c Rob Herring)
>
> Em Wed, 19 Aug 2020 18:53:06 -0700
> John Stultz <john.stultz@linaro.org> escreveu:
>
> > On Wed, Aug 19, 2020 at 4:46 AM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > > @@ -376,7 +355,7 @@ static int kirin_drm_platform_resume(struct platform_device *pdev)
> > >  }
> > >
> > >  static const struct of_device_id kirin_drm_dt_ids[] = {
> > > -       { .compatible = "hisilicon,hi3660-dpe",
> > > +       { .compatible = "hisilicon,kirin960-dpe",
> >
> >
> > One issue, elsewhere in your patch stack you still refer to the
> > hisilicon,hi3660-dpe compatible string. This should probably be
> > consistent one way or the other.
>
> Agreed with regards to consistency.
>
> It sounds to me that calling those as Kirin 9xx (and the previous one
> as Kirin 620) is better than using the part number.
>
> Here, googling for "Kirin 970" gave about 6.9 million hits, while "Hi3670"
> gave only 75,5K hits.
>
> Kirin 620 has similar results: 6.85 million hits, against 61,9 hits
> for "Hi3620".

Hi6620 is kirin 620 I believe.

> With "Kirin 960", the numbers are a lot higher: had 21,4 million hits,
> against 423K hits for "Hi3660".
>
> So, my preference is to use "Kirin 620, 960 and 970" for future changes.

I think traditionally the DTS is developed with the hardware
documentation sometimes before the SoC is announced, so they tend to
stick with whatever those documents call it, rather than (later more
google-able) marketing names.

That said, I don't have a preference, as long as it's consistent, and
we don't change compatible strings that are already upstream.

> I would love to make this consistent among the Kernel. However,
> I'm not sure if changing "compatible" would be acceptable
> by DT maintainers.
>

Existing bindings are already ABI. So we can't change those. New
bindings can be set to what makes the most sense.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

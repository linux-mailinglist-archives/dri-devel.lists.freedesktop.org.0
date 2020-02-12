Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F051159EF7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 03:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D9C6E546;
	Wed, 12 Feb 2020 02:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C616E546
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 02:08:38 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id p7so574129qkh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 18:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aO1UKgSaz5CktVcc4Y8RcygWfgexx86iGtyjlHVU3kc=;
 b=Ra4CJUVRnDxwoRk1QHlRr35m77IrmNP+H+pxr+bZOB0DUqvHsCjOXSRfGg8rh5YTc/
 bgIS4sXVXPWDN0WSvdb5FMIFOhtL88yKaI01xKq0D1/4ULI+kJq4x8UcjsWQePCqsrs8
 6+XGOuD6jIhd4dxdCqcpHLWlftWwwtVIkMYXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aO1UKgSaz5CktVcc4Y8RcygWfgexx86iGtyjlHVU3kc=;
 b=J4Z4L8tjHeZkiD6PW+hNYSRgbUu2bu8q5NYgm/LbEoSoP0pzZyZqqki0YIOrAWsFlg
 0wI2CZa4+2e/0QEwmQqS6bZsqSbCqGSzghezu5ao0r9CQX42p1Np+Gp1fxTyIhezPE9L
 BN6kdrI+J7mJpBCtEAhjEsSeaJaaBxahtzHDaLr3y9ScegL3Q/g9Db8fTz+MBfzFVRkF
 L3VGRvEa3g5THscbSWGbsgJkAGE6JiEY6+WkxCmDuHrUaT22yqkgXRFvIq+mjhOjtQ1p
 s8F8nhSBvzBObfUwv3BPOTEVECai9iiCjCnXm3cf8CD/h5RfWV3hPTYrHQsxYgjSbKy7
 JmdQ==
X-Gm-Message-State: APjAAAUrU9JJUZ4+QwUZJmaXsuqes2q3FNABwudWkvBoSSxvkfBBP6oK
 NdmuYTsNWUSX5PkaQJV69sw5BH3ylHaJtLYpj34caA==
X-Google-Smtp-Source: APXvYqwbzvTmz/rK3xPb+7Zh0OWCEANWSI8B0x6aGBv3LzyJNw2pam02x3/hzeuy9xsPHf377lq3HNhZe8a4gYL9G7M=
X-Received: by 2002:a05:620a:6d7:: with SMTP id
 23mr8405839qky.299.1581473317421; 
 Tue, 11 Feb 2020 18:08:37 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-6-drinkcat@chromium.org>
 <CAL_JsqLshgzmhGGa+XibosSgk6R_9DQkDf12s793UZcvbQbxKw@mail.gmail.com>
 <CAGETcx_3-ZoVAf+Uf0Yo86pUU1nL4S4-jrS0eZi50yvhCO985g@mail.gmail.com>
In-Reply-To: <CAGETcx_3-ZoVAf+Uf0Yo86pUU1nL4S4-jrS0eZi50yvhCO985g@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 12 Feb 2020 10:08:26 +0800
Message-ID: <CANMq1KC2LEQ2iQzGDVAi+-x4Uy1LLB8JU-grTBVTL-iRej-t4A@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/panfrost: Add support for multiple power
 domains
To: Saravana Kannan <saravanak@google.com>
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 4:09 AM Saravana Kannan <saravanak@google.com> wrote:
>
> On Tue, Feb 11, 2020 at 11:44 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > +Saravana
> >
> > On Thu, Feb 6, 2020 at 11:27 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > >
> > > When there is a single power domain per device, the core will
> > > ensure the power domain is switched on (so it is technically
> > > equivalent to having not power domain specified at all).
> > >
> > > However, when there are multiple domains, as in MT8183 Bifrost
> > > GPU, we need to handle them in driver code.
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > >
> > > ---
> > > [snip]
> > > +               pfdev->pm_domain_links[i] = device_link_add(pfdev->dev,
> > > +                               pfdev->pm_domain_devs[i], DL_FLAG_PM_RUNTIME |
> > > +                               DL_FLAG_STATELESS | DL_FLAG_RPM_ACTIVE);
> >
> > We're in the process of adding device links based on DT properties.
> > Shouldn't we add power domains to that? See drivers/of/property.c for
> > what's handled.
>
> Rob,
>
> drivers/of/property.c doesn't enable the RPM_ACTIVE AND PM_RUNTIME
> flags. Wanted to start off conservative. But adding command line ops
> to change the default flags shouldn't be difficult. But before I do
> that, I want to change of_devlink to
> fw_devlink=<disabled|permissive|enabled>. May be I can extend that to
> "disabled, permissive, suspend, runtime".
>
> Nicholas,
>
> And the adding and removing of device links for power domains will be
> a 2 line change. I've been meaning to add a few more bindings like
> hwspinlocks and pinctrl. I can roll power domains support into that if
> you want.

Adding power domains makes sense to me, as there are a bunch of other
users (git grep dev_pm_domain_attach_by_name).

This seems to be a bit orthogonal to this patch though. If your
solution lands before this (and not something that is behind a command
line option), then I'm happy to make use of it. Either way, happy to
test things.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

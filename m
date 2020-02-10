Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB39B157151
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631936EB83;
	Mon, 10 Feb 2020 08:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44521892CC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 07:51:02 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id r18so3497897vso.5
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2020 23:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u3O+szgfwEJKuo4yzEkWiTVNHGumVBlqNQZE9NfjV7I=;
 b=QsC4PDi5ZlYbAjfw6pBUa0KPphhE/VVoGj6kVK1MAL7QZqo9wjmEBLb9Ikbb7Fp770
 o5u/R5ApawhiT5Waee9rnPrac69HShLMufZLupjUjI/CMI3snfnPnH5LdDWGPL7q39dr
 Evp1CxZoX8gCVNOonqGfUiXeiuwNtbZ+WegCEVukUffQd+2gilW7icSVWUk6sIYv749b
 slMXTUuMoGaFUwlQwE/ldzraKsne3DiELel3X/Jp70Dz80496OwgjZdM776TADILQLuO
 yAjl54QHAMbG0F+Y6cIXjrS11+kCEVl5NN47dW7kpuL4QC9qVts5HHxcSN5tLZgx3jY5
 Purg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u3O+szgfwEJKuo4yzEkWiTVNHGumVBlqNQZE9NfjV7I=;
 b=HPsHDCxvPt9rRzJPvi2g0JtVTRJboW1vkLKvBR4o3hMudkDOFNwCu4tMkGiVRvYL4s
 FVFieBYgwVln72hrIotcueovS3JRzLdZVIbSfzUji6M+lKwVUxQPdsqDWt4b3dW0vpzc
 qlF99T23CgI7DWFNUXtf/N5v7mViRxzTAiaC9r+bsLGjg9U3FS3SAKJI2Wt/uNQD4uA+
 AT/Ylrs0+MEaoj4sgV39sAepIEQhLP13Su9griBvB9Qlwbqfx4m0ziXICkDLLxGDSe1E
 z1eyl6L3xQFCOsR9fHiHjbLwIOShEyuqOa5aIAobM9NfA9sxRyv6bINCJOzkkI60weWB
 2iSw==
X-Gm-Message-State: APjAAAXXO0tx5zQwM1Gjjj9r+9fmQ1RHeFvHT9ncawnpUCMNzGyw8UtX
 o9sgdYVSezMylpi56noCFRUGVr3LqNuqiSGNR07ugg==
X-Google-Smtp-Source: APXvYqypbI21Yfdn+EA6ub6ed50JBoiEO60Ni/AfECIKY1ZvJ0o8EXmbyp6DUzxmNBzjRT7iyDPYhJySfgC8H0ANL9s=
X-Received: by 2002:a67:ee02:: with SMTP id f2mr5601456vsp.165.1581321061313; 
 Sun, 09 Feb 2020 23:51:01 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-6-drinkcat@chromium.org>
 <CAPDyKFoz0gUkoofWkd6dFuOkRWqeeCDrv84UHyYYowAAgTiitw@mail.gmail.com>
 <CANMq1KA+3O+G+_r=xY98eK-in5i3HWg+4B4-ONk-6qWS3a9=0g@mail.gmail.com>
In-Reply-To: <CANMq1KA+3O+G+_r=xY98eK-in5i3HWg+4B4-ONk-6qWS3a9=0g@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 10 Feb 2020 08:50:25 +0100
Message-ID: <CAPDyKFrq5KQ7CHnMSCv7GqzpQyVfDQgLYjUVzeweTwKR3AmM4g@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/panfrost: Add support for multiple power
 domains
To: Nicolas Boichat <drinkcat@chromium.org>
X-Mailman-Approved-At: Mon, 10 Feb 2020 08:59:10 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 9 Feb 2020 at 13:50, Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Fri, Feb 7, 2020 at 10:26 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Fri, 7 Feb 2020 at 06:27, Nicolas Boichat <drinkcat@chromium.org> wrote:
> > >
> > > When there is a single power domain per device, the core will
> > > ensure the power domain is switched on (so it is technically
> > > equivalent to having not power domain specified at all).
> > >
> > > However, when there are multiple domains, as in MT8183 Bifrost
> > > GPU, we need to handle them in driver code.
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> >
> > Besides a minor nitpick, feel free to add:
> >
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> >
> > Kind regards
> > Uffe
> >
> > [snip]
> > > +static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
> > > +{
> > > +       int err;
> > > +       int i, num_domains;
> > > +
> > > +       num_domains = of_count_phandle_with_args(pfdev->dev->of_node,
> > > +                                                "power-domains",
> > > +                                                "#power-domain-cells");
> > > +
> > > +       /*
> > > +        * Single domain is handled by the core, and, if only a single power
> > > +        * the power domain is requested, the property is optional.
> > > +        */
> > > +       if (num_domains < 2 && pfdev->comp->num_pm_domains < 2)
> > > +               return 0;
> > > +
> > > +       if (num_domains != pfdev->comp->num_pm_domains) {
> > > +               dev_err(pfdev->dev,
> > > +                       "Incorrect number of power domains: %d provided, %d needed\n",
> > > +                       num_domains, pfdev->comp->num_pm_domains);
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       if (WARN(num_domains > ARRAY_SIZE(pfdev->pm_domain_devs),
> > > +                       "Too many supplies in compatible structure.\n"))
> >
> > Nitpick:
> > Not sure this deserves a WARN. Perhaps a regular dev_err() is sufficient.
>
> Ah well I had a BUG_ON before so presumably this is already a little better ,-)
>
> You can only reach there if you set pfdev->comp->num_pm_domains >
> MAX_PM_DOMAINS in the currently matched struct panfrost_compatible
> (pfdev->comp->num_pm_domains == num_domains, and see below too), so
> the kernel code would actually be actually broken (not the device
> tree, nor anything that could be probed). So I'm wondering if the
> loudness of a WARN is better in this case? Arguable ,-)

I see. It's not a big a deal, so feel free to keep as is.

[...]

Kind regards
Uffe
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C16EA287E4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 11:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A5A10E1A2;
	Wed,  5 Feb 2025 10:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B484010E1A2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 10:25:10 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-866ef456dc3so51932241.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 02:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738751109; x=1739355909;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MJblTr3fI5rGc7UsLjsm1kwpyQyFTbxsC4o+4N4MhNo=;
 b=Gnqb0fFIzDkT5ijaQ50MC2c1b005jNd4aH5n2Nb+g3UPlH4vjLGlLINmeokOhq05CS
 ISxRQ5p1x/P2CFtTwI9zMv48n3BWQTt4vo6dgP980Ueug0AFwB6PHP4Y8nUk8+5tvCSQ
 c6+zCKWhTSUGRwlSpIUFgH1ubMkCKYb6VJ+r80FoX/ibBymkT9aaXkod9nKIlgeoLo4Q
 2p/k/BPtbIC4vWObFkgzu0yBDnuPdpOrKxTQoTEiwEu2VsEaBp63g5awKdLh3HFRw1Sh
 fhFebpwbdHaQXuB6iTSSmbOCXkyX+fNFP21W/3hunKqmHXCkxBx+b3K8m5u+3BoJSgrc
 YNSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxIZfQgP1esjD03KvCyGx9h8MuyA/eId52/HhJzh4HlsEjYQg6MZuCHHE29+nPJTX7ZzxMbnYNFvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydagMsKYIxeVHF472cz/v2VLLUrENBIt/gjBBVmQiQvElj897o
 gUsilcwfuhO8ibGpc5xlVH1ou+luElvEPZNi5usQdYRm9R1o0L8/29+Pu6CD
X-Gm-Gg: ASbGncu9ugHX8JVURRaYEVs8BTIzLvGHOKgEEBEZJhBUvCr+mFKpBTx9arubSWVn8bB
 jcvkKWAV5SVCfgjDIRlkmD7bq4PvhRiS0HYlbieX6r+zTMBVpyX52IQwkSBsFUw3HavLqBCYuLx
 Q1HE5C/uo3TsJTMcHAC6Nbx2DxplfRILCSwwKzQt1Z0sT6KZ13DeFA3j3Y/0f1WfuYs5Vr4PuW/
 8SxUJNZv3Pc279K9eUhjRsWbrPQOMY74E9jm463mijPyS76+zRfGDBZQNw1H8r76KtQ/0FHcxYx
 dZIPbXUPSM8c8HQSJdZfH1SxqEOx+tLxNOZW9+6Txg/48d3W4FGx0w==
X-Google-Smtp-Source: AGHT+IF8p6JICbsAapJmKT1HO+XSL66FtGfUevkJSFRk9bQoCWgFZd6JVbvuj7mtZdqCsePwm+xsQg==
X-Received: by 2002:a05:6102:4b85:b0:4b2:5ccb:1596 with SMTP id
 ada2fe7eead31-4ba47ab879cmr1913941137.24.1738751109126; 
 Wed, 05 Feb 2025 02:25:09 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-866e8a15c13sm215949241.10.2025.02.05.02.25.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 02:25:08 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-864e4f5b253so1921151241.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 02:25:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVCrc1KzpMgsfqraw/8CcR5MthuloRKPH7o7sLAq8XCpOscdlG39ccU/L6O/qqnGqmbJKXpcSLrUUU=@lists.freedesktop.org
X-Received: by 2002:a05:6102:2b8d:b0:4af:ed5a:b697 with SMTP id
 ada2fe7eead31-4ba478e696cmr1586018137.13.1738751108573; Wed, 05 Feb 2025
 02:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
 <TY3PR01MB11346E195D7B44DA6EA30E25986F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2spuar4m4kcv62r7d6ovtpttpooodwrvsjk6tyxhlnuynw2aru@aj6s4xcgwfjf>
 <TY3PR01MB11346FD535BB442955F43050C86F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <wdxol4ua2zjzepvbdqrsybizl6ocpppjb2dmql62rbcmjjyqeb@5z4i2g7hf5vn>
 <TY3PR01MB11346E21DC023B3972A7A380686F72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E21DC023B3972A7A380686F72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Feb 2025 11:24:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAe1bNqv2dSeS_7dtEjPy2-P6wY6BcC-uXyhKnO3vU8A@mail.gmail.com>
X-Gm-Features: AWEUYZkz-dtkvYM7QuVXO_NgRTDC_zCKZATK71UYqtJN4-KHBKGZW5SQt3MMYC0
Message-ID: <CAMuHMdXAe1bNqv2dSeS_7dtEjPy2-P6wY6BcC-uXyhKnO3vU8A@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 "biju.das.au" <biju.das.au@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Wed, 5 Feb 2025 at 11:20, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Thierry Reding <thierry.reding@gmail.com>
> > On Tue, Feb 04, 2025 at 03:33:53PM +0000, Biju Das wrote:
> > > > -----Original Message-----
> > > > From: Thierry Reding <thierry.reding@gmail.com>
> > > > On Tue, Feb 04, 2025 at 09:07:05AM +0000, Biju Das wrote:
> > > > > > -----Original Message-----
> > > > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On
> > > > > > Behalf Of Geert Uytterhoeven
> > > > > > Sent: 03 February 2025 11:06
> > > > > > Subject: Re: [PATCH] drm/tegra: rgb: Simplify
> > > > > > tegra_dc_rgb_probe()
> > > > > >
> > > > > > On Sat, 1 Feb 2025 at 11:57, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > Simplify tegra_dc_rgb_probe() by using of_get_available_child_by_name().
> > > > > >
> > > > > > That's not the only thing this patch does...
> > > > > >
> > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > >
> > > > > > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > > > > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > > > > > @@ -202,12 +202,12 @@ static const struct
> > > > > > > drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
> > > > > > >
> > > > > > >  int tegra_dc_rgb_probe(struct tegra_dc *dc)  {
> > > > > > > -       struct device_node *np;
> > > > > > > +       struct device_node *np _free(device_node) =
> > > > > >
> > > > > > Adding the _free()...
> > > > >
> > > > > Yes it fixes a memory leak aswell.
> > > > >
> > > > > > > + of_get_available_child_by_name(dc->dev->of_node,
> > > > > > > + "rgb");
> > > > > > >         struct tegra_rgb *rgb;
> > > > > > >         int err;
> > > > > > >
> > > > > > > -       np = of_get_child_by_name(dc->dev->of_node, "rgb");
> > > > > > > -       if (!np || !of_device_is_available(np))
> > > > > > > +       if (!np)
> > > > > > >                 return -ENODEV;
> > > > > >
> > > > > > ... fixes the reference count in case of an unavailable node...
> > > > > >
> > > > > > >         rgb = devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
> > > > > >
> > > > > > ... but as np is stored below, it must not be freed when it goes out of context?
> > > > >
> > > > > OK, But it is used in tegra_output_probe() and never freed.
> > > > > Maybe remove should free it??
> > > >
> > > > It's not quite as simple as that. tegra_output_probe() can also
> > > > store
> > > > output->dev->of_node in output->of_node, so we'd also need to track
> > > > output->dev->a
> > > > flag of some sort to denote that this needs to be freed.
> > >
> > > OK.
> > >
> > > > Ultimately I'm not sure if it's really worth it. Do we really expect
> > > > these nodes to ever be freed (in which case this might leak memory)?
> > > > These are built-in devices and there's no code anywhere to remove any such nodes.
> > >
> > > If there is no use case for bind/rebind for the built-in device then no issue.
> > > Or in .remove() free the node or use dev_action_reset()??
> >
> > Bind/rebind is possible, but that's not even a problem. Worst case the reference count on the device
> > node will keep increasing, so we'll just keep leaking the same node over and over again. I guess
> > potentially there's a problem when we rebind for the 2^32-th time, but I'm not sure that's something
> > we need to consider.
>
> Agreed.
>
> >
> > That said, devm_add_action_or_reset() sounds like a good solution if we really want to make sure that
> > this doesn't leak, so yeah, I'm in favour of that.
>
> OK, Will send a patch after of_get_available_child_by_name() [1] hit on mainline.

Can't you already fix the unbound reference count now, as it is orthogonal
to the conversion to of_get_available_child_by_name()?

> https://lore.kernel.org/all/TY3PR01MB1134656CBDAF5FFCEB6C8D20F86F42@TY3PR01MB11346.jpnprd01.prod.outlook.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

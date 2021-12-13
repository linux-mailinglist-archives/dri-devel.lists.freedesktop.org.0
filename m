Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA82472FC3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 15:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A861510E766;
	Mon, 13 Dec 2021 14:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F286810E766
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 14:50:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1279B61134
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 14:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A12C34605
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639407022;
 bh=3RIGLsrBTZq02SmBvywAtNI7mOiPPJHAQxradN0nZTA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JNMisQxiaMBQv9WAMyx5F9doufgHMtM6+NCPoKl2BGNkcUwLSywlxGsmayTXh1ATk
 zfUt3PcQgGpv7+GloPaCbRKSNvZY87zgCzdfNJuQ84uB9Y2vkJaPu4O5Fpl+Rq7NEE
 Pdj5N18wT7fZenAVnl2OT4Sw4EOwkc6aG+AHw/UgAwLdpEfjsK8jSq1oDXBseWX4My
 yw6PYEwzjjtC6A6ulci4D5zGFpPq9hHaRl7Pb6bfdAZeXpuOyv+U8ED4nIVWQk51LV
 kCthSMQtcVh8A/5Ti/8QNYTOXh2H7A+mNAkPWy12sI/EhXvGFVb1LK/kV09Esrb4+4
 MYojcPvaY9EZw==
Received: by mail-ed1-f47.google.com with SMTP id r11so52285019edd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 06:50:22 -0800 (PST)
X-Gm-Message-State: AOAM533JCTsm2y/zWJfjtHUTTmbxXC/K9D1AUanS9jbPr/ltKbgYgZuM
 PE36Mf+JRNP+VsXMmUdOs33/OmhGlFmHRzdQ+A==
X-Google-Smtp-Source: ABdhPJyZy7fUpjvl/N9Q0Pd+kRFxXN8zC9h0kK8pSs17SFmHjmePfgukBJCcEPO2aRlYuio3nyzSRB5ikVQH8Eng0z4=
X-Received: by 2002:a17:907:72c2:: with SMTP id
 du2mr44725131ejc.155.1639407019675; 
 Mon, 13 Dec 2021 06:50:19 -0800 (PST)
MIME-Version: 1.0
References: <20211212062407.138309-1-marcan@marcan.st>
 <20211212062407.138309-2-marcan@marcan.st>
 <CABxcv=m4fu8h=FwY7R=thuvd13_ZbFqB9rNNN07QOAd__jdYSQ@mail.gmail.com>
 <63334964-d63d-7625-e46f-a6e6ec19e908@marcan.st>
 <CABxcv=kbR5GX3yEfqchKJPkCqpWp_oKWjG=pu7LikBwoSX8W3A@mail.gmail.com>
In-Reply-To: <CABxcv=kbR5GX3yEfqchKJPkCqpWp_oKWjG=pu7LikBwoSX8W3A@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 13 Dec 2021 08:50:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLLTL-_H3XgsZRZaxE6qO6y8CDpoHfDkOgwekb1ysNQFw@mail.gmail.com>
Message-ID: <CAL_JsqLLTL-_H3XgsZRZaxE6qO6y8CDpoHfDkOgwekb1ysNQFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
To: Javier Martinez Canillas <javier@dowhile0.org>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Hector Martin <marcan@marcan.st>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 13, 2021 at 5:30 AM Javier Martinez Canillas
<javier@dowhile0.org> wrote:
>
> On Mon, Dec 13, 2021 at 11:46 AM Hector Martin <marcan@marcan.st> wrote:
> >
> > On 13/12/2021 17.44, Javier Martinez Canillas wrote:
> > > Hello Hector,
> > >
> > > On Sun, Dec 12, 2021 at 7:24 AM Hector Martin <marcan@marcan.st> wrote:
> > >>
> > >> This code is required for both simplefb and simpledrm, so let's move it
> > >> into the OF core instead of having it as an ad-hoc initcall in the
> > >> drivers.
> > >>
> > >> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > >> Signed-off-by: Hector Martin <marcan@marcan.st>
> > >> ---
> > >>   drivers/of/platform.c          |  4 ++++
> > >>   drivers/video/fbdev/simplefb.c | 21 +--------------------
> > >>   2 files changed, 5 insertions(+), 20 deletions(-)
> > >>
> > >
> > > This is indeed a much better approach than what I suggested. I just
> > > have one comment.
> > >
> > >> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > >> index b3faf89744aa..793350028906 100644
> > >> --- a/drivers/of/platform.c
> > >> +++ b/drivers/of/platform.c
> > >> @@ -540,6 +540,10 @@ static int __init of_platform_default_populate_init(void)
> > >>                  of_node_put(node);
> > >>          }
> > >>
> > >> +       node = of_get_compatible_child(of_chosen, "simple-framebuffer");
> > >
> > > You have to check if the node variable is NULL here.
> > >
> > >> +       of_platform_device_create(node, NULL, NULL);
> > >
> > > Otherwise this could lead to a NULL pointer dereference if debug
> > > output is enabled (the node->full_name is printed).
> >
> > Where is it printed? I thought I might need a NULL check, but this code
>
> Sorry, I misread of_amba_device_create() as
> of_platform_device_create(), which uses the "%pOF" printk format
> specifier [0] to print the node's full name as a debug output [1].
>
> [0]: https://elixir.bootlin.com/linux/v5.16-rc5/source/Documentation/core-api/printk-formats.rst#L462
> [1]: https://elixir.bootlin.com/linux/v5.16-rc5/source/drivers/of/platform.c#L233
>
> > was suggested verbatim by Rob in v2 without the NULL check and digging
> > through I found that the NULL codepath is safe.
> >
>
> You are right that passing NULL is a safe code path for now due the
> of_device_is_available(node) check, but that seems fragile to me since
> just adding a similar debug output to of_platform_device_create()
> could trigger the NULL pointer dereference.

All/most DT functions work with a NULL node ptr, so why should this
one be different?

Rob

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92B53C206B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 10:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19B86E9D9;
	Fri,  9 Jul 2021 08:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD926E9D4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 08:02:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id p8so10964535wrr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 01:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BmTuoSrjVrvLnQBYawgcyJ5HdUbJDDYaqDoQW9Mc7SY=;
 b=dR4HlZmdA8k5eONrJN/VaYgpUpSsX++4j7UioFUJCEayHxGuxa8z/QhPJO5IYdWxyH
 zc7+WN2H5YJxt3ExBIjmC1mhMJjx71lJZfGIEiZLr1LPtFGh/iaBoy9uqGz/VNm32rpl
 Ft1Q3tH36sMKvvmRSTHbGHD+hZy8xKNNKpDDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BmTuoSrjVrvLnQBYawgcyJ5HdUbJDDYaqDoQW9Mc7SY=;
 b=SwtCPTgAa8y++EiEOvnN9afmMNL77WG3o02wllsl/M5yuazJNVlq+ay4dq5bn8GMiZ
 ohFcMI2DtoWWmWJssycsxEdURF6nPYYWQhLMgWKs63zGZ5mx0sfC80HiH9VI7q2YhTO0
 mses/LFaIViLooE8Q4kH8j3OV9Pf3nlcuNQrWJ/XkC29t71FsTN4VsPwo+GOa6z5ZvMy
 fyS1cTGXK6+HxErAkMAE/ZepWemV/HqvPl+eibql1MZItIHzjwX+MW4TdLhz7l5sEObt
 UzRCuUxQB6oY4N5KT+QWpVYE6hrArLINKPcmnOXs9HaB9esz05yN18m5Uqli4waYdqLo
 6KIQ==
X-Gm-Message-State: AOAM533rAhk2cTWCJQtyTHjnbkw+H6MS6MawPh9/4jRbjBTSwYhIWIpi
 dku4gNVgkonfpleT19RL30TUKg==
X-Google-Smtp-Source: ABdhPJzIBkieQHc9PjOpsuJ6CI5QANcRmne2ZWNze4X1SeO0kkq8Z+AU42eLrjQVsNANiTFEkEMD4Q==
X-Received: by 2002:a5d:6b8d:: with SMTP id n13mr9642717wrx.258.1625817752223; 
 Fri, 09 Jul 2021 01:02:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z13sm4701195wro.79.2021.07.09.01.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 01:02:31 -0700 (PDT)
Date: Fri, 9 Jul 2021 10:02:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v5] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <YOgClII3UwckkPkb@phenom.ffwll.local>
References: <20210706161244.1038592-1-maxime@cerno.tech>
 <20210709102444.7a72a029@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709102444.7a72a029@eldfell>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Edmund Dea <edmund.j.dea@intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Melissa Wen <melissa.srw@gmail.com>, Eric Anholt <eric@anholt.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Steven Price <steven.price@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Jerome Brunet <jbrunet@baylibre.com>, Paul Cercueil <paul@crapouillou.net>,
 Marek Vasut <marex@denx.de>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Qiang Yu <yuq825@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kevin Hilman <khilman@baylibre.com>, Tomi Valkeinen <tomba@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, Chen Feng <puck.chen@hisilicon.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Ben Skeggs <bskeggs@redhat.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Roland Scheidegger <sroland@vmware.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Huang Rui <ray.huang@amd.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Robert Foss <robert.foss@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 09, 2021 at 10:24:44AM +0300, Pekka Paalanen wrote:
> On Tue,  6 Jul 2021 18:12:44 +0200
> Maxime Ripard <maxime@cerno.tech> wrote:
> 
> > New KMS properties come with a bunch of requirements to avoid each
> > driver from running their own, inconsistent, set of properties,
> > eventually leading to issues like property conflicts, inconsistencies
> > between drivers and semantics, etc.
> > 
> > Let's document what we expect.
> 
> ...
> 
> > Changes from v4:
> >   - Changes suggested by Pekka
> > 
> > Changes from v3:
> >   - Roll back to the v2
> >   - Add Simon and Pekka in Cc
> > 
> > Changes from v2:
> >   - Take into account the feedback from Laurent and Lidiu to no longer
> >     force generic properties, but prefix vendor-specific properties with
> >     the vendor name
> > 
> > Changes from v1:
> >   - Typos and wording reported by Daniel and Alex
> > ---
> >  Documentation/gpu/drm-kms.rst | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> > index 87e5023e3f55..47994890fd1e 100644
> > --- a/Documentation/gpu/drm-kms.rst
> > +++ b/Documentation/gpu/drm-kms.rst
> > @@ -463,6 +463,36 @@ KMS Properties
> >  This section of the documentation is primarily aimed at user-space developers.
> >  For the driver APIs, see the other sections.
> >  
> > +Requirements
> > +------------
> > +
> > +KMS drivers might need to add extra properties to support new features.
> > +Each new property introduced in a driver need to meet a few
> > +requirements, in addition to the one mentioned above:
> > +
> > +* It must be standardized, documenting:
> > +
> > +  * The full, exact, name string;
> > +  * If the property is an enum, all the valid variants name;
> 
> Hi,
> 
> "variant" feels a little off to me, I would have used "value name
> strings".
> 
> > +  * What values are accepted, and what these values mean;
> > +  * What the property does and how it can be used;
> > +  * How the property might interact with other, existing properties.
> > +
> > +* It must provide a generic helper in the core code to register that
> > +  property on the object it attaches to.
> > +
> > +* Its content must be decoded by the core and provided in the object's
> > +  associated state structure. That includes anything drivers might want
> > +  to precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>` for
> > +  planes.
> > +
> > +* Its initial state must match the behavior prior to the property
> > +  introduction. This might be a fixed value matching what the hardware
> > +  does, or it may be inherited from the state the firmware left the
> > +  system in during boot.
> 
> I'd like to point out that this rule should apply also to
> properties that already exist in general, but are newly exposed in a
> driver for hardware that didn't expose the property before.

I think we should just make this a very strong recommendation, and in
general encourage people to use the tests against their driver?

Otherwise a small "I'll just enable this" thing can become a huge project.
And in general I think grandfathering existing things in is the pragmatic
choice.

But maybe that could be a follow-up patch?
-Daniel

> 
> > +
> > +* An IGT test must be submitted where reasonable.
> > +
> >  Property Types and Blob Property Support
> >  ----------------------------------------
> >  
> 
> Regardless of my comments above:
> 
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> 
> Thanks,
> pq



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

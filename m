Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44813C5DF4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 16:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D675C89C03;
	Mon, 12 Jul 2021 14:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0850689C03
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 14:07:13 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso106283wmj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=p7O4W5ky1oF7WdmqJH+sNkwA4ZCHs3/ZBm2AUZnthH8=;
 b=bKzUAQ6xjNseA7AUiDYdS+w5UuiI11E4CeNvb2HJ9Pc/hfPFm/JUB/FjdwhBc8nm4S
 45OH9TOmRE8tI1R8nxEhMnt4mekfggAeX7EltWSurlpYmCl7Y46INFsx5E38MJVPpVWF
 l2YfzMuoZrcwWEWijxDErR65YllGV0b+w14fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p7O4W5ky1oF7WdmqJH+sNkwA4ZCHs3/ZBm2AUZnthH8=;
 b=PHAhro2iyU+ma7Jjfp/zmPMv+xqPqOAZmKS4RBChRIIHCXm+RcczLWiFeQXxa1eKtD
 9Y692lTtW6lPgMgnt8TaPni//2/1vopY0uC18fJkIHlI3K1ACOa3t3OlbohPQP8eZYSX
 j/IxQ0WGe9xcUrY5QjWoJuOEkaNUA0eJ/JV10YKyPmF7dvtXDbziyTAv/jredcSoGfPM
 e2fmKKO0x349uufl3uNA7Thdgpf5+vbQU1qHXTXNaZEa6cYtuhMW8+AC4alZNodfMDLZ
 ArB0LmgiIquCbV6fIH4e1G0nJlzyGriDbOba7R0D1sVvvWM90oCFNZEGQyHNWyjnfsMU
 Rw0w==
X-Gm-Message-State: AOAM533adxAuUKvXSENb2es45SC8AoaSE1xP+83lMj1M/KMTazTAH2LA
 5ivjYZOhlp6IsfGZtNMdd6h9vQ==
X-Google-Smtp-Source: ABdhPJxsIIrVDoTSmPw1PCAUwck5pZdw90XD3rtLgMAMsu1UL3vl+6tligSn0f4n3yfVZMnbpQldLg==
X-Received: by 2002:a05:600c:cf:: with SMTP id
 u15mr14628294wmm.92.1626098832590; 
 Mon, 12 Jul 2021 07:07:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm12288273wmc.42.2021.07.12.07.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:07:11 -0700 (PDT)
Date: Mon, 12 Jul 2021 16:07:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v5] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <YOxMi+diPtgnj7E2@phenom.ffwll.local>
References: <20210706161244.1038592-1-maxime@cerno.tech>
 <20210709102444.7a72a029@eldfell>
 <YOgClII3UwckkPkb@phenom.ffwll.local>
 <20210709120814.48a90aa1@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709120814.48a90aa1@eldfell>
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
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Roland Scheidegger <sroland@vmware.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

On Fri, Jul 09, 2021 at 12:08:14PM +0300, Pekka Paalanen wrote:
> On Fri, 9 Jul 2021 10:02:28 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Fri, Jul 09, 2021 at 10:24:44AM +0300, Pekka Paalanen wrote:
> > > On Tue,  6 Jul 2021 18:12:44 +0200
> > > Maxime Ripard <maxime@cerno.tech> wrote:
> > >   
> > > > New KMS properties come with a bunch of requirements to avoid each
> > > > driver from running their own, inconsistent, set of properties,
> > > > eventually leading to issues like property conflicts, inconsistencies
> > > > between drivers and semantics, etc.
> > > > 
> > > > Let's document what we expect.  
> > > 
> > > ...
> > >   
> > > > Changes from v4:
> > > >   - Changes suggested by Pekka
> > > > 
> > > > Changes from v3:
> > > >   - Roll back to the v2
> > > >   - Add Simon and Pekka in Cc
> > > > 
> > > > Changes from v2:
> > > >   - Take into account the feedback from Laurent and Lidiu to no longer
> > > >     force generic properties, but prefix vendor-specific properties with
> > > >     the vendor name
> > > > 
> > > > Changes from v1:
> > > >   - Typos and wording reported by Daniel and Alex
> > > > ---
> > > >  Documentation/gpu/drm-kms.rst | 30 ++++++++++++++++++++++++++++++
> > > >  1 file changed, 30 insertions(+)
> > > > 
> > > > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> > > > index 87e5023e3f55..47994890fd1e 100644
> > > > --- a/Documentation/gpu/drm-kms.rst
> > > > +++ b/Documentation/gpu/drm-kms.rst
> > > > @@ -463,6 +463,36 @@ KMS Properties
> > > >  This section of the documentation is primarily aimed at user-space developers.
> > > >  For the driver APIs, see the other sections.
> > > >  
> > > > +Requirements
> > > > +------------
> > > > +
> > > > +KMS drivers might need to add extra properties to support new features.
> > > > +Each new property introduced in a driver need to meet a few
> > > > +requirements, in addition to the one mentioned above:
> > > > +
> > > > +* It must be standardized, documenting:
> > > > +
> > > > +  * The full, exact, name string;
> > > > +  * If the property is an enum, all the valid variants name;  
> > > 
> > > Hi,
> > > 
> > > "variant" feels a little off to me, I would have used "value name
> > > strings".
> > >   
> > > > +  * What values are accepted, and what these values mean;
> > > > +  * What the property does and how it can be used;
> > > > +  * How the property might interact with other, existing properties.
> > > > +
> > > > +* It must provide a generic helper in the core code to register that
> > > > +  property on the object it attaches to.
> > > > +
> > > > +* Its content must be decoded by the core and provided in the object's
> > > > +  associated state structure. That includes anything drivers might want
> > > > +  to precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>` for
> > > > +  planes.
> > > > +
> > > > +* Its initial state must match the behavior prior to the property
> > > > +  introduction. This might be a fixed value matching what the hardware
> > > > +  does, or it may be inherited from the state the firmware left the
> > > > +  system in during boot.  
> > > 
> > > I'd like to point out that this rule should apply also to
> > > properties that already exist in general, but are newly exposed in a
> > > driver for hardware that didn't expose the property before.  
> > 
> > I think we should just make this a very strong recommendation, and in
> > general encourage people to use the tests against their driver?
> > 
> > Otherwise a small "I'll just enable this" thing can become a huge project.
> > And in general I think grandfathering existing things in is the pragmatic
> > choice.
> > 
> > But maybe that could be a follow-up patch?
> 
> Sure, I don't mind. Just saying now that it came to mind. Drivers do
> not arbitrarily change behaviour without exposing more properties
> either, right?

Yup. Both are covered under the "no regressions" rule, but better to make
this explicit. Maybe we should replicate some of the key bits in the
property docs for drivers?

Also anytime we spot an issue we need to improve the internal helpers to
make sure things stay consistent.
-Daniel

> 
> 
> Thanks,
> pq
> 
> 
> > -Daniel
> > 
> > >   
> > > > +
> > > > +* An IGT test must be submitted where reasonable.
> > > > +
> > > >  Property Types and Blob Property Support
> > > >  ----------------------------------------
> > > >    
> > > 
> > > Regardless of my comments above:
> > > 
> > > Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > 
> > > 
> > > Thanks,
> > > pq  
> > 
> > 
> > 
> 



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

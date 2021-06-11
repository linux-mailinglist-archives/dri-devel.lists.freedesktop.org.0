Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7573A44ED
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 17:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC866E50E;
	Fri, 11 Jun 2021 15:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D946E50E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 15:26:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a11so6501459wrt.13
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0fXaAQCav4JMHqqDLTmJAA9vL2ofAn8LFVDAYy3FosU=;
 b=RxaoGZB9PdBO2obWWr9Son1CIQ7DAYfphJ4uKNVobOiYpJ+mmavn7NB0YtCHIT1l1D
 oQsizyYQ4FJRefvQAFJO/0AJOav1E/ofoqH4paJ297oy93lpQ3e896974RQ7zKVhhvb1
 oqY38pf1DVDLn5a35cw/r70vfWSV/1SHhcR0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0fXaAQCav4JMHqqDLTmJAA9vL2ofAn8LFVDAYy3FosU=;
 b=ZmJSLe81D/oN11tVWLgiWOFZUIxzvye4P/6Is/3ZkUfCeDwvEwejBiwIlSIqeIqLP2
 F4BkfqnPABgD0wKnZdBP5HvwdzGNqapAckCo6sNt9/Lp9CNJgDnNsZfdYFmvlB8GPZNM
 8BdNEIh7py0GkNwP32wpFkpsLwUC33Axt603zS19pUciTt9m/vDM630BCNEDkDNpnfqB
 rXH2VIc5Ix6aDj0TRriSnFh4mm/01QCJgoE9/l42bxNtE2g1tjyIVgl0ChypBCe3biOq
 AmVlZM4yTxAiQoI2FnKkXiyzi12lukxRWzqL6aAhePYG6xM3w8tlpnjkfJZTDjnzIYn1
 Qa0Q==
X-Gm-Message-State: AOAM531SKBp4ngyPv4/qeZWSrc/yH60ZwutJdJOxtTx4VZ7K90OsosPh
 5dk2ORdmLZaG+uMnjziU12Cw4g==
X-Google-Smtp-Source: ABdhPJw2KFr1zO8QQtfKE4YD9azGDVISyK9XC85GcDukXzrthZ23Yp2apTf9M28mUBh5xZI3M9Pdgw==
X-Received: by 2002:a5d:438a:: with SMTP id i10mr4768390wrq.82.1623425179113; 
 Fri, 11 Jun 2021 08:26:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h11sm6267937wmq.34.2021.06.11.08.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 08:26:18 -0700 (PDT)
Date: Fri, 11 Jun 2021 17:26:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <YMOAlqwTE6exJtQA@phenom.ffwll.local>
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
 <20210611055407.aoeams62wbalodrj@gilmour>
 <1cac781e-122f-568b-5f5a-7e0ceb94bd0b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cac781e-122f-568b-5f5a-7e0ceb94bd0b@ideasonboard.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Roland Scheidegger <sroland@vmware.com>, Sean Paul <sean@poorly.run>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Edmund Dea <edmund.j.dea@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Steven Price <steven.price@arm.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Melissa Wen <melissa.srw@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Joel Stanley <joel@jms.id.au>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Chen Feng <puck.chen@hisilicon.com>,
 Alison Wang <alison.wang@nxp.com>, Maxime Ripard <maxime@cerno.tech>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Huang Rui <ray.huang@amd.com>, Marek Vasut <marex@denx.de>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Russell King <linux@armlinux.org.uk>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Foss <robert.foss@linaro.org>, Qiang Yu <yuq825@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 09:53:19AM +0300, Tomi Valkeinen wrote:
> On 11/06/2021 08:54, Maxime Ripard wrote:
> > Hi,
> > 
> > On Thu, Jun 10, 2021 at 11:00:05PM +0200, Daniel Vetter wrote:
> > > On Thu, Jun 10, 2021 at 7:47 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > 
> > > > New KMS properties come with a bunch of requirements to avoid each
> > > > driver from running their own, inconsistent, set of properties,
> > > > eventually leading to issues like property conflicts, inconsistencies
> > > > between drivers and semantics, etc.
> > > > 
> > > > Let's document what we expect.
> > > > 
> > > > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > Cc: Alison Wang <alison.wang@nxp.com>
> > > > Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > > > Cc: Andrew Jeffery <andrew@aj.id.au>
> > > > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > > > Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > > > Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > > > Cc: Brian Starkey <brian.starkey@arm.com>
> > > > Cc: Chen Feng <puck.chen@hisilicon.com>
> > > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > > > Cc: "Christian König" <christian.koenig@amd.com>
> > > > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > > Cc: Edmund Dea <edmund.j.dea@intel.com>
> > > > Cc: Eric Anholt <eric@anholt.net>
> > > > Cc: Fabio Estevam <festevam@gmail.com>
> > > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > Cc: Hans de Goede <hdegoede@redhat.com>
> > > > Cc: "Heiko Stübner" <heiko@sntech.de>
> > > > Cc: Huang Rui <ray.huang@amd.com>
> > > > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > > > Cc: Inki Dae <inki.dae@samsung.com>
> > > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > > > Cc: Joel Stanley <joel@jms.id.au>
> > > > Cc: John Stultz <john.stultz@linaro.org>
> > > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > > Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> > > > Cc: Jyri Sarha <jyri.sarha@iki.fi>
> > > > Cc: Kevin Hilman <khilman@baylibre.com>
> > > > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > > > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > > > Cc: Marek Vasut <marex@denx.de>
> > > > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > > > Cc: "Noralf Trønnes" <noralf@tronnes.org>
> > > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > > Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > > > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > > > Cc: Paul Cercueil <paul@crapouillou.net>
> > > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> > > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > > Cc: Qiang Yu <yuq825@gmail.com>
> > > > Cc: Rob Clark <robdclark@gmail.com>
> > > > Cc: Robert Foss <robert.foss@linaro.org>
> > > > Cc: Rob Herring <robh@kernel.org>
> > > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Roland Scheidegger <sroland@vmware.com>
> > > > Cc: Russell King <linux@armlinux.org.uk>
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: Sandy Huang <hjc@rock-chips.com>
> > > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > > Cc: Sean Paul <sean@poorly.run>
> > > > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > Cc: Stefan Agner <stefan@agner.ch>
> > > > Cc: Steven Price <steven.price@arm.com>
> > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > > Cc: Tian Tao <tiantao6@hisilicon.com>
> > > > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > > > Cc: Tomi Valkeinen <tomba@kernel.org>
> > > > Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> > > > Cc: Xinliang Liu <xinliang.liu@linaro.org>
> > > > Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> > > > Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> > > > Cc: Zack Rusin <zackr@vmware.com>
> > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > 
> > > > ---
> > > > 
> > > > Changes from v2:
> > > >    - Take into account the feedback from Laurent and Lidiu to no longer
> > > >      force generic properties, but prefix vendor-specific properties with
> > > >      the vendor name
> > > 
> > > I'm pretty sure my r-b was without this ...
> > 
> > Yeah, sorry. I wanted to tell you on IRC that you wanted to have a
> > second look, but I shouldn't have kept it and caught you by surprise
> > indeed.
> > 
> > > Why exactly do we need this? KMS is meant to be fairly generic (bugs
> > > throw a wrench around here sometimes, and semantics can be tricky). If
> > > we open up the door to yolo vendor properties in upstream, then that
> > > goal is pretty much written off. And we've been there with vendor
> > > properties, it's a giantic mess.
> > > 
> > > Minimally drop my r-b, I'm definitely not in support of this idea.
> > 
> > So the argument Lidiu and Laurent made was that in some cases, getting a
> > generic property right with only a couple of users is hard. So they
> > advocated for the right to keep non-generic properties. I can get the
> > argument, and no-one else said that was wrong, so it felt like the
> > consensus was there.
> 
> I also think that (maybe mainly on embedded side) we may have 1) esoteric HW
> features which perhaps can't even be made generic, and 2) features which may
> or may not be generic, but for which support cannot be added to any common
> opensource userspace projects like X or Weston, as the only use cases for
> the features are specialized low level apps (often customer's closed-source
> apps).
> 
> While I agree with Daniel's "gigantic mess" problem, it would also be quite
> nice to have a way to support all the HW features upstream instead of
> carrying them in vendor trees.

So this means to be able to accomodate this "vendor properties are totally
fine, go wild" exception we also need to throw "open source userspace
user, fully reviewed and tested" into the drink?

At least my experience from what I've seen with funky vendor properties
isn't so much that we can't figure out a reasonable way to expose them.
The problem is that the userspace tends to be a (often closed source)
vendor fork of a random compositor somewhere. So if that requirement is
somehow a problem, we need to talk about _that_.

Not promising we'll totally merge some vendor properties without spelling
out what exactly this means. All that ensures is that people submit
patches and then get annoyed because they still can't be merged because
the userspace situation is all the same.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

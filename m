Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF81C9E374
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752EA10E736;
	Wed,  3 Dec 2025 08:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rI6h+xJT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A56010E736
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 08:30:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A552F43AF1;
 Wed,  3 Dec 2025 08:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3A9C4CEFB;
 Wed,  3 Dec 2025 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764750649;
 bh=zyF/r0fjZEG5Zc5d3W/4Gh2VeH+el4jv7LMS1PSNlk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rI6h+xJTutYGBiCMHFSC/CvZ/aY8wz+s4/Zl+p2h9DrLvfIzTqd/+d1iR4lErm5FB
 mKQKFs37QSydLBwjhKPPZwTcCewwu9vwRaOKnDWzWiD0YAwKFCKAInPN20z5mmD7fn
 tl8JtUqV3tiQsXc5zFT8Hi5EDUYl36G54aqvYte5xk6qTXQFkpq65iRsQ3o4WGXNtN
 NCklPbkMxcfeLXearae5GTpSabNxYuf8ZOvHtVMKnxs1TQBgmIVeiWSG0BEA1a5KDf
 abjPoyZNTSRel49GIShJu3LoR1+/e6jpovfKAlDCHifWa8lAhlupOrLbemnC5nh4e/
 TGmHTfIEDA8gw==
Date: Wed, 3 Dec 2025 09:30:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 05/21] ARM: dts: omap: Bind panel to panel-dpi instead of
 ti,tilcdc,panel driver
Message-ID: <20251203-aromatic-heavy-loon-0cbd14@quoll>
References: <20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
 <96b1b7bf-ddbe-4213-a201-dc89cf2998dd@ideasonboard.com>
 <3bc5bf92-05c3-4841-ab28-9bab2bb31cd5@kernel.org>
 <20251202104244.59a9e83d@kmaincent-XPS-13-7390>
 <d7515cd3-5488-4d15-82dc-d2b98cfa2bed@kernel.org>
 <20251202114416.09624a4b@kmaincent-XPS-13-7390>
 <94e254fa-289d-41ed-909f-1742cfbb2690@kernel.org>
 <20251202121856.0da62885@kmaincent-XPS-13-7390>
 <1d9a9269-bfda-4d43-938b-2df6b82b9369@ideasonboard.com>
 <20251202135605.053ada96@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202135605.053ada96@kmaincent-XPS-13-7390>
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

On Tue, Dec 02, 2025 at 01:56:05PM +0100, Kory Maincent wrote:
> On Tue, 2 Dec 2025 13:51:59 +0200
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> 
> > Hi Kory,
> > 
> > On 02/12/2025 13:18, Kory Maincent wrote:
> > > On Tue, 2 Dec 2025 11:47:40 +0100
> > > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > I will not NAK, removing bindings and breaking users is under some
> > conditions acceptable. You just need to come with the reasons and impact.
> > 
> > Reason "is ugly" is usually not good enough. Especially if things were
> > working.
> 
> Thanks for you reply.
> 
> > >>
> > >> DTS cannot go to drm, which means you either need to separate the change
> > >> and make entire work bisectable and backwards compatible for some time
> > >> OR at least document clearly the impact as we always ask.  
> > > 
> > > The thing is, if I split it, it has to be in 3. One for the of DRM bus flags
> > > support, a second for the the devicetree and binding change and a third for
> > > the whole tilcdc and tda998x cleaning stuff. I think I will go for one
> > > series, with better documentation.
> > > 
> > > Now, what is your point of view on my question. Will you nak any binding
> > > removal even if the binding is ugly and legacy and imply maintaining an
> > > non-standard tilcdc panel driver? I know it breaks DTB compatibility but
> > > there is several argument to not keep it. See patch 6.  
> > The binding being ugly and having to maintain non-standard tilcdc panel
> > driver may be nice things for us, the users don't care. The users care
> > if their board no longer works.
> 
> Yes I understand but then I have another question. At what cost should we
> continue to support legacy binding?

That's mostly question to platform maintainers and users. Extrapolating
kernel rule - we never break the user-space - we never break the users,
thus we take significant cost.

And that significant cost can be the cost of making the transition
smooth or smoother.

> 
> Just figured out this case already happened, ti,tilcdc,slave binding was
> removed from the tilcdc driver:
> 739acd85ffdb7 ("drm/tilcdc: Remove obsolete "ti,tilcdc,slave" dts binding
> support")
> 
> Even if there is still one mainline device tree that uses it:
> am335x-base0033.dts. :/

If that commit broke existing users, it is a good argument for your
changes, but you need to explicitly use that argument in commit msg.

> 
> > And how does this sync with u-boot? It also has code for at least for a
> > few of these boards.
> 
> U-boot has indeed a driver for the ti,tilcdc,panel binding.
> Changing this devicetree would beak display for these board in U-boot as it
> currently does not support the "panel-dpi" binding.

Thanks for checking, regardless of decision this also should be in
commit msg.

Maybe things were not working correctly for long time, so there is a
choice of fixing Linux side while breaking U-boot and not fixing, but
keeping bootloader working.


Best regards,
Krzysztof


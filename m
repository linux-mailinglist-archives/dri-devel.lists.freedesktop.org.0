Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A069E163C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D84A10E986;
	Tue,  3 Dec 2024 08:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uDcOTWZs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621DF10E984
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:50:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEC408DB;
 Tue,  3 Dec 2024 09:49:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733215798;
 bh=Rb+1LimEOg2KyRvb49TqiGJHO6i5lsezJr9VXtmZ3YQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uDcOTWZsHL72Z+kjzinta4X89IEUrGtYEZxJWqRYQX3K70mrr9SGDhn7CU3Mi7tN6
 WU4hOKrBxpPahgl/NICv7pMAaORwnERsCy6nJsjvAdXcp11MNv1bcsSzE02WV2YDse
 zZJLnTiDh3bVOOP0OQSTfTEqLG/aG97coDylyK3E=
Date: Tue, 3 Dec 2024 10:50:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/9] dt-bindings: display: renesas,du: Add r8a779h0
Message-ID: <20241203085013.GH10736@pendragon.ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-2-738ae1a95d2a@ideasonboard.com>
 <20241203081935.GE10736@pendragon.ideasonboard.com>
 <CAMuHMdVZui9c4X0FQ3Xke4gzxa9gvs6Nsp0eh5avzr_G3wd=ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVZui9c4X0FQ3Xke4gzxa9gvs6Nsp0eh5avzr_G3wd=ig@mail.gmail.com>
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

On Tue, Dec 03, 2024 at 09:38:44AM +0100, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Tue, Dec 3, 2024 at 9:19 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Tue, Dec 03, 2024 at 10:01:36AM +0200, Tomi Valkeinen wrote:
> > > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > >
> > > Extend the Renesas DU display bindings to support the r8a779h0 V4M.
> > >
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > ---
> > >  Documentation/devicetree/bindings/display/renesas,du.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > index c5b9e6812bce..d369953f16f7 100644
> > > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > @@ -41,6 +41,7 @@ properties:
> > >        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> > >        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> > >        - renesas,du-r8a779g0 # for R-Car V4H compatible DU
> > > +      - renesas,du-r8a779h0 # for R-Car V4M compatible DU
> > >
> > >    reg:
> > >      maxItems: 1
> >
> > You also need to add h0 to the g0 block in the conditional properties
> > below. With that,
> 
> Which is not sufficient, as the DU on R-Car V4M has only a single channel,
> unlike on R-Car V3U and V4H.

Ah, indeed, in that case the DT bindings also need to take that into
account :-)

-- 
Regards,

Laurent Pinchart

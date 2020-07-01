Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E131A211031
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 18:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FC56E951;
	Wed,  1 Jul 2020 16:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D316E951
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:07:28 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AE60A20025;
 Wed,  1 Jul 2020 18:07:24 +0200 (CEST)
Date: Wed, 1 Jul 2020 18:07:23 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
Subject: Re: [PATCH v6 02/13] dt-bindings: panel: Convert
 rocktech,jh057n00900 to yaml
Message-ID: <20200701160723.GA675098@ravnborg.org>
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701103126.1512615-3-megous@megous.com>
 <20200701155857.GB174356@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701155857.GB174356@bogon.m.sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=J_fg_7IlAAAA:8 a=-sgrNTgQ70Twg4PVczQA:9
 a=wPNLvfGTeEIA:10 a=zGOw-GkVl6h1W4ZARoUA:22
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Purism Kernel Team <kernel@puri.sm>, dri-devel@lists.freedesktop.org,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Martijn Braam <martijn@brixit.nl>, linux-sunxi@googlegroups.com,
 Thierry Reding <thierry.reding@gmail.com>, Luca Weiss <luca@z3ntu.xyz>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 01, 2020 at 05:58:57PM +0200, Guido G=FCnther wrote:
> Hi Ondrej,
> On Wed, Jul 01, 2020 at 12:31:15PM +0200, Ondrej Jirman wrote:
> > Convert Rocktech MIPI DSI panel driver from txt to yaml bindings.
> > =

> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > ---
> >  .../display/panel/rocktech,jh057n00900.txt    | 23 -------
> >  .../display/panel/rocktech,jh057n00900.yaml   | 66 +++++++++++++++++++
> >  2 files changed, 66 insertions(+), 23 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/panel/roc=
ktech,jh057n00900.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.ya=
ml
> =

> Thanks for the conversion! Shouldn't we switch to `sitronix-st7703.yaml`
> as well in this patch?

That would be good if this rename is included.
Otherwise we will just have to do it later.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

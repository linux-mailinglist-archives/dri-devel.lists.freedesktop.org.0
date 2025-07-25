Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E4B124E6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 21:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0447810EA0D;
	Fri, 25 Jul 2025 19:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c7IReT1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF2E10EA0D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 19:51:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 52C43A56606;
 Fri, 25 Jul 2025 19:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08BEC4CEE7;
 Fri, 25 Jul 2025 19:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753473103;
 bh=HIFZCasQnvflawLHEinivIZ7CGoYHgz1TfOYSlsci5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c7IReT1m8egDm2RiZG6IZs9XJkWSVWWEaWM2T9QRwgauUdX2AFDzeVRji+7xYvf7w
 2q5Iq3z3/d+RbsVRQ2TymUaZsf7afz1W1pHCg6neFeqOeAH092Rfhqb0RwuYUv7/pA
 2sUaBr7obPmpG9Dd+eD7eFRQnZXyNO/znE8rgPc/yqfp/pRLxTXZbhso5dJxsmagpv
 TEojpnKd1CEmpaXLYT1n7FyiMD7faZq0Mif46V7ZOTZe5uPTjHDb2XJEnNM0sbPn1w
 2KIQ1Ox/iZbrveQ7eeXIjyiu0LwcAfEAOsUWt8NOXvbsJPC5FW7GzEYVn6MTJJP2R/
 lSDhPTaQdiSJQ==
Date: Fri, 25 Jul 2025 14:51:43 -0500
From: Rob Herring <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: backlight: Add max25014 bindings
Message-ID: <20250725195143.GA1735522-robh@kernel.org>
References: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
 <20250725-max25014-v1-1-0e8cce92078e@gocontroll.com>
 <175345006903.1002291.4212198267952446360.robh@kernel.org>
 <03096180-1e33-4dd0-b027-cc18a5010e46@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03096180-1e33-4dd0-b027-cc18a5010e46@gocontroll.com>
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

On Fri, Jul 25, 2025 at 04:06:45PM +0200, Maud Spierings wrote:
> 
> 
> On 7/25/25 15:27, Rob Herring (Arm) wrote:
> > 
> > On Fri, 25 Jul 2025 13:09:23 +0200, Maud Spierings wrote:
> > > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > > with intgrated boost controller.
> > > 
> > > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> > > ---
> > >   .../bindings/leds/backlight/maxim,max25014.yaml    | 78 ++++++++++++++++++++++
> > >   MAINTAINERS                                        |  5 ++
> > >   2 files changed, 83 insertions(+)
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> 
> Pretty sure I did that, but I've never gotten those tools to work quite
> right, I'll look at it for v2

What's the issue?

Rob

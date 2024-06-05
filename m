Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD158FD271
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 18:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CEE10E51A;
	Wed,  5 Jun 2024 16:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tGhV8lbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED1C10E51A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 16:05:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B85E6CE1856;
 Wed,  5 Jun 2024 16:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156ABC2BD11;
 Wed,  5 Jun 2024 16:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717603536;
 bh=Rn83EnfSNff3b/8SBMhGHjWg+Peuw6bxwb62hQbA+6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tGhV8lbFIuwQAk2EhyrdCKyXH9TfNlapJcP19jC8SsW2yIhvytv5MrwBq4lbuqYBr
 vH47nt81NaRP+4H0u320sFi4qL/sGpJShM9K/Xd7JEeptoAWM4OBUH1oL644zkRPN1
 Gl5KEbZ4qVvpwaKoe5Ba+QMvlxvOLJhvodk/jAhVyEYl26qjKKCB6F5PmX3hoDWoJH
 22NwtIhetEO0Td5tD6T1PjM6XxwOjyd4f4TNv4mNLKXoYhmgeXJGwcdwmmgdJVXVvT
 tPV0TRjcStgvKrdd7sapWJ5aMHACVmUJ6C5lG60bB4Gv0Os5zdblCaKGyBM5WzIU1U
 ANBwW67DagQRQ==
Date: Wed, 5 Jun 2024 10:05:33 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: tc358867: Document
 default DP preemphasis
Message-ID: <20240605160533.GB3222592-robh@kernel.org>
References: <20240531204339.277848-1-marex@denx.de>
 <3302939.44csPzL39Z@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3302939.44csPzL39Z@steina-w>
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

On Tue, Jun 04, 2024 at 11:42:31AM +0200, Alexander Stein wrote:
> Hi Marek,
> 
> Am Freitag, 31. Mai 2024, 22:42:03 CEST schrieb Marek Vasut:
> > Document default DP port preemphasis configurable via new DT property
> > "toshiba,pre-emphasis". This is useful in case the DP link properties
> > are known and starting link training from preemphasis setting of 0 dB
> > is not useful. The preemphasis can be set separately for both DP lanes
> > in range 0=0dB, 1=3.5dB, 2=6dB .
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > ---
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Robert Foss <rfoss@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: devicetree@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: kernel@dh-electronics.com
> > ---
> >  .../display/bridge/toshiba,tc358767.yaml       | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> > index 2ad0cd6dd49e0..dcf56e996ee22 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> > @@ -98,6 +98,24 @@ properties:
> >              reference to a valid eDP panel input endpoint node. This port is
> >              optional, treated as DP panel if not defined
> >  
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              toshiba,pre-emphasis:
> > +                description:
> > +                  Display port output Pre-Emphasis settings for both ports.
> 
> Is this a property of the port or the endpoint?

What's the difference? Either is the same data path.

The preference is custom properties in endpoint node, not port nodes.

Rob

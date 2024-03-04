Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FADA870C6B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 22:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2517F10E432;
	Mon,  4 Mar 2024 21:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZDNv2tss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4882010E432
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 21:24:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 68233CE1389;
 Mon,  4 Mar 2024 21:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8EBC433F1;
 Mon,  4 Mar 2024 21:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709587493;
 bh=GCATK6oSIl6USFFqC/CxN7o9XWA+S9y2ORbBrX3q6D4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZDNv2tssnLutTbFa6WyGdwustA4QBnMEu+28wfPUMo8UNbH7x/MrrHWTsx7jUSH5Z
 V4CJ06PkqW0wuMHZ8pqttIE/qrZ/x44WPTlFEJwiVG8dOO24EMkqPvYD+IKV4GZVie
 Roo7g86uMFOT1N9XHiL4cYPEFT6Kuwj+ZQ1vBnpLkDWaU63Mvz6Jhl68f/CpCqlc6r
 ZyLqOSTH84Yure/F/MqxK///OW/RM+98OcmotAdR990IgQ7biJM64boHyCEtNU0wJX
 AgoK8A5P3tEtDHg4OjgwsniRYohrj8FID/DHQ4H1y8hJ+NBIFa4C4WQebR7K6hO/rH
 ZXjuy84CFAd1Q==
Date: Mon, 4 Mar 2024 15:24:51 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: =?iso-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>
Subject: Re: [PATCH v2 0/3] panel-simple: add support for Crystal Clear
 CMT430B19N00
Message-ID: <20240304212451.GA1056406-robh@kernel.org>
References: <20240304160454.96977-1-jeremie.dautheribes@bootlin.com>
 <20240304-drivable-property-feaeba782880@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240304-drivable-property-feaeba782880@spud>
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

On Mon, Mar 04, 2024 at 07:29:04PM +0000, Conor Dooley wrote:
> On Mon, Mar 04, 2024 at 05:04:51PM +0100, Jérémie Dautheribes wrote:
> > Hello everyone,
> > 
> > This patch series add support for the Crystal Clear Technology
> > CMT430B19N00 4.3" 480x272 TFT-LCD panel.
> > It also adds Crystal Clear Technology to vendor-prefixes.yaml.
> > 
> > Please note that unfortunately there is no public datasheet available
> > for this panel.
> > 
> > Changes in v2:
> >   - add link to the Crystal Clear Technology website in commit message, as
> >   suggested by Conor Dooley and Neil Armstrong.
> 
> You forgot however to add the acks that I gave you for the two
> dt-binding patches.

I was wondering why my scripts said this was already reviewed with that 
missing. Turns out b4 will now check prior versions and add the tags as 
long as the patch-id matches. Neat, but the submitter really has to 
grasp how that all works (knowing if the patch-id changed) as well as 
the maintainer has to use b4, so we can't really rely on it.

Here's b4 debug log:

  new message: 20240223-subtotal-aground-268d135adeff@spud                                                                     
Running git --no-pager patch-id --stable                                                                                       
  found matching patch-id for Re: [PATCH 2/3] dt-bindings: display: simple: add support for Crystal Clear CMT430B19N00         
  new message: 20240229-woven-lively-1d90687b2d03@spud                                                                         
  skipping reply without trailers: 20240229-woven-lively-1d90687b2d03@spud
  new message: 20240223134517.728568-2-jeremie.dautheribes@bootlin.com                                                         
  skipping non-reply: 20240223134517.728568-2-jeremie.dautheribes@bootlin.com                                                  
Analyzing follow-up: Re: [PATCH v2 0/3] panel-simple: add support for Crystal Clear CMT430B19N00 (conor@kernel.org)            
  no trailers found, skipping                                                                                                  
Analyzing follow-up: Re: [PATCH v2 3/3] drm/panel: simple: add CMT430B19N00 LCD panel support (mripard@kernel.org)             
  no trailers found, skipping                                                                                                  
    adding "Acked-by: Conor Dooley <conor.dooley@microchip.com>" from trailer_map to: [PATCH v2 1/3] dt-bindings: Add Crystal C
lear Technology vendor prefix                                                                                                  
    adding "Link: http://www.cct.com.my/" from trailer_map to: [PATCH v2 1/3] dt-bindings: Add Crystal Clear Technology vendor 
prefix                                                                                                                         
    adding "Acked-by: Conor Dooley <conor.dooley@microchip.com>" from trailer_map to: [PATCH v2 2/3] dt-bindings: display: simp
le: add support for Crystal Clear CMT430B19N00                                                                                 
    adding "Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>" from trailer_map to: [PATCH v2 3/3] drm/panel: simple: add
 CMT430B19N00 LCD panel support                                                                                                
    adding "Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>" from trailer_map to: [PATCH v2 3/3] drm/panel: simple: add 
CMT430B19N00 LCD panel support                                                                                                 

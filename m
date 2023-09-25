Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAB27AE68B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 09:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA30E10E355;
	Tue, 26 Sep 2023 07:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-191.mta1.migadu.com (out-191.mta1.migadu.com
 [IPv6:2001:41d0:203:375::bf])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8114210E2D3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 20:10:14 +0000 (UTC)
Date: Tue, 26 Sep 2023 06:09:27 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1695672611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m+xFfBxFFUncwVJKXrgeBDxdx+ofsQpcDpMasXC+yD0=;
 b=UJG+alhxO3YGHw6m+goPdPo2R1H8lh7Y0AXmVpeSBD+n1/ucF8Hq2KRML6rPRE0xDRNzYa
 GlRMzfyR2C6vEJjLnWHvPZ9yMIvEaGJUc0jEk6cTfkPP/6P/oyi54rGs0PTIsK6arhP6Z8
 jfJEjNQ0ejAbZ0gLqI/jYmcaipAXAu7q03EfZ1eZLtgQHOwZd9U278hsbzkUD41woRE87b
 Fhlkpn2T8BjsuYUM/bR8mE/l35LhmFih9LnzOGVDaAc+gCjBfrO5TA/hJ/oIXinA6h+2GV
 VIvmkt5sh99Jf34T3K0aQlduBn0Gt9gDCoA3RnQeqOk0lVKS0g2QoHw5pWveAw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC PATCH v3 4/7] drm/panel: nv3052c: Add Fascontek FS035VG158
 LCD display
Message-ID: <ZRHo9-lYq8bOtJN3@titan>
References: <20230925021059.451019-1-contact@jookia.org>
 <20230925021059.451019-5-contact@jookia.org>
 <ebd5808fe3029e46376aea3c25d3770a6b406fdc.camel@crapouillou.net>
 <ZRFRFXCKTIb9x7GW@titan>
 <d63b2a7bf2bbabe41b8e45a6c0a4dc0b1e117bdd.camel@crapouillou.net>
 <ZRFXd3F7eit7x4aJ@titan>
 <a8a68baa0b1abfaeb9aa51d0095f4a4a62ec65fd.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8a68baa0b1abfaeb9aa51d0095f4a4a62ec65fd.camel@crapouillou.net>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 26 Sep 2023 07:15:08 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 12:34:55PM +0200, Paul Cercueil wrote:
> Unless you can explain what they do and why they are needed, I'd say
> they are not important :)
> 
> ...
>
> Again, doesn't mean that you have to use these.
> 
> From what I can see, all you need to support your Fascontek panel with
> the nv3052c driver, is to add the SPI ID and compatible strings.

This is not a patch I would be willing to submit. Sorry.

> 
> Cheers,
> -Paul

John.

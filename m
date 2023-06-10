Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBC072AE96
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 22:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D39910E1A0;
	Sat, 10 Jun 2023 20:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4774710E1A0
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 20:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=+DT+Wc90MY12xiEhuRDRQ2FBK2aaW3fatjFNEqz+o5s=;
 b=HeemEyEUBezcMBEq0B24nvtGEVyQkSQFePtwwdqyoDsoq7n7Q6OgDCKHoNP+PEtUhvSXZtCTB+PZQ
 WA9SGl15IPoNALvIuAqd0KPrdXYa1Gn6a9A5BjbuNYrL8WFBlitjbSlyHICcdjhw/Lv0+O5qmwQEia
 oWEK7lKXCbnNAEPwANeI6ctjzq4cO/nklE8ie2SzwbQohf3jGWBrcLXvNoC8nfOScbx9muoNx8vPYf
 Dd5OhdEJnbGlCpvhIsO+JXSHjacQwolG6wvk5uAIhuYtZzFAPSeq8iqvgZCiyj1ooKBXfTOp2jDdAY
 F2trBjhOPTJwoWwo6YEczUSbHt+Rv7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=+DT+Wc90MY12xiEhuRDRQ2FBK2aaW3fatjFNEqz+o5s=;
 b=CfM9yZuP2Jv+XFmMrLN6/bx0ufDNT2e/oHUKjXKc9V3Fhx66rh0ARnsuZoKLEJQnOz7ln/v3hRM71
 6QD0fo9DQ==
X-HalOne-ID: 942507fb-07cb-11ee-b3ba-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 942507fb-07cb-11ee-b3ba-99461c6a3fe8;
 Sat, 10 Jun 2023 20:15:46 +0000 (UTC)
Date: Sat, 10 Jun 2023 22:15:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 4/7] drm/panel: sitronix-st7789v: Use platform data
Message-ID: <20230610201545.GE1041001@ravnborg.org>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609145951.853533-5-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 09, 2023 at 04:59:48PM +0200, Miquel Raynal wrote:
> The Sitronix ST7789V LCD controller is actually packaged in a number of
> different panels with slightly different properties. Before introducing
> the support for another pannel using this same LCD controller, let's
> move all the panel-specific information into a dedicated structure that
> is available as platform data.
> 
> There is no functional change.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

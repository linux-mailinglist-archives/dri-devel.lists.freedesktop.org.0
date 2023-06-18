Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1427346A1
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 16:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2255710E074;
	Sun, 18 Jun 2023 14:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA2610E074
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 14:36:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EAC9260B05;
 Sun, 18 Jun 2023 14:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEED5C433C8;
 Sun, 18 Jun 2023 14:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687099004;
 bh=OqWhpLKbUijtVjVmppYi+rvNyPeXlFZGTPS0plnhhek=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=XyfaTr3LQOCsNSotlP01U2y4CR3E/G/R4gksWYnobSOWwv3UQ6dFt3tWL/4grg0nF
 9zVMUXExmHUYbTOWq/w8gnrbQACqbNSerRK5aFuaUMaywh3b4LgBwy7QHJ58gUCu3P
 MHS0JbA8lHdqIL4ljG1ojoswjjwcSQZsZZg0g89Q8HisBfBEyKQ+EVotW+ZpJgBUQ8
 Plb8rq8Zaej/zIDYJ6RDqXKKEWZrtTAsVc/xx29dqQn473dLv9mS1Y6tRmF3Awt1Je
 nAS43xznqJZcswsHZwVu13xe6z9ehM5yaHBKwmljEqTEoQUEIyy7X8sbySHAip3SKs
 pKl9M+8Rj0MaA==
Message-ID: <b4cade4a339dd5326ae11525773bfacc.mripard@kernel.org>
Date: Sun, 18 Jun 2023 14:36:41 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: display: st7789v: Add the
 edt,et028013dma panel compatible
In-Reply-To: <20230616163255.2804163-2-miquel.raynal@bootlin.com>
References: <20230616163255.2804163-2-miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
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
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Thierry
 Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael
 Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Jun 2023 18:32:50 +0200, Miquel Raynal wrote:
> The ST7789V LCD controller is also embedded in the ET028013DMA
> panel. Add a compatible string to describe this other panel.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

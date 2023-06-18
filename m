Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBF87346A5
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 16:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC8210E0A7;
	Sun, 18 Jun 2023 14:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73E510E0A7
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 14:38:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A74CB60BC2;
 Sun, 18 Jun 2023 14:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B51C433C0;
 Sun, 18 Jun 2023 14:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687099092;
 bh=MexRQi6ryRiFWia6auG4Bx08XeZUfCYXxh/Eno0wAZ8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=dDazEZleoaHmeFViUBfKdmuM5wJ/dRIYho6n49iBIOu79Kp+gLvF13+xMzY8ynIOh
 u+pYmr3Smm3cRvlu6dJn3YQm21jt+cfoYVCcnTllWUPJAilFhAuYKYpXr09ohk8QRz
 T2/AEx4Y3FuRkQL+6xW2HjOT8IQCbVw/6riu0bXasgDSP0PYg8JTNw2NA+gQ4MSUL7
 inHaZuLNIduVW3wD7C3PPdyelSXmTiZ9bJWNQjTYke+n7ckKOpR1mu4Osqrn+KqqbB
 XH8tlIYR15ZYvydUbCQg0UWsZjHrGqMpsv6sJIspwAiu//90vOJoQ8OjZcWCzvH/Bf
 hahenSqrl/fSg==
Message-ID: <f58a0545f4ace43df098d6a08820f658.mripard@kernel.org>
Date: Sun, 18 Jun 2023 14:38:09 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 3/6] drm/panel: sitronix-st7789v: Use 9 bits per spi
 word by default
In-Reply-To: <20230616163255.2804163-4-miquel.raynal@bootlin.com>
References: <20230616163255.2804163-4-miquel.raynal@bootlin.com>
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

On Fri, 16 Jun 2023 18:32:52 +0200, Miquel Raynal wrote:
> The Sitronix controller expects 9-bit words, provide this as default at
> probe time rather than specifying this in each and every access.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

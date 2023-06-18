Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41487346A9
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 16:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40A110E0AC;
	Sun, 18 Jun 2023 14:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EA510E0AC
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 14:40:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B093D60B9D;
 Sun, 18 Jun 2023 14:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA7EC433C0;
 Sun, 18 Jun 2023 14:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687099235;
 bh=Ujtpsjovx5hy0qxvCDoEJZ+gcP2oHPhauWUKKZTft7Y=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=kBN7tLLb/4sZ4s7RPl5Or76aHeEDG5e3QovBDT4VwM+SZ4O0OZ9eV/SuwIop+GO1d
 gyi8TVuK0nTrG+DElmfS0D3yamiUFyp2ZwncpDDjVF4lp+/Pjd/xOrO2iP4Dy5otnh
 aPBcpB6rWWvJRerBeJp8yE+VA9xF4QWSlRIOsFnVJshvQGPkF37fzCU1WLKMU22V1H
 1gSifACmie7kobSariNKWqbquJ/WYcMDbSqetz4+/l55iDY+4Nq9LjHxumSViGsAyb
 ekikuav7n6Syul1DdWKkKSw8JoSBtOraMhczoMQ8JZk4CnNVxj0lf0nqkizxRotHAB
 9sbWbNHopURRQ==
Message-ID: <40fc54d65894036d182d15256ed2bf1c.mripard@kernel.org>
Date: Sun, 18 Jun 2023 14:40:32 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 5/6] drm/panel: sitronix-st7789v: Add EDT ET028013DMA
 panel support
In-Reply-To: <20230616163255.2804163-6-miquel.raynal@bootlin.com>
References: <20230616163255.2804163-6-miquel.raynal@bootlin.com>
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

On Fri, 16 Jun 2023 18:32:54 +0200, Miquel Raynal wrote:
> This panel from Emerging Display Technologies Corporation features an
> ST7789V2 LCD controller panel inside which is almost identical to what
> the Sitronix panel driver supports.
> 
> In practice, the module physical size is specific, and experiments show
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

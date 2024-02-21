Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B75E85E304
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 17:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7583910E81F;
	Wed, 21 Feb 2024 16:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IxmFuhRq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A15210E81F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:25:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7E606CE1DA7;
 Wed, 21 Feb 2024 16:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F769C433F1;
 Wed, 21 Feb 2024 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708532731;
 bh=zKxSt+OXfwNTtuenGgaTIdVfwrd2JY+VgzTzGWangZk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IxmFuhRqxNL2ajOG7BTFQgXIr/Obmiky5ITDKSR53CmHtAMX7YRDnlRxUOGzHeEkc
 XUfH3axovly1udZsLDO0Zx5HA4imniiikfhi7MXSuLpQqPKs0AjejZZaV2Y6H9JESj
 i9cGKVh3aDb4AgSYP8wpcFA4WeTi7HOwKDRsXqPFPn+qRY6QSoMUJsCAyP1pNgE7yS
 Lfj5AkZQuehIo5Rq5aSkrtWW2FdILxSBjbzauPTZrCQi8EoytztWyAyaPMeTfnfjw0
 pR0/UhRwiHoTjDh+XGCdDKbGnTANHZMFMZLeEWa6gGJah/Ix++wjvlQ/flZEYIzNnT
 qCGXBzYnSjKlg==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>
In-Reply-To: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v15 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit support
Message-Id: <170853268755.761834.4644414762765104456.b4-ty@kernel.org>
Date: Wed, 21 Feb 2024 17:24:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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

On Tue, 28 Nov 2023 10:51:24 +0000, Biju Das wrote:
> This path series aims to add support for RZ/G2L DU DRM driver.
> 
> RZ/G2L LCD controller composed of Frame compression Processor(FCPVD), Video
> signal processor (VSPD) and Display unit(DU). The output of LCDC is
> connected to Display parallel interface and MIPI link video interface.
> 
> The output from DSI is connected to ADV7535.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime


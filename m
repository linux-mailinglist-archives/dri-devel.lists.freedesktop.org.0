Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E500B210368
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 07:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077936E3B0;
	Wed,  1 Jul 2020 05:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67DA6E3B0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 05:47:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E717556;
 Wed,  1 Jul 2020 07:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593582425;
 bh=lLlE6wlCwDL/Ydht7HG8e8nS46G/QNmTOhwlH57lMes=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fwX2dXPjZehLGVDk564rmOrDNazijRXTkRA9uDV9TrKDR/87xOhV3ueNRjXkJtmnF
 e6ZZTuA86+Tsy2d2RPeLoMvNPm4/DpEjNRJwQfEuwI/zMYvFJZRi/cXXMeGDch2Ej8
 Vs4biJJkxivMOp/nM2tVUr1wK8oiE7VvtJ8K6O8s=
Date: Wed, 1 Jul 2020 08:47:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 0/7] drm_connector: drop legacy drm_bus_flags
Message-ID: <20200701054701.GB5963@pendragon.ideasonboard.com>
References: <20200630180545.1132217-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630180545.1132217-1-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patches.

On Tue, Jun 30, 2020 at 08:05:38PM +0200, Sam Ravnborg wrote:
> Drop all uses of legacy drm_bus_flags, and then drop the flags.
> Follow-up with a patch to inline the documentation of the flags.
> 
> The conversion was triggered by Laurent's clean-up of
> the bus_flags use in panel-simple.
> https://lore.kernel.org/dri-devel/20200630135802.GA581802@ravnborg.org/T/#t
> 
> Build tested only.
> Patches on top of latest drm-misc-next.

For the whole series,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> (Procrastination, was supposed to review patches, not producing them).
> 
> Sam Ravnborg (7):
>       drm/tidss: drop use of legacy drm_bus_flags
>       drm/ingenic-drm: drop use of legacy drm_bus_flags
>       drm/panel: raydium-rm67191: drop use of legacy drm_bus_flags
>       drm/panel: novatek-nt39016: drop use of legacy drm_bus_flags
>       drm/panel: panel-simple: drop use of legacy drm_bus_flags
>       drm/drm_connector: drop legacy drm_bus_flags values
>       drm/drm_connector: use inline comments for drm_bus_flags
> 
>  drivers/gpu/drm/ingenic/ingenic-drm.c         |   2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt39016.c |   2 +-
>  drivers/gpu/drm/panel/panel-raydium-rm67191.c |   2 +-
>  drivers/gpu/drm/panel/panel-simple.c          |  28 +++---
>  drivers/gpu/drm/tidss/tidss_dispc.c           |   4 +-
>  include/drm/drm_connector.h                   | 124 ++++++++++++++++++--------
>  6 files changed, 104 insertions(+), 58 deletions(-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

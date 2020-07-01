Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7525B210862
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 11:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2236E03B;
	Wed,  1 Jul 2020 09:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03CF6E03B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 09:40:15 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id AFFD580518;
 Wed,  1 Jul 2020 11:40:12 +0200 (CEST)
Date: Wed, 1 Jul 2020 11:40:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 0/7] drm_connector: drop legacy drm_bus_flags
Message-ID: <20200701094011.GA643704@ravnborg.org>
References: <20200630180545.1132217-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630180545.1132217-1-sam@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
 a=Cqj85iZdNWrysRqvn0oA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
> 
> 	Sam
> 
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

With the quick feedback from Jyri ack and Laurent I have applied this set to
drm-misc-next.

	Sam

> 
>  drivers/gpu/drm/ingenic/ingenic-drm.c         |   2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt39016.c |   2 +-
>  drivers/gpu/drm/panel/panel-raydium-rm67191.c |   2 +-
>  drivers/gpu/drm/panel/panel-simple.c          |  28 +++---
>  drivers/gpu/drm/tidss/tidss_dispc.c           |   4 +-
>  include/drm/drm_connector.h                   | 124 ++++++++++++++++++--------
>  6 files changed, 104 insertions(+), 58 deletions(-)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
